Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F249C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 18:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4R3moVH9ncnJ3rddrTIL8VDc5qHenk1KY1QkKOOjgCI=; b=yf1k17STkAgMVQ+hHBz2EmF/9q
	arzndlvWTVGDpY91v5lZePp2hnGcbmz2hzzWWvbPamWrpdm1W/aPucsSPG6L6f8EPA7/Gxs7U4OmM
	aEHAFVryHrAHG6mTbwINIyElTfm0rDlTc5KrDOTocFPwIV7OKVxzLzcojveqdhnNDaezokpC1yTIj
	j1VaZzPyPGdzOT03BbvHSexe9DYCeXazsI4iuc5mrO5hNMmbqS1BxVvw0d9mzmeHWj0QdIyvi39Qv
	7TAVQeDv/6mp+id8ddcplcOxXmmtX0qCRGLzzf7eiwyP6jrrYZbbVY5+jGbOW8kzdM6mt8QGBQVUO
	N4gnEMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqEMV-0000000Ex6j-3YmL;
	Sat, 01 Aug 2026 18:23:07 +0000
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqEMT-0000000Ex63-1eMl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 18:23:06 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id D7A88CC47B;
	Sat,  1 Aug 2026 21:22:52 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro D7A88CC47B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1785608573;
	bh=4R3moVH9ncnJ3rddrTIL8VDc5qHenk1KY1QkKOOjgCI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=seg2X9LiJzuuot+sPVKSz5hw8JhXfXfD9PkjttwZzBG9BXSaSa44ECVkHe95SnD8p
	 6ZdqtVHdCbHjyEjC5q+pBOhREBhLereNHk4pxrdmE43rTO/XmKCjgBHghcAORXcdvO
	 CwxDFO99iOAPNSmM3wW7PmIRX9NbWsUrVOZQnExxUkdUHJGriWpVZjerhVIVbiCxKF
	 HvVzT+y2nSdLlG4vxavV++rctj9uHyyuIbQY6rgiJ+EKn8fp6//FUNfTeYncB2Cldp
	 jg3xcCHjwl4DVvrRfIZI/19BIe8vfbFH4wFj+QRbrx+i21AS3Rd1Z9BxKJXNNh6st8
	 SkzEe/09V/FZg==
Message-ID: <d04a7313b44a3d671024c2d15ad25acbce2ebc2e.camel@rendec.net>
Subject: Re: [PATCH] irqchip/gic: Simplify Maintenance Interrupt ACPI parsing
From: Radu Rendec <radu@rendec.net>
To: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: Thomas Gleixner <tglx@kernel.org>, Sascha Bischoff
 <sascha.bischoff@arm.com>
Date: Sat, 01 Aug 2026 14:22:50 -0400
In-Reply-To: <20260725155941.114322-1-maz@kernel.org>
References: <20260725155941.114322-1-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_112305_748755_149A5164 
X-CRM114-Status: GOOD (  21.50  )
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

