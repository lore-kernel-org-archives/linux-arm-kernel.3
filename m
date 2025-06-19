Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70715C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=; b=La5sEK9cWIMStj2sR0UUXgoQVX
	94UUtmDflyNfPV0zwiwtUKnEDC4yH3uLizqNs3Nc1za+XO2+dIFZrph71OXfL3w+kvhYge5M9w9H6
	ATE8bZl8HLv/+Fet2yZItY6miEt+miqsSFmTgjX8e4tI7UuPCnSfRcf7mfpDWd8xjpIx66oyF8Ncb
	1Sl9+3cB0BqnniR/bzv0/5YPBg2Rpw10oi3C8g6qXXiaD6OWMhabiPYKnVGz0/vHWqKLtrmRsGoop
	6jA5zjkq0aMo5XcHgP1kI0WrVd9DLrhj1Oii8pVHgRatY2D2bAzDXSoMRnOTcuHqZdU22wxQ0VNWZ
	WQevAmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA8N-0000000CMht-1SpK;
	Thu, 19 Jun 2025 07:56:31 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9ak-0000000CHdQ-3Pkq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:21:47 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553dceb342aso232921e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 00:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317705; x=1750922505; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=;
        b=POSa6r6/i8fICkWRUSE7VMa9vFIYWadgq6NywGC+7NEw71LFF5RtZYv/i93b36ktPX
         U3qcZ+swDoKlEYTvrX+qWsT2OPROoAZH6I04DPK6k+5V+1RZ2nl465k83Q9HI3qWTaSI
         VbKm/KTxjBuxYOGVmly6NXF8C8GoRbSz4V8eWgh3Um0zBZpPzEnk1WGwgNI1LhtF2wAp
         NG1bGmbrOs4e9UvUipPsLu+OXsYj0pqu+6LV+FXaDMYox2ME/gMG6fIiAHHBjnEmXHDB
         93Q4OtQdYR4BFLOAeedRwSOERNDfpPFvDW2/NeKc+cdJ8eUBp1oOQQvFzzT0x8K5uhsT
         4cQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317705; x=1750922505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i2REX8f1H3qE3TCrycXPdBwYvBe5kQ22cbStBAf1MQA=;
        b=SmpqsvanHjmMkrbIIJ1Z4D25CLqxE6O16njEgEfadGBB1dxuyw2GP74hpZ9oVMgTCz
         FjNKrWo5mkwXPjRLnVWI6uZ13JXOVw1BTKm+7fhTD++J/I/fFIp3nd05wcDjQ3rxEUlu
         p/0LLDVocMExZymjIVjmsmNSebQg3VZa6w+Jc9VVpDiRRxOfg5vqhkzSNOMzn6cQ1jaL
         n0V0vjrIwk79bG9Ge7SCoTBNwvAYGyiNKSUgrvBivcraoBVFZelc/5YrR3kFkn7d0vVI
         z0QbsVbTppPryFc3+xUL4QguxLObq43GdCG3NiGwVbKmgqSqvPuodRmrxdTNBBa8SknZ
         D99g==
X-Forwarded-Encrypted: i=1; AJvYcCWgrFL1Gqap9BsebWwpuExkU6Y+ZerG3c24dK9AN50e8YCdf9OWXWNGLDwcMOUB8+AZemSpFCqBO0P9Eysh/j5/@lists.infradead.org
X-Gm-Message-State: AOJu0YyCpI6uzjA3RwbCfoAagcT2RrljJtbP6uGW3Kv7mPdqPd5mG8Us
	dk2t/s9wVwrPRZ7TCkHArkvTwHVCjnh6Bmou282KxDLaEcBSE9+cIiwmfzwXdID46u0kFCLIs+d
	Jvmb681GWdDgM6sffeU0kgu8ydWswGDa8wozl0EFUpg==
X-Gm-Gg: ASbGncsYiveZuovMY46M9gDBClPuHVmQ41vVQL0aBw6oSSAZzXcMNdSXB3NTvn2yGbb
	U9LN6ztwW8Reh2VqOnM99Rqny4QWiUejwxcL1F5H5aT1oWZRj2YvjrkksVkydAfT9pY/wwsr/7P
	85vMqjS/721vCHipLyN8DiFfkb9xOabAuoez6dQ8F+Lzh/aVyA96lZr1iZCQMfV9PlbZDfh9NKt
	pw=
X-Google-Smtp-Source: AGHT+IEh54Pu16jXn4P+irLbn846Wet4MTiIBtxZ5XCuFceE2ajC9TqO8oRVjTcWCkeViL2vbItUiC+8YwBhD/ZWW4o=
X-Received: by 2002:a05:6512:15a4:b0:553:50c6:b86c with SMTP id
 2adb3069b0e04-553b6f6b5ebmr5729673e87.57.1750317704976; Thu, 19 Jun 2025
 00:21:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
 <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
 <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
 <CAMRc=Me8KZPU_KbbifL-j74GMPSuDgmmacw9g1UEfy=zeGyZcw@mail.gmail.com> <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
In-Reply-To: <CACRpkdYUr+82AKndieXm24Eg1-HY4LyfKZ9J_kTFKT1Nyyju1A@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 09:21:34 +0200
X-Gm-Features: AX0GCFvQx5dYUJVAAbuivosq23yF4paNEi7sLTcojRfNtcaypuIpqfvXVp5M46I
Message-ID: <CAMRc=Meq9+hnmvjXnq-YUJRPOOBvAV+pjHQ25k1wgFqV30Vo=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_002146_853050_99D0560E 
X-CRM114-Status: GOOD (  20.69  )
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

On Wed, Jun 18, 2025 at 3:45=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jun 18, 2025 at 2:32=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > I have a rework of gpio-mmio in progress that removes the bgpio
> > specific fields from struct gpio_chip. This includes moving the flags
> > into a separate gpio/generic.h header. I really need to either apply
> > it myself or get an immutable tag from you with this change.
>
> OK try this, if you pull in this to your tree and work with refactorings
> on top, everything should work out fine in the end:
>
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
> tags/ib-gpio-mmio-no-input-tag
>
> for you to fetch changes up to 4fb8c5d36a1cfd97cd715eb4256708bc09724f3d:
>
>   gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip (2025-06-18
> 15:40:29 +0200)
>
> ----------------------------------------------------------------
> Simple change for no-input MMIO GPIO
>
> ----------------------------------------------------------------
> Cl=C3=A9ment Le Goffic (1):
>       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
>
>  drivers/gpio/gpio-mmio.c    | 11 ++++++++++-
>  include/linux/gpio/driver.h |  1 +
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
>
> Yours,
> Linus Walleij

Hi Linus,

Sorry I didn't notice this one. But I see you already responded that
you pulled my PR from today. Should I ignore it?

Bartosz

