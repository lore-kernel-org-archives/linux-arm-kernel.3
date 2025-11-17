Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D02DCEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InxzUv4fZ1uU4fFpdnx0a5dxJKeuOiNcfcnGKmmDKis=; b=16J3inenp45gJU61k0nUs/QSDJ
	dPCmGpvcwJ7naRpbbjjrucpKbQmaQtMynWvPzIernW492sezsrvIUvK/Kypyjg6Qez9KJusPl4U+L
	ud4FO8Wx3u4SbUJSV3ykIc86+CQg2vV05p1oLNeH02u2SmRzH9H1JpO4EzFrdQ7ZmdwqYuZY4z/y9
	IvsJg7d1+HXSRgw4YMEDT7CkVawpfldq72zNXUk2MldX8htZHCpHxjEQ5nzEaGhRXERafxwWaYsun
	0N0jCm536Fwa+QY60rfZ8JYNeE7di0+ZDkUwKWSTv0X0d2D/Ov0RSum2AahDL7k9WvAYCMB7YChC0
	9yIwBKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxWY-0000000FzEi-2Ah7;
	Mon, 17 Nov 2025 11:35:58 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKxWW-0000000FzEK-3CHI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 11:35:57 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4ed67a143c5so563061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 03:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763379355; x=1763984155; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=InxzUv4fZ1uU4fFpdnx0a5dxJKeuOiNcfcnGKmmDKis=;
        b=sMJupcnw7Y6cC+0PV/doWp94PRDYjfcQRBJylqgDHWmjJyR1aUoyRtTNVRRTtxgmo1
         jn78Lfrbo/glETsK6BlSLF+yuNxHbOGmXiJ2qAOcU7P1NSczTEI7c2YqBIAZBqDRM01/
         5GfeompZ+jCuea3lNmswkD+99pxEgmGwhuS++vNRjZLMh+vKycpuPLhD+5R3avfuyZNM
         +isVelWXUXUHFUg6Z0AWtiwUgQoy+BPIzRKSi0h9oXT0teqN1WgV3am78dpdZsQYlK+I
         3SXNWmH3GxlqxNk4C0IEPEMGdwWVf5CGt17ggCJM5D/vpUD5tZiFxqlzAXZCFYBOXlEr
         iW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763379355; x=1763984155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InxzUv4fZ1uU4fFpdnx0a5dxJKeuOiNcfcnGKmmDKis=;
        b=K9UU7F6+3XCY7YJbH3T/BjZEADthdvJ4CJRUHhncTVfkLa/8kfLpohxUJT1hq7MjG/
         UHGef1z2iOOKGK03lY6B7baugEp+1hwoE6DN7cfSm+5aLRPh5MYbIu6anO4PMig24er7
         gzpWJeDeq09s9HBcGDQw8JwZb+M+3MBr1fthptlPcfKPCSpO3H4AlikmLjkfRsYztnGD
         TLMWiLIUNGneetDqxrrR4noASfQchS0qREsnlfdHHUO5DfO78xejGU+smyYhlfWLr6pd
         N102NubEeh+dTugimDqVS/QUlpcaMMAG+6UtmejeM6xLXKuQWgH8OAoQB1wEahfyxRn/
         Onsg==
X-Forwarded-Encrypted: i=1; AJvYcCUjVG/QJ1zS0XYIYHm0VaMlqMnVzUQNkkschsReIUzJ2ibxpy4xHLfnOiBXlbqXeujBqyrvoRnwomTXRzvSesu3@lists.infradead.org
X-Gm-Message-State: AOJu0YxiQ2CdN4PZKx6Z7b0Pb8TLtqQ4ai0NjuGIwSzXdGAjGScTYu1K
	7My0YkiECbDN7yzem4KAwyLe2bRWUA//BgXlN3bQ3RAeFscUFa+XuRzbp/BIkXSAoL3ftb4hNe1
	/EjYwgo4jznginkg69aYQvHCGLjoMoG7WmvC3mQJHZEH3EdIsiuEiA5KpTDo=
