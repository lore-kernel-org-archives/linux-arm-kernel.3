Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7723CD41D6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 16:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zA5C5PNW0/uFa37xkLqcgZ6/TZ5xC7fDMBu4P7YKTz4=; b=1MjH1db2iSrZJTNe1RMG4XolzL
	svMVNlMxfr9s11x56J3w+Pi8Kmukwcsap4oquNSfhkK9oC05so+4H7aoup19V61TR73wuBZ0ykqKi
	rLFc7MuZKgokyyTb3VnHKRSAyvjN7751MXJIWXVmUNsvjbjpz+76j1cwYqYB04prmmGAAkMF3zSWT
	77DClSMtLTsSDu32SDtBD5Lp0fGfJwcq18UvTQCc8lDfg8EE2WGRyAZvzYaOiMKQiA7ZBUOheMWTS
	O2pWGylDqpSXm1+xqc2E6CNjmbAJOiHZNkoJgyQaNHi5qS9sPT0z+nfM7neSpyXQZnUjqD65PDMma
	dW/SAxyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjye-0000000Gzet-3fW0;
	Thu, 11 Dec 2025 16:57:16 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTjyb-0000000GzdJ-0AX4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 16:57:14 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 3C1E61D00144;
	Thu, 11 Dec 2025 11:57:12 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 11 Dec 2025 11:57:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsdio.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1765472232; x=
	1765558632; bh=zA5C5PNW0/uFa37xkLqcgZ6/TZ5xC7fDMBu4P7YKTz4=; b=M
	uDQyfNnIET5ctTfOdB+1KHBoLIQ8twYUrO5YWKt10ivZf4NK3EOZBaUltq8OREA1
	0MF5r73UgvKVeUMebyxSgJ80WCjM5ea5vkN/5Wvq0WNank2m52Fqp6fHmvgcvP+h
	txvzfKe/Ssjp2qWjjTn6uYmFreb807s76LLY5yzA9jZtMU2f7Q4Qz0R9xo6gG0gn
	iSiPod1aBU0Ib0LWJ4amOg1/otCJ6bv2h0/loI2L/ogk8mBhnF1miIqCoN85lCl8
	C8cHOG5OUrv2lukIlGQnYjgo+OjU5b4FdjImRsj4Nm6O1ObAzUbFtLH/7Fk95nxH
	FkHf9J+uA5A9NFG/ZL3KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1765472232; x=1765558632; bh=z
	A5C5PNW0/uFa37xkLqcgZ6/TZ5xC7fDMBu4P7YKTz4=; b=xSGBU9MpKd625Lbpv
	g/mN9uz/MLwCEcPxaGN+C6iTYwVczOkPi6Gjc41plrHgLwI+n4qzRu6XuWCyaoAZ
	seomzQ/oQcnYl55zGWCYlCNEbBA2gx2/4cmyYR+L3d3P7IBcENjWKKr4QNK+gnyY
	sq9af8ktUqHt1YWCiQPU52R35Mw0sqaachSoLjVjBKyHGY4/C3r2bjNmoUlbXSKT
	r32slPNaStZWE/oeHN0+w1knwJG/tUPruhj+/53bGCwtoauAHWv4McydOuSis5jX
	OmRci5vuB5B2cmimwYH6OdcrnKIBeQAHP0ne3lX5pW+dThnSZHB1oIsK99zHUr3S
	3YElA==
X-ME-Sender: <xms:5_c6aS3x0ZQkT7JY2chdJSIer44VzItKz-KVnBsyt5JbQqjIZHk5LQ>
    <xme:5_c6aRxqOGXfR1qVXpT9Y1l1oLI77vQnN_Eqb1ei_a0oW19XGQOkYFYI8MMirfW1j
    c3icWUh2uHq_IyDV_QDwewbu0UmMpw3X5g7p3Dn1o6AYRqiyYGAzQ>
X-ME-Received: <xmr:5_c6aew4GFwuy2RWOiCNxvgEdjTVG9sbPXcgVkLSR6zjE5G4Sh3_roI7_jUmcgQ3p3Q1JzP_J3ExUr_5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftvggsvggttggr
    ucevrhgrnhcuoehrvggsvggttggrsegsshguihhordgtohhmqeenucggtffrrghtthgvrh
    hnpeegffeuueelvdeggfdvvdfgtedvudfhfeekudekieektddukeefteetieefvdelfeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehrvggsvg
    gttggrsegsshguihhordgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehsmhht
    phhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghupdhrtg
    hpthhtoheprghnughrvgifsegtohguvggtohhnshhtrhhutghtrdgtohhmrdgruhdprhgt
    phhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilh
    grsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5_c6ad83yrgjIuhuJx0cltciGczOXzEfsUbkEGxbkhCb1MkWegc6iA>
    <xmx:5_c6aY9xVwc0t5TFmRus2kcM0TIlRx4Q_Isfz4XFScarZEzXcEvglw>
    <xmx:5_c6aV4blpI9lykzwhxXaIPQtEJF3S71mvdfDT4tf1QMoYVAlge42A>
    <xmx:5_c6aRajkiRHtLrTc3xS1UB6Ma-fgswgRL_DLWE5PnUzRi_6gI2Xqw>
    <xmx:6Pc6aZr5HSuTCFt9qcmpWp6ZTrC2H-ZhmFaBzcXiwiC3oHAxTT01NMkJ>
Feedback-ID: i5b994698:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 11:57:10 -0500 (EST)
From: Rebecca Cran <rebecca@bsdio.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Rebecca Cran <rebecca@bsdio.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/2] dt-bindings: arm: aspeed: add ASRock Rack ALTRAD8 board
Date: Thu, 11 Dec 2025 09:56:56 -0700
Message-ID: <20251211165700.29206-2-rebecca@bsdio.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211165700.29206-1-rebecca@bsdio.com>
References: <20251211165700.29206-1-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_085713_112192_2F753374 
X-CRM114-Status: UNSURE (   6.69  )
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

Document ASRock Rack ALTRAD8 (ALTRAD8UD-1L2T and ALTRAD8UD2-1L2Q)
compatibles.

Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..aefad2d02993 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -34,6 +34,7 @@ properties:
               - amd,ethanolx-bmc
               - ampere,mtjade-bmc
               - aspeed,ast2500-evb
+              - asrock,altrad8-bmc
               - asrock,e3c246d4i-bmc
               - asrock,e3c256d4i-bmc
               - asrock,romed8hm3-bmc
-- 
2.47.3


