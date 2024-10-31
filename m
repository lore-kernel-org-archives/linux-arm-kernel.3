Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E8DD767E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1sBy3DYerOKb4FnVVXzpV5n8XBDQBztfPs4tu9WoeU=; b=bXqvNPNbETq1oLQ7qPO2bKZDKB
	HKEt16lDDiJ3HETRXad7alV7BemjLnLm5vx87A4hwquq3YUzlIy7TvbEbqvMwzbLmBglB8f7qu8E+
	cqKq3VQcmjZy33PJrslKJn+UBIegG0MrKdbtg7HkFcZ2wLaRH6Y8RwmdXS6uDgbKmTb1kE6oezmM9
	QlqQp9R/AiDxZRn9Zmko3QnMLAcbCOxaq01ohsgRLKpb6aRrE6hFvbfujE8arQ9owZMMpLPToKjEZ
	sRnX8u9WDs//sL/duZfVJiqQ9mCkizqTA5KfhMu2KWPRzYrMAdqFaTz4sivkZ6cgqM14KOjsu4wD/
	e95PJDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YR0-00000004GLI-1KPK;
	Thu, 31 Oct 2024 16:54:10 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YPL-00000004GDc-0FlU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 16:52:28 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-718062c1989so52449a34.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 09:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730393546; x=1730998346; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1sBy3DYerOKb4FnVVXzpV5n8XBDQBztfPs4tu9WoeU=;
        b=Tit3+uvtGJrbg4CvyoJhVOKKcMPqMTD7sVnyk4137Tt+Dyt4xk7GKcMtkTCAm/zSZ9
         O7EIajFuAuE8Mz4ndewpGOPKRW3vtR+1bPT+li7UfVNx+PXJ1xrs4bQlQigGye/dCRMb
         JUvKk7tZhuNPMVItR+ENxAFRUbZhvZIsizCmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393546; x=1730998346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1sBy3DYerOKb4FnVVXzpV5n8XBDQBztfPs4tu9WoeU=;
        b=ODPTez0Oen67QU0bnl4XrMUqew5WoR4YScdp3DVt/QSbIPCxB2GiXrWrDGCbKsvSvd
         Y9wfdddlIf23lgAnktt93UQO0S0Qm3XbjQJJTO5DMok5U8hWkXiW6Qahr5RfTClKJAWp
         GfOkxriACAhgP290YGwMA8W/1EHV7sulLuOXBly6idq3xTDXXNLH3b5nXLd+1JAvMwiz
         098R1ZvY/VQ57AjQr/CJLCKhu7gBXbeVOajUJsWsyWoMai4az3OfHr310L17SwkZvPEA
         6j75zi4+OJ8Nj8WbWZZ7HM6DEC1JlLXNLuNWElIQrP3SAUW+TGggtYEqeR2oGlKNBXOy
         MYKw==
X-Gm-Message-State: AOJu0YyvHwLoJNA1LSSdfbLJxbQtq1OK8lLzVMxHQgv2YcoS3KfYZmqF
	V96xuiAA35hQiT1JvTjwT6IAi2+fWcc7zotnG7z2NLxzEgU3Lp073aBv1eZa6mlFUfOjQSKobVU
	TC2K/sYYcbUCvjesLxbqgWKk3cjf7xrganw9U
X-Google-Smtp-Source: AGHT+IEAc6edM0Ncjo4EdyB2oQgViyyGObGsOoppoSaK1T1bY27hlzIMoMglFogdGkL86bjLnDp1j/GSYVW4BQfnyQQ=
X-Received: by 2002:a05:6870:c088:b0:27c:a414:c22d with SMTP id
 586e51a60fabf-29051d59b42mr5165035fac.11.1730393546203; Thu, 31 Oct 2024
 09:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
 <CABi2SkW4Utuo3qGKodTQn7VuFrRa4hpwrik7WaorS4=wm_cS2g@mail.gmail.com> <8dcc7e49-ec95-4d7d-8ded-d4f7202d623d@arm.com>
