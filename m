Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDD606D805
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3FSLQiCK;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=WIwAUoRY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vWPeCnUz1sDUCuvHzgsNmQLP6HqKKH7oPoJSrsTWm8A=; b=3FSLQiCKTENUPO4TD0sVcZtsXV
	lCAi8UTdt3gzky0wOKyXUa9IkzjP0JoRwcZcYrpf5TOecwdMR1f/yfDfH0KKY5MiUayWdtmY34Qxx
	xhxfXQQes5mgM2JaRvutFztJ1/Xe7UUxKAxSFUFglKEfKK/OOZu0oSTZiwBX6e4wBZnd6yHtFD3HT
	hc5F1g8g7x8YnE/j1t9EkwSdSY1k3NKfnPuWqeB/+YSzYUFBT3W8sjhEvYpcpH/BXoxW1l3T3vJ+g
	PIRA8ok+egfdObpCXG3SDR+NR+42N5v/Pyz/2btX3fYwfePSsGVdSCsWCkdRWQq/mEYwPqPKeg3zX
	mywGnxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLG6-00000003dXq-085U;
	Tue, 03 Nov 2026 20:37:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLG1-00000003dXS-2Hse
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 20:37:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 277021595;
	Tue,  3 Nov 2026 12:37:19 -0800 (PST)
Received: from thinkpad-e142931.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 900353F628;
	Tue,  3 Nov 2026 12:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793738242; bh=XNxs1q7RvEvtnhfmFbzH+UCtgdjM+7kwwuvH4wf38QM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WIwAUoRYbdxoJrZAO4JhML2zcaHQrSFnQStEcdCxEEz3QsJYEAS3Xx5mxpTwxHrq8
	 H/qwyh5aWqxrCkV+u4L9w3gADSoY9lDcJYkgeA4mwUXTEUcF38b216uxNICrkSVxH2
	 6STMjkgsZkkQlNJ2J+tLf5WMqhwcZMK+FlhL4hCM=
Date: Tue, 3 Nov 2026 20:37:07 +0000
From: Wei-Lin Chang <weilin.chang@arm.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, peter.maydell@linaro.org, 
	lpieralisi@kernel.org, timothy.hayes@arm.com, fuad.tabba@linux.dev
Subject: Re: [PATCH v2 03/16] KVM: arm64: gic-v5: Share CoreSight ID register
 emulation
Message-ID: <4lhdtngikzekvcvhkd4zknnnqdh7a3mih7i72smfzwsnnjcmfh@ri2clwyj4nqm>
References: <20261102194454.4086911-1-sascha.bischoff@arm.com>
 <20261102194454.4086911-4-sascha.bischoff@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102194454.4086911-4-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_123725_684808_D2F80B34 
X-CRM114-Status: GOOD (  19.99  )
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

