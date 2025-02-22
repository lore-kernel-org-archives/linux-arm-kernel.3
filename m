Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F924C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 05:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftugCOFOnAKLUgdSUiW218ZfB28SAFlsaf4JlXUchKw=; b=LtCvj/DLteeJKvHNBKq4Y7qWWO
	PihIu2RICyHQSzi47rftKiR6kpm7LubHoYVvPeyWsGK5zAy2BXaETPbX4nKnVhA3JwBJBRMnOeCdG
	YXTvieCTNRF9mqUxbaF7cW6qjpmk9nBKwgZMF4v7+cgR2H03s+DE+LYPmozpOWeOmPhBPoySN9YEL
	PLz/TUrM0dKg8nBhh3eD4/jpNly1NP6yVd6zE2MKNYXWHzgBkkMGGHPfTvl0aBmwKams8VOurGeaV
	5I9QOFM7/TET+8LmxQYmS2ZDKlyH9cOP1wqLXyN2Dlp4IV6XxL8A41+QvcLS8tekcFN/sZekyXrK9
	7kcStP5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhof-00000007T8C-2xBk;
	Sat, 22 Feb 2025 05:12:41 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlhnB-00000007T4d-3USI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 05:11:11 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1224D11400A6;
	Sat, 22 Feb 2025 00:11:08 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Sat, 22 Feb 2025 00:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1740201068; x=1740287468; bh=ftugCOFOnAKLUgdSUiW218ZfB28SAFls
	af4JlXUchKw=; b=NYhwOKJh5ACBXljf5FhqyZahOUbRc3MKjwkg1Z2xOS/RB39K
	xN2MFxJE5FXzzm0bcQtBdrNOoMaK0HSLKwgFXM8ooNnoSxCCI6izIakpBRZbaTQZ
	LmavxIL/DM3KJ3gS7TDnvJQQ6i0Tuxa3tuFw52y2xkJOOft4dwcBkoBQ0jn24u9c
	2yjO4XCOW6CyYrb+pMQ2LKMA3/AqXgPWuBxdCs8SdRnLZbj0M76dkAyhVv+Pt8VE
	ai73m7aLNk0goINuHdJKHgTWCLlNNe/2sgWQo7be/qKSaGcK/g2f1FgUumBFD/TR
	496oXSPhGnxIvtUSw4RsfWFAvWsvORe1wZ+ucg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740201068; x=
	1740287468; bh=ftugCOFOnAKLUgdSUiW218ZfB28SAFlsaf4JlXUchKw=; b=4
	nfDT4XuDP0bxRlehwe7RViGr5xCIGPaWP2qL5alDa5yU4s/AgL0tY0t56doYl03a
	ftsBYlWLgZGzMNGJX5uB/Ua9bxcjOS2vF/01RJn7/DsBqoWL+wbyx+rmFo0z/7jX
	sepi7OHzQVtKl//rTmvcTr4X4m7bGRK4hWY2X+g0PKeQ6jxSL8sY/nkR4EqYBU2f
	9v7FuBibliWjp7wbdx+UraE5y6PYdy0V5IuSxLM58kom67ZfognzIrsbcwoKG1/k
	WG7g+0xssvQNM/K72+OQxL4YsZK8dWCYNGYZD7K1XRB3tt3oUvW8x50NGaZuKA6w
	Q+XJcQn8nFTx1gSInysgg==
X-ME-Sender: <xms:aly5ZxnYk5l9lx9C0lpDA5d-XRgyHKque53KFyOQsqTUdsCAtgtbJg>
    <xme:aly5Z82UG2WnUu9ERzmudia1Vkxfzrso-LWiP6eTPPojB-XtmYIzqcQ6FAd5yRqBv
    BMEsJ3CyEzPRbTUIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejvddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
    uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeifvghnsh
    estghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdrtghomhdprh
    gtphhtthhopehsihhmohhnshdrphhhihhlihhpphgvsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepmhgrtghrohhmohhrghgrnheshhhothhmrghilhdrtghomhdprhgtphhtthhope
    gsrhhoohhnihgvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqshhunhigihes
    lhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:aly5Z3rhyr4Bpjp9i5j_uoiahH66QS_3uUzzB1I9EN_moKDKAw6wuw>
    <xmx:a1y5ZxkJUXCs0m1EwBznwQE5_eV3iKY69tXP2dqVhnq4EKdzmbuhhw>
    <xmx:a1y5Z_0Z_e1kUcujNYF-jE-ugKjkIbDRZtl_TqpvOo7xEP4qGL5kVQ>
    <xmx:a1y5Zwv7P5ZTRUVvLL14R7zuNfcRY2VE8awUaUbXCuUd3pUPhqbKoQ>
    <xmx:bFy5Z23dxiFwFde2KEo5_GAhHDnin3frHZUnTUBWcc9Lc7NFwkfLo42_>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D2BDCBA006F; Sat, 22 Feb 2025 00:11:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 18:10:46 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>,
 "Chen-Yu Tsai" <wens@csie.org>, "Samuel Holland" <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 "Chris Morgan" <macromorgan@hotmail.com>, "Rob Herring" <robh@kernel.org>,
 "Philippe Simons" <simons.philippe@gmail.com>
Message-Id: <69bce5eb-c478-4b9f-a875-1e2a8a540898@app.fastmail.com>
In-Reply-To: <2733255.KRxA6XjA2N@jernej-laptop>
References: <20250214220247.10810-1-ryan@testtoast.com>
 <20250214220247.10810-3-ryan@testtoast.com>
 <2733255.KRxA6XjA2N@jernej-laptop>
Subject: Re: [PATCH v3 2/5] ASoC: sun4i-codec: correct dapm widgets and controls for
 h616
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_211110_625679_201ECAA0 
X-CRM114-Status: GOOD (  12.92  )
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

On Fri, 21 Feb 2025, at 8:05 AM, Jernej =C5=A0krabec wrote:
> Dne petek, 14. februar 2025 ob 23:02:24 Srednjeevropski standardni =C4=
=8Das=20
> je Ryan Walklin napisal(a):

>>  static const struct snd_kcontrol_new sun50i_h616_card_controls[] =3D=
 {
>> -	SOC_DAPM_PIN_SWITCH("LINEOUT"),
>> +	SOC_DAPM_PIN_SWITCH("Speaker"),

> Will this break sun50i-h616-x96-mate and sun50i-h616-orangepi-zero bas=
ed boards?
> If so, other solution must be found.

My understanding is that this a separate concept from the codec power co=
ntrol itself, which is already covered by the analog and digital power s=
upply DAPM widgets. For the H616's single lineout output, it doesn't mak=
e sense to have a separate control for this, as the codec should power o=
ff when idle using the existing DAPM widgets, and the lineout route is a=
lways active when the codec is on. The LINEOUT control here is redundant=
, and not connected to any userspace mechanism in the current state.=20

However for the RG35XX, which has a speaker amp controlled externally, w=
ith audio routed via a passive mux, it make sense to specify this as a s=
eparate route in userspace with a corresponding control (via GPIO pin in=
 this case).

The other H616 devices (Orange Pi etc) only have a single route defined =
in their DTS, and no internal speaker to require a speaker switch. This =
control does not do anything for them, and removing it should not have a=
n impact. I do not have this hardware to test, but on the RG35XX devices=
 audio is produced without it being present, and with the speaker switch=
 in either state (headphones plugged in and speaker amp off, or speaker =
amp on and headphones connected).

I did try to convey in the commit message but happy to correct the comme=
nt if you feel it is not clear.

Regards,

Ryan

