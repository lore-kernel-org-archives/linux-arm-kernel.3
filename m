Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41CCCE9D70
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4VV8FamiqOwZAM5+PYXtFxVyVObmz3z5a4+8kZS6YUk=; b=MlJyK05VD/0ATUzjPPxlPNzTTq
	6MyhDko2glTxuHxWC2nSDIRQjNhZjbHwG2y4MTDta1WPHaKuthLYw4kYpZEhWEbuZXRxsHJY2rTVG
	DQBQxxYiV91gT7DQW6wANDumPEblxojgsjf+swnY6MW5gp0tON9qDGUS9UJK6MBJNpHy6VBU5iK34
	PtKopF+duL7LYUR7riK7k80l/6aVn3xBXSPAnu1jD3Z3xiimcGhEU0VRrNgIctB6JVsmrPjb8D6UD
	here4NkE9Wwurg4uBvBMBzkXPs/ceBpshHepKD6yClXH5k3FAeNXjz3Mq6TnGKW7HrbUL2Tc3QADm
	YLY/QWPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9Vb-0000000DSJ3-1IvV;
	Tue, 06 Jan 2026 16:02:11 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9VY-0000000DSH5-2Gkv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:02:09 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4ee147baf7bso472491cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:02:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767715326; cv=none;
        d=google.com; s=arc-20240605;
        b=lUeBnJZ0zppx4P8mduxd83g0vGw+g4o0bvm7BI2Cm68KMqg6ddurGsNvfbGbP2REvX
         Zhr2SqEN5sLHXM8f/nFjYRGg9NKbkKaY+MNiVYOPylbdPlvM1YnigYfVYTDOuTqFX8kq
         sIlW/xuuiUYhRgeO73VtPydo4HplzmrZ7DUIZmYGdOlQupHsEjrkW+M1wkT74ZSo1VWy
         N3fwdnJpxRC5DQer9fi/ueEymtacYU26l3Y02RvenhQVlKrSosOz5YuOaDdcjLolQYS3
         l9gbZ/X5xMCyhtYdpkWkY6JZJPDDRjAUCymmsvsRqB0LjdM6O9dCIsBoo/e1xQrLPDtL
         tBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4VV8FamiqOwZAM5+PYXtFxVyVObmz3z5a4+8kZS6YUk=;
        fh=8wx8g99qgsThdtyMn4wNaoR3vV6MbLfaQjP2VgEPuuE=;
        b=Q2JoD6KZfuDfcyoCtT7TkuLBbwNGvIbbd0CsJ/zw5lk5ctt9TjAwVCN2265y484F+K
         Dn5StIpJrADS0zkyS+jBa6B2qCPvWFtnAQCaq0HB6Nn3QGr4DybZphhHjL/cTutZ9O3p
         k1utNDGaGUnMTu6FM7OI/ZEV2zNfDAN+CsoDDZ7iFDALRMAS6DZyTbGiq92+B6cDEz7s
         znuLsOgRggXZYD+CkAqfnfeI8RiuT9Xl86Etua32EnRWL6Ml4GjJj4XOAafYJp6D1U+h
         6K0nB2T/6XH+dYiT7o3f3IrvdsvGFhWxgNLDTrF1kw3wEG4g9EylzTcMysYn1T5W/IUJ
         WaDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767715326; x=1768320126; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4VV8FamiqOwZAM5+PYXtFxVyVObmz3z5a4+8kZS6YUk=;
        b=bQEmpGZRzxfW3veU/DjGUJUpFxhMVF6sWOOByhsTXo8plthiJBcvw8R2+b1+XFQLjb
         m4tejswMYFYFaI02nLzC7MR+EV6BCoMauyphZnee2unx/QLQJL85se/LAqbnCJlO1qXK
         uoKKfT7FY+5stZvvssxfGWcAvfM/ZraHWxfPmaNW5QHv/KhqwzQKLX0PV85JBOIUdCH7
         HQbA5mSTGUlZWNZxQEhBE+4z6k60KLGhpiG6g+/QpJWxmW5HPKJpdJfitXk94yOGw+MF
         xmkwx+H2Q3GyDT0sehHZIAzNwXZnA4OsvIwa+pMPgzRQpx9xZqFcx8I6zi71w/OzpQ2d
         Lvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767715326; x=1768320126;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VV8FamiqOwZAM5+PYXtFxVyVObmz3z5a4+8kZS6YUk=;
        b=DP7CFx+kVYenjpplqrZ/m0zEHIizOB0FzsIEOBiZuJtjOUa0LYTjjuak8va+PXsP08
         W1C0ksVQb8crM1KcVyznq5Mk8tsw8U1rEXTgYh8Ve9bNdvvt0ip1FLbxbH92j6Qn1cn9
         b/spqNX25GEJx79I5SucS3mY2cM76+NoJC543tujlZy4yKjvDjPriw8eAl7/KPajrqzA
         9pjPDMOnOe2mt0lk0MoHgkNfYl8QkbfkCoa4d7KzWi1L9EUfmxt/defGVSwnPuNNRYo6
         auPujLLn6nNPUzoPpW2yHPwJjk01sKbWX7kbvx2sJAtNUolBA8Zu0SQCAhYeeA9lL4OS
         SmhA==
