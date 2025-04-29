Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4F3C3ABAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vc3WSfpQvNDEgBDU00QUHdbslsZjLasvip3IA6Eo2q8=; b=Wj7lDNG7X/Tj5JPWpwKGLrHNkZ
	VTKEESa7xa/1JzS4Z82dZYsU3ZAOn/w9jKM9ZGBwxElKMey7qYGJjV1xT37Ya0rc61iUqoBQTZ1jd
	CWtqMHQqvUIdVSwnM+0dZcwnd/s6xRj8xkKmHAVFkLc2afq8UHoFjZA3H/jWBO3TrQSImtOYG/QlL
	KnxnsoSq4LzY6l3WYDi2yKTdAl6xeqXETN+87J57adQB9UayV3/a+c8eQY9dEWINTRl8h23qyuJw6
	BoweuhS80noavqbBCeger9wJFdJQ/5pjTUzhmHD/SZ8LDf6HQpDQqXbCbsTMm6fjy1zUFALGsNEKO
	dBZwlbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oKc-0000000ALSu-1hph;
	Tue, 29 Apr 2025 17:01:18 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mrZ-0000000A7tZ-33yz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:27:14 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so10330438a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745940432; x=1746545232; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc3WSfpQvNDEgBDU00QUHdbslsZjLasvip3IA6Eo2q8=;
        b=kWiZkpzaVK4bp3tBm0BmPJibtmv2OR+JF4EQbwXsGl6B2AJ0u68JcomdftLLv8unaG
         JCwERyTKn15vCtPthRvNblfFpIT6H2+EZeG1lgmfoLlTsQSw9OcUNzjLCF+M7+/3BSE7
         IWnKntF7EasaQDlFPZL59W8KIahIEpezIgQQK/YP/zuA3jE0QFxaX1RSONbyn6aNoTZa
         lz9sXNdM2QSQttDUmxFvztvkJUkMkmpU8fos1wXXJdyfG9KGARf7FzSDp4+JDRqogryI
         p2hgMoosd6DeZaQgSe+Be4p0N52y/AXiTRwoTxdEW8jazhBr8wwcOAxrlHZH4mY8MVW4
         t79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940432; x=1746545232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vc3WSfpQvNDEgBDU00QUHdbslsZjLasvip3IA6Eo2q8=;
        b=rZz4qyCt4Rz4Pv7pM8qoJjlKk8IydHOp++UCD70unT21g+pTcfdM+2BjaRtg06Ngjy
         nU9c3caRnTM70Dii9Dm/sZIdGJnTPQSGokMUOy1J8qP84padbwl6RNP67mdv0Q44yLWL
         DDfzq9h+NO1NIYGh25KmwqS8zjZJWkVzd78U+QMzAh+/n7PkjVO0jKcm6+P3E/t4neOL
         M4Pxo/9cHEbgyjqiekkcWsFEBpst79A2j095vQiwjWytv+RJSi5yiYxQwJL7dVlxN9PR
         75Dm4GdRr5fdWY5WEmAI4TChvNjmoQwunusejbG20GVrRJ4sIYaASrvU6n1BUNntsx/Z
         TW0w==
X-Forwarded-Encrypted: i=1; AJvYcCV0PnoWU5cO6lp0tcrQzAD0kUrK8goHkAwEJlt+0TO1wbsgAHKXe2Nlf4TNZfCLmyMTMWMDmDzImfTMN+xJWacx@lists.infradead.org
X-Gm-Message-State: AOJu0YyM1HCcLVNuU9vTdhf8DIMLzKhK/qE2ya/DTJ4zsSYySDXXNsyh
	IpYtDZ9rIv+X/iCC+UrBRFVEvk8FZZ/u9aCtekv4eEaW5Dqp5GdQ
X-Gm-Gg: ASbGncvNDeXHK7D0o3qKC/uQv2NbUN9cP+69iuD6geOQpVmFPltLFW27cbNdL0V2gyg
	sTYtSruUcn0eNfnMSO9NxMu5j43NSb566vXk3+EoH3np8MicpQSuiU3a0PvsUMai+wBo2zTWgfZ
	/QHEWzmH8y4RudJKPF6yPYgQqukORrL2JfVWKDE6Y28+N+/YbEFjzJKk3nVOieB81sPvzsQl8as
	OV8crD3wvDN2UHY9oHBIB/6wYX4BEPPLSZHM+azUgu159HfIRcA47sz5ip7WvrPAF+o7+AeqD2n
	dO12XJzhBMY1hstX1j1d5pDKP/HUCL542iyilltqU3moNje1aS1WAkSEXMNFH7mgRozbnGX9sYS
	EBE75Zt4ZwpzPKoIy
