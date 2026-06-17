Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC18CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 02:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sh64gIF09BcO/9gKi7ofc3N57Hdz3j3jieHCf8F4lzc=; b=LON3qBORack7VRHtBIuniOaU9R
	6mSzoT5PAq973OmwkF03CJu5hL1B2bfkPrhZAc0rdhyLsEjwopozqWRi3pZrYWZzLtVGsAX5135Vo
	MVGYVl74nX4DBNUSztq7RozKXpOwVNgH2D17hFEQuwfC5t+5ijA/16cSPk0LbjCY9uyaJyk1DATOM
	fgK8QPysUkdE3v2wnhgf3Hd8xQc31a8tDVH3mmR/5BaQRPHo+j4nI1YS6fAl+V345w3xn2fr9oDZR
	LOJwN8Iw1g2Si7wNuaHrku5oAWpjC4Z4xmbRoiobj9NW3PX9yxKfT/BfhE1YSFs3c7tw/9R71BoDq
	pOBUxBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgP8-0000000GWem-2N0L;
	Wed, 17 Jun 2026 02:53:26 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZgP5-0000000GWeK-0f1W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 02:53:25 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6912f4acca4so9299260a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 19:53:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781664801; cv=none;
        d=google.com; s=arc-20240605;
        b=hILhCVP2IyvljX3yYwe5r/324wYcmx8edSr7qK/jVHYcT/gQemkb8lZRGi+GX/mjoT
         VxPX+PzXj9GWaVVO9AQKV3bv8v3A1zY/2qrVBO9N9lW0tP5xRN1FlSeuyQCNu6QeGlrV
         l2yO/M9HZ0Q/AlLmQH5gumYk1Zpq8v3LyScliXNNXOUyP6ZkIIT9kSYBX1TpHSQ69X6j
         FGFekElP34p1XzP0vtC5Lean2YDsxAt9TgawuJzeDt+nk0pnRYQRuLpl0b7DZLV8nsrZ
         SdUACpC4UY4ugVqRMsm/U65pUmXeP7OnECqSZkSpq/5mkluf9tHQK1jDQmHr9yQcWjWx
         j6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sh64gIF09BcO/9gKi7ofc3N57Hdz3j3jieHCf8F4lzc=;
        fh=KTYGhPPwODZVyVHU9OHMwOKfypBR7v180pSXch4Xzs4=;
        b=SCf+CeGg381JcEAIm168rSlAj4GzHFtmPwDHSHtgkSPJkZrsDqRb2tY35jWzcqqH0d
         a15PkN3D/S8FW0EPrLnuIFqGx5MHZ0c27hrs0NLw/hxHEPdUy2xpQYgeEZce0WXTN63w
         BZUhzDDgad8VIkVyagnSda7pL9V2BGc/xQrsRjfQy32isT5g0+Wvw03dlNdgNwB59Xev
         JB1EiJNskPjqfnJGzg7cikoLDoGbr1FlEpx+hLA8gZ18TAajs+kZGCfo1hVwvGtzXptm
         H7UMZRPtYuOWSM7sW0u7WwIITF8ijmj7NjPyzqwQl4Ye56YYmON14qLeRwXnbKE1ea+A
         ftGA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781664801; x=1782269601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sh64gIF09BcO/9gKi7ofc3N57Hdz3j3jieHCf8F4lzc=;
        b=MWpQhWR12f8jsKY4QfMo6FqLdME9pI8FgfQQmbgtG4Vung6lOOYwGL+Salh4sghuzK
         7vjLsNjjBigqDWYrXj61Ue5mi6Q6Dft8jQ2Eq8xqkq+MZiDNflL8MCEERFf+bbfq2QI3
         nZg4nKIUB75sfFN2a54EyXPjslxCvAEEigrjxneeVfWmfnhkp27ZImXgTOKjpHIvDOI2
         r4p8IyEwuLluYlZPQ7qftq58djDgxeLP27KGNUq4PHZSbRejGDUGnMA9KjJoKiCz+2eZ
         XdGYam41cLMCWkJDTqeqGT1s4j8nbdNUInpZX6k2W7w7uZ/HQPrw8YDvEhlFpATL0BUe
         ydxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781664801; x=1782269601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sh64gIF09BcO/9gKi7ofc3N57Hdz3j3jieHCf8F4lzc=;
        b=ibrcme+txoYzh9g7uu/ODTNRsjdra3TSv3BERBZNpuqhV9hOUtpasW9LObsuKWxlii
         BVk1rUbd+eUSea7hp7k4CB78qiAnhz8MexpwYLAGntVfgYJiOaBvTxq6w4MCuI74uBnh
         NTlhHMK1aRMAs5zqgsVU2XrKJ2xCIFf9q4iqGR3rGQdoAOUHwDH5mzxC4EOuhR+phMkC
         NP0Xr8Dm2sZgzvKMAoEYYd9eOOIHgOL29fngpqRdfiToprhEWgxJArCFIArfucPOygCd
         7+2gPqz7BGDCx1d8zdVyp4KL5lUsc2k1wA6/ZL+DFcOsgc4xbgrV03NuGQdPb3ONmHUG
         XKEg==
