Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09675C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 18:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMLBbAwF6tPlQxRVDk5Jnfst5lz7qyDDTn8jiS12DUs=; b=oTVV/ib9o+l4QtMRt8hoI24iZZ
	XIwneH5zGwX+d19lrmqJPh97ZRSpsy4Wh2p2wy/54XMteLPl7j7uzDe1NEIwzZBJlo+1bfpJo53T9
	owflrhvCediNnOzxxEHc1pubMFyQG5tJ21q7a4wEG7cCl89IfT4LTK+tWinlOontJSoE099Ngv/I8
	LyR7Q1F8u4ywtCMGRcTMRmjc+fN2e0+QJR21YYYhuYiEygIuhnN81brOUsiB2AjpLvvbqHMbhHu0K
	D71dIU9CYEoWRaFpC6ZqVbytKTmKNXWxUY3gnHg1j08iwuq57DipnTWiMEFNEa2aYgCV0l4+K+umL
	dPtn2D+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8jrV-00000002NG3-21HF;
	Sat, 26 Apr 2025 18:02:49 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8jpd-00000002N9T-1yAA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 18:00:54 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso7835716a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Apr 2025 11:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745690451; x=1746295251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMLBbAwF6tPlQxRVDk5Jnfst5lz7qyDDTn8jiS12DUs=;
        b=YsWUErAD8HZvTdWbqujVnctp7YMYFKK66EMPGBJpAvkPAU/mstHUDOCyi1Zrf8YOZ9
         jQes7F4lmf7qiyVYTyQ7wMqCdFuDWog2FnR6DjYpuiIL8Tu412eAUeQIC/qmD4b1xt5E
         CSyzKOGfJSfk8xKOf3vvk12Dhh6cA03zucwWUMPqdCZ0cexCUvf4lmIvUuzSYDH05P2S
         RKscJFd2+BohaVwDjmvYJBKBjM7SqWlM5ExoeFSgNHOyu/2CoSg86nfYfei6+MkptbIp
         Jq+2YHvOcA2y42vLwGQsvw3bCm1MlHNx8R/i+sUdnWTqasVdHQ0wciAowPamripwoN2S
         PeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745690451; x=1746295251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AMLBbAwF6tPlQxRVDk5Jnfst5lz7qyDDTn8jiS12DUs=;
        b=Su/rm7mb67dC4r5/mM3tynVTDRYJJXb1jlIKwowfSgCDUd6VEL+n8HBVdsaEMllllH
         tcMWEADS9T7UVoRG0O7cz9z52FrurxO/WQ+DpK+fA8QwesEIbqNaz2c/KDgzVESzUrFo
         UNRCnWFqieLCIowk9FBsflbi98ktbVxvLVQ5cvULQXa4CECcRzTa1MDP422f8c6IXWQQ
         i1JZ1ykPKd6k1CiU+cFOPg02moftiyPLyhk4s8ki/9WzDYz77H4vaWqkbfKzYa6TYo+E
         u4rv+nPRtFlYoRp13rFYzATkdWcq0H4sympuEX7mDNbo6S1NF+jsINuUSHo7zJ/rwULB
         i3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVK1gyO4Jljihl3oh/tIX+xxnkLBb8I9KQBS3kfy2+wZ9Vi3vULw7KLlfDhNvc/AFdkOart+tEvyA771rELMKiH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6BWkvJxA5kvGUfxTliQOBlFVcFPGfqTeO1S4R5076JXOH2Rv8
	piimP1buP68vzr8XYWm4vXABYoV8aTInGO0nJ2jZwBTf5D01sVAa
X-Gm-Gg: ASbGncvH0h85lk0Sa151XuiBYU1LgUgMt82+UpwS10l9AozYYL9pZkKt78r0DsPxa55
	YJB9X2kSxPnriJ/YN6eNu7zcJOulr97DAWms1pkeVYG+HdBcX0D+70RqJE7XeFhwI2HqascJAFq
	Ja2q8t0V2mcJHJs38V4VqIrNfYTxvt8d47N0w4wRH6oxl7/cInbPChpJKI80or7dzXRP4Idaa9x
	U0RvCKYqEEkfMf5do53A8bUqmhdihotNFhP/rGJLSDs6NGae1e+qhmtDkiYjySra/eZ6q5OVOi7
	SDIFJDfHpheWjyCauyj5UC7MQQGMfZeUOQ0iiXsrzeRDfHse5+Cu1l8cVET4HQ==
X-Google-Smtp-Source: AGHT+IGcpmUd6V//Dy8oAGqBTp+EMOuxREYwc/MqDM/gwlxvfz17SlAjfX0874oELfIxArWQUWoL6w==
X-Received: by 2002:a17:907:94d2:b0:ac1:ecb0:ca98 with SMTP id a640c23a62f3a-ace5a48320dmr822844966b.26.1745690450982;
        Sat, 26 Apr 2025 11:00:50 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e4f7c3csm325590366b.68.2025.04.26.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 11:00:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>, Andrew Lunn <andrew@lunn.ch>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Sat, 26 Apr 2025 20:00:49 +0200
Message-ID: <2219754.irdbgypaU6@jernej-laptop>
In-Reply-To: <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <20250425135429.174a1871@donnerap.manchester.arm.com>
 <cd7fd026-2f82-43d1-abdb-482bfe600bb5@lunn.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_110053_533933_7112E22C 
X-CRM114-Status: GOOD (  11.21  )
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

Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=8Das je A=
ndrew Lunn napisal(a):
> > > +&emac {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > +	phy-mode =3D "rgmii-rxid";
> >=20
> > So relating to what Andrew said earlier today, should this read rgmii-id
> > instead? Since the strap resistors just set some boot-up value, but we
> > want the PHY driver to enable both RX and TX delay programmatically?
>=20
> Yes.
>=20
> There is a checkpatch.pl patch working its way through the system
> which will add warning about any rgmii value other than rgmii-id. Such
> values need a comment that the PCB has extra long clock
> lines. Hopefully that will make people actually stop and think about
> this, rather than just copy broken vendor code.

I spent quite some time working on ethernet support for this board. Once
I've found PHY datasheet, I confirmed that there is added delay. So this
particular board needs "rgmii-rxid" mode.

Best regards,
Jernej



