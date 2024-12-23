Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4486BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 09:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0F7zyJB4b8yItQzSUAX65nMyecwbU22+Duo3nFLB4Y=; b=0GnGqGuFxmFgfHcVIdzZ6QMmxU
	pojLBfj/6jmvTafCA0FrGoDw4scQ1I7Zy698gJLkn2nx6KTVCCn1sf9fNQbfZSSz8NDTCHKNeVuYg
	NLJNzmwUpCgE1pyV1xzv5yPVrmCFwir3jR45SNzfqqX6ISckUjwi35SlbEghgEdnQeS8mr8na2tH4
	MOilXXg5LVdyZbDpOoiIrLb912RrsJSK6yBgEUPCZRMkoawsqPy/PHH799ZGaX3DhD6Qc8kR1Nr4i
	7+iesMMufTQcQiu8rmdDXAxuQHPOURSKKcMQqXXtLsvZrIGvO0t9h2zUb8qX9rTr6tFoFDh5HpF4A
	r9XVPMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeow-00000009f3X-1P3Y;
	Mon, 23 Dec 2024 09:33:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPenj-00000009enb-1P6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 09:32:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E1D3152B;
	Mon, 23 Dec 2024 01:33:00 -0800 (PST)
Received: from [10.57.73.219] (unknown [10.57.73.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 692B23F58B;
	Mon, 23 Dec 2024 01:32:30 -0800 (PST)
Message-ID: <ea47035e-c834-4028-b98f-8b88caff929b@arm.com>
Date: Mon, 23 Dec 2024 09:32:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
To: Jeremy Linton <jeremy.linton@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: suzuki.poulose@arm.com, gshan@redhat.com, sami.mujawar@arm.com,
 itaru.kitayama@linux.dev, catalin.marinas@arm.com, will@kernel.org,
 linux-kernel@vger.kernel.org
References: <20241220181236.172060-1-jeremy.linton@arm.com>
 <20241220181236.172060-2-jeremy.linton@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20241220181236.172060-2-jeremy.linton@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_013235_472700_06DF126B 
X-CRM114-Status: GOOD (  20.48  )
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

On 20/12/2024 18:12, Jeremy Linton wrote:
> The TSM module provides guest identification and attestation when a
> guest runs in CCA realm mode. By creating a dummy platform device,
> let's ensure the module is automatically loaded. The udev daemon loads
> the TSM module after it receives a device addition event. Once that
> happens, it can be used earlier in the boot process to decrypt the
> rootfs.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>

LGTM

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,
Steve

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
> index 3031f25c32ef..ce4778141ec7 100644
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
> +static int __init arm64_create_dummy_rsi_dev(void)
> +{
> +	if (is_realm_world() &&
> +	    platform_device_register(&rsi_dev))
> +		pr_err("failed to register rsi platform device\n");
> +	return 0;
> +}
> +
> +arch_initcall(arm64_create_dummy_rsi_dev)
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


