Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EAFCAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+MPZozySbtur1IZVuljxCO3XEppmGl3RjxuL+jZDRc=; b=BVNgimE+eDOUhlnkf3sYC6dOdJ
	UNJIwfp4yDC974itjh7+kX9JUkzPpCwhLOc5sPh40PcmADAB28vDZnKSvzYDJvZjNbevnBt8hnUhG
	RFjdC16sethi/5YuG7g4NS3Dc4nl0sARYOrK0tfzUF/NQapKCXyLJ1Bl7lNpVsknqZe1zSXEvwE8Q
	7SUk6fAhA8xzHV7k9PI/etcalPj+/qQGYs8N340htPBmSUhehFKoIsQ6KlS80KXRK8u2599c+J4pt
	1N//EYtCVoFDSLt/CbHYQ27VntBsX91Pbu/16ygf9P3l+6IL+Vdu4dQY0q/awr96wJNohGT/l7+lq
	wbV8Fyzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BaR-00000002FtZ-3Dnf;
	Mon, 29 Sep 2025 10:58:31 +0000
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3BaO-00000002Frm-0fiw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 10:58:29 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-54a94e39720so1580637e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 03:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759143507; x=1759748307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+MPZozySbtur1IZVuljxCO3XEppmGl3RjxuL+jZDRc=;
        b=SE3dzekAv0QFW+/87HyzEC5DzSR+U5kKERFJm1ypHJ5ptNTuSLULJ3asN1lkeSbmqL
         qS+ZNVVVJlKFlzduBf0IjNZMUgSEwA+7vbXeekzl7OgoGp1Gs7sS2YurOfGW0Cfte8K1
         m0ysmeFoEnws9qt2Fc56j/fAhSppKJxvC0Tc5pbZ2BaBiOFN2wvHUfbltmDW//BPooc2
         yuG/Jtv6DN271B+SC3N4IB+gvRs3ZGHe78Gykd0lg/zK1ewD8A5NUTXlTs32PSUXEO/m
         KoM1Xf/THdlj/dQN5l3INHp3AKgBMvDhfuyDv1AW5nV3kJyB/tZnBHANMr/0LcJXfkSS
         w2Zw==
X-Forwarded-Encrypted: i=1; AJvYcCW2DslNUsvYdwO45d02obhK6PVy+HkZ+Gqiw+FnueDNLUQt9yYyxy8p9+Wpb7mhfDjk8Wizzc5ZjGcpGkDlTapd@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj1oy6I1yW47QK/H4oevn/0zpebxrJZsTMqgUT9skgwg5rBOPp
	6ZaXxkzmGiNUxCRCl0iZ5VqavE+sA4fVWWSLycPzI3gRkI0mgERP99PE8C73IB4x
X-Gm-Gg: ASbGncuNFRiG+RmprTl2JDzPw4kvY7ioMLEC1KFpB5RBD5XupKx8/SrbIA46cyqM0/r
	J1tgnFyLekXl1dgSTwYa0NdC9EixovBbheWLDHwb0FCZDMcNyJY0gt3HeATkx0syhrysBWxtMdT
	4vvjaV6Q7KV069eNY+gcNUO7Du36hRe9Rm9jiG18I/oblN+n+whMLnn6wQ0LP+NGI/m/hHGgH36
	3R7cWFde9U+L4nD47msTbzuX8ubNHaj4RYTyMNOoBFNb9FP6cVsPKVxQ5vCY5BQ/CH6SZveB4K1
	Xfb51CAQenxU1NyAub5wdDHrFMXbv+Y9EdquAA0oqnWVA1V7VYR2stpRlHDgs5XZ3MwEA2TmQ36
	whrMrYcqM3Dc5Ty80oxG1M0g2Ogopuq1rkJfTXSUu5PjeTLjWitDKfLfTbS2Z
X-Google-Smtp-Source: AGHT+IFhz93eQPgLKFflvViHrIQJoLeczoYIEs8oxh5rzSSb+gUoJZn/ZAcqJBOGhQEbO9sCGXf1qg==
X-Received: by 2002:a05:6122:d8c:b0:54a:a251:ad57 with SMTP id 71dfb90a1353d-54bea37890bmr5951402e0c.16.1759143506625;
        Mon, 29 Sep 2025 03:58:26 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-916d98d73d6sm2336782241.15.2025.09.29.03.58.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:58:25 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-580a1f1f187so1848853137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 03:58:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXFfw7+bDs1l68SLw88bQpw6Dey3VkFHzdL8CdcUaR5WtB7vioeHkVse/EV+k9d7QUlIbgGTx2gcPvsEvynqb/P@lists.infradead.org
X-Received: by 2002:a05:6102:50aa:b0:534:cfe0:f864 with SMTP id
 ada2fe7eead31-5acc473077dmr6450963137.4.1759143505642; Mon, 29 Sep 2025
 03:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250916163004.674341701@linutronix.de> <20250916163252.100835216@linutronix.de>
 <20250916184440.GA1245207@ax162> <87ikhi9lhg.ffs@tglx> <87frcm9kvv.ffs@tglx>
 <CAMuHMdVvAQbN8g7TJyK2MCLusGPwDbzrQJHw8uxDhOvjAh7_Pw@mail.gmail.com> <20250929100852.GD3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250929100852.GD3245006@noisy.programming.kicks-ass.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 12:58:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_5QOw69Uyrrw=4BPM3DffG2=k5BAE4Xr=gfei7vV=+g@mail.gmail.com>
X-Gm-Features: AS18NWDQJuqnAIK-2DUIq8EbZk99RAekWX-gMhtGREaGuJ754MDAMcZKkUQDKxM
Message-ID: <CAMuHMdW_5QOw69Uyrrw=4BPM3DffG2=k5BAE4Xr=gfei7vV=+g@mail.gmail.com>
Subject: Re: [patch V2a 2/6] kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang <
 version 17
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_035828_200902_6036FF90 
X-CRM114-Status: GOOD (  26.17  )
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

On Mon, 29 Sept 2025 at 12:09, Peter Zijlstra <peterz@infradead.org> wrote:
> On Mon, Sep 29, 2025 at 11:38:17AM +0200, Geert Uytterhoeven wrote:
>
> > > +       # Detect buggy clang, fixed in clang-17
> > > +       depends on $(success,echo 'void b(void **);void* c();int f(void){{asm goto("jmp %l0"::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto("jmp %l0"::::l1);return 2;l1:return 1;}}' | $(CC) -x c - -c -o /dev/null)
> >
> > This is supposed to affect only clang builds, right?  I am using
> > gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04) to build for
> > arm32/arm64/riscv, and thus have:
> >
> >     CONFIG_CC_IS_GCC=y
> >
> > Still, this commit causes
> >
> >     CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
> >     CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
> >
> > to disappear from my configs? Is that expected?
>
> Not expected -- that means your GCC is somehow failing that test case.
> Ideally some GCC person will investigate why this is so.

Oh, "jmp" is not a valid mnemonic on arm and riscv, and several other
architectures...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

