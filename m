Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC68D35697
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9Z1Zsbn42wkb2YuIVtSHH6QhaEUlzMyYP/oeZKV5XE=; b=Z6AK32yb5bRsFHVgutKUXsZXFB
	hu84N738a/96znUW6/ozu8GcBhNZTqq9sgzyCIvoje1tfrLqYKhlwK2XsoGRpZKxkoUILKrMot+W5
	aC9RPHg7okDRC48ztSbDlvsSxh1AkUqPXcBiky4w5f7U7cxRHWMG7tLL/skts1Vb6PNSdJul1+PON
	NEod5/rXPIOAJUSA9KXoOW8SJKzPWOhaRLviXSBonC/OuHLAVT9Kp+IMmCs0XO/AwJQLcXLd1GDCp
	ilJ8z0MKGWlTAXG2iuR4MxxRBvhiw7ZOzC2sLeucMDJaDGaOlDMZ79LjRw4EQ3KeluRYBXkhLwY6j
	BCf6QgJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2oU-0000000FpnV-3vb4;
	Wed, 28 Jan 2026 10:30:18 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2oT-0000000Fpn6-04qw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 10:30:18 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5033b0b6eabso286251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 02:30:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769596215; cv=none;
        d=google.com; s=arc-20240605;
        b=YOn5Pd0+NJArjw5iCJg7LV+uU3B0ntmGiV70q/ly5hP5alzdhcWaRnSFe2Xc4BEZ7r
         YLOKoeN7vv0J5Pic/KDSNuRQFxd4vA+w6JcNrv1sUsUU4L+bcy7+wHfIJ3d/njZYZX1U
         SgEva8cblPHWfQPu84p6E0+3bqFb3Tp9jUqh+peEdf9KXQjSr8RJ1Mv8G4fAPyFyBkMG
         a0WAPz8cQdYeWFwa5nrEV9TiwhcxKRqp+PAn9k1eOpIYazT1zlbKrIomP5993wVS2nvJ
         pqxWD1bLzrn57gFJw5dpLL299PCUxdlfGceNBKho0Tq85TQegBGtWbuBNq2RhK45VV2p
         9mSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Y9Z1Zsbn42wkb2YuIVtSHH6QhaEUlzMyYP/oeZKV5XE=;
        fh=XwA1otgGZY/9cg7YvtnhdDJKcBc4BvshJ2Q6BXobFO0=;
        b=bmT0z8jwqcye8PU4lCzi7ganmqLtHcYQS70DKmaUryGdZR9RI8XCaGBuj2ZzD7zIHv
         VSmgupAWD5P104HscdchXNuV0DMoeDkDamVLo1yhMpT3V4oEG1EA+HoIx0ysPLvmSW30
         03zyW6dKgXwDJ9b+Iv8o5fjLxQnsXh+u+csi2B/zaiArQeTmNrBs1dk+2LweQy485XmJ
         +FG2hsvc/ooeXkyFOCIenpTCR2KpenreOrooTH2XYFeuxywuIXgdpbfK3lwBztmgr4gP
         +KWSxwafzTeqR2E8wdWaJcIP8ygYgEe/I4rG7LNliLz1lnQ+jTLHoihGGkg9JYrDUQQv
         JphA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769596215; x=1770201015; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9Z1Zsbn42wkb2YuIVtSHH6QhaEUlzMyYP/oeZKV5XE=;
        b=mcCRAG1PFAv4oGNhzRM+Z+jq4XmEU1NDZZqubEbAyS3QTNoeHYuQu1wNf4a4VFiYaM
         7qd3S6ojajYYTG1PZbUCeo6FtDTGXZjMoHIeYH3EqXuZBAf8I0DY8jgRcr3YHy933xkA
         XE4w2WWOS0tqlaisVjteJ1PeJrSlktmmntv2ee2VPqQHpdo0vtWU09eeYD7UAJRsVptS
         LE5Axeedlt9VWz4XfFTU90yvLHxf6/STLOIGOovzpfl54cXe16zUbEWv9naziksSAIUH
         ULC30vVDUl8W2ISOv8TjPEU+Whn385xtNLE8k/cVX4L6CXIsNHM8nJjEU0BpLeRAqAiX
         hpiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769596215; x=1770201015;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9Z1Zsbn42wkb2YuIVtSHH6QhaEUlzMyYP/oeZKV5XE=;
        b=a3SqlhY80xGcK/cj1nobpVHkBD2/45gym4BsX1ZpnZMS9U+FzSIeTEtNELDo9AzNXP
         QPIwvjeKScOVT+UOgPkThNUBFheb/hpYqVZXEEZqWV7kiKZscttnslIywUhPgRQuMhuD
         1CWDHGVBUZfVnsyylSS4tJ6LOC0+cAUunWEIIR+vahYlnUEaN0AwurH8reEEUSpTlNv+
         GW0FL/Rnq5EanMS+Uzfz4hobpujdrkmTIW3MFd7scM9Jo0Br6xf837+5dDz2H5zqofLb
         plgIwEOB03ESAiLJ8ZtHsZ2CRi0TU8va2JFIvaVmsGOI7+SMBeDXXeL2J612u0DiixKO
         FbRg==
