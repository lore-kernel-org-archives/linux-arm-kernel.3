Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F062C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 16:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFlarGIZbuQORh2qgUeE8MEhV3Iu+lLbawRraNX6pWU=; b=DDEN3V9WJRGJVRIf+XyA/k/BjK
	BEBS1V6XF53Ddu2x3UIFoaeE8+E1VDtcxxUOtyHEkVeCXba8aSN/Xk2QPiIhzdUTkI29kcxaoJ7Ui
	ZKfYGTGyKFviBM/POFlFSfchOR75r0chDzZ7XBibuuGY4r03dh0X4JoFS5UNYQ/RJcDWT64vWZfcb
	gpI2Hw4u3ejLJa5RjFOtaJLjXpzmxcfLIe2/Emfqua6Oal2IO8hg22PQ0+2N7dIq//BYYsfire9tY
	G4eHCd7LufSVeygzg5Pp52UsPO4xFneFiSqgsCLC0E9dYz6OtZKO1vVgZeXlgZDAHpvWKHbkaRbqh
	NCYiyUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEs7u-0000000CsHa-3lIU;
	Tue, 13 May 2025 16:05:06 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEs5n-0000000Cs49-1kiI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 16:02:56 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-47698757053so83958341cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747152174; x=1747756974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFlarGIZbuQORh2qgUeE8MEhV3Iu+lLbawRraNX6pWU=;
        b=aQ2uUSGh64x+su8fAK8sjjkI8LOZdd/sT59vjmLITAIIZShg5qiqpPX/Tusfm8u8lj
         ZzYeVG1RJ8Oo3uwX2EglZoU3jssNhp/e2dn/9ciAow0GwBzH3asqXTX/glv81+tFVdZu
         52LRy3UB6THhbhwMT4/T+nZyZewZ6fBBKObio/MzADOgNeMW1rC8rtfviu9JmzyjgYNi
         OuBOWjh/ekNbgNzB3Qnf2RJjXeU5xC3jwJr6oUrhmoBJvTI+wFc7tC+1wPhCAA6wFnMg
         IaSTH7G7PPsW+0RD3luybHT2rSGBfC10O8HQp88hifslc6luUlMei2sug1+/8dg0lS6L
         bs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152174; x=1747756974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFlarGIZbuQORh2qgUeE8MEhV3Iu+lLbawRraNX6pWU=;
        b=v0QzdtDbh5zs4ecV/MYqtOJhHjBL/aWFLbRSD+HlEF2CsoIjUJLa5DXHHYCaoz7tdF
         +QZCst4jDx9d7X1XTd/KTM4NOBKJ/HIvQhZOMh4fL8bfTo1i/Vx6L9JliAfHTwQaehT5
         f9/aRlXJA05emZJOe60lKmzI9NCNIEoo8DPZR4Vw6TTSrIQxQb06dTNaoNf2C1VRQt6Y
         I8xDltoYPfkaUgAXafy2aLzYUZgBO5lfoQnheSpqzNmGbn5oSJXCC5qvZHVfiN6ns8Wj
         DnIuKH+8WVwcqJa8xml2Oix9V5MpdtPp70ZUadXht0Ap7bq/NNzaR4W0cunPkXpdoHB3
         NLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSxV5omZkmTBm/zTyzOJdMOiAuVR1TlnZvO7YaM+/eiAAqgbC0HRa3ZspJeXqiYDXo82CjXWfA67gwvI8J54nV@lists.infradead.org
X-Gm-Message-State: AOJu0YzRmsoxBDlJJDdPy/PB8VZ9rzFfA61V9f9/tEWcE/3+c633OQ5M
	pXit8rjWcLVYdz2HYOEQD4YNOi26Sqg7TAPXFv6RMelJVPmmbE37NpTR5nQSk/8K1c+M+aidWyt
	YU29XP6tr6qst+jmSknmQKiIhfm0M3m+JEmle6g==
