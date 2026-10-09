Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE723CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxNIxRTzU6d9JEd7XYQoAEFOXRUSaVyUreEsAPAUamc=; b=Obz9C09kNROiJlcweWiehIVqB3
	W6Nw4/uYOahTw7fNfp84FnYO16BfFvprgpxrLEKO6fnqd9mjlJjF4qfnQBYG45sPO+bCXi1XzIKkh
	PIwHGE5oG/HTJOejdfdV9zIIkHIVz6P7O48J0uzjpinusAdYlaK892Kw/yEytEAVWzlKVCzstNCAK
	R2CkWxpylAVwzfmE/+F8E+T8QVOnX7q/sMHQKZJxs0QKKBb1waRhpJQB7M8Js20SpTrcX1iLg/UFy
	DutQtXtm+t6tCTLimHRWWyECKyIN1yB/tJy9PfnzUQT95MtIwoDEnYPKNYdZ6VWghzYWNY0wIU5jd
	k8aSlreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9go-00000006IVS-1l22;
	Fri, 09 Oct 2026 12:27:06 +0000
Received: from out-203.mta1.migadu.com ([2001:41d0:203:375::cb] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF9gl-00000006IV7-09lC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 12:27:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=Rskl52PEXfW5/H7E17ehKiqW0raadIub/K24X2b7wVU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791548820; v=1; x=1792153620;
 b=Xs302W9O2Js4RiQ++lC5emDVLJlG56yx8i8FmxPL0cuwe1tNAJMkg22ilmb0U9dKm//dKeB6
 6N4RzGNxz0dbaGi0qUWZVzZZ1hcUR36LeIegpOwvfpZdtqC62hf5qLy/W5aOPOiWsN8g6HsYte+
 5Z0nFAozomdEHF06OOsGbAgU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 24db8019fd385272;
	Fri, 09 Oct 2026 12:27:00 +0000
X-Mizu-Trace-ID: 24db8019fd385272
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so6615e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 05:26:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxCHDw8U1uAd0x4HfIRk4rOWKpuvPrBSViQ3qoqms7aUAL2cg+dshL/NhhQmFdyvdiRBfZTKni2ONyu93osdN6t@lists.infradead.org
X-Gm-Message-State: AFq9FYKz8yrrWZ+19PBHpuC4sdx0WN/Ma1jueGeysFk8yDKH9N2jS23t
	bnxXeO2AGie79QDCs5rpOy59JWqvqrAadSCgLDrOnzNzdmhr2pksGM/12TFzp/EZeN2Dz6MIvgL
	ZjruQi7dybkzqCTA5EUUvp9PhclN3KyTVP258t/ts
X-Received: by 2002:a05:6512:398f:b0:5b8:cc2e:2fe6 with SMTP id
 2adb3069b0e04-5bcddf1700amr120088e87.5.1791548818944; Fri, 09 Oct 2026
 05:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261009084529.462577-1-vdonnefort@google.com> <20261009084529.462577-4-vdonnefort@google.com>
In-Reply-To: <20261009084529.462577-4-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 9 Oct 2026 13:26:22 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzdEXHxkMtSU3SybNxy+Fece339bsvyc6L6K_iySdRDfA@mail.gmail.com>
X-Gm-Features: AclHuK8F4wU0wA42DfBPoQ91t2zOyKK2_7w72v27AX-GTkXE-6ZPtTr4m1wRKuE
Message-ID: <CA+EHjTzdEXHxkMtSU3SybNxy+Fece339bsvyc6L6K_iySdRDfA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] KVM: arm64: Add host_hvc hyp event
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_052703_340291_6654D711 
X-CRM114-Status: UNSURE (   9.37  )
X-CRM114-Notice: Please train this message.
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

Hi Vincent,

On Fri, 09 Oct 2026 09:45:29 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:

[...]
> diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h

[...]
> +HYP_EVENT(host_hvc,
> +        HE_PROTO(u8 id, u64 ret),
> +        HE_STRUCT(
> +                he_field(u8, id)
> +                he_field(u64, ret)
> +        ),
> +        HE_ASSIGN(
> +                __entry->id = id;
> +                __entry->ret = ret;
> +        ),
> +        HE_PRINTK("id=%u ret=0x%llx", __entry->id, __entry->ret)
> +);

id is the index into host_hcall[], so its value depends on that
table's order. Could this log the SMCCC function ID instead, as
guest_hvc does? The alignment issue from patch 2 applies here too: the
format file puts ret at offset 3 instead of 8.

[...]
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c

[...]
> @@ -996,6 +996,8 @@ static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
>          cpu_reg(host_ctxt, 0) = SMCCC_RET_SUCCESS;
>          hfn(host_ctxt);
>
> +        trace_host_hvc(id, cpu_reg(host_ctxt, 1));
> +
>          return;
>  inval:
>          cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;

Only some of the handlers write a return value to x1. For the others,
x1 still holds the first argument, e.g. the mmu pointer for
__kvm_tlb_flush_vmid, so host_hvc's ret field shows that instead.
Could the field be called x1 rather than ret?

Cheers,
/fuad

