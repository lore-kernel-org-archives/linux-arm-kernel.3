Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFCD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1acFlYk/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=S2z131DX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/nHyTHwSnE3WGfTrKSGcz/VtoT7GG8niW0riWZZI2G4=; b=1acFlYk/P0nrynPazvBzQTnYy1
	KqczzVPdhv8v1PulWH+Z3F5YU0zc16QTEO71M89iftrDRn4rTzme6NwmZCBsADL9js8lp2sOdO5n7
	bye38NXSr9O4F3knpacEd8O6OAW0LA60OvGfxCEF70DjSKaBMRkCHEGc1QCVJuLoRRHmpoyomzabp
	RkQ5DJSDorHXtWk1Kn4id14lPMMH7iZyoZ/wUwzot3orS2VrIqDu/Fv1mUQQ4Ol/p2nqV8cpV/a1A
	x8zOrfmqVsFOwRvU2Vwj0xg4ogx5RSwPm2oIeI/6OeypEbdKYH4HKvmqlI4IrdazcLw2X1XeeC5Cz
	3KmHfWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkKu-00000007F92-3T9E;
	Wed, 04 Nov 2026 23:24:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkKt-00000007F8j-0wb9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 23:24:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B3FB601F7;
	Wed,  4 Nov 2026 23:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06C61F00919;
	Wed,  4 Nov 2026 23:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793834645;
	bh=/nHyTHwSnE3WGfTrKSGcz/VtoT7GG8niW0riWZZI2G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S2z131DXjJlJ6YRITa6xRYfZiOQhm/VEHhJ00xOAe1PVsE11ilTlVtBYsEjypIIUo
	 cclTpscAxV5JhwyxxrqxtMmEH7O+6e2GqBlk6NwKmyDsDQe9oeGrvZ3rN5R2RxTVyL
	 Noa6DZrxw2jAQ17YrGS34rilt/8KHyd0x/+KMHk2eEPFrZy6Y7AlzBf8a261lxJr8m
	 QOBZE6pehoSjoY+HGkBxArX3xgD0zzZHkwkTw5nQreSHDeznDHLL9jaxLCxqt66vDo
	 +2SsUujOdBaHstVfZWAodM0LxnHVo4YvdsrsiQVOeYcFjjdI4m5G1SZQuWP1sp6Plu
	 +hJl1s53gb7nA==
Date: Wed, 4 Nov 2026 15:24:04 -0800
From: Oliver Upton <oupton@kernel.org>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	peter.maydell@linaro.org, lpieralisi@kernel.org,
	timothy.hayes@arm.com, fuad.tabba@linux.dev
Subject: Re: [PATCH v2 06/16] KVM: arm64: gic-v5: Add ITS MMIO state emulation
Message-ID: <auu-lARR4dQk2D3g@kernel.org>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
 <20261102194454.4086911-7-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102194454.4086911-7-sascha.bischoff@arm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

