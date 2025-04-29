Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9BDC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=msGhu6fOF2oyCTN/tI7gZ7eRssIApKs0mAIDv15tSXY=; b=z5WlDT62xfEchfKjo25H9v8fYU
	NQL4vCEe+BYIQ1Sj1dbbIsPltE2AmpSU9NTiwPsdk573vcE8v/daRzrHm9aphCVkMxM9b/NlSA0sL
	v4CEc30/J5qLvnTtEoems0T+uhFW8605geQ1Fvz/osYrnwFtjxLdIe9z/NmbK58CDSviJ45zetHoa
	QogekJdIMecIt97KDYwgrLSTGmPdPKt/kanzTYU163eUgjLLv2dLcq+9YUXxSJxv9HmNhC6+XDOZp
	cDKBG36EnF37/s5WTRxPvUyfo4PVFVvy+T7PB8EGIzjyoVtgZLskrOG1CyVxG04rm+n75Cr8uiZ+0
	KThABnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9nDr-0000000AAzG-0Cqn;
	Tue, 29 Apr 2025 15:50:15 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9moo-0000000A6zT-30wm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 15:24:24 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so513547a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745940261; x=1746545061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msGhu6fOF2oyCTN/tI7gZ7eRssIApKs0mAIDv15tSXY=;
        b=jg1dtkPhEkT1zZeW+0deWfolPw1KkQ81O/ShqQzlhROL9aCII+8lKprFHBzscO+S65
         GcLfCN9XL8i0yDK9v5IV1rqZvsbss6bam4/Wi57UYrCFTDLJmvSY5wCt0c3CAdMdJJy8
         ckNHWL/+znAuDowpQEr7Gg/HkDHCivaGXyOm8Xjd9zBy8qE7HvjilfjZNdIc1eOBct63
         lmeVmtzzVURAmf+kNdA7+1YdrqXhd1yCTdvBJgAltod7PXqgKC3M67q2lV6k+5LeuwIB
         aHKuO8DwGr741UHCdOjcQ1HcepasmT6ovUQARprV3iUg0yuYE7PvuKIr2ZAcFLNDRDN2
         OtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940261; x=1746545061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msGhu6fOF2oyCTN/tI7gZ7eRssIApKs0mAIDv15tSXY=;
        b=TcXiXi4LDQKHq5AFUFftI36QVqZF5QDtoBo2OqVRbv6nvrSfuwKTeeVV6dZFP5a+DS
         wpLMfvH2vmwS3tM5tM7iOxuBCg/u5H/JO/qeRj4XJ6Atox33/G8cqqSuV9CfCZUW+ILD
         6OvHrkxxf/3J+ND35D9C/1344EnjMcydp+lVoXDczWsNNrXVkyTcU3SI2dXL12DHu4LC
         S+oSvsVRqL9uuZW5M5xUUPHm10pNmNvlnlGAGp9HHLPbBz6mgGNo5fxXqZHbhG2tyFEI
         gzJccD7eqVGliDDD4J6VvYd4zvynHRg8NBFH2YphAXOwuEYNyxxOrg2cH05IkWqW3t0p
         CNSg==
X-Forwarded-Encrypted: i=1; AJvYcCWz3NnKgWVcUPeiebCtDUFHPVUN9ZElogyT+5ffBBetu2Cq/no86CdVsgcXZCDThCuD3iNlfijkRLgmvrba8sa2@lists.infradead.org
X-Gm-Message-State: AOJu0YxeJg6uR1obqZFLb8YxIgBdsIZb0VvSjS5Kal05tM1lDrGDVG8I
	c4N/8OwekLCnXZafA/okdZxMkzYZLQTya0yPPGhEzP9Niob+bwQ7
