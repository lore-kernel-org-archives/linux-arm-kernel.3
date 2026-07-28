Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002CEC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:
	Date:In-Reply-To:From:Subject:Mime-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRqEh40r0PnAAxBC6Ehpg1QR1kIM64rXG8fPCVXya6U=; b=Y2p/b2qXSR5bZqNBTrk1aVQTbI
	i1rheaoVWhtqslnefmONZIZsoqXwG/gDL0G+8pDh75I4aU5Wb90PinXtUGfpHwoPNrlX9Yq7ZGLgv
	5Y8McV8pDPb046vURY/03kvZSESbUZ0sxnh/DHr+BrzSqlxchkmV3wpGtHRKFFev2ZAzSFpLVeCwB
	VH0Lt/Gp7RjnN/0Fe+3q4W41psgUi43mKvm5jV3kj8KEsuoSv0H8afBkGRZ9JTpi8izWjGZPcLqDD
	uY2mXR9/nRQubGBn3R/bdL2kil1wNCBquy1nwh7ES7C1Lp1BAFRiz0XDmwFd7dpMn1zUvfi6qepw2
	g59p+uZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1womG7-000000063J8-1B00;
	Tue, 28 Jul 2026 18:10:31 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1womG4-000000063Hp-2tr1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 18:10:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47de0093c42so135263f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785262227; x=1785867027; darn=lists.infradead.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zRqEh40r0PnAAxBC6Ehpg1QR1kIM64rXG8fPCVXya6U=;
        b=Nq0UUy3GXa0cyznxKIqgKhKt2K56qKYS3hyXyNp9yT9B+YYChpBzyI3f+7ZndXj1fg
         J3x5ryAZx07X7OlPMKRb5kOEwMw+6Z7JCY1YwoKiRLPURbarhD1ZZMxpgd/bcq/t9bSy
         Pyy60hxoYVjwYQR+9FlcNX3Pc13q/iwJfNfGJ2ltKZzzvnoaC9EFxhfqJ5Kl2bp3dOVh
         0guZoU+ACwtNKYK79uHDFuX3GzGWWF3QJWT2Qd/AeMrk8pUVqfZHhc3QvDJEp52GKWsi
         LDI7ztgdd+7A45Ce8jCfdO7u8bguoYzZTPJo83P/dUh7iiveC2hGg8M8G12ymJhUhMi0
         m37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785262227; x=1785867027;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zRqEh40r0PnAAxBC6Ehpg1QR1kIM64rXG8fPCVXya6U=;
        b=E1o+m8b68+o6PGamY4jZQgchSwJ0ZdrCUPloswbwBvc4JGsTeGHATsg6dr9gR3Dz0M
         W9JZGZImpVe90OBxe6kedLWiMnmlbM28SgdUtB4N0Zeko2CHf68o1PMqYLtccevX5cfQ
         x+FrTyeHbd6VA1Lcs5zo8jzsspeLe5EjtBMGkjb+L7T2w6BCwsKSVkbxCSzdNTSOvroC
         tBvrBwPmYpfuR08JCvjDki1c6Ch/5vs3uhB6ay6awTm+ifM8twG1RhIK8GDWlKjWx2Gw
         4HL+QoJQVrMQL/SSUWlu90J9SE5P/V98RElPzQcHWH+z7mgL+9/4CZVGCCe5AWr8WLTp
         T7kQ==
X-Forwarded-Encrypted: i=1; AHgh+RoS6Y5EwcPn+0+w2Ylx6VOUcymlKP0SagcFSPO+mNsYULCVQuRgCJa3ELHxt94s6tAx3YlZr4/gPfhdtqjHPrww@lists.infradead.org
X-Gm-Message-State: AOJu0Yymi4WfXJJh63Xd8Rxk59u24BAA5YjTxaQ7l1YS06mjzwptiEcE
	rHt3DXqgFqiyVF3ueliX+o0ZmQ+eZq+4Krq4G4gkxVolWOXILGP5PGLmFYnVNKGYfQw=
