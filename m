Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691A8CE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iebc9wAbiB5E5IOqak411hyeSp97Jf8NhK9FIOstGQ4=; b=lo6zJk2k8DMiE+AndGwmQF2TJS
	59ueL2GyJj91kRSt/HNgPRFEZSwqtdhP/kix3YjsYbi5Oa3l8GRftIhLN8O2E5rpFEmjHWrF5fEq6
	cM6uiXIYz4mWYqnA7oT1yzpbMS30BgxNZvZmIbqNrkBbG+2lZMS/wO6+Eav87pUSHPd3l3504Zcqa
	FPgAjHZjFYRpksKKyTraig0zTq6Z+H525Fidn+Qyij5pDfT+8/EL7uDQjbEpNSKKfS3YFa7hUw9+h
	bD5BvcNrsAyVdayArZZTiK7tKEBHj1sx9XfLQ3scO4xM9aDsdCyNQrSEUmh1OIR97ixLAfKzEpLOF
	yBL6Oy9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJug4-0000000CLzA-107Q;
	Fri, 14 Nov 2025 14:21:28 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJug1-0000000CLyg-0o5x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:21:26 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ed67a143c5so299581cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763130083; x=1763734883; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iebc9wAbiB5E5IOqak411hyeSp97Jf8NhK9FIOstGQ4=;
        b=NdDJ7Ln4nNzBpoyuR4MNgmMFBLN/OphxRshGb4bnYA7WGi3AjuhaGDw9HtQXQZZCso
         OgG6vL3sXK1w4CYJNOWCBprrbQQFQ9QPFcP+C2AsRLm9EFma2CccgwxtNJ6c+PQYdL3w
         DJgAYAoQGYhHbYuzz61hUbUkG8jSnMMtG+4xmXGacTdd5giWXhJeTi54S7y5g2U6/EMz
         awQNAeDgl0r20WKOqtJlZ7sskoeXa7YCW/fvi0j7w9BAzAV/JnEhW3hY6G3Qxqf3fina
         aLGO5InWtKDDNpTeX3qaCmi14HsnsFKaT05IJdTMHqW+3ugf12CPEwrz5DTxvEPofjSj
         cSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130083; x=1763734883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iebc9wAbiB5E5IOqak411hyeSp97Jf8NhK9FIOstGQ4=;
        b=YlsvJ1o0IcI1SIu4uMBU14S2qSAe6KVzwmqFB6Rh2B+bhgmTAckbyWp/GWVpG/0J0B
         d9+FpyHzE+9nNWGGp5lBe4oUaBsvPyfaFktddCfyxUA7R1V2Kd70NQkhkf4NmxPjnhju
         k1S97GjJzpM2O5SQZMyCDHd3FBiYiKXIy9/MqyNEhJdusqs/FmJwxPyHwLxkFaX8WNn2
         j7s6VSKyJ2G+QbJ9XWTGNbesMT0WRDQqQUt3pIk51oLdEjMqazNiMbPvue5kJMeImbB0
         jCZfiuXpnXzn27YHqK7AYRVdkEhKn3Nf2lrVPBk8i199VjfBZaqcXuIedAP2l4KrPvnj
         Pq5g==
X-Forwarded-Encrypted: i=1; AJvYcCXFWWyCmuJkMfcheIsopcv/d3i8S3Rhlvo7uhtBAm7P2x68qFyT9cEcJrvkr7EuSMLmtZu7dJoutxxc/rPyjO23@lists.infradead.org
X-Gm-Message-State: AOJu0YwOQzZiAJLoS4oqgZULQ3sCFY9g/Ih4pEKrynUpmR1OKl34CDbg
	5X8sOM39Fb45zzocypMrwr2W2x/0Ds7CU1wznr0f0sc6nQMxujIf8bTeZEpKutC4mzCMe8nKb6+
	4RRZps57s/0tb26IflQ1hrbX8ru4oRIdqlnOX9z5Dnz0dqbHKtLfc0ysjR/s=
