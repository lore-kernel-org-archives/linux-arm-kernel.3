Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927A3CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 18:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgjf4Q8TmMxBgFclVgV3Hi99Hhu3hDBuYkmCSxYCGGs=; b=TiXjv+O3QoQWtaDJ+YfmyfpDa1
	Q7gh6E0SHYGv5oZ2MnwDO22KuriAhqmV17dmqESK84T8h3/mrtVWxnuZF2Q2EF/8QCpM2xLPavY68
	lPKNWD0ESMMxMxGO6WWYcGMSYxoneakgEMsz9SxiUcmKPs3NeHGgXsHka96Xr2fm3+cu6KIH2DCpu
	88GhtBPlts0Fpze1lQKMnLL4NKl2RiU1cCdhlOmt2tv3kq067eJGH7KFVeYGtaZwbQkVk7/ltSXOI
	IOpDS6lM26SedX7gcpOHePrM2Rrc/DsMTl0uJXDltuloG6mY5TMW/MGu2vssoMQGy2avWBktijgBX
	4AV3Ev4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OLy-0000000B42A-1Xyn;
	Thu, 02 Oct 2025 18:48:34 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4OLv-0000000B410-24ss
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 18:48:32 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3f2cf786abeso943747f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 11:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759430909; x=1760035709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgjf4Q8TmMxBgFclVgV3Hi99Hhu3hDBuYkmCSxYCGGs=;
        b=TkKoKUeSqWPbnkP79VAbN4nX/M+yMjYMO1Ik+/xptzkHFOiUSEPcx12G99l1R+zt+9
         oh79H012elgSaT6QOc9vzrRjaTy8tJ+qZdjDpNyz+BJF/Y17Hwnv/AbTmfx6Fz7Tsf+Z
         cIeOiHxSjw1oNYHNDL4Ov9v/JLXhPKJ80CgIHPrZjS5NzTr3AdPbaxvLRZDfpPDdxOJH
         BJ5zR1Gu2JNcozTwyV91xc2G00Q5pQlVCSegv+RECDsCMtr9BndtX5vcYF4kBQ23NGza
         Gfxh96gssaF0/2DHviMrbcUJBViSqisqlyqfFYH1SBcZ6YyA+lZmZ1rknaNqzGLmSSsj
         RNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759430909; x=1760035709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgjf4Q8TmMxBgFclVgV3Hi99Hhu3hDBuYkmCSxYCGGs=;
        b=ZIX0AAjzxvP9TFoAcj0EuhpVIJxQbo55DiihVPAOETfY384P/mQs3nNu4vgSPGr7pB
         QpyM22hk4LuqGpMUXiNMPKnzBY0+p3eVSiaq7TYe1NSIZtR0IKyEnTrPbpg9xQRr5cgX
         7yYASJIdMFeuXZwDSsUK3YWwsIVFlJLDqmdNKtOCdA46YbB+QscypgH2f539atRd+vDK
         bQiqUcl2tsAfvlEhr4hrBrT6xS7SQK82QscE7smNA7ppa6iY9ZZsrBiLothxEoXpd6mi
         pAr4jziUR/UeU3yqf+9gYsAk7t5jfFianjOagZl69SxpumgSHrD5hDRzgbjH8ba190aQ
         7iqw==
X-Forwarded-Encrypted: i=1; AJvYcCV0CfY4XovbhvIrSF85V/TbcTtVfYuS3FwOizv/LC+bKEop5x11O/axZ3bwPAVnUyFEsEHYZ9QEI/XoEouFOZ+0@lists.infradead.org
X-Gm-Message-State: AOJu0YwUKZgqEZr7vYjPxTBp14Bv7ODeCKGkcqGQ96Z+hHOrXv9WofEP
	NbRapi6TGMyLEI1uMJ4U02HuBkqrr/V7n3Go+d5/zGZkt9KzjUjOPzFD
