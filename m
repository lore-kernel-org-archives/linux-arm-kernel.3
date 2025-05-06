Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EC2C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 18:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcg1uck+PJdLT3sfZ0kHBMDtN1dwi+oG323b6C8H4LM=; b=wkRttvllaG8s/ntgx8IraTr39F
	eP0XrTAb0CUSwZiHNZnHJm3WJyY+wHWom1mxjGn5Pdly/abwYIRP0EIqP8+rETatsDOUOnyHbJF2P
	8Paid86d+/HJgNheptMlPvtwYy3sL1jbOLEx3SSF4OD1E5/xZCN5NW2ILMYK/l79hq3bIrlrJyWiq
	P95M9lauMEgLNHrqh+M/P1w7dKJYX/QUDmrZGb0zd5lKlwuRYv5BbLOG0GYpanR4q/Ibv5hNfeXRY
	5U+SisEgB/XhfJoIggdlV+/GwACh9C9vcEolARjK6c3qMm2yyEpJUZft+I1nHPkSfBIvk9GnQADRh
	kM28QZSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNOc-0000000D9iL-15xq;
	Tue, 06 May 2025 18:52:02 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJmc-0000000CQCX-1vrL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 15:00:35 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746543632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tcg1uck+PJdLT3sfZ0kHBMDtN1dwi+oG323b6C8H4LM=;
	b=wErMUTUO5NR5ggh9k6XOtaNCd9S3uaR575AuJbrW2Og5poFHFJtivt4rBmb58ZZq4mXocU
	WU17vsStGuVa9ZJr5Lo9mxt9blely8iC6AEtnd6lhwupVCekMMVKC4rZiijRCVDvX41zkm
	Iw4Qjji0WWsjjnLeC/v2/G0Dqyt5DfoV1XvG+YGwoKP7/q7sTVi0Wqz4NzfqnyNHxyXtNQ
	uzi3WxoEeLqlu5eicthtmS/DrsSYGdVXWfSq4/l/AdPUWGpOc2HvWofEQBlUyY1EmqvlZw
	KtDYiqYsXX4dBGbN3I51yvizTTqk9b7564Ak/AwrbgndfKaom3RmLd+eiFIpYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746543632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tcg1uck+PJdLT3sfZ0kHBMDtN1dwi+oG323b6C8H4LM=;
	b=NfZe5z1PQoP7Ys2YaavSKFguw/oOm7wjhpMrPBiGjky5CiaXi63jL3dwtmVMPBc7IPz031
	EdtBoeXFKRrblBDA==
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier
 <maz@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Sascha Bischoff
 <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lorenzo
 Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 20/25] irqchip/gic-v5: Add GICv5 PPI support
In-Reply-To: <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
 <20250506-gicv5-host-v3-20-6edd5a92fd09@kernel.org>
Date: Tue, 06 May 2025 17:00:31 +0200
Message-ID: <87zffpn5rk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_080034_774964_4C4ED401 
X-CRM114-Status: GOOD (  21.71  )
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

On Tue, May 06 2025 at 14:23, Lorenzo Pieralisi wrote:
> +
> +static u8 pri_bits = 5;

__ro_after_init ?

> +#define GICV5_IRQ_PRI_MASK 0x1f

Please put a new line before the #define and use a TAB between the
symbol and the value.

> +#define GICV5_IRQ_PRI_MI \
> +		(GICV5_IRQ_PRI_MASK & GENMASK(4, 5 - pri_bits))

No line break required. You have 100 characters

> +#define READ_PPI_REG(irq, reg)							\
> +	({									\
> +		u64 __ppi_val;							\
> +										\
> +		if (irq < 64)							\
> +			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R0_EL1);	\
> +		else								\
> +			__ppi_val = read_sysreg_s(SYS_ICC_PPI_##reg##R1_EL1);	\
> +		__ppi_val;							\
> +	})
> +
> +#define WRITE_PPI_REG(set, irq, bit, reg)					\
> +	do {									\
> +		if (set) {							\
> +			if (irq < 64)						\
> +				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R0_EL1);\
> +			else							\
> +				write_sysreg_s(bit, SYS_ICC_PPI_S##reg##R1_EL1);\
> +		} else {							\
> +			if (irq < 64)						\
> +				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R0_EL1);\
> +			else							\
> +				write_sysreg_s(bit, SYS_ICC_PPI_C##reg##R1_EL1);\
> +		}								\
> +	} while (0)

