Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2020CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibhvPjwqpM4eGx3+CK2N8NcqS34AHd1q3JqAVLGl61E=; b=xHjJ0J5L8zkKe5gBKnW1/D9hvW
	CCi6w+IZL4xEq2AXZ3+fW1itLpS1oXQRLKUA2DkISIL020QyX0ZAU6yMzgeUL51EgX7E9K2PukIxm
	jEMyOdjTdiBdxiXhgSUAUb+F8tdnQmjNohA3JJQ0Rdpazn+hDHM+7+1XNyO7f0qcT3ierQmmd3AY1
	cxyQ0O+H8yo3phyem2StXnJljBhyjc6fkPgmJeXcoJYNgQx+pOtbmeP/h/QZWsEH2PN4fXDWaLdEp
	GnWXWY5k2WB5/ZinWge/Skb/3Xkf2CNDXazwr4EL8oB4YtOthGs+pnzt1Lpqfg+ZSMoDdb68YHRtt
	78aYKRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9pW-0000000157s-3Fpy;
	Thu, 18 Jun 2026 10:18:38 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9pU-00000001579-19CA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 10:18:37 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5ad2abf31aeso4473e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 03:18:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781777914; cv=none;
        d=google.com; s=arc-20260327;
        b=lAFV8sUDA+U0T60wx1dLpJcxE2wkkLzOtgDYUpBSa7/cJ3h0msF+y0CCVdotIP+ZR3
         QySdu5TjjXCmXXncQb7IIK+OS7oOCKEDvKIrhKInigQOTvf/kAQktr5mQ9WEXwNEIvkv
         K8IAvJkL7asBoVXkpmN4H4p6T7aApdEYHuZ7nUyZ3QDTQBzXLY2OvlwCPJWb18ygu7ci
         haKkXP/vdp3/CcvpnyyRePPz/Dvqe8QooKWzZNjxUyYh0FGkoIal/VqY5DSiT1M7lZ9b
         u8Inhx3hTfs5Ulk5/mlLXaXX3mf9HMByBiGD6rmTaIvIlfsEpxblAPLOslc9Ef0geqVV
         M0LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ibhvPjwqpM4eGx3+CK2N8NcqS34AHd1q3JqAVLGl61E=;
        fh=GyRI64GOQO1tKfMURylE8kGBsBJ7rSI0GqAccQEE1hM=;
        b=HGz7ZR1Jggi9UJGLkOmNw68XHPSYWgMWaGr+0bv/jSKcXnOX6M12+NlPsHN2+jT7/p
         AB5446Ewz/yVVUB9dpBPYhTBFuHa7lWpxPczt+5wnlvLVVOoW6l+mnJQ8hwvSnfX8ni6
         hfcE8/euwFjf3iCG18Bo/lxq7+ERKB/ldyQ5LKMTsur//DvhXFnVh4Vu3MPMAcukPx1W
         GKeEBzrOmJeZ4SEkVubEzluB6rffB+hOpfKZPXdX148Hl4wFRDhxO+U6NLQCfnTBk0vR
         /H9s6H5d+7eS0YRIkXb0FBJoorJwEAqe81AA2iS7qaELKAmu+d7Y1FiL3JWZ9tQPz4SX
         /OuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781777914; x=1782382714; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibhvPjwqpM4eGx3+CK2N8NcqS34AHd1q3JqAVLGl61E=;
        b=FO1Av+1TTGA73WamkTbjHfhIn1bXX9E7rBMtepVbSJcv+lT7BONavgk8zyY5PGJnCi
         HsHwDWsp9TcUavUbd9r9/nkvIxtmk6ALNJM9QFpxK9vRnS4ramix36uFIyx9mzeL76AN
         sxL+qOpU/bj7uTJK+vO1mPrbnzFbRK/l8FxA6seF7XnX1jNWWJ1EdatxE4ULu2AxkyhB
         72MGQ/QbJSNZyy7EgDSrbdCGZRbyra/+pLChP53LDl0F6xvqgsebik0Vz30Hcs2v9diP
         2J0AtI67Jt1N7t/a9zkDNZzhlG3K7NP0G/O7qEZARiuBxQHGkYNlTiRnSfE5uFUE89Bh
         XogQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777914; x=1782382714;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ibhvPjwqpM4eGx3+CK2N8NcqS34AHd1q3JqAVLGl61E=;
        b=hDn2j9AhxqVqrkXuzvW7pHKVu5dDmnlEJPoKyVi6zE3bvjWvWyQ0wlur3Rig1mdusW
         pMx5CtV+33Aak7PnoS/xb9/12syI9g6zYyLA2O1120d/0IspwsXoe1ujB4BN/AIAlIb+
         rArf0y0RKk6mcxJYYp5FvK13AmcNXmeSvcUQLFnXq2wHzpNg8U95qav5VRLK0tDkYFxA
         S+VQQ+cjm3FR/fCJlez7Yzl0KppgaeJ8PvhVIswMM6A+bpMv6urE+TKIyKqkmHG0SphS
         aNs/PvPen6RGP2i5+rKK+8dAkLPu5+Kl4nyXx6JI8tWurabw8ZS/41hR9uiE52awxFwU
         BjGw==
