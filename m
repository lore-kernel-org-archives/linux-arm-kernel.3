Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA28CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 19:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGP8QREMcd/AaPsprMdpu0BolksBxlVcRR5B0xb1iVQ=; b=VTOQQpH2WDNEjcE1F9Ac1TvJC1
	eje1u4l+HSAqS7bJpKHiDly7s73tU/0Qcdr5hFG9MEGyZLbwNIwK6sMCDmKBM13H4Su9lOvtyA+cV
	GdM0CHdWLOVJNkacGBTKk4byE8+9C1XAyQxJaaVUYZ3j5E0oSqHiqFjt1UQhrir+aOKpSfoVie4Zl
	C99vPp1VRNwUMb+WlTotmp9wczN3SxrN20TcfzDPOaJsV0+xeoJw6ZYD45QHUVLsSUUS/FN+yhQem
	zDt/p1/8cdGGSZV98PkjN2n7phDH5CbQ8wfuSVqA3AmW/bcZ4bahmxESgRnsuvuBe7hmZOFoKnjo2
	TueKxbmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIXXO-000000061fB-279J;
	Mon, 10 Nov 2025 19:26:50 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIXXN-000000061ei-07MO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 19:26:50 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-594516d941cso3758289e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 11:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762802806; x=1763407606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGP8QREMcd/AaPsprMdpu0BolksBxlVcRR5B0xb1iVQ=;
        b=LJmiJta44rFiuIIkrHndpVj1aiAwiXwkVhoh8UnWelVKAyDIoBfAt4XbwdC0sufDTC
         keTkS9dIKBc6am/f8CdEDjTV6dKSY1xgviDU5+/6h6iKI/RAB5oMJcQSVUy5u0CY44mq
         sfNpNOJosegZl4eLgWsxYutrtqA9lckknMJXoNPwrkU4dPvdGNqxLOHM9bCoqOdPSzPH
         KGTF3HU1KkQi4Pg9H0ftYSHoh4wOEHdtw2kQ6+u9IjvK+Hta9Dx/T1lmFIfP6+80WogX
         8ZtVqh32RMLbNptUZc+o5guNvrSLBAVAfs9fHYndtP6QI8TEk4O/mu+imVsmsHsC5bgQ
         AwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762802806; x=1763407606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QGP8QREMcd/AaPsprMdpu0BolksBxlVcRR5B0xb1iVQ=;
        b=cLH/mqh+6ge1RP1wbHIQI2pTWaZqLPBSQlxwFbMm82scTo/M5tPlDdgX5RkoGRHNmz
         tdg3P9LpzCHF7Vo+huqK4ErrGh0GdQaDqsgrYOP+YfRo3gb3/dW/He5fq3airRV7Wl7B
         bnqrX7p4sJQHose+/w91b0QdBA/eLLKfxPz0VD6dyw7W4UMVOu/HXrgTO5a9jBqEl97v
         TyM6io6pRNfKP6Nb0KNoZh6f3BT/ZnKdCEcPvdR2ve3u31PGXcAcEDNWkyswBr8BA6dT
         X8MLtghlSC9zDL4nBGqdp+01VXiij1Qww18UHoaepHmhFPieloJ+frZWte7ohUoYP0yF
         sfqw==
X-Forwarded-Encrypted: i=1; AJvYcCVLq5hDStTEfyn87lgWoKTGigzkb2PVdoA4qR7+armL47l9MfRpHalEvHJcz1Ue4tl3FlKiAUxpEKSvwc7JiWE+@lists.infradead.org
X-Gm-Message-State: AOJu0YzDwCXEbhBcEMRY9AQ/dND0MvsMZRUTjnYNeODC3wjqfiaDmkkT
	CTRLNagrm4YzIwg9K/UuFb0AHKvOO+Ph6TI41YhFrIQ9HiNku4E3g8nVupvAYlFsVbvyO+RwcHb
	oiRw7VX5oj7lrnmNrZkgkLzJr9xzOamk=
X-Gm-Gg: ASbGncszESlUgc9/5537AJMrmqBr7qge7JAv0Cm0PwlG/OoolLQuDXaVWgUS4ytwUZC
	4Jwk3nXmb+4arGNDkTAhZ2zCTuLVCDnhCVKxkL25sASmS3SW6Ebg3ucATLy8CSeK0hHI/Ii1qum
	q8PzEXgvR9OeNugYSk0gcMht7DWPTQsEroUZpVg31ANj589GppizjagGU4Pkcm6rFSzVNzKbj91
	I07nC9Bv59Wc+CCrfQ/45g8GCsUotntM+KQKXenXySMBsPuH4EFSJ6//itjpJ3joaVKxQq7ywS7
	TZuB/4sA+7MJrnTM
X-Google-Smtp-Source: AGHT+IE2w++hbFBecmu0ldyA3GzUU/nItyyDdlyoL3af2e2XPwUQ48QHaBgbQkhDEsXF284tkIFknJ3Bm82utQZyrag=
X-Received: by 2002:a05:6512:3d9f:b0:592:f3ef:19ad with SMTP id
 2adb3069b0e04-5945f1c0a0cmr2748942e87.34.1762802806159; Mon, 10 Nov 2025
 11:26:46 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <aRF0++cUigbETuPs@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
In-Reply-To: <aRF0++cUigbETuPs@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 10 Nov 2025 16:26:34 -0300
X-Gm-Features: AWmQ_bmb7MnvX9j071Ug1e9S416TAObVP1qyQuyove0FFDmd8l7EUQKS7aibrU8
Message-ID: <CAOMZO5AdcR_fT_RV5-NWu7j51_TA_=Mzzi-Y3Y=HpH+pu=mrvQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, alexander.stein@ew.tq-group.com, 
	dario.binacchi@amarulasolutions.com, marex@denx.de, 
	Markus.Niebel@tq-group.com, y.moog@phytec.de, joao.goncalves@toradex.com, 
	frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Justin Jiang <justin.jiang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_112649_072747_DC5B96B9 
X-CRM114-Status: UNSURE (   7.68  )
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

Hi Joseph,

On Mon, Nov 10, 2025 at 2:15=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> wro=
te:

> > +/ {
> > +     model =3D "NXP i.MX8MPlus FRDM board";
> > +     compatible =3D "fsl,imx8mp-frdm", "fsl,imx8mp";
>         model =3D "NXP FRDM-IMX8MPLUS";
>         compatible =3D "fsl,frdm-imx8mp", "fsl,imx8mp";

Why do you suggest changing the compatible string?

"fsl,imx8mp-frdm", "fsl,imx8mp"; is correct.

