Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6465BFD876A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX31OwUIyuVCce6a2uEpCU7DTCt/xoQQWL99r13ot9g=; b=RRJesSsXbNLpVXWzC2QOD2M/QJ
	V07wHklJLowcYoPJeLoKWs1Q1YZ1WBXFZEeFdgH3Bl9eSQTCpFzs+aJFIH86Y5nSMOCkB4oe2VWSv
	hh+ADfEVyhll3VkA5qtsuJTOaV5BVFcQ1MnUpSNyDDPQbdvp7sNhf0BXXtr87g+g1qtT+RLPzEAiI
	fMoVLWaxld/6fvhZNMZ3begpvEd40b1OzN4PNNy8njTQ+hvVdYxV48dyJ8AcXysetobqIWO8u31y8
	YVO+ouv373dqEPim0Zpu3J96KwY7AhqaZqg1iwieQ0CC2c5oVXeoMfACc0C1HG2dL+a378JU6c8Oy
	JhYSAgeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UP8-00000006Q8y-2jEr;
	Tue, 17 Mar 2026 13:24:14 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UP6-00000006Q7E-1BUI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:24:13 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-509062d829dso493751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 06:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773753851; cv=none;
        d=google.com; s=arc-20240605;
        b=LKY9+GO42YciBSF4nqi7QUQWMnSsBt433gkK6d0dvPNatmuWYuV445HMtmsp42E7vf
         i+lci8IIyhM3vpVPjFHRECp3W4KA4F+8fRs6r52zkIdSbkCnVv8ICPMypPNJgtvv3qZW
         uEeyQ55cnZ0JAtUZ9S7onfaEibTy8recM9zAl37Z/hqIHRfl59iBVXjBKPRIXQRCR5pk
         IdB3/o1vdlAC7ykpADz+5Ttg9ZDVg/HBRhrf7O9sSMoo0wKCtjRI/TxhoziY8Np9Qloe
         85yC/7En4sI+RrM0LU2nqW5ZFb4cOawhI5PN3e9OtP8geZCz+Ka6gPpBbrpZFjIQ6L6M
         Slfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pX31OwUIyuVCce6a2uEpCU7DTCt/xoQQWL99r13ot9g=;
        fh=nVq9UOt6gd4YT8bEnjEsymL/iSt52xNxvOCMacbNTPE=;
        b=V4ClLLcn+hSNtjQvp2sjfbT1rDhFdEX70QHrF3N093ZbXWKF+tZ5njanI69ipLgmoG
         6/VZ/ZUuHpm6wuP1Gtj9dBH5c5T68wZo9YdsuWLpCODuxGzgaiqKGCIf7WMvCdqGQ7ws
         qOymPzASnc23MwOxCtBDDnlUobsVx7U58xLouq2VP7TQwI+TpsTBCuro2iKJveU7/FhC
         PVu+DeTCKTIFTNlAwoB5uCtsOcL00DynnRBS9PXYrCj5/gU9lQvBtfKYFJvsYV7LTACC
         pY+qhxUHy7lWdzytXK3qY/crlZA9/Tr7BdbuhOJNoV6obiU4kTa8RiRVwC5v5EZa31m3
         8aZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773753851; x=1774358651; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pX31OwUIyuVCce6a2uEpCU7DTCt/xoQQWL99r13ot9g=;
        b=cQrhcNuWvqbOdxuqNISoyvCCcol7uu4wA0N5712imdwG+nZb8Ygip1B+TwqfRhnX6Y
         jtcO4WkLStJ+gDL4QVmjp96HpflPtUPyB2w/d9CE9Sgxjx0JhqdAfhPPrCd5MWR+fWsb
         hbPK0biWY5aHAeyu4UzALZ1pGSoU1TCs73MvhiShjua8BoRrFtk6rUm3C3dM2Wt9s+A0
         JHJlBwCMl9l0WB+DZHbc0REAi6jkjYG8FCu5lLXTcunupVVtE36qzMFvBQc0f2/ENrYL
         PajBugKSqq4bOZGeJibyc5GoTXHxEZlwOVqtsFfsEWPixFUMP5nJqZStgn2B/Ce6MA3X
         iKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753851; x=1774358651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX31OwUIyuVCce6a2uEpCU7DTCt/xoQQWL99r13ot9g=;
        b=HI8csgopyhZrV/3NNu+88vi4jkQ/I5z8TptnXflNUUvPu7E6fBSm0oDMIuKVbFNSaY
         KWc/z0Slte+FLxV753xVCPFXXbxqBzov2YJjfOTE3gCg4B7rnrEEA8ufreH2vUJdH3Gy
         yGN9UEJDXPWth3L+b+oT48xPsDkKjTeGhGilrj0/eovcXU8OXcV75mf3el1ezuJEwOXT
         dk4njwC4LdLuRE3JsS191iueII/jl+h+2ki4eGpvm/lzUBYTQA7FI7zvqLAQ42mdm7tA
         MvzGyxvbM6o+EPeY0bjZbVLMTSDMi3iw6FQWF6DxQEtiQTSUpiRgasTI57TIwAy6bshZ
         daWA==