X-Gm-Gg: ASbGncvl19k2Lx8758+x9tNHr4TYAPWKTihJ9WH2ghkZy/lq69qU8HfrZ1+1zicxucs
	Vo/0b0Pf0hQLPDRvdbO87rsCdGqQ8LO4dOQtMscZftuh3CzBSQHu0ThYLRWtwAdcSFK9ifilXBY
	BDqzAit74u5xBJ5LKmKnFZNzWD+1rl6IV0jPpFnzW7mOtLrgsnJHMaATm6JUrz/uX2QzGqT3WAw
	IyN+j8DEZtZ8LwOflKFfiwVCgkMrkyYYSaGXdb8H4GF5FADFcQBjLrydZqng0Y2CjfngXQrByzq
	cebxMTQI3Su0uF3v4BBOYyQgPqq2G6tvCsRWJ20Kl8S+1IkF778iE9r/lZvRIFml3yO+m9YRF3Q
	HKXeluN7yC/IRBcj8
X-Google-Smtp-Source: AGHT+IGoCpwI1mhzwqjMaKdTGw9O8H9V2Z9zrCizgtb+8WQLicqiFAzaOh+hZID1l+Pa03HZ4jDIZw==
X-Received: by 2002:a05:6402:3495:b0:5ec:cc90:b126 with SMTP id 4fb4d7f45d1cf-5f838862cd4mr3823949a12.19.1745940260576;
        Tue, 29 Apr 2025 08:24:20 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc469sm7545748a12.7.2025.04.29.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 08:24:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Tue, 29 Apr 2025 17:24:18 +0200
Message-ID: <4645060.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <5880182.DvuYhMxLoT@jernej-laptop>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_082422_759410_49897A32 
X-CRM114-Status: GOOD (  25.71  )
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

Dne torek, 29. april 2025 ob 17:09:22 Srednjeevropski poletni =C4=8Das je A=
ndrew Lunn napisal(a):
> On Tue, Apr 29, 2025 at 04:51:59PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni =C4=
=8Das je Andrew Lunn napisal(a):
> > > On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=
=8Das je Andrew Lunn napisal(a):
> > > > > > > +&emac {
> > > > > > > +	pinctrl-names =3D "default";
> > > > > > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > > > > +	phy-mode =3D "rgmii-rxid";
> > > > > >=20
> > > > > > So relating to what Andrew said earlier today, should this read=
 rgmii-id
> > > > > > instead? Since the strap resistors just set some boot-up value,=
 but we
> > > > > > want the PHY driver to enable both RX and TX delay programmatic=
ally?
> > > > >=20
> > > > > Yes.
> > > > >=20
> > > > > There is a checkpatch.pl patch working its way through the system
> > > > > which will add warning about any rgmii value other than rgmii-id.=
 Such
> > > > > values need a comment that the PCB has extra long clock
> > > > > lines. Hopefully that will make people actually stop and think ab=
out
> > > > > this, rather than just copy broken vendor code.
> > > >=20
> > > > I spent quite some time working on ethernet support for this board.=
 Once
> > > > I've found PHY datasheet, I confirmed that there is added delay. So=
 this
> > > > particular board needs "rgmii-rxid" mode.
> > >=20
> > > There have been numerous discussions about what these rgmii modes
> > > mean, because DT developers frequently get them wrong.
> > >=20
> > > Does the PCB have an extra long clock line in the TX direction? That
> > > is what rgmii-rxid means, the PCB is providing the TX delay, the
> > > MAC/PHY pair needs to add the RX delay.
> >=20
> > While schematic is accessible, AFAIK PCB/gerbers are not, so I can't re=
ally
> > tell how long it is. But without this extra delay, ethernet doesn't wor=
k.
>=20
> You are not adding an extra delay, you are subtracting a
> delay. 'rgmii-rxid' says the TX delay is implemented by the PCB, hence
> the PHY does not need to add the delay.
>=20
> What is normal is that the PCB adds no delays, and the PHY adds the
> delay for both the RX and the TX. And you represent this with
> 'rgmii-id'.

ok, thanks for explanation.

>=20
> So what you need to find out is, where does the TX delay come from?

How to do that? Strapping show me this way and testing confirmed it. Not
sure what more I can do? As a hobbyist, I don't have access to anything more
than schematic.

Best regards,
Jernej



