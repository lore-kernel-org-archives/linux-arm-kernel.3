Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CF3E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 05:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTIMMaEabz2yNJ3BCGYu9dfy9Hdli7Hl5ja+ottT06c=; b=N+tO1tk3Zo1hLg18cnEi3vdM3v
	hjnrjMr1Pcr6hv1qfG+IReezRAS0kbhHY9ggLrNyLyV0B1osI4sRWbeaKrOIqKDOYseuZa2aBCjgZ
	9N+uLxyRXgCsK3DkayVlwNrzb4DmzbeS65zR6YjktK5+ETvUGUHNl0d6nwyvKQ4+zvVyc0f5kTEdp
	fSGV+HRsT4rv+S1HyFW2u4ZGhvvJmJsb7q9XHqxMuLaNEVo0aJp61nCB9BBkmJY/zfoly7T8GARV/
	an8CMboG6nx+wnHVezBpoTUZn8n4AOLCQnxxaNf+XGUiccBvJKdSIkZYQG/6bzEtwEhsG6K8o6Kin
	YFyxrHlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK9Vj-00000004qsQ-1NEu;
	Sun, 08 Dec 2024 05:07:15 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK9Uh-00000004qo6-0543
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Dec 2024 05:06:12 +0000
Date: Sun, 8 Dec 2024 13:38:39 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733634360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fTIMMaEabz2yNJ3BCGYu9dfy9Hdli7Hl5ja+ottT06c=;
	b=LadHdV6vwdbKRm7jeZ25s+fet1g1lR3mVmf2wE7L2H24h9YExw+OipKvMaZznsnoHt+iyS
	sCqZ1kUDRr5hill6xow9tLd9LHnKkx5oPFjFdORxaE5tlsKr67GJIDhvm/JzBoy8Ll8F04
	amkEA8ILyrepc15Wxs9ydplSmBDrLks=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Itaru Kitayama <itaru.kitayama@linux.dev>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com,
	gshan@redhat.com, steven.price@arm.com, sami.mujawar@arm.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
Message-ID: <Z1Uiz7Hn2XisyP-N@vm3>
References: <20241207012128.247522-1-jeremy.linton@arm.com>
 <20241207012128.247522-2-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207012128.247522-2-jeremy.linton@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_210611_546787_D5DC86D0 
X-CRM114-Status: GOOD (  23.05  )
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

Hi Jeremy,

On Fri, Dec 06, 2024 at 07:21:28PM -0600, Jeremy Linton wrote:
> The TSM module provides guest identification and attestation when a
> guest runs in CCA mode. By creating a dummy platform device, let's

Perhaps could you spell out like; a guest runs in the Realm state?

Thanks,
Itaru.
 
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
> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> index 488153879ec9..87f162736b2e 100644
> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> @@ -6,6 +6,7 @@
>  #include <linux/arm-smccc.h>
>  #include <linux/cc_platform.h>
>  #include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/smp.h>
>  #include <linux/tsm.h>
> @@ -219,6 +220,13 @@ static void __exit arm_cca_guest_exit(void)
>  }
>  module_exit(arm_cca_guest_exit);
>  
> +/* modalias, so userspace can autoload this module when RSI is available */
> +static const struct platform_device_id arm_cca_match[] __maybe_unused = {
> +	{ RSI_PDEV_NAME, 0},
> +	{ }
> +};
> +
> +MODULE_DEVICE_TABLE(platform, arm_cca_match);
>  MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
>  MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
>  MODULE_LICENSE("GPL");
> -- 
> 2.46.0
> 

