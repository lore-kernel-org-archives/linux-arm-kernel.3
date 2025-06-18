Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B63EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 15:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n761KcazBD8NAVChuciBYR6i+PEWOHat/DvKkhEEUwg=; b=dL/yviV5R3nXtd8HMiy1k8vlNI
	laQ4TzvZ4SChnFpU2K2k76vF9LKpA1kKlHQ/J1gp70BKvZhDXo3YrFZY9kZYl4y9NFgsgGNTgBkV2
	/jtanHtyZAYD2ol5UlByaCWJVxnG3p99riH1gsQ0CmL/2FpjNsmOASPydffUj38X1poXoUc/Zakvc
	NRTz2bkHhpIZeO+X3v6Psp6FtVhXzzA/HAoE640v46Kgk4HxS6wulnmyBUfIHhWgCy26EoNcQd9SQ
	7C3vzr3XmjBdAKL9kGpX2rR9W8Rje7MGmn4jVZf5nKXQMVuLG4sVfjBG8T6oTnh7MOPKFFWKjsWh1
	IwxfJuNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuWt-0000000AZ8f-1Dlf;
	Wed, 18 Jun 2025 15:16:47 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrmx-0000000A6MA-3z64
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:21:13 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54d98aa5981so8826980e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750249270; x=1750854070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n761KcazBD8NAVChuciBYR6i+PEWOHat/DvKkhEEUwg=;
        b=ubKnTASolG5rTpl8urJ/cDnRoHUxBYo6v6VoYKd2YyVq+77atLtDmcpJ8uD48dvEYZ
         6HGoZt00THzv5FNuHSdMv6OK2HfFsWUwEmhEy3EIqLNebRaGRqdXdNeBoi3seiARv5CJ
         CF6d2o+nwxOjKOgFZsS+CkjQlmlMmQwO83H0TtDGPq4gjdDP/QJDoLnuf8zjU7H71IaA
         drwN00MiHtbEu4N/4D8fsG4pxlv+R8sjgoYIrfr4lPoNC8ucH+UdtiywhFsmroDOFa+H
         UL4CT0hCM3NNvFKhUh0W6Vr8CMR1/0c1zctbCnWcXmc5biQve1q0M4a7ZY6NIMCf/NGt
         0+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750249270; x=1750854070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n761KcazBD8NAVChuciBYR6i+PEWOHat/DvKkhEEUwg=;
        b=OBEjw/yJ+48rlYhbSL2gb9CtZ5U6bspald3cTqVj9I1EVOR9cTvwU6mz+K4icfQW2B
         0dU2YTYlWJh8Ux/2JnDs4ST6trsSMNr+2EjKQu+UJs8mrPeYIE2PsqdxVs+tGuYcPY/q
         JAaBN1HnTnFRbtj4mtSmoT45Ue9OzzGQRcj+3bjWPk4WdicIv6ApcKSIfiD/HjldjwY0
         Qzfu05eCOiwMuej800KuXcTAAfmimCWRHoz28awpXvI4kyPzgD1gf29Yj3y118pihAL/
         3MY/JU2QKIFbQv9d15RP5gagxjpGkrCZkHSdvLTWngiu0P9zUFH3xYn0FpeLHxDu/a6b
         eVuA==
X-Forwarded-Encrypted: i=1; AJvYcCWDUlHGypO5HzjbdTSgQqDbRq18zpMB8AD5Bm7t3Jvnmp+eNU+MeHEcihwLeFpzmITnUpSdefOiSoy0/gAy9Qiy@lists.infradead.org
X-Gm-Message-State: AOJu0YzCkIQP7ZDqoIF1ZSTfnlyakPnQpPPWIz+VZBcHnUX6uArv/chH
	ZC3/Tgs2CX1e5d16ZrxgEgKpH4xGF768ZJ8YxeOV8EOpac+K7YD3l+wTpQ9Mh6tLUXF+pQYwYcW
	8uUEu3T6yvEai7QwFOymJvxlmWiJ+cMq1PR4cWgu6Hw==
X-Gm-Gg: ASbGncvAqAwquSIoZ0uc2G0Wo377OwDhsIDBVbNsi9E+mGwwYrcXBpzVupLhDKueVy1
	xj0bs7KqdBc1IG7SQ0109ZBOXEHjZ8S2f9zlhxh0vVtzeuMEoNdrJQbe1kgN/yeYcuiwj5eeJj3
	XSLNfGGiN1MoTKOVmaTmc7eqQArU8VIwRwuCUWlzj6SCo=
X-Google-Smtp-Source: AGHT+IFxHCRWz//u1od0Lrwty9Yf9DHcSgaAHfAvrbBiimpXB2OEA85EDmSgQGSVRLhnSLdlgZURbr7ybwWz1kTTt2A=
X-Received: by 2002:a2e:a546:0:b0:32a:6312:bfc1 with SMTP id
 38308e7fff4ca-32b4a5a5c86mr42763701fa.24.1750249270277; Wed, 18 Jun 2025
 05:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com> <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
In-Reply-To: <CAMRc=MeTmwgbHv9R_=GFmjkAV4Nvc-SeSCOz1k6pnGUrF+R9Mg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:20:56 +0200
X-Gm-Features: AX0GCFvzIWiUTEnf7w2o5CriFQLwK7aVK0h_a_ivR8DSarlEz7uy-y-3wDCyAbg
Message-ID: <CACRpkdax9ojguF1SAfiN9iZi=x3VFpCea6KnhzL3JBD9EXZepw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_052111_989495_B8D9E3C6 
X-CRM114-Status: GOOD (  20.56  )
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

On Mon, Jun 16, 2025 at 10:05=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> On Fri, Jun 13, 2025 at 12:16=E2=80=AFPM Cl=C3=A9ment Le Goffic
> <clement.legoffic@foss.st.com> wrote:
> >
> > This patch series introduces the Hardware Debug Port (HDP) support for
> > STM32MP platforms.
> >
> > It includes updates to the mmio gpio driver, the addition of device tre=
e
> > bindings, the HDP driver, and updates to the device tree files for
> > STM32MP13, STM32MP15,
> > and STM32MP25 SoCs.
> > The series also updates the MAINTAINERS file to include myself as the
> > maintainer for the STM32 HDP driver and adds the necessary
> > pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> >
> > Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> > ---
>
> [snip]
>
> > ---
> > Cl=C3=A9ment Le Goffic (9):
> >       gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
> >       dt-bindings: pinctrl: stm32: Introduce HDP
> >       pinctrl: stm32: Introduce HDP driver
> >       MAINTAINERS: add Cl=C3=A9ment Le Goffic as STM32 HDP maintainer
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp13
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp15
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp25
> >       ARM: dts: stm32: add alternate pinmux for HDP pin and add HDP pin=
ctrl node
> >       ARM: dts: stm32: add Hardware debug port (HDP) on stm32mp157c-dk2=
 board
> >
>
> Patches 1-4 and 5-9 can go upstream independently. I suggest taking
> patch 1/9 through the GPIO tree and providing an immutable tag to
> Linus to take patches 2-4 through the pinctrl tree. Linus: are you OK
> with that?

Yes go ahead if you want, an immutable branch based on v6.16-rc1
is the best for me, then I pull that in.

I could also just apply it and hope for the best... it usually works.

Yours,
Linus Walleij

