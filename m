Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B4E107BCF1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 02:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXws6LkfRc01I28IbH0KBFSnQLO6Cva5ehRLzaS0ijo=; b=f07t8xP7FJKmc71gFfgF3vA0dk
	EKHpM9VVHOpBu+oys/lT/mPIOB31gs4o2dppiH2fgEgYVPdouckn//7jPnZADZKRPYcIJsw99aCS9
	2x/7HydKhC+McVbuwLLkNXO4X5+OQEr23drvuT4pys0R0hYK87UXT+w9CP45eDMYwyEdiSX/Tiu/h
	whAajY5DCV/Sd1ezyehz6oc//FR1LbvrgM5hiep8vtCpu57wFluOa6lsASHCddwgrnAEqlxMzH4Ns
	BdHQv4+4aPaNwAhh0uLab+jKHnskMUhdXy3xTmhiXOG1tzl+xuZzxy/6X1I5+6Cl2vhrn2HAnr1ye
	HoiUlymQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Eo3-00000001Qj9-0xt5;
	Sat, 14 Mar 2026 02:32:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Enz-00000001Qin-3MHA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 02:32:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2adff872068so13271035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 19:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773455562; x=1774060362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXws6LkfRc01I28IbH0KBFSnQLO6Cva5ehRLzaS0ijo=;
        b=dkVntKLWklrGLvXk8s8na/OOH0MC1TJbPSjGeMjt1K2cEtmFSj5pZ1ZZetDXAihCct
         Axj8a0wGFVu+zoyofrgMyZ8Ej/4RRb9PNrvAtQDr/8rDT92Y2YpJSCX6LvUtv9a1GaR5
         SyhoOzww5B99mpkTliO/DM6USKWoIwHvAurJ8qRykSpacLHRkaD0cwBTCffczvs0FvCm
         PyOChCZYxYd+g9iILF5FRcoDPQTWRxp62lxPU9WYaXNUt7yzE4tF0H0+FDEW94oVOk+A
         Tq5qkNtR5xVIl/VOeviR644PXXzCocJL8rxH/vS/Qjh5Zt8xlyRe6/E2CVxtpn0TN0TQ
         1mOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773455562; x=1774060362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QXws6LkfRc01I28IbH0KBFSnQLO6Cva5ehRLzaS0ijo=;
        b=FohsYtGskkq5m4TNDU4r74/s3rr1cGukIzrqkXFgL395EY+i/as60nRN6wGwFnEhiD
         sTgrUaDu/QFSXfqzhy6eDjpR6k+AcGrFyomm3gkoFHJCUcENk6ytCgvKMNt32SFj5J37
         CBLSVDbNVnKRN45AH7S5pSnC4+TVYJmpWL1RnX8ICQzpx5x7Mq3ZcD4qLS2ARs2IsciK
         zgV3Woe0yXdjFW/hDHQCMw6murAVNwahYX/FBPW7T0QluO8GulU0DiCHDQqI2LKBeAqm
         fpqHdYJKaBTIvovF7T5/VVDRa/s44dBbdwqlLD8IWgP1Nb54yDgKLzil8444+1Po8C0f
         7x3A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ45U9pKrvNwTjtwq9r39zROmkEsVRVa1fNH+Myrot8aju3R3zkWnwAK3SdujmHNj1KDkpZcpaWUY4EA9c/C8I@lists.infradead.org
X-Gm-Message-State: AOJu0YxtlxJqCMJ1WCVGk/pJzFN2H8aAizzfw4vEBJ3mXjycHqvtj+yO
	0yjp9nX36Dl0aXIgqyWTNud/X+ONxck5PEiPrK44bHeqspS+QfNN3cwd
