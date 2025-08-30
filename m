Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4F6CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 19:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g9Ms4hIwxfuw6SwTL5RIgMEksEmD8lz0uMx7wT1GeCU=; b=TaKWQIRUinv/8PkANjouGjLcCM
	7cH8qxBvQHOr6l134K2jX3GqNhmbIZTJaEVB5/R3ldUJPBAA9o+KpX243UEaH9d51flAg0+M4UHbH
	6Uzpv4h0PIu6caHl23IOPNwJxfR9AjUiy8+S3+teY2cCwE7XcLsKz0Ua1whNoEJfbo25xeoNOgthW
	3yeldf6wOpj8dnNl0rUs2qW9Iv4PoSE3/FSX4j2a2yHuPLHqlEGicY99DQm7A6RWXnzuNt2SgWxM7
	aFqUf2k1mKxE9e6F5f4soua0TbS91QU3rOj6y3CTYBH9QvcovtrliEZQV2xDBPLRc76uoa7aE13/B
	mh883dZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRKy-00000008Mjw-2cSy;
	Sat, 30 Aug 2025 19:34:08 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usRFq-00000008MJx-1ooH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 19:28:51 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-afcb7a7bad8so431893766b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 12:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756582129; x=1757186929; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9Ms4hIwxfuw6SwTL5RIgMEksEmD8lz0uMx7wT1GeCU=;
        b=Lf9p2O8ah27euTKOR/AxNRNE1f9YuzKIg1sCa/BJXte5iYjnsaZV7ePQDZXHHlQit0
         5ACvVOyZqmhwvQf17OY439fxBE49oc5DVwRgXOYpCiYx3hPNfGwOZHoZjkCwdnUWIBW4
         2Mll0WqZkDIrG5gAg2t9yjWcbtwI9GkX1ZN3KxiNipOzhEcPiDvGdvgJu4qJ3+1doCxt
         kMurk5uSOd+1ilCTW0JG/DSlaF96AEev/2jS8jJdattGMNyoMoignMqY2KlwRkxbOzkj
         zSowXG/W+y+SLRznH0AdKCuMtpZk0/AjI1A/eTRG/UvYxkcagoDJy7xz8Y0FDo3pXQ5y
         3ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756582129; x=1757186929;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9Ms4hIwxfuw6SwTL5RIgMEksEmD8lz0uMx7wT1GeCU=;
        b=AKL0MCM4uuE89EZ9eoajdBG1CU4lI37BBjdtb7nKtdper3U80hUHENoKtmL+4XZbgy
         z7NPq+TbtA+KbAK8JY5yfGzxoUewg5wHIP0ysSBa2YloMUiq98PMdWJXakTbCAEJO1ju
         +I1Y5O6Zx8ictUtq10rRGUSkT4H/j3T2pHFVR7YuJPgQmVBBWWt9rX7HIKW0//aMx4xx
         KDa5VFa4/hALGzvkgNf47sh9taFPASG0bPBu2MeDDbj1AVmMPNZhx4EeikWU31x2zHLT
         rawW4g3Reik7Gd0Cv+lVFhWX9clqbaLXy0MCj9O1ObNdOfCmlfcRTQwOf5aozOFXhBDr
         N5cA==
X-Gm-Message-State: AOJu0YwNY7ApEzToD1Yc9/4rVlhNTcoppxdNbD2bnC31QGjIcKNO5bjT
	YR8pHqGnQnX7Fw0Tjbwz2JWz4tRTvnVb1dUAruwSgRitrwC+nym1uxaQ
X-Gm-Gg: ASbGncv+aQ+oi1+wySpwGhQ5m/7dknXRwt0F7i4zQ2ahgL7QUpTkLxk/kWzUNkCXv9U
	qspUUxwe5YgMR91c58NqyNiBHrAdpbhcCJduNcccEU90wC+BlKooeUOrTQs7ST84b9IcSce1Cf1
	Dofa1if9K4qDTsuiN9uh3Byz1K+gAvpSKaHbuOTBEo8U3BI260XwiDGAfyHaToKy3Yktx8tXmYX
	bgYm/EOxuCO0/PcOpRCzuSSJEdWiCjKGc8Ux7I39sAb0+RZkkzIu8ToYO3T+mNefEvI8FWFd9Ha
	3aqbtAbjrWCSgS4pGnQvl+XlaaKp6+eRmz/Z+MAP+4T9g5csd31Tr4hHUcuK9acHe3uzu2eOHmc
	tTy/qwjxWzAorpgCDYYOnEz7kTIKD022taXWindk6ZLSOOQnb0qGByKAYJBjCnwCf4s+SfJbwYA
	/1g7FzWFveGDj8qN5Ita3dVgWU5SBy+FSPiiHvTKVc49qrA7/YmtHvMYYL08n/2ts061w=
X-Google-Smtp-Source: AGHT+IEJ/Gu/lFJ1aMzBBgxaQ2ogVr5hZIfka5fOlEdx/5pq6/tFR1Jp2zQyF/pR0Gl4mhVXUM6YEA==
X-Received: by 2002:a17:907:9453:b0:afe:7d3b:846b with SMTP id a640c23a62f3a-b01d8a32453mr167748966b.7.1756582128633;
        Sat, 30 Aug 2025 12:28:48 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:9b00:d113:449:b8c4:341? (p200300ea8f2f9b00d1130449b8c40341.dip0.t-ipconnect.de. [2003:ea:8f2f:9b00:d113:449:b8c4:341])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-afefca08b41sm465104766b.25.2025.08.30.12.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Aug 2025 12:28:48 -0700 (PDT)
Message-ID: <cd55d7fb-6600-49e5-a772-18b39811b0d2@gmail.com>
Date: Sat, 30 Aug 2025 21:28:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next 0/5] net: phy: remove support for deprecated
 array-style fixed-link binding
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_122850_483001_212D945E 
X-CRM114-Status: UNSURE (   9.35  )
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

The array-style fixed-link binding has been marked deprecated for more
than 10 yrs. See e.g. 91c1d980d601 ("Documentation: devicetree: add old
and deprecated 'fixed-link'") from 2014.

So migrate the remaining few in-kernel users of the old binding,
and remove for it.

v2:
- fix "Properties must precede subnodes" error in patches 1 and 2

Heiner Kallweit (5):
  arm64: dts: ls1043a-qds: switch to new fixed-link binding
  ARM: dts: ls1021a: switch to new fixed-link binding
  ARM: dts: st: switch to new fixed-link binding
  net: mdio: remove support for old fixed-link binding
  net: phy: phylink: remove support for deprecated fixed-link binding

 arch/arm/boot/dts/nxp/ls/ls1021a-iot.dts      |  5 +++-
 arch/arm/boot/dts/st/stih418-b2199.dts        |  5 +++-
 arch/arm/boot/dts/st/stihxxx-b2120.dtsi       |  5 +++-
 .../boot/dts/freescale/fsl-ls1043a-qds.dts    |  5 +++-
 drivers/net/mdio/of_mdio.c                    | 26 -------------------
 drivers/net/phy/phylink.c                     | 25 +-----------------
 6 files changed, 17 insertions(+), 54 deletions(-)

-- 
2.51.0


