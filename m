Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB469D58E7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr4tlDRl6oPSAmOvngxm+4SQmIJt0rroCHEQsJvSNW8=; b=F4HiSbexKRRFUrXWVFmD3Mc44b
	n4AZxPkt1gIf7bGXto2bgKN7vynzIk9qnLN1RVJC+RxZcdJMdVmyIoeAQUrMVUOH6pE1ggMxmcRGB
	sJcOG0dVPr09dYf8UBNyh36HZ4i3S27HqpodXSD3dlMscULzUu9ORCFfBw0HTxemrgdAqLot/knx5
	y5GRhme4MColN67rXPghFEcNqweiwHdX87M5SYU3o+lBsZRDZztIVSya3f1xC5Qvt6W4Dk/0VHKLu
	XCNbhf5z40lVeAKILVKWiA//clOb14aysaGOyIu9JTngJOD69eDllN8xscTck8B39tf1LmgYvLhGP
	rOIDS+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwz3h-0000000CYPn-0PdT;
	Mon, 02 Mar 2026 08:55:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwz3e-0000000CYOu-3Zcw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 08:55:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 103E16013E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 08:55:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62DCC2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772441717;
	bh=Wr4tlDRl6oPSAmOvngxm+4SQmIJt0rroCHEQsJvSNW8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OguXo6j+KGJe55bk8IEbL9rPsIwNgDL+hdSJOPpCsW/UrwfixWfneOL/Rb43NbMtc
	 Xy5/b14r7HsT4zNEi2b2YcsmmLnvxZpss2TO3oeU/hHA7LoxqJNyFhsBOLdHXdSV/w
	 K24Lna4qdmybb9yy2G097bEfGlymxU2jyISEverK2tROniRtRqJz0/7zcc5AVcKtoz
	 NTN9Blzhz6bWJfWxNH/36qRtEStrmkzmjZ5hI0GgTU7YX2faK4vL9vw1h482OHEbdG
	 a29y1JPJtLhEWbefKHPW6aul8+MG2dMoa1ACD48/aez0IGvTstccEgSWdbW5n8PPFo
	 XYdOtKQ3n0xSw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3870dec27f4so2869251fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 00:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX41I839tiguce7Thr/q4rKV8LsGDNb/p/YJ5h8fbedbHQalfYWiLsZJOIBbw2GjxjvHUI0GYP/qcASNe1ZkVNU@lists.infradead.org
X-Gm-Message-State: AOJu0YyuryzzbRIXjhUKfPtxYpjpv3iBFn14c9FUd0t8NRY/GOvQTa6z
	2LXuvfUHx6b2iefgfFWmCUp47sVnut9+KT+Jq7i/yt/fVtMVJ5RnOMl1HHIcEQfipWaq8Orz4jC
	6puaM1NChXN3g4scVtmCEIRq6bGJYOtY0F3azBq+e9w==
X-Received: by 2002:a2e:b018:0:b0:37f:d9ba:747 with SMTP id
 38308e7fff4ca-389f1d73cecmr65334241fa.5.1772441715946; Mon, 02 Mar 2026
 00:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-1-d78db0a6fcf7@oss.qualcomm.com> <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
In-Reply-To: <ac23aec1-6dce-4dd5-8990-9fad40998478@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 09:55:04 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf7vQYosm7ViZRg31EdPipfuD=wboMtEneGDCXc20tweQ@mail.gmail.com>
X-Gm-Features: AaiRm53-Jiy54KH5rFLuIQyxPw_sYDt2pmqB7mKXc8_Bgm_qwPjbm9X-evfdjaM
Message-ID: <CAMRc=Mf7vQYosm7ViZRg31EdPipfuD=wboMtEneGDCXc20tweQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Kalle Niemi <kaleposti@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>
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

On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com> wr=
ote:
>
> On 2/23/26 11:05, Bartosz Golaszewski wrote:
> > In order to stop i2c bus drivers from dereferencing the struct device
> > embedded in struct i2c_adapter, let's allow configuring the parent
> > device and OF-node of the adapter directly through dedicated fields.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.co=
m>
> > ---
> >
>
> Hello,
>
> Automated driver test system bisected this commit to be the first bad
> commit, linux-next next-20260227 was tested. Failed tests include driver
> tests for ROHM PMIC and accelerometers, which are connected to
> BeagleBone Black.
>
> The failed driver tests all fail to first i2cget and the tests stop
> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or
> directory".
>

Wolfram: well, now it would actually be useful to know which commit
exactly is the culprit so maybe splitting the changes is not a bad
idea after all.

Kalle: which i2c bus driver fails here? Any errors in kernel log?

Bart

