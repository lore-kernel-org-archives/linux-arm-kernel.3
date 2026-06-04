Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC07CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=abvCoXD4ApuT4IBhlncgonT/f2/XPLlXlo2SlRJs3xY=; b=uQ4rhJkrBwVkX1Ohf/eRTyNMht
	hckzNNWu6oKqeMg9ErHqz42pcuxFkF5q5YNZZit3N7Q/GuJN2ciwZCGAqS15AtMggz4/0ERR0Gmi8
	pUumMfBX3/R/Puow82dTrd7sSDw1lELqqZlhW6+SB/KUkmAcyITNKwODWrWr+LBSSgRBi3uvc119n
	i+7GhV9kZaQBF7qnrHMJH4TaVqabTYKqj4pmBVouO6bXqqUfinYEUFvE9LWge+OjQ8lQFb7ZP2jIo
	IYBotQI4mIdxNwkA2pFGop+Wb+i+gxP44veaZBbdY7PEcb1ZVl/V9LAebgSc3Mb7IrozVGA3JLN9G
	AdjpVKYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7hv-0000000Gkqk-3F1k;
	Thu, 04 Jun 2026 13:01:59 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV7ht-0000000GkqL-2OO6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:01:58 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51765331535so472921cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 06:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780578115; cv=none;
        d=google.com; s=arc-20240605;
        b=j0RX3uCmuTnbGjWzDzrr8oAXqe8/Bo9YbK87S/lzXrM+vy+J/vQrmrS3gqfm4sQAVz
         FLog7w0mN5iEiGoZf6uPCOUJmK+r/6fXTaJ54zDvG+oM0K98wvXw0MM5olZwa+3wIt6X
         U37IBaOqKFJ8mkvdXxRfz23m9OgsWVB9zO457qCz7kst/h99yIOGj/svF8QCkFXvLTb6
         kU8DZsXqqi+OPRrztbn963gA02hAL/zYpq997TrX91kfLuC1lAyac8hKkI3FUiF+i6UH
         HsOh4zB73XACD90NoypabP2Y/R527lfiIJGbPmyVwiHFenp5RXCBx77ahvEiwJ57lox+
         2J8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=abvCoXD4ApuT4IBhlncgonT/f2/XPLlXlo2SlRJs3xY=;
        fh=tZD9BCMDCXiR3BLDrhnWCwtrsvzmw0+HR55qV9mx8xM=;
        b=f93OAsDoriZKBNoBvWQuP/GsofQU9pO8S16teOTRpfDdwr3Crez8RY101p3xHCjMuy
         CNgGG9ghk2bLzbwd7u4M1T/OItTeJqjOdHNsirl7TsJy075kfH34qJRyyJFcUrZ/FE7y
         L+pYmEZYrIZM2bcreYSzGLtStvG/8mGYMYv2LYXiGvGfSiWOuKR45T3yYoS51nsbUqvl
         rg8iInhFHDDzRCKqYW9eDJMY0pP+lbQ8reH2ua7KsTOer4pinDQ1o6xFj89R2GbOFL8a
         lGlZ0ty7TfnndW4DyGLOBUdL43MYwDcRO0nR3YKA3fkg1Dp8i6jdZCtxWgtMqawWDS1H
         7fXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780578115; x=1781182915; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=abvCoXD4ApuT4IBhlncgonT/f2/XPLlXlo2SlRJs3xY=;
        b=I+BxzItU8jOHieOSD+hdKY8CMineRg71NznX9vX/A0mAgG534dmx5O0PzXNZvhpKiY
         o9i3x3D3fvQ66F185+P+8IWcitlqfSwK95GXF0ue79u024fRetwQuNNu5Iw8YgEM3ACX
         ZkragwJTWZKTXtXpWf7hny/5pWE3GCmw8OqUFIVb5bJwvjz2OmFUkOL4V8blfFlrdo7z
         HaETlMfK/K9z7Luy47rf5IrfdgFRSlL198o05ADx9EQlkVwQqwrzAwaF0Y5F4OiL6sfF
         gqwPuRdhpuAzBvbO2Ylq7a9mxkOoCN47A87oCaXSC5GljvCq9KaZut6XLsznTb0J4PuJ
         QYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780578115; x=1781182915;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abvCoXD4ApuT4IBhlncgonT/f2/XPLlXlo2SlRJs3xY=;
        b=ouXpc0d7UW0Z56PrbOYEuB/+eupLgAaKqzbnau5l1SFoV0tPdLc4Oqsv4Al1aa/Ad2
         ctZcuMZHmnVt1nbh5wZ6SLxLVcI99Fx1MAjh7uypGwTP5VYWkMh7nEZFM9cVQHbn4Cl2
         nNji4KhQyPaCy8W8quK43Zz6dX+yzyiVDLA1ulFjupQ4/xOxdsbCuYxJZIB3vw0pB+1z
         Z2+Y8fmvFap+ylxbmg5YJldPCJWsLTqRI3vx7a+EU8E0y8WpOBzOYws5FgDZceBNnDaV
         VBoPYvzzeTHarz4TBmWK0NtAqMGoeP2Fkgz5WxCyMF2E3IwjqEEz3A+R2uhRCetqlOeu
         zavQ==
