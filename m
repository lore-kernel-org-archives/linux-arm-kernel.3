Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB37CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZZOWUVpIw61KHM85AdnPz6vomTChz2t/QIwYRGjaPM8=; b=VRZKdD48pBsw8qLy13QbNebyuZ
	hU6B0tIABpDDQ9nRTvqKPcBtPIM6ixxG02Q0939xRKXKmMCailPPBt0P7e8csbljmRlcubE/7in2W
	haKeI6kp5PBI1a9opiyJI+FyfjKxqdbpF4pW1vqVYaHlaoVx5xnvOCpVR5I/MBvf3fq8KuKe+HcTo
	s7QBg3tlqBL5hijahnf0npoGbLhEA0g83XLA/8ZTRr5B37bbwfhWOByvP1njm8NfN1aP6MF4ZAmIR
	qqKQoh24m/bi/CYqiekkNkerNofJjR4G2IqwdWhZ+c85dZSCvRw3ux1rJBwxA3dU/y8IF3lxE3WP2
	9BcPW6sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AL5-000000020Lg-2TH5;
	Mon, 29 Sep 2025 09:38:35 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AL2-000000020KP-1lO9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 09:38:33 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54aa6a0babeso3966717e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 02:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759138711; x=1759743511;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZZOWUVpIw61KHM85AdnPz6vomTChz2t/QIwYRGjaPM8=;
        b=K1b63VQmYPltYVBT76BSt3P43OCLFqgN5t0Vdca/nq+3e9czhlHtvIGbSFaiaV4IjZ
         3zQPzbl2mfc48yzT1hjvEolwWX80aut/5caB4aYHNitq5OF0q6e39ZTUy09HgnJF4pyf
         SYHTFwqB0De/1m+g5/7ZnZzND6gSA/AZ8rdvM2ukBTxb4cZyQu+oEUD1rZnlErIqSAwR
         Xd2rK0WlJAvj/6J8mOLHc01RHML+hVnNi5AwT1UF6eO3TfZDC+IMtDZX0d2uvpIoT7mh
         1aHJaQJPpT/OCMDDVUQRH12noDplTR0Zxwqxtm6+3XrqGi+nUdWxjpfsU9OVJayC6tw6
         N39g==
X-Forwarded-Encrypted: i=1; AJvYcCWaaeXyvkdz7sq+qKz/90w9VvIKd+89rSgW+iTn/g9m+OiPM5mM6IJGbbZiY4hjzDralMvj666Y58f+VEGyts9s@lists.infradead.org
X-Gm-Message-State: AOJu0YwDL+6AUj8TYGyAlWNXzh59UpjIFWMCxw14v1KlgskHgEt4b/pO
	uAu4+8WKR4+3SYj8Cu3hTvgHPVZFwslkE4swjTPSMrNSy6mq31jg6eYoMv9lIwbV
X-Gm-Gg: ASbGnctMycRqV48LSZlGPqRan+LYscbLHzIbEMr3TtI6l/dHEa9fpp//o8fNjlW07Og
	LQl487m5f8Gdq1hssIjW1H+jrhYt9aRWy3OsuQI3WKl/GQy/Is5eBeQPa/kxHdQwLKFbaMh4yJ8
	kZqSvp/aYRsiXX2gWQfeSYGrrBgA4OW5PLvoqph96BIh8mhPyZbMJmhmYxv2OzZ+nRxPzlMRP2h
	SP7eIFYCyhvcNB2gJRF+d9OWbrdYPvDRlg4WrytM5ryECE3ly34WuwTdxFBjD8+nGhAsS3PvNOT
	GdcBBluv9TMXwXB9IJoHfQzPxVBUnAoPxQSsnF5I6WFMiwJZKenB6Jje35m47PJx9qNOJ5yUrmc
	GeC/tdckUNHUIWdEvK/m7oBpqAyLT7CNgmLkVKX1KYYJCoAadk4DAJKFzJ+Q79VsXPm9ekKs=
X-Google-Smtp-Source: AGHT+IEt8NM9ZkT1kAB1yOFS4K4gqPumveYe2bM+L3bnjlFAtmNSpMfhKc+iB5gdsZ2IOs8p6K58Jg==
X-Received: by 2002:a05:6122:2d6:b0:54a:a2a3:b16b with SMTP id 71dfb90a1353d-54c0c3d4d2amr2324158e0c.3.1759138710773;
        Mon, 29 Sep 2025 02:38:30 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bedca040bsm2145252e0c.15.2025.09.29.02.38.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 02:38:29 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5b99f5d5479so1647102137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 02:38:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+OF9pucUSWZt7d/+rEb8ZeCpMcQBfGfdFyKrLeKXndsXLxTaM4OHJGye7ZTHZZk+pERgpj1Yt6co6c18Kj9Ww@lists.infradead.org
