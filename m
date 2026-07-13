Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D40C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3ds+ZfPgSmMxk9w62eeDN6HWFjTVsxsr0xp5kuGCo0=; b=B7ZRnTKUGbEBqRaW8QMURFK0cq
	vcDym3jRVva0h3r8R6iDRctwEgJHeqbXwYnMO1DQj7KLs0oXrkxn35rNBtaHVwFmqrhvDOdxwgT4v
	qHgZkwZwE3HKzNCk8/GkvWSFqEwqOx53FUlryQwaydPIKZcxWgf2QA9tVRwBLjf44qfCAQejQQPqU
	ai/s7sEHFqqmIwljYJmac6lwnn+Zx4Mt6CS/BiGFbXgSPsJQjsjgFYXBUG66zyQsI91Yu+ZVzpXlz
	IXgqr1/EM+U1h1dK9TBjRpTD1SpkRt5GoY6/FVTEQoox3Woo4PTGVurd2SAFeRAUqRO2+wyw5tkfh
	myzzMEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFEd-00000009427-0V8M;
	Mon, 13 Jul 2026 11:54:07 +0000
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFEZ-000000093zo-2x92
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:54:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783943621; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Kx1wuMGhNx1H1qyfH20/px3rarhlIIZQ+JjJo0CEpux60nBDZPSSrKgs9Rl3tQiiv6
    0l0dKIVzgcjkdC3daT6DTHReUrAge2lS4LW7dM4khoLYId08yYBqLVzE1l5J6wBWMpH8
    Z9EKVYSrbNd1ti3fQ8QLOb3Gv+e+XkFK96rSLufhJeeYCIRWK65kErEhJA2uI4N64NjH
    JYSz8Sn6nZ5H52RQdUFyCUCbhgdybWcihOBibDK90RNM5bcsxZ71wwF406c4ytvZT3In
    Jmfs6IOFCUNNXe4kTJbT6bMATZ+WUR8O3jLEfZRx5UHgEo1lrh2NyIzmi2jqKLw22ZXr
    uAgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783943620;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=i3ds+ZfPgSmMxk9w62eeDN6HWFjTVsxsr0xp5kuGCo0=;
    b=BGXfZQIZ3SaQrA5X07mjvAtyo/KMJXmohUec/pZZWOecujXRZ34ILOkWUzK+DTpm19
    DnpguzbL1Z0SCC3Hpgm/18BSBg1BUOyrgDyO7vWh76TBoIxvViomlPgRdOZ2QVUU4HYJ
    9MnaMHd5KOuuqTngGz2RsP1yw3WZXZYIMWeZ4mFAuJqNK8eiiCW8p7lsgvjwiESjK51O
    CPH9DVJh5ImrcAWh/khAd7tG3GbgFouS5hc5XVRw9jo2Ln5FSuy0ML7nLcdmYFGdvT3r
    R43lS5IAIwKYUfF7w6e/7VOy2rLBLnJm7Ve0Od7qnIVFb2QhXsSPXw8SkmrsjC/GoGeM
    QLOw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783943620;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=i3ds+ZfPgSmMxk9w62eeDN6HWFjTVsxsr0xp5kuGCo0=;
    b=Y+mVFkczigTwHh07i5RU3dZ4pxUtVVhWXaI+p5c5AuX4Ed3wFswQZy7pu7aGlrJMG1
    FBOO2pYQMlDx3CJBFf33GdHpPyDq1MlQdZiKOkP9d3deI3MUqXWAt7ei92bTojyXs1W1
    +luDZjQbt02BL4qKEod75NByenN/O2d9h78LoyQmDKJg1cmhUNdKVrH18UxMrNgsE3qU
    lxDmX3AeDOyw33C7ZsKCdbNSFmDJB481hWSDhvS9ew4kZtFwMWys2mWiY8aV3XJ1eMh5
    Z44CypUzRk/gNuUvXICD9kW/AkreJKPPPMJr1hGp01t11GWAMRgt5E0gycK3VwVa6b97
    Muyg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783943620;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=i3ds+ZfPgSmMxk9w62eeDN6HWFjTVsxsr0xp5kuGCo0=;
    b=s5oUxzPzsKSduKARr3lcDfEnRpESmipObP6NRDu3IJDlm6uuVQYxwV1+P6l65C1tdO
    QuCLZy3VdSu64X4cJwCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQi5pZlciNgDl2kEp5oHJ2/c57N2Mc49IfXTKd"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426DBrcOAG
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 13 Jul 2026 13:53:38 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH 09/16] ASoC: dt-bindings: add OpenPandora Sound Card
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <741706c6-e6ff-4bc2-8ea1-28ebada6032c@kernel.org>
Date: Mon, 13 Jul 2026 13:53:28 +0200
Cc: Grond <grond66@riseup.net>,
 Stefan Leichter <sle85276@gmx.de>,
 Grazvydas Ignotas <notasas@gmail.com>,
 Tony Lindgren <tony@atomide.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Andreas Kemnade <andreas@kemnade.info>,
 Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Sen Wang <sen@ti.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com,
 mfd@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <9E796FCB-F393-48F9-A8D4-6E433EFB6876@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
 <20260713-infallible-capable-dormouse-aaaebe@quoll>
 <BF2B6C4A-A4CC-48D7-9854-DC014950184B@goldelico.com>
 <5667350d-cc3f-421d-899f-f353b05c5ea1@kernel.org>
 <8A0C119B-7885-4538-8D4F-AC60E5C91B7E@goldelico.com>
 <741706c6-e6ff-4bc2-8ea1-28ebada6032c@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_045404_004222_574188FA 
