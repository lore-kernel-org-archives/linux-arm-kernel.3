Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4316DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U947lzaeVJiq3lYXWYRtE0CvDKaCs4v3vcxW0WdybGA=; b=kzguPoWqVNdIzs51R9Uk9XAiu1
	xg8/6aSHbYr+fFv4eJ7Biz3ybgkSoiL3Y9Bw1UVv4CDyO6PO7tsqjj7luP7WqSBgrhGeso0J9ZqVC
	kWKRb+26GfoKpgoXC+Z/Ag8AG0tUpRMrwWs/U/7Wcy0RB37OZdHp12WI6xtJlQ7mhl/IOHEXyxqS8
	eps0DKaIOjiMPKpLMjDuYl6qdqaWoWhtKEsFZsS+JW1lrrrqoj7XtHc/R4h+uElW88nabhZ7cuqgX
	xm21zAoGjvaXBg/Kr52cni661w9fz7tqz6gFFI1jtsEOXphXhsImH/Uy2dpC3T7lnrZvzn58Zr/WJ
	r96Wrs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOiO9-000000053gg-2LYP;
	Mon, 09 Jun 2025 19:42:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOg4i-00000004mF8-2sOC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 17:14:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A5D4150C;
	Mon,  9 Jun 2025 10:13:59 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3C4C3F66E;
	Mon,  9 Jun 2025 10:14:17 -0700 (PDT)
Date: Mon, 9 Jun 2025 18:14:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/9] coresight: Avoid enable programming clock
 duplicately
Message-ID: <20250609171413.GO8020@e132581.arm.com>
References: <20250609-arm_cs_fix_clock_v3_public-v3-0-423b3f1f241d@arm.com>
 <20250609-arm_cs_fix_clock_v3_public-v3-6-423b3f1f241d@arm.com>
 <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b30fc361-a04f-4a48-b8e2-f7c2da213e6c@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_101420_764880_7AE1145E 
X-CRM114-Status: GOOD (  13.63  )
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

On Mon, Jun 09, 2025 at 05:58:34PM +0100, Suzuki Kuruppassery Poulose wrote:

[...]

> >   static inline struct clk *coresight_get_enable_apb_pclk(struct device *dev)
> >   {
> > -	struct clk *pclk;
> > +	struct clk *pclk = NULL;
> > -	pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > -	if (IS_ERR(pclk))
> > -		pclk = devm_clk_get_enabled(dev, "apb");
> > +	if (!dev_is_amba(dev)) {
> > +		pclk = devm_clk_get_enabled(dev, "apb_pclk");
> > +		if (IS_ERR(pclk))
> > +			pclk = devm_clk_get_enabled(dev, "apb");
> 
> AMBA driver doesn't handle "apb" clock ? So we may need to retain that here
> ?

Here checks the condition "if (!dev_is_amba(dev))", it means the device
is not an AMBA device (e.g., a platform device), the APB clock is
enabled at here.

Otherwise, for a AMBA device, the AMBA bus layer will help to enable
APB clock.

> Otherwise looks good to me.
> 
> Suzuki
> > +	}
> >   	return pclk;
> >   }
> > 
> 

