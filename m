Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62204C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 18:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7AqkA7VxQPgZfPJJQENdQorjA4xI23qGRxgmFpnfa8=; b=hIoxjyt/k9LxKG6LmvIfJMmaOX
	xiXkrSLGdyu3QQB3+0ngZiSiwbexvPQYQmaIu9tO7pJnFUJexWp34BDNOsOi0cNuJmZCAP0Q1YUpq
	jyV1WNfRRmr8OMMD18TNzBXrcjpLKr10WR4EQ8SjYXhW84caFWOTmjzLv6D+hQANkiz4WSvGq+kuu
	4ySkYBvc5aXPbh8iSsod/MV7Rn9FB8mFt1kSr+vKq1XSt5OkZKtNPgb5ql8bjQ+tTRbXE28ux3LTA
	IdBxtIcdaT3I56wdE9xGu7xfb33bKCe/rz/2Rh93iEAM6/eZD+Qu4Qi2adlV+pVc0L756CE8TtIR+
	fsU5Tb1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YG1-00000007nal-2DFa;
	Tue, 15 Sep 2026 18:51:53 +0000
Received: from out-162.mta0.migadu.com ([2001:41d0:1004:224b::a2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YFz-00000007nZu-2jum
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 18:51:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=wDUSmz48AJ/AWECTgc5Y2mr8+N5AQyAKi5Db/DMYbBU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789498309; v=1; x=1790103109;
 b=Hy5IqFX/UhCv6eF+r0L0SfczIVWhIV5vcyvfn7r0QYU8kc2zRMNiL0kll+kn19QhUcVWPFPf
 XY2S6pB2YDJKMon2sEaiiqMog06YIkYF9tY50zc5Vtu/ZMG/Vn1+2xZNbeU6YFjIT2KtIDic/6o
 bkHxfv5Q341SgbFI2C9Co6Ds=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0068e441bd757e02;
	Tue, 15 Sep 2026 18:51:49 +0000
X-Mizu-Trace-ID: 0068e441bd757e02
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so1454e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 11:51:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQzZnnu+7CqJbEOyL7mCCVR/dc3N+KlpVMrdF4PO5p8Zo6RS/PqAqA/XOmnnNsz/ZEWtz6aUsowlePk/tKIAZi@lists.infradead.org
X-Gm-Message-State: AFuF++k+nkUiZhqjZBLv1rXmVU6ZQnA5gkG6uyFtdT81DJoDrWV9bCn1
	ki30sgxVowtVwSoS4hJyTJgVWES/Suy4edFCSeaE5ljcSXit5kzTQQJwf6eBmb+oNnk0Dgs5VMa
	OzkC1mL2asLzK0xlCCBmwF6vXN7g1TzpV+6zNa3Wc
X-Received: by 2002:a05:6512:460f:b0:5ae:b9c5:f29f with SMTP id
 2adb3069b0e04-5b8b5c60361mr12106e87.2.1789498308370; Tue, 15 Sep 2026
 11:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260911104715.307500-1-fuad.tabba@linux.dev> <868q5579ol.wl-maz@kernel.org>
In-Reply-To: <868q5579ol.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 15 Sep 2026 19:51:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw0U0d91Cv4NYEJvUuT=JabwZeeYwpZ2P1xyVeOVX46Ew@mail.gmail.com>
X-Gm-Features: AcwNN1Wb_8an225Gnc8YhJ9UZVooFr4-IDtabofiCqvpuVnTcerWsfiGT6Va1mE
Message-ID: <CA+EHjTw0U0d91Cv4NYEJvUuT=JabwZeeYwpZ2P1xyVeOVX46Ew@mail.gmail.com>
Subject: Re: [PATCH v3] KVM: arm64: Trap guest MPAM accesses whenever MPAM is implemented
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Xi Ruoyao <xry111@xry111.site>, Mark Rutland <mark.rutland@arm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Gavin Shan <gshan@redhat.com>, Yuan Yao <yaoyuan@linux.alibaba.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_115151_900592_BB77D46B 
X-CRM114-Status: GOOD (  18.89  )
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

On Sun, 13 Sept 2026 at 11:00, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
[...]
> >  static void cpu_hyp_init_context(void)
> >  {
> > + u64 pfr0 = __read_sysreg_by_encoding(SYS_ID_AA64PFR0_EL1);
> > + u64 pfr1 = __read_sysreg_by_encoding(SYS_ID_AA64PFR1_EL1);
> > +
>
> Why not directly read_sysreg(id_aa64pfr0_el1) and co?
> __read_sysreg_by_encoding() is useful when the encoding comes from a
> variable, but it looks odd in the case of a literal sysreg.

It applies the arm64.nompam override, which is what
finalise_el2_state() tests. With the override set, EL2 setup leaves
the MPAM traps alone, and a raw read_sysreg() would still see MPAM in
the ID registers, so KVM would write MPAM2_EL2 on exactly the firmware
the option exists for. I'll add a comment.

[...]
> > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
[...]
> > @@ -298,14 +298,17 @@ static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
[...]
> >   /* trap guest access to MPAMIDR_EL1 */
> > - if (system_supports_mpam_hcr()) {
> > + if (read_sysreg_s(SYS_MPAMIDR_EL1) & MPAMIDR_EL1_HAS_HCR) {
>
> This is going to suck under NV. The host hypervisor is of course going
> to set MPAMHCR_EL2.TRAP_MPAMIDR_EL1, and we're in for a recursive trap
> on the hottest possible path in KVM. Which is silly as the actual
> write to MPAMHCR_EL2 is free (it lands in NVMem[]).
>
> This really should be replaced by a flag called HAS_MPAM_HCR, just
> like you have HAS_MPAM.

I'll probe MPAMIDR_EL1.HAS_HCR once in cpu_hyp_init_context(), next to
HAS_MPAM, and test the flag in both trap functions instead.

I'll hold off on v4 until Will has had a chance to comment as well.

Cheers,
/fuad