X-Forwarded-Encrypted: i=1; AFNElJ/8zs4+vkvV9qKqiQWbn3AudLTGRqNKeXVAO3sUFo6tgRcikNlw8iVysL9+bSaWoXDUl3muSmvQJ+g/c+2hZ9f2@lists.infradead.org
X-Gm-Message-State: AOJu0YwqRlkbyzlz/Z+3Wjb73sbrFq7u+xox5xLqQvReDk832UwiyKHM
	lkngAKRfKZ91khjf0cVtrVpVa/gGI04nPLS/C1tOvEkfbujjb7VIzunXsKR87EB5NVvUv74o6K/
	BrnaJsJYQMEAY5pT8Mt4NDgHv23kNCsA=
X-Gm-Gg: Acq92OGOedtCknBLUyOyHcx634fcEWYnRjsilTe5ZBKIOnTgo2ggawJguS9K0GtSqut
	YmpTV9uplk1VHNDREsa24ZPFEiidSTF0+FJdYutEPBdBWJVwTIlI1U1+nDTKxzyU7vEefVJb8Jx
	omD0utgUh8Mtuj1CQQ5pnuJjC00Chdlus08T5CmM05/a/moXUt7DWoXuC5/BWzCxJ7DUmxqTnbN
	pOlD91X9Tx1iv6SGy6plNgCEMEVXB/8B7vqG9D3E0bMBoxeyVJ+FXMawKnd5lCXWcCtKVMyDlCi
	INvSFV+QefKqLvHh0VXfFczOO7HTVQ==
X-Received: by 2002:a17:906:6a16:b0:bef:1df6:12f2 with SMTP id
 a640c23a62f3a-c05a4e0f10fmr128192266b.18.1781664800942; Tue, 16 Jun 2026
 19:53:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260616114943.81188-2-bestswngs@gmail.com> <ajGur_YEMoMLZPSF@kernel.org>
In-Reply-To: <ajGur_YEMoMLZPSF@kernel.org>
From: swing sze <bestswngs@gmail.com>
Date: Wed, 17 Jun 2026 10:52:43 +0800
X-Gm-Features: AVVi8CfN6BtGW9POfmFZun5i37f-3gFLrO1XOTWCGLSzrmyy6mEwi_EP1Bbx_rk
Message-ID: <CANgPUi2Rs0YJ3TvZSLGz1d8oFdo9oUiQFrPN-C=DPgucO9-W0w@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: nv: Translate vEL2 PSTATE to EL1 in kvm_hyp_handle_mops()
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jakub Kicinski <kuba@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Kristina Martsenko <kristina.martsenko@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Zhong Wang <wangzhong.c0ss4ck@bytedance.com>, 
	Xuanqing Shi <shixuanqing.11@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_195323_236398_F2A34050 
X-CRM114-Status: GOOD (  33.81  )
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

Oliver Upton <oupton@kernel.org> =E4=BA=8E2026=E5=B9=B46=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=B8=89 04:14=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Weiming,
>
> Thanks for the fix.
>
> On Tue, Jun 16, 2026 at 07:49:44PM +0800, Weiming Shi wrote:
> > When a nested virtualisation guest is running its virtual EL2 (vEL2),
> > fixup_guest_exit() rewrites vcpu_cpsr() to the guest's virtual exceptio=
n
> > level: a hardware PSTATE.M of EL1{t,h} is presented as EL2{t,h}. The
> > hardware, however, executes vEL2 at EL1.
> >
> > kvm_hyp_handle_mops() runs on the fast guest re-entry path, where it
> > clears the single-step bit and restores SPSR_EL2 directly from
> > vcpu_cpsr():
> >
> >       *vcpu_cpsr(vcpu) &=3D ~DBG_SPSR_SS;
> >       write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> >
> > For a guest hypervisor this writes the vEL2 view (PSTATE.M =3D=3D EL2h)=
 into
