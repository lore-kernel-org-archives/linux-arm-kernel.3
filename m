Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C362C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xRuvQSY6HX3C5gi2c1bAyEU9B1iHgkzJbSQNZRoicg=; b=IyRYFJYV9gfXTcGpwbt4om8QWv
	OnGo8N4RL53DisYi80fIQ9a38tIRtiRxgW4ULAw+tco9+m9mNdF19fbsBlV0JCC42j+Z92tjc/9P7
	QoCzzilJLunP2oUsCz+FZe9rNzjStwwxpa2HJCktUEFdb7K5ZO24xgOPq2LDXFY2u+OJ2TK4xANKV
	SD8F40bpYb9O0n8f9PrIB70vrIfsPgrVux2GuApgziTkEOwSCV3a122ouxO3P3DOEPGuoaIvPb8PN
	ZDmPNJ4Rgc0LWuMNSoRusWCu7b++XGPQibaA8IrqRiQTVbWQQrrd+O/RzOY3D8sHbxW+9JgakmyTA
	+STlDlmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWmF-00000004hWg-0xen;
	Wed, 23 Jul 2025 10:32:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWdj-00000004frQ-0b4Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 10:24:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE35A22C7;
	Wed, 23 Jul 2025 03:23:51 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DAFB3F5A1;
	Wed, 23 Jul 2025 03:23:57 -0700 (PDT)
Date: Wed, 23 Jul 2025 11:23:55 +0100
From: Leo Yan <leo.yan@arm.com>
To: hejunhao <hejunhao3@huawei.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/10] coresight: Appropriately disable programming
 clocks
Message-ID: <20250723102355.GJ3137075@e132581.arm.com>
References: <20250627-arm_cs_fix_clock_v4-v4-0-0ce0009c38f8@arm.com>
 <20250627-arm_cs_fix_clock_v4-v4-4-0ce0009c38f8@arm.com>
 <daece566-2cca-71dd-d21a-80dadad2c71b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daece566-2cca-71dd-d21a-80dadad2c71b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_032359_224255_0D3290EF 
X-CRM114-Status: GOOD (  21.27  )
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

Hi,

On Mon, Jul 21, 2025 at 10:08:27PM +0800, hejunhao wrote:
> On 2025/6/27 19:51, Leo Yan wrote:
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index 4ac65c68bbf44b98db22c3dad2d83a224ce5278e..dd2b4cc7a2b70cf060a3207548fe80e3824c489f 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -480,26 +480,16 @@ static inline bool is_coresight_device(void __iomem *base)
> >    * Returns:
> >    *
> >    * clk   - Clock is found and enabled
> > - * NULL  - clock is not found
> >    * ERROR - Clock is found but failed to enable
> >    */
> >   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> >   {
> >   	struct clk *pclk;
> > -	int ret;
> > -	pclk = clk_get(dev, "apb_pclk");
> > -	if (IS_ERR(pclk)) {
> > -		pclk = clk_get(dev, "apb");
> > -		if (IS_ERR(pclk))
> > -			return NULL;
> Hi,
> 
> Here, the function returns NULL, but the caller uses IS_ERR() to check the
> function return value.
> Yes, this patch has already been fixed this, and should we split this fix
> into a separate patch?

I am not sure if I understand this question correctly.

Are you suggesting that we should use IS_ERR_OR_NULL() instead of
IS_ERR() to check the returned clock pointer?

If so, the answer is that we should not change it. As Suzuki mentioned,
we need to tolerate the absence of pclk in the ACPI case. So keep using
IS_ERR() is the right thing to do.

Thanks,
Leo