X-Gm-Gg: ASbGncuSBPLmQylgyxHkxBJg5dVxBfaEmEjDjFbTCKJNpjkF3oKanjDHp6l/GmnIFWv
	jvBsYg/RV7j5T8p7u+byVCpy7nuTHaWurHsA9EK/Zy/c8EijIVoFvj1EBdSdnIeqYM8vgxWnCdX
	38erPw8mFhA4zUjeWCJGcTbRsKCWMHULYt5x/tN6L5/c/vmv/Q/LXU1YDqyQUyg0Qz8xVwfs5oi
	oHZSFnc2Sblh7Ff5co4XLubXQMH2yjujmcdIY0T1IC3YXS0vDBcGfqT2tkAeLkoW0gCiecwdl1Q
	g7F2zXUYM5OYkIRHfEi0yR6it9kzVoJnF4joowdcwxryyT7xKGB9P0NpvZKL9FCey+uN7cUsBcE
	OTxrQoo3bRDAOWGqOzgybM6Xx3D0mmFntPRjnZIfhBsFyVpj8jesRpmDaLj9IGgUwI26Ohysgu6
	VbMevabz0ZwoNA
X-Google-Smtp-Source: AGHT+IGPZyy98EunzVJ6yivTxgcZu+hh+n+arOejBmpGA2ZRyOHrbEnCoAuwnsGkUwYPhwrqhwXocA==
X-Received: by 2002:a05:6000:603:b0:3ee:3dce:f672 with SMTP id ffacd0b85a97d-4256712a5dcmr209162f8f.4.1759430906615;
        Thu, 02 Oct 2025 11:48:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f083asm4640243f8f.43.2025.10.02.11.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 11:48:26 -0700 (PDT)
Date: Thu, 2 Oct 2025 19:47:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Peter Zijlstra
 <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Nathan
 Chancellor <nathan@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel
 test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?B?QW5kcsOp?= Almeida
 <andrealmeid@igalia.com>, x86@kernel.org, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V2a 2/6] kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang
 < version 17
Message-ID: <20251002194734.7cb2be8e@pumpkin>
In-Reply-To: <CAHk-=whmf8OKRBKW_xi6SLrvicif8a2e7Pn9v6Qi+ioDJxnqmg@mail.gmail.com>
References: <20250916163004.674341701@linutronix.de>
	<20250916163252.100835216@linutronix.de>
	<20250916184440.GA1245207@ax162>
	<87ikhi9lhg.ffs@tglx>
	<87frcm9kvv.ffs@tglx>
	<CAMuHMdVvAQbN8g7TJyK2MCLusGPwDbzrQJHw8uxDhOvjAh7_Pw@mail.gmail.com>
	<20250929100852.GD3245006@noisy.programming.kicks-ass.net>
	<CAMuHMdW_5QOw69Uyrrw=4BPM3DffG2=k5BAE4Xr=gfei7vV=+g@mail.gmail.com>
	<20250929110400.GL3419281@noisy.programming.kicks-ass.net>
	<CAMuHMdWtE_E75_2peNaNDEcV6+5=hqJdi=FD37a3fazSNNeUSg@mail.gmail.com>
	<CAHk-=whmf8OKRBKW_xi6SLrvicif8a2e7Pn9v6Qi+ioDJxnqmg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_114831_543222_BCCCCF90 
X-CRM114-Status: GOOD (  16.71  )
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

On Mon, 29 Sep 2025 08:53:37 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 29 Sept 2025 at 04:10, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >  
> > >
> > > Ah, d'0h indeed.
> > >
> > > void b(void **);void* c();int f(void){{asm goto(""::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto(""::::l1);return 2;l1:return 1;}}

Should that be 'void *c(void);' (with an extra void) to avoid failing because
of the K&R function declaration?

	David

> > >
> > > Seems to still finger the issue on x86_64. That should build on !x86
> > > too, right?  
> >
> > Thanks, builds fine on arm32, arm64, riscv, m68k, powerpc, mips, s390.  
> 
> Ok, I just applied that fix directly. It's clearly not a fatal bug
> since it just falls back on the non-optimal code, but it's one of
> those "silly and subtle code generation issues" so I'd rather have it
> fixed asap in the upstream kernel.
> 
> Geert, thanks for noticing.
> 
>              Linus
> 


