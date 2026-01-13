Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83A9D2D0EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgYzQ023QCEOFph6EUgTHi0vVdD25uncinH1QX1E4EQ=; b=E950XqbubBs32oCo54QMt8ApCv
	tXjZNPN4zg5gXpcv4ER9g2Bl0/WEQZQAX14jbL1+JWVEf08WguPK/LNs0xmTi0bOFkTxHaAWEcfjU
	F36UWNk+TmDt+ySdg/YEyxRCl7OEeuE8GMvYARyUnYQK1qfx0pBLUb4dY4btZkzC68+7NVv4NokXM
	jNe0ECxFPrE9qxPkamWdhGAcwVtqOonrWbioCrP39jszI3FhZZ7zv3QBuyX9Bf/98xXjGREeZ9U3J
	E0nTJB2065N4flOc+5zkTn9vOpP/niFabm1/bjfQyuNnLJ23tqhUVFcyXOmVgDHJ1I8aLjJAsJTEA
	+lQrItUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdr4-000000077Q3-3uq0;
	Tue, 13 Jan 2026 12:50:38 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdr0-000000077PV-3JtT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 12:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bgYz
	Q023QCEOFph6EUgTHi0vVdD25uncinH1QX1E4EQ=; b=Jh0Q9Kkg9hoNCkqQXdhX
	gcQkYx9o2x2ZvYqfkeWiPR4Rkaj1Zf3CajlD71h1nMVg0c+0U4UjtOWGqg/ZOPEX
	/BTlcNWWF8rtomnudWesc7ZlFTxZBmXB1g7oavfNE1OPq3JejuM46kUz5UApMOir
	5c+p8x6pM5dgbBnNjRjB7s/sydNLK/TL7Nyy5H6F0nb0XzI1esKAT0mKlBi2iktG
	S4UawpvkqZ+Y7tSpLv/uy4aYQn0w82z6Ohw59LIuyUN6AkduqdwWrZLZsnl6+nEN
	UEvaydNjnROjP+RQ9g8y3Vmupz74Mu64hEkIPhSzTbpzi0usr51RLyLOfM5wo/TI
	6w==
Received: (qmail 1683370 invoked from network); 13 Jan 2026 13:50:26 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 13:50:26 +0100
X-UD-Smtp-Session: l3s3148p1@aJd4b0RI2soujnvx
Date: Tue, 13 Jan 2026 13:50:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au,
	davem@davemloft.net, vkoul@kernel.org, andi.shyti@kernel.org,
	lee@kernel.org, andrew+netdev@lunn.ch, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, olivia@selenic.com,
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	lars.povlsen@microchip.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 06/15] dt-bindings: i2c: atmel,at91sam: add
 microchip,lan9691-i2c
Message-ID: <aWY_kMIX_G2iSltN@ninjato>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-7-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223201921.1332786-7-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_045035_725110_454A7FF3 
X-CRM114-Status: UNSURE (   6.19  )
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

On Tue, Dec 23, 2025 at 09:16:17PM +0100, Robert Marko wrote:
> Document Microchip LAN969x I2C compatible.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-next, thanks!


