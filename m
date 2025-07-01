Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6359C8302F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 11:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiVOWV0pjXF8Uocuc4ex8xgvaP+Gi02wcEw10sz1ecM=; b=gpIZHAKR8Ss1/gwR/rD2OXKQdQ
	ZZuZE8HJ+o23RqFFJbqLuSEaHQKbB92SD9iYZg0Vf3gjS56pqr7Olrbvkplest2iJoi23iFexclKD
	7+yH0cLKnYLP1dXPhuXaBq5VfclRRozTrvm7vx3PPZ3+aLAPMx2sYNC0VTHmuwGa8nz5XegCWOULh
	tZt/Jde5k3acpaLIyVqIN8yjjHmUE0VrN4O8JD2DQncRBvIkJv6CJ4RdP+QOuIIAFM9w3jw7VqVx9
	gEVZAj6yXLDfd8ajnha6L9Of0hPaP9gLCpdIXE+dHH4rsqiet5EgplpBN2i5wkgmu25ccSm372FkL
	KaRBunhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYoD-00000004pdX-44qH;
	Tue, 01 Jul 2025 11:05:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXYz-00000004dYm-2LeR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 09:46:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C48D061127;
	Tue,  1 Jul 2025 09:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFE54C4CEEB;
	Tue,  1 Jul 2025 09:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751363164;
	bh=MzK+tBHEvikT/y3icY0EOlfB0eIQiJbDL/vPnBH5ZC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6nkgnRVrxpsEhrSynq7t3OUsleGE7pItMeHT0asVMWR32cxKjoPirQimg891wiwo
	 63X/x1ovRlUxKJwCM5gmW/Qa1un4NcmGdRIf4PCMIoHuWo4ka0elgPeRcbwj/3tvRi
	 5FzH0zsYYHdYMHZlHdo9WXkGEFt4OgRZz8I7ES/LZrE5oPAs0/CQMHYyj9N7Rg04E8
	 nMsYPJIWcTI3uufeSdpWajM3LuDSM5/4ii7CE6CvoeocVIqn8pDb5hfJd/cF5ScJaR
	 SaTpNfQvPcGDSv1Lpk9JDq9ncLBQr7kJx3kIF0UGrv2VTvvJMmodN8NTI5av8qdTy3
	 lyjMHJA+sbX0Q==
Date: Tue, 1 Jul 2025 11:45:58 +0200
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
Subject: Re: [PATCH v2 2/5] irqchip/gic-v5: Populate struct gic_kvm_info
Message-ID: <aGOuVhED/SSnzwWU@lpieralisi>
References: <20250627100847.1022515-1-sascha.bischoff@arm.com>
 <20250627100847.1022515-3-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627100847.1022515-3-sascha.bischoff@arm.com>
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

On Fri, Jun 27, 2025 at 10:09:01AM +0000, Sascha Bischoff wrote:
> Populate the gic_kvm_info struct based on support for
> FEAT_GCIE_LEGACY.  The struct is used by KVM to probe for a compatible
> GIC.
> 
> Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5.c          | 33 +++++++++++++++++++++++++++
>  include/linux/irqchip/arm-vgic-info.h |  4 ++++
>  2 files changed, 37 insertions(+)

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 6b42c4af5c79..9ba43ec9318b 100644
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
> @@ -1049,6 +1050,36 @@ static void gicv5_set_cpuif_idbits(void)
>  	}
>  }
>  
> +#ifdef CONFIG_KVM
> +static struct gic_kvm_info gic_v5_kvm_info __initdata;
> +
> +static bool __init gicv5_cpuif_has_gcie_legacy(void)
> +{
> +	u64 idr0 = read_sysreg_s(SYS_ICC_IDR0_EL1);
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
> +static inline void __init gic_of_setup_kvm_info(struct device_node *node)
> +{
> +}
> +#endif // CONFIG_KVM
> +
>  static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
>  {
>  	int ret = gicv5_irs_of_probe(node);
> @@ -1081,6 +1112,8 @@ static int __init gicv5_of_init(struct device_node *node, struct device_node *pa
>  
>  	gicv5_irs_its_probe();
>  
> +	gic_of_setup_kvm_info(node);
> +
>  	return 0;
>  
>  out_int:
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