X-CRM114-Status: GOOD (  18.07  )
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



> Am 13.07.2026 um 11:42 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
> On 13/07/2026 11:38, H. Nikolaus Schaller wrote:
>>=20
>>=20
>>> Am 13.07.2026 um 11:21 schrieb Krzysztof Kozlowski =
<krzk@kernel.org>:
>>>=20
>>> On 13/07/2026 10:27, H. Nikolaus Schaller wrote:
>>>> Hi Krzysztof,
>>>>=20
>>>> Thank you for the feedback.
>>>>=20
>>>>=20
>>>> It does not emit any C compiler issues or runtime problems so it =
remained unnoticed.
>>>=20
>>> I do not believe.
>>>=20
>>> There is a clear warning from Rob's bot.
>>>=20
>>> You just did not follow the process of building the code (compiler =
has
>>> nothing to do here). Read submitting patches in DT dir and then =
writing
>>> schema for further instructions. This is ABSOLUTE MINIMUM. We are =
not
>>> your build test service.
>>>=20
>>>>=20
>>>> It was notified by the sahiko-bot and will be fixed in v2.
>>>=20
>>> Sashiko has nothing to do with that.
>>>=20
>>> You DID NOT BUILD the code.
>>=20
>> Hm. You are confusing me. I did "make" and did not get any errors...
>> And the resulting code works as intended.
>=20
> 'make' alone does not build that, just like other pieces of code they
> have own - well documented and always expected - build processes.
>=20
> I don't know what is confusing in my message, since I pointed you to
> SPECIFIC guide telling you EXACTLY what to do (and which you did not =
do).

Confusing was the phrase "building the code". For my understanding
"building the code" is the process of building ("translating the code")
to get vmlinux or similar and a DTB and kernel modules.

As far as I understand the bindings they are used to check the DTS =
source
files against. So here is no translation of bindings into a real DTB =
that
finaly runs on a device. So I had assumed that schemas are "validated"
(not "built") by dt_binding_check.

This made me confused.

Back to topic:

It finally turned out that our script to run the required checks =
automatically
was no longer operational and silently ignored the validations. =
Therefore
nobody noticed before the bots did. Good to have a second and =
independent
check.

So sorry for the confusion we have introduced...

v2 will be checked as it previously was.

BR and thanks,
Nikolaus


