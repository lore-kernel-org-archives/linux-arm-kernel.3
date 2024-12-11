Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D789E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCb5dB9nLbwKSRYivA6WFY06vS0OrqZOGay4lpKE3uk=; b=tW7mnCt7wFmn5YKDfMJinSjAms
	1trtdCBqzeGDIEt8bEBkXFRy0h1u/LhFSCG/cciNUC1OSkp6PbkThlO0c+sR2eG1JNcU8TbzPFMCN
	DWFaZFr83w1rgSFWzoxp3pdlkF5pagtRiDT54+G+ZXbytN27YN5159nC8rXCw1WnzXJsNLQgditk+
	CKJG2p1H1msEm3Dy4a6Ap8Cxjo2xhyv+HjaghKV4JOAlDy4uD0qFzwIruojaBfdvAnavs5okAliRn
	MvB3eohgU0Tv2vJXgJeHNIt8pvyuuLsOCDcesvj2cL8bpJZ5yP43cvs7QLkVsKdO8wP5fXMyxld8d
	5CakHDZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUIt-0000000GBMV-0QFN;
	Wed, 11 Dec 2024 21:31:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUHp-0000000GBGV-1Xii
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 21:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2C021A41ADE;
	Wed, 11 Dec 2024 21:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908B7C4CED2;
	Wed, 11 Dec 2024 21:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733952624;
	bh=QN8NBE9T0l0nCy54fFLmu4grxTxcGTtywbY3oxKo6UE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PC8DBxKalTNKHRhRVXaSE/yFsEjc+YW4RbWfxHE0BR1b9eP3a2njMOJn5fYcbSCoe
	 ooW91OXTRT6KncknkwC6hoWj9dBA+sItCvq7jg7hNwWYoXald+Q+4pJ/yxiEsETqfn
	 uapoIAnfpIYPrOojg1dYGuGRYV4z7YCJW/gbAtP1I8MkYK+/Y1WnkZy+HKo5wajWdT
	 AaDJwo637rLffLECJHItB/Tr7TtXAYQLG7Cp7iuXgFoRjUAhEzUlsqiT/781+T6W8j
	 pl8xlTcd+RObcJK3UubhkyJJbyGe5cUDn163l8ri/uauY7aJ+2WqQYI7GQ5KTWSkRj
	 eCHBDqBQqULgg==
Date: Wed, 11 Dec 2024 21:30:19 +0000
From: Will Deacon <will@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com,
	gshan@redhat.com, steven.price@arm.com, sami.mujawar@arm.com,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
Message-ID: <20241211213018.GA17486@willie-the-truck>
References: <20241207012128.247522-1-jeremy.linton@arm.com>
 <20241207012128.247522-2-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207012128.247522-2-jeremy.linton@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_133025_478399_0AA673F5 
X-CRM114-Status: GOOD (  22.62  )
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

On Fri, Dec 06, 2024 at 07:21:28PM -0600, Jeremy Linton wrote:
> The TSM module provides guest identification and attestation when a
> guest runs in CCA mode. By creating a dummy platform device, let's
> ensure the module is automatically loaded. The udev daemon loads the
> TSM module after it receives a device addition event. Once that
> happens, it can be used earlier in the boot process to decrypt the
> rootfs.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> ---
>  arch/arm64/include/asm/rsi.h                    |  2 ++
>  arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
>  drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  8 ++++++++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
> index 188cbb9b23f5..b42aeac05340 100644
> --- a/arch/arm64/include/asm/rsi.h
> +++ b/arch/arm64/include/asm/rsi.h
> @@ -10,6 +10,8 @@
>  #include <linux/jump_label.h>
>  #include <asm/rsi_cmds.h>
>  
> +#define RSI_PDEV_NAME "arm-cca-dev"
> +
>  DECLARE_STATIC_KEY_FALSE(rsi_present);
>  
>  void __init arm64_rsi_init(void);
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index 3031f25c32ef..5434e5496ac2 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -8,6 +8,7 @@
>  #include <linux/psci.h>
>  #include <linux/swiotlb.h>
>  #include <linux/cc_platform.h>
> +#include <linux/platform_device.h>
>  
>  #include <asm/io.h>
>  #include <asm/mem_encrypt.h>
> @@ -140,3 +141,17 @@ void __init arm64_rsi_init(void)
>  	static_branch_enable(&rsi_present);
>  }
>  
> +static struct platform_device rsi_dev = {
> +	.name = RSI_PDEV_NAME,
> +	.id = PLATFORM_DEVID_NONE
> +};
> +
> +static int __init rsi_init(void)
> +{
> +	if (is_realm_world() &&
> +	    platform_device_register(&rsi_dev))
> +		pr_err("failed to register rsi platform device\n");
> +	return 0;
> +}
> +
> +arch_initcall(rsi_init)

This file already has an arm64_rsi_init()... Ideally, we'd hang this
off the end of that instead of the initcall but I suspect you're going
to tell me that platform_device_register() doesn't like being called
that early?

If so, perhaps arm64_create_dummy_rsi_dev() might be better?

Will

