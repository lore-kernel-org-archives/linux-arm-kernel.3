Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8148EC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkjBpj7wvMxsVfxHzks1lri0zffcvGGh+bHSb8/6KeA=; b=3vp2GH9rwowJwijl4KgTKOBvM2
	thDjkIgjcIYEEv4/AV9quiJ1EAZVu90mW3Yhh30SBQgyh7zGDcOtXd743bA1p/ljfhqI2tY7ui8zh
	yNZ7AyhSSwtLFR64K7ZRTywrd14Y4ER1erngzEOlb2X7n/fQ1SY9EbLxLP/0a39SCgRn1IsmuvxFq
	r6rc8ohwqhtaD4L2sUVTHcSanUjVKlwQ7ziyoRCTDor7Ufu+O1T2png0S025FB0vOB0JqlkhWW5BA
	Hn8DOUxPxm/3gu03Reud1NYhTLwkDsvq6r9caOT0VUBx1TAax2g3WPWgNTRSRKWqHqX1hlE5+VrNY
	Qg+m/NdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UMS-00000009U1s-38ZK;
	Wed, 23 Apr 2025 07:17:36 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UHN-00000009SnE-0qzQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:12:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CDFF43A36;
	Wed, 23 Apr 2025 07:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745392339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkjBpj7wvMxsVfxHzks1lri0zffcvGGh+bHSb8/6KeA=;
	b=MpXO5NI0S0uqAIOfOq71TlNJIo/ygPFDHO68GFpxyoc+MkBSWP1roW4BBVRB5QMozRNtUA
	tNC14wqLbfYp9xTUPJuOjj+D66+tRFwKDk1K1rBDmrWThhWIYIU+ZMauyR2tMOIgbDGlkr
	kJaq+33VxEAiW+KUdP8ofRE/TGBs3oO7rWkdVbGyo+/q8ECIZMVjdgHz/+sJiAitHXY87u
	+ZQnwDRwDTb53AiplHwtX4Sva+gEWY4ZGZ+Tj1FDmJTfheYZcu1SURL5rASsw0e1SaHM3W
	82mjxbVNmpNKEFQGzBhFlVmqioeSuevcwPp5u5YL4BsF5xQVudZeBSk9kke/Pw==
From: Alexis Lothore <alexis.lothore@bootlin.com>
Date: Wed, 23 Apr 2025 09:12:09 +0200
Subject: [PATCH net v2 1/2] net: stmmac: fix dwmac1000 ptp timestamp status
 offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250423-stmmac_ts-v2-1-e2cf2bbd61b1@bootlin.com>
References: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
In-Reply-To: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Daniel Machon <daniel.machon@microchip.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Russell King (Oracle)" <linux@armlinux.org.uk>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhgvuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefudfhgeegtdekvdeujedugefhhffhfedtgfetffevveekfeelveejfffhjeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdhmrggthhhonhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhug
 iesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001221_827598_E8335209 
X-CRM114-Status: GOOD (  13.07  )
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

When a PTP interrupt occurs, the driver accesses the wrong offset to
learn about the number of available snapshots in the FIFO for dwmac1000:
it should be accessing bits 29..25, while it is currently reading bits
19..16 (those are bits about the auxiliary triggers which have generated
the timestamps). As a consequence, it does not compute correctly the
number of available snapshots, and so possibly do not generate the
corresponding clock events if the bogus value ends up being 0.

Fix clock events generation by reading the correct bits in the timestamp
register for dwmac1000.

Fixes: 477c3e1f6363 ("net: stmmac: Introduce dwmac1000 timestamping operations")
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
index 967a16212faf008bc7b5e43031e2d85800c5c467..0c011a47d5a3e98280a98d25b8ef3614684ae78c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000.h
@@ -320,8 +320,8 @@ enum rtc_control {
 
 /* PTP and timestamping registers */
 
-#define GMAC3_X_ATSNS       GENMASK(19, 16)
-#define GMAC3_X_ATSNS_SHIFT 16
+#define GMAC3_X_ATSNS       GENMASK(29, 25)
+#define GMAC3_X_ATSNS_SHIFT 25
 
 #define GMAC_PTP_TCR_ATSFC	BIT(24)
 #define GMAC_PTP_TCR_ATSEN0	BIT(25)

-- 
2.49.0


