Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914F0CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LI+L8RU/Qox9q/iASiRe42zZZU6YPbY4gXzweQXOL08=; b=q5aim5MmJVi1jLYmX+k/hjtl3v
	J5Lu4l3H+xTlMplHGOxsY5Pkfjh/9Ngiefdts00rO1W2VZEOY+dvLTf9T6F0uCuLMRLFO+4uB8Gzh
	J2RwidvZq6wcJHR7xd492cO47Lq0hIgjYMni0fOxXvOWMOKRhb7aAlreqwG79f/Fj2Ax2iYXGFB2S
	M0k9FSqbHlLHG0keZJJ47ino0hYI5erCfTuq0Oxzv3m6ZME3dsudB5gGnwdABmVI+XVuvjxzxUEPU
	GQuW4d3heZSYxqWyIGkFNIsRe8ytnksJIbSWrxRnRiBzA3NNwVqOMqpuG2gvUixC538I/QXLKpUnL
	1vvX5RHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU89A-0000000BhzI-1l9t;
	Mon, 01 Jun 2026 19:18:00 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU898-0000000Bhyt-2WCO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:17:59 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50e61648f10so5251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 12:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780341476; cv=none;
        d=google.com; s=arc-20240605;
        b=f15VN+pZ6N5QaDmhy+1NvjgW6wM/Yqy2yEhOebMDN/wygUWE8IvL2Mh4AKMIaLXqWa
         Qqw8YgQVQnMxH1wQP9UTrE7+1KszvI/rSe5MZsNkYF2UnTBkMsl5fhw2klWxb+RKB00r
         XASRn90EfzaYAPsQcu/bd6graLW575/kV/5hcxGw60OaR8DNoC6mt8W5bczPB9LXkiha
         y2n1Xrn1Vp0qnD3szXbg9B3iCSuKDRYcYl3rvaqWrxUcAvo7k6nVRD4Gmkh+EFuJMY0L
         Rf/WMl9HqQAmew+4sSZQveTrl0Vy7UGkXHb2dgCfIQC2g7Uxfj/sSpnQjkUvDKDGazhN
         AJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LI+L8RU/Qox9q/iASiRe42zZZU6YPbY4gXzweQXOL08=;
        fh=/L2D784padHccCTgEThBAYC0vV6oYBQL8vpS1a58MkI=;
        b=UOCuIi48JxuCJruf35NbTf6ZJU0wxpT//3Pk/4rtqaSb7ulTwsRh7y3dxpvy9cqvvW
         0jK98z+/pNUIDFZfKqBrFDLDpPLInzElpJmUOhoIA/Q7TuUN0dEBKFOkbj4pbdSk9Hbm
         XY4qcWC18T1j3PG0WKArtktoAIKzEcJIe9Z3LgchkkYVh6flY//OlWSYdWruIhvmvcSt
         ClfUDm13NPk6q8NXfHtKnGxd+OWyeNVdB11QwF/7YHzdineW5Nsrzzaw87667qTHmBFP
         fmeDxuaE9zUjfVwcCtF+pbE1nV+FZ8ZQFbsoud1UEcYiP/yAWSUZ7ihtlRxCAoc9D8+L
         NwVA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780341476; x=1780946276; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LI+L8RU/Qox9q/iASiRe42zZZU6YPbY4gXzweQXOL08=;
        b=mcegGjdrhoI/4PuWTnfWPQE7cMtjvvkorDqy7KCCXO6Z7AE5woXg6BYEfvmLRRVCe1
         A8DhesxF7hF35NYf5obb/P2DmfkD0sC3jW2vJddUHPdwKDVnAqIVKgd75mQeljdwBSWG
         xVAcFXSZlil2WtMl9JPZCv6ZCa5GeXze+oBPqg8ja/sW+Hp2sN+wl5ZyuItmgFxMDwWF
         lEYg223e3yzNwqF1X7ucyKfmAoD4+jrCsqhPVlPi5Ol9gKDDqcb2oJSnCulkNYPzOLxp
         HZ+UU/gT7FmkO6hCjhSwMc3qiBepfKWBhfeEa9PDt8haNrIsWbagFVc1n3vMC0/vWV7p
         jK2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341476; x=1780946276;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI+L8RU/Qox9q/iASiRe42zZZU6YPbY4gXzweQXOL08=;
        b=s8XkZZQaIrnZsXXD4Y/E0ekugmV11PeHJQTqR7J3Tv3n5+BC3Cwbdap9Xck7vgT/EG
         q6htAQKsWR3o3PruwpLDCtfD2tcmZk8COOWq8KogbzLQPnt114UzMsIvbpMTXI2GqhAb
         g7cYMfV3I1lTpgUSAOIOma+PDBSYPuZQrG9kg/lGmYMQj7640i3byL/SdPGY/owb2bGH
         0wslu643usfW2stoY1A3mFxQGBwg9Jub9Fs+n8Y4U7wM7DH6K+ZSstFd073/OC4zEukc
         j/l4IPrWl1Wro/fmP1S+POIj+5jDezO0IYyEfnKvG+2LJQnBGF2tNYCz2MqLMJK/OFgO
         yeZw==