X-Received: by 2002:a05:6102:44da:10b0:5cd:e513:384d with SMTP id
 ada2fe7eead31-5cde51341ffmr109116137.0.1759138709242; Mon, 29 Sep 2025
 02:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250916163004.674341701@linutronix.de> <20250916163252.100835216@linutronix.de>
 <20250916184440.GA1245207@ax162> <87ikhi9lhg.ffs@tglx> <87frcm9kvv.ffs@tglx>
In-Reply-To: <87frcm9kvv.ffs@tglx>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 11:38:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvAQbN8g7TJyK2MCLusGPwDbzrQJHw8uxDhOvjAh7_Pw@mail.gmail.com>
X-Gm-Features: AS18NWBdCAubwt71LwkVRoRA7LVpa5BFQK_dgundxdrnw5KTmaxVCF_m7ZP3vyo
Message-ID: <CAMuHMdVvAQbN8g7TJyK2MCLusGPwDbzrQJHw8uxDhOvjAh7_Pw@mail.gmail.com>
Subject: Re: [patch V2a 2/6] kbuild: Disable CC_HAS_ASM_GOTO_OUTPUT on clang <
 version 17
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	x86@kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_023832_467108_B38E1F12 
X-CRM114-Status: GOOD (  35.23  )
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

Hi Thomas,

On Wed, 17 Sept 2025 at 07:51, Thomas Gleixner <tglx@linutronix.de> wrote:
> clang < 17 fails to use scope local labels with CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y:
>
>      {
>         __label__ local_lbl;
>         ...
>         unsafe_get_user(uval, uaddr, local_lbl);
>         ...
>         return 0;
>         local_lbl:
>                 return -EFAULT;
>      }
>
> when two such scopes exist in the same function:
>
>   error: cannot jump from this asm goto statement to one of its possible targets
>
> There are other failure scenarios. Shuffling code around slightly makes it
> worse and fail even with one instance.
>
> That issue prevents using local labels for a cleanup based user access
> mechanism.
>
> After failed attempts to provide a simple enough test case for the 'depends
> on' test in Kconfig, the initial cure was to mark ASM goto broken on clang
> versions < 17 to get this road block out of the way.
>
> But Nathan pointed out that this is a known clang issue and indeed affects
> clang < version 17 in combination with cleanup(). It's not even required to
> use local labels for that.
>
> The clang issue tracker has a small enough test case, which can be used as
> a test in the 'depends on' section of CC_HAS_ASM_GOTO_OUTPUT:
>
> void bar(void **);
> void* baz();
>
> int  foo (void) {
>     {
>             asm goto("jmp %l0"::::l0);
>             return 0;
> l0:
>             return 1;
>     }
>     void *x __attribute__((cleanup(bar))) = baz();
>     {
>             asm goto("jmp %l0"::::l1);
>             return 42;
> l1:
>             return 0xff;
>     }
> }
>
> Add another dependency to config CC_HAS_ASM_GOTO_OUTPUT for it and use the
> clang issue tracker test case for detection by condensing it to obfuscated
> C-code contest format. This reliably catches the problem on clang < 17 and
> did not show any issues on the non known to be broken GCC versions.
>
> That test might be sufficient to catch all issues and therefore could
> replace the existing test, but keeping that around does no harm either.
>
> Thanks to Nathan for pointing to the relevant clang issue!
>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1886
> Link: https://github.com/llvm/llvm-project/commit/f023f5cdb2e6c19026f04a15b5a935c041835d14

Thanks for your patch, which is now commit e2ffa15b9baa447e ("kbuild:
Disable CC_HAS_ASM_GOTO_OUTPUT on clang < 17") in v6.17.

> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -99,7 +99,10 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
>  config CC_HAS_ASM_GOTO_OUTPUT
>         def_bool y
>         depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
> +       # Find basic issues
>         depends on $(success,echo 'int foo(int x) { asm goto ("": "=r"(x) ::: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
> +       # Detect buggy clang, fixed in clang-17
> +       depends on $(success,echo 'void b(void **);void* c();int f(void){{asm goto("jmp %l0"::::l0);return 0;l0:return 1;}void *x __attribute__((cleanup(b))) = c();{asm goto("jmp %l0"::::l1);return 2;l1:return 1;}}' | $(CC) -x c - -c -o /dev/null)

This is supposed to affect only clang builds, right?  I am using
gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04) to build for
arm32/arm64/riscv, and thus have:

    CONFIG_CC_IS_GCC=y

Still, this commit causes

    CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
    CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y

to disappear from my configs? Is that expected?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

