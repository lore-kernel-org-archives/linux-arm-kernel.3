Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DCCC369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 20:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxZVbaLuerUQOiGUQNqAhYl1gyDXczPcezBxadZyF5A=; b=lmnIH06Obc36A5cZ6pMgvzRVxa
	whZBc9xA5PqbXPnQZ0W9Zhx4VDh/9B/q3272/p+vwdYIKikmYvsJgm8EsAGaxGKfQ2nXElh6bdQEC
	nwgf8uQJdXGX9evYvWmk06lKdZxtewMwGH3z+7ED5xTxU9JceBcCBn38pywzt0rEv84yOm9ox2a7T
	LUphsW7mv3YIZO4CUg92BVsquvebZaE9usk1sF6kMMUpR/xf2rwEw6kaOI7TBkBHzO5bXroeNSR3d
	UzwYLqfpPRmilUZoDsvuvkD2Ae6x0IqfNgXfgwxV73CJGFOveuQQZN78lMZuXqgPd7/25cTm3fTA5
	JufL0kmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u82yM-0000000FIeX-22sV;
	Thu, 24 Apr 2025 20:15:02 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u828I-0000000FAgz-0FS3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 19:21:15 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso10284165e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745522472; x=1746127272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxZVbaLuerUQOiGUQNqAhYl1gyDXczPcezBxadZyF5A=;
        b=cH42NtD2CuT/ZPJYocl4sSNCypK4kmHkkvkzDqt8MfP/W8FaAf7a+bngQKGy3E2qQE
         m8Etg1mJllNPbl7B9NhdEdChJX7RyCu+4bd80hFb0kAkyvQPhhTRC6F9j1fxVKsUuiFz
         v0povlmiL8vicmqfdikb6C27oKOSExL7TGDCvKkTFV1uXSzmC+tvpZi5fvWweLkfZe29
         7xN/ATLGCtM57VHBwKJvS3Qp7w2qZdN+JL3lzpaHcNPVRSCtLs0eCFnclDO/bELe6MDN
         ca8/lI4YKtMT/mcIyIUM+AVsYwRwm9/CMWOEqv05Wbb9Paa4hDdJkNCt2quRmVXWYfVn
         6ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745522472; x=1746127272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VxZVbaLuerUQOiGUQNqAhYl1gyDXczPcezBxadZyF5A=;
        b=GlWi20yVcfwmqBSEMr6QvT185zlAQ/geSr6zjxEy/BM6oPRpvFSlUhgTnnzsnhpGfj
         IpwEmKmohkeLCh5MRwqtgILM4gPEnJLUCRjp64D9nE3rYEF1IpYLPrq9M31GMNOCdmMB
         HaK/0W+qx2wtyvFDrQ4DuRP764C8Bk0yw2BHfihvC9lPBnLOTe1sa3LM3kq/xwtyaxRv
         BGAQgCcpVyKNS9Zw+RsSDXfGS24foikZP9KNpoOnkTYQfnkkgM1m78RyL/n1We3/RKcN
         aJPt9Io2nCthF/XyLjseqsBLfc1n2X4oYOYm7eawU1yHu8Ux+C5LW/oT/ofLFL2AFE3f
         QcgA==
X-Forwarded-Encrypted: i=1; AJvYcCU0XJsZbpn1MlZpfjaNVB18BhDxvFNIV3WTFXVOsONCWalQTG5u1rsI7gIZWaALQkwSqIKFaL+ZIn8uPPAOFJG/@lists.infradead.org
X-Gm-Message-State: AOJu0YyegfsuKT+VNgarziHaJ/2S+LrI7qoP/HcGuJm0lxdWjm2HOG7K
	L64xV452fTRUGzUoO6bHozTPTwi22n9kGfryUYGCLED18awsAUSx
