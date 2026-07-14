Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD2FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8vHA1cpXKh35T7zr8/1wgjPgJVq9DuTAI2cDYumRPFc=; b=P6jG7Zfm7V2FKFdMg01eXc8bCQ
	fwdc1lLWa/5Za+KDTtteCK1GOcuN3HzA9S38t04X7AbQSIj+p2luQHMVS7dc8XIwH77xuqTJLXIvS
	lgLSN+UjFNnt6513svRT4zkfejrwZItMKuLXgzYm0pi35DRlJY63GEDj7EetPuDP1pK0qQFXinBbb
	FJxgJFxig/TbxmCNeJEYUjguTO5XxQMOqz4iH4YtegkB74sM7ZsNkA3lgVAI3PgF7BaG2e2NuS/Jr
	qAbghhXWPdjKz8d0kDaflhJ1ZgXjv6alM6WKQicU7/o5LP2PMhbt8ygJXcntlamhw+XhwGtRUo3vc
	PJ/qhW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpF-0000000C5YG-2ADo;
	Tue, 14 Jul 2026 13:05:29 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcpD-0000000C5VY-2j0n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:05:29 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h000N6wNVz8v9C;
	Tue, 14 Jul 2026 15:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8vHA1cpXKh35T7zr8/1wgjPgJVq9DuTAI2cDYumRPFc=;
	b=vAU5rAbAoIv5ZBsGDt8Gu4mxuF0CBYCtILz7z5lzwKbYXzOto91xBL/u1ZYdGcwYU8QOeC
	DiVdbzClGnIl7vyzbGmtmSU4E+unbvfBtRLmInKc1MCvrN3rI3UV+zrAJgOZsGI1V2maqx
	V2+m3Va1bgVIUsYIu040umLmr0zPJRjzAAewdDMEhFVS5OhjioBm1OCO99YLHrhk42fpP9
	dJDcwokGPGcgVHRFR5e7dM5f8oeqTP5wDmG05rZ6GQ3teaS4TvGxY9bP5koIuqvxGDi4Wt
	VgbZDvHiDcO8zTfuy+u33bdjZpCtVJcvuQe0YhobuNMQE7kCJsvz6HJXh1BmcQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784034323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8vHA1cpXKh35T7zr8/1wgjPgJVq9DuTAI2cDYumRPFc=;
	b=gw4XFAcc0sEGKc0YT7BQRNQm+B1q9bZb/UAVBwlyW0HioaOkVrFKgNvxs5OiM9uJ2Weagx
	l2ZC6+9Xg/Ehp5f/VEXlMeSd4iRMILgxB/yWft53rO7cu7B/0bu+Am9H35iooCZjfq5iZz
	i54/Ev9Bb9K/Vrgjm3rdTQh/iUg310jK5JPulrWCzEX9GU7RFS72cjRBtAKpKp6I9g2Gv7
	rvHccdBpDmfc1YdNuJf3isTYTx91OcReT6qZnD5xv8Z/HWru7lJ/5V9kMXelcIrnwyw6Sj
	0D5teTkW2fr6dxGFjk2Ufwnk14IB5YfsyRbhmrQdt4l/LPiA4LZqCDqOJ9vH+Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: renesas: cat875: Specify ethernet PHY reset timings
Date: Tue, 14 Jul 2026 15:04:57 +0200
Message-ID: <20260714130515.11262-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 17a96ssnytbjkxpbtojr6tez71yddd39
X-MBO-RS-ID: 456c9e2a5ba797afe92
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_060527_844170_43E9E1F7 
X-CRM114-Status: UNSURE (   8.86  )
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

The RTL8211E reference manual [1] page 38 chapter 7.16. PHY Reset
(Hardware Reset) states that the PHYRSTB pin must be asserted low
for at least 10ms (Tgap in Figure 10) and the system must wait at
minimum 30ms (for internal circuits settle time) before accessing
the PHY registers. Use 15ms and 35ms respectively to provide some
additional margin.

[1] https://files.pine64.org/doc/datasheet/pine64/rtl8211e%28g%29-vb%28vl%29-cg_datasheet_1.6.pdf

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/cat875.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dts/renesas/cat875.dtsi
index 5815e9d2d8a93..196cf2e6007ea 100644
--- a/arch/arm64/boot/dts/renesas/cat875.dtsi
+++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
@@ -23,12 +23,14 @@ &avb {
 
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id001c.c915";
 		reg = <0>;
 		interrupts-extended = <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
 		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <15000>;
+		reset-deassert-us = <35000>;
 	};
 };
 
 &can0 {
 	pinctrl-0 = <&can0_pins>;
 	pinctrl-names = "default";
-- 
2.53.0


