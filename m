Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 237D2FD7077
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6mzT64VXH3MivX26oiQhB9+QkzJ07GHrjUFovA82Wg=; b=a6gy4urbHHwehhH2n3hzbAtbhH
	hz+reyBkjVFLGGz7oNKGvmKLfUMo9+zMAkGT3aVEIJUQmvRhJqJTgcBzD83am0nrq6uITSKF9wpSQ
	Oiqz8JSBbiXONYg02pKmJacSs8QUuVLEBTSiYqmgp83CfbRlInnPWGDoAEUJcQ2s2lv8eBbxa5jQx
	mupBNMkKZIU1QkOgBPUcvnnzXJWcp3Hw47rrLSRJAwNTcVsLHUQyMvxxbexesfhfXhgS+V5vl7K0B
	WedJWZkyPORq6V3QcDJEi8j6iRdjFbpMu2aH7E7qotP44KsFZuXSYwvOyyEiClhwpXCf3zRn5WdfK
	fQmhTsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rza-0000000642m-0oBs;
	Tue, 17 Mar 2026 10:49:42 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RzX-0000000642R-3IEy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:49:40 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-509062d829dso417611cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 03:49:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773744578; cv=none;
        d=google.com; s=arc-20240605;
        b=lWG7DqIcYecAKDsA6evqX6PHAl69EquxkiiSI7rg8LmDjk4Al/8WE9MLBpnX5m6fHI
         cePm+Ll+Q3hd8K8YdsQcQDPv6URefZWS8JBu2uUvAmiP0N914Zhw8UYj9VAG8WvLlXXj
         VoX5GNqlaI1PgF3VGmZQ8xwke/oGnhDA7tX9UjNc+p7vAYCabfYqVtRnvOfaEpAiBRrV
         6RyqxlZcknCZ0aTyS7z55hplHxxGhkJpqv4IlWOy456xia500XBNIACNK/SyBf7OgcwG
         bIZh6YkR6FX/UBViBy/0p7FCh1qakrJ57IQv7pKc9njOdVL/wksXjl18BK0psTaFSZ8z
         e4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J6mzT64VXH3MivX26oiQhB9+QkzJ07GHrjUFovA82Wg=;
        fh=Q69R2PCKQlnC9HspVG6n9UTiJDjjJ9QkjhOtpgnfpjU=;
        b=EpaZloVQJJuc9ewip2rZ9A32EljBWn8pO5HQyBTGOZHA6K6pa59+l1sztVXkLDSIIQ
         o9otA5RJkJAEyHWkVKFc4WxdZMMSBnVuQzSexeLBTOi1aANxMqPC5ZFjAO6PDO0YxtqO
         bW830ew5GYTnK64PiFcMKPqfbFnJueGqyoOBkLypxGkflrOJdHTns9uFTpmQ4zASpHFE
         K6mT+pQI4x2ZxBdKc+/58kCqnvNoXT3fHFXowQgq1DJrQ04+NSWiVGOTOyLOQSJ0YvlE
         s0fDVoCW2LWrfVFkPUlgqK46kvGkway578MChtbKR/KKs0EB0O2hrWOWf6qIoaxnsaPL
         uLfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773744578; x=1774349378; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J6mzT64VXH3MivX26oiQhB9+QkzJ07GHrjUFovA82Wg=;
        b=BW78FWgNJMcP4vWSI0aFPJd72tfKxev0FkEsNdKV2We0lV9j27ohACMLXZERg+BfP9
         MMoX2cgkKhhgHZqw4mWc97zlX62CmT+aEWR81Zvaxt72gRlJWRk3uNdyRpw8Vaj7hmQQ
         YL3Ef7atvuNr8zUvNiLnpSp9hjeWjtbzj7URQQUY01F+IYUjmpmVOmfdMiW4/0PxOFBU
         LAb3Nn+VD25h/aRbyhwcYAoacFYYB7GT3OJXxk2Rk/H2vQVByBpbvcBz6EoGQGTmUXe6
         KcgeHcGFWWuVulyc0P6PAp7t48bRtG96Awbv4EAaLuC8zFpypNyTRvnecT8iPiNBCWiu
         9tDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744578; x=1774349378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6mzT64VXH3MivX26oiQhB9+QkzJ07GHrjUFovA82Wg=;
        b=ZWTKgwzkDJESXWCedbXSmp8TqY8W0x4tGFSBVpl1HBoHd2Ln9mFdSntUArQNqMlhb+
         KpgUGIHZph68HSJYIeadGz9ENJMcSxCxH/+34H5m+2if7Yk+D8cweihqaUrSIh2ZEBna
         zqnrVMmi5RURP0dxhBg152vd9V8Sc42uuqFgAk3+xNYRWJjCnCeuHHN+XFQDLQ/BILuL
         RX2Hx5ktaIC0QQXxWc9k4ysqWVufyIdvck9BtCrp5nqcKuvQP/PCCpOsrMmrUDgZOtF7
         XNWZ3okMY+D5ufc9mEobWmD4yVHR/pbNYtQpFEYrQV1iIK0i0gdGArOQEJrmx9UuoxUg
         Yrfg==
