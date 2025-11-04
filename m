Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0F1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5T9Z6UoyDLZbu/1k5b1T2wqbCAFrlV4h6XEJSvtC98=; b=XMTzGDBHyJq+moBmMQZ8Q53Zzi
	6/sRT1tLW+ZFcj9V+aNx94a7R23LeOXDIZ8sMcAcEpU/ImjFMVZ/+Ikk7QyOZNBWv7siEt1gnchEp
	Ox96/4scQdUrMfybt8eOIEJYkkvnOvcWF0gPUR1aKDAOq0ijX4finFFe6u5skPOYWcUXjhyHr7KQj
	i4sdVDi3z8d2uraR8Hw+b3aFtraODtHZg7HJdU6/LsNNC9omoZag34JIG73wHSn8trwrMPkZozByU
	ZN9TxCsmtPhNZsHQ3P9RoptIS1TqZikwdngdXKXdH06IQZWh1fwRocBJoawZ4fwXxwh+8ZKJQwn2o
	RW4lmTEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMKz-0000000CSzQ-1VnQ;
	Tue, 04 Nov 2025 19:05:01 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGMKx-0000000CSym-1XAL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 19:05:00 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4ed67a143c5so30671cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 11:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762283098; x=1762887898; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5T9Z6UoyDLZbu/1k5b1T2wqbCAFrlV4h6XEJSvtC98=;
        b=bCB8mteCOAFQVsXHarB3+evFYHUft85dIQVwmTl/uIog6p+E9VhZONEfEbK48+tIG1
         URIUXwBGeiIPB7tgLuXAlOQIAVVUxqQB5v6axK42B2lbWoRsJf7yVBEh0AQUo4c+wUsQ
         LeEM6Wl506hBkyOmdUGmniEz1g8EcYhBvtcvjAimOYRvpqpTYIOtbgX6wBViEeA6nNk7
         CDhVfHd7JpSbk3xTVwmAKi6qYPX+cFhmrb/1d8TSspu202PGRRSYJtXWw1iZXgw/Umbb
         SYTPkl9zffArzLnJKxjhFXfMzT7mSa8Pz+CW5FhNAgd34+14WMaPgxXtIvf1yd0AHCzb
         TC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762283098; x=1762887898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5T9Z6UoyDLZbu/1k5b1T2wqbCAFrlV4h6XEJSvtC98=;
        b=vM0F20MqhlerL7jJOHDNSzX6OWCAs4hcoNdK4tEwed3inr1xqIBNFNVO0jBg9GBAOB
         tGhHgzKlqyRtEtwgIF1VF6yTx3vPR8ESxyUJrV4Gv1+ZLMRfA1YG8/WPTtkJ2tIgRT4o
         KipUN+1RGubi0JM+UIU4JGDR5oYvJbGGVw1T5uVwsXhrCot4x504pogzW2uueN6dwouI
         XgzfPBq9+Cid7DmPMTowXcYnQOS3SODAU/fszdb9vwOzw2XSGCj0o8RTKMbtl7IuLpBm
         /PXvWiJhSlGKBIr+CRt0QkCUbxiswb2Frnya+5hDFufZjU46uqw5tTwveWKyhfC2F65G
         l9qg==
X-Forwarded-Encrypted: i=1; AJvYcCUfj66IS6xSadCIZR7udXVgOgKhuBhXn1zLGPMuQoJQwUfvRRjSL2qZtyDWxPsYV37Vo+fd/NhLR4c4oapBe5mx@lists.infradead.org
X-Gm-Message-State: AOJu0YxqAUNPqc5+MRruKmtOPDhBUh9LnjIbyuz321laLGrVUO6OH6JP
	rU9GL73dTRIS6QfbHRIA+uvIe3CE/dASChLUMHmuX4EjgH6UaM/3FwkeLO4l1fbtSQQzKkPZmIR
	8e5wh2QCKB6rJxE71fXrFanuDFxC2xfSBCANH5ouu
