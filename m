Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64383CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 19:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nETMo+04waFS4tfkt/oU/2PbphAdE89qyUaowMAocVw=; b=aAOcGl/Yhhy3VGgTJ6+GWE3gT0
	iKW+O4Hqu0Lja8JffwZg6AygbxE2q055fK2seM4DYfKDJy1dCdrTItBqEVgI0WdGTCMiC5TbP/QVq
	O1UywADPQyLrzePXK9AUoymPQEZlwYZTlJpE2fjND7ijcKPlP5SoMv+5dq1knQUwwpFYJZn5cMXGl
	ZBYq0pT0mtRWZJaaiGzKHNoXyG3ClEKFXr3sXAyJHubHEvDyE+YotIXZp1zgt/TsEDJgVWVWO1dhV
	B4oVB773ZIeV4fHtGeWJPKfFL1WbuEo+DxMqcKqlFCvlHcCNnYMw1RchBPUiZ1tY9XrClWY2rMFv/
	3KcctTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyy5L-0000000ENBX-0sM5;
	Wed, 17 Sep 2025 19:44:59 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyy5I-0000000ENAI-35k1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 19:44:57 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8117aef2476so20508385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 12:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758138295; x=1758743095; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nETMo+04waFS4tfkt/oU/2PbphAdE89qyUaowMAocVw=;
        b=PZXuFqS/dcopyhKz6I2UAgAxk7ysNKeAD5TyyrMj1mO1AIsoZ16OKiSqmpB9VMvYM1
         PcemwDaqxbm5WpYjsmnu0qHuxpqZiaK3Nh9HAtyDY9YIeQYzse0Jjki3d6gU41fxi6cj
         GQIAoC4nzuuLOSmo/d2Uxickh/TYAdWSNtOH5ZuzoCjWwRHACbGaCkavVgZZEEhWuJJ9
         KdaXUZrgVggeD77waGPEGW+j/ITjwUbdozlVRw3L6IQcV3AXZJbKFBFv1UJZ+hjjFKzK
         YLuW2wJnaqoSwfR3Y0uLMqLyrOSkC295BrvPF19q1X7O81EgqMTA+j09qt+hYgzA335/
         Q+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758138295; x=1758743095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nETMo+04waFS4tfkt/oU/2PbphAdE89qyUaowMAocVw=;
        b=lGQaYhEC7n43exrKMxCrcwgLQ2pOIbggIpnAR9Yyr0S0hHdMDT1LOhWrhZ+yKSNwD9
         NYWHclKL+9rRBQ/Y1+4VSpok/SdlFACbeqbaVvvM5gskE3xBnjmTlCbIRKhUsbZ2cAQw
         1y1fqaUhnfocKmR/vLZ+Bfh9NSBHKxr3ijP40CDl5TDGrrisbUmzU2roXPjIwdSbdz1p
         foytrrYYTfGVMJfHuXB9B/xeJBhWrL5BTgPNb7Fw9pBtrqsCF7aF7OfGktEQvPN6i46e
         4mg2OhmvfA18CDnDtEPPZnQdP0A4fBgwOeRtnmZ3UyG6nfv/KyO6yV/W3iR6a1UAfilQ
         k9+w==
X-Forwarded-Encrypted: i=1; AJvYcCXVvr55B1E36R4wBqwFL41Z3HgHODH/e8WD86NCkRa9nY0R12iZtMHvA9wdvJWEoSoPFDscnS1b/IpHycBkRzbS@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/wwg35uyL1t/Gn4byS9AhIqfYub2K6YZceMbPm6qKg522TSCc
	khsIpjXHdmXi7N7hgEVnkcnNyJBSo1G1UmfzfAlURni+QZF/U1D/r8+f83lYLm44oS/FpmtpqjY
	of7oO
X-Gm-Gg: ASbGncvuApjT+EYR67fuRncWMsIeR99Lm4IaAkmOfKxNvkWNvSC7w1XorWQBMYCrfzJ
	aK3E4ye9mKkF+9RtOog48TwHxNsOXSkFPV89qMJa2e04yV2zswrrg3lwZ2p0emi7PkxfGsQWRs0
	Q+xuF36W89GgbTwEelE02b497e8Vi4lHpDAkNg9M0Cb/U6iNGme7EUmnjW62yZq5SJvKMU+gcRp
	qTE08BGY1DRjGQoFF599IN/woyG7M/sUSCeDthRC2ntvKBIWLFPi0r/MLg0FNido1pDTOfzUZSv
	fjWogNpt3Z/7jU4W4ydjMT6CcBODCbq5Sq/RN6hOcjty94Nhz/72e9fJyV0c9Mn70Jza3dltlTY
	5cLaaIeqSwJFbiyXf+08g2HMLNrvxbk62ynFjD/05mjrIYh9j86HyLUlfuZHqITtGIwTTjCfcxY
	kMObc=
X-Google-Smtp-Source: AGHT+IFWc58Oz1xzWWA03oRckYRJXsuyaaVLiWkScgdlR7Du/xYkSuwaIG4g5CNkm13Bqx94hJ05Vw==
X-Received: by 2002:a05:620a:28d6:b0:811:3f8a:24a6 with SMTP id af79cd13be357-83111e2b756mr414673885a.53.1758138295331;
        Wed, 17 Sep 2025 12:44:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-83631a7fc2fsm32683485a.54.2025.09.17.12.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 12:44:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyy5G-00000008nBQ-1aLu;
	Wed, 17 Sep 2025 16:44:54 -0300
Date: Wed, 17 Sep 2025 16:44:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v2 3/3] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <20250917194454.GM1326709@ziepe.ca>
References: <20250917191143.3847487-1-smostafa@google.com>
 <20250917191143.3847487-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917191143.3847487-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_124456_788866_E282FB7B 
X-CRM114-Status: GOOD (  17.36  )
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

On Wed, Sep 17, 2025 at 07:11:40PM +0000, Mostafa Saleh wrote:
> Integrate the selftests as part of kunit, this makes the test
> available through debugfs.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/Kconfig                    |  2 +-
>  drivers/iommu/io-pgtable-arm-selftests.c | 93 +++++++++++++-----------
>  2 files changed, 51 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 553522ef3ca9..f7e6d1db6ce6 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -42,7 +42,7 @@ config IOMMU_IO_PGTABLE_LPAE
>  
>  config IOMMU_IO_PGTABLE_LPAE_SELFTEST

This should probably be renamed to xxx_KUNIT_TEST

>  	tristate "LPAE selftests"
> -	depends on IOMMU_IO_PGTABLE_LPAE
> +	depends on IOMMU_IO_PGTABLE_LPAE && KUNIT

I wonder if it should be:

  	select IOMMU_IO_PGTABLE_LPAE
  	depends on KUNIT
        default KUNIT_ALL_TESTS

?

At least the default should be there

>  	help
>  	  Enable self-tests for LPAE page table allocator. This performs
>  	  a series of page-table consistency checks during boot.

"kunit tests" here as well

> -subsys_initcall(arm_lpae_do_selftests);

Oh so it does drop the initcall, the coverletter is a bit confusing then.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

