Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38291E909AE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Eu+fC1NvwDc2c+7+RBywzqoe1LU54TndFGYyJ2KsHU=; b=RS1CKiSZGJPk+UIf+h0I8Hx8Q/
	QXrmSKo4B1JyOG0A1mj052l51JYONu64G7dta/f6MkBVvAhtuWzHUf3UjqaVLarikcjeZsTK3FbyJ
	iALDzgSIXsIc+W4CVIlTozAuFUlKMdM+0gMxYL8tBErtPxUtHfF0y7MqwceHf16wu9ipFG1K1lWQZ
	SLo+QYLDrD+MxXq02ZZ34JoJzjJbYMQjCa+LM+QHDW6Nvye0YVqnXusj9rIHuEddg4XcUghFY2Akx
	FG/bAPE6hn/1jnxs38rbEYD+A1kP/gK2xopyYVdHglORdxDbtxh31NrkPENrkcyXGvoE+tbClE/mm
	z5VHWueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsM1g-00000008Qhk-0buJ;
	Tue, 17 Feb 2026 14:26:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsM1V-00000008Qfw-3WqU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 14:26:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-48068127f00so45651355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 06:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771338341; x=1771943141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Eu+fC1NvwDc2c+7+RBywzqoe1LU54TndFGYyJ2KsHU=;
        b=dC8d1NLZe7iElzNaXkLIHFR21tdAgKS5pmUr7xklyKfvRXHNl2smQ9Vn+f0ZgWHuur
         UTfXcd8wsoD4L9Dyzyt5gRRNEdo9FsRtFdhh/QlPJbFFqh98T+xV2Yi1Ldy4s57DYfOW
         P/l6fzLuaDicxoPyGY9LGbiOjdhjTFfgKTpig1GpbOZFclgtkT4/Gv6xgFDzpTMRfnD/
         Kn8yWRc+Ouuf+buNYDq3Ohyb77jTwKAVUs0yTuJsbRwNLJTyDpq/siPDDXLfJSLBGCJV
         k5mOx8N8q7MTFC7M1CN9oO1MTLOB2GKYRBlyVzeepdZMIwRfdkEieuHWczreK0nEat+y
         gUog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771338341; x=1771943141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Eu+fC1NvwDc2c+7+RBywzqoe1LU54TndFGYyJ2KsHU=;
        b=lqLv6uiVogoK4n0Dr4UM3HKKLtCqBo+675GInP9ybjXW2uw/7AV2hbiBidL+muMcs0
         7t+0kA9EAH5y+lCApptiHr132PdPob3WDve05Fol8m7da714fovxuAJ2+1d766VICqu1
         7Q9iYte1AubrvTT9i8tP3C7q8Nr6NEdV3CrWOjdABbtLVRpBro7QaAZgwrUsV9hIlGpH
         Gy2qZTAf6T2d6q5Q+SDn0x5qcb/jdE6j9c6OSNI2NLiVpGpgH8PQa1q0YaDC+1xyJtlM
         tP8RBIgMS8MoNuK0MpmOmVns88DWV2sr7bwWBjLgbIeFZsU6HnX2wrPlr6oggRPdSpKS
         T/ag==
X-Forwarded-Encrypted: i=1; AJvYcCX+F7Z1aqu2Z3Gaere9JGJ/e8Y1JWLaRpSRCZgcRBW8A5GQ6tslAOPOBkQevQOoITui2OfuheMdkhTChbJ4irOs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6g3CQLaTR7Mvk1LW+rsvlf9YgZNlcpTZf6eZcp/x9hkDto3+S
	OrkFmTfAPEMYiX3hunWcHOUEIl8Iqqi3fzqg6IcU0KwvNFt+qqKEwiqv
X-Gm-Gg: AZuq6aLdNvFoUDZB85Q7XF31ynfCxlkC/Fszyq/vjcKN17kWC2NpbYOnTB5U8UG1rgJ
	DIV74VGj+/X/xWWSaQlw6hLqA/7ZJEfGt8SDmEkXYUM4VvDB94n7elx3vhUHn1+6JSYRSzdXLrF
	w2crtf34dk2SWElYcdg0iSbXi/GQkiRVYJDdtUL/dzmVD0cgQNHwdI8J3mnmg1OTkImY3EkzFVg
	5QWLygG69tdcNIwkAdHQk910CZLZjeRDAib8gMT+4HK3ESZLDR5ZJ0rVKc7VyyrBawaP8ap5Khc
	O9LpOVnXm7PI9DiCihpLEcpl8+WoKHrSdUcWIl9y2Y/wxl+IqloZqeDGCdyKGpvm3xHuKJLL6Z3
	u/kBQFN29XL1YncUPsVV94OUb8nDuQvyIHSWttd2IgP5fM7YHEix3CjPzV2Jd0yslSQufs+nkKd
	oNnTPikAE4w6GXyMK2Mvj8DwDY4T+7097eqZAJ/++3yp4BTxmUrfsjnKlXuUtyoBp1
X-Received: by 2002:a05:600c:6206:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-48373a5ba9cmr225553315e9.20.1771338340859;
        Tue, 17 Feb 2026 06:25:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d77b3sm570714265e9.2.2026.02.17.06.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 06:25:40 -0800 (PST)
Date: Tue, 17 Feb 2026 14:25:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Marco Elver
 <elver@google.com>, Will Deacon <will@kernel.org>, Ingo Molnar
 <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng
 <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van Assche
 <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
 test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260217142538.0a2c0892@pumpkin>
In-Reply-To: <20260217121619.GA1395266@noisy.programming.kicks-ass.net>
References: <aYNUmEfDzq7lTFFr@willie-the-truck>
	<CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
	<20260206182650.6c21b0ff@pumpkin>
	<CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
	<20260215221656.68b2fc1d@pumpkin>
	<CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
	<CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
	<20260216110915.4f0d5490@pumpkin>
	<CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
	<20260216174324.75d47e37@pumpkin>
	<20260217121619.GA1395266@noisy.programming.kicks-ass.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_062559_812451_32FF1F68 
X-CRM114-Status: GOOD (  22.29  )
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

On Tue, 17 Feb 2026 13:16:19 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> On Mon, Feb 16, 2026 at 05:43:24PM +0000, David Laight wrote:
> > On Mon, 16 Feb 2026 07:32:53 -0800
> > Linus Torvalds <torvalds@linux-foundation.org> wrote:
> >   
> > > On Mon, 16 Feb 2026 at 03:09, David Laight <david.laight.linux@gmail.com> wrote:  
> > > >
> > > > volatile structure members are almost free    
> > > 
> > > No, gcc does absolutely horrible things with volatiles. It disables a
> > > lot of very basic stuff.
> > > 
> > > Try doing something as simple as a "var++" on a volatile, and cry.  
> > 
> > On x86 I just see a load, inc, store - not that surprising really.
> > (clang did do 'inc memory'.)
> > 
> > It's not as though 'inc memory' is atomic (without a lock prefix).
> > 
> > Also var++ will be 3 u-ops the same as the read, inc, write so the
> > underlying execution is much the same (ok you might save on the
> > address generation and the compiler doesn't have to find a register name,
> > but I don't remember anything modern being limited by instruction retirement).
> > You might save a bit of I-cache.  
> 
> Interrupts can tell the difference, and that matters.

Just makes it the same as every other architecture.

The only way to guarantee an 'add to memory' instruction is to use an
asm statement.

	David