On Mon, Nov 02, 2026 at 07:44:44PM +0000, Sascha Bischoff wrote:
> +	switch (offset) {
> +	case GICV5_ITS_IDR0:
> +		value = FIELD_PREP(GICV5_ITS_IDR0_ITSID, its->idr0.its_id);
> +		value |= FIELD_PREP(GICV5_ITS_IDR0_SWE, its->idr0.swe);
> +		value |= FIELD_PREP(GICV5_ITS_IDR0_MPAM, its->idr0.mpam);
> +		value |= FIELD_PREP(GICV5_ITS_IDR0_MEC, its->idr0.mec);
> +		value |= FIELD_PREP(GICV5_ITS_IDR0_PA_RANGE,
> +				    its->idr0.pa_range);
> +		value |= FIELD_PREP(GICV5_ITS_IDR0_DOM, its->idr0.domain);
> +		break;
> +	case GICV5_ITS_IDR1:
> +		value = FIELD_PREP(GICV5_ITS_IDR1_L2SZ, its->idr1.l2sz);
> +		value |= FIELD_PREP(GICV5_ITS_IDR1_ITT_LEVELS,
> +				    its->idr1.itt_levels);
> +		value |= FIELD_PREP(GICV5_ITS_IDR1_DT_LEVELS,
> +				    its->idr1.dt_levels);
> +		value |= FIELD_PREP(GICV5_ITS_IDR1_DEVICEID_BITS,
> +				    its->idr1.device_id_bits);
> +		break;
> +	case GICV5_ITS_IDR2:
> +		value = FIELD_PREP(GICV5_ITS_IDR2_XDMN_EVENTS,
> +				   its->idr2.xdmn_events);
> +		value |= FIELD_PREP(GICV5_ITS_IDR2_EVENTID_BITS,
> +				    its->idr2.event_id_bits);
> +		break;

Do we need to track all of this stuff per-ITS? Seems to me that we have
a pretty static feature set at this point.

We can grow the state modelled per-ITS as the emulation gets further
along.

> +static void vgic_v5_mmio_write_its_misc(struct kvm *kvm, void *dev, gpa_t addr,
> +					unsigned int len, unsigned long val)
> +{
> +	struct vgic_v5_its *its = dev;
> +	size_t offset = addr & (SZ_64K - 1);
> +
> +	guard(mutex)(&its->its_lock);
> +
> +	switch (offset) {
> +	case GICV5_ITS_CR0:
> +		its->enabled = FIELD_GET(GICV5_ITS_CR0_ITSEN, val);
> +		return;
> +	case GICV5_ITS_CR1:
> +		its->cr1.sh = FIELD_GET(GICV5_ITS_CR1_SH, val);
> +		its->cr1.oc = FIELD_GET(GICV5_ITS_CR1_OC, val);
> +		its->cr1.ic = FIELD_GET(GICV5_ITS_CR1_IC, val);
> +		its->cr1.dt_ra = FIELD_GET(GICV5_ITS_CR1_DT_RA, val);
> +		its->cr1.itt_ra = FIELD_GET(GICV5_ITS_CR1_ITT_RA, val);
> +		return;

The way we handle this on the CPU side of things is by storing the
literal register value and extracting the fields as needed for
emulation... Could something like that work for the state that we do
need to make mutable?

I'm not very keen on having so much code purely dedicated to
(de)marshalling bitfields.

> +static void vgic_v5_mmio_write_its_dt_itt(struct kvm *kvm, void *dev,
> +					  gpa_t addr, unsigned int len,
> +					  unsigned long val)
> +{
> +	struct vgic_v5_its *its = dev;
> +	size_t offset = addr & (SZ_64K - 1);
> +
> +	guard(mutex)(&its->its_lock);
> +
> +	switch (offset) {
> +	case GICV5_ITS_DT_CFGR:
> +		if (!its->enabled)
> +			vgic_v5_write_its_dt_reg(its, offset, val);
> +		return;
> +	case GICV5_ITS_DT_BASER:
> +	case GICV5_ITS_DT_BASER + 4:
> +		if (!its->enabled) {
> +			u64 baser = vgic_v5_read_its_dt_baser(its);
> +
> +			baser = update_64bit_reg(baser, offset & 4, len, val);
> +			vgic_v5_write_its_dt_reg(its, GICV5_ITS_DT_BASER,
> +						 baser);
> +		}
> +		return;
> +	case GICV5_ITS_INV_DEVICER:
> +		its->inv_devicer.l1 =
> +			FIELD_GET(GICV5_ITS_INV_DEVICER_L1, val);
> +		its->inv_devicer.event_id_bits =
> +			FIELD_GET(GICV5_ITS_INV_DEVICER_EVENTID_BITS, val);
> +		its->inv_devicer.i =
> +			FIELD_GET(GICV5_ITS_INV_DEVICER_I, val);
> +		return;
> +	case GICV5_ITS_DIDR:
> +	case GICV5_ITS_DIDR + 4:
> +		if (offset & 4)
> +			return;
> +		its->didr.device_id = FIELD_GET(GICV5_ITS_DIDR_DEVICEID, val);
> +		return;
> +	case GICV5_ITS_EIDR:
> +		its->eidr.event_id = FIELD_GET(GICV5_ITS_EIDR_EVENTID, val);
> +		return;
> +	case GICV5_ITS_INV_EVENTR:
> +		its->inv_eventr.l1 =
> +			FIELD_GET(GICV5_ITS_INV_EVENTR_L1, val);
> +		its->inv_eventr.itt_l2sz =
> +			FIELD_GET(GICV5_ITS_INV_EVENTR_ITT_L2SZ, val);
> +		its->inv_eventr.i = FIELD_GET(GICV5_ITS_INV_EVENTR_I, val);
> +		return;
> +	case GICV5_ITS_SYNCR:
> +	case GICV5_ITS_READ_EVENTR:
> +		return;
> +	case GICV5_ITS_GEN_EVENT_EIDR:
> +		its->gen_event_eidr.event_id =
> +			FIELD_GET(GICV5_ITS_GEN_EVENT_EIDR_EVENTID, val);
> +		return;
> +	case GICV5_ITS_GEN_EVENT_DIDR:
> +	case GICV5_ITS_GEN_EVENT_DIDR + 4:
> +		if (offset & 4)
> +			return;
> +		its->gen_event_didr.device_id =
> +			FIELD_GET(GICV5_ITS_GEN_EVENT_DIDR_DEVICEID, val);
> +		return;
> +	case GICV5_ITS_GEN_EVENTR:
> +		return;
> +	default:
> +		return;
> +	}
> +}
> +
>  static unsigned long vgic_v5_mmio_read_its_raz(struct kvm *kvm, void *dev,
>  					       gpa_t addr, unsigned int len)
>  {
>  	return 0;
>  }
>  
> +static unsigned long vgic_v5_its_coresight_read(struct kvm *kvm, void *dev,
> +						gpa_t addr, unsigned int len)
> +{
> +	u32 offset = addr & (SZ_64K - 1);
> +
> +	return vgic_v5_handle_guest_coresight_idreg_read(offset);
> +}
> +
>  static void vgic_v5_mmio_write_its_wi(struct kvm *kvm, void *dev, gpa_t addr,
>  				      unsigned int len, unsigned long val)
>  {
> @@ -31,11 +298,153 @@ static void vgic_v5_mmio_write_its_wi(struct kvm *kvm, void *dev, gpa_t addr,
>  	}
>  
>  static const struct vgic_register_region vgic_v5_its_registers[] = {
> -	REGISTER_ITS_V5_DESC(0, vgic_v5_mmio_read_its_raz,
> -			     vgic_v5_mmio_write_its_wi, KVM_VGIC_V5_ITS_SIZE,
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_IDR0, vgic_v5_mmio_read_its_misc,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_IDR1, vgic_v5_mmio_read_its_misc,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_IDR2, vgic_v5_mmio_read_its_misc,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_IIDR, vgic_v5_mmio_read_its_misc,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_AIDR, vgic_v5_mmio_read_its_misc,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_CR0, vgic_v5_mmio_read_its_misc,
> +			     vgic_v5_mmio_write_its_misc, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_CR1, vgic_v5_mmio_read_its_misc,
> +			     vgic_v5_mmio_write_its_misc, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_DT_BASER,
> +			     vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_dt_itt, 8,
> +			     VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_DT_CFGR,
> +			     vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_dt_itt, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_DIDR, vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_dt_itt, 8,
> +			     VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_EIDR, vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_dt_itt, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_INV_EVENTR, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_dt_itt, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_INV_DEVICER, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_dt_itt, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_READ_EVENTR, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_dt_itt, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_READ_EVENT_DATAR,
> +			     vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_wi, 8,
> +			     VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_STATUSR, vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_SYNCR, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_dt_itt, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_SYNC_STATUSR,
> +			     vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_GEN_EVENT_DIDR,
> +			     vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_dt_itt, 8,
> +			     VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_GEN_EVENT_EIDR,
> +			     vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_dt_itt, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_GEN_EVENTR, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_dt_itt, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_GEN_EVENT_STATUSR,
> +			     vgic_v5_mmio_read_its_dt_itt,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),

<snip>

> +	REGISTER_ITS_V5_DESC(GICV5_ITS_MEC_IDR, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_MEC_MECID_R, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_MPAM_IDR, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_MPAM_PARTID_R,
> +			     vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_wi, 4, VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_SWERR_STATUSR, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_wi, 8, VGIC_ACCESS_64bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_SWERR_SYNDROMER0,
> +			     vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_wi, 8, VGIC_ACCESS_64bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_SWERR_SYNDROMER1,
> +			     vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_wi, 8,
> +			     VGIC_ACCESS_64bit),
> +	REGISTER_ITS_V5_DESC(GICV5_ITS_MPAM_PMGR, vgic_v5_mmio_read_its_raz,
> +			     vgic_v5_mmio_write_its_wi, 8, VGIC_ACCESS_64bit),

</snip>

Using a macro for RAZ/WI would improve readability here.

> +static void vgic_v5_its_reset(struct vgic_v5_its *its)
> +{
> +	u64 mmfr0;
> +
> +	its->enabled = false;
> +
> +	mmfr0 = read_sanitised_ftr_reg(SYS_ID_AA64MMFR0_EL1);
> +	its->idr0.pa_range = cpuid_feature_extract_unsigned_field(
> +		mmfr0, ID_AA64MMFR0_EL1_PARANGE_SHIFT);

Can this key off of kvm_get_pa_bits()?

Thanks,
Oliver

