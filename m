Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D125EA4FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 14:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwfRJ2O6s1tuDwCN8lj+4A1gUOaBVqx2ngpGh/hfIZ4=; b=PI8FxwxpCR6F6f0uOlOVfNBdrn
	We/jPRX2em0OFSfCvbvy6oUcftABjzhZzIY7Z/xIzgbZBy3V3r73SL6UvdYFG2+T522+EsGVuCSAp
	13fykgsoRAV2l55GKZslObnMHUuc2q60QY6EvClXYOlshvCKFPTVIEwwljofmBhva6wtVWtCf9Ps4
	61rXWQty6DUd94h5vrv2wz3K9aDJVfXkdebezGAPCtUBwVf4CvivI6IM9b8Q3sVTSMFPpGdoJ3rs1
	ZVTH7Dz0NDJqrotxeIMa3VU/RH0igROyZ61ciGbA0pB0XYUNLwhsaz8gSN2LUh/uZk6iqZAump7SD
	5hEeDINA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXA7-00000000UZI-0SuD;
	Mon, 23 Feb 2026 14:43:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXA4-00000000UYT-3kn7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 14:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DFC7C444A1
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 14:43:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD060C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771857827;
	bh=xpkGtbKSLkOC6t0Nfnp/Fk4IE5J7TBULp81UPGnND4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VwfIKLux9JjVYynMSEnRVL7QtelWDuU+UToW1xycpMKmPtA4YQOmihE34mNLMitaU
	 19JHi1jtHx4qQNpipfLozCmLfWV0AKwy/ETivTpZ7kB6ideqGLt1krkONxaLqGfZNJ
	 POTa/jhoJzkQFJeX71rR+Ff9ZSLSF6OgliniAp+PjXv81p2oVqZ4myDxHuBxAz+rVy
	 Y6i9V2GaRTBGDcmGypb7XZc/xXKdCn5cZG3zABAAQCgLtoEuMcZNd1yi1R/AgFKlhJ
	 D/vm2EmJqMLN70ekuobPW6e3dK4zQaAasrGzdZ6UmQVBG23mUpTE1I79kr4OKLUPth
	 JtBbFlWsbOZJQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e63b427aaso4622501e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:43:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKO5o/uhqDY3181J/EhJmF0A7rH2PRQRaW9POVeb4c9EdEaxlPxcdwyF/kXPAjmwlqF+NaY0wzqmxQIPUnTDCo@lists.infradead.org
X-Gm-Message-State: AOJu0YxQfsmjIhJ7kaAC7NZd0XboP38dbHv4/FdmP9CfsG0xotnBeYl+
	uKA2xYg5WmLN3vgRD0kNkm6hxebxTSeV3moNBSA2e2I4ZocTQMQYyVtFnGBdKKj8qmHHBhi7LbY
	ZsOTzQ6N/s3TcvJ/Cqpf5u2HsL+r8ZMsld6R6OQ0mag==
X-Received: by 2002:a05:6512:3a96:b0:59f:6ec7:fa6 with SMTP id
 2adb3069b0e04-5a0ed9b2a30mr2997072e87.35.1771857826355; Mon, 23 Feb 2026
 06:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com> <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
In-Reply-To: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 23 Feb 2026 15:43:32 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me57wj7=BJ_nJZP9BV5-ZhebbFAS+DcZ=ifGxMyo=S2kA@mail.gmail.com>
X-Gm-Features: AaiRm52wJXWjyETw7SJc1Vpbds6l0EdwJaHmK-itcIl4J2BcM6sfQPM4owz6q88
Message-ID: <CAMRc=Me57wj7=BJ_nJZP9BV5-ZhebbFAS+DcZ=ifGxMyo=S2kA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] i2c: configure parent device and OF node through
 the adapter struct
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
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
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_064349_060640_3E8A19A3 
X-CRM114-Status: GOOD (  12.51  )
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

On Mon, Feb 23, 2026 at 3:15=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Bartosz,
>
> On Mon, 23 Feb 2026 at 10:06, Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
> > Changes in v2:
> > - fix a NULL-pointer dereference in gpio-rcar (Geert)
>                                       ^^^^
> I guess that is bound to happen when a GPIO maintainer touches
> the I2C subsystem? ;-)
>

That or caffeine had not hit the system yet. :)

Bartosz