X-Gm-Gg: ASbGnctVCn815dyKZDchWsc3K8M8mmnRp/J+fSB62F1d9XA2sSKcuwlb2C/wlAjzQEn
	RMnr7tb8D5Nt8d8nydAaGxSLYB85dlRtXCJoAXoTMl36U+cCNDTjZ4Pqxxk9C7n8JN1D67mWVsC
	cDwU6gsoMt6b1zdaBbFQ4I9clITsHbyd8IqvgkNNBtm81/I/y9Yt7xNK7eq64w1x6B
X-Google-Smtp-Source: AGHT+IG3PLifiu+mZA2jPN3ZVpz43f/9SA9dmuLsIxO7VNUcUv7jPw9b194uMEzse2n5i4aBdHYhAEzotRLN5auThVs=
X-Received: by 2002:ac8:7d51:0:b0:48b:77:800c with SMTP id d75a77b69052e-494527d4d3fmr320683691cf.32.1747152173923;
 Tue, 13 May 2025 09:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
 <20250507-vt8500-timer-updates-v2-3-65e5d1b0855e@gmail.com> <aCNLyYtxmqqklBN8@mai.linaro.org>
In-Reply-To: <aCNLyYtxmqqklBN8@mai.linaro.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Tue, 13 May 2025 20:02:42 +0400
X-Gm-Features: AX0GCFusUXlohpeDcpmxO9GVKlqTCKC41cu3fuI99zLLV2M8AmlIj0DSeXXVvbw
Message-ID: <CABjd4YyX1nrM1qREm-dtzQUCM=TH1L8w7KeZ4ZUxg7tNH84TJg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clocksource/drivers/timer-vt8500: Add watchdog functionality
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_090255_457144_A54A1B22 
X-CRM114-Status: GOOD (  31.64  )
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

On Tue, May 13, 2025 at 5:40=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> On Wed, May 07, 2025 at 10:58:32AM +0400, Alexey Charkov wrote:
> > VIA/WonderMedia system timer IP can generate a watchdog reset when its
> > clocksource counter matches the value in the match register 0 and
> > watchdog function is enabled. For this to work, obvously the clock even=
t
> > device must use a different match register (1~3) and respective interru=
pt.
> >
> > Check if at least two interrupts are provided by the device tree, then =
use
> > match register 1 for system clock events and match register 0 for watch=
dog
> > respectively.
>
> This code falls under the watchdog umbrella not in the clocksource. It
> is better to find a way to make the timer and the watchdog separated.
>
> The timer-gxp.c is dynamically allocating a watchdog platform device
> with the shared pointer to the timer counter. IMO, it is a good
> example to split this up.

Thanks for the pointer Daniel!

I guess in this case I'll need to pass the pointer to a full
clocksource read function as platform data for the watchdog, as it's a
bit more messy here than timer-gxp.c in that this hardware cannot do
an atomic MMIO read of the counter and needs a synchronization request
to be issued and cleared before reading the value.

The clocksource code will then only instantiate a platform device for
the watchdog when it can ensure that nothing uses the first match
register.

> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  drivers/clocksource/Kconfig        | 11 +++++++
> >  drivers/clocksource/timer-vt8500.c | 61 ++++++++++++++++++++++++++++++=
++++----
> >  2 files changed, 67 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
> > index 487c8525996724fbf9c6e9726dabb478d86513b9..8f5e41ff23386d9ecb46b38=
603dae485db71cfc7 100644
> > --- a/drivers/clocksource/Kconfig
> > +++ b/drivers/clocksource/Kconfig
> > @@ -181,6 +181,17 @@ config VT8500_TIMER
> >       help
> >         Enables support for the VT8500 driver.
> >
> > +config VT8500_TIMER_WATCHDOG
> > +     bool "Enable VT8500 watchdog functionality"
> > +     depends on VT8500_TIMER
> > +     depends on WATCHDOG && WATCHDOG_CORE=3Dy
>
> if WATCHDOG_CORE=3Dy then WATCHDOG=3Dy because the first one can be
> enabled only if the second one is enabled.

Noted, thanks. Will replace it with just WATCHDOG_CORE=3Dy in the next
version. In fact, if the watchdog functionality becomes a separate
platform driver then it could also potentially be built as a module,
so "=3Dy" might also go.

Best regards,
Alexey

