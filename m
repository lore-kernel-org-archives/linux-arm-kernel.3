Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2824FDEE50
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfwFwCIldVr0cgNNRvDZvVTUO/qPdGSASw66Babpmsw=; b=XTuQ736GhOlwl13VyQRkieyJn+
	2hMP+EFYySh76JfiyuZxkhd8W/svl4AXiOWBB56GYIl1/25N2pcOQK1Fn7TvvtoCz4pt3RLdYmJKw
	SdN1IMRti3nBv82eHsgy5FpSQRxnRRhW23gedPqz4FLoSZf3jMVpmkgkdH5M0C6+P7aTGnGz5p6DO
	vIqn4fiUL110dY5b66G3C2cPeBb5AAVNVaM55VaOQocaw3tk44zzY4PmtQbbQsgWwav8jaxu1qLOT
	Zcf0esbMMrHN7TMjAUFb/VF1lF/xPtQMepaCHcEKbnn0Yogb59eopioeFeZew7Jn1EcYvYpBBkIa7
	6QHSfRzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1hR-0000000CLrw-2eZu;
	Thu, 23 Apr 2026 21:35:05 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1hP-0000000CLrc-05RH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 21:35:04 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38e97e73234so60095781fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 14:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776980101; x=1777584901; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wfwFwCIldVr0cgNNRvDZvVTUO/qPdGSASw66Babpmsw=;
        b=QkYD/P6XwJwzFK4AuFxZiU0/TBFuUdEkoz/c4zubOYn6Y3VRFmrf6r9ceYNsApBLDE
         r1yKEPzr0DIWkLCgWPenC3uZosEFPhpYq86nISsjCagmYCbp80gBqjlfbifKbNFyTbG3
         CckFuMsl2Zo42tOb8djB7XeEW1AmS5Vs+6lkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776980101; x=1777584901;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfwFwCIldVr0cgNNRvDZvVTUO/qPdGSASw66Babpmsw=;
        b=KrI7YZygvNwL33yeO8uZ7pAsex6VSp9PP4HFMMRZBaD91YLDbSGq2sf+Veie/WW4BP
         +S5nesfMv3FP0990MFbiarFeNOkaBjFHGLjwwc0wL3CC7Zr7ZqNVpvBtC71Td9W3ipYp
         hxLcR59uS3C9Z8Qn9k3jLJDz4+vdjVJq8Nj20qTk2ECABFayGzoH9Nl72tUwelawlaEh
         l+8+XdUCBMGx54SMQFSrdml+IAD00R0o/zUlro0rwt0CtSEPpyQLceHWvsumM+lSmhn7
         J2ooKylaS1tUI8PGljsD/BQiSBADM3DuGZ4IWjwJBNEqLrrts5yBG0KDK7cFLLX5ZNLU
         TIHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/UtBb92AHO9Cdsawz44TsTutWKAK931/5e7qVJEdsjucik6Hf1vM/iFjinC1OjGKhtZJ+YoVoNE2wMEihJOy/N@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf4Y/d786aivJMAquB+qijGlG2zd4etVQCa7dmxmZh0jOhATr3
	tnDWOa8cki9tUJY1dRG+if5U3FxgZGvdlDUyrF6At+9GuSvOifIPsZNr2sComeiAFhZLIZCBkiK
	0r5djcduySQ==
X-Gm-Gg: AeBDiet7Q1VSCvZLJBA/XKSWjcikVoujFKTb+zBQsodDDz2Ejjo8qW6Kys25jDVLtfb
	PEls9rff62cxql+ddyk+BDhwPEhd4oyEKV5d5Bs74sbIjPApB/5RxU1o/5dCE/uYPmfrn/vruhC
	sLzezaOVjMk0HfCz/jhsdt79SpTi0nFChqp0rpNf5J+VAhvPlJMlT6w7wXQgLAVYLHDbYhYVKZA
	45xy+OWLNgUHTUMt2FGgEqprZHG8+mHyiCn2U9OeVE/LXdeqrEbZbB+IxSMuEAqbjj/JIL+uRKs
	/uU0T7/xRQzIYrZ4umsRs1kQCGSXuXjYjbLhq/9dd5PPBVVhZkRGXIYxTsPVeCkc/8Sdzdtz/Jw
	VH7kjhWbd99CUskOBVgvMc5eMq0QKZKaf9i2Oiu/F+JKqXozTE9oTilMau9p6ksM5VockKhpgnV
	MV1hrPg7QsePcOTUVrZ/z7DZ4/8At3KIeUU3j35xPpv5zBJruLEGBrBJeWld3L+OX4IPQ45gY8u
	vt6ZOWxXcyElb0=
X-Received: by 2002:a05:6512:1447:10b0:5a4:194c:d897 with SMTP id 2adb3069b0e04-5a4194cd8bamr7083560e87.12.1776980100621;
        Thu, 23 Apr 2026 14:35:00 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7a3fsm5454174e87.59.2026.04.23.14.35.00
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 14:35:00 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38be5e86918so82365621fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 14:35:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9484mmC3p0KG8BYSHLNtYTO38F2r5Bqk/NnKeC2MsP09/H8usWrE3JaOpUztRBHxR5ZYChLtlPtk/f15Fws/uF@lists.infradead.org
X-Received: by 2002:a05:6402:5188:b0:676:c526:b5cd with SMTP id
 4fb4d7f45d1cf-676c526b6ebmr6097033a12.11.1776979734312; Thu, 23 Apr 2026
 14:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx> <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx> <CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
 <874il11jac.ffs@tglx>
In-Reply-To: <874il11jac.ffs@tglx>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 23 Apr 2026 14:28:35 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
X-Gm-Features: AQROBzDPHxpB7P5JMMu78wlgnLqIXy2iv6n4729bVTOgWr52y0l_Hq-q_YmDm2Y
Message-ID: <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_143503_203029_81562B21 
X-CRM114-Status: GOOD (  13.99  )
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

On Thu, 23 Apr 2026 at 14:03, Thomas Gleixner <tglx@kernel.org> wrote:
>
>      Feel free to enforce it, but be aware that you thereby set a
>      precedence that a single abuser can then rightfully own a general
>      shared interface of the kernel forever and force everybody else to
>      give up.

That's not a new precedent. That is *literally* the rule we have always had.

This is why system calls and ABI's need to have hard rules that they
actually check, because if they don't, they are stuck with the
semantics that people assume.

And no, "documented behavior" is BS. It has absolutely no relevance.
All that matters is hard harsh reality.

Yes, this has led to issues before.

Most new system calls have learnt their lesson, and they check for
unused bits in flags etc, and error out on bits that the lernel
doesn't really care about being randomly set - so that one day we
*can* extend on things and start caring about them.

But they do it because we've been burnt so many times before because
we haven't checked those bits, and then we were forced to just live
with the fact that people passed in random values.

>     // Note: this makes __rseq_abi.cpu_id_start unusable for its original purpose.
>
>     Do you seriously want to proliferate that?

Absolutely.

That's how clever hacks work - they take advantage of things past
their design parameters. "If it works, it's not stupid".

We don't then turn around and say "you were clever, and we did
something stupid, so now we'll hurt you".

This is all 100% on the RSEQ kernel code, not on users who took advantage of it.

                Linus