X-Gm-Gg: ASbGncv5zG2+wGuPs0L3AhTBW7Av6W7LOUfIVBKFEjbjX18K/t5ne7g0J0zot2E+d/3
	ZT+ihdwmvKNNX0weaoRBunr9X47lsGGXo78IKOCl14wJ7r70dSWYTsn2LhZC1sM/2wHqZK87e+l
	bQRE2wFLFAT3ukiabnIesGh9am45VTLzcbMZQ61Aw4eEqL4MTpwm0bZ6AZGxbLFFtKlqZruH7u9
	O36Ar8hFDBb/uC6Sp/xo2leIS58lcYDGMUfnZ9TCi9W+OJdl0deu5FxYyIt+G9v4bB1WuH81shQ
	IJiOlA==
X-Google-Smtp-Source: AGHT+IEeSiW3i7KxR/7PtZwLbRJe4Rt/AuAzXIflTZcma7G9RYj/Byd8sqTWf75xRzlbievXcmfG+TwcqMMRZMTyoY0=
X-Received: by 2002:ac8:7fcd:0:b0:4ed:ff79:e678 with SMTP id
 d75a77b69052e-4ee02b0dba6mr11656171cf.18.1763379355279; Mon, 17 Nov 2025
 03:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20251117091527.1119213-1-maz@kernel.org> <20251117091527.1119213-6-maz@kernel.org>
In-Reply-To: <20251117091527.1119213-6-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 17 Nov 2025 11:35:18 +0000
X-Gm-Features: AWmQ_bnrhZokZgmcow0lXNWcucVmFJ-Nro-VXQIq3EmXDZs9hFHaUagkAg0JMFQ
Message-ID: <CA+EHjTxVr7uk8Ofhb2VHjDw+LfC4ZSz4dDun5+xLcnRQy5AKaQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] KVM: arm64: GICv3: Force exit to sync ICH_HCR_EL2.En
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_033556_816625_F9224ACE 
X-CRM114-Status: GOOD (  26.72  )
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

Hi Marc,

On Mon, 17 Nov 2025 at 09:22, Marc Zyngier <maz@kernel.org> wrote:
>
> FEAT_NV2 is pretty terrible for anything that tries to enforce immediate
> effects, and writing to ICH_HCR_EL2 in the hope to disable a maintenance
> interrupt is vain. This only hits memory, and the guest hasn't cleared
> anything -- the MI will fire.
>
> For example, running the vgic_irq test under NV results in about 800
> maintenance interrupts being actually handled by the L1 guest,
> when none were expected.
>
> As a cheap workaround, read back ICH_MISR_EL2 after writing 0 to
> ICH_HCR_EL2. This is very cheap on real HW, and causes a trap to
> the host in NV, giving it the opportunity to retire the pending
> MI. With this, the above test tuns to completion without any MI
> being actually handled.

nit: tuns->runs


>
> Yes, this is really poor...
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/hyp/vgic-v3-sr.c      | 7 +++++++
>  arch/arm64/kvm/vgic/vgic-v3-nested.c | 6 ++++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> index 99342c13e1794..f503cf01ac82c 100644
> --- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
> +++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
> @@ -244,6 +244,13 @@ void __vgic_v3_save_state(struct vgic_v3_cpu_if *cpu_if)
>         }
>
>         write_gicreg(0, ICH_HCR_EL2);
> +
> +       /*
> +        * Hack alert: On NV, this results in a trap so that the above
> +        * write actually takes effect...
> +        */
> +       isb();
> +       read_gicreg(ICH_MISR_EL2);
>  }

nit: is it worth gating this with "ARM64_HAS_NESTED_VIRT"?

Otherwise,
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad




>  void __vgic_v3_restore_state(struct vgic_v3_cpu_if *cpu_if)
> diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> index 40f7a37e0685c..d6797632157a0 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
> @@ -94,8 +94,10 @@ static int lr_map_idx_to_shadow_idx(struct shadow_if *shadow_if, int idx)
>   *
>   * - because most of the ICH_*_EL2 registers live in the VNCR page, the
>   *   quality of emulation is poor: L1 can setup the vgic so that an MI would
> - *   immediately fire, and not observe anything until the next exit. Trying
> - *   to read ICH_MISR_EL2 would do the trick, for example.
> + *   immediately fire, and not observe anything until the next exit.
> + *   Similarly, a pending MI is not immediately disabled by clearing
> + *   ICH_HCR_EL2.En. Trying to read ICH_MISR_EL2 would do the trick, for
> + *   example.
>   *
>   * System register emulation:
>   *
> --
> 2.47.3
>
>

