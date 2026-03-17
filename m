Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150E7FD8741
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 11:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSP+5ZiGrT8VoG2czM5Q9RwvJ6j1xtoayCufilySkAw=; b=Tgebwm2NNn/h6EtOXX+kny09/R
	y8952X4P9xrGd8r6EdS+nHSagtWPSw2z5AFCRDGeo0RA81nfISmvRQAEoGZ0XAj0/+HYxOeI+vUAL
	MVyHW2+DsvLBZZbDVpDf2uitj18KgU9xxSfHaNNrW4kDn8J+wwTpCQZaiJ2lXZiRS53tieYCa8KP3
	CB+SYsixBUoktQ38KUG0/B8dy81UuRwMYXPCiMpxlM6zLuzC8cc8zdSyLkBgmW6/9CN4A/7J5k7j0
	g2mqA5w1KPoAUrayKT0aMZiiotVL9mr8EFeItNGa3/yfqhTcrmsiS985hM3J4SxuVdu1VhaMjcquQ
	Wk2caF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SrP-00000006Bo9-44F5;
	Tue, 17 Mar 2026 11:45:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SrN-00000006BnS-3tJw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 17 Mar 2026 11:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mSP+5ZiGrT8VoG2czM5Q9RwvJ6j1xtoayCufilySkAw=; b=n2qukco7rBm00JEOeEf0Bt7Na4
	xSrMP09L5yNb2aCTRcDUhXsi0U5eaCyrNS0xP/k8ZXZGHMXzL0nbDwFTLJsxQD4T+w6ApzNNbsIL4
	bkv0lz72zWKBuSRB4u+mB9MxSndmuhciA5uq6U0PpEWEB8LmEEppLXIbeS+1Y+hxe/NYh5FHWqvqd
	yUpQWfo3p6aec8qi6C3EfyIU3tHMX1CjKSOSBtK03Av7VNpNC1drpK1B+0a2vHKbt/2fzsgnwc5lH
	Cr+iGy+v2XcWgVAM5ETaDY+fEVBqnpWYSL9Mrdup7Tl1BQg3rJx0BaLYguyr8/ZB3bEvQ2BHyBlD0
	3yAMuNtg==;
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SrK-00000008rrw-3bCO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 11:45:16 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-5091ed02c54so365481cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 04:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773747912; cv=none;
        d=google.com; s=arc-20240605;
        b=k3Fm5zqyFZoQhHz61lWLt+yBDA95NrMN+YBWepPxV6CyZf8Ny1YZ7btItn+Xth9u/P
         7qwy4wi7KhW1DewezmsxzgZC7UdWUWU4wEmNJ0InU3VTZfE1Qoi3zNTqZ7buOkZdZptN
         rNRPrmAMi2dN2jtFF87IbsdDNijKg9yf1ZLAz97h0JZsLMr2EvsnUZvCIxDQ2G/qnZVJ
         ikdPT1lfGISjmu8Uc/frjSXIUSr8E0PSy7WqYhm4Abeeeji0k+Fo1BL0HxrNMzVffvWW
         HekwBty9JnozAk9TT8ueq6c3Ku832zJkedPwYNKg4UBJNmxZO1RY7c1r0eunW9fO3x6U
         mwXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mSP+5ZiGrT8VoG2czM5Q9RwvJ6j1xtoayCufilySkAw=;
        fh=Jq+rcIRmXdGobFUVGRL65Uzs5KIxzwY+Rqia9HjA4Ug=;
        b=R9atVWBO4fxYvgZDpG3rRTWJAuN3crFi5u7UIbvNcJgN4csfHR8gagsH3QwPEjquAM
         F/T81h0WcPyJTzaYR1TydsGIanUYROM1QuESg1ADUhMbLJcA8RhOLuExd0oHg89Tcqvq
         u59k2JYdntuqaSFrfvEx1DEREeHAYJp1ahgn3fEVe+svq2i3AWn/aFzqI34BCgAVGZwx
         ZEPM8/MSuwJ3fnZ7gZ8qUt9cAtzVcJDLCURozxR8RShqWZCGElopPqT271zilUefwR4o
         /83LFl+Axy3Vs6zVdruS4v4wPIdjxuuivbRSHsk5bsott3se4GF0vb8UAtycuxInBJRd
         oSyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773747912; x=1774352712; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mSP+5ZiGrT8VoG2czM5Q9RwvJ6j1xtoayCufilySkAw=;
        b=lDp8xF80puWrdqzkfQWEEHPRRyKJPouUa5I07a8vPNNHl0QJDUFg7G4AiiTDk1S2YV
         cWd7Tnkw/d0NBkr2IkYpvEQKBP3oQfEewuAy/kINP9TV7p9iwuV1S6f3UI8WgCsmwWj3
         o5WCHQIYSRnIzlo566FKpuDThgRec9SwscUZHilxCEqrh/sITAi5/GFjPwlew72iU4IN
         t2fMg25gEwkPjz/iKBSaSWUcIggfGP2LMj4sq7Wh0DAdOBj4/OAjD8vGZg58O4NR8M4Q
         YUwFYWJLHFmlFzkp5C9VlJiBhbctGujAFhDJ5BGjdQKNYpKmHxs2v43NMGVCrk3zvLgZ
         8wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773747912; x=1774352712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSP+5ZiGrT8VoG2czM5Q9RwvJ6j1xtoayCufilySkAw=;
        b=ATTIjWPk7w5yQhfs2SuDdYUTegLNHmGjjU9ZVZjprfQSCzVZmqWPk/9EykIHyMMPJp
         QH/eaHL/CoLY43TqcmvyAI6/T7H9wt21g64yX95qyWV90EmSvRdmb+UHdOX6FaOea1t9
         YYkjotpvBRjb036Yt1JokAlV/+6Vo2bLyzK/osqedCIyXW2K4tA1rfzEoM6ftmT5kd7Q
         +Xhp26vrXgkIITJYdzDK7AIoR/2+xdtcA3GL9HflKpE3gdFk71MK1sF/MGtlpDYRGaDz
         VaKqVGl8g8bwBnFhcDzh9qLIQsIwoOigHBP7Am/zzNx1QkNt5YEGfpy7pTcS6dNkoHyM
         A2iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSkOS9kqT7RI4EQND/EU/ETdiLCMePCfBT4kRcpp/3iWf+qgxibl+kHnXsNudpUiPuTRnfiAch+V8FwQr/TxIx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyogt6ZPrIG/ym6A7eIpaTgLLOLtUT3copbYTrotymYzPvKL7v4
	3I+nw9FFPgjDsnKxoJ6bR/nevxJlOqTqW6J2AoWvM+CrR6Qlt0e66vQjT65+3mFgWN2wIQ40SKA
	134b+NBsYedyqbu48Guc0sC9bwTVXkixf3cwL9ifu
