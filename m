Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEDBD31A3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9I9WuN49vDzL3jcHM+WJ2QBCVFtv9a9q6bPtMasJkpo=; b=CQE7CdVimUnjdd2dUe+rg2El8R
	AzaFV6fA+bJy8Hr7RpN+swdLLKqC6EJn2K9xvkkBdBRSnDNEtUfiCMFofmchOLiRLmnpS98h+ycpn
	N9EP5FAVxZrMjbgIZyePTdZKsQdr+R7Ylgt+CzYak9bdcS7GrBULB0jSb50kNv7BrFXbP1tyAuBwH
	8VFzLMz0E+7B1PN7/NsmFYzTu+VD7IgNHI4S11cWvsGL4bs2sIRpngaXVnPiaFu8Iz4DjVmHLoKCs
	iWeE3lzNNoavvLbjMLfF8x+QHK/gF2W/GDTFSt8jHX2KYYKlABxWUMwrH2AvtG68f2r40YAzW6JdR
	fW72Gjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxoN-00000008hOP-0tng;
	Wed, 14 Jan 2026 10:09:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfxoK-00000008hMr-0mcv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 10:09:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47ee0a62115so41525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 02:09:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768385346; cv=none;
        d=google.com; s=arc-20240605;
        b=HwHhLaTcenH6ihYPPjr0RmFGDq/DEw1Au/nnsSDDkF2zv9a0PYIEG3uG18IYwA/D/7
         brGiMVCQ3szcK7Pi1lfkpgi47blAkPQ5oKTLxWJqBA1g/dmUNqvvo7s/vJfUBtNZxJ+e
         v+4qysWx0kwA0QCzUC1Qvxgothek0XhlIlmolk3fAYHw4uTkuTi2kjNQjY8WlQHWTU7k
         5EjvlFpWmqJFgrBFROEkPoKGBK+QFwxGC3FEHWGcqAVkobxRsG7wer20+MKDpck5+G60
         GnAUiPB2UdEMfSL/cbBDCjwBx5Kcl9fH5JMhbZPVEa3w3l1bcIQ2PXhdOtRNTA6s6hCz
         rHQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9I9WuN49vDzL3jcHM+WJ2QBCVFtv9a9q6bPtMasJkpo=;
        fh=zkbee0i+V/ORlzUooLYuChI+DQyXu3NC2Z2+l87Qj6o=;
        b=UIuQ0NwHJCf+xX/e07o6sIHHhWWK3UyyWpoSUvOHvq+19v+vYk4WVDZJ2lml6kRAbr
         02Sfh8FqYIzIAhKMNBHe6UA96ZcL6mTPn0K4U68nVZYEpdWxReH9y70vS5/OemiQODgZ
         xBisXc43oGWRbHbJNDumJwGzGG63s0Eyhq43n5nI71f9ZcMqkDQ9jR0xRYQk4scW2r9N
         le7d9D33A/skt2AlnMO/derH/Q11uLz+wQ8uQwophXiuuHkR7ON0x0e+YXfHmkSpZXxg
         pWTcc2IlPX75kTkwpm44Rs8wlgXU8DDG41aE0eUctKp/MvjihSMDZZwmzq8nQ8braHE5
         DlqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768385346; x=1768990146; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9I9WuN49vDzL3jcHM+WJ2QBCVFtv9a9q6bPtMasJkpo=;
        b=knUFLpbXnFDWARchfc+a/kczTvoMWGajqXMXFspzIZZt01wsEVIP52nDCKL/ZUT090
         V+UlpUpsq4bIOhqa3HMqthGVeEYyZh9iWsY5KT/Bg1+73U130DqGYF8B2T8QoqCRTY1v
         t0dGl+37LmS0Vgyce/PxLCW4Gyzt3aGhJRbCv0xx53r63/yQmYZ7r7ljBg5autr0WV1v
         NYSlf8BoOvZbSgAVpwGsK8hsUCkOCNMAe6JqorTsi9U5aq5vnedUe57LIi2CcJCdrNUO
         Kt9O3PEBbShzsdS4o/THAHqoIDa9nuX7nRXC3rSomYM60P8q+8MCNnaB+f61PEa0/eYk
         Zxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768385346; x=1768990146;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9I9WuN49vDzL3jcHM+WJ2QBCVFtv9a9q6bPtMasJkpo=;
        b=pfpb8U2DoZTshKk/TiBwdygo4SP6psTzTH7FuICQ2nrcZIbKQ1xRfzBc3qzMCsSh9j
         73uQCG9w4KNHElN3DvVZuESsF7naaeo7B7X1UfpS7luibyr5LaB9iULN2XVXhqUP+YXj
         qjOJOTX2r987O+2YnahN7z9DXBWonaHdlzH2VBo2IUcJYNgyw6pvIYkB0ci5r3Y3K2Iy
         krrpSVPs1lBhJz3TMIKW2bopR/YQrQQ4bVAwrrdoqaBTHuTrjd6WVOeoTGe5w8YBSimf
         gxzEImTL6p0wVgvCY5JjCSEqEfmcOjIgreGQfaWPBSZXfPomX2pp0hyNTryrIuYOkGCn
         w8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWnUmTC5KBh2SiREgF9Tv0PfKbluZ3L3CNhuO/lP83iQfCndBTDijRBM6FykNTETOGoXR5E6O4fb86pDX+b1yWq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/ABVpH5Y/TCR21S+5Xa2a8ocMsBtgYTNJcMDOQRxoHSsAo36S
	acXHzFlqkQPcwVSlMdYnVbs20S8FdI5umcjIAsTqfHpoKavZPRx1xogiIOtQzH3EHOMvvXnIWjG
	ac0JrBqcGu83M2QM9RKvlTQU5js2Qme65unPefeBcsDazP8XzcLjNqwlJ
