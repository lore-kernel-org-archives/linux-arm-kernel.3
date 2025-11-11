Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F0FCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 10:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g2BNnZMONHx8/CvKkJxYxrwMB72hoWbxX7RGGc1E2Ds=; b=z75ipnxizUao+iFqE0oFF0+y7r
	3jaYkXj0RskdtIPmYnmUaH9HGVCXsVceuHOeDmiBK/2jOPa5ONbLN8QAYjAF+sQqWQeKvf4ok/Vgw
	YTj1X1+o+o4cKWq0TRLzgNn1gjS1DfRHBZ0rkBE1VMtSWrmQ7oN1k3c6epWqaPtTPWIvBPcWbQWuc
	SH1Puz4HPfdM6hRtIMEFvBIkQL6ofi8gFmwcBZpoukY7OKeyWi0HEFu1Rl+iAJgkeZiZqBjVIc+wl
	MS0auqVq4UtOJDu02A/Po0YOQDjdj+wMw9lpyypMWjdkvs+C3WTF4IMZxoLaOtAhnZOHJMfwhy/l4
	hg7vVsLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlUC-00000006wIy-2FMq;
	Tue, 11 Nov 2025 10:20:28 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlUA-00000006wIE-0Ox8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 10:20:27 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-ba599137cf7so3137595a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 02:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762856425; x=1763461225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g2BNnZMONHx8/CvKkJxYxrwMB72hoWbxX7RGGc1E2Ds=;
        b=EKHJ9tMtf7VZaD5OsP3S4udV39Cg/s26XlfnRHHBrkNxJouKq9a9n3H2FELANORLaB
         OGIslkH+/2D91yYkS1q+Y7YidMZ1fBW8E3WumjmP525SvUMPNH1EBZUY34wM8Fl8SyUU
         NqJvNn4B9zkoYxNhJg99S0g023SP54R1H3lhXALEjwOMA2ZC4XO8GA3Iaz7NUQgQCc+7
         mmSerIoXvz0l5GixroEYIa1AgxwWV8UCF8wFp38ouwLG2Z3FzJMKVXEekgHDTWFhUI8i
         /4gGrzSJnmtDG2qvPHFnMKeGIIMgCpwDhhf18zGTqbWcyQmOcHkxi0Vo0BJCwbM82li4
         cBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856425; x=1763461225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g2BNnZMONHx8/CvKkJxYxrwMB72hoWbxX7RGGc1E2Ds=;
        b=WF5V1lcNxs/THNhnM31D0NbJiz7dKnuwL4QStJCbJ9f7La69vrknNg5PZrrPIK8j5L
         THcWs/QDDRaNi8td5/zjzxwif1HT/n9QA/ZGOdTsNPLCqg5pCTCRln6uGm8zTmTLuaDB
         WtXcuQ7ddmaMf+p2zXCaxuLlPwfvnKLQVncd6w+hJfmG/yj2ZU1GDH/2daT7VS1yOMxw
         5comOuDRUpynWRtTK9lBHU07yEgQb+XmAPwYSnS0pkGBND+yVTavbWqFLSIEcO6zcF0i
         ec/8CiFEtqpDdV7gcENc6vRxniO3uyly056PGH1JilY1IIb+9mRe+4Yincvm/dkBl6FM
         V0+w==
X-Forwarded-Encrypted: i=1; AJvYcCVnJiXpG1Ro8s89Xu0KHjab83X2OuQcLsILiEHLXPhKchidWoJTU5DL6Rqn3H8rSlt2R/9X6sOS6aGoqOrP1mQK@lists.infradead.org
X-Gm-Message-State: AOJu0YwmtGC+amPhL163qMxedb8j/k2Kw8uwjp/EIciT/MLvBkG9vSNq
	QmfWFFduSjPMd5Obd4WYdRb4s9MJ+v/w5+VoG15r/v0EYeJNGZ44BnOy0ux2VvbkbbLANGguZS+
	PmOT97eRrNg+cf2bcVB1dbEjqjBi0LxX7XfAQPBc=
X-Gm-Gg: ASbGnctCohnHRto3d32ktvHquHireAQampUF0JLh/PHgF9dvtLsLLeMtgzW8Xb8p1wb
	A4HopkhIMfP0R4gg1fwApgAe/ZQKNCyWn8KWUL9PyjfMCOeLzxcIFmXsJdKHCOJknCDYK2M9xsK
	OOdYVmWSfs/1E7SKuFj2zIA+Cw3NuhlU/iGpadkLDwecDAw9wqTrWjKcVu/nEmvjskSlPaytmPZ
	HzlnpfDKUZbv4HzysvbjL2OdgxlWBJEEpdoDqq6AoQRuwmfi9GW8iq9Qw==
X-Google-Smtp-Source: AGHT+IGHeEc0tdcwN2CitYeC9X138lPaLhDv7imL1UBIrrtgzyaJrxx+3S5nCZWKtBm7wpPk+C2oztDUFMFw3MuqU3k=
X-Received: by 2002:a17:903:a8b:b0:298:68e:405e with SMTP id
 d9443c01a7336-298068e42acmr127289735ad.59.1762856425272; Tue, 11 Nov 2025
 02:20:25 -0800 (PST)
MIME-Version: 1.0
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com> <aRF0++cUigbETuPs@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
 <CAOMZO5AdcR_fT_RV5-NWu7j51_TA_=Mzzi-Y3Y=HpH+pu=mrvQ@mail.gmail.com>
In-Reply-To: <CAOMZO5AdcR_fT_RV5-NWu7j51_TA_=Mzzi-Y3Y=HpH+pu=mrvQ@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Nov 2025 12:22:49 +0200
X-Gm-Features: AWmQ_blb19ig8nToRgjFSZoxZIb7WUT84e0ePG6rGqwjB44zvP8kQIVu2iX87yU
Message-ID: <CAEnQRZBdqUQUahHcFO2W6yezonXdpFVT-G52rnda941+M=T93g@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
To: Fabio Estevam <festevam@gmail.com>
Cc: Joseph Guo <qijian.guo@nxp.com>, Rogerio Pimentel <rpimentel.silva@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com, dario.binacchi@amarulasolutions.com, 
	marex@denx.de, Markus.Niebel@tq-group.com, y.moog@phytec.de, 
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de, josua@solid-run.com, 
	francesco.dolcini@toradex.com, primoz.fiser@norik.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>, 
	Justin Jiang <justin.jiang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_022026_139341_1EA5F08A 
X-CRM114-Status: UNSURE (   8.58  )
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

Hello Fabio, Rogerio,

> On Mon, Nov 10, 2025 at 2:15=E2=80=AFAM Joseph Guo <qijian.guo@nxp.com> w=
rote:
>
> > > +/ {
> > > +     model =3D "NXP i.MX8MPlus FRDM board";
> > > +     compatible =3D "fsl,imx8mp-frdm", "fsl,imx8mp";
> >         model =3D "NXP FRDM-IMX8MPLUS";
> >         compatible =3D "fsl,frdm-imx8mp", "fsl,imx8mp";
>
> Why do you suggest changing the compatible string?
>
> "fsl,imx8mp-frdm", "fsl,imx8mp"; is correct.
>

All NXP documentation refers to this as FRDM-IMX8MPLUS.

But compatible strings have a certain pattern to be followed so
we should really go with: "fsl,imx8mp-frdm",

But for model and all references in text and commit message
we should follow the documentation and use  FRDM-IMX8MPLUS.

So, model should be  model =3D "NXP FRDM-IMX8MPLUS";

Thanks,
Daniel.