X-Forwarded-Encrypted: i=1; AJvYcCXnRzKarzKJXj2egKmKOUlvMed0ocOrqLGSXxvyGCm/7D1PEz8CT9wu1Z3o5iqA7a2fVefpuvf+CW+Zh1GmUtJ1@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbzceuv543ktPXKfluSzFZNwHY4s4ZnereaOZ/gj36rw9wgZNG
	YGDZ0C5vMVvcV8N/7IgdHD/1vliuNtyJ8KV60u6OiDi5NIY+lpfEXwEVNJMRQBOLlAtNGU2LJTf
	r9QFt2s957fph/DkmLNzWksi8K9B6Azj1JG5goDHC
X-Gm-Gg: AZuq6aJqIwo62iVo+MWHQwj5oe1B2nBtMz6SjIRIa0CSQ32vMKtzt2YwmrvfZUs1S3n
	9+vDRHOtEmR2tvLMoJjFyoxpPYeiiN+irGuyHiMRE3+ZjUsDu987PCEomU5NIi0lei1QSUo7ZrV
	n2LwVMsf0d7Q/Ypx7URvemhJ5SfOwupeXmxR4KovR42UN/1iVmuMiYSGhJ4uEMvy379gtAmq9SU
	4OFIr22cGya6VAoDi3+lsigm603YhG3SNEiATtWOlLa3En6hUFgiLpjPSJJLGlAr7v7I02umMh8
	/bSmQ60pj7VheoQxZ9gJsNUcjA==
X-Received: by 2002:ac8:5ac7:0:b0:501:4539:c81 with SMTP id
 d75a77b69052e-5032f43dbf4mr21936141cf.2.1769596215303; Wed, 28 Jan 2026
 02:30:15 -0800 (PST)
MIME-Version: 1.0
References: <20260119124629.2563-1-will@kernel.org> <20260119124629.2563-24-will@kernel.org>
In-Reply-To: <20260119124629.2563-24-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 28 Jan 2026 10:29:39 +0000
X-Gm-Features: AZwV_Qi7pHTo3Y8M1aEg6LuWOi1ah8-zNFvqwMSaz6TXSwn2G1ct6rX-MRXzzTw
Message-ID: <CA+EHjTyAkwN0yk_qJJoXC-p+M4Dje7oKZbhrS0RL2U9gVadWFQ@mail.gmail.com>
Subject: Re: [PATCH v2 23/35] KVM: arm64: Annotate guest donations with handle
 and gfn in host stage-2
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_023017_071518_008AE9B7 
X-CRM114-Status: GOOD (  17.94  )
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

On Mon, 19 Jan 2026 at 12:48, Will Deacon <will@kernel.org> wrote:
>
> Handling host kernel faults arising from accesses to donated guest
> memory will require an rmap-like mechanism to identify the guest mapping
> of the faulting page.
>
> Extend the page donation logic to encode the guest handle and gfn
> alongside the owner information in the host stage-2 pte.
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index e090252d38a8..f4638fe9d77a 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -590,7 +590,6 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
>                 if (!ret)
>                         __host_update_page_state(addr, size, PKVM_PAGE_OWNED);
>                 break;
> -       case PKVM_ID_GUEST:
>         case PKVM_ID_HYP:
>                 ret = host_stage2_set_owner_metadata_locked(addr, size,
>                                                             owner_id, 0);
> @@ -600,6 +599,20 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
>         return ret;
>  }
>
> +#define KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK   GENMASK(15, 0)
> +/* We need 40 bits for the GFN to cover a 52-bit IPA with 4k pages and LPA2 */
> +#define KVM_HOST_PTE_OWNER_GUEST_GFN_MASK      GENMASK(55, 16)
> +static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
> +{
> +       pkvm_handle_t handle = vm->kvm.arch.pkvm.handle;
> +
> +       BUILD_BUG_ON((pkvm_handle_t)-1 > KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK);
> +       WARN_ON(!FIELD_FIT(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, gfn));
> +
> +       return FIELD_PREP(KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK, handle) |
> +              FIELD_PREP(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, gfn);
> +}
> +
>  static bool host_stage2_force_pte_cb(u64 addr, u64 end, enum kvm_pgtable_prot prot)
>  {
>         /*
> @@ -1133,6 +1146,7 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>         struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
>         u64 phys = hyp_pfn_to_phys(pfn);
>         u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 meta;
>         int ret;
>
>         host_lock_component();
> @@ -1146,7 +1160,9 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>         if (ret)
>                 goto unlock;
>
> -       WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_GUEST));
> +       meta = host_stage2_encode_gfn_meta(vm, gfn);
> +       WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
> +                                                     PKVM_ID_GUEST, meta));
>         WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
>                                        pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
>                                        &vcpu->vcpu.arch.pkvm_memcache, 0));
> --
> 2.52.0.457.g6b5491de43-goog
>

