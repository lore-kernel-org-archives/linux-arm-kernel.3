Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C21E77197
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 02:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3FJfKlQLbEvoXC4i0ViMWpomAcv0lK5A9XqztX79Kg=; b=a7hgusgG7YR8aLJOGQSK/ygSeJ
	G8A3mVnIHXDZpLWV02BUayh/Zcr9Of0bdTkhZohJm6IwTsv/C2j+sXhSAFR3dX8eMQKtx0pPLiSng
	O3Z7PQd1DeoVh+yOMorAgMI5ndjz8FDXL7xxGDNIpHPYpPnnAs5Rnjtp+Vw6ZuFgaCCXu707D2GtL
	0PIevPfJktBP5hfsPQw7gD82oOnCTyQkG57P2aHYKLtEDaa7bBKzcL9mew82b5MAZ7VP5pe7H12wo
	YmsilFy/0w0f8qGt37Rd+vikrCwPO/T5UrsAKWjEzOmwuov4lCEREldV2/uQgv22uPkmcKsA2SMcT
	mdbplomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUcqd-000000002jr-3mHJ;
	Mon, 06 Jan 2025 02:28:07 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUcpQ-000000002gK-0oRo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 02:26:53 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4afeccfeda2so8252791137.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 18:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1736130408; x=1736735208; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c3FJfKlQLbEvoXC4i0ViMWpomAcv0lK5A9XqztX79Kg=;
        b=EHxDWwIEJElf0dHGmORrJwLQlOR1rr1i1DvYUhdTNDj6zId40TkkqmBcPGN5HXDg9M
         b1dGbpmCMbOiAcze8ztsE7RckXqRcitdTrZTq5mqkb9oAffvKTUc3WV8W+dQ7Xsrs/Hi
         Bq4x1sEJMEyiURvvcjDN04pWXSuw8wETd7KRkXzy/5Z2MJCDVphZU1ApnQkFcbxdJ+lM
         /63NGv4HSzK8TDrRdwz6EpWLS4K8qFIbywsGO1P3HZsBC+8fTBiqtIeLgsS6gg3bEAXM
         DfAsMy0Hz0bvAFzbMMUtJJDLPj+mkTFphvmqxTONMpdYc759pZlJCYKK67+UvmjU30V/
         is1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736130408; x=1736735208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3FJfKlQLbEvoXC4i0ViMWpomAcv0lK5A9XqztX79Kg=;
        b=kx7NO4xMolSYqhI/sB22TJhunzcQNbUIk3nr1sPPVD/vspHe+d8B3RhXXjx/jvkJeX
         /ZwD/jvnawrtjkh8AqxKXnFDE6PBu/BRjnx5+mHtrs2uYdPAnrI0QUeqVrQtKWtnwahK
         kFEgDlmxOTUC193bVkjo0ybo5tGcZwJlqvAodpiPVglDTWoypVi1bocQZZsyncVoSWhH
         pcwjfpgClykbbL4KJ01xAg6UYwaRhbNXjRYhlEKhGFXdDvDdtW5z+sjXGrti5Z0Ee//T
         J+wUjTWFIq6QQ0cdDny15Oesm4Gl0+Zxn4llXVDFnqQDuIm7F1gDCUQLWAhcWD78QXDj
         2oHg==
X-Forwarded-Encrypted: i=1; AJvYcCVaWwjnz3JU2yAHOJtOf9s8l7tOyMK6Ar9Ip8/ZAKLuDGIMg4GGFB+RG6W1FwMEnRO6wInq5VvsqqBToSx7ucYX@lists.infradead.org
X-Gm-Message-State: AOJu0YwnYQIaiT8Cd+SeqyCvvdmmGgkZWX3X401DzsT2IjyaBSuMboqX
	gMp+1XKfeOETw7skyE9Oly1Mgxwj57SbkdSaQrkqo2nP9y6faprgmgHZ0yLMeMjATTlVECaJBnK
	duOlmf2awg5HTUufFr3ieFJedcv6t17DJ36U8DVJtNmhwcXvmUdy98nn5uE9FikWiFthw+RLZ3F
	ToGNmlaw==
