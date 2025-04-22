Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F5CC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lncP1rgWm9k02UlHRTvf0YUucg0MEeMGEKN5pvhXfVQ=; b=W3ammXUo+Cyb8T
	k+z2Ivj45JQTF5KiKhlvkZtI2wqUA7rEJRKx1Jlc7gLK/fapzI7d1gcwCygftdv6Ux+wEvMqySxeW
	FJQTLBbdwlTHloOSSP9cgDKlComJIOZJbRFv4thcfprNDGfRBujlCzpdM7tId1rV9PhupScmNxKw/
	6JD6bPjAET1xYyEC6HeWGD0eKkNP3EGggxUh0ORJiuUnALhUr1UMasg1QswcZb26QRKyV4+zIDNUt
	B7zfDoQOwg89Q5xAvtwVEKiIqByf6TT4DL0OceZo8AzYYuofLOKbsnkX4xZEYBreI9Y6RVtv+pDnY
	BiA3HggUq3FgGop7tUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Gcm-00000007wRj-1Upb;
	Tue, 22 Apr 2025 16:37:32 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FEA-00000007dPn-2Vl8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 15:08:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72DC843A39;
	Tue, 22 Apr 2025 15:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745334476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lncP1rgWm9k02UlHRTvf0YUucg0MEeMGEKN5pvhXfVQ=;
	b=Klg4oUbmi7xLuZmCjFNsc05CfSpssVHYxTn25E52mKt2mIoaCeIPzSDpCldl01RURD5NMz
	Bq8pU+hvK91Y8IreCt5mO7mvG0nlnD10upAROk3xG5TI0ZgafSj1AbtX0PDLEZ2o6lAaJy
	F96CJNRTpiZnj0vCoL/clxM5ajLLWkS0C5hgqIg1fGSRjbLTX2dvrpINlo704iIgc3akeQ
	aPYVQxzZy7DauupSzJnRVWvi0KW0I82Rk4973/sXJnramg3tCzf/WQ4vcn0cRCgY3/dbGn
	k7enfcn75Taz1ZAIRW0IydA/DDptU4o9fBVNDicuzrR7WgnPPbS0zQBBssQF6Q==
From: Alexis Lothore <alexis.lothore@bootlin.com>
Subject: [PATCH net 0/2] net: stmmac: fix timestamp snapshots on dwmac1000
Date: Tue, 22 Apr 2025 17:07:21 +0200
Message-Id: <20250422-stmmac_ts-v1-0-b59c9f406041@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKmwB2gC/x3MQQqAIBBA0avErBNsyqCuEhFiU80iC0ciEO+et
 Hzw+QmEApPAWCUI9LDw5QuaugJ3WL+T4rUYUKPRHaKSeJ7WLVGUQ+ytafUwEELp70Abv/9rAk8
 R5pw/kvsRhWAAAAA=
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomheptehlvgigihhsucfnohhthhhorhgvuceorghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeitdejieffgeevteegveefledugfffueeludejffdvteejffdvjeeuvddujeeugfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddujedrtddrudgnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehli
 hhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhsthhmfedvsehsthdqmhguqdhmrghilhhmrghnrdhsthhorhhmrhgvphhlhidrtghomhdprhgtphhtthhopegurghnihgvlhdrmhgrtghhohhnsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_080802_933533_8E8CE7C2 
X-CRM114-Status: UNSURE (   8.72  )
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

Hello,

this small series contains two small fixes for the timestamp snapshot
feature on stmmac, especially on dwmac1000 version. Those issues have
been detected on a socfpga (Cyclone V) platform. They kind of follow the
big rework sent by Maxime at the end of last year to properly split this
feature support between different versions of the DWMAC IP.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
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


