Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99336C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 07:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJEcgVHV1SKoXF5ZoBRz45cHC9PufYDb1DqV0Y3gFyw=; b=rneWA7rVjo3uA9Eg2Xmw04dYe0
	czwKkiT2N2dgLWienwYaEaydEcSJ3eJxHVzydg3RVnvoJgAJdbN9WcjV7D5BnWVbH1hIKF5jl+YVo
	6p7oWPx3lJRgurA/wWezJubPBwni19oa51B+prvQyI/U+HoajyWjUc1k+ewR3Ih4Cz+xawNfH3oxQ
	i3tBl4zU0Dv9QQmxjV/XLVAR1GhIHyGCJolEUj1v3uXuNq1DTwvwl2JidnVTOKEkRZOaHg023eDIy
	FmNlXMVD5BBkKbc1DQSglcCwmxUvkRPPiztJ7jxQjix8tph1rPjQRS5CKSRcRpRwvLlLtfOddQW++
	6Fzkipwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q8D-00000006Slf-0qII;
	Wed, 09 Apr 2025 07:45:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Q3R-00000006S0h-224U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 07:41:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73810A4883A;
	Wed,  9 Apr 2025 07:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB1EAC4CEE7;
	Wed,  9 Apr 2025 07:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744184459;
	bh=qVnRcibZsKZayn6OQD1ZHThuYI/D6rlvvaIk20DSsq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FHvg3aQ6W+swrUHodTyOzNNm4f68YiYNP9idAp4WfEEa57ZAjCqB59bhu4bMPIm2b
	 tzH6vYqbyWuHO0FRiGjNQtLFt4cG0LD1BJ150E1AJ2d1B+DFhnuQz5Jl4j6thTcUlh
	 93L7dJsUMyx0fp2FCVCEzWGN9U0Hu56FtN4lraN7JLIKFAj0DgMUEyJdDqai9vxO3r
	 z+yVuH3pKVzl/iXfZNy25m8yYr2mdTcTaGlrx1BBfKrNW82D3sn+rlFiVjyrPN6qj2
	 ZwUroPsMUp5Yyz0NieigyHa7axNWlLDwnhpWyeIkCAdtxw7A5jyeq01grUNtMP39h1
	 PFGG5yYkcSeiQ==
Date: Wed, 9 Apr 2025 09:40:52 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 19/24] irqchip/gic-v5: Add GICv5 IRS/SPI support
Message-ID: <Z/YkhDpUOXKOpIOo@lpieralisi>
References: <20250408-gicv5-host-v1-19-1f26db465f8d@kernel.org>
 <87zfgpu89p.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87zfgpu89p.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_004102_264323_BFC634B4 
X-CRM114-Status: GOOD (  25.45  )
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

On Wed, Apr 09, 2025 at 09:02:58AM +0200, Thomas Gleixner wrote:
> On Tue, Apr 08 2025 at 12:50, Lorenzo Pieralisi wrote:
> > +struct iaffid_entry {
> > +	u16 iaffid;
> > +	bool valid;
> > +};
> 
> See the previous documentation link and search for struct definitions on
> that page.

Right, will fix.