X-Gm-Gg: ATEYQzz910V8hfwgiVmHrotsCbw8RlWL7MZj8jM5U3CDDTPHPiPo9Z1gJcCvVGpOlPM
	EueW8CFHXxmKDnIoFz0hl6HDDf/AYF1XKjyCPNIuyYaQ4DIa9/4jnnvukxuCHDhcgqDOVTG5icy
	PhjlcMQ1m4STxWxYzC2qT0RRtCmIZk5EOoMwfw/5iAiSoOTYGcN/3dORYrhivkNbGN1V++k/uvL
	8U9rIQ/KmuuaQS0pHkzaJnCMbJf96SgDfZy/ZpXY7393KnKsRxCxltPjTQt55Otuhb+x7hL5+Nz
	0d1LxM+FT3Dz7dl0lPXOwbZTNNY3f5WbENH1
X-Received: by 2002:a05:622a:34f:b0:509:1cf9:ea11 with SMTP id
 d75a77b69052e-5099ae36e43mr12562501cf.7.1773747911711; Tue, 17 Mar 2026
 04:45:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <20260316175451.1866175-8-maz@kernel.org>
In-Reply-To: <20260316175451.1866175-8-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 11:44:34 +0000
X-Gm-Features: AaiRm51lXiyKLg4OKdcVXNwJmHZcYFDhdZMB_eojSJsLTLxE5Cp49WmpL5pRhKA
Message-ID: <CA+EHjTzjFvVP+E-4rtiup2FibCO1cuti-YEF4WtdbMMz1HkXPA@mail.gmail.com>
Subject: Re: [PATCH 07/17] KVM: arm64: Kill exec_fault from kvm_s2_fault
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114515_038594_D7B6F177 
X-CRM114-Status: GOOD (  15.76  )
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
> Similarly to write_fault, exec_fault can be advantageously replaced
> by the kvm_vcpu_trap_is_exec_fault() predicate where needed.
>
> Another one bites the dust...
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/mmu.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 86950acbd7e6b..11820e39ad8e1 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1711,7 +1711,6 @@ static short kvm_s2_resolve_vma_size(const struct kvm_s2_fault_desc *s2fd,
>  }
>
>  struct kvm_s2_fault {
> -       bool exec_fault;
>         bool writable;
>         bool topup_memcache;
>         bool mte_allowed;
> @@ -1857,7 +1856,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>                 fault->writable = false;
>         }
>
> -       if (fault->exec_fault && fault->s2_force_noncacheable)
> +       if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu) && fault->s2_force_noncacheable)
>                 return -ENOEXEC;
>
>         /*
> @@ -1877,7 +1876,7 @@ static int kvm_s2_fault_compute_prot(const struct kvm_s2_fault_desc *s2fd,
>         if (fault->writable)
>                 fault->prot |= KVM_PGTABLE_PROT_W;
>
> -       if (fault->exec_fault)
> +       if (kvm_vcpu_trap_is_exec_fault(s2fd->vcpu))
>                 fault->prot |= KVM_PGTABLE_PROT_X;
>
>         if (fault->s2_force_noncacheable)
> @@ -1984,7 +1983,6 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
>                 .logging_active = logging_active,
>                 .force_pte = logging_active,
>                 .prot = KVM_PGTABLE_PROT_R,
> -               .exec_fault = kvm_vcpu_trap_is_exec_fault(s2fd->vcpu),
>                 .topup_memcache = !perm_fault || (logging_active && kvm_is_write_fault(s2fd->vcpu)),
>         };
>         void *memcache;
> --
> 2.47.3
>
>

