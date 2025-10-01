Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235A4CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 19:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpYWttYdrlKxMJNuC4/+/3P23bCufP7vQF7gyhcuZQE=; b=q/pOtLCeiA4+w05T873lhqypUB
	rwMLP003J9kaC0P2gY+Y/rf+9YE6xh5QeAflBGA0Bb2MRSEBo/MdTkL8zKZHW9aChmU+T56GRtG/i
	BghWrZT3ykQDZTw7bEsbQlcN1QQQVVoVjMpP3DMCdi8pk+mt8PA9qtZ6DDPIVGQRHqvvLq6/KIeFU
	jyWaiaT/Rcj0Ny2b4bMFfbJz62Ra3cx+cSOO2unhfOIELoq+Z6NNpYScAMTHrv5+hZu+NCsX7RY2m
	HA7XRlRUtLcKEa+adjT6urKXpX4A0gOK0Y150bqbeJZLZX90c8Y62abCLHGKjzUfwPiCOFmkd8HJv
	oXUMkAsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v42He-00000008obf-0Zet;
	Wed, 01 Oct 2025 19:14:38 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v42Hb-00000008obE-3wWe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 19:14:37 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-57bb7ee3142so219028e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759346073; x=1759950873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpYWttYdrlKxMJNuC4/+/3P23bCufP7vQF7gyhcuZQE=;
        b=MUWXM93YaJ5XOAuqFshZwWo3/uK7fDy33esmjBQTz5/4WD+NL7Z6c9CLqzZBkiPXpd
         +1sHdnnQSrFU7K0f75h1YnX1xDjQWoDwezuT/XVmIZ4EEb0a2lRlxbCnnhs8IjFvJePr
         Uc/Gd6k6xY/irr7rYRysOO4RM0ZgCLBKLjWr73UNf+NTQ0YfpxFiMk4njjob3kl360Ys
         fpmQVMQjPv11md2NrtnDGESeetMU1mf+6OwtK3i3C3tQ0D8HKvaaktol5b5a7P3AVeKj
         RxzRB6K4eZxnQxEndy/9a2MhK57yyQzjWoipYZ7OPImIha+BDr8he/ZlPQTfDFE1cHZ1
         QIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759346073; x=1759950873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpYWttYdrlKxMJNuC4/+/3P23bCufP7vQF7gyhcuZQE=;
        b=NxZlyM+85nZ5xmuVG9V8VX5DjEAv8kg1NOuM/nAMxm5s11uwwgiOec1Sizd7exX40I
         m6IUCLbDQOPkwjNSK26jhjzMBadZgH4avLEQKAooYyxfNN7rtlFo8Pnyn0FSUKfIX6Eb
         tK7rYq8h2SgOlFL09PXEa5J6I4Tz5rn6/jOFd4qnWTRYC/PNTYXVUYCW5DJ/rZdrcyOr
         t9DYb2UPjUwljTmN9XlMTH8+eaIas9zPcQUZJa0vg774bZkLSanhL8Q+Z2zCXF/BegrE
         DQptD+F+deOoWFyssdEWWqwyB2niu8PHW6rgRySloWwiLGKFwwxU9Lc+yEIljmk8gzHa
         5dBg==
X-Forwarded-Encrypted: i=1; AJvYcCVz2XKOfFF6bulTrJK20uTaptlkyuUYcf5fX0hChz2LuVIEZZOQfq/fBeGr4lWd5srIOvxWrh5CFDXFz5zbhqkY@lists.infradead.org
X-Gm-Message-State: AOJu0YzhAii2bQu6YcaKUV6ZeTuujNIi1rMvj5SbjHmMi8P3Fr008duQ
	NruDugxbRBPSn9rnn3K3RbxGtqHncH8MiaGn2qqDt2WFIKAXYSTg1BqzU2LrWyrPXrOqu+and+R
	/x7/iKs8PLhxWUr8gZj/22FSL3lhWiLgkernsZcbopQ==
X-Gm-Gg: ASbGncvga750BSW7VxP4Q59DNq9xJwoNkgaAM/guz7T/knOSO1H5+wLWKwiGxrmj770
	ZHfD/Vo3CSaTkySQ8B6nQD0vNq11LKHA+1lh0TlnTm7I091/m30E+8EIS5vvhdD9WsQwXZBYYDm
	I21ey+17NW20PwAjg0EuGhnc8Ao74DOvGN8TwPNKa27N1DVswfvBllxWQQL9lvITLuH3TBnAYKE
	6E04o8WkaOeWdTxPFKtN2r7zP+jXaU=
