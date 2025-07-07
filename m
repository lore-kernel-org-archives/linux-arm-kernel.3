Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C5BC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 18:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GG2LoMDioIX1OBRqu6dyqoR2/j0OWCHWsNEqQPzuwdE=; b=HvMXhd2+yR15lv
	hUMnoBK5zt7/OOmeRktLwcsGJgDezRiKfHqUxuUwF+hWIRklGfXz0gPvnHmn90vr1eeca598OJGTn
	+wdG5IJgzMOrViye15QjrjK9LAoAjCaai9Lr8ks5mf5S4/FKnr3kACnPCpK/moDUHwiybLAosnToM
	ZJh/4gHzm6Da+m9Fgn+CsPVe2MSvt++oa4bRoPmiU/hZ7QtGbF1LHNZCZzE+1yXiPrQPegn2GM18x
	u//AIGpMOZ8LqhsXkFkY4Y4ISGaHbJABrHIlMiyvali53aijDam3GdzjMYxEpSquS8+5swgb0JQAF
	OGSVWPHAZJnvEykbqJDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYqbq-00000003Ifv-0GmQ;
	Mon, 07 Jul 2025 18:30:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpdg-00000003Ac0-2Dlo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 17:28:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC8C846525
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 17:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0B10C4CEE3
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751909303;
	bh=DA0vYq7xQ92l2ohY6lnFRwwvg+usb4Pg+fhbyInf+a4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=ukQ10/c5jkBHYEjJkRkZhCVZgrS0tE3xCnmOvGJDMwxtSH+KaXJjzMYJqKqeCbVG+
	 MmL1dgTMCNDyBJ0ufjUo5L+weGmYhZoNThNZ4M5kSnfuEbqE0x1TgQnMjWnb1mSfXH
	 SIPfsL8VIrDFmKF8SL/q6ipMTtcopZup2XpHztybmIlCdOjYG1j4QlNLlM0vI9fstW
	 ggbL08/JCN3QZpZD53ZkArlrJrBSOmTCVROIZApXnmx9T4Q9pDIIHwb9u3UsGhfEmk
	 G88kX55OXbFKICs/3LZcvkLu5/L+Mra9hEL36vzMkvAvilfczi2V9Sy3rBkKljMopx
	 HPAPqeCz7a//w==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32ce1b2188dso33082601fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 10:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUdYJprizjWAZ57YEm8/+zHNrCVPEMw7SLUwjA7SaAyN76GPLqTLcdCxAOR5UhVUopJXjfdh2EIEmKNK+iQdql@lists.infradead.org
X-Gm-Message-State: AOJu0YypN6lX1NUIYtQRF7EwhtYC/uXfIMRF5kIA/Kr3RPWSvhZg6eTs
	ehkL9KMD1HkjBUItH7CwegYEXKV+ytFiP0TnrAwuQ2qdXXJWB0drFAGHPZD13pvrEZ9r3qFTTt7
	IylOtC95CpmXWmT5jAxzHZHNHepUApAM=
X-Google-Smtp-Source: AGHT+IFY+rLsffZJVhzZIq/tx6edFSvqTm7LgThpPh+tF0NsB2IUIPiOdKkZUrVJDtPq9uSRlUjRqtYSBJv3s5pRILs=
X-Received: by 2002:a05:651c:552:b0:32f:1f1b:1e68 with SMTP id
 38308e7fff4ca-32f1f1b32bamr22374831fa.18.1751909301146; Mon, 07 Jul 2025
 10:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20250707105816.GF11488@nxa18884-linux> <20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de>
In-Reply-To: <20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 8 Jul 2025 01:28:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64PfUiKjrJyhcthuLt6FXQS6VoaShYZ3A3WO__3pu4O+w@mail.gmail.com>
X-Gm-Features: Ac12FXzWY8P19qDkdGNQUB3iwV0nucG8riI9TSaqcqIAG1yNxhf63TFCmT9amp4
Message-ID: <CAGb2v64PfUiKjrJyhcthuLt6FXQS6VoaShYZ3A3WO__3pu4O+w@mail.gmail.com>
Subject: Re: Dead lock with clock global prepare_lock mutex and device's power.runtime_status
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Carlos Song <carlos.song@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"rafael@kernel.org" <rafael@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, Frank Li <frank.li@nxp.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"festevam@gmail.com" <festevam@gmail.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "pavel@kernel.org" <pavel@kernel.org>, 
	Bough Chen <haibo.chen@nxp.com>, "len.brown@intel.com" <len.brown@intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_102824_605664_610E7E16 
X-CRM114-Status: GOOD (  20.39  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Jul 7, 2025 at 7:05=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.d=
e> wrote:
>
> On 07.07.2025 18:58:16, Peng Fan wrote:
> > On Tue, Jul 01, 2025 at 03:16:08AM +0000, Carlos Song wrote:
> > >Hi, All:
> > >
> > >We met the dead lock issue recently and think it should be common issu=
e and not sure how to fix it.
> > >
> > >We use gpio-gate-clock clock provider (drivers/clk/clk-gpio.c), gpio i=
s one of i2c gpio expander (drivers/gpio/gpio-pcf857x.c). Our i2c driver en=
able run time pm (drivers/i2c/busses/i2c-imx-lpi2c.c [1]). System random bl=
ocked when at reboot.
> > >
> > >The dead lock happen as below call stacks
> > >
> > >Task 117                                                Task 120
> > >
> > >schedule()
> > >clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wai=
t for power.runtime_status exit RPM_SUSPENDING
> > >                           ^^^^ A                       ^^^^ B
> > >clk_bulk_unprepare()                                    rpm_resume()
> > >lpi2c_runtime_suspend()                                 pm_runtime_res=
ume_and_get()
> > >...                                                     lpi2c_imx_xfer=
()
> > >                                                        ...
> > >rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
> > >                           ^^^^ B                       ...
> > >                                                        clk_prepare_lo=
ck() --> hold prepare_lock
> > >                                                        ^^^^ A
> > >                                                        ...
> > >
> >
> > This is a common issue that clk use a big prepare lock which is easy
> > to trigger dead lock with runtime pm. I recalled that pengutronix raise=
d
> > this, but could not find the information.
>
> Alexander Stein stumbled over this issue some time ago:
>
> | https://lore.kernel.org/all/20230421-kinfolk-glancing-e185fd9c47b4-mkl@=
pengutronix.de/
>
> I encountered it too, while trying to add a clock provider driver for a
> SPI attached CAN controller which uses runtime pm.

Miquel from Bootlin posted a more formal description of the problem and
some possible solutions last year [1].

[1] https://lore.kernel.org/all/20240527181928.4fc6b5f0@xps-13/