X-Forwarded-Encrypted: i=1; AJvYcCWfKVYQ9FXBV3siHUgmmTAJR+Qjds3uNLTegLMnUIO1kUb2a9kMUV1ke8ne7EjVgXqu9YdWOIRegTzr884WT0ag@lists.infradead.org
X-Gm-Message-State: AOJu0YyL6F3WUEuzTkhgo2ZkdfGMx96YgZB0E1emntseirHZfEI4iTKV
	4Xe5fmLRMJ9sHN2Uu9aejhbeUhOrcxcdO7cryCC3LDXdQ65pDUqpk5vLF21OKkNo3XoTGTRXSB7
	7mly2SChcW0Gt3g4sMpfNTSXBvPNTzlGOJTQ3KD9a
X-Gm-Gg: ATEYQzzQeRBofvfkbN/M0csJRY8neY4V5taVw1f+bq2uyx8HQpZoo4E5LDW/Ixl2wkn
	1vYIQ4CA4CR9V5SK5Do81kmk9TFd+GYGhrcDXcbNGoWEVw/WrMpcqvDrvzGdgipHde5mI+Fv0LI
	nFWKa1oMZ/XrEEzlMP2Anc6mNrR9MTxVrINsYSLBVBEHTfUra0WJzkhr37ST7o4uW9zj1iqT+3r
	yqeOrHTrU5ZSYrhDIymLek7Og4xX9DHiOQ4foWhRkVAEaDWSCYkZ83EvweQQXjwxszyfxFQY1mm
	9TTX/V6B4kJNWt/ShVfx1p+7RSGzRdl22mHK
X-Received: by 2002:ac8:5844:0:b0:509:cd7:aa18 with SMTP id
 d75a77b69052e-50998d3b42cmr13986731cf.10.1773744577336; Tue, 17 Mar 2026
 03:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-5-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-5-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 10:49:00 +0000
X-Gm-Features: AaiRm52Mi80HGCc33K1nXVaGHpnEbr4dSt3naQacwu46MVSDK_PLdEJAbKhdcEY
Message-ID: <CA+EHjTyip-rjLK=XT4OVaOyGfv4E0-BSw5MJTb94_f3Q=7tPOQ@mail.gmail.com>
Subject: Re: [PATCH 04/17] KVM: arm64: Replace fault_is_perm with a helper
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_034939_840384_AB606E30 
X-CRM114-Status: GOOD (  23.21  )
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
> Carrying a boolean to indicate that a given fault is slightly odd,
> as this is a property of the fault itself, and we'd better avoid
> duplicating state.
>
> For this purpose, introduce a kvm_s2_fault_is_perm() predicate that
> can take a fault descriptor as a parameter. fault_is_perm is therefore
> dropped from kvm_s2_fault.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/mmu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 2a7128b8dd14f..1b32f2e6c3e61 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1711,8 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>  }
>
>  struct kvm_s2_fault {
> -       bool fault_is_perm;
> -
>         bool write_fault;
>         bool exec_fault;
>         bool writable;
> @@ -1732,6 +1730,11 @@ struct kvm_s2_fault {
>         vm_flags_t vm_flags;
>  };
>
> +static bool kvm_s2_fault_is_perm(const struct kvm_s2_fault_desc *s2fd)
> +{
> +       return kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> +}
> +
>  static int kvm_s2_fault_get_vma_info(const struct kvm_s2_fault_desc *s2fd,
>                                      struct kvm_s2_fault *fault)
>  {
> @@ -1888,7 +1891,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>         if (s2fd->nested)
>                 adjust_nested_exec_perms(kvm, s2fd->nested, &fault->prot);
>
> -       if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
> +       if (!kvm_s2_fault_is_perm(s2fd) && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
>                 /* Check the VMM hasn't introduced a new disallowed VMA */
>                 if (!fault->mte_allowed)
>                         return -EFAULT;
> @@ -1905,6 +1908,7 @@ static phys_addr_t get_ipa(const struct kvm_s2_fault *fault)
>  static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                             struct kvm_s2_fault *fault, void *memcache)
>  {
> +       bool fault_is_perm = kvm_s2_fault_is_perm(s2fd);
>         struct kvm *kvm = s2fd->vcpu->kvm;
>         struct kvm_pgtable *pgt;
>         int ret;
> @@ -1922,7 +1926,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>          */
>         if (fault->vma_pagesize == PAGE_SIZE &&
>             !(fault->force_pte || fault->s2_force_noncacheable)) {
> -               if (fault->fault_is_perm && fault->fault_granule > PAGE_SIZE) {
> +               if (fault_is_perm && fault->fault_granule > PAGE_SIZE) {
>                         fault->vma_pagesize = fault->fault_granule;
>                 } else {
>                         fault->vma_pagesize = transparent_hugepage_adjust(kvm, s2fd->memslot,
> @@ -1936,7 +1940,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>                 }
>         }
>
> -       if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
> +       if (!fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
>                 sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
>
>         /*
> @@ -1944,7 +1948,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>          * permissions only if fault->vma_pagesize equals fault->fault_granule. Otherwise,
>          * kvm_pgtable_stage2_map() should be called to change block size.
>          */
> -       if (fault->fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
> +       if (fault_is_perm && fault->vma_pagesize == fault->fault_granule) {
>                 /*
>                  * Drop the SW bits in favour of those stored in the
>                  * PTE, which will be preserved.
> @@ -1977,7 +1981,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>         bool write_fault = kvm_is_write_fault(s2fd->vcpu);
>         bool logging_active = memslot_is_logging(s2fd->memslot);
>         struct kvm_s2_fault fault = {
> -               .fault_is_perm = perm_fault,
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
>                 .prot = KVM_PGTABLE_PROT_R,
> --
> 2.47.3
>

