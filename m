Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B911C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5eaNUk6cCIj7tkB6iVA5BRLOW7UfZYznohwiY6XKyM=; b=k1O0CssaUKyYY/bQ7hvoboJjkw
	WU4iWW29E9nyYtlnfUa+WBZV8B+hmpmUVaoFRlTLFE3il1DIvOTL1EMn3/jIFE65GTtSfGNCUHDtI
	XyC9pzsi1fPTXgpRFZTr7yyZ/pMrLDbvZlr9NikCxUqa85ihje2ehcr2RgxXrtM8fdAOFhg6pAJjV
	Xr3cRYf5537z8VCuRKMHNVQ0Fh6XFQc6F4zXQq9wjsZ+6uqT2cqypo/4ku98y4X4KUmj1ULhAJQJZ
	k1wZkDfdfC/VCvKsLaodJCySZ10lziQF+YMHXZT6Ha7S6TSKbHdeaYTlOLUPlTg6PIj3Bj+SApLV7
	e+UssVAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC0a-00000008aHW-3Xvr;
	Mon, 13 Jul 2026 08:27:24 +0000
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjC0T-00000008aB4-2Jlr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 08:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783931203; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=ApQ3WWCvBciM8URTbhxcxqb4i8zY4Wa35Ijaz69v+oBKLcM1aVNqHoqUTGZeNYRIhc
    p3rOoNfW4pCwUYdeUN1u08wepro6wyrkzbQrOA/4TnWuc6Ziy8dPGCy9yWPrquD/r7Qr
    SNp2p1/Qh0aM9E1g3ecQpwr/TGeuIdYRuGmA8pSa+CphL75R1gH9X8E0C/SslCkARY9F
    j2gmsK/aTPGDAD0p2bVM7U7dFTZ3AyEUVI2xMfqEX0zlCzwgnI3ELjfbglhH9hxqO6av
    TLCIVcLEDd0i0r25PPcLfSk8HyvaUX2HiV+4Xn1lp3Fq2M73Cj7jhuY5GbUAlPLta9Wp
    jtBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1783931203;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=X5eaNUk6cCIj7tkB6iVA5BRLOW7UfZYznohwiY6XKyM=;
    b=jkw1cYEuSot5zixvbO2Br/oB1pen23UVnS3yKFShKiB/eFVK0I/qQruj4Q/u7GbzLD
    708vqr5eEwC5WA/8t83sD6ZnTYL2sWEqWAjo0s0PhEbCgJmOsANB/f+d6AZEWOlfKA3f
    Ve+ECJAWcWgrpjIFkm7vuY45I2Ty9xZtj0tHztVJAVbdJJnbNdpvoBZOnw/VB1BeYolT
    OiuOWVu6aDSbIUEJXeCKCQTyVnBZXSAMAWSukhc73+Oo3MbI/bn799GVDwGy7ABjhDtF
    qi0jVqPdlLr8QUVqX0epVHtutYSYIu7BInotdu4QukP63gdwksRdMuS1Hm+U7+SOWWq3
    CAbA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1783931203;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=X5eaNUk6cCIj7tkB6iVA5BRLOW7UfZYznohwiY6XKyM=;
    b=p4xjHkYVayC9PTvG1lMRwEsAQQ0Ig/+fv7E0yJHN0xgS4xCjV0PSAWHVZuWsOlD5rZ
    00rXBzV20qRSG8VlSv2pIO9dEe1Bfdv1CPXEontcCOiZmFAywiZJtw5w/71tZyNHGtSi
    TrM67CF5eJQHee6YA+wAAMgvWdfHnGX1TfmZNDa278lwYJ6ZtUPToR5SZqhVQzNe2USY
    cPJdob4Lf3v0GSyl+rCW4B+uenQvP4swR6esOmZLXrNb9KKlLfqQp8kITojd0fdsFqXg
    juSj4/qeM7LyBuW356p6XVtq+ksYktxICTTxIYWNfduWx5+KlTzIwKJ7WRBNTDDonBBp
    KL/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1783931203;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=X5eaNUk6cCIj7tkB6iVA5BRLOW7UfZYznohwiY6XKyM=;
    b=Ir3lWB6ATJq5Hfy9Uynb83ys1EpQsZ8CxCjBrPT4OB1dURlxyuLB9A2UFe50CGsdn4
    sfRMP8oQAZABq37w88Cg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrQi5pZlciNgDl2kEp5oHJ2/c57N2Mc49IfXTKd"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.5.6 AUTH)
    with ESMTPSA id Q4b76426D8QfMvC
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 13 Jul 2026 10:26:41 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH 01/16] dt-bindings: twl-regulator: Add bindings for
 exposing ti,twl4030-regen
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20260713-aquatic-memorable-griffin-cf9e46@quoll>
Date: Mon, 13 Jul 2026 10:26:31 +0200
Cc: Stefan Leichter <sle85276@gmx.de>,
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
Message-Id: <3D58F644-3EAA-4BE7-88FB-1DCEAE7D5768@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <00718b18253a764c2a7c9a2b95c3b8c411796583.1783749722.git.hns@goldelico.com>
 <20260713-aquatic-memorable-griffin-cf9e46@quoll>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Grond <grond66@riseup.net>
X-Mailer: Apple Mail (2.3826.700.81.1.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_012717_854391_96CF1C5A 
X-CRM114-Status: GOOD (  19.02  )
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

Hi Krzysztof,

Thank you for the feedback.

> Am 13.07.2026 um 09:39 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
> On Sat, Jul 11, 2026 at 08:01:48AM +0200, H. Nikolaus Schaller wrote:
>> From: Grond <grond66@riseup.net>
>>=20
>> FIXME: not reflected in the bindings
>>=20
>> +Reguired properties:
>> +For twl3040 REGEN signal:
>> + - regulator-min-microvolt:
>> +  - Same meaning as in bindings/regulator/regulator.yaml, but must =
match
>> +    regulator-max-microvolt.
>> + - regulator-max-microvolt:
>> +  - Same meaning as in bindings/regulator/regulator.yaml, but must =
match
>> +    regulator-min-microvolt.
>> + - startup-delay-us:
>> +  - Same meaning as in bindings/regulator/fixed-regulator.yaml.
>=20
> I don't know what that means.
>=20
>>=20
>> Signed-off-by: Grond <grond66@riseup.net>
>=20
> As explicitly written in submitting patches: we do not take anonymous
> contributions.

Thanks for pointing this out. In more than 10 years of contributing, I =
actually have never run into this specific issue before.

To give some context: this is a contribution we received on our mailing =
list about 5 years ago. We do not know the author personally, but the =
code looks good and has been thoroughly tested by us. I kept their =
Signed-off-by because I didn't want to falsely claim authorship.

Unless he answers to this mail, what would be the best way to proceed?

Should I keep him as the Author: in the git metadata but remove the =
pseudo-anonymous Signed-off-by, and instead add my own Signed-off-by =
(and perhaps a Co-developed-by or From: note) to certify the Developer's =
Certificate of Origin (DCO) myself?

Anyways this will likely be reworked based on the sahiko-bot =
recommendations to make regen not a regulator but a gpio that can be =
controlled by a separate regulator-fixed. This will also clarify/remove =
the "same meaning" statements and ambiguities.

Thanks and BR,
Nikolaus=