On Mon, Nov 02, 2026 at 07:44:41PM +0000, Sascha Bischoff wrote:
> The GICv5 IRS and ITS expose the same CoreSight identification register
> block. Move the register-value switch into a shared helper and describe
> the contiguous ID register range with one register-region descriptor.
> 
> This keeps the IRS behaviour unchanged while giving the ITS MMIO
> emulation a helper it can reuse when it is added in the following commit.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/kvm/vgic/vgic-irs-v5.c  | 75 +++---------------------------
>  arch/arm64/kvm/vgic/vgic-v5.c      | 34 ++++++++++++++
>  arch/arm64/kvm/vgic/vgic.h         |  1 +
>  include/linux/irqchip/arm-gic-v5.h |  2 +
>  4 files changed, 44 insertions(+), 68 deletions(-)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-irs-v5.c b/arch/arm64/kvm/vgic/vgic-irs-v5.c
> index 8d0ad74ebc64a..d0ebed2e1663b 100644
> --- a/arch/arm64/kvm/vgic/vgic-irs-v5.c
> +++ b/arch/arm64/kvm/vgic/vgic-irs-v5.c
> @@ -520,38 +520,9 @@ static void vgic_v5_mmio_write_irs_ist(struct kvm_vcpu *vcpu, gpa_t addr,
>  static unsigned long vgic_v5_coresight_read(struct kvm_vcpu *vcpu,
>  					    gpa_t addr, unsigned int len)
>  {
> -	const size_t offset = addr & (SZ_64K - 1);
> +	u32 offset = addr & (SZ_64K - 1);

nit: I think we can keep the const here?

>  
> -	switch (offset) {
> -	case GICV5_CORESIGHT_DEVARCH:
> -		return GICV5_CORESIGHT_DEVARCH_VAL;
> -	case GICV5_CORESIGHT_PIDR4:
> -		return GICV5_CORESIGHT_PIDR4_JEP106_CONT;
> -	case GICV5_CORESIGHT_PIDR5:
> -		return GICV5_CORESIGHT_PIDR5_RES0;
> -	case GICV5_CORESIGHT_PIDR6:
> -		return GICV5_CORESIGHT_PIDR6_RES0;
> -	case GICV5_CORESIGHT_PIDR7:
> -		return GICV5_CORESIGHT_PIDR7_RES0;
> -	case GICV5_CORESIGHT_PIDR0:
> -		return GICV5_CORESIGHT_PIDR0_PART_0;
> -	case GICV5_CORESIGHT_PIDR1:
> -		return GICV5_CORESIGHT_PIDR1_DES_0_PART_1;
> -	case GICV5_CORESIGHT_PIDR2:
> -		return GICV5_CORESIGHT_PIDR2_DES_1;
> -	case GICV5_CORESIGHT_PIDR3:
> -		return GICV5_CORESIGHT_PIDR3_REVAND_CMOD;
> -	case GICV5_CORESIGHT_CIDR0:
> -		return GICV5_CORESIGHT_CIDR0_VAL;
> -	case GICV5_CORESIGHT_CIDR1:
> -		return GICV5_CORESIGHT_CIDR1_VAL;
> -	case GICV5_CORESIGHT_CIDR2:
> -		return GICV5_CORESIGHT_CIDR2_VAL;
> -	case GICV5_CORESIGHT_CIDR3:
> -		return GICV5_CORESIGHT_CIDR3_VAL;
> -	default:
> -		return 0;
> -	}
> +	return vgic_v5_handle_guest_coresight_idreg_read(offset);
>  }
>  
>  static unsigned long vgic_v5_mmio_uaccess_read_irs_status(struct kvm_vcpu *vcpu,
> @@ -903,45 +874,13 @@ static const struct vgic_register_region vgic_v5_irs_registers[] = {
>  				  vgic_mmio_read_raz, vgic_mmio_write_wi, 8,
>  				  VGIC_ACCESS_64bit | VGIC_ACCESS_32bit),
>  
> -	/* CoreSight identification registers */
> +	/* Split the ranges so KVM_HAS_DEVICE_ATTR only reports actual registers. */

Would "Split the CoreSight range into two to account for the gap
between DEVARCH and PIDR/CIDR registers." be clearer?

Thanks,
Wei-Lin Chang

>  	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_DEVARCH,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> +				  vgic_v5_coresight_read, vgic_mmio_write_wi,
> +				  4, VGIC_ACCESS_32bit),
>  	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR4,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR5,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR6,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR7,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR0,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR1,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR2,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_PIDR3,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_CIDR0,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_CIDR1,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_CIDR2,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> -				  VGIC_ACCESS_32bit),
> -	REGISTER_DESC_WITH_LENGTH(GICV5_CORESIGHT_CIDR3,
> -				  vgic_v5_coresight_read, vgic_mmio_write_wi, 4,
> +				  vgic_v5_coresight_read, vgic_mmio_write_wi,
> +				  GICV5_CORESIGHT_PIDR_CIDR_SIZE,
>  				  VGIC_ACCESS_32bit),
>  };
>  

[...]