X-Gm-Gg: ASbGncu2/WOTtoW8OBR8w90e2cFylegQ2dXYf89qtP+FAvMrUSCVWhgZopATyXDNlbl
	wcmwfbUSGympulDG8NcaCvffHe8pH1Kw/zydM3Jqz77lnZzo1L/fjEnEpuCZ90Pp+0IjAIieuzG
	DZ+GwwcU3yiiFEeZoggXptON44WM+CPHf+hIubp/HMitXacavKjBhPzVHKCsrSLHMaz8xFxKYaD
	LHwCE6KgJMjlKiuA3Vo9wDijO+wyBYAMtmGHKNSmw4BTMHfgIfVDAuyZQcWyeVB22uxuZoMX2N5
	F3Zwn63EYe/lGEC6U4+gFkyRqQ2OcrppEVDCYyZE33kVOb0POadeDRhcgweCG6JYDO0dYQQbLSE
	Xz61s6KfGKQpOtxEZ
X-Google-Smtp-Source: AGHT+IFZGRprjS3R9kdZBnFSrqQKh3fPVHhwBoQA7Av3OfiEbnQa9dyvQJUljIblbrFBUYdwTbBs0Q==
X-Received: by 2002:a05:600c:1e86:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-440a3186746mr5102125e9.28.1745522472126;
        Thu, 24 Apr 2025 12:21:12 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d868asm31066455e9.26.2025.04.24.12.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:21:10 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, wens@csie.org
Cc: Andre Przywara <andre.przywara@arm.com>, Yixun Lan <dlan@gentoo.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, clabbe.montjoie@gmail.com
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
Date: Thu, 24 Apr 2025 21:21:09 +0200
Message-ID: <8516361.T7Z3S40VBb@jernej-laptop>
In-Reply-To: <CAGb2v65GPqr5Vnqb_MhAJBAjQzd-vKi1g1pJ53oUnF0Ym2PH9g@mail.gmail.com>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
 <7fcedce7-5cfe-48a4-9769-e6e7e82dc786@lunn.ch>
 <CAGb2v65GPqr5Vnqb_MhAJBAjQzd-vKi1g1pJ53oUnF0Ym2PH9g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_122114_113380_D0254149 
X-CRM114-Status: GOOD (  24.32  )
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

Dne =C4=8Detrtek, 24. april 2025 ob 21:05:17 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> On Fri, Apr 25, 2025 at 3:02=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > > In my experience, vendor DT has proper delays specified, just 7 inste=
ad of
> > > 700, for example. What they get wrong, or better said, don't care, is=
 phy
> > > mode. It's always set to rgmii because phy driver most of the time ig=
nores
> > > this value and phy IC just uses mode set using resistors. Proper way =
here
> > > would be to check schematic and set phy mode according to that. This =
method
> > > always works, except for one board, which had resistors set wrong and
> > > phy mode configured over phy driver was actually fix for it.
> >
> > What PHY driver is this? If it is ignoring the mode, it is broken.
> >
> > We have had problems in the past in this respect. A PHY driver which
> > ignored the RGMII modes, and strapping was used. That 'worked' until
> > somebody built a board with broken strapping and added code to respect
> > the RGMII mode, overriding the strapping. It made that board work, but
> > broke lots of others which had the wrong RGMII mode....
> >
> > If we have this again, i would like to know so we can try to get in
> > front of the problem, before we have lots of broken boards...
>=20
> I think the incident you are referring to is exactly the one that Jernej
> mentioned.
>=20
> And regarding the bad PHY driver, it could simply be that the PHY driver
> was not built or not loaded, hence the kernel falling back to the generic
> one, which of course doesn't know how to set the modes.

Mainline is sorted out as far as I'm aware. Broken PHY drivers are part
of BSP code drops, from where these values are taken from. So, for sure
I wouldn't trust phy mode set in BSP code, but allwinner,tx-delay-ps and
allwinner,rx-delay-ps are usually trustworthy.

Best regards,
Jernej





