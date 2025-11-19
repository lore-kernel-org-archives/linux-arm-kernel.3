Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF36CF34AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+40zY0SZ/L+wRNX8sobXlUqFrzMunArQIRxjLDVpUKk=; b=CkgvLhq/Fh3o6xm5tDZQ3o5CDj
	XM+lekXrdBKCWK+zqeUrDuwnmqC1OQ+HZ3nTeken6pUxpR+EDo8Ps6SVfHJICaXVE/djPwygHSonr
	vg7/7bq0+OIMHtaLriHi/FcosQMR3Ey7eTeXSMEUIGY4jLjIhKqOR5L88tisJfBiQRCFLaW+vev6a
	9e4bMEr8FKkQI3D93M4isTM9jVheAOYk+qoixluc/CMqw5WrrojFq2ptA62fb/JARcxZH+hzr1Eu9
	LUqMnvYbju7kKRzgC0Dk1GmtQPDznKwuO9/MsMyGa1YMi8F23Mt2Sv013H1kzKcqyUIj++FWL4CqJ
	zPAMx1lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjJl-00000003OJL-28oQ;
	Wed, 19 Nov 2025 14:37:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjJj-00000003OIu-1HJ2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:37:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A0BEFEC;
	Wed, 19 Nov 2025 06:37:46 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0A403F740;
	Wed, 19 Nov 2025 06:37:53 -0800 (PST)
Date: Wed, 19 Nov 2025 14:37:51 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Mike Leach <mike.leach@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 08/13] coresight: Interpret perf config with
 ATTR_CFG_GET_FLD()
Message-ID: <20251119143751.GD8204@e132581.arm.com>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
 <20251118-james-cs-syncfreq-v5-8-82efd7b1a751@linaro.org>
 <CAJ9a7VgQH4yc8490CQSv1S6k+=Uc6dEjyEpgRp1EwUQdwdxOHQ@mail.gmail.com>
 <416cf32d-d647-46dd-bcef-acc019490561@linaro.org>
 <CAJ9a7Vg9HsMsTP-zroTgaaKWTPkSXE1u5WMORuqMLKSDDz2HSw@mail.gmail.com>
 <43a60afe-5170-4801-ae70-9243cf7b45b8@linaro.org>
 <20251119123647.GC8204@e132581.arm.com>
 <a199db90-a344-40e0-8628-b4c3b56fc92c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a199db90-a344-40e0-8628-b4c3b56fc92c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_063755_388988_7CCE616F 
X-CRM114-Status: GOOD (  12.99  )
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

On Wed, Nov 19, 2025 at 01:55:15PM +0000, James Clark wrote:

[...]

> >    static ssize_t format_attr_contextid_show(struct device *dev,
> >                                              struct device_attribute *attr,
> >                                              char *page)
> >    {
> >    #if IS_ENABLED(CONFIG_ARM64)
> >         if (is_kernel_in_hyp_mode())
> >                 return contextid2_show(dev, attr, page);
> >    #endif
> > 
> >         return contextid1_show(dev, attr, page);
> 
> Not having an #else implies that the contextid1_show() part is valid when
> !CONFIG_ARM64, but that isn't right. That's why I had the WARN_ON because
> it's dead code.

Based on ETMv3/v4 spec, would contextid1 always be valid ?  (Though we do
not support context ID for ETMv3 yet).

> Personally I would drop the is_visible(). It makes sense for dynamically
> hidden things, but these are all compile time. IMO it's cleaner to just not
> include them to begin with, rather than include and then hide them. Then the
> extra condition in format_attr_contextid_show() isn't needed because the
> function doesn't exist:

This is fine for me, though in general I think the dynamic approach is
readable and extendable than the compile-time approach.

Thanks,
Leo