> > +static int gicv5_irs_wait_for_spi_op(struct gicv5_irs_chip_data *irs_data)
> > +{
> > +	int ret;
> > +	u32 statusr;
> 
> See documentaion...
> 
> > +	ret = readl_relaxed_poll_timeout_atomic(
> > +			irs_data->irs_base + GICV5_IRS_SPI_STATUSR, statusr,
> > +			FIELD_GET(GICV5_IRS_SPI_STATUSR_IDLE, statusr), 1,
> > +			USEC_PER_SEC);
> 
> See previous mail about how to make stuff like this readable. My eyes
> bleed already.
> 
> > +	if (ret == -ETIMEDOUT) {
> 
> unlikely(ret == ...) perhaps?

Will change it.

> > +		pr_err_ratelimited("Time out waiting for IRS SPI to be configured\n");
> 
> > +static int __init gicv5_irs_init_bases(struct gicv5_irs_chip_data *irs_data,
> > +				       void __iomem *irs_base,
> > +				       struct fwnode_handle *handle)
> > +{
> > +	u32 cr0, cr1;
> > +	struct device_node *np = to_of_node(handle);
> 
> Sigh
> 
> > +static int __init gicv5_irs_of_init_affinity(struct device_node *node,
> > +				      struct gicv5_irs_chip_data *irs_data,
> > +				      u8 iaffid_bits)
> 
> Moar random coding style choices.
> 
> > +{
> > +	/*
> > +	 * Detect IAFFID<->CPU mappings from the device tree and
> > +	 * record IRS<->CPU topology information.
> > +	 */
> > +	int ret, i, ncpus, niaffids;
> > +	u16 *iaffids;
> > +	u16 iaffid_mask = GENMASK(iaffid_bits - 1, 0);
> > +
> > +	ncpus = of_property_count_elems_of_size(node, "cpus", sizeof(u32));
> > +	if (WARN_ON(ncpus < 0))
> > +		return -EINVAL;
> 
> Do you really need all these warnings?

I will review them.

> > +
> > +	niaffids = of_property_count_elems_of_size(node, "arm,iaffids",
> > +						   sizeof(u16));
> > +	if (WARN_ON(niaffids != ncpus))
> > +		return -EINVAL;
> > +
> > +	iaffids = kcalloc(niaffids, sizeof(*iaffids), GFP_KERNEL);
> > +	if (!iaffids)
> > +		return -ENOMEM;
> > +
> > +	ret = of_property_read_u16_array(node, "arm,iaffids", iaffids, niaffids);
> > +	if (ret)
> > +		return ret;
> 
> Leaks iaffids. Please use
> 
>       u16 *iaffids __free(kfree) = kcalloc(...);
> 
> and the compiler will take care of that.

Yes, that's silly.

> > +static int __init gicv5_irs_init(struct device_node *node)
> > +{
> > +	void __iomem *irs_base;
> > +	struct gicv5_irs_chip_data *irs_data;
> > +	int ret;
> > +	u32 idr;
> > +	u8 iaffid_bits;
> > +
> > +	irs_data = kzalloc(sizeof(*irs_data), GFP_KERNEL);
> 
> __free(kfree)

Will do.

> > +	if (!irs_data)
> > +		return -ENOMEM;
> 
> > +	if (irs_data->spi_range)
> > +		pr_info("%s detected SPI range [%u-%u]\n",
> > +						of_node_full_name(node),
> > +						irs_data->spi_min,
> > +						irs_data->spi_min +
> > +						irs_data->spi_range - 1);
> 
> Please put those _five_ lines into brackets. It's not required by the
> compiler, but for reading. Brackets should be omitted only if the
> statement which follows ‘if’, ‘for’, ‘while’ etc. is truly a single
> line.

Ok.

> > +static int gicv5_iri_irq_get_irqchip_state(struct irq_data *d,
> > +					   enum irqchip_irq_state which,
> > +					   bool *val, u8 hwirq_type)
> > +{
> > +	u64 icsr, cdrcfg = d->hwirq | FIELD_PREP(GICV5_GIC_CDRCFG_TYPE_MASK,
> > +						 hwirq_type);
> > +
> > +	preempt_disable();
> 
> That's required because the calling contexts protection (raw spinlock
> held and interrupts disabled) is not enough, right?

Yes it is useless, I will remove it.

> > +	gic_insn(cdrcfg, GICV5_OP_GIC_CDRCFG);
> > +	isb();
> > +	icsr = read_sysreg_s(SYS_ICC_ICSR_EL1);
> > +	preempt_enable();
> 
> > +static int gicv5_irq_spi_domain_translate(struct irq_domain *d,
> > +					  struct irq_fwspec *fwspec,
> > +					  irq_hw_number_t *hwirq,
> > +					  unsigned int *type)
> > +{
> > +	if (is_of_node(fwspec->fwnode)) {
> > +		if (fwspec->param_count < 3)
> > +			return -EINVAL;
> > +
> > +		if (fwspec->param[0] != GICV5_HWIRQ_TYPE_SPI)
> > +			return -EINVAL;
> > +
> > +		*hwirq = fwspec->param[1];
> > +		*type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
> > +
> > +		return 0;
> > +	}
> 
> The only difference between this and the ppi variant is the type check
> of param[0]. Common helper perhaps?

Definitely.

Thanks a lot,
Lorenzo

