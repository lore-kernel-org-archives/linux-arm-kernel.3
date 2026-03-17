Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F91FD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIinQPgAdcS1WMa58LwQX+0utCWCpOx/mVW8onE7nR4=; b=oOuxIqFuKIHLhGBUviq4OVvKNh
	5m72AE/RNi0fYn2hui9C4XJFOGcVKurUef2MlZvPrb/bnXCq6yADYkiIBdm7WnCosI8tnESwi+NR1
	2sET7sOskMVjnr6vneifBt1a8TkiJeCQBbcpdslZpFnJS+WjF8UETonUE4dXt8cBs+0lbwn3Bf7ri
	pxOqob/mn3Pgo8eIHb4RSJ75eS6c4ZQOGfH1N8ilN26nttojU0F5+7NlUJUWC16RlaJqPGgibHg3h
	WHXYuwCCI4hywELWDkOad91zj/Kt2Kx/LzplmTKQgprZHB3musb7EwkdWdkGoxz6kfwmxzRDqm/3G
	2EwjWIHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SUT-000000067Ko-43HU;
	Tue, 17 Mar 2026 11:21:37 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SUR-000000067K9-0ARd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:21:36 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-509062d829dso433581cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 04:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773746494; cv=none;
        d=google.com; s=arc-20240605;
        b=WTwq92ZEKrQT8QZvu1qfp4BIihjDmZQr0xv+anztGeOmo6LrVfxy8Tl1kQ61E13Qsv
         PGxTCRhbqA3ofIb80h6kxKVwybSnHQFEeHfsjJmEmKgRESrpRapDB70GDX/myoWhZH2x
         huJs5Pi6sRlVet7Kqi4QvAqttGyCfrnjY4a3t+P+XkL7Y9Zni4mmzsgEWQB6sh7beecW
         S04mID6ldqyq5LzVMymHIpx8Cu3cg+1lEYI5okieh0I7GrDVyT9/mFVD3DyURjCqC56g
         ueEWRWDKNt1aT9sSeSzv/uElk8AeWi8Mbm5cZg4e3w3m8ZIELz595r0kX63lrC0+PybM
         jLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IIinQPgAdcS1WMa58LwQX+0utCWCpOx/mVW8onE7nR4=;
        fh=QGjZJ+5bab6yvEW8NpNcaVHIKoUmf+eeLmpBgYueM5w=;
        b=Xp/5D6pM3f5gjldBPRK/g/dX1oi0WlIgWqriKV0DGHYiUM0jV+zyYUsx5ZqrfsnhVD
         YbfG5e9+LKJe+t1/4IcgadNKYxJtYRaDmlBmh1c0SEVG/knE9MNhq8DhMNk5/fgCicXk
         wJWmXDmUM+uux23izO0kGCVa2NYeI6SHwa3yY2GMRylZBZbOk+x/ib6L0gS7EkIVjfKJ
         qZp3xM5e1W7rYOa2WIuAhXiTe/u/HOma7FDahsn0rBEbtdxuLUs5D1YQCXBfae4UHNF/
         Fyd7hTKXfRm4502yr9ANpScyCR1/GzU3JqZ8PqVrs4vBkZwLyF4I2iRkEk1Xc3/r7X1U
         Rp+g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773746494; x=1774351294; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIinQPgAdcS1WMa58LwQX+0utCWCpOx/mVW8onE7nR4=;
        b=qlZpLryRLkjqeCrvYm1mjJPQeF8zQYejM+0ir5au/b5Cgk5JPvC0trEUjEiGH4uuvb
         MMumxTharULAIFHmzB34F/ui1CPc67GhDVDn7YP/p0NZX/Js3g2d6uVQMwz+k94m4c11
         nbRaT95e+PvGE98DQcf5VZEYwdVH8vbq3MeJ6WDV894y2zGZqzZzWsPz6hs3soEytU/C
         qsUZjDKti16zOAKb3OlgtoSv9ue9QTxMqsIg3LDcDq35RzMiTgtHPNyBVGD1RE4rhwkO
         8g9EEDppL/Bhz0VTaDNNgHNdrMQwpMuTJcdILqYUt/M8/P1oNlagERaWqNxIRMGj4qGs
         SVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773746494; x=1774351294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIinQPgAdcS1WMa58LwQX+0utCWCpOx/mVW8onE7nR4=;
        b=oEQ6kbKLQcGTJLoOxAxraO757tZluUb13Yc8pDEnFkcPZKnzPQX75sEsNzTfiz/9Fa
         8whXUiZOZCjmSTlKvT1ztcOf0jihy7vt074HZkb11k4NZeKFD91j9XmkpoKy8ddz+p11
         bQSZBkxHRKbCmSjBBboMI/PquM2Rxg8cN0Of9AfVqVSy6chywMJvDCwfwvZgsJbSP75t
         wR/M3XESq/h/OkBWsoB+ftayuJz+6ERs7Yx4K4inhx9LvshAhglxEyvOgbSLSIZYCljJ
         80Xk/Bp0Y37V0A6y+lmf6SFSA1wd+d8meLS8v58A2ejjO1OXUJ/dgDEWfkwbSfFL6vE3
         9W8w==