X-Forwarded-Encrypted: i=1; AFNElJ85hQCIqWxIdKMc6MKV2F0zWfxxiVnshWBh48kVWvw0AtjZVF7x7NVs9lJaD8HYZDyR1ucECIyBgZ7mMMO54oqc@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh/JqXrkBiQfcHfLPrt62u3zf18k3RgsA1t7LoIP55+Wn/usmJ
	WgpsGvrR3b0XMf1ifkQZlBjWVU5tGkEZQNzhixCGvJCvQCy+x5m2OlOPR9NE1ldUw9TrDf7OTz6
	PsUA64uDdF7aGIthR+FTdJapTEy/mjs/VONAY7HPV8W9wgiZ4WR9N9EIE
X-Gm-Gg: Acq92OHMKvWz4BihH69fUUFp1i3U8oaRDmAD+Vaoo7miN7ZzGa+VbCAgJKtPoRovpmK
	FMTIdUEbR77PySLy9UcEpiqbfecEYkTjoyDbhAWV6r89FSaoWXr0G4KZIpMy72+2n9UlJCXHicv
	y5F2C6jSglu2VAXMbqh9KEem7hVheILN4ZEOWfbmCztCIYkzlZbGh0EaJFrZQK7eVqPFRJQnG6s
	HC1jU1lr/uBgoettatDwHZUe4Dw1yIPFzTHu0e8Oq15go8wilrdPYxuj3aVyFPHJe5rhlUrN4Di
	Rzf9ROz/O2vT+4A2e+U=
X-Received: by 2002:a05:622a:1885:b0:516:d570:82c0 with SMTP id
 d75a77b69052e-517890b8d90mr6766011cf.15.1780578114344; Thu, 04 Jun 2026
 06:01:54 -0700 (PDT)
MIME-Version: 1.0
References: <aiFe-CXo-XVTFz1g@v4bel>
In-Reply-To: <aiFe-CXo-XVTFz1g@v4bel>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 4 Jun 2026 14:01:17 +0100
X-Gm-Features: AVVi8CfHHlZEI2hILdx1PsPvsAWlx2wW9yyM9N0c2QlyzumkAgqr3-x7eWBlJOs
Message-ID: <CA+EHjTwgPFbbp7khcy+DZ9HZWCX-OWPfO78Gj_eQuCoj+SA90g@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Sanitise host vCPU fields in flush_hyp_vcpu()
To: Hyunwoo Kim <imv4bel@gmail.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_060157_643769_800DB4DB 
X-CRM114-Status: GOOD (  22.87  )
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

Hi Hyunwoo,

On Thu, 4 Jun 2026 at 12:18, Hyunwoo Kim <imv4bel@gmail.com> wrote:
>
> flush_hyp_vcpu() copies the host vCPU context and vGIC state into the
> hyp's private vCPU on every run. ctxt_to_vcpu() expects a guest context
> to have a NULL __hyp_running_vcpu, which is only ever set on the host
> context, so that it resolves the vCPU via container_of(). The vGIC list
> register save and restore expect used_lrs to stay within the number of
> implemented list registers. While this is generally the case,
> flush_hyp_vcpu() copies both fields verbatim from the host vCPU and
> enforces neither expectation.
>
> Fix by clearing __hyp_running_vcpu and clamping used_lrs after the copy.

Nice catch, both fixes are correct.

Please split this into two patches, one per field. They are independent
bugs that just happen to share a Fixes: tag and the function. Both are
host -> EL2, so worth stating that in the commit messages.

Otherwise this looks right to me.

Cheers,
/fuad


>
> Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
> Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index 06db299c37a89..ef9318ff0c25e 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -7,6 +7,7 @@
>  #include <hyp/adjust_pc.h>
>  #include <hyp/switch.h>
>
> +#include <asm/arch_gicv3.h>
>  #include <asm/pgtable-types.h>
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_emulate.h>
> @@ -128,6 +129,9 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>
>         hyp_vcpu->vcpu.arch.ctxt        = host_vcpu->arch.ctxt;
>
> +       /* A guest context must keep a NULL __hyp_running_vcpu. */
> +       hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
> +
>         hyp_vcpu->vcpu.arch.mdcr_el2    = host_vcpu->arch.mdcr_el2;
>         hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
>         hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> @@ -139,6 +143,13 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
>
>         hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3 = host_vcpu->arch.vgic_cpu.vgic_v3;
>
> +       /* Bound the host-provided used_lrs by the implemented list registers. */
> +       if (static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
> +               hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs =
> +                       min_t(unsigned int,
> +                             hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3.used_lrs,
> +                             (read_gicreg(ICH_VTR_EL2) & 0xf) + 1);
> +
>         hyp_vcpu->vcpu.arch.pid = host_vcpu->arch.pid;
>  }
>
> --
> 2.43.0
>
>

