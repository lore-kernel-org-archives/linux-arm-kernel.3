Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4CEFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVnkmHVd+pu9S0anEsS4r4bfU6M1ddOgx2neCXzbhZs=; b=qiy6GU/x8hpA5ZfgYTnvAxJDEf
	O2ZuOm4qqZw2zMHrctO4Hfp5usNEkkBFu3K5W7yhZLemnFURcCYxlHbNddwSOfWmmFRstRo0BszI3
	/7JHHveH8z/kkXdcl70rwhFHPmr67AVUQd3Y12RJ7zJoBXUtQMFcpXwVaAsO9XkVVyUr5OTn47XaI
	e755TqaImvWQLle0SlXoPsUe05ZedYAs1Y9b0BZpgrfCHDohoa0XWng3q7nHNZr+HR2jsd7M94Uos
	Vs4sGWwO/9Jyr/tN+FpmJA4FdNOPznJV/w5NmQhnhkJi4J1rXqlqT+/v4ALlY/MI0uU2T9CQlWdsD
	ZvkNEBkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFAn-0000000GDqM-3KJS;
	Tue, 05 May 2026 12:46:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFAm-0000000GDq8-1Ip1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:46:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 412BB61143
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA41BC2BD04
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985207;
	bh=rVnkmHVd+pu9S0anEsS4r4bfU6M1ddOgx2neCXzbhZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YBRcqY3hYCIDLQrm7nX0v8wNjpLJT9mWyPfftnVUVahrAKRuy/Ppb/682PfnGLMXN
	 LWR8HvU82oUGMD2RAQydcMnvyF5jdNG0Pk8L9QzDJE05fSod012Pj05rcD8He4x4S6
	 bmk7vnkiIfjTCDvHSoYS7BPUoO8y6sYC6F2cjrJQ2McPeNl6OTP0zNxdt1WccEi/27
	 7U/IJA7hLMUQonfiZ7+s9XswJOQXI6dGF28tBMtnhIZWS2I+j1UzEVrJv2L3ams5v2
	 TDT65zuHreErrTavdaUprSMIUXzx++2d3z9WvnJeq1yjLfetA3O3PPYNGQ/WxiMYyP
	 HceKakEZchv5Q==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a87782588cso2484851e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:46:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eN2Q9ph8WpdsxXqX/i8Yso/+nm0/IfFq2N2+0AuYDD9uziIS2S/ENZF5JLfa3kJkcMtDWUII3WlidY3JKKkPJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxifXQy2/vmDsLynKgaGzuD+yKrkaQloBlekpOHRMLx5VRNwciE
	imeid48iIC4xVw4dTZzPX1GfdzXFO8R0o2GRmEtLXBnRugHI143ONLqs1B2S4brdXhfhsZBHL/w
	Oj93jkPsip+kei9KBDRyUB/6pcAGfQME=
X-Received: by 2002:a05:6512:3b10:b0:5a3:feed:31cc with SMTP id
 2adb3069b0e04-5a8631b9e85mr4464601e87.24.1777985205388; Tue, 05 May 2026
 05:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260504131148.3622697-1-khristineandreea.barbulescu@oss.nxp.com> <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
In-Reply-To: <20260504131148.3622697-7-khristineandreea.barbulescu@oss.nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:46:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
X-Gm-Features: AVHnY4JlHoGXQmSjsgZFXuRe_ND9OHcbw2Ietb05k05PsECGSoH_v05qU7tRmbI
Message-ID: <CAD++jLnk4q7L_cFzz+1gKkAqwhv=TW1_XSepuii7b_PHF7EPqQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] pinctrl: s32cc: implement GPIO functionality
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Alberto Ruiz <aruizrui@redhat.com>, 
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Khristine,

thanks for your patch!

On Mon, May 4, 2026 at 3:12=E2=80=AFPM Khristine Andreea Barbulescu
<khristineandreea.barbulescu@oss.nxp.com> wrote:

> From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
>
> Add basic GPIO functionality (request, free, get, set) for
> the existing pinctrl SIUL2 driver since the hardware for
> pinctrl&GPIO is tightly coupled.
>
> The updated SIUL2 block groups pinctrl, GPIO data access
> and interrupt control within the same hardware unit.
> The SIUL2 driver is therefore structured as a monolithic
> pinctrl/GPIO driver.
>
> This change came as a result of upstream review in the
> following series:
> https://lore.kernel.org/linux-gpio/20260120115923.3463866-4-khristineandr=
eea.barbulescu@oss.nxp.com/T/#m543c9edbdde74bdc68b6a2364e8b975356c33043
>
> Support both SIUL2 DT layouts:
> - legacy pinctrl-only binding
> - extended pinctrl/GPIO/irqchip binding
>
> Also, remove pinmux_ops which are no longer needed.
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>

Same comment about GPIO_REGMAP here.

Maybe this has been brought up before so it's just sigh rolleyes,
but my memory is short.

Of course gpio regmap conversions can be done later, after this,
but the problem with such things is that they tend to end up on
the back burner and never actually get done then.

Yours,
Linus Walleij