X-Forwarded-Encrypted: i=1; AFNElJ+LX2ZlyAfmG9Re3ru/oqZdKrt+Xh0WWaY4HH8i2nNxSWzxG4hX1Yjz1SF1m3scFP84DZPAeN0pcQeGWMKLq0CB@lists.infradead.org
X-Gm-Message-State: AOJu0YwIVK8MFvFZfjm0BnF1FeA/RROZEYoUEBGNfBdtrwU2naxRcGfF
	07srDQ7XrJNKW9wFvXJmnL9S8Lx08xeHnem+w6BsnyWSDA41cww60PG1lnyXQMStk0W+frDc90N
	5JGTwgAkWMedS1Lw2qgkCr9XIp5zj3l2YqAuSXraG
X-Gm-Gg: Acq92OHKITM2/PvewlaWAmxfBHID+ccdFZM/KLsQqe569ln49OHTBBmg370UcbPwzhU
	EY+RSmzeDQjmo2MSXd2lLCCx+kt4n7ORFs64qutRic8hl3fcZ2oYe/uPfCWGjFVEVM9g+jiANM+
	S/lSeMyNSdM2F0duImJBiIg+PPnxgjNypWdW4cM81L/CssdWYlerYQtVNVRo9IpXeEhI6/otGw1
	ddHzwlifJJuxKt0xpuSnR3Y+NnbQdWGKeBiVcTjbjG4DbB9mU9EY/gsOCUZvEGBoMwaifDYOQHK
	vFoxSLLYrT3gpLiJU9mm/BiDpUNyjw==
X-Received: by 2002:a05:622a:5c87:b0:517:591f:d116 with SMTP id
 d75a77b69052e-51766d32b94mr2426531cf.0.1780341475700; Mon, 01 Jun 2026
 12:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260531154548.1505799-1-tabba@google.com> <ah3agGh1s61HKiPG@kernel.org>
In-Reply-To: <ah3agGh1s61HKiPG@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 1 Jun 2026 20:17:18 +0100
X-Gm-Features: AVHnY4JAw4mChCz3TurVLTKFNFnjr7AvqRDIeObJ6oWYUr7X71eD3nmvJ-HzDCw
Message-ID: <CA+EHjTyLWoM6_pSzC4bqN+EKpuAtDoKOZN39B0UMR_Va5Af_XQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Flush HCR_EL2.VSE to deliver SErrors to pKVM guests
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_121758_669694_15962DE1 
X-CRM114-Status: GOOD (  25.09  )
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

On Mon, 1 Jun 2026 at 20:16, Oliver Upton <oupton@kernel.org> wrote:
>
> On Sun, May 31, 2026 at 04:45:48PM +0100, tabba@google.com wrote:
> > With pKVM enabled, the host injects a virtual SError by setting
> > HCR_EL2.VSE on its vCPU copy, but flush_hyp_vcpu() only flows TWI/TWE
> > into the hyp vCPU that runs, so VSE never reaches it and a deferred
> > (masked) SError is never delivered. VSE is a host-owned injection
> > control, not a trap-configuration bit, so restricting the host's
> > trap-register values should not have dropped it. Flow it on entry;
> > sync_hyp_vcpu() already copies hcr_el2 back, so delivery is reflected
> > to the host.
>
> Might be worth mentioning that flush_hyp_vcpu() also forwards VSESR_EL2
> from the host since that bit is _just_ out of context of this diff :)

Sure, would you like me to respin? Or would one of the maintainers
kindly add that? :)

Cheers,
/fuad

> > Fixes: b56680de9c648 ("KVM: arm64: Initialize trap register values in hyp in pKVM")
> > Reported-by: Sashiko (local):gemini-3.1-pro
> > Signed-off-by: Fuad Tabba <tabba@google.com>
>
> Reviewed-by: Oliver Upton <oupton@kernel.org>
>
> Thanks,
> Oliver
>
> > ---
> > Not an urgent fix. I should stop running Sashiko...
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 06db299c37a8..9e4a20df6409 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -129,9 +129,14 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
> >       hyp_vcpu->vcpu.arch.ctxt        = host_vcpu->arch.ctxt;
> >
> >       hyp_vcpu->vcpu.arch.mdcr_el2    = host_vcpu->arch.mdcr_el2;
> > -     hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
> > +     /*
> > +      * HCR_EL2.VSE is host-owned (a pending virtual SError to inject), not a
> > +      * trap-control bit, so it must flow to the hyp vCPU alongside TWI/TWE
> > +      * for the vSError to be delivered. sync_hyp_vcpu() reflects it back.
> > +      */
> > +     hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE | HCR_VSE);
> >       hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
> > -                                              (HCR_TWI | HCR_TWE);
> > +                                              (HCR_TWI | HCR_TWE | HCR_VSE);
> >
> >       hyp_vcpu->vcpu.arch.iflags      = host_vcpu->arch.iflags;
> >
> > --
> > 2.54.0.929.g9b7fa37559-goog
> >