X-Forwarded-Encrypted: i=1; AJvYcCUFL9dSDJShxEAHGvarxjhLUEuWvR2/9/YCXEl3QPQL3C8lZoBB8E+Dzg/8zt0w5tKiWqmFivxcfSRme0pdZX28@lists.infradead.org
X-Gm-Message-State: AOJu0YwS/juaJS439yQuGBc7qFCe809aAv0dyb0e61om9yCzFMyhW36h
	Beh3AsSncXhfBC80IN0slTXgC8dHQ8YsAiFi78xJjm9YFSHPWE0wWu4yBEJpqfZ6MPX8lduO+sy
	/BOC3koqy0JSbI2VpjQifMUTmvTAWz6BsWV3nW2jp
X-Gm-Gg: AY/fxX4oJtJR0qVGpHGesEtLETXW1ZHP+3lekS4Fq7ptaeh0HzrMTX82uj4c3yKJlws
	OlQmI0gFVzxSKzSFdZ+CQZeXCJCD90jSwVkBQrj8MPvpnna5oEdG1GxU7wujl/ENdhPcwyBkmN6
	qoNT+tmg/XNW4ZT5nR5wimwC6JGjmfHsn1S9nsXi9fz97gv6Pj4fZVR3NAbxiamlURxjg9aQ0yU
	ji5HlcE/E3q62Zn290aElES2yPtFcSEze/WTnojBL9jszLfm7GDRIYqUw17c45J8xoSetuD
X-Google-Smtp-Source: AGHT+IHxG68k4H7QxOCqcUestNOdt2ymq6k/B9L/EOR9jHs12J8OklAbo9pVNZdm2PJbf3+p7kEjNGC1B4QDwRgIwpM=
X-Received: by 2002:a05:622a:355:b0:4f1:9c3f:2845 with SMTP id
 d75a77b69052e-4ffa96218abmr6005851cf.9.1767715325130; Tue, 06 Jan 2026
 08:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20260105154939.11041-1-will@kernel.org> <20260105154939.11041-20-will@kernel.org>
In-Reply-To: <20260105154939.11041-20-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 6 Jan 2026 16:01:28 +0000
X-Gm-Features: AQt7F2p9bIGiuS3iUUJfep_yOAaw5pVkKkYP_KCrIopHGcAfqqtRaJGG_En4JyE
Message-ID: <CA+EHjTzNcTOR5sZpBTUXUP++yqOZEvmfs=S3wqBTG-YT=hxoKQ@mail.gmail.com>
Subject: Re: [PATCH 19/30] KVM: arm64: Annotate guest donations with handle
 and gfn in host stage-2
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_080208_689974_EF7E89D5 
X-CRM114-Status: GOOD (  19.10  )
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

Hi Will,

On Mon, 5 Jan 2026 at 15:50, Will Deacon <will@kernel.org> wrote:
>
> Handling host kernel faults arising from accesses to donated guest
> memory will require an rmap-like mechanism to identify the guest mapping
> of the faulting page.
>
> Extend the page donation logic to encode the guest handle and gfn
> alongside the owner information in the host stage-2 pte.
>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 7d1844e2888d..1a341337b272 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -1063,6 +1063,19 @@ static void hyp_poison_page(phys_addr_t phys)
>         hyp_fixmap_unmap();
>  }
>
> +#define KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK GENMASK(15, 0)
> +#define KVM_HOST_INVALID_PTE_GUEST_GFN_MASK    GENMASK(56, 16)
> +static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
> +{
> +       pkvm_handle_t handle = vm->kvm.arch.pkvm.handle;
> +
> +       WARN_ON(!FIELD_FIT(KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK, handle));

Instead of (or in addition to) this check, should we also have a
compile time check to ensure that the handle fits? We have
KVM_MAX_PVMS and HANDLE_OFFSET, albeit HANDLE_OFFSET, so we can
calculate whether it fits.

Cheers,
/fuad

> +       WARN_ON(!FIELD_FIT(KVM_HOST_INVALID_PTE_GUEST_GFN_MASK, gfn));
> +
> +       return FIELD_PREP(KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK, handle) |
> +              FIELD_PREP(KVM_HOST_INVALID_PTE_GUEST_GFN_MASK, gfn);
> +}
> +
>  int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
>  {
>         u64 ipa = hyp_pfn_to_phys(gfn);
> @@ -1105,6 +1118,7 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
>         struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
>         u64 phys = hyp_pfn_to_phys(pfn);
>         u64 ipa = hyp_pfn_to_phys(gfn);
> +       u64 meta;
>         int ret;
>
>         host_lock_component();
> @@ -1118,7 +1132,9 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
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
> 2.52.0.351.gbe84eed79e-goog
>