X-Gm-Gg: ASbGncs3uSZZgqFoKLBSKtGqD/GasRjClo0nwLyosHgdLK/IZav5cLDTPRcUoWKN177
	PbKcwDyqo3I9C3SqpwFB6K061g4rBHWtlL3jfTTK/6Qzyuqz6P+LQ3Erd3abpAgPfUtKJoehQyB
	ci6++ysvEnE9hA/fmd1Z2+QUTdowYtgbz2Sw4sl665FZsoozkDbu5aqOLcF+FEMMeZMWgTTZz31
	PrP/m4HTeREsVY+m5PzN0zh5wiMCg7r4v/UKRSb/ytxVh+0z4ndSDhxEKPPsC4Dp9BlQaetSFjA
	hAvSPqgxdBIevwbnA7A=
X-Google-Smtp-Source: AGHT+IGE8R9wiGHsmz58x7rugsfqF4Xs7KaBBCUmHfCSZU9wMJhEA7KbG8rFzAqei36mZzEJGHa3mQ==
X-Received: by 2002:a17:90a:d88c:b0:2ea:59e3:2d2e with SMTP id 98e67ed59e1d1-2f452e22528mr87032884a91.10.1736129906353;
        Sun, 05 Jan 2025 18:18:26 -0800 (PST)