X-Google-Smtp-Source: AGHT+IGMkX2miJlksEsdM7PXcVzHNnO384Za6SpV35+lEVYqmGUHyp9bwhwrzCQ3loRfE0DrPQkJgxZVFLD3fAKGmIc=
X-Received: by 2002:a05:6512:3b8d:b0:57d:ffa4:56eb with SMTP id
 2adb3069b0e04-58af9f6ad77mr1525367e87.31.1759346073280; Wed, 01 Oct 2025
 12:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <VI0P195MB2739D000BD1BF18B3B718F93ED1FA@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
 <CACRpkdZbwuf2Fgtq+jyqzqspb37-P6X4O9xqkG-mSb+afSjh3g@mail.gmail.com> <VI0P195MB273993B2928F985EAC763375EDE6A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
In-Reply-To: <VI0P195MB273993B2928F985EAC763375EDE6A@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 21:14:22 +0200
X-Gm-Features: AS18NWBTQ0S6ldFMcXWF5q6y_CGyKZtR3CUF--U4-z61ZpL9iuM7LkWUlYqHj60
Message-ID: <CACRpkdYLbFTnDn-X=TRb-P_SmwZkxiEFk5PG_y-12_shQrpO6Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: Make sure CPU_ARM940T kernel can be built.
To: Franz-Josef Haider <fj.haider@outlook.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux@armlinux.org.uk, ardb@kernel.org, rmk+kernel@armlinux.org.uk, 
	ebiggers@kernel.org, nathan@kernel.org, rostedt@goodmis.org, kees@kernel.org, 
	dave@vasilevsky.ca, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_121436_186759_C0F757E1 
X-CRM114-Status: GOOD (  18.00  )
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

On Wed, Oct 1, 2025 at 6:04=E2=80=AFPM Franz-Josef Haider <fj.haider@outloo=
k.com> wrote:

> Hello, I have done this change because when trying to "select CPU_ARM940T=
" from a Kconfig for a device with arm940t cpu, the build ends up failing w=
ith errors like
>             arch/arm/lib/ashldi3.S: Assembler messages:
>             arch/arm/lib/ashldi3.S:44: Error: cannot honor width suffix -=
- `rsb ip,r2,#32'
>             arch/arm/lib/ashldi3.S:45: Error: thumb conditional instructi=
on should be in IT block -- `movmi r1,r1,lsl r2'
>             arch/arm/lib/ashldi3.S:46: Error: thumb conditional instructi=
on should be in IT block -- `movpl r1,r0,lsl r3'
>             arch/arm/lib/ashldi3.S:48: Error: thumb conditional instructi=
on should be in IT block -- `lsrmi r3,r0,ip'
>             arch/arm/lib/ashldi3.S:49: Error: thumb conditional instructi=
on should be in IT block -- `orrmi r1,r1,r3'
>             arch/arm/lib/ashldi3.S:50: Error: cannot honor width suffix -=
- `mov r0,r0,lsl r2'
>             arch/arm/lib/ashldi3.S:43: Error: immediate value out of rang=
e
>             make[3]: *** [scripts/Makefile.build:430: arch/arm/lib/ashldi=
3.o] Error 1
>             make[2]: *** [scripts/Makefile.build:556: arch/arm/lib] Error=
 2
>             make[2]: *** Waiting for unfinished jobs....
> With the change I am able to build a kernel which runs on a device with a=
rm940t cpu (with the patch "ARM: Add missing mmu flags entry to arm940 proc=
 info." which I've submitted as well. And with the necessary mach files etc=
).
>
> I can elaborate on this in the commit message and also adjust the conditi=
on to include the other CPU types you mentioned.

Yes please, thanks a lot Franz-Josef!

Also add:
Cc: stable@vger.kernel.org

in the bottom of the patch so this goes into stable.

Then eventually submit the patch to Russell's patch tracker when
we have reviewed it.

We (ARM SoC maintainers) are interested on what kind of system this is.
We really need to know if there are actively maintained ARM940t boards,
and with you posting this it seems the answer is yes, so please tell us
a bit about this device and what you're using it for.

Yours,
Linus Walleij

