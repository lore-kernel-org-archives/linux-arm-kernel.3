Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDA5606A329
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 02:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wlykwvbb;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r/2/hGlZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r4jCs72EuhtOBTKvGiR0+q5learbp+wZHBZt+KVXQMk=; b=WlykwvbbYihvZicAErd6MAvjfl
	gMcB8QO6O87hM5GGqwBTpJCrKAx3nXKmhsuzwGolVD1pCkkp9Zcbc6FYtgRY+fCqE3pR2WSnmB+co
	IOmEhtYieaEBYI05s8ZfIbKtCwvnDib5syOU/KIOXp4h0OikpvADVKSuQK+vi4QiH9ofOqb1PreoO
	AJ2UdWB+noRq3ww5mwfUlAjqbx8wT6oqCcCKa+fwr60VsMFiPu86ACxKYNfXi3e5AdO0fE9SCfHQP
	yAwLmN955nFolBpx2dMVsEkwrmuh3fu9f0UkP5CzjE5H9JorqwMaucOCmH5/PSxVIP7fs/LZsuvnC
	WdRiP6qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQjD-000000049Zb-3IaD;
	Wed, 04 Nov 2026 02:27:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQjA-000000049ZH-2bz9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 02:27:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DB311595;
	Tue,  3 Nov 2026 18:27:47 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D03F3F632;
	Tue,  3 Nov 2026 18:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793759270; bh=uPS8PXWZrhiAbB8M6M7/D3ItbI2lV1sC9YDKdYIAV4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/2/hGlZGZPIceFJDaC63LXIj2sTcSmwr3B96efGXXwDfcXtRkeHNaU5jaNhWLx/C
	 u9yV8/juuF3ET9+fS7JT5tEI95jMsTrBaOpdJlbE1Dp+8sefGoHc2x2N17+MyGdujG
	 7/TjXjtQsK0ZH3Fc1+zG6SO71B3stct/6QaDtxCg=
Date: Wed, 4 Nov 2026 02:27:39 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, peter.maydell@linaro.org, 
	lpieralisi@kernel.org, timothy.hayes@arm.com, fuad.tabba@linux.dev
Subject: Re: [PATCH v2 06/16] KVM: arm64: gic-v5: Add ITS MMIO state emulation
Message-ID: <avrdx6thdaqq3p52qra3obx6w3q5p7j7nxikep7lr6bzhu32dn@vzpnfdv53l67>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
 <20261102194454.4086911-7-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102194454.4086911-7-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_182752_839868_DCEFC577 
X-CRM114-Status: GOOD (  25.21  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

On Mon, Nov 02, 2026 at 07:44:44PM +0000, Sascha Bischoff wrote:
> In order to expose a virtual GICv5 ITS to the guest, KVM needs to
> emulate the ITS CONFIG_FRAME and its translation-control registers.
> Replace the placeholder ITS IODEV region with the GICv5 ITS register
> layout and handlers for the architected MMIO state.
> 
> Provide read/write emulation for the ITS ID registers, IIDR, AIDR,
> CR0, CR1, DT_BASER, DT_CFGR, DIDR, EIDR, invalidation registers,
> READ_EVENT, GEN_EVENT, status registers, and the RAZ/WI MMIO
> registers that KVM does not implement. Reuse the shared CoreSight
> identification-register helper so the ITS reports the same component
> identification values as the IRS.
> 
> At this stage the translation-triggering registers only record state.
> Walking the guest's DT/ITT, generating READ_EVENT results, and
> injecting GEN_EVENT LPIs are added by later commits.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic-its-v5.c | 415 +++++++++++++++++++++++++++++-
>  include/kvm/arm_vgic.h            |  77 ++++++
>  2 files changed, 490 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its-v5.c b/arch/arm64/kvm/vgic/vgic-its-v5.c
> index 5790b029f09b6..f04161c315b78 100644
> --- a/arch/arm64/kvm/vgic/vgic-its-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-its-v5.c
> @@ -6,19 +6,286 @@
> +

[...]

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

Should this change be ignored if its->enabled == 1?

> +	default:
> +		return;
> +	}
> +}
> +

[...]

> +
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

Aside from DT_CFGR and DT_BASER, shouldn't we also check its->enabled
for all these registers before emulating the write?

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

ITS_SYNCR is an 8-byte register. (Sashiko also flagged this)

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

ITS_MPAM_PMGR is a 4-byte register.

Thanks,
Wei-Lin Chang

> +	/* Split the ranges so KVM_HAS_DEVICE_ATTR only reports actual registers. */
> +	REGISTER_ITS_V5_DESC(GICV5_CORESIGHT_DEVARCH,
> +			     vgic_v5_its_coresight_read,
> +			     vgic_v5_mmio_write_its_wi, 4,
> +			     VGIC_ACCESS_32bit),
> +	REGISTER_ITS_V5_DESC(GICV5_CORESIGHT_PIDR4,
> +			     vgic_v5_its_coresight_read,
> +			     vgic_v5_mmio_write_its_wi,
> +			     GICV5_CORESIGHT_PIDR_CIDR_SIZE,
>  			     VGIC_ACCESS_32bit),
>  };
>  

[...]