X-Gm-Gg: ATEYQzyPn+6U+RXhZFaGeCjngZBG/ULOMh8wwfbpgNLkwKnh9zy/lZ+It+CCjL+4JzL
	bnzdq9Yy+QQB7Fv3lHKJIJJX4uvLnEenp1KqJLAHBLgBaEPPpXPepyl6R6QnwuXITLtwUDznaUM
	9omjv0xZlA86OAUf0ks/zxS9PXofa9BtlJ0emdbnL+bGOpJQ1/Qobcep3VEInNY1eh3Kgn7N5Rd
	WnqihI68yWVgBtsikS0DBVPB4fR6Y3cxmNeIfQuw3N1tjyt9x41+z3CIroStoBeA8qRDstoM4n7
	KmlF+54FD1drzurvTNXunKMs8smEX7qJENZjRjlOFajUGE5WafB+QjIlfgddl8Ym3yoXv3oYp4A
	KULLnqTVZa8bDpXeh9p866YMtKT90G9ec3mxDLBSfogpmg1LBvygDauNFhZ5WUK6EAjv76FsqxX
	8pjnF0FJ/8UwpxTh3fLsDZ3NkW7i6JSPHopcMgsnpXQCbKQRJTJLhVDqzHR7rcoAbx6ZEhdKswf
	FQsS3iqwV53d+ooWKYh9cIGAn8Em6PPLV7ZVpFKyYlMNdbvT7XEF55EnMmxdbCbrZQfdGErZYZH
	+zrUfCPhkkL+yA==
X-Received: by 2002:a17:903:28f:b0:2ad:edc4:1796 with SMTP id d9443c01a7336-2aecaa4d681mr54393645ad.39.1773455562268;
        Fri, 13 Mar 2026 19:32:42 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece8093casm35373165ad.61.2026.03.13.19.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 19:32:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Frank Li <Frank.Li@nxp.com>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject: Re: [PATCH v3 7/7] ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle
Date: Sat, 14 Mar 2026 12:32:26 +1000
Message-ID: <5796105.LvFx2qVVIh@setsuna>
In-Reply-To: <6a3cc78a-77bc-473e-bfbf-caffbe8f25bb@sirena.org.uk>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-7-c6ac5351489a@gmail.com>
 <6a3cc78a-77bc-473e-bfbf-caffbe8f25bb@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_193243_846659_51CAA595 
X-CRM114-Status: GOOD (  18.27  )
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

On Friday, 13 March 2026 12:33:05=E2=80=AFam Australian Eastern Standard Ti=
me Mark Brown wrote:
> On Sun, Mar 01, 2026 at 06:05:26PM +1000, James Calligeros wrote:
> > +static int tas2770_set_dai_tdm_idle(struct snd_soc_dai *dai,
> > +				    unsigned int tx_mask,
> > +				    unsigned int rx_mask,
> > +				    int tx_mode, int rx_mode)
> > +{
> >=20
> > +	switch (tx_mode) {
> > +	case SND_SOC_DAI_TDM_IDLE_PULLDOWN:
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> > +						    TAS2770_DIN_PD_SDOUT,
> > +						    TAS2770_DIN_PD_SDOUT);
> > +		if (ret)
> > +			return ret;
> > +
> > +		break;
>=20
> This and all the other cases only updates the bits it's specifically
> setting for the mode, so _ZERO and _HIZ don't update the pull and this
> doesn't update the _KEEP/_FILL settings.  Not sure how often anyone is
> going to change this at runtime though.

I didn't notice any side effects caused by not explicitly turning off
the weak pulldown, but it makes sense to do if the consumer has asked
for a mode that is not pulldown.

> > +	case SND_SOC_DAI_TDM_IDLE_OFF:
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_DIN_PD,
> > +						    TAS2770_DIN_PD_SDOUT, 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret =3D snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG=
4,
> > +						    TAS2770_TDM_CFG_REG4_TX_KEEPER, 0);
>=20
> Actually this does _KEEP but not _FILL.

_KEEPER is the important one. _FILL just controls the behaviour
of the bus keeper (zero or Hi-Z) when _KEEPER is set. If _KEEPER is
cleared, the bus keeper is turned off and the value of _FILL doesn't
matter.



