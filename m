Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA5DC54756
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ve9YIw1v1Ee9SUsXpKp+9FO4IMdcP7jc/KH7fOZOIQo=; b=z162P3nGh1ODfXgNFT9X0Jnksm
	0Nf+KpnehzUXCb8ayH0BBSOxgQ/wIdmpbYBeO3qo24LYvRyWn53YNeP0iK1WjPeDWd1fjXWWHCYXf
	eJHoPrdMxdsjhkr4hxj2EN0X5Iz4GMgCeKnPwL7fEBbWK+HHfaDaEdUHhswkVICWx5EomCHhf7hm9
	ZbjwO0DZYwhO7P4cu8Y56FGYcDjeeF7VBrhM0hRxDv2rDw+Guxan4034fd0icVm6E3o6Qt2bfvIWm
	Q+xjG364bNcXMkZvBiZ6nU8dQEfWSkZGhZkkykBqs3qExuFYZra5j5PHoOKCsqSs3pBpzs6/1xwY2
	Z3SFiIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH41z-00000009vSE-1JvW;
	Mon, 19 May 2025 17:12:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3Bj-00000009mBS-219W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:18:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE0231655;
	Mon, 19 May 2025 09:17:49 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7190D3F5A1;
	Mon, 19 May 2025 09:18:02 -0700 (PDT)
Date: Mon, 19 May 2025 17:17:58 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	Tamas Zsoldos <tamas.zsoldos@arm.com>
Subject: Re: [PATCH] coresight: etm4x: Fix timestamp bit field handling
Message-ID: <20250519161758.GK412060@e132581.arm.com>
References: <20250519135027.2204747-1-leo.yan@arm.com>
 <a6e1be6a-0684-4cef-9052-ff19fcff8a56@linaro.org>
 <aad1bf55-2952-4985-9dd1-5e1a0fce9824@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aad1bf55-2952-4985-9dd1-5e1a0fce9824@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_091803_559292_EE6FFC98 
X-CRM114-Status: GOOD (  14.53  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, May 19, 2025 at 04:12:32PM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> > > --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> > > @@ -2315,23 +2315,10 @@ static ssize_t ts_source_show(struct device *dev,
> > >       int val;
> > >       struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> > > -    if (!drvdata->trfcr) {
> > > +    val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);
> > > +    if (!val)
> 
> I think this might be problematic. TS==0 is a reserved value for
> software, and doesn't imply a TS is not in effect.

Good point.

> Thus I think we should retain the older check as before to ensure
> TRFCR is effective.

If we intend to return TS values directly (include '0' case), then it
makes sense to make change like:

    if (!drvdata->trfcr)
        val = -1;
    else
        val = FIELD_GET(TRFCR_EL1_TS_MASK, drvdata->trfcr);

    return sysfs_emit(buf, "%d\n", val);

I checked again in Linux perf tool, it would be fine if we return 0 for
TS==0 case, as the perf tool now only use virtual time counter (see
cs_etm__has_virtual_ts()).

@James, could you confirm if this fine?

Thanks,
Leo

