Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC362EA4E25
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xhlQFfKlsXb1rrwgRStrYJbY1l19eciA6eCHKer1mo=; b=10aGfptSGVK14L3gPzHNnR9h8q
	mCHvwlTIyKSELiv9O5A0NQI1HDWrJrmOKs/EyARxraiAoh9O5q1iZAJPBRbkIAzhU6eoT1AIdQyE6
	Hda4fCEyAHvjYNmk0EbiHnWz5Bv862Sy+wrcVYYgTZMc6TlOwiTmb/RtRFJC8QEy3EHCiobSAPhWB
	T3LG/EwxpFvw7zoMeGsP52wgoGuHYD/3vjj2+2v3lgNa9O0Otxp2VL04agJ3IEF9Pi1ZRWj+zZOZv
	HPi88lVtnrHiY0GnkSAFLUDoDHM4W4QG6Rd/fkM18+Aaj7l03+sCDusmVBPT6ungfWEtU3MOxIq2D
	BbjQufuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5QR-0000000DO9U-20D6;
	Mon, 02 Mar 2026 15:43:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5QP-0000000DO8s-2nWw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5A22600AE
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 15:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5611EC2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772466192;
	bh=NYYtAmlTRII+aT4YTVrTRvC2DVAVLf9Fp6itPFnhyig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u4Z6EXBsWrGIvbVtVDs2CcXUVPD1z1UII8ZrJ8CHFyOaYhSqs5pRF7l4NrWxWuxo5
	 GLbo7j968ZBz3SmstCj3zyX+kiIluz8xKmAYue77NNgve/51WK5TVEyEHb48bUC6Yd
	 +z4Y7iW+P8nUx7fi/qe/cA2balaQFaKQDUyP5101EzR0XWQjW9CiNV9eeEwiuJDOKg
	 Qr2/9hfokq9uLvjA4/cc4EQyeztXu1KOex6iEoIONDAaZ6Tp1Y37tL1Ua+aNzhw4+W
	 UhCWqJ3JPTrgsnaabrPXncAbTEniBQE3b+GWv7RWvYBtFOlmEKiYPqSr6Iv2PuY/Yk
	 7lPikg9iAVncA==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a01c80c34so46189191fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:43:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0QjnkckZpaTstkVWXyNLjv3kKCbZoOnFFccVSor98lc5ocf3QME9z+q5zZEYXuPg772uVp8yE+IFoZVj9KijW@lists.infradead.org
X-Gm-Message-State: AOJu0YwWjgsmDVMK8nyDsSPyHSrlsCdbL0OUxaykHE3ZUvoXQzGRo3Ip
	2hs/JU7ATfDbQF9MfjxA1au1sD7rnFSuWqU808JNfLbphXAdDlvgq9xoQ932Q30R49AQyYE4/NK
	OMjxTsVMZ+9xh6ZQWpcSqnlAXDCQ/9MhoFmsJgJYZaA==
X-Received: by 2002:a2e:b891:0:b0:387:da4:1664 with SMTP id
 38308e7fff4ca-389ff36c5abmr88837761fa.36.1772466190790; Mon, 02 Mar 2026
 07:43:10 -0800 (PST)
MIME-Version: 1.0
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com> <20260302160923.53abf2ea@kemnade.info>
In-Reply-To: <20260302160923.53abf2ea@kemnade.info>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 16:42:58 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcg7_MAGA2_Ue7etOHvLOxpRs7aOBHxRM3AdAHyscFxDw@mail.gmail.com>
X-Gm-Features: AaiRm52x3shdJxbM6URWEGFBH14dpZAQC7dlrMWm0mp4oa5cHSJhvWQjaHcwLdY
Message-ID: <CAMRc=Mcg7_MAGA2_Ue7etOHvLOxpRs7aOBHxRM3AdAHyscFxDw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Kalle Niemi <kaleposti@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Branden Scott <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
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

On Mon, Mar 2, 2026 at 4:11=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> On Mon, 2 Mar 2026 12:38:27 +0200
> Kalle Niemi <kaleposti@gmail.com> wrote:
>
> > =EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote:
> > > On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.c=
om> wrote:
> > >> On 2/23/26 11:05, Bartosz Golaszewski wrote:
> > >>> In order to stop i2c bus drivers from dereferencing the struct devi=
ce
> > >>> embedded in struct i2c_adapter, let's allow configuring the parent
> > >>> device and OF-node of the adapter directly through dedicated fields=
.
> > >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcom=
m.com>
> > >>> ---
> > >> Hello,
> > >> Automated driver test system bisected this commit to be the first ba=
d
> > >> commit, linux-next next-20260227 was tested. Failed tests include dr=
iver
> > >> tests for ROHM PMIC and accelerometers, which are connected to
> > >> BeagleBone Black.
> > >> The failed driver tests all fail to first i2cget and the tests stop
> > >> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such fil=
e or
> > >> directory".
> > > Wolfram: well, now it would actually be useful to know which commit
> > > exactly is the culprit so maybe splitting the changes is not a bad
> > > idea after all.
> > > Kalle: which i2c bus driver fails here? Any errors in kernel log?
> > > Bart
> >
> > Hello Bart,
> >
> > i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel l=
og. I got two failures without the dmesg available (this is bugged test seq=
uence, and not a kernel crash), but those got the same stdout message "Coul=
d not open file ...." as all others.
> >
> Probably I am using the same host driver
>
> tested on OMAP3 DM3730, result: i2c drivers get bound to their devices,
> no obvious trouble. But controllers are registered with high indexes.
>
> localhost:~# i2cdetect -l
> i2c-3   i2c             OMAP I2C adapter                        I2C adapt=
er
> i2c-4   i2c             OMAP I2C adapter                        I2C adapt=
er
> i2c-5   i2c             OMAP I2C adapter                        I2C adapt=
er
> localhost:~# uname -a
> Linux localhost 7.0.0-rc1-next-20260227 #27 SMP Mon Mar  2 11:56:27 CET 2=
026 armv7l Linux
>
> Regards,
> Andreas

Hi! Does the change I posted earlier in this thread help?

Bart