X-Forwarded-Encrypted: i=1; AFNElJ91MIr5LVmtmONA0gFSbAjTwJN97oNMrsvyUpcVxXbSyPqKPy3L6d3jSRkUMiy89hNetW1uViaTxtRQI1xGcqf8@lists.infradead.org
X-Gm-Message-State: AOJu0YxcZ+ClxLUDQHhK220xQWG8Zo1KttOB0WXsyOcRwbBcr8pxvkTx
	gW7iTFcKQNWYOR2DpHmK7f/YVfRKr1QjIHAdhsnX3ppPT9Z1Q6Y2i65X6iWux+K0TYkwrUduOYB
	qwQBp505Nfmql9KFes4voXWYMR6X/T5zIUQEfDYUP
X-Gm-Gg: AfdE7cnW8UmOR/jV3TVm/Sn3U8BHM1nu7b0cjEr8NrO8dJ5aw4fmGR+uMwJ6lfTljiQ
	ZdFreV9MHWT00Wy9bVoQrzH29eNgq5zouwLIPjGZpwIRDCUO7A9Sly+7zApL7c9Q+p8yn5lGG3N
	78CUX5CaXniCuNCxSTEwCM4ApJUXbebyrpNgREzn4YaYjMmsYTJ3DVA9vgCfeb+rkc9vlxByZ2N
	G0aWs+5zHEhWTeagQ5OyPAcU6TJOWCofO6Ku/afZoJUgQmh4gmp+Mr0jt9C4syOjM966E7W8ApH
	PN/sJd2p
X-Received: by 2002:a05:6512:239e:b0:5aa:6ede:1a68 with SMTP id
 2adb3069b0e04-5ad4db8512amr132698e87.10.1781777913716; Thu, 18 Jun 2026
 03:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260612065925.755562-1-tabba@google.com> <20260612065925.755562-11-tabba@google.com>
 <86h5n0rwfw.wl-maz@kernel.org>
In-Reply-To: <86h5n0rwfw.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 11:17:55 +0100
X-Gm-Features: AVVi8CepfST9Vimf9vJgqw8SnCpHejknggCFsqVgJ1T1PMI5H1qLsWqwdsPK1Pc
Message-ID: <CA+EHjTyHxtyh+CJz=8amZ4bERVazOtYj_qO=BiofxBqZOpjwyw@mail.gmail.com>
Subject: Re: [PATCH v1 10/11] KVM: arm64: Add primitives to flush/sync the
 VGIC state at EL2
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Sebastian Ene <sebastianene@google.com>, 
	Per Larsen <perlarsen@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_031836_345463_0BCF4050 
X-CRM114-Status: GOOD (  24.27  )
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

On Thu, 18 Jun 2026 at 11:10, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 12 Jun 2026 07:59:24 +0100,
> tabba@google.com wrote:
> >
> > From: Marc Zyngier <maz@kernel.org>
> >
> > pKVM performs its own world switch for protected VMs but has no
> > primitives to move the per-vCPU VGIC state between the host and
> > hypervisor vCPU contexts.
> >
> > Add flush_hyp_vgic_state() and sync_hyp_vgic_state(). Flush copies
> > vgic_hcr, the in-use list registers and used_lrs from the host into the
> > hyp vCPU and pins vgic_sre to a fixed value; sync copies vgic_hcr,
> > vgic_vmcr and the in-use list registers back. The active priority
> > registers are handled separately by the save/restore-aprs path.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > Co-developed-by: Fuad Tabba <tabba@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 50 +++++++++++++++++++++++++-----
> >  1 file changed, 42 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 2f165b6c7b07..23e644c24a03 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -99,6 +99,46 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
> >       *host_data_ptr(fp_owner) = FP_STATE_HOST_OWNED;
> >  }
> >
> > +static void flush_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> > +{
> > +     struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > +     struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
> > +     unsigned int used_lrs, max_lrs, i;
> > +
> > +     host_cpu_if     = &host_vcpu->arch.vgic_cpu.vgic_v3;
> > +     hyp_cpu_if      = &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
> > +
> > +     max_lrs         = (read_gicreg(ICH_VTR_EL2) & ICH_VTR_EL2_ListRegs) + 1;
>
> This really needs to be rebased on the current state of kvmarm/next,
> particularly 8cc8bbbfab14c ("KVM: arm64: Bound used_lrs when flushing
> the pKVM hyp vCPU").
>
> I really want to avoid using ICH_VTR_EL2 on each and every entry to
> the guest, as this has really bad performance impacts when running
> this under NV (which is the only way I run pKVM).

Will do.

Thanks,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