On Sat, 2026-07-25 at 16:59 +0100, Marc Zyngier wrote:
> The ACPI spec describes the vgic Maintenance Interrupt with attributes
> indicating whether the signalling is Level or Edge. While this
> superficially looks like a sensible thing to do, it doesn't actually
> make much sense.
>=20
> By construction, this interrupt is Level, and cannot be anything
> else, as the hypervisor actively needs to interact with the vgic
> for the level to drop. This indicates a state, and not an event.
>=20
> Get rid of this nonsense, always register the corresponding GSI as
> Level, and let the user know that they run on quality FW should
> the interrupt be advertised as Edge.
>=20
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
> =C2=A0drivers/irqchip/irq-gic-v3.c | 10 +++-------
> =C2=A0drivers/irqchip/irq-gic.c=C2=A0=C2=A0=C2=A0 |=C2=A0 8 ++++----
> =C2=A02 files changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 99444a1b2ffa2..22ecd28a491a8 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -2279,7 +2279,6 @@ static struct
> =C2=A0	bool single_redist;
> =C2=A0	int enabled_rdists;
> =C2=A0	u32 maint_irq;
> -	int maint_irq_mode;
> =C2=A0	phys_addr_t vcpu_base;
> =C2=A0} acpi_data __initdata;
> =C2=A0
> @@ -2457,21 +2456,19 @@ static int __init gic_acpi_parse_virt_madt_gicc(u=
nion acpi_subtable_headers *hea
> =C2=A0{
> =C2=A0	struct acpi_madt_generic_interrupt *gicc =3D
> =C2=A0		(struct acpi_madt_generic_interrupt *)header;
> -	int maint_irq_mode;
> =C2=A0	static int first_madt =3D true;
> =C2=A0
> =C2=A0	if (!(gicc->flags &
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (ACPI_MADT_ENABLED | ACPI_MADT_GICC=
_ONLINE_CAPABLE)))
> =C2=A0		return 0;
> =C2=A0
> -	maint_irq_mode =3D (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE) ?
> -		ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
> +	if (gicc->flags & ACPI_MADT_VGIC_IRQ_MODE)
> +		pr_warn_once(FW_BUG "MI wrongly advertised as Edge-triggered\n");
> =C2=A0
> =C2=A0	if (first_madt) {
> =C2=A0		first_madt =3D false;
> =C2=A0
> =C2=A0		acpi_data.maint_irq =3D gicc->vgic_interrupt;
> -		acpi_data.maint_irq_mode =3D maint_irq_mode;
> =C2=A0		acpi_data.vcpu_base =3D gicc->gicv_base_address;
> =C2=A0
> =C2=A0		return 0;
> @@ -2481,7 +2478,6 @@ static int __init gic_acpi_parse_virt_madt_gicc(uni=
on acpi_subtable_headers *hea
> =C2=A0	 * The maintenance interrupt and GICV should be the same for every=
 CPU
> =C2=A0	 */
> =C2=A0	if ((acpi_data.maint_irq !=3D gicc->vgic_interrupt) ||
> -	=C2=A0=C2=A0=C2=A0 (acpi_data.maint_irq_mode !=3D maint_irq_mode) ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 (acpi_data.vcpu_base !=3D gicc->gicv_base_addre=
ss))
> =C2=A0		return -EINVAL;
> =C2=A0
> @@ -2514,7 +2510,7 @@ static void __init gic_acpi_setup_kvm_info(void)
> =C2=A0	gic_v3_kvm_info.type =3D GIC_V3;
> =C2=A0
> =C2=A0	irq =3D acpi_register_gsi(NULL, acpi_data.maint_irq,
> -				acpi_data.maint_irq_mode,
> +				ACPI_LEVEL_SENSITIVE,
> =C2=A0				ACPI_ACTIVE_HIGH);
> =C2=A0	if (irq <=3D 0)
> =C2=A0		return;
> diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
> index ec70c84e9f91d..74bda5e246345 100644
> --- a/drivers/irqchip/irq-gic.c
> +++ b/drivers/irqchip/irq-gic.c
> @@ -1527,7 +1527,6 @@ static struct
> =C2=A0{
> =C2=A0	phys_addr_t cpu_phys_base;
> =C2=A0	u32 maint_irq;
> -	int maint_irq_mode;
> =C2=A0	phys_addr_t vctrl_base;
> =C2=A0	phys_addr_t vcpu_base;
> =C2=A0} acpi_data __initdata;
> @@ -1553,10 +1552,11 @@ gic_acpi_parse_madt_cpu(union acpi_subtable_heade=
rs *header,
> =C2=A0	if (cpu_base_assigned && gic_cpu_base !=3D acpi_data.cpu_phys_base=
)
> =C2=A0		return -EINVAL;
> =C2=A0
> +	if (processor->flags & ACPI_MADT_VGIC_IRQ_MODE)
> +		pr_warn_once(FW_BUG "MI wrongly advertised as Edge-triggered\n");
> +
> =C2=A0	acpi_data.cpu_phys_base =3D gic_cpu_base;
> =C2=A0	acpi_data.maint_irq =3D processor->vgic_interrupt;
> -	acpi_data.maint_irq_mode =3D (processor->flags & ACPI_MADT_VGIC_IRQ_MOD=
E) ?
> -				=C2=A0=C2=A0=C2=A0 ACPI_EDGE_SENSITIVE : ACPI_LEVEL_SENSITIVE;
> =C2=A0	acpi_data.vctrl_base =3D processor->gich_base_address;
> =C2=A0	acpi_data.vcpu_base =3D processor->gicv_base_address;
> =C2=A0
> @@ -1616,7 +1616,7 @@ static void __init gic_acpi_setup_kvm_info(void)
> =C2=A0	vcpu_res->end =3D vcpu_res->start + ACPI_GICV2_VCPU_MEM_SIZE - 1;
> =C2=A0
> =C2=A0	irq =3D acpi_register_gsi(NULL, acpi_data.maint_irq,
> -				acpi_data.maint_irq_mode,
> +				ACPI_LEVEL_SENSITIVE,
> =C2=A0				ACPI_ACTIVE_HIGH);
> =C2=A0	if (irq <=3D 0)
> =C2=A0		return;

Reviewed-by: Radu Rendec <radu@rendec.net>

