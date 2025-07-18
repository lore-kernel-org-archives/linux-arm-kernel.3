Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C835C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=plswG0+3b0WbY7/ToaU+Wx+sBvpXh4mX2mydxsnXkgI=; b=XNCcmyeOf0IMKO4c7dedqnHNcA
	PJuy3Vmouo2eqrSiPZezfWKclIJoSx9Q60E6L1gLdOdKxni3k3AmDQOCD7BvKs+hI4+xJpmV0li4X
	IMYBD6Flz/QtDh2bit9+VByynMJBM4rPZlEdWLRellTjahTMhwgzBsdudV4C07QLI74vsUCazfWZ1
	uBalt/d4qqm57vbhzVtUgemGcejkCwHhllryC2ywfyhgoMzfg+sOgmw8WaKlVmTwojzfluZfMTLc+
	GZEkjMY7WcGG7e/6iZIGff3FoPaGbg3OpSU0cZwsg0pS3FlCnJgMXSnc+4rhENtDctFoTMwxP9fec
	St7dHzKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucosS-0000000DE1n-26ht;
	Fri, 18 Jul 2025 17:28:08 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucolB-0000000DCnw-0goV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:20:38 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bkGGQ3NFGz9sgJ;
	Fri, 18 Jul 2025 18:58:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CSuC_jtzI8aT; Fri, 18 Jul 2025 18:58:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bkGGQ2THLz9sWb;
	Fri, 18 Jul 2025 18:58:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B1DF8B783;
	Fri, 18 Jul 2025 18:58:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zcviEiDUcLOa; Fri, 18 Jul 2025 18:58:54 +0200 (CEST)
Received: from [192.168.202.221] (unknown [192.168.202.221])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A03A78B77B;
	Fri, 18 Jul 2025 18:58:51 +0200 (CEST)
Message-ID: <2d25448c-2409-4bfb-b900-6f96851df14e@csgroup.eu>
Date: Fri, 18 Jul 2025 18:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 00/15] net: phy: Introduce PHY ports
 representation
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_102037_357254_A76772C2 
X-CRM114-Status: UNSURE (   5.35  )
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



Le 17/07/2025 à 09:30, Maxime Chevallier a écrit :
> Hi everyone,
> 
> Here's a V9 for the phy port work, that includes some fixes from Rob's
> reviews, by addressing a typo and the mediums item list.

For the series:

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Christophe