> > the hardware SPSR_EL2 without translating it back. The fast path re-ent=
ers
> > the guest via __guest_enter()/ERET without going through
> > __sysreg_restore_el2_return_state(), so neither to_hw_pstate() nor the
> > "return to a less privileged mode" safety check there (which would set
> > PSR_IL_BIT) is applied. The ERET therefore restores PSTATE.M =3D EL2h a=
nd
> > re-enters the guest at the real EL2 with a guest-controlled ELR, escapi=
ng
> > stage-2 and the guest/host boundary.
> >
> > This is reachable on a kernel with FEAT_MOPS running a KVM nested guest
> > (kvm-arm.mode=3Dnested): KVM sets HCRX_EL2.MCE2, which the guest hyperv=
isor
> > cannot clear for its own context (is_nested_ctxt() is false), so a vEL2
> > MOPS exception is taken to the host and dispatched to kvm_hyp_handle_mo=
ps()
> > with VCPU_IN_HYP_CONTEXT set.
> >
> > Translate EL2{t,h} back to EL1{t,h} before writing SPSR_EL2, mirroring
> > kvm_hyp_handle_eret(). For non-nested guests vcpu_cpsr() never holds an
> > EL2 mode, so the translation is a no-op and behaviour is unchanged.
>
> The changelog is unnecessarily verbose, instead:
>
>   kvm_hyp_handle_mops() resets the single-step state machine as part of
>   rewinding state for a MOPS exception by modifying vcpu_cpsr() and
>   writing the result directly into hardware.
>
>   In the case of nested virtualization, vcpu_cpsr() is a synthetic value
>   such that the rest of KVM can deal with vEL2 cleanly. That means the
>   value requires translation before being written into hardware, which is
>   unfortunately missing from the MOPS handler.
>
>   Fix it by directly modifying SPSR_EL2 and avoiding the synthetic state
>   altogether, which will be resynchronized on the next 'full' exit back
>   to KVM.
>
> Also:
>
> Cc: stable@vger.kernel.org
>
> Definitely meets the bar :)
>
> > Fixes: 2de451a329cf ("KVM: arm64: Add handler for MOPS exceptions")
> > Assisted-by: Claude:claude-opus-4-8
> > Reported-by: Zhong Wang <wangzhong.c0ss4ck@bytedance.com>
> > Reported-by: Xuanqing Shi <shixuanqing.11@bytedance.com>
> > Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> > ---
> >  arch/arm64/kvm/hyp/include/hyp/switch.h | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/h=
yp/include/hyp/switch.h
> > index e9b36a3b27bbc..a6b7963ddbf0b 100644
> > --- a/arch/arm64/kvm/hyp/include/hyp/switch.h
> > +++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
> > @@ -448,6 +448,8 @@ static inline bool __populate_fault_info(struct kvm=
_vcpu *vcpu)
> >
> >  static inline bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exi=
t_code)
> >  {
> > +     u64 spsr, mode;
> > +
> >       *vcpu_pc(vcpu) =3D read_sysreg_el2(SYS_ELR);
> >       arm64_mops_reset_regs(vcpu_gp_regs(vcpu), vcpu->arch.fault.esr_el=
2);
> >       write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
> > @@ -457,7 +459,26 @@ static inline bool kvm_hyp_handle_mops(struct kvm_=
vcpu *vcpu, u64 *exit_code)
> >        * instruction.
> >        */
> >       *vcpu_cpsr(vcpu) &=3D ~DBG_SPSR_SS;
> > -     write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> > +
> > +     /*
> > +      * For a guest hypervisor, vcpu_cpsr() holds the vEL2 view
> > +      * (PSTATE.M =3D=3D EL2h) installed by fixup_guest_exit(), but vE=
L2
> > +      * runs at EL1. Translate it back before restoring SPSR_EL2, as i=
n
> > +      * kvm_hyp_handle_eret().
> > +      */
> > +     spsr =3D *vcpu_cpsr(vcpu);
> > +     mode =3D spsr & (PSR_MODE_MASK | PSR_MODE32_BIT);
> > +     switch (mode) {
> > +     case PSR_MODE_EL2t:
> > +             mode =3D PSR_MODE_EL1t;
> > +             break;
> > +     case PSR_MODE_EL2h:
> > +             mode =3D PSR_MODE_EL1h;
> > +             break;
> > +     }
> > +     spsr =3D (spsr & ~(PSR_MODE_MASK | PSR_MODE32_BIT)) | mode;
> > +
> > +     write_sysreg_el2(spsr, SYS_SPSR);
>
> As I allude to in the modified changelog, I'd rather we just manipulate
> the hardware value of SPSR_EL2 directly. We already do this in
> kvm_hyp_handle_eret()
>
>         spsr =3D read_sysreg_el2(SYS_SPSR);
>         write_sysreg_el2(spsr & ~DBG_SPSR_SS, SYS_SPSR);
>
> Thanks,
> Oliver

Hi Oliver,

Thanks for your review. I will send the v2 version later.

Best
Weiming Shi

