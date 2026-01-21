Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60267C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBVXFEdaRJcEH9atfPBKtguvTBweusReAnDHX35/2Us=; b=tg1aVHDUltf8dSM1m4D3v+qpqc
	TqwG3XqbhzGd+SUAfCq37/FA2QLZCEzZ177Yi8r7vyk9hnXmE2Re9Q5VFOgBs27slBDi4ntPRc1CW
	Pr+XPAoVU5fmhztFWgLqM0dr/yXgnvNmnRcRqYOsUzjfh6EVM6vf6l7kAnVpecJHHx+ZBQDOBirGs
	AIwJCb6OA8tAQ1y21mbGUc1WNz7EW6Qyue03eyVkUcKiaDlaNRt5QoECx1a189KY8k+C4z8YJS7hn
	ZYOqbXpXu8U5EpZ99O0pyK4nFp/TTmuEqKwjv4bXaeUCet4jN/fJ9IETDpGo3B2ZMvQKTyRtQw2IW
	ub9DQ6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW14-00000005K40-3k6T;
	Wed, 21 Jan 2026 11:04:50 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW11-00000005K2E-2eZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 11:04:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768993480; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U33vu7XTEIYnxNSHVFZUqS2pG/Gpyc9ErTZRdQLff9Xht602lfg0z5pnw4AwyTkfMH39KPa8XqTyaShouSI8MlhyjUrI6pmd6GiIA4MQRWh1c8Pax22LofyS0lBct5C1yoZcER08mgUfKwIt8pDh3rF+z9sbfiy+rqhuGbevnZ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768993480; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NBVXFEdaRJcEH9atfPBKtguvTBweusReAnDHX35/2Us=; 
	b=e8FiM8Qtqsc5GJaw51cbBqeiYu0yl9Kpn9RhUdnS1XCGuiwxVpLQwrmT2sVQH/P2mrhJ7WZKLpaEN9Ijl6Nq7j1gSeQSLXkj0KKHvI9UxUJ6noNAxcMeiramPnQGUXGdzzx9etGE/xQ6hwslpayu9wv2fpuBJfktLza0I/4PrGI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768993480;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=NBVXFEdaRJcEH9atfPBKtguvTBweusReAnDHX35/2Us=;
	b=mSkMXvzMKCUW3GyUCnc2/eZsmCaLWZf/Ww5TJbnZgJ23hrYvwssYnitkEdSLBY1S
	h7n6E77YIwfPMhexn9zfkVJMtfruCD9ya373pjlmnxpOuvR0WjdttUgGWBljHhLKTJx
	6/C8eugEkdhRzsUicjMjQ646Y6a72nEXz2PSQkOU=
Received: by mx.zohomail.com with SMTPS id 1768993478453725.0311405076129;
	Wed, 21 Jan 2026 03:04:38 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 21 Jan 2026 18:59:12 +0800
Subject: [PATCH 6/7] rtc: sun6i: Add support for A733 RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-a733-rtc-v1-6-d359437f23a7@pigmoral.tech>
References: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
In-Reply-To: <20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768993386; l=1343;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=SE3KCwAGdCuYIMUpUjVkwvvnkVL1syEZpjMdM6ORN2A=;
 b=+oew59MDiDNmLqVNHNSZRel5WMMQ8wzQ4Ax7fokTiWUGO5MTiRDxhQyHSanz6R7PE3FDXKsE1
 V56D26wPYD8AlSwWH93Pq9IG7p9gktp+y/S18aav2ViWHcDX693hM8v
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_030447_740859_82FDAD42 
X-CRM114-Status: GOOD (  12.17  )
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

The RTC in the Allwinner A733 SoC is compatible with the H616 in terms
of its time storage and alarm functionality. However, its internal CCU
is different, with additional DCXO handling logic.

Add new match data to register a new auxiliary device for its CCU part.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/rtc/rtc-sun6i.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index b4489e0a09ce..a58d9c6b917c 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -865,6 +865,11 @@ static const struct sun6i_rtc_match_data sun6i_rtc_match_data = {
 	.flags = RTC_LINEAR_DAY,
 };
 
+static const struct sun6i_rtc_match_data sun60i_rtc_match_data = {
+	.adev_name = "sun60i",
+	.flags = RTC_LINEAR_DAY,
+};
+
 /*
  * As far as RTC functionality goes, all models are the same. The
  * datasheets claim that different models have different number of
@@ -883,6 +888,8 @@ static const struct of_device_id sun6i_rtc_dt_ids[] = {
 		.data = &sun6i_rtc_match_data },
 	{ .compatible = "allwinner,sun50i-r329-rtc",
 		.data = &sun6i_rtc_match_data },
+	{ .compatible = "allwinner,sun60i-a733-rtc",
+		.data = &sun60i_rtc_match_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, sun6i_rtc_dt_ids);

-- 
2.52.0