X-Forwarded-Encrypted: i=1; AJvYcCVNVFkl5/F4kj0hOWszqkY05JkVvXwEw9kgyb/pbBK3xqrDGSUHogxnVdY3IhUB/gP9OUBsFXy/Hz73BDUMwMU+@lists.infradead.org
X-Gm-Message-State: AOJu0YwJiZtjobzfPbdQBuK1bOqK5adDpK7+FtN69NS6A/9JxYU8vx1K
	9g2r0mHcrU/7sqPjj1MmGGPUMGAa4lS9Qh4TZCAKAoR/ij8JQdGJB/gsz/bp7glL4NafS2PUVnp
	l8oM0sRju3kG0NWxtWq2bfOnGJ+pSpulSC3Lj6XGI
X-Gm-Gg: ATEYQzzKcfQUM+DMxglI+oBFFSoRYkJmzjxoh1rFHEG7e8ZgDtw2iXtfCdzOLSrL6BH
	APFwZBMNGXrT+H/CV9Chve/yyQ0oNPgcE9bXYw/VpkYCu4CJnFC7EVuI+sx+GzxK9mwFsZHUM2n
	uDPG9lKjyXtN/hyLNCAj4g1yq0IsQciZRei9EYHpYcWPZvgWSYK+Pulb/xFMcUxqae1REvcMQ32
	H10BbOZbpBkumkN089no5em16ZQgGaAEy98qNCH1+TKFTfuq4O+inJLQ7gbK9uAPSQLD90F+5+1
	oytkxa7IZwWovFallGWheocyi2uCZaQ0ffM2TGBUKqPf9N0=
X-Received: by 2002:a05:622a:3cb:b0:509:2cd4:b705 with SMTP id
 d75a77b69052e-50998c18cb5mr14530571cf.4.1773746493105; Tue, 17 Mar 2026
 04:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-7-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-7-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 11:20:56 +0000
X-Gm-Features: AaiRm53-qbf4XI9ulNB_-iuJQm1ePeG7PGYgglAHC_yoHQxA9dWx5fdfSL94zik
Message-ID: <CA+EHjTzeqdkn9wawGRo7pT6px8nmjByxYVcvawCFhC=LWm8nOQ@mail.gmail.com>
Subject: Re: [PATCH 06/17] KVM: arm64: Kill write_fault from kvm_s2_fault
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_042135_152692_D73F498A 
X-CRM114-Status: GOOD (  20.51  )
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

On Mon, 16 Mar 2026 at 17:55, Marc Zyngier <maz@kernel.org> wrote:
>
> We already have kvm_is_write_fault() as a predicate indicating
> a S2 fault on a write, and we're better off just using that instead
> of duplicating the state.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/mmu.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 12c2f0aeaae4c..86950acbd7e6b 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1711,7 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>  }
>
>  struct kvm_s2_fault {
> -       bool write_fault;
>         bool exec_fault;
>         bool writable;
>         bool topup_memcache;
> @@ -1799,7 +1798,7 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
>                 return ret;
>
>         fault->pfn = __kvm_faultin_pfn(s2fd->memslot, get_canonical_gfn(s2fd, fault),
> -                                      fault->write_fault ? FOLL_WRITE : 0,
> +                                      kvm_is_write_fault(s2fd->vcpu) ? FOLL_WRITE : 0,
>                                        &fault->writable, &fault->page);
>         if (unlikely(is_error_noslot_pfn(fault->pfn))) {
>                 if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
> @@ -1850,7 +1849,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                          */
>                         fault->s2_force_noncacheable = true;
>                 }
> -       } else if (fault->logging_active && !fault->write_fault) {
> +       } else if (fault->logging_active && !kvm_is_write_fault(s2fd->vcpu)) {
>                 /*
>                  * Only actually map the page as writable if this was a write
>                  * fault.
> @@ -1980,21 +1979,17 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> -       bool write_fault = kvm_is_write_fault(s2fd->vcpu);
>         bool logging_active = memslot_is_logging(s2fd->memslot);
>         struct kvm_s2_fault fault = {
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
>                 .prot = KVM_PGTABLE_PROT_R,
> -               .write_fault = write_fault,
>                 .exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
> -               .topup_memcache = !perm_fault || (logging_active && write_fault),
> +               .topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
>         };
>         void *memcache;
>         int ret;
>
> -       VM_WARN_ON_ONCE(fault.write_fault && fault.exec_fault);
> -

We can't hit this warning anyway.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>         /*
>          * Permission faults just need to update the existing leaf entry,
>          * and so normally don't require allocations from the memcache. The
> --
> 2.47.3
>

