Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B4CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLySCWSlH0Sb9P602cy0L3AE+j4XwAS06FELO6RcWVA=; b=RRUcF3IDMusJNXuFWeBYfsx1EC
	NpUGlak2vZPkg5WtC67iLIVUJonGgLUVpUkTGrS4pqYlEtjNzppbXuasJDnzCkvrXTsQZxt+QLOJo
	nggoic3aoSUBlTdxVNjNbTkCtf+UdAaTjQG9siKH84ScQznxFulzDVDYfKJIzgrL0Km+hl8kGUqaY
	kK5AVmrHQ9Lf2pt/xXohi1zh6GPbAMtkzlBwwbP7MWvFsJG6DGbUpek8/E185jYyoMMbWnPogIiTE
	TwmTgQvrcchOnCKKFK0l8Q5k18vkqePkzSEjkmqMVVS1rbEYcvw7jAOdb4/nxDBIF/Qo6gdFKvrSs
	1bGx8Wfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UOP-00000009UPm-2Q04;
	Wed, 23 Apr 2025 07:19:37 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UHN-00000009SnH-3j1a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:12:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B21743A53;
	Wed, 23 Apr 2025 07:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745392339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLySCWSlH0Sb9P602cy0L3AE+j4XwAS06FELO6RcWVA=;
	b=bGfCmCgBvq/udV2NrOkw1l1IoijqGAVUUvhC/kg58tPe+68ZZg+XtvprSk+iataEHjYyHm
	0pUkiZctX9u/H3QvrA6zIoi2adTyRoffwWJKjWz28eeBgFRfr7K8Qyf5fjsNwHbW5JuScJ
	d/WcNIS12Y2Zbu/iN9vfM0KdEvgZ6iG+YrPuGZKYRJJF7rVua2iEhUzHAbM3cIdhHr8rFN
	vVQmVwIv0Ti6GkGUfRpL3KgygwWusBeeNt42HxCSyS0Atu3ToeQ1qdDBi1UoTg8EVBUlfv
	PccLM0CIq1MklC53ycV9zGXWiI5LTKuQKxygUoHNzIhv9XNrVv0nmuErV2O5Kw==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 23 Apr 2025 09:12:10 +0200
Subject: [PATCH net v2 2/2] net: stmmac: fix multiplication overflow when
 reading timestamp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250423-stmmac_ts-v2-2-e2cf2bbd61b1@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhoruceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeghfetffeuhfehkeekleffffdvuefggfevjefftddvffduheettdeiveetteenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehmtghoqhhuvghlihhnrdhsthhmfedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrnhhivghlrdhmrggthhhonhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhug
 iesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001222_099507_32F0C778 
X-CRM114-Status: GOOD (  12.90  )
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

Fixes: 477c3e1f6363 ("net: stmmac: Introduce dwmac1000 timestamping operations")
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c  | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index a8b901cdf5cbb395a0f6b4800ad6f06c6e870077..56b76aaa58f04a6f01eb56c7ad6aa135a7f76c96 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -553,7 +553,7 @@ void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time)
 	u64 ns;
 
 	ns = readl(ptpaddr + GMAC_PTP_ATNR);
-	ns += readl(ptpaddr + GMAC_PTP_ATSR) * NSEC_PER_SEC;
+	ns += (u64)readl(ptpaddr + GMAC_PTP_ATSR) * NSEC_PER_SEC;
 
 	*ptp_time = ns;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
index 0f59aa98260404bece530f505500f13d35884d0c..e2840fa241f29121c4f074872c4986906201cb57 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
@@ -222,7 +222,7 @@ static void get_ptptime(void __iomem *ptpaddr, u64 *ptp_time)
 	u64 ns;
 
 	ns = readl(ptpaddr + PTP_ATNR);
-	ns += readl(ptpaddr + PTP_ATSR) * NSEC_PER_SEC;
+	ns += (u64)readl(ptpaddr + PTP_ATSR) * NSEC_PER_SEC;
 
 	*ptp_time = ns;
 }

-- 
2.49.0


