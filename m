Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDEEC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=; b=kqFlZwSnKx4F91whXrozLGMsuO
	ivaygelLyHEYn/LoaUNESjYqSi8hW5ImKRxo3kMhr7ThSMuAFxALBr7iq1nPIM2e1GgfQKO6RyeUl
	nHz+miWRh3MKcQH3jvr1DI7rzXXcEM4gMGgXLGJGyKgY3yvJXO6C7bDhdaZdMICA2cLzDkwSTts84
	4ZxTBuL13/klXSf5PgONorQ1CtsxMPG/TCt7wGYwnq+LIsjuAB4ahyVujRyFZhlgdJo8fjGxP8Kcf
	pcv4wPXecMV2MjzQg+uisJSIQE1a7il7Y8YGRuQtmaFooaiP9j0YG9+jtWQJo7YmxJrjZqdzW7N0X
	qFnveQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xWI-000000051fn-2dFw;
	Tue, 22 Sep 2026 10:14:38 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xWG-000000051et-0Xg5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:14:37 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfcbe208so47091816d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 03:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790072074; cv=none;
        d=google.com; s=arc-20260327;
        b=R7j1jscABZXrjxBjerAwEDJ1FoEejOdDAx5EQ4qe7Npx5og93B0wa91FHPbFFhR1X/
         0H0+W2DTyXLyd1znFAYLIwUfynfN5mRv+18uHQWRQeslKnuKJyNFZvaJ9OF9zwSSKZ5N
         /FNChi+eW184Wg89iBZDUNjySJ7GH2sKxnQjmq84D8O+kj7ClxGoe6kzbqwgAuzYJj3R
         u/zatCILgiNlfb6DpDnFNuX1oeUAgdsvfrV1ZqPdwMuhDsqehlbMzcCrfNejl3BDfHrn
         t8HJLU7rctK1J0+waX67V36Qd9mmbYchqU5V+tPbQBDYd3OrS22s87n0WsUkV7X6/tJx
         JEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        fh=NNSRAgkN8oRz/nFMNYcD5y3zPBg5mxfCvwBcNxxnsHc=;
        b=JwAMtPdWzMSbb/qYYFQ2iPYITudI4YBKKM6/CpEZGmOwAwLd0ycR2DOojTt9wzhlly
         98juTN8o0yEBlUWFtMRIjCoB0jhSOCayJDoWU56cMLAn/txZ2gwsOFBl/cOy6WmSEqOE
         pQen9HpQX18jEF9jl1c6+4rEq4fpY0NcJzmMqapZykdN18XXq3UpO5rwScHizsty8RUA
         st6ry21ZVnfyN3ZgjRkAr8LzOSuSwOWOhLldEt+ebNPklonJyZt4c5ypj8t41NdrsEXf
         bPTSyGso2Vb0U2hBjhoqILTJzrMCrykW5c1V4o+mJO8AwUJ8/Nd1raaoBFEOKqU65Yyd
         pYpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790072074; x=1790676874; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=AG4pAUIM8kdzWFW6t1eJ7r7a4XR5NpaHb0IaOIWXBFSZFSzCBB9omiMO4NlI9EKaHR
         PXDlZ3jF2ROekisE8Qz8T8r/4O0mm6ADezf+uq0foURS38rH4p3oDveY1SQwZG/ZU+1y
         LLdY/BNwCLQZUZoOSY9caBkb48tgeDbDsqyKtK+PcRScENxRkU6ScpcEqUusD8ZTDHyU
         hTwkbayV2iwrHjS1Ijysf9glAa8x3YQg9QJFyh/+LZY/2eBK891JsvHNopJ4FqW54Zfd
         v/VtzlVXfmWVM0k7rCW8jOTfxxoMeSccoKqs4H7kR/uipzRhPQ66q44arJq6hN+FN5pp
         MDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072074; x=1790676874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ESDSZM667q7EB0r3pmeL1vJBKH8ckNK36jbuGzw9rQ=;
        b=XrMx7DToiGXFh8E2r5iZARwHVho1GmVUb+CJ7yXf/ZD7Roxlap5vrsSDmEBhKe4IPH
         PTUcigrx3LBVwd9WcmW8oNci/R5mNwamHlPGXk8BEgObOk2PIYy/9jLeW6o3QVsAElvX
         9NeOCygePlS+0PFpVLFD5U4tsymm18t/kijWSdjXE73KRVFyH9v0Fu8pYuxsmXfeG0h+
         taw0MOlIVWsqzGGP952Ry/6cUZlezdbGJFUa0CREE0tShM02JGF6KKne5NebHB3aYjiN
         Kr8o6fS6peO5kT/koLLNoxvRCExBoq/sIpLLsnpHnC8HFESWl6amZ0pVZx6HJLSUFZ8J
         9BHw==