In-Reply-To: <8dcc7e49-ec95-4d7d-8ded-d4f7202d623d@arm.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Thu, 31 Oct 2024 09:52:14 -0700
Message-ID: <CABi2SkXQnzDnmMcM8YOW9tSeNwgPBhjWi4FO8nuHEuPA_RHNuQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Improve arm64 pkeys handling in signal delivery
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org, 
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com, broonie@kernel.org, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com, 
	joey.gouly@arm.com, keith.lucas@oracle.com, pierre.langlois@arm.com, 
	shuah@kernel.org, sroettger@google.com, tglx@linutronix.de, will@kernel.org, 
	yury.khrustalev@arm.com, linux-kselftest@vger.kernel.org, x86@kernel.org, 
	Kees Cook <keescook@chromium.org>, Jorge Lucangeli Obes <jorgelo@chromium.org>, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_095227_236852_95656B0B 
X-CRM114-Status: GOOD (  33.99  )
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

On Thu, Oct 31, 2024 at 6:00=E2=80=AFAM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:
>
> On 30/10/2024 22:59, Jeff Xu wrote:
> > Apologize in advance that I'm unfamiliar with ARM's POR, up to review
> > this patch series, so I might ask silly questions or based on wrong
> > understanding.
>
> That's no problem, your input is very welcome! There is no fundamental
> difference between POR and PKRU AFAIK - the encoding is different, but
> the principle is the same. The main thing to keep in mind is that POE
> (the arm64 extension) allows restricting execution in addition to
> read/write.
>
> > It seems that the patch has the same logic as Aruna Ramakrishna
> > proposed for X86, is this correct ?
>
> Yes, patch 1 aims at aligning arm64 with x86 (same behaviour). Going
> forward I think we should try and keep the arm64 and x86 handling of
> pkeys as consistent as possible.
>
> > In the latest version of x86 change [1], I have a comment if we want
> > to consider adding a new flag SS_PKEYALTSTACK (see SS_AUTODISARM as an
> > example) in sigaltstack, and restrict this mechanism (overwriting
> > PKRU/POR_EL0 and sigframe)  to sigaltstack() with SS_PKEYALTSTACK.
> > There is a subtle difference if we do that, i.e. the existing
> > signaling handling user might not care or do not use PKEY/POE, and
> > overwriting PKRU/POR_EL0 and  sigframe every time will add extra CPU
> > time on the signaling delivery, which could be real-time sensitive.
>
> From a purely functional perspective, resetting POR to allow access to
> all pkeys before writing the signal frame should be safe in any context,
> and allows keeping the handling simple (no conditional code). The
> performance aspect is a fair point though, as we are adding an ISB
> (synchronisation barrier) on the signal delivery path if POE is supported=
.
>
Yes. The functional level is the same.
Having worked on a read-time system a bit in the past, I'm aware that
signaling handling paths are real-time sensitive.

> > Since I raised this comment on X86, I think raising it for ARM for
> > discussion would be ok,
> > it might make sense to have consistent API experience for arm/x86 here.
>
> And indeed this is what I think is most important at this point.
> Considering that Aruna's series resets PKRU unconditionally (sigaltstack
> or not) and has already been pulled into mainline during 6.12-rc1 [2], I
> still believe that patch 1 is doing the right thing, i.e. aligning arm64
> with x86. If the concern with performance is confirmed, and there is an
> agreement to reset POR/PKRU less eagerly on both architectures, this
> could potentially be revisited.
>
Oh, I didn't know it was already in main. My information is out-dated.
It does feel a little rushed because my comment on the performance
perspective isn't addressed/responded.

 -Jeff


> - Kevin
>
> [2]
> https://lore.kernel.org/lkml/172656199227.2471820.13578261908219597067.tg=
lx@xen13/
>
> > [1] https://lore.kernel.org/lkml/CABi2SkWjF2Sicrr71=3Da6H8XJyf9q9L_Nd5F=
Pp0CJ2mvB46Rrrg@mail.gmail.com/
>

