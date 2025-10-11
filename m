Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51548CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZCFVzYHZ2h0JIUQU0arhlSFw5b6cu6XyQY71uLY2mU=; b=h6nIAwfeEn+5L9KUNh2TnBG1jM
	L6I2c6N9ng//YhqY3xwK1CboUPGh7BNZYaSLS9zvdHM3dlwix2lDXq1Ui6oyh/KMjxWfuNAD6VLWs
	pBymDMJiYTt7IuRM9KzDlldm870QJUitNNyFmN76isP8BCFA5fD018OiO7V1Ge6NquK8gfVEsT2NQ
	hNAGi3CBBDQUzcAsDfPP7+t5Yeq4WPawav5npiT1SylYhIAiXW6DwlrGKncMzL9dqszlqMhGs3BDU
	0BaTYtxJduqOK7H78PEkip5maNFVaz4pS95RMPyrX5F3lI4PTCG8BaSAaQ6xHRoUNPueic7vLEkpt
	rPF0BfZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7WpF-0000000A286-0PjH;
	Sat, 11 Oct 2025 10:27:45 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7WpC-0000000A27I-1udK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 10:27:44 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-63994113841so5082382a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Oct 2025 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760178461; x=1760783261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZCFVzYHZ2h0JIUQU0arhlSFw5b6cu6XyQY71uLY2mU=;
        b=mbYebk9vYlJSfBMFxzECx1a1PQM5RUU23292JeJSFbkBJwZNK13c63IxOI3deai/dj
         emOtjTIaHgHAy/MmuAyHunNJQU+OTsvj7DuhILNLBQmKuXUQLPBDYSyK13hj2N9MhGPh
         HVVwZITN3DgzTYZ/tRC2zBj2xFWmil47sS7qOLq9PobqJxJHPuciF+kOEQBmmAGA2iV3
         zyLRTjqF0ILobBFYTMC4lOrp2Yg0+jPgEZCH4bW6OkIvU6llsQyLuE869YufSH5XFx6o
         E1J2e/CWCGwDADLBLS23I8S5TANgS7k5UQqG2kaqN8EcwgS1Ye2VRwvbTf9ND6FBOMTt
         uErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760178461; x=1760783261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZCFVzYHZ2h0JIUQU0arhlSFw5b6cu6XyQY71uLY2mU=;
        b=hOp4C8mLHdVv4bdToh48ZoPcVSlsfPnX0cxjhcMh/7xR1OkhpnXYi6nLkAPxxpfUVw
         zKajFRp1XKqGXyx6+X1edEyMQyIKOn01dFu1IQN0BX/Y/OorFJTgWBI+mwlId27jhHIq
         5rxU6Bn6m9y69C3Mvx46+JiorYDvV63YKoEFbtdXeMyGaXng7U2sbSPwtBQan9JoQOgz
         pa/pWFCpAQA/uW2CTpQfUUg/4KT55b3s7+CATqDav3p/jL8WHS6LDD71TmKqU03SLdtg
         shSV7KPGMv8GHWHo2Y5Lr13QlY9HMOzUI5zpxxTz7QjkmwqmxeoHpHVEPJnVy3zlXJg0
         vI1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCmIAQf2bkgrR2CiMw97i+xMXvaV8q67BvXpIBhb1WxaS3bLSiqzC+LBABplLBzYttz2TYpv/11PfD8n22SAEk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8PEWcHsFiT47NagBXCdio3bw1mb/LdwotitTZ58wpUI75NOpw
	b2VeqTt5tBlmAS6wcDpzm+D2bzoLnHpTmluit/MUsZ7+uKpOYLM46kdr
X-Gm-Gg: ASbGncvIt0pVLtQojAtR2lIImItpGzO+6ptLtDTXQeL/ALwSiWQdZ7YJc7Kbe2x+x0f
	lQCf7a0/bHCCWsFD6sqzbA9cUw4lGwrtD+H8sIZs3TN6NKYO2NLSUPQDkofKAkqSfHnli5F108Z
	IK0UVKkYHabBCDlQ2Ui+pc8oRQSHeobFJ75cJos9mcZsSrcrnj9GGEfq+8s4c6Hp56ZVmS0X1he
	Y3ko6DKtrvn9b7SYJiRXz5locFPemcO+WJhVzWnlLZakGv9Tf5gqDgDVMFuSEwu1Wvowx+ZGD71
	1aoyh0C2PixMdGuhVhQFgr9IcMN+BOwrqtWowd7pfcVY3ePRB6uwMBbQyBy0FRxkiD09YbznWad
	KKMloXIB7CHlsM6/CEQk/EWwTn8Nnp00xlip8tZ0typH/VYA6Fw8CZWcI1jaZAbdy4C61iuEeJg
	==
X-Google-Smtp-Source: AGHT+IGDpGQ1keH41V5u7okn0umUzJaDZ4pIXQPpFP/RgbssUfZTewtEXcOU16HUhZmJhf/y3/QSQg==
X-Received: by 2002:a05:6402:40c8:b0:62b:63f8:cdbb with SMTP id 4fb4d7f45d1cf-639d5c4c1e1mr12894658a12.25.1760178460551;
        Sat, 11 Oct 2025 03:27:40 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5c132567sm4471906a12.33.2025.10.11.03.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 03:27:40 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Richard GENOUD <richard.genoud@bootlin.com>
Cc: Wentao Liang <vulab@iscas.ac.cn>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/15] dt-bindings: mtd: sunxi: Add new compatible
Date: Sat, 11 Oct 2025 12:27:38 +0200
Message-ID: <12756400.O9o76ZdvQC@jernej-laptop>
In-Reply-To: <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
 <02864e41-cbf7-42e1-87ba-95bdac6d9e6d@kernel.org>
 <195f3b01-93d9-41da-aa9e-826e82889d83@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_032742_529952_EC5E12BC 
X-CRM114-Status: GOOD (  13.90  )
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

Hi,

Dne petek, 10. oktober 2025 ob 12:18:56 Srednjeevropski poletni =C4=8Das je=
 Richard GENOUD napisal(a):
> Le 10/10/2025 =C3=A0 10:49, Krzysztof Kozlowski a =C3=A9crit :
> > On 10/10/2025 10:40, Richard Genoud wrote:
> >> +
> >>   properties:
> >>     compatible:
> >>       enum:
> >>         - allwinner,sun4i-a10-nand
> >>         - allwinner,sun8i-a23-nand-controller
> >> +      - allwinner,sun50i-h616-nand-controller
> >=20
> >=20
> > Also:
> > 1. missing new line - why did you remove it?
> > 2. Keep existing sunxi preferred order of entries. In other platforms it
> > is alphanumerical, not natural. In case sunxi uses something else, just
> > be sure you use sunxi order.

Sunxi order is from oldest generation to newest and then alphabetically
by soc name.

This is already correctly ordered.

Best regards,
Jernej

> ok, make sens
>=20
> Thanks!
>=20
> >=20
> > Best regards,
> > Krzysztof
>=20
>=20
>=20