X-Google-Smtp-Source: AGHT+IGsJ57Of2nb457tr3CBW6uYeC7DETfVfedFrbH1sj9I4XHUkmt+rUOCY3dZmn0H2Z0tPv7kog==
X-Received: by 2002:a05:6402:5192:b0:5f8:7d69:2688 with SMTP id 4fb4d7f45d1cf-5f87d692a4cmr444453a12.19.1745940431485;
        Tue, 29 Apr 2025 08:27:11 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7286bb2e1sm7322523a12.36.2025.04.29.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 08:27:11 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Tue, 29 Apr 2025 17:27:10 +0200
Message-ID: <4975791.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <4645060.LvFx2qVVIh@jernej-laptop>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
 <4645060.LvFx2qVVIh@jernej-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_082713_781348_F6D677FF 
X-CRM114-Status: GOOD (  28.09  )
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

Dne torek, 29. april 2025 ob 17:24:18 Srednjeevropski poletni =C4=8Das je J=
ernej =C5=A0krabec napisal(a):
> Dne torek, 29. april 2025 ob 17:09:22 Srednjeevropski poletni =C4=8Das je=
 Andrew Lunn napisal(a):
> > On Tue, Apr 29, 2025 at 04:51:59PM +0200, Jernej =C5=A0krabec wrote:
> > > Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni =
=C4=8Das je Andrew Lunn napisal(a):
> > > > On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej =C5=A0krabec wrote:
> > > > > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=
=8Das je Andrew Lunn napisal(a):
> > > > > > > > +&emac {
> > > > > > > > +	pinctrl-names =3D "default";
> > > > > > > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > > > > > +	phy-mode =3D "rgmii-rxid";
> > > > > > >=20
> > > > > > > So relating to what Andrew said earlier today, should this re=
ad rgmii-id
> > > > > > > instead? Since the strap resistors just set some boot-up valu=
e, but we
> > > > > > > want the PHY driver to enable both RX and TX delay programmat=
ically?
> > > > > >=20
> > > > > > Yes.
> > > > > >=20
> > > > > > There is a checkpatch.pl patch working its way through the syst=
em
> > > > > > which will add warning about any rgmii value other than rgmii-i=
d. Such
> > > > > > values need a comment that the PCB has extra long clock
> > > > > > lines. Hopefully that will make people actually stop and think =
about
> > > > > > this, rather than just copy broken vendor code.
> > > > >=20
> > > > > I spent quite some time working on ethernet support for this boar=
d. Once
> > > > > I've found PHY datasheet, I confirmed that there is added delay. =
So this
> > > > > particular board needs "rgmii-rxid" mode.
> > > >=20
> > > > There have been numerous discussions about what these rgmii modes
> > > > mean, because DT developers frequently get them wrong.
> > > >=20
> > > > Does the PCB have an extra long clock line in the TX direction? That
> > > > is what rgmii-rxid means, the PCB is providing the TX delay, the
> > > > MAC/PHY pair needs to add the RX delay.
> > >=20
> > > While schematic is accessible, AFAIK PCB/gerbers are not, so I can't =
really
> > > tell how long it is. But without this extra delay, ethernet doesn't w=
ork.
> >=20
> > You are not adding an extra delay, you are subtracting a
> > delay. 'rgmii-rxid' says the TX delay is implemented by the PCB, hence
> > the PHY does not need to add the delay.
> >=20
> > What is normal is that the PCB adds no delays, and the PHY adds the
> > delay for both the RX and the TX. And you represent this with
> > 'rgmii-id'.
>=20
> ok, thanks for explanation.
>=20
> >=20
> > So what you need to find out is, where does the TX delay come from?
>=20
> How to do that? Strapping show me this way and testing confirmed it. Not
> sure what more I can do? As a hobbyist, I don't have access to anything m=
ore
> than schematic.

I just to be clear, I tested various combinations, including rgmii-id, and =
it
didn't work, except rgmii-rxid, which matches strapping. Of course Motorcomm
PHY driver took that into account and set registers accordingly.

Best regards,
Jernej






