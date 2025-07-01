Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DFCC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iaNS5/ITwDWC0PuIohe6VXDvvHurRKQnpsYlrwojaJA=; b=iorheGvm3pbFMQuG5QNS8RrZDR
	YxQjsMo0d1jDxonchCZyLbB+xvlj+EiTZ0lOkB1qJbhDGLu6wF4FcJznw57mCezSCFe7FRtm3KQ3m
	nteiThUmfmbLrs6MXuiAZeDWkumL5Vl+OHg/qnGfuW6t3A/tuxup6FkFZAjLhj1LcAFnygZRJxI4k
	MXFcvd6G5eRycEI/E/0PLbBzYH9FeskYlTAqEK7UWAY9JPyqOBqK5AJ+/stWmRrXHgwDy0fz5CABo
	/C+G4fYQwrNSbGsinfVcsNzlakOKqo1qEyRtdd1e9I/9Hjsv7bNJmdiMB5q8ihaNI3RQjtjON3Z4J
	JWiS13DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgDW-00000006PIH-1Aww;
	Tue, 01 Jul 2025 19:00:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWdyg-000000063rO-1Aa2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:37:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60F0B453D7;
	Tue,  1 Jul 2025 16:37:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F410C4CEEB;
	Tue,  1 Jul 2025 16:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751387821;
	bh=RK8SB4EJXzDR75Wtd6g9Il6AVAxxcuOajEeiy5IaFDY=;
	h=From:To:Cc:Subject:Date:From;
	b=aUKI4IuLVsW9CfAhRY4GGF6d43SuPPjnnV1ou5MQC1YXQ04JGK/HDQtrTZ3+mfjs8
	 DSmDJLWp4yHKKCET1MiGNoM1k5Xhx1jXuoKnR6XfnKNQ9NJ/3AECapP9InMPgEij6c
	 jg8GJkABLNGJ7EJbyUJzBgAnizm36lECUwjAfjIW5H11Ee1hPtMjm9tj86Rqj3fyl0
	 jpa+YvkraAb/3nvw7f4NS8CqLXl4dbx7N+SnUfnc7NLj19eEu8geqMwuqx1AJAd5kV
	 bAvFhrCUGUZaL4KftSHZGpoV/w5K0K2BbXSzxC0fGIdKg4RsZ4Df+jKutKVszZtqZR
	 2MYMdVSudMySw==
Received: by wens.tw (Postfix, from userid 1000)
	id 0E54E5FDF8; Wed,  2 Jul 2025 00:36:57 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v2] mfd: axp20x: set explicit ID for regulator cell if no IRQ line is present
Date: Wed,  2 Jul 2025 00:36:52 +0800
Message-Id: <20250701163652.252010-1-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_093702_336371_48058973 
X-CRM114-Status: GOOD (  16.21  )
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

From: Chen-Yu Tsai <wens@csie.org>

Originally an explicit ID for the AXP313/AXP323 regulator was set to
avoid a conflict with the primary AXP717 PMIC on Allwinner A523 family
boards.

This didn't entirely work since on some or all of these boards, the
interrupt line on this secondary PMIC was left unconnected, and thus
the driver would fall back to the generic "no interrupt; only regulators"
case, which didn't have the explicit ID set, thus undoing the intended
fix.

Also set an explicit ID for the regulator cell in the no IRQ generic
fall back case. This fixes the conflict for the AXP717 + AXP313/AXP323
case. For the actual single PMIC with no IRQ connected case, the ID does
not affect functionality, only the device naming of the regulator cell,
and by extension the name and path under sysfs.

Fixes: 249abf9b1e25 ("mfd: axp20x: Set explicit ID for AXP313 regulator")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

This is an alternative to

    mfd: axp20x: Skip PEK on AXP313A/AXP323 if no interrupt line is available

which was deemed too fragile.
---
 drivers/mfd/axp20x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 25c639b348cd..c5f0ebae327f 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1231,9 +1231,8 @@ static const struct mfd_cell axp15060_cells[] = {
 
 /* For boards that don't have IRQ line connected to SOC. */
 static const struct mfd_cell axp_regulator_only_cells[] = {
-	{
-		.name		= "axp20x-regulator",
-	},
+	/* PMIC without IRQ line may be secondary PMIC */
+	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
 };
 
 static int axp20x_power_off(struct sys_off_data *data)
-- 
2.39.5