X-Forwarded-Encrypted: i=1; AJvYcCWbg4kd3dq7ki2UlG9E2rRwdUa8h9rdmCQHCVP5nOdr/SeZT2bgQpaZDYHm/lY+Liqcx/Qo/SH8iE+61BnjGgyg@lists.infradead.org
X-Gm-Message-State: AOJu0YxnHtfEA6cpGcja+R9B1UyAD13jteSgcjlEyr8CfWsNuo1lAirV
	hmshOIuXzyF/8BhWNQnKO2TOMKHlidQ6ygSKtBywwujJa2vZJzrJQYKpzxWNhZytxkgfnuJ+dCM
	mqkJeRXksVeblsWzstKetG5N7THIlv+jXPVSyIptJBv96H2El/coa0JcV9OE=
X-Gm-Gg: ATEYQzyy7vYnInk/qVkzLF4KyaIyygeu/4eBQ7Lom6H9CWknAOCLJB0NasQogHP/s3c
	M627DTN/nWVIfpMA95vFgmNOBPjKUoESuUmnw2Byw1B7ourPNI7qKbQYLlM+WSyPo60x6o0arPS
	a9XEnvhGX6m9xoKuNQLqwwL0FbvTg3rLoK5bURigt7CvAUaUzqqCexbW9oro631qm+5lcAbpYUi
	kkcO5EcrInYtGlkFFt2f/0uQuuUE8FbLK8gL/U+j0UXdeMOqQzVVFSgUMeyQQkR7lDHTdTqh2DJ
	0Ot7Av7e0U7KFlxxakTZH2RLBWiiG12E1Meh
X-Received: by 2002:a05:622a:24c:b0:506:9852:75ec with SMTP id
 d75a77b69052e-5099ae29b28mr12044891cf.9.1773753850487; Tue, 17 Mar 2026
 06:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-11-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-11-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 13:23:33 +0000
X-Gm-Features: AaiRm50svmLd2fOL3HEMdNHFWE1EGdezYZCVO4BVpI417FT7gO8t2CTdtHg6I-k
Message-ID: <CA+EHjTzO4GNzoHM-t9PhpX+4TgFqis4gqnDXrKyu_q=DUiL8Pw@mail.gmail.com>
Subject: Re: [PATCH 10/17] KVM: arm64: Kill logging_active from kvm_s2_fault
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_062412_335876_6433F853 
X-CRM114-Status: GOOD (  21.03  )
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
> There are only two spots where we evaluate whether logging is
> active. Replace the boolean with calls to the relevant helper.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/arm64/kvm/mmu.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index a5b0dd41560f6..caa5bedc79e19 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1723,7 +1723,6 @@ struct kvm_s2_fault {
>         bool writable;
>         bool s2_force_noncacheable;
>         kvm_pfn_t pfn;
> -       bool logging_active;
>         bool force_pte;
>         enum kvm_pgtable_prot prot;
>         struct page *page;
> @@ -1853,7 +1852,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                          */
>                         fault->s2_force_noncacheable = true;
>                 }
> -       } else if (fault->logging_active && !kvm_is_write_fault(s2fd->vcpu)) {
> +       } else if (memslot_is_logging(s2fd->memslot) && !kvm_is_write_fault(s2fd->vcpu)) {
>                 /*
>                  * Only actually map the page as writable if this was a write
>                  * fault.
> @@ -1985,11 +1984,9 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
>  static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>  {
>         bool perm_fault = kvm_vcpu_trap_is_permission_fault(s2fd->vcpu);
> -       bool logging_active = memslot_is_logging(s2fd->memslot);
>         struct kvm_s2_fault_vma_info s2vi = {};
>         struct kvm_s2_fault fault = {
> -               .logging_active = logging_active,
> -               .force_pte = logging_active,
> +               .force_pte = memslot_is_logging(s2fd->memslot),
>                 .prot = KVM_PGTABLE_PROT_R,
>         };
>         void *memcache;
> @@ -2001,7 +1998,8 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>          * only exception to this is when dirty logging is enabled at runtime
>          * and a write fault needs to collapse a block entry into a table.
>          */
> -       if (!perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu))) {
> +       if (!perm_fault || (memslot_is_logging(s2fd->memslot) &&
> +                           kvm_is_write_fault(s2fd->vcpu))) {
>                 ret = prepare_mmu_memcache(s2fd->vcpu, true, &memcache);
>                 if (ret)
>                         return ret;
> --
> 2.47.3
>