X-Forwarded-Encrypted: i=1; AKwUvBwxH0qD/T582pF9/11iGZN9TxIPSMcEIIMBN3W+IQhIR5iD6vkyBsnigyfaNN/G5mB1dOgnHyVPPII66zbRF4ef@lists.infradead.org
X-Gm-Message-State: AFuF++nfhKmT3p9QAzJzD1UkRpcs9iFtDenBAoiHcJd5qyyMi2CcNZ7D
	5b0jfqbnasnC+tZgwkt/YDGri1twanWQh7YMCdaZgw6LoJMnnyAA6xTAfMx7AXVy9Ff1aBTu+4j
	NJlYfqZlSqUeZSSzWySjUxNXGnIeoIuc=
X-Gm-Gg: AYBFou1xHJd0FxTxXfInOaGk/p0/cA2SE6E1VR5xDZAicZad5mNVPtFmurqIlQvrVmM
	UeKwwXON4lBPJ2XCnssENwhZExFRL2VLKjkJoeJRc1OcKJtOUbM9l0VXvA6bL7MPYnJ+Ae7zGK1
	oqMLXiEZ8liT5276J/HOObPw5wedqpWeyrGTVGdZ9Y7oFd3tBdAGu2Fmq4WCHzt72Fe8uMmsaJe
	GbcilC1sfRiyVwZlyPNWiYrZlLKQsg3Q+omo0BV2lTaV8gQXuv8DqM43/Ayqd6Lj+ryyl9g1lWJ
	VX8BWz7pRtmc9F6UjpnEUml5BeH2mcDYyeh3v3sfECDsngSymrfImzM=
X-Received: by 2002:a05:6214:d63:b0:913:fa79:99c3 with SMTP id
 6a1803df08f44-913fc94b160mr46562816d6.43.1790072074583; Tue, 22 Sep 2026
 03:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260915123812.14747-1-ansuelsmth@gmail.com> <20260915123812.14747-5-ansuelsmth@gmail.com>
 <20260921134410.13a7173c@kernel.org>
In-Reply-To: <20260921134410.13a7173c@kernel.org>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 22 Sep 2026 12:14:22 +0200
X-Gm-Features: AcwNN1WQadm9kZulSu2D2w98S17OkpHd-MeZLtXiKqWwHyLw9Fh6tPwUuh65TfY
Message-ID: <CA+_ehUyFH_ZSsjhp-U9WBFoRZR-ZMWnNQ5pY5vAy1LxUU5hSsw@mail.gmail.com>
Subject: Re: [PATCH net-next v22 4/9] mfd: an8855: Add support for Airoha
 AN8855 Switch
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Simon Horman <horms@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_031436_176244_6CF1E351 
X-CRM114-Status: GOOD (  17.71  )
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

Il giorno lun 21 set 2026 alle ore 22:44 Jakub Kicinski
<kuba@kernel.org> ha scritto:
>
> On Tue, 15 Sep 2026 14:38:01 +0200 Christian Marangi wrote:
> > Add support for Airoha AN8855 Switch that provide support for a DSA
> > switch and a NVMEM provider.
> >
> > Also make use of the mdio-regmap driver and register a regmap for each
> > internal PHY of the switch.
> > This is needed to handle the double usage of the PHYs as both PHY and
> > Switch accessor.
>
> GCC spews warnings:
>
> drivers/mfd/airoha-an8855.c: In function =E2=80=98an8855_mdio_register=E2=
=80=99:
> drivers/mfd/airoha-an8855.c:438:48: warning: =E2=80=98-phy=E2=80=99 direc=
tive output may be truncated writing 4 bytes into a region of size between =
1 and 61 [-Wformat-truncation=3D]
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                                ^~~~
> In function =E2=80=98an8855_phy_bus_register=E2=80=99,
>     inlined from =E2=80=98an8855_mdio_register=E2=80=99 at ../drivers/mfd=
/airoha-an8855.c:469:9:
> drivers/mfd/airoha-an8855.c:438:45: note: using the range [-2147483648, 2=
147483647] for directive argument
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |                                             ^~~~~~~~~~
> drivers/mfd/airoha-an8855.c:438:9: note: =E2=80=98snprintf=E2=80=99 outpu=
t between 6 and 76 bytes into a destination of size 61
>   438 |         snprintf(mrc.name, MII_BUS_ID_SIZE, "%s-phy%d", priv->bus=
->id, addr);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
>

Hi,

 I also didn't receive the email for the AI review... Did it broke also her=
e?
If everything else is ok, should I send new revision or maybe we can pick t=
his
and I can send followup for this warning?

