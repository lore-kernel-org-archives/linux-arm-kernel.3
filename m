Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96390C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62M00yAg51rrJZ04g8zC95EvNZ84F8x3AjdAvJoHunw=; b=A1uv8wPUVUdLqnDjxddwi7oPSp
	mCPASftGXQiCKxfIdiBksmW959iw9nrh2Q/IjdU0VkDbaR2yD8qe7nbZYFUTN0GfoJCeettsXfLIL
	BREpkvWetNSTZQut+QDqnkE8zpzelgYey8TmJ7m+NXt30ZF/IgtQhh9zWOzT3Q1RVnnRd+aIAZia3
	7FYzYxDyN1qk733tjOeTewO+Jk1T7vyJSdR3UTGYGYPdaxYB3NPtpScVrrkudomULDsKxqs6FXz7r
	Ee6oUbDCpD4YtMO/0wwAALBUIXPRLWQCLX2g8HkxJvBe47RzDCZZiT6NYuB9SsjZQzgkTlZSyeg3S
	EcEoy6Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toIup-0000000DgBo-1t0i;
	Sat, 01 Mar 2025 09:13:47 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toItF-0000000DfXM-2l4v;
	Sat, 01 Mar 2025 09:12:10 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso3969536a12.3;
        Sat, 01 Mar 2025 01:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740820328; x=1741425128; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62M00yAg51rrJZ04g8zC95EvNZ84F8x3AjdAvJoHunw=;
        b=URkxpGTqwW+LU9Ht1F4QvwOh+pG2Rk9+WBDSU1XWTCDPnpwlOd0O5d9Su4y1TwocW0
         R43TIAyHZGVZAod+uM+VQGcAFHJ+hOJJSn1wpzggFtI5EGV7sTJAoaxUKWU8O/QAesZs
         10dnv18otfaV6Bk+RohWCKIRXh5U/CwT1GLjYMyYHf3bUxFdGbOk2xi4p8BcVVNWQvCx
         YyMHGnOiZRnP4rFNinyL6mZIPWpds+pI5hLcT0FSwoNCSxc/GqncXl56cD5y87PsAv7M
         YiQBCSLWegn/UOPdt3nl8klAw1EJU/Nlan0MG4SRLQitjFDWUVcwWSKLJeKE8a9sEu+n
         7RBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740820328; x=1741425128;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62M00yAg51rrJZ04g8zC95EvNZ84F8x3AjdAvJoHunw=;
        b=CQ0tWqd+XjY7iCFG4cUHtmW6ysb6TZH33maNPmcVzOiSwUBIEbILMEZgWwMT4v43J2
         mhRyiOFgPXD3cFihbFgi1x/971xB5cey6oAuhAOHg5Dzu4FckmnLK6ODuLXDOn+0HpoS
         EljvFoaP2dd32O36089KXR9jgikcKzgCNEYIadQu9SsDp1hr30izTgqeUM7FVlLWYBwi
         fG1K1wbsm72obSjzNJqipDtmUoOmpqipbtrZNdOLTMhFVAaKzgccAR8qrPT3KwTqCnEJ
         gCbqxuKmASpw7pLbhw/Ul4rmggTvvwrBZUcnZT6fSpiugsuwOKGTx+97g5Jb0UQZiChM
         D5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCW4rAGtwos/e/eAh61LBfgMIhkBusaj7XoO7HGrAy4dgzA2NNUdaCZhc3cAIhlBDLw4NmwjEG/g4xRMiEvllSOT@lists.infradead.org, AJvYcCX40hguxW6xarV0PxWQruvKGB6pcOv6zAz/eIQCM5JoJFRVVaN5kRFKd/tfJsip0JRIKfiowuuwCGCxev0WoBA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu3p8nv2Rn7WyADBK8dWVmp+XulZKGxgJgl4Hfs3a7AeSITpqT
	oqj2m/gr6zIQ6bonhqZ6JvWxZgdR73D0hgiLQLEazsz4RF7pgPRu
X-Gm-Gg: ASbGncucYwYiFued22frUSGGc4+cpIdiV2EeYZaHiXYQol/MY7WRGJrpYlw2lMquGf3
	nl0CCzV0CSmlPq5ufuSgJ7a5njr5dkC6vjQsayG/mWCvN1j0ZbIsZVvGS1b870xWNKlVEf3JgO6
	ul8s2bkdTD1rPY+PTTSq2tKzKBOTAW7p4L4WZgNofg77MkaBp8ZF+377YdUG5F58TnWkbo+1Nz1
	8Fw5fqxbe64RGRE/I1XtAMv+sC21QQ6bSYntqqWrmgXSzO8skMYKlncOkCywj7xepILTK1M4dBV
	XiU5wCuZ1jGCgG7N5eTtwmJQQ9nKvfuHe/EVIS988bEI4Mm8y1KXlTTV0jnh8O1wG8UOFOkqK4H
	YJSn9fFOyQh57/8JYeLjNEoW1gA==
X-Google-Smtp-Source: AGHT+IEV8xcpINPWUe49yXpBYPm3MtVspqPFUx6SBprxmJEllwjfLWfeeFh1xeuz1VE+t2lFH6t06w==
X-Received: by 2002:a17:907:7288:b0:abf:5922:b7a8 with SMTP id a640c23a62f3a-abf5922dccamr135545766b.41.1740820327515;
        Sat, 01 Mar 2025 01:12:07 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b98b5sm436358366b.3.2025.03.01.01.12.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Mar 2025 01:12:07 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH v7 0/3] Add HDMI audio on the rk3588 SoC
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <3337030.aeNJFYEL58@trenzalore>
Date: Sat, 1 Mar 2025 10:11:54 +0100
Cc: linux-kernel@vger.kernel.org,
 Algea Cao <algea.cao@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org,
 Niklas Cassel <cassel@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 kernel@collabora.com,
 David Airlie <airlied@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 FUKAUMI Naoki <naoki@radxa.com>,
 devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Jonker <jbx6244@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0A30138B-183E-4816-80FF-AACDCFE3B3A6@gmail.com>
References: <20250217215641.372723-1-detlev.casanova@collabora.com>
 <87frk2sumw.wl-kuninori.morimoto.gx@renesas.com>
 <8734g2sg4t.wl-kuninori.morimoto.gx@renesas.com>
 <3337030.aeNJFYEL58@trenzalore>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_011209_694205_C5AE290A 
X-CRM114-Status: GOOD (  10.19  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Detlev Casanova =
<detlev.casanova@collabora.com> w dniu 25 lut 2025, o godz. 15:58:
>=20
> =46rom what I see, the error is not present anymore on linux 6.14-rc4. =
I tried=20
> reverting your patch "ASoC: simple-card-utils.c: add missing =
dlc->of_node"=20
> (dabbd325b25edb5cdd99c94391817202dd54b651) and the error reappears.

Guys,

Just FYI:

On 6.14-rc4 without =
0001-ASoC-simple-card-utils-Don-t-use-__free-device_node-.patch - i =
still have oops like this: =
https://gist.github.com/warpme/ed75c05d3b68f995d429dbd9097005ba
They are happening not every boot - but still happening.

However applying =
0001-ASoC-simple-card-utils-Don-t-use-__free-device_node-.patch (with =
some adaptations as it not applies cleanly on 6.140rc4) - dmesg becomes =
clean (10 boots; all ok)






