Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9408C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KnZ+bHpq3Adbno5MHK+SYpaXqn+rPN2eRCC8cungUg=; b=B990IyEsj2iG/dHzKb0J84byaZ
	zMbLdw6FOaYwWYD0rX41lWYzGE8LbKZcaMd1yjbXK9cXtAkdr8a/zuTdlgBpyLWEEO3V0xv23I0TB
	eUuaDXL8qSrIxXvbQJfrcIVQaXY6HpLsMha5nob8QdcgCuHSp8mFXBZoRMdG8/gbh/ef14/SV5zZ8
	gSMhjrBHwZkx+1gET3ynHKjhrciRjiv+UOAX99obiFMI65NCt1kJVgVfWXoDUq/8XalxtsaYRg9Ae
	IOoJJSPvFWBklaUCBZ+7//LmWPAjwtY8e6g4Q/9BL/HUve/jYg2kqWhc3R1w4CJb80nizEFhYGcY9
	MFj3B1kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlzAv-00000009I1P-0bnC;
	Sat, 22 Feb 2025 23:44:49 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlz7U-00000009HDl-1s3V
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 23:41:17 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id B4394138098E;
	Sat, 22 Feb 2025 18:41:15 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sat, 22 Feb 2025 18:41:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740267675; x=1740354075; bh=+KnZ+bHpq3Adbno5MHK+SYpaXqn+rPN2
	eRCC8cungUg=; b=VIPasXYgFYZXnBRT1VNix9zYrQg+fBuQiS88EXgxYAB3w6fM
	hG8bytPl4UWmCOkwi8OrrxMaHhaQsf1oDNv3nbj52/CgFOFjb9zTt0pJTbrEmfS1
	Kd4BXEKhmxFJgB5DRz8tyAF6pMzSML1B88z6MjYyFlzbp2JNdxi7W1Gm54VtoePR
	XDCBdvhLMnrP6AZVJfkRYkg9IIQRltVI8PT1AX4a/T7xqXcmPLbmnkS79SdwdTR9
	CDtSxzpSTYmPd1++v/zMRsiYKDaNBA6C1O26/LMUwmqfL6gocs85H2qyxMkO4hGc
	6U7yivCuajyWMz0QbnEt3JLuRp5RMnzlGx4e1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740267675; x=
	1740354075; bh=+KnZ+bHpq3Adbno5MHK+SYpaXqn+rPN2eRCC8cungUg=; b=N
	qROBFzdGqd48ACpHZMA4RQ34K7/CbqYwDeYRuhd1zeswpqR8NstOCAD3RW6pZ0PV
	BH4Myiec7K4535df5NABB39sKb2v1Nsnb9cNPrQaELABK99IXcXXKpRQx/zU4Id0
	e+AG8gjDbU7DC9LoM75jT9eNH+V+Cc2MuToBDmlt33KrI9zNH9V/3TcVByow01MS
	xANEZM8QUIr1LBdPygppUWtrCPD4+VpELOwBrs95DP7kychTFjA4jY+HFRuJLWg2
	B5D7YJqHQI/3klc8qeJy36VqXj2fKha/0Uz7MHrJsNDqRS/8f++/tJesbCq5Kn2d
	Jw41AOvaWMaXA9odMumaw==
X-ME-Sender: <xms:m2C6Z0CKr54xzCZX3ePLmZ-I3_J8CBdmV9SQzSf2YfQcuvpOIPgUfw>
    <xme:m2C6Z2h56YFUIJyrkBEW1M3usrm2Imq4dWgW_TI4gYBNeD3r1s5o7TgkcaDH3ZAM2
    fLm0D2CdF9fNgtSiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejgedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
    uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedvnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopeifvghnshestghsihgv
    rdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimh
    honhhsrdhphhhilhhiphhpvgesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhr
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:m2C6Z3l5vCZ3r4nRVTB4zUpEz5Zm54INr-rWHDQLOnQHOblRzgxhbg>
    <xmx:m2C6Z6za0QFUiDxuRCN17QEN8gJRBnllq3-hmjctAHdfqAhTsVTbhQ>
    <xmx:m2C6Z5RnpEu3JDgm9R0IL7k7oZEjZaCYpKK1TW6XVU20H-E7UPqejQ>
    <xmx:m2C6Z1auZT8EbfpaOZTeBjtGkqQvf5IBDZRSxVV2DtO5KX8LUAtvyQ>
    <xmx:m2C6Z4JhcubZ1qsHl2-1f2nPREQtGv81LjK19ySJq6RnFgtmzhfE94vK>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 854E6BA006F; Sat, 22 Feb 2025 18:41:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 12:40:54 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Samuel Holland" <samuel@sholland.org>
Cc: "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <840e7248-de05-4c96-b743-917649d71dfa@app.fastmail.com>
In-Reply-To: <4407188.ejJDZkT8p0@jernej-laptop>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-7-ryan@testtoast.com>
 <4407188.ejJDZkT8p0@jernej-laptop>
Subject: Re: [PATCH 6/8] arm64: dts: allwinner: h616: add LCD, LVDS and PWM pins
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_154116_571401_A9E9CF8D 
X-CRM114-Status: UNSURE (   6.79  )
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

On Sat, 22 Feb 2025, at 10:48 PM, Jernej =C5=A0krabec wrote:
> Dne nedelja, 16. februar 2025 ob 10:27:13 Srednjeevropski standardni=20
> =C4=8Das je Ryan Walklin napisal(a):
>> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Add device tree nodes for the LCD, LVDS0, LVDS1 and PWM pins.
>
> Let's just drop PWM pins. PWM support is not yet implemented and it do=
esn't
> fall into display themed patch anyway.

That's fine, this can be re-added when the PWM driver is implemented, an=
d will squash the backlight and panel nodes in the next patch.

Ryan

