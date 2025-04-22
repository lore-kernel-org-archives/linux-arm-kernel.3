Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535B1C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sv05jOSJ6xc00eTPXgNHRvsKAXEfKlZvJUZ4OUiKUQs=; b=070ng7/zF4X1t6BhqVDLDkaqUZ
	CKJLKzvH+32pRpbC/hD0EQ47994y6T5QtarU7E71E3nvbWfmV8CGHqfepAIr9uVr7unJwEtgFEw1j
	guWwSAn5UbOGJNKDnaYinqV+pu2MwLvCdsOpMF/8WALY91wwcS/ucnaPPMqAuIe3qaxyy16LozYqQ
	fMCSPvWCX4KsaTNGf1JBPOHVKNykRsfYzQzBm25MXmyp03WMz7YoSNs9syThmL7qNGJT7bNsG4ub2
	is+5yzgtptXKbF1kVBvDTIR4tnMxotQ2u+GzNSdWXhyxC59U2ZFHjTnrP58eCcC7LkhDPH7cR6XTl
	kiLgh6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Gec-00000007wb5-1nVB;
	Tue, 22 Apr 2025 16:39:26 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FEA-00000007dPs-2q9l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:08:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DE1EA439F6;
	Tue, 22 Apr 2025 15:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745334477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sv05jOSJ6xc00eTPXgNHRvsKAXEfKlZvJUZ4OUiKUQs=;
	b=OYwnFVQAZcZEoI+rYV4eM26gGChn+jEPACAHPdCJihqM7V88gUroJFpnBFYkrEFGl5dN2I
	FEBT+F0F3V7QCNarRFhd3EWbNG5uxB8DLAPcqMxv6T9JUFMiy03fNgiEDCuUTjyOlON3rD
	ySU2E6zlyoSop5Dlh0KvSqivEg1Vqmz5yWWjKEK6SAs1yUtaxRqMRk3JmRlQvcsq94uqF6
	nAsaq9tXBn3LTeOOPPBRKRfJatOsq+m58nUFZ085aejv6CUmpLG8bj0T/MjwkM/kb3cJFd
	jIN+aX8RtYSXoYMwp7383VYkT4yOf2zN7EhYkG/Gpjgw9RbGy4rAypeFAxCL3g==
From: Alexis Lothore <alexis.lothore@bootlin.com>
Date: Tue, 22 Apr 2025 17:07:22 +0200
Subject: [PATCH net 1/2] net: stmmac: fix dwmac1000 ptp timestamp status
 offset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250422-stmmac_ts-v1-1-b59c9f406041@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhgvuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhheefudfhgeegtdekvdeujedugefhhffhfedtgfetffevveekfeelveejfffhjeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_080802_962406_D1335062 
X-CRM114-Status: GOOD (  13.43  )
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

Fixes: 19b93bbb20eb ("net: stmmac: Introduce dwmac1000 timestamping operations")
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
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