X-Gm-Gg: ASbGncvzvR8ef4jjdSBF52ImUNi2CMy43RN5tdKPA3T67Ls0VoCi8Lb+uouFg0ZIJCW
	hoaZXhppi8XAZEtMCWur7ZVXe35IPOfenvvk/QuY7n6SEcRAOlGaZKwE3rxMAPt3fQyRyDxfYTM
	R18gVU4IceGWmxoqos/VaWULSm3e/M4syx1rUeFxjzD3abk26N0IDFW5lv1GYlCXJyKPqUFHhI8
	kc2QfC1yWaq8DrCQabf0Bo20fe1o0/W0ASPIpNLeeqtjybqXeDkpFLZklaUVA==
X-Google-Smtp-Source: AGHT+IEXght+18UDdhRYqn8WNnXdZZ8DDF1K4rJ6QojfMfxG5vWmOJEkSqYHurrMJLnbhgGwTwCMYgkHt1EiuY3Gy5Q=
X-Received: by 2002:a05:622a:14d4:b0:4e8:85ac:f7a7 with SMTP id
 d75a77b69052e-4ed7369911dmr416821cf.9.1762283097763; Tue, 04 Nov 2025
 11:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com> <20251104125906.1919426-6-tabba@google.com>
 <a0b19558-dbcb-4231-b0c4-302cc10652db@arm.com> <CA+EHjTwPqm5wkmdGK60sn+S9BizK6LG5bSqWQLigsZVgXoJmUw@mail.gmail.com>
 <fbe0d81a-c4c2-46f5-b809-1b74f9307c98@arm.com>
In-Reply-To: <fbe0d81a-c4c2-46f5-b809-1b74f9307c98@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Nov 2025 19:04:20 +0000
X-Gm-Features: AWmQ_blncW2qCzgwgBP6dGyIM6hPJ2g29b3o7-4BRp6ltNDvSRRT2ZrMeg3mfYI
Message-ID: <CA+EHjTxVFOj+NXt4eQupHNUBB4UwwMQEuhGiGo8F=nX3tjmZOw@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] KVM: arm64: Fix Trace Buffer trap polarity for
 protected VMs
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_110459_417381_286D0849 
X-CRM114-Status: GOOD (  23.86  )
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

On Tue, 4 Nov 2025 at 18:03, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> On 04/11/2025 17:56, Fuad Tabba wrote:
> > Hi Suzuki,
> >
> > On Tue, 4 Nov 2025 at 17:50, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
> >>
> >> On 04/11/2025 12:59, Fuad Tabba wrote:
> >>> The E2TB bits in MDCR_EL2 control trapping of Trace Buffer system
> >>> register accesses. These accesses are trapped to EL2 when the bits are
> >>> clear.
> >>>
> >>> The trap initialization logic for protected VMs in pvm_init_traps_mdcr()
> >>> had the polarity inverted. When a guest did not support the ExtTrcBuff
> >>> feature, the code was setting E2TB. This incorrectly disabled the trap,
> >>> potentially allowing a protected guest to access registers for a feature
> >>> it was not given.
> >>>
> >>> Fix this by inverting the operation.
> >>>
> >>> Fixes: f50758260bff ("KVM: arm64: Group setting traps for protected VMs by control register")
> >>> Signed-off-by: Fuad Tabba <tabba@google.com>
> >>> ---
> >>>    arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
> >>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>> index 43bde061b65d..df0c59a29b35 100644
> >>> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> >>> @@ -118,7 +118,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
> >>>                val |= MDCR_EL2_TTRF;
> >>>
> >>>        if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))
> >>
> >> Why are we checkin ExtTrcBuff ? Shouldn't that be TraceBuffer ?
> >
> > This is an existing bug that needs to be fixed. Thank for spotting it.
> >
> >>> -             val |= MDCR_EL2_E2TB_MASK;
> >>> +             val &= ~MDCR_EL2_E2TB_MASK;
> >> This looks correct to me.
> >
> > I don't thin it's correct. E2TB traps when clear, not set:
> > https://developer.arm.com/documentation/ddi0601/2025-09/AArch64-Registers/MDCR-EL2--Monitor-Debug-Configuration-Register--EL2-
>
> I meant your change to val looks correct.

I see, thanks :) I'll fix the existing bug when I respin this.

Cheers,
/fuad

> Suzuki
>
> >
> >> Suzuki
> >>
> >>>
> >>>        /* Trap Debug Communications Channel registers */
> >>>        if (!kvm_has_feat(kvm, ID_AA64MMFR0_EL1, FGT, IMP))
> >>
> >>
>

