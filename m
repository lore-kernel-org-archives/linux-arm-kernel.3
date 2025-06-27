Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7E5C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 14:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYxxHBLRJphR0Jwk7kxo1y2fXjD2tTPY+i6rolzDPNo=; b=U14C0WEU7Daz2/DT4WZ17BM7rY
	iou8qSVWwvdN7sxKDrqL/OqKSpO2fKA9In9gQFlCp/qQPb4RcFxDFwXJEsZPC4bkqxjHXTt11NwIW
	GL6hvV9ewNCihwP7o9KGhEmM4/k3UGvLvm+IzCET0n/VlsF9/Bzgf1FDxwYMbEWTVDlc0OW1kS+oj
	hzU9EFZBScSNXQ5/DHaCC8FMlkwi5yz45VM1tD4eKYl2vt95NQXx83+NP0+yzB4jCDzvIeV+Xlzna
	W+uLk2M6jBClSNww/0jJKRjDROm4EpGBTT2MgDAiBqvx0C7RGSpb4vDUWXft1F3NC5VEQ4RzOL3ut
	pi2vwfUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAN7-0000000ExKq-3kcG;
	Fri, 27 Jun 2025 14:48:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9cF-0000000EqVL-3c8D
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 13:59:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDE501A00;
	Fri, 27 Jun 2025 06:59:25 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C23E73F58B;
	Fri, 27 Jun 2025 06:59:42 -0700 (PDT)
Date: Fri, 27 Jun 2025 14:59:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/10] coresight: tmc: Support atclk
Message-ID: <20250627135940.GR794930@e132581.arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-1-0ce0009c38f8@arm.com>
 <aF6cVFA7NpN2S273@e129823.arm.com>
 <aF6hX511YW3540Jx@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF6hX511YW3540Jx@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_065943_935773_016645DF 
X-CRM114-Status: GOOD (  16.08  )
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

Hi Levi,

On Fri, Jun 27, 2025 at 02:49:19PM +0100, Yeoreum Yun wrote:
> >
> > > @@ -789,6 +789,10 @@ static int __tmc_probe(struct device *dev, struct resource *res)
> > >  	struct coresight_desc desc = { 0 };
> > >  	struct coresight_dev_list *dev_list = NULL;
> > >
> > > +	drvdata->atclk = devm_clk_get_optional_enabled(dev, "atclk");
> > > +	if (IS_ERR(drvdata->atclk))
> > > +		return PTR_ERR(drvdata->atclk);
> > > +
> > >  	ret = -ENOMEM;
> > >
> >
> > Just another quetion.
> >
> > If this function is called from tmc_platform_probe() and failed,
> > should it call the clk_put() for drvdata->pclk when it failed?
> 
> Sorry, I missed the Patch #7.

No worries.

devm_clk_release() is a registered callback used by the device model
layer to release resources. The clock will be released in the flow:

  devm_clk_release()
    `> clk_put()
         `> free_clk()

Thanks,
Leo