I'm not convinced that these need to be macros.

static __always_inline u64 read_ppi_sysreg_s(unsigned int irq, const unsigned int which)
{
        switch (which) {
        case PPI_HM:
        	return irq < 64 ? read_sysreg_s(SYS_ICC_PPI_HM_R0_EL1) :
                		  read_sysreg_s(SYS_ICC_PPI_HM_R1_EL1;
        case ....:

        default:
                BUILD_BUG_ON(1);
        }
}

static __always_inline void write_ppi_sysreg_s(unsigned int irq, bool set, const unsigned int which)
{
	u64 bit = BIT_ULL(irq % 64);

        switch (which) {  
        case PPI_HM:
        	if (irq < 64)
                	write_sysreg_s(bit, SYS_ICC_PPI_HM_R0_EL1);
                else
                	write_sysreg_s(bit, SYS_ICC_PPI_HM_R1_EL1;
                return;
        case ....:

        default:
                BUILD_BUG_ON(1);
        }
}

Or something like that.

> +static int gicv5_ppi_set_type(struct irq_data *d, unsigned int type)
> +{
> +	/*
> +	 * The PPI trigger mode is not configurable at runtime,
> +	 * therefore this function simply confirms that the `type`
> +	 * parameter matches what is present.
> +	 */
> +	u64 hmr = READ_PPI_REG(d->hwirq, HM);
> +
> +	switch (type) {
> +	case IRQ_TYPE_LEVEL_HIGH:
> +	case IRQ_TYPE_LEVEL_LOW:
> +		if (((hmr >> (d->hwirq % 64)) & 0x1) != GICV5_PPI_HM_LEVEL)
> +			return -EINVAL;

Blink!

How does this test distinguish between LEVEL_LOW and LEVEL_HIGH? It only
tests for level, no? So the test is interesting at best ...

Secondly this comparison is confusing at best especially given that you
mask with a hex constant (0x1) first.

     		if (hmr & BIT_UL(d->hwirq % 64))
                	return -EINVAL;

Aside of that why do you have a set_type() function if there is no way
to set the type?

> +
> +static int gicv5_ppi_irq_get_irqchip_state(struct irq_data *d,
> +					   enum irqchip_irq_state which,
> +					   bool *val)
> +{
> +	u64 pendr, activer, hwirq_id_bit = BIT_ULL(d->hwirq % 64);
> +
> +	switch (which) {
> +	case IRQCHIP_STATE_PENDING:
> +		pendr = READ_PPI_REG(d->hwirq, SPEND);
> +
> +		*val = !!(pendr & hwirq_id_bit);
> +
> +		return 0;

		*val = !!(read_ppi_reg(d->hwirq, PPI_SPEND) & bit);
                return 0;

would take up less space and be readable.

> +	case IRQCHIP_STATE_ACTIVE:
> +		activer = READ_PPI_REG(d->hwirq, SACTIVE);
> +
> +		*val = !!(activer & hwirq_id_bit);
> +
> +		return 0;
> +	default:
> +		pr_debug("Unexpected PPI irqchip state\n");
> +	}
> +
> +	return -EINVAL;

Move the return into the default case.

> +static int __init gicv5_init_domains(struct fwnode_handle *handle)
> +{
> +	struct irq_domain *d;
> +
> +	d = irq_domain_create_linear(handle, PPI_NR, &gicv5_irq_ppi_domain_ops,
> +				     NULL);

Please use the full 100 charactes all over the place.

> +	if (!d)
> +		return -ENOMEM;
> +
> +	irq_domain_update_bus_token(d, DOMAIN_BUS_WIRED);
> +	gicv5_global_data.ppi_domain = d;
> +
> +	gicv5_global_data.fwnode = handle;

The random choices of seperating code with new lines are really
amazing.

> +static int __init gicv5_of_init(struct device_node *node, struct device_node *parent)
> +{
> +	int ret;
> +
> +	ret = gicv5_init_domains(&node->fwnode);

        int ret = ....;

> +	if (ret)

Thanks,

        tglx