X-Gm-Gg: ASbGnctfXtwBrRgK7agDTiaSw7147Dkyc3T4AaCQ/1uf9cssv8ufZCY666g0q/02eHW
	B/XdpCr0uQzUEX/sjXD6/a+fvbdHIpeUs+oLFRTl3Zz18A49HrYqZcNTz7+wJ8k7coxWgH138nm
	eB7IzOE9MiH4lLBUZOhV+VHBza8b2rN7Gz+GdJRDC0L2IajMB4FaYWz60bGW3bkTcLWDzUQ/mb0
	WZkurflJXHrnPfdbtkRw2koknV2YsvEpTy+MDNECqZ7ZGUEDK0UY5s2BKXILOk/juhdLOtURsu5
	LffWMJqGfi4Lnw9S
X-Google-Smtp-Source: AGHT+IE5Oe19RaLFBsVRY5odgzBmRaaiSdzxsgMGjxiUojw4mI94n9CHnCtVAFThAGs6iI94m/QfSBQkFZ6pjRXMhQg=
X-Received: by 2002:ac8:580f:0:b0:4e5:7827:f4b9 with SMTP id
 d75a77b69052e-4edf47135camr5213031cf.3.1763130082793; Fri, 14 Nov 2025
 06:21:22 -0800 (PST)
MIME-Version: 1.0
References: <20251109171619.1507205-1-maz@kernel.org> <20251109171619.1507205-30-maz@kernel.org>
In-Reply-To: <20251109171619.1507205-30-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 14 Nov 2025 14:20:46 +0000
X-Gm-Features: AWmQ_bkph9z6RWKdMnig0aZ2huiMgSjHMys0UY_nuIP5-xDzsPT50bNsv9UL6s8
Message-ID: <CA+EHjTzRwswNq+hZQDD5tXj+-0nr04OmR201mHmi82FJ0VHuJA@mail.gmail.com>
Subject: Re: [PATCH v2 29/45] KVM: arm64: GICv3: Set ICH_HCR_EL2.TDIR when
 interrupts overflow LR capacity
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Yao Yuan <yaoyuan@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062125_240031_C3F86BF3 
X-CRM114-Status: GOOD (  18.93  )
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

On Sun, 9 Nov 2025 at 17:17, Marc Zyngier <maz@kernel.org> wrote:
>
> Now that we are ready to handle deactivation through ICV_DIR_EL1,
> set the trap bit if we have active interrupts outside of the LRs.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/vgic/vgic-v3.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> index 1026031f22ff9..26e17ed057f00 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> @@ -42,6 +42,13 @@ void vgic_v3_configure_hcr(struct kvm_vcpu *vcpu,
>                 ICH_HCR_EL2_VGrp0DIE : ICH_HCR_EL2_VGrp0EIE;
>         cpuif->vgic_hcr |= (cpuif->vgic_vmcr & ICH_VMCR_ENG1_MASK) ?
>                 ICH_HCR_EL2_VGrp1DIE : ICH_HCR_EL2_VGrp1EIE;
> +
> +       /*
> +        * Note that we set the trap irrespective of EOIMode, as that
> +        * can change behind our back without any warning...
> +        */
> +       if (irqs_active_outside_lrs(als))
> +               cpuif->vgic_hcr |= ICH_HCR_EL2_TDIR;
>  }

I just tested these patches as they are on kvmarm/next
2ea7215187c5759fc5d277280e3095b350ca6a50 ("Merge branch
'kvm-arm64/vgic-lr-overflow' into kvmarm/next"), without any
additional pKVM patches. I tried running it with pKVM (non-protected)
and with just plain nVHE. In both cases, I get a trap to EL2 (0x18)
when booting a non-protected guest, which triggers a bug in
handle_trap() arch/arm64/kvm/hyp/nvhe/hyp-main.c:706

This trap is happening because of setting this particular trap (TDIR).
Just removing this trap from vgic_v3_configure_hcr() from the ToT on
kvmarm/next boots fine.

I'm running this on QEMU with '-machine virt,gic-version=3 -cpu max'
and the kernel with 'kvm-arm.mode=protected' and with
'kvm-arm.mode=nvhe'.

Let me know if you need any more info or help testing.

Cheers,
/fuad


>  static bool lr_signals_eoi_mi(u64 lr_val)
> --
> 2.47.3
>
>

