Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AA1C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozF4W01O/l0MVYxT0l6He3hHSnzQw0/wHNJN/F8YkKo=; b=joVztUQtBL7NFONGkqYZLqiCgQ
	WrR7hNMlsy6D0keyWvLM56GdNZl3Wg2UJ/5OUCaNPnhiqoPt8Tkg8K0upGHZjzM7uHp/AQqGf4SZL
	Tr3LpOsV24xK54Tw/W3S2vZJrfPCGV29L4GG/73eLEiu9TnYs+OYJKKyXToG41YT1ErhhJp3lFx2P
	ths8K3b0XOtx7Zv7VOAnKDe9dph7enl20CzV6aQrxdkS4t9cKeCiesQ/HxNnepQAKMGR+NayT1h4Y
	73Tirc1oHPJh+8qToXs/sSa5RgUR9UmbK+1Dy8LWAnrLnTC9tVpMtDTSpiQaeNJYp28ub3KVVBX8k
	i83OhH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IlF-0000000Hamq-2Dtn;
	Sun, 20 Sep 2026 14:43:21 +0000
Received: from out-129.mta0.migadu.com ([2001:41d0:1004:224b::81] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8IlB-0000000Hale-2oGw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 14:43:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=yZadQIKLPBXUWvfsPFFRLWHe9vBIyM1Isv2IkYkJtAU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789915393; v=1; x=1790520193;
 b=jtI2NiRv+3htB6V6LqiwUVC2ioSsTrptlkBG6tZDgir9Iyr15xqPy+mNTcOSm7A+3rLw3Jg4
 ccgbnB9L1pgor+edNhqkTowBQbBCfkmcrNFXmNFb0PQXT1W9qCRk8D0VjULCqDE2RprnSRnMZGW
 jOmX0qKl1XF2hyGeyzC/lsMg=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6ad4b5d5bc70596e;
	Sun, 20 Sep 2026 14:43:13 +0000
X-Mizu-Trace-ID: 6ad4b5d5bc70596e
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b8c42da963so5602e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 07:43:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3wVbdjKrgHUtZXLG9EQYE4VxCbFDKQKI7zBx50B3tC4eVC57TTBVRXlgeuc3xGhagGbQjT0aAp/1VEqMw28i6@lists.infradead.org
X-Gm-Message-State: AFuF++kDVFavxJH62Mo5+5TkEcv33GSOsryUHkM5tpsgqvYvl915etyH
	scWunuXLDQXGgiixWZ5JOPv5m9mGUc2HQng4tnEdOhXBeGjlazr67Mp6fNDu2IT+kb9ydelBjzs
	shgFccsvKEL3OSPKCRqZ8LJ8NbgMaWBreBM8m9af5
X-Received: by 2002:a05:6512:3c86:b0:5b1:5141:9156 with SMTP id
 2adb3069b0e04-5b8c7eaa535mr93155e87.9.1789915388858; Sun, 20 Sep 2026
 07:43:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260919123150.3283606-1-maz@kernel.org> <20260919123150.3283606-4-maz@kernel.org>
In-Reply-To: <20260919123150.3283606-4-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sun, 20 Sep 2026 15:42:32 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyeR8rSKToEuAy67iD-ZeWe65AWth2T7WWUKirTdfQURQ@mail.gmail.com>
X-Gm-Features: AcwNN1VvD-EPQpppZTjxhfK5ARJxwLQY5wTTc0-s8s8S86Iq_yKG8kGbEvu1UCc
Message-ID: <CA+EHjTyeR8rSKToEuAy67iD-ZeWe65AWth2T7WWUKirTdfQURQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] KVM: arm64: vgic-v5: Tidy-up programming of vpe
 descriptor address
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Steffen Eiden <seiden@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Sascha Bischoff <sascha.bischoff@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_074317_852350_9026BDA3 
X-CRM114-Status: GOOD (  18.12  )
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

On Sat, 19 Sept 2026 at 13:31, Marc Zyngier <maz@kernel.org> wrote:
>
> Assigning an address calculation to a vpe_entry is poor practice, and
> results in sparse moaning loudly. Tidy things up by computing the
> physical address as such, and performing the cpu_to_le64() on that.
>
> Whilst at it, simplify the computing of that address, avoiding the
> shifting back and forth, and kill the pointless GICV5_VPED_ADDR_SHIFT
> definition.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/vgic/vgic-v5-tables.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-v5-tables.c b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> index d7196ed5d1bfd..2c8d0f360506c 100644
> --- a/arch/arm64/kvm/vgic/vgic-v5-tables.c
> +++ b/arch/arm64/kvm/vgic/vgic-v5-tables.c
> @@ -63,7 +63,6 @@ static DEFINE_XARRAY(vm_info);
>  /* Virtual PE Table Entry */
>  #define GICV5_VPE_VALID                        BIT_ULL(0)
>  /* Note that there is no shift for the address by design. */
> -#define GICV5_VPED_ADDR_SHIFT          3ULL
>  #define GICV5_VPED_ADDR                        GENMASK_ULL(55, 3)
>
>  /* L2 Interrupt State Table Entry */
> @@ -725,7 +724,7 @@ int vgic_v5_vmte_alloc_vpe(struct kvm_vcpu *vcpu)
>         u32 vm_id = vgic_v5_vm_id(vcpu->kvm);
>         u16 vpe_id = vgic_v5_vpe_id(vcpu);
>         struct vgic_v5_vm_info *vmi;
> -       vpe_entry tmp, *vpet_base;
> +       vpe_entry *vpet_base;
>         void *vped;
>
>         /* Make sure we're not over what the hardware supports */
> @@ -751,10 +750,9 @@ int vgic_v5_vmte_alloc_vpe(struct kvm_vcpu *vcpu)
>         vped = (u8 *)vmi->vped_base +
>                 (size_t)vcpu->vcpu_idx * vmt_info->vped_size;
>
> -       tmp = FIELD_PREP(GICV5_VPED_ADDR, virt_to_phys(vped) >> GICV5_VPED_ADDR_SHIFT);
> -
>         scoped_guard(raw_spinlock_irqsave, &vgic_v5_irs_lock) {
> -               WRITE_ONCE(vpet_base[vpe_id], cpu_to_le64(tmp));
> +               phys_addr_t paddr = virt_to_phys(vped) & GICV5_VPED_ADDR;
> +               WRITE_ONCE(vpet_base[vpe_id], cpu_to_le64(paddr));
>                 vgic_v5_clean_inval(vpet_base + vpe_id, sizeof(vpe_entry));
>         }
>
> --
> 2.47.3
>

