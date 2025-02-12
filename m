Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A86C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV58UJrNiafKUEEBYyT5622rc4906GKqOPPegyEjpJc=; b=WVoXAQzSSB/bQMCtQ8t4r2Gbgc
	/vOyelRWFQ6HWGVSYSnRKZ00DnPB37q/GtMwFkZ2sEHvWqsUE14Ciy16rdReRDbr9J97IaDlD7m8q
	sxUuZGwRLdXixHRsk60Z3sXI+ZSOIFLV0oJ33fgEGUfDPGomLWTHM3GliClSGuDoUQrK9NHRfoHXa
	k5VxPtCgfUZdamfZJxms4SbVSxGIXq0yJOwxAqNkXSm2l69N93y9NP48fRqlQQ7Szqgl/RBw98kcn
	qavN9w5HKCTa7t0bBfRWB9F7pKaIe0SBdozkqqe4aDM8fE5JxoyZ0MetOsWIcLQiQGnNB33fTw6ao
	4kkpyX/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDxR-00000007j1a-23hK;
	Wed, 12 Feb 2025 14:43:21 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDvz-00000007ijR-3ak8;
	Wed, 12 Feb 2025 14:41:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1FDCF204A5;
	Wed, 12 Feb 2025 14:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739371303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hV58UJrNiafKUEEBYyT5622rc4906GKqOPPegyEjpJc=;
	b=GvBu9t563kxnFl8vpKqJnl1NlFNwRhwgqpgwrV/WKHt+P/P2VyItdyvSR8e7YpylVkrJFh
	ZambmdwrU19UQNsfxlqJs00qmG1mJgRSWTe8ObzqtbHpk8slTgRKlELpQzT2avGKq6lyJb
	LL8HprxNBtH1BHLc61viq/yj9L1DFSAe2WWN2RQe9dFql+ICrfKfp8CUe3mO2pCCPgX8tS
	TP6aR8s3Mrn/9Z42s8BUVceDzlUrOyyDuDl6gLHzqZEXHOkCL7Q/nrgv8UdwGzqRqtay8e
	1kA/qjLYuimHcatcpaPr75L+A1gxNamRx4P/B6fzdeCUHAvX/o80W0TZ2LG1gg==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: jbrunet@baylibre.com
Cc: Laurent.pinchart@ideasonboard.com,
	abelvesa@kernel.org,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	arnd@arndb.de,
	bryan.odonoghue@linaro.org,
	conor.dooley@microchip.com,
	daire.mcnamara@microchip.com,
	dakr@kernel.org,
	david.m.ertman@intel.com,
	dianders@chromium.org,
	dri-devel@lists.freedesktop.org,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	gregory.clement@bootlin.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	imx@lists.linux.dev,
	ira.weiny@intel.com,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	kernel@pengutronix.de,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	maarten.lankhorst@linux.intel.com,
	martin.blumenstingl@googlemail.com,
	mripard@kernel.org,
	mturquette@baylibre.com,
	neil.armstrong@linaro.org,
	p.zabel@pengutronix.de,
	peng.fan@nxp.com,
	platform-driver-x86@vger.kernel.org,
	rafael@kernel.org,
	rfoss@kernel.org,
	s.hauer@pengutronix.de,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	simona@ffwll.ch,
	theo.lebrun@bootlin.com,
	tzimmermann@suse.de,
	vladimir.kondratiev@mobileye.com
Subject: [PATCH] reset: eyeq: drop device_set_of_node_from_dev() done by parent
Date: Wed, 12 Feb 2025 15:41:26 +0100
Message-ID: <20250212144126.120231-1-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-5-7edb50524909@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggeduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeghfejhfdviefftedvieetfedugeefvedtfedujefhhedvhefggfduhfefueektdenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgupdhhvghlohepthhlvggsqdgsohhothhlihhnqdhffidqtddvrddrpdhmrghilhhfrhhomhepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgeejpdhrtghpthhtohepjhgsrhhunhgvthessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepnfgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopegrsggvlhhvvghsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmr
 ghilhdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopegsrhihrghnrdhoughonhhoghhhuhgvsehlihhnrghrohdrohhrghdprhgtphhtthhopegtohhnohhrrdguohholhgvhiesmhhitghrohgthhhiphdrtghomh
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_064152_374191_1AF996B0 
X-CRM114-Status: GOOD (  11.03  )
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

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/reset/reset-eyeq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b..8018fa895427 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -420,17 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)
-- 
2.48.1


