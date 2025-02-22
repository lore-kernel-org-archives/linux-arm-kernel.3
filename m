Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624B9C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 23:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiOEycHuyFaMnajcbN5jU6iu0/61AYqixlcUkD5N0Zo=; b=yoNeu9cphls99JFxD8yuGJaTDn
	mYz/SOuBNroEwAR7GwoC/S8+gmJqdnWold77Qd1SPP99bXhRBzY7YoR5S05ZhtpIwIKdqdnDPfNAy
	VxnyWR9IIC+/bDiEwaq6VQ+s39caKOAKLR74eegbVqwRRPFNO5rqbV9vTLUFLxG+Se51IjouMOPPj
	sE7fSqUFkqAiAwrXHJvnWz6GumkDAuHxVYRNMyXaBiqL3x1De180EeT5z5C7gpqfs7DX4RbtfCbGF
	CxQE8r52woxwapQkm5CXGti/a5M9vA/Zm5yPLC/IfulrdZ2lpp3M9JctUsjHAn8SE7tTpGmjHL5Dl
	XgOREuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlz6Y-00000009Gwn-2Gbd;
	Sat, 22 Feb 2025 23:40:18 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlz53-00000009GYm-2eSD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 23:38:46 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfout.phl.internal (Postfix) with ESMTP id DBF8413809A2;
	Sat, 22 Feb 2025 18:38:43 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sat, 22 Feb 2025 18:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740267523; x=1740353923; bh=MiOEycHuyFaMnajcbN5jU6iu0/61AYqi
	xlcUkD5N0Zo=; b=GIkau96R5ES1g67g8DMRo9dKqBHrc3oOyxVYPJR2LxwN97iU
	xRuFvT3LBNGLeVD6UTTPjE+2eftZQhWqnYu9/7D7rpX7WC7WxQf2WYBFDAxXCl62
	o84pvoobC/NcRWj+tzDAkQgasdTwPSBegGVMBd4dvFBGM8jjtFAwmY7QRPtbnLPX
	qfVUk9qJOF7bTWEdJyWBFmdd8ctDNOOjOGY1fzM+iAyKrrImGJltC72JEdPJCLX3
	frxNYc6DIs8ksVrkV9A79CXr6hZmAMPAHHYW32PsMlT7A6FMLis2cROaNAbR1QR6
	kGVBGKU08Q83zv1VgPmxleiLWxpxTij0Dmz6TA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740267523; x=
	1740353923; bh=MiOEycHuyFaMnajcbN5jU6iu0/61AYqixlcUkD5N0Zo=; b=t
	648Ddsct3fbCKUHRJckAIoiPudMGbjD9cgpVv20PsaloSaSCq0ALg6Q6yy7j5kW/
	vFJQVxL1SeFJtahT1Fb9C4rclrziXcko4Z35D2tC8qW1b71085zeyTgLrx0RwOKZ
	Etz2iGkA5iaESNLiV7PdE4IxycaHYgmhSH6MoCwTUQSCVG8FQpWHJP/eXHuKkR38
	uqLxD1MMwHKi4hI+VwdVy1RGlkv3ALZTihYwqaBOvz83ef7P8gNYDJJq1HS8MZQt
	ffXyIQOsU7e2Sxon3Jll/O8NtvnNb/rgO9dRql0myiB4xMhIdCOJp39m2UDyFz9m
	m3hNxAJ4fgmHlfNylPUaA==
X-ME-Sender: <xms:A2C6Z9nVwVpsd6jYLsZQLsW27ELamhd7nLaEOmsGedeNua9GQ2z4Jg>
    <xme:A2C6Z40fq2S_uuueb-e0vYW_hksiCjnZdcUSLuKr0eGatS3kTvpZ51SfHkGUfi7cH
    _OYtYBzi-JgyxuXSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejgedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
    uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopeifvghnshestghsihgv
    rdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimh
    honhhsrdhphhhilhhiphhpvgesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhr
    odgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:A2C6Zzp1ke66Zmn21S1pPC3Ti3mYtnTt2maYI6zt5RfJ2VQCcnAtwg>
    <xmx:A2C6Z9lxnOVm7z9acTexu00fOjg7l5C3rJJsewn9WJ5L5_RFNEnVKQ>
    <xmx:A2C6Z70zNbBIWEbvN2zsaALwzf3IF_scA6Ou6yW45LeNU9b8hd0YRQ>
    <xmx:A2C6Z8txRewr0cq17bd4zasreCMdOsXR5VWmEMZ0pfJOtQluNk4Ueg>
    <xmx:A2C6Z5MO5xGiRnssMsRGpJo4SnlCx6QJUOjf26l6Q0AxCZrc2e-DkO-w>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AF663BA006F; Sat, 22 Feb 2025 18:38:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 12:38:12 +1300
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
Message-Id: <33762e08-d58e-4523-a016-d9768172c77b@app.fastmail.com>
In-Reply-To: <9408152.CDJkKcVGEf@jernej-laptop>
References: <20250216092827.15444-1-ryan@testtoast.com>
 <20250216092827.15444-2-ryan@testtoast.com>
 <9408152.CDJkKcVGEf@jernej-laptop>
Subject: Re: [PATCH 1/8] bus: sun50i: add DE33 compatible string to the DE2 bus driver
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_153845_740420_6B5CCDEB 
X-CRM114-Status: UNSURE (   7.31  )
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

On Sat, 22 Feb 2025, at 10:35 PM, Jernej =C5=A0krabec wrote:
> Dne nedelja, 16. februar 2025 ob 10:27:08 Srednjeevropski standardni=20
> =C4=8Das je Ryan Walklin napisal(a):
>>  static const struct of_device_id sun50i_de2_bus_of_match[] =3D {
>>  	{ .compatible =3D "allwinner,sun50i-a64-de2", },
>> +	{ .compatible =3D "allwinner,sun50i-h616-de33", },
>
> Since there is no functionality change, just go with h616 compatible w=
ith a64
> fallback. No need to change the driver.
>
Noted, thanks.

Regards,

Ryan

