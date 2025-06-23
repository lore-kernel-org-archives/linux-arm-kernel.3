Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA513C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 18:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ch0OEfG4XYiLtSRIq79iFEbrfniWSgbJVDidBfEEqNg=; b=WWwKxc8/BS1CrBN+kk0EB70ZA8
	dovkHrE125g46a7gF5BnuzXjOsvkIuxo3a44DGHDoimOapZnc5UWAttJlt5mMZnozuOBA7ZK5YsGc
	8SNHbvGfOnlQoucT0+18r52UYDT/lJHVEXx2jkaMQue/4d/gXjRYvrACwsCH3GcwQ/sHfxpIaqL/9
	LLdc+8ikPjxKBmt2hYdrVBeI3dXmkD7zxmlfpo80CoeA93ZgR2i7njQqf69EN8Wb9DuF3B0QmXBCo
	oZTzu7nksJYreeKUCev0ejphjEyH60RWy7mHIN2lK8S9R2D2wIeq+z5FqXBxo1lwDVyan0z13DFlm
	VHERrHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmF1-00000003kMH-1GvC;
	Mon, 23 Jun 2025 18:50:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTisd-00000003BaM-0Pfq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 15:14:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E9294A51E8F;
	Mon, 23 Jun 2025 15:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2742EC4CEEA;
	Mon, 23 Jun 2025 15:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750691681;
	bh=XSDrVBVnhyxYp1JMKvQx3EG0b0XeZk8MBikoZoNvSPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmCoXbQf/tjUIpINpxj6vwdUqDZybUpwjdWVlsS76SySfStDAGZ61o1ANRZoqQjPG
	 8PB+6z/OaL3uYgFT3hzwwpRGKnIvCLqf1FLbvHBugmzjEoSWyBnDNLNnVnK18oEqQo
	 NJPa/wbKeZsV6TTtEDYn2s+KrdSCTmNs6ejzDIQC/vtygeq6/S4gez8uy6/kyvlHLD
	 SGGhZr2G7/86WqxshFSb/HYHgENdhplZMRLtlRMIQDJfa5WqDGYugWqqCT0YdUJ2l4
	 ap8E3G7oamo2KDrBMaPSTGXdgJWyPgcjLr6F3YDdKQW8I82pgl//a8FozORPIpQJlA
	 rEGxf3sYaX2sA==
Date: Mon, 23 Jun 2025 17:14:35 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"will@kernel.org" <will@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 2/5] irqchip/gic-v5: Populate struct gic_kvm_info
Message-ID: <aFlvW2FNCyCi3h3Y@lpieralisi>
References: <20250620160741.3513940-1-sascha.bischoff@arm.com>
 <20250620160741.3513940-3-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620160741.3513940-3-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_081443_279236_C62F3A1B 
X-CRM114-Status: GOOD (  20.10  )
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

On Fri, Jun 20, 2025 at 04:07:51PM +0000, Sascha Bischoff wrote:
> Populate the gic_kvm_info struct based on support for
> FEAT_GCIE_LEGACY.  The struct is used by KVM to probe for a compatible
> GIC.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c          | 34 +++++++++++++++++++++++++++
>  include/linux/irqchip/arm-vgic-info.h |  4 ++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 28853d51a2ea..6aecd2343fee 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -13,6 +13,7 @@
>  
>  #include <linux/irqchip.h>
>  #include <linux/irqchip/arm-gic-v5.h>
> +#include <linux/irqchip/arm-vgic-info.h>
>  
>  #include <asm/cpufeature.h>
>  #include <asm/exception.h>
> @@ -1049,6 +1050,37 @@ static void gicv5_set_cpuif_idbits(void)
>  	}
>  }
>  
> +#ifdef CONFIG_KVM
> +static struct gic_kvm_info gic_v5_kvm_info __initdata;
> +
> +static bool gicv5_cpuif_has_gcie_legacy(void)

__init ?

> +{
> +	u64 idr0 = read_sysreg_s(SYS_ICC_IDR0_EL1);
> +
> +	return !!FIELD_GET(ICC_IDR0_EL1_GCIE_LEGACY, idr0);
> +}
> +
> +static void __init gic_of_setup_kvm_info(struct device_node *node)
> +{
> +	gic_v5_kvm_info.type = GIC_V5;
> +	gic_v5_kvm_info.has_gcie_v3_compat = gicv5_cpuif_has_gcie_legacy();
> +
> +	/* GIC Virtual CPU interface maintenance interrupt */
> +	gic_v5_kvm_info.no_maint_irq_mask = false;
> +	gic_v5_kvm_info.maint_irq = irq_of_parse_and_map(node, 0);
> +	if (!gic_v5_kvm_info.maint_irq) {
> +		pr_warn("cannot find GICv5 virtual CPU interface maintenance interrupt\n");
> +		return;
> +	}
> +
> +	vgic_set_kvm_info(&gic_v5_kvm_info);
> +}
> +#else
> +static void __init gic_of_setup_kvm_info(struct device_node *node)

static inline

Thanks,
Lorenzo

> +{
> +}
> +#endif // CONFIG_KVM
> +
>  static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
>  {
>  	int ret = gicv5_irs_of_probe(node);
> @@ -1081,6 +1113,8 @@ static int __init gicv5_of_init(struct device_node *node, struct device_node *pa
>  
>  	gicv5_irs_its_probe();
>  
> +	gic_of_setup_kvm_info(node);
> +
>  	return 0;
>  out_int:
>  	gicv5_cpu_disable_interrupts();
> diff --git a/include/linux/irqchip/arm-vgic-info.h b/include/linux/irqchip/arm-vgic-info.h
> index a75b2c7de69d..ca1713fac6e3 100644
> --- a/include/linux/irqchip/arm-vgic-info.h
> +++ b/include/linux/irqchip/arm-vgic-info.h
> @@ -15,6 +15,8 @@ enum gic_type {
>  	GIC_V2,
>  	/* Full GICv3, optionally with v2 compat */
>  	GIC_V3,
> +	/* Full GICv5, optionally with v3 compat */
> +	GIC_V5,
>  };
>  
>  struct gic_kvm_info {
> @@ -34,6 +36,8 @@ struct gic_kvm_info {
>  	bool		has_v4_1;
>  	/* Deactivation impared, subpar stuff */
>  	bool		no_hw_deactivation;
> +	/* v3 compat support (GICv5 hosts, only) */
> +	bool		has_gcie_v3_compat;
>  };
>  
>  #ifdef CONFIG_KVM
> -- 
> 2.34.1