Received: from zenbook (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4477ec656sm32253706a91.30.2025.01.05.18.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 18:18:25 -0800 (PST)
Date: Mon, 6 Jan 2025 10:19:10 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Bjorn Andersson <andersson@kernel.org>, 
	Christoffer Dall <christoffer.dall@arm.com>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Chase Conklin <chase.conklin@arm.com>, Eric Auger <eauger@redhat.com>, r09922117@csie.ntu.edu.tw
Subject: Re: [PATCH v2 02/12] KVM: arm64: nv: Sync nested timer state with
 FEAT_NV2
Message-ID: <fqiqfjzwpgbzdtouu2pwqlu7llhnf5lmy4hzv5vo6ph4v3vyls@jdcfy3fjjc5k>
References: <20241217142321.763801-1-maz@kernel.org>
 <20241217142321.763801-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217142321.763801-3-maz@kernel.org>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_182652_262656_F6E8E56E 
X-CRM114-Status: GOOD (  34.33  )
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

Hi Marc and other KVM ARM developers,

I am trying to learn about NV and I have a few questions wile reading
the code and comments:

On Tue, Dec 17, 2024 at 02:23:10PM +0000, Marc Zyngier wrote:
> Emulating the timers with FEAT_NV2 is a bit odd, as the timers
> can be reconfigured behind our back without the hypervisor even
> noticing. In the VHE case, that's an actual regression in the
> architecture...

I'm curious why you implied NV2 isn't a regression in the nVHE case? In
my understanding without NV2 and ECV, an nVHE guest hypervisor would
directly program CNT{P, V}_*_EL0 registers without traps, and with NV2,
those accesses would be turned into memory accesses to the VNCR page,
delaying the set up of the timer until the next exit.
So NV2 also makes it worse for an nVHE guest hypervisor. What have I
missed here?

> 
> Co-developed-by: Christoffer Dall <christoffer.dall@arm.com>
> Signed-off-by: Christoffer Dall <christoffer.dall@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/arch_timer.c  | 44 ++++++++++++++++++++++++++++++++++++
>  arch/arm64/kvm/arm.c         |  3 +++
>  include/kvm/arm_arch_timer.h |  1 +
>  3 files changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
> index 1215df5904185..ee5f732fbbece 100644
> --- a/arch/arm64/kvm/arch_timer.c
> +++ b/arch/arm64/kvm/arch_timer.c
> @@ -905,6 +905,50 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>  		kvm_timer_blocking(vcpu);
>  }
>  
> +void kvm_timer_sync_nested(struct kvm_vcpu *vcpu)
> +{
> +	/*
> +	 * When NV2 is on, guest hypervisors have their EL1 timer register
> +	 * accesses redirected to the VNCR page. Any guest action taken on
> +	 * the timer is postponed until the next exit, leading to a very
> +	 * poor quality of emulation.
> +	 */
> +	if (!is_hyp_ctxt(vcpu))
> +		return;
> +
> +	if (!vcpu_el2_e2h_is_set(vcpu)) {
> +		/*
> +		 * A non-VHE guest hypervisor doesn't have any direct access
> +		 * to its timers: the EL2 registers trap (and the HW is
> +		 * fully emulated), while the EL0 registers access memory
> +		 * despite the access being notionally direct. Boo.

Reading this part of the comment I understand it as for an nVHE guest
hypervisor, the timer map would look like:

map->emul_vtimer == vcpu_hvtimer(vcpu)  /* EL2 HW is fully emulated */
map->emul_ptimer == vcpu_hptimer(vcpu)  /* EL2 HW is fully emulated */
map->direct_vtimer == vcpu_vtimer(vcpu) /* EL0 notionally direct */
map->direct_ptimer == vcpu_ptimer(vcpu) /* EL0 notionally direct */

But looking at get_timer_map() I see we enter the first nested if
statement, regardless of whether the guest hypervisor is VHE or nVHE,
since it checks like the following:

if (vcpu_has_nv(vcpu)) {
	if (is_hyp_ctxt(vcpu)) {
		map->direct_vtimer == vcpu_hvtimer(vcpu);
		map->direct_ptimer == vcpu_hptimer(vcpu);
		map->emul_vtimer == vcpu_vtimer(vcpu);
		map->emul_ptimer == vcpu_ptimer(vcpu);
	} else {
		[...]
	}
} else if (...) {
	[...]
} else {
	[...]
}

Which contradicts what the above comment says.
What did I misunderstand?

Thank you so much, any guidance is much appreciated.

Wei-Lin Chang

> +		 *
> +		 * We update the hardware timer registers with the
> +		 * latest value written by the guest to the VNCR page
> +		 * and let the hardware take care of the rest.
> +		 */
> +		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTV_CTL_EL0),  SYS_CNTV_CTL);
> +		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTV_CVAL_EL0), SYS_CNTV_CVAL);
> +		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTP_CTL_EL0),  SYS_CNTP_CTL);
> +		write_sysreg_el0(__vcpu_sys_reg(vcpu, CNTP_CVAL_EL0), SYS_CNTP_CVAL);
> +	} else {
> +		/*
> +		 * For a VHE guest hypervisor, the EL2 state is directly
> +		 * stored in the host EL1 timers, while the emulated EL0
> +		 * state is stored in the VNCR page. The latter could have
> +		 * been updated behind our back, and we must reset the
> +		 * emulation of the timers.
> +		 */
> +		struct timer_map map;
> +		get_timer_map(vcpu, &map);
> +
> +		soft_timer_cancel(&map.emul_vtimer->hrtimer);
> +		soft_timer_cancel(&map.emul_ptimer->hrtimer);
> +		timer_emulate(map.emul_vtimer);
> +		timer_emulate(map.emul_ptimer);
> +	}
> +}
> +
>  /*
>   * With a userspace irqchip we have to check if the guest de-asserted the
>   * timer and if so, unmask the timer irq signal on the host interrupt
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index a102c3aebdbc4..fa3089822f9f3 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1228,6 +1228,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  		if (unlikely(!irqchip_in_kernel(vcpu->kvm)))
>  			kvm_timer_sync_user(vcpu);
>  
> +		if (vcpu_has_nv(vcpu))
> +			kvm_timer_sync_nested(vcpu);
> +
>  		kvm_arch_vcpu_ctxsync_fp(vcpu);
>  
>  		/*
> diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
> index fd650a8789b91..6e3f6b7ff2b22 100644
> --- a/include/kvm/arm_arch_timer.h
> +++ b/include/kvm/arm_arch_timer.h
> @@ -98,6 +98,7 @@ int __init kvm_timer_hyp_init(bool has_gic);
>  int kvm_timer_enable(struct kvm_vcpu *vcpu);
>  void kvm_timer_vcpu_reset(struct kvm_vcpu *vcpu);
>  void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu);
> +void kvm_timer_sync_nested(struct kvm_vcpu *vcpu);
>  void kvm_timer_sync_user(struct kvm_vcpu *vcpu);
>  bool kvm_timer_should_notify_user(struct kvm_vcpu *vcpu);
>  void kvm_timer_update_run(struct kvm_vcpu *vcpu);
> -- 
> 2.39.2
> 