X-Gm-Gg: AY/fxX7FI+/q9WmNNhhUbCyrRUM0ISFPh9dUV4vN6UxGEgLScDufUcwJPxANQIE9YPO
	v8nYJ1W6eAufkODlLu08WUqjfVn2FTipa1Q1YdVj+8dbwagHwavJI4Ee86DdWFLT+VsPie1bMxD
	QLEytzJxDiE+YCnhkebw4iuQz+4MlM3AXGP8AxN0jPjpuH/FZZ+LmH9iZW4Pr05AMrkTVr/ArSU
	7+ZW9+tbSlu0PC4+f6ej5fVc17EtNEOVYoyrLgWXPgiW5uHzI4xuSMj9FMVOq90uI9/lOOqnK+o
	ljtdIPj6HfnX2Snnn5p/ijnrSg==
X-Received: by 2002:a05:600c:4c09:b0:477:772e:9b76 with SMTP id
 5b1f17b1804b1-47ee452990amr280725e9.7.1768385345996; Wed, 14 Jan 2026
 02:09:05 -0800 (PST)
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-19-8be3867cb883@kernel.org> <CA+EHjTwQ4fLBE1YXoB6M0eamSgGDW=nfLaC+-_surBfVbh3byQ@mail.gmail.com>
 <6f0e94ab-7c9c-4705-a90b-aea09ca629de@sirena.org.uk>
In-Reply-To: <6f0e94ab-7c9c-4705-a90b-aea09ca629de@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 14 Jan 2026 10:08:27 +0000
X-Gm-Features: AZwV_QjZbcO1T13jUPtvWgDAfMEoLsYIn7-Rzu9SF6LWm46DZ1iruQdxKvCCi9Y
Message-ID: <CA+EHjTwJw0D2w3oGC_ZSJsciUgiACoLAcRQv+_QSsA_bJKYj+A@mail.gmail.com>
Subject: Re: [PATCH v9 19/30] KVM: arm64: Provide assembly for SME register access
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_020908_288414_0762879D 
X-CRM114-Status: GOOD (  27.72  )
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

On Tue, 13 Jan 2026 at 19:20, Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jan 12, 2026 at 05:59:17PM +0000, Fuad Tabba wrote:
> > On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> > > +void __sme_save_state(void const *state, bool restore_zt);
> > > +void __sme_restore_state(void const *state, bool restore_zt);
>
> > Would it be a good idea to pass the VL to these functions. Currently,
> > they assume that the hardware's current VL matches the buffer's
> > intended layout. But if there is a mismatch between the guest's VL and
> > the current one, this could be difficult to debug. Passing the VL and
> > checking it against _sme_rdsvl would be an inexpensive way to avoid
> > these.
>
> This mirrors the way that we've handled this for the SVE and for the
> host kernel.  We don't really have any good way to tell anything about
> problems if things go wrong inside the hypervisor.

I know this is how we've handled this for the SVE, but back then we
only had one VL and one mode to worry about. The chances of something
going wrong now are much higher.


> > > +SYM_FUNC_START(__sve_get_vl)
> > > +       _sve_rdvl       0, 1
> > > +       ret
> > > +SYM_FUNC_END(__sve_get_vl)
>
> > Since this is just one instruction, would it be better to implement it
> > as an inline assembly in the header file rather than a full
> > SYM_FUNC_START, to reduce the overhead?
>
> Actually this isn't referenced anymore so could just be deleted.  It
> mirrors what we've got in the host code, we have to hand assemble
> everything because we still don't require binutils that supports SVE,
> let alone SME, and that's done with macros that do argument validation
> which don't play nice with C.  Even with an assembler that supports the
> instruction using a SVE instruction from C code gets annoying.  It has
> crossed my mind to inline but it never seemed worth the effort
>
> > > +SYM_FUNC_START(__sme_save_state)
>
> > I think that this needs an isb(). We need to ensure that SMCR updates
> > are visible here. Looking ahead to where you introduce
> > __hyp_sme_save_guest(), that doesn't have a barrier after updating
> > SMCR. The alternative is to call the barrier where it's needed, but
> > make sure that this is well documented.
>
> I think we should put the barrier where the update that needs it is.

That's fine, but then we should at least document this.

Cheers,
/fuad

