Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24314C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=imolX7qSsiq9DS+KtH4jQru07kjP4EZc5PZkld9Ag7k=; b=dDLUW5N1aWk/mVc5LDPTrHi/6f
	6w0zzGSvxFhV7V44KxTg4XZZb1thXmMQp0nCXFuj4w4zVm8Uri9pyTlmQyGiJiv33MGMnmBcwQh7M
	jupHtWCeohiGQ2IVfRPNIMJ785lgQ55RAP84GuXiNUaBKFF6/GYiz2xKKczXSDPKuf6VShX0YCCZy
	uby4ZPkMEtRPwTgv5Q5UN3SEAPj2gI+flKND8G3C6vUnBPtUE5Zy3ZBtYRjY7dn7fIn80t8hA467v
	g4Bt1nDX6UUf2jm1Xsam/lw7Q5fA1MDUESqqMgZniPGQkB8KdxojC8poVIgWZqVWyZxYoZiSesptU
	B3Uc6DJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjD7p-00000008lQF-0SJY;
	Mon, 13 Jul 2026 09:38:57 +0000
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjD7l-00000008lPQ-0ACO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 09:38:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783935504; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=A2PpFk0vGEtY2w45rqud1fyX6/O738D6k+R9ydMJO8qRmstNo1iQGxgaeBVdiZAa6x
    +H2Xvm52EZT7p6OIBBTnBZHvSjhr+djdKOWWzkjoIDAb+N8VitYWFVQFi33g1xGltF02
    p5BGSfXs/DZGNauyGU/CS5gk99Rf7NsSq+4rPxYaIRB6VJFBJY4Txx9S3wcD8JCcDIDV
    K+WDvcI16sSth+1S++Iq+MNu0vSbudz0p9hxOHWv0+ELMTkgOT4yGk7mXMyhPTM/HM2O
    xi/2NG2uls2D/23OXQRGlEHMHwvy7auByLc3n9s3hf9dudCO7CN4qRl79NDhnnt1fa+M
    bHbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783935504;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=imolX7qSsiq9DS+KtH4jQru07kjP4EZc5PZkld9Ag7k=;
    b=sSD9A1+izIoL5gWAn4bTLYgoCWTPF+FoRHJO0L/2/TTi3KhWbXUZ4dY+5VO9Jl7cuk
    tNHudl8u7i8/wsXnzkNhZQu+tK0HXlYQOs9IVgLuxGdwQB+u4ltTROcI/JFIcEyjhZx9
    s4EEjuypFgvdFky1NX9h6Om8bVKCFXPKJZgq7WbuYplWGopRhA/rFr3x3d3yDQKlcLT6
    MucTNnt5bC2A3fRaGut49Bs2V6UiKO6WVhENy1EVmoGWn6emR+77XqQBsyBZLUd9bqIV
    40LvE9Hz8R9A8u+8dBI2nq1wOYcZn7AbOj98XL8PIX4OLYwi3Omp1/ELiQ57T/MQRmkR
    Lv/w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783935504;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=imolX7qSsiq9DS+KtH4jQru07kjP4EZc5PZkld9Ag7k=;
    b=Cv8a4lrq73F2cX7+2YTJ5/fHsdk1X+y+tuAXmr5tNEtytNlRDE5RpaTuGfBtFneHdt
    mHvnYiGaYUg1B7T4K7CeglLgD9Vy/zf+9ArlPaJlCDAmtf52Ax2Ys7J+r2G5YjsJg20M
    k3uUHi3z0Da4FArlVNLkNbyuGYGhltbI8Nydm7f3PdgMgGU1QaNpcesnik2z79DvRf1H
    4I5N3QBWOo2awuQMwqitYo/bqcx3bxVfol/ElWN3kFWOcpqr9fH3El49Gq45BZ13mf+C
    UGN76T33iKjnQCqiaP10+CKSD05FoThCmYD8ef59AN7dKHCen1BDDn0fZ0RNB1D6AyJX
    iA6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783935504;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=imolX7qSsiq9DS+KtH4jQru07kjP4EZc5PZkld9Ag7k=;
    b=lTqAmbw6/daSGIIBIi0MdJ/BPBDk6SFFmSlKiaiBKD75i2vmEE9ZjNyMI7nxbAo+WG
    7EGEWarw+yfjjzznYECw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQi5pZlciNgDl2kEp5oHJ2/c57N2Mc49IfXTKd"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426D9cNNOb
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 13 Jul 2026 11:38:23 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH 09/16] ASoC: dt-bindings: add OpenPandora Sound Card
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <5667350d-cc3f-421d-899f-f353b05c5ea1@kernel.org>
Date: Mon, 13 Jul 2026 11:38:12 +0200
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
Message-Id: <8A0C119B-7885-4538-8D4F-AC60E5C91B7E@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <7989e699de400c0fe3f0cb7af77a54077784df78.1783749722.git.hns@goldelico.com>
 <20260713-infallible-capable-dormouse-aaaebe@quoll>
 <BF2B6C4A-A4CC-48D7-9854-DC014950184B@goldelico.com>
 <5667350d-cc3f-421d-899f-f353b05c5ea1@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_023853_223901_B5C82BF5 
X-CRM114-Status: GOOD (  14.35  )
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



> Am 13.07.2026 um 11:21 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
> On 13/07/2026 10:27, H. Nikolaus Schaller wrote:
>> Hi Krzysztof,
>>=20
>> Thank you for the feedback.
>>=20
>>=20
>> It does not emit any C compiler issues or runtime problems so it =
remained unnoticed.
>=20
> I do not believe.
>=20
> There is a clear warning from Rob's bot.
>=20
> You just did not follow the process of building the code (compiler has
> nothing to do here). Read submitting patches in DT dir and then =
writing
> schema for further instructions. This is ABSOLUTE MINIMUM. We are not
> your build test service.
>=20
>>=20
>> It was notified by the sahiko-bot and will be fixed in v2.
>=20
> Sashiko has nothing to do with that.
>=20
> You DID NOT BUILD the code.

Hm. You are confusing me. I did "make" and did not get any errors...
And the resulting code works as intended.

Best regards and thanks,
Nikolaus


