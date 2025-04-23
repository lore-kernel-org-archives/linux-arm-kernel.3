Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F37C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 07:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TkQ7C8jgkCaEq9rXFk0Vbf3ZVjNr91B4Eok6HCwhjgE=; b=TS9A3ObQn/eMzY
	wAr4DqqETJuJ1q7GonBCe8mtCFo+qzIZdncWoLca1cW9r+cDYg24ymMv6UNMmA5M433innoxZ31xt
	A41GJeLu0cuXm+LyYx2Br/L2waYrjctx5r5yFuwcVaSYD/N+FuRQ0nErUvVBncNnra7SBhRz2CP3q
	PTYBzZ+BhbPGXrF3QD0L8qzzB72Oxm0buNwR2HYLe51U/vMM5rcPBaIUpzE+gzfZZwXhkupr7mNS5
	45abipLjwQChOals/9FPk65KryzrVT//6Tw1HyTP6VD3Ma/ggVr1F3DPXXm8rA8Ofi9oCiss/TUzj
	OKTOVx1Lu6MfAfsb0ZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UKW-00000009TbE-3zu8;
	Wed, 23 Apr 2025 07:15:36 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7UHN-00000009SnA-0XAi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 07:12:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2539643A30;
	Wed, 23 Apr 2025 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745392338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TkQ7C8jgkCaEq9rXFk0Vbf3ZVjNr91B4Eok6HCwhjgE=;
	b=OyNIlDDmh31ZODQSRl36ioGEdYX9s/zBp8vjomnpUrxi6KLMPBpOciJcPYeYlRDFgXzvmB
	Sqmbzp4Ip1AzVF7LqCev+ngzZGUMO37gsSTXv8LGmjtO1bxov5rQkxw+UAm2xQrlenzyIC
	2KouizGjb6pKGEMEWHBqsdnPGpHDY1JXnOv3oiDdwV1Y+HIQnfwLazowzsfJ5YGW0BwdE1
	BnBDtvHLaaf7XNWQ7TNRaEiORKJLdBqiA/fq/Et3VM2hRHLe8TXi8r4COp4pRwtrZainc5
	13MkBdwDYsPv/M/2PUTVQJjD+wwFHJgk/4Ftdy2BmevXBYOk2UaTKi5USAfWhw==
From: Alexis Lothore <alexis.lothore@bootlin.com>
Subject: [PATCH net v2 0/2] net: stmmac: fix timestamp snapshots on
 dwmac1000
Date: Wed, 23 Apr 2025 09:12:08 +0200
Message-Id: <20250423-stmmac_ts-v2-0-e2cf2bbd61b1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMiSCGgC/22MQQrCMBBFr1JmbSQd20JceQ8pksapHTBJyYSgl
 N7d0LXL9//jbSCUmASuzQaJCgvHUAFPDbjFhhcpflYG1NjrDlFJ9t66RxblEAfbX7QxhFD9NdH
 Mn6N1h0AZxjouLDmm79Ev7XH9SZVWaTX1xpm504Pu2tsUY35zOLvoYdz3/Qd1aoL/qQAAAA==
X-Change-ID: 20250422-stmmac_ts-c226a53099e2
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeehleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhgvuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgleelieejgfelfffgiefhleeijeduueejvdekudeludetleelhfevhffgudeikeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddungdpmhgrihhlfhhrohhmpegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepmhgtohhquhgvlhhinhdrshhtmhefvdesghhmrghilhdrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegrlhgvgihishdrlhhot
 hhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgigrnhgurhgvrdhtohhrghhuvgesfhhoshhsrdhsthdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_001221_825362_36D09A16 
X-CRM114-Status: GOOD (  10.09  )
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

Hello,

this is the v2 of a small series containing two small fixes for the
timestamp snapshot feature on stmmac, especially on dwmac1000 version.
Those issues have been detected on a socfpga (Cyclone V) platform. They
kind of follow the big rework sent by Maxime at the end of last year to
properly split this feature support between different versions of the
DWMAC IP.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
Changes in v2:
- drop additional parenthesis
- fix wrong hashes in Fixes tags
- add Maxime's RB on first patch
- Link to v1: https://lore.kernel.org/r/20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com

---
Alexis Lothore (1):
      net: stmmac: fix dwmac1000 ptp timestamp status offset

Alexis Lothoré (1):
      net: stmmac: fix multiplication overflow when reading timestamp

 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h       | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c  | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: c03a49f3093a4903c8a93c8b5c9a297b5343b169
change-id: 20250422-stmmac_ts-c226a53099e2

Best regards,
-- 
Alexis Lothoré, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


