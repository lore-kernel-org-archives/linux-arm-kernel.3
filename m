Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98550C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRcZcJeqXe3bZ8BydUxdPRAg1PRktnOnWrwURyrXOHk=; b=PXvz6OLG8dQQ6jDNbP78OjF0fR
	Bwp94JtGmmrRfwu+573h1stwPJsqb7VNA/xkuqhTuU0x45yHx3z5lgT66s4Ax33lk97NnyL+IvRQ5
	fPpowXVN8AWyC73dgHYPESpnUjLwlgXde8khrb5GFnN88JXFGOZ2r6LpfnRcsiWNEnEfgh5e0k5OS
	2drLRWh3zPzMq8GXX5Cj+Ke9zwlq4V+MJMWrilWh1Wg117YVpzFEghL4BVZWGYThgE8HOVJN4hcDS
	yM9PpipXp7sGSm6mjaAaXd+CJsszLWGOMh+v8pOkxtrwNIk4wtqwjUV1ua/RvC4/FOAEk+SOc3PVn
	XUBYjZXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8c-000000085el-3sMf;
	Tue, 22 Apr 2025 18:14:31 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FEA-00000007dQ7-31YP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:08:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7E7543A3E;
	Tue, 22 Apr 2025 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745334478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TRcZcJeqXe3bZ8BydUxdPRAg1PRktnOnWrwURyrXOHk=;
	b=IzuQtJHkjpr/eiSJK2AczFT9xNq4AUt+9Db9jV6u/eXqZe/xJVmDCmiAQpDRjnLIbFuBzh
	9VpX5AD5Dq51LK+mevlQazB1jH+55sv2mwwKpX12wHYWJKAP3Pq4RZkG4OM5vLpXJx7XcE
	kquo80h+KxGnpsdyZtVq225Q53uLhqEfJpxrh6UydkMGFjcM1gRqEOSbdEvxjhPLu0+/ST
	BlyHFXozSnRzQhDEjYh9ZO2f9uLL1QOuR5z0NTe4BAODmgoEibM3+9osK2/kUrY6+Yf9pR
	TddWRW8hP0GItWlSq1D2jOvB90wPMYdZknqVapV+Ovps+MvsO9+1EAl6bUEFgg==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Tue, 22 Apr 2025 17:07:23 +0200
Subject: [PATCH net 2/2] net: stmmac: fix multiplication overflow when
 reading timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250422-stmmac_ts-v1-2-b59c9f406041@bootlin.com>
References: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
In-Reply-To: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeghfetffeuhfehkeekleffffdvuefggfevjefftddvffduheettdeiveetteenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_080802_941069_0518F16D 
X-CRM114-Status: GOOD (  13.03  )
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

The current way of reading a timestamp snapshot in stmmac can lead to
integer overflow, as the computation is done on 32 bits. The issue has
been observed on a dwmac-socfpga platform returning chaotic timestamp
values due to this overflow. The corresponding multiplication is done
with a MUL instruction, which returns 32 bit values. Explicitly casting
the value to 64 bits replaced the MUL with a UMLAL, which computes and
returns the result on 64 bits, and so returns correctly the timestamps.

Prevent this overflow by explicitly casting the intermediate value to
u64 to make sure that the whole computation is made on u64. While at it,
apply the same cast on the other dwmac variant (GMAC4) method for
snapshot retrieval.

Fixes: 19b93bbb20eb ("net: stmmac: Introduce dwmac1000 timestamping operations")
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c  | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index a8b901cdf5cbb395a0f6b4800ad6f06c6e870077..43b2b3377136f2d9c717f85cba6a452e7a178ad7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -553,7 +553,7 @@ void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time)
 	u64 ns;
 
 	ns = readl(ptpaddr + GMAC_PTP_ATNR);
-	ns += readl(ptpaddr + GMAC_PTP_ATSR) * NSEC_PER_SEC;
+	ns += (u64)(readl(ptpaddr + GMAC_PTP_ATSR)) * NSEC_PER_SEC;
 
 	*ptp_time = ns;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 0f59aa98260404bece530f505500f13d35884d0c..1950156f6af6f6f13ebdc1c04f01a862b664bc9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -222,7 +222,7 @@ static void get_ptptime(void __iomem *ptpaddr, u64 *ptp_time)
 	u64 ns;
 
 	ns = readl(ptpaddr + PTP_ATNR);
-	ns += readl(ptpaddr + PTP_ATSR) * NSEC_PER_SEC;
+	ns += (u64)(readl(ptpaddr + PTP_ATSR)) * NSEC_PER_SEC;
 
 	*ptp_time = ns;
 }

-- 
2.49.0