X-Gm-Gg: AR+sD12EpckP0KO+R3oLByopHsS0uhpGvKRBN4FvMqc83VHgi/nQJbg+P5HvJnVJTgV
	DwzGM8vgYzE4wvF3r0P8WzYT4cshiJegkF3maio3hsu6y09xe3oqpEEMXF7Sg5pGhxSTRbyR09l
	dZQMGSRTjN0t/HdYWs801rUFsOWObyltja70fov5PH8Xg/r9FAQayz21CYbvqvsKPdM8t9+pozD
	msWB+1eCI380Az1AafAU2YLj/+0qOjMAHNpnmftWdMpukp3REf4WeKfndTHbcO8aXvy64fEoGYH
	m2SIM5Jvz3f65xHiAMGXgLB+Z4M9evmdJJBWAO5SCj7c7hx4hsMEgor2tO517mY2rWHlJN+tlh3
	mNFVTIYBw8epBG+0ri8AOlFf3xTbvQAofkgMjacjWFEisdEP0PIXjlI7lnX435B5h1HgqD5lefr
	UKApXNFlQCpve7gyIdArvx5YXIvQ15gVU=
X-Received: by 2002:a05:6000:230e:b0:47f:9720:4740 with SMTP id ffacd0b85a97d-47fb1e9f82amr4362694f8f.37.1785262226606;
        Tue, 28 Jul 2026 11:10:26 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6abd0a6sm800035f8f.10.2026.07.28.11.10.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 11:10:25 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v8 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260728-proficient-boobook-of-will-2cc94a@quoll>
Date: Tue, 28 Jul 2026 21:10:03 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Message-Id: <3A3A0D17-7A80-40FE-AB89-DDE8E9A7F72B@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>
 <20260728-proficient-boobook-of-will-2cc94a@quoll>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_111028_749604_FC2D8F18 
X-CRM114-Status: GOOD (  16.12  )
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


--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Krzysztof,

Thanks for the prompt review!

> Am 28.07.2026 um 09:27 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
>>=20
>> +  resets:
>> +    items:
>> +      - description: USB phy reset
>> +      - description: HSIC phy reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: usb
>> +      - const: hsic
>=20
> You do not need these two. It's one device and DT does not represent
> internal device wirings because they are redundant (deducible from the
> compatible).

Just to make sure I understand the implications: Remove the PHY resets =
from the reset header (and driver) and have the PHY driver control them =
directly via regmap instead of going through its reset sibling? That way =
no self-consumption is necessary. At least that's the idea Sashiko put =
into my head with "Could the driver interact with its own registers =
directly?".

The PHY driver would take exclusive ownership of the resets anyhow, so I =
don't see anything in the way of just making it own the respective bits =
in the 0x80 register through the shared regmap.

>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - resets
>> +  - reset-names
>> +  - syscon-reboot
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +  - "#reset-cells"
>> +
>> +unevaluatedProperties: false
>=20
> This was different last time and previous code was correct.

Ok, I'll keep #phy-cells and ints optional and also make it possible to =
provide only USB or HSIC ints.


--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpo8HsACgkQPRO8yFRP
GiLPTA//VT+BJ+4K6QWEatqxIi67Rfy+A3mhALsMoPStAPoN8KELPVr+JoqLoFD8
lz9s0uj1PXWN1CmBArx6Hzm1N35owUoP46VLnwqrIAR0gaor+PQPHJ9In5L6E6Lm
SdUs0QfxWMV75E2IM1tTRf8MKa6SnCvEp72OAYdMgRzEd7f0vp9fV9716yb0Ej7q
ZXG85U4f/1++S5XHoPxqFxrxunsJoX4GgVEmKyeB9N3spWjS7KykKo2UYFZEctFg
RUiai7lO1I2X9DuFGkuVZcouCIcpB1eJHx7r3UOTwIG6kbTKHBjWoq32L2tjUY4B
nSkU7vMfwUA387n/zdeisN6smcf0C8uH3g8PSozuzaojYQzAr5MjbmgDue2R1LQi
wVfHBdREUJL1WHt25UgiE5EcBcrQhwxccqDuWbkXH9toxP0HUEpTn9gdB8yNdGQx
HSLsQCaqOew5/9nPEnwn0X7q7FnnBSOYv6AQ5g96xPeuNDNQ2n8f80X8iBmy3qup
tWM+cCViEhEkoLl0x+/XTO6vfljHztZCpv2Xey9PGs7HDtyJbBMTkcHdcCTFV9yo
RKzQMdJgqmIfycOlUGL+eHCI1X9SGEZc7hcENPBn666TnnWf3XrsCKZNHFBCU85e
HUylGFuzN2pdc1MzYxgwFIJhKLtsVV8pLrnR3WfCD/2F6XYb36g=
=Oh+I
-----END PGP SIGNATURE-----

--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61--

