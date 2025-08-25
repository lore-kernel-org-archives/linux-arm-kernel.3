Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86BCCA0FEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cP0weFM2+mVOhYEbkmdk331UXDeERciVJHGW33WlzMM=; b=hhrarMdP4hqZflBdIldHHrWMAe
	XPMgTBbl0bkVewkWC8MMN6yWaxy6joL0R/bY4JJXT9jlIzw0iCfFm72O6fNKRwyHLnMCoEcUJ8z9W
	UO0bGGt61rM++wDv9YRjQEXiLb03E9m1iXx5nmnnc4Z9o1DIBWoZSW6RKVvOZtG9l8g5Z8u14jFVb
	Oxu+/K0qNDP60DOINVV4qRhzr9EqaQm7Tjv4jxDm36tN8FI2N6mA98MnXLf9Tz3NSjkw2E5ryHCvE
	gv2DMycZ++PTrFIIVxjy83fUJs5NDOsp50zWilmfI5C5vIC7P/7VXWFfWqRKEKDh4keEzqb1389ZR
	5ttAeopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVND-00000007jxA-0Z9h;
	Mon, 25 Aug 2025 11:28:27 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTH5-00000007SMm-3Jxv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:14:00 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-333f7ebc44dso40647861fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756113238; x=1756718038; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cP0weFM2+mVOhYEbkmdk331UXDeERciVJHGW33WlzMM=;
        b=R1d1O4d1Ohw9NGaaGGunVEMDvF9sLxXTY0yR7qO4ZmE3qO4rKGX2dN14PLHId+0YPU
         UZHYnBpE/Mdg1Iy9x0pCn+pS9ViSm52x6jRkiReHwGo0hf3ZfByxshVecr5WXyG6GZOa
         1rZthGflOV7lOmY5wZzqQRzAgFcgJ7hq4sQ2mQSjnGC3OLG670JV4S4xII7+Oz//tOXs
         XqU3ZrMbqxheWbLt/l0rxl7fsWmkEo7QCHFiF57Xnc0X/cSjemeqKGpyGIfvCQFzlw9c
         ozvYbtAs/x1gxMVGCCn/QU8zwSCPKnRcO0vnO1s/4hrG7Kd7D6N4MeXNT9ls28V3EuAh
         D2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113238; x=1756718038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cP0weFM2+mVOhYEbkmdk331UXDeERciVJHGW33WlzMM=;
        b=VC/YdTqE6Yu4FLgajF1q/OnL+UW6poVvTIYMv0SqgZtaLHfbl2GAH/1esJLV1K4wro
         x7ap1djjpJsL2Hji0mFTSqUD0nhycnoaxwrWAiouABuXudu70Sv8rMvVON3jWEiyyoIO
         8qX13l9Ss07rSPZkaJtDs363u1IS6lT2qCUkxwcIcMGqRctEk4WVCVUs4ei2dLXN7lWE
         4a4E4DeHDuvFO0kMPACjT5zKrTFxIOOHRMWpFlQUEpX3citXTx7Ykdo9D6nHMgKnK0gm
         M3S5wLlD1GbIZUmjVUupUc6ekPBYlL32SZXXTiyIgjzqgQpRlppVDW8HoiyyR+KJe7dN
         hqHA==
X-Forwarded-Encrypted: i=1; AJvYcCVi+7mg+8sh7t/woNyNyCMcF/WYLadj4igPRbvLSSxLwzcu6qhrdL3u7nbXMnewCs0+zfiKK8HxFXKYVI14Gati@lists.infradead.org
X-Gm-Message-State: AOJu0YzdhJMOPCXA+tyBVvQ0R1cMzZ9JbqhLQaChEqvC/gttigEAExze
	mOV/YgelY8GqgC/ABkBNGy2eV0DP5PLK6rn6M8xAOadmwTfg96MF+pfqcuzNv0oY6GXptmcVgzI
	EiD+65njCX4PPtmP/pi+09UFTakRUe3sUPuxhzBOkKw==
X-Gm-Gg: ASbGncupxAPPnf45OHVhw0R1XYpP2E7q6h0VPa1BgdG7V8C2qi0vOKpTJknxbGzBALs
	pd+31W11/2anub59auQs3fSzkiH4sXLHVRO469Woqg+3KF8gnu9mdKN8X+6t/KSjhtouWKksmFm
	2X8YhVWoLnWjbYd1gaX4Zor2NHobKBq8wOynnaR5fxQeC8aIdhjspoQsG7y8i52nFwnm+nj6X4u
	68QEylrH8H2hi7pnQ==
X-Google-Smtp-Source: AGHT+IHKuGX2jcjK7CW2YUAF7pKBQi7lJi+f3JtU7wjskayoF+TL/YdXsZFZxfIG1onC6ArpMYTltcHn/C0yATQLfLE=
X-Received: by 2002:a05:651c:2141:b0:336:5d7d:f034 with SMTP id
 38308e7fff4ca-3365d7df730mr16346691fa.1.1756113237446; Mon, 25 Aug 2025
 02:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250820164946.3782702-1-Frank.Li@nxp.com>
In-Reply-To: <20250820164946.3782702-1-Frank.Li@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Aug 2025 11:13:46 +0200
X-Gm-Features: Ac12FXxQ7gXxoDsxZV2IH90hiejwNDEjwFXUKgIGdSa3W_TRCsJ2jdxesORaDrc
Message-ID: <CACRpkdYCWymgFYenTbw5TzH+De103pwf35Bq_WjCkCPJ999Xng@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
To: Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	NXP S32 Linux Team <s32@nxp.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_021359_830751_252635AF 
X-CRM114-Status: UNSURE (   8.95  )
X-CRM114-Notice: Please train this message.
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

On Wed, Aug 20, 2025 at 6:50=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
>
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinc=
trl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the re=
gexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(...)
>  .../devicetree/bindings/gpio/gpio-mxs.yaml    |  80 ++++++++++-
>  .../bindings/pinctrl/fsl,mxs-pinctrl.txt      | 127 ------------------

GPIO bindings mostly affected, so I think Bartosz want to apply
this one. (Else tell me!)

Yours,
Linus Walleij

