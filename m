Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDEFC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 16:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUoGv7kG7tkl1/EKAOfiQpfbBBJIOLsNYTJhaZUR0i8=; b=W6VhgTUJ3sERv/OyW03l3ZHu4r
	gtqMwUcvVTFetdrX/+68umWpWll8y+IDBt778L94NcFLENdjj+qrdOxxUIFOvrN4rKk43CV03Xmc9
	GIpJztQSnctzNBGSFSjG65yWF175YWTjte6ouJu4pvff6WdMXtLepk3IOtrC6splHrE1Ga0pkWWWl
	X1NTL53U47EjPr4yx4d8Q9s0pXbwOoiew9v+IML/qkYnn/xApVaBtR2TDwojCClcQC0BPKel9EjOn
	VueuTAlrHhsza45zacF9oZg0fPHkwVzPcxsUAuWbKLH4Ysnr5HVWZEwjWBGngtCWqpeqWgsk90HGW
	wNDpNYjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk3Ew-000000015vw-1YrC;
	Thu, 07 Aug 2025 16:13:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk34x-000000014VX-0XLH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 16:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D7C8601DB;
	Thu,  7 Aug 2025 16:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C02C4CEEB;
	Thu,  7 Aug 2025 16:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754582574;
	bh=V0zwWY5dCF706NVg1BhU/LV6NFl38SUmlax6Gx4zqYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qkw36kaDU2xf8ZffwT5Bpq0+4qoNWnmA4PY6TyjLP1N+KfYWEWXT9yiNe2o1hDU+P
	 U+isEu+Yp8GnJf17tYjwuJFui7ZqnZPSEZQx7ZMKYNbAIXT0IfFAI77I1UL31df42h
	 zQ3LKOcd3reYs06AG4+dwnaZ9OzcknNjRx1VMmWVCF5a4WDyipc1SZbjndGca4KunI
	 FUuBEho4I6wcSyw5CQtMxh0J6N4Qqw++CAmQjlf0loZoOxy3pYeahe7naeSY5Kow63
	 xnUUU2MeNEfg4ajHiVh5ZSTaSL2yqTY52+KiwfVeELOWgbEk2xM4oCMoC16rQ/Bz03
	 wweQGUOb3YHMQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uk34o-004zf7-T6;
	Thu, 07 Aug 2025 17:02:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 1/4] ACPI: GTDT: Generate platform devices for MMIO timers
Date: Thu,  7 Aug 2025 17:02:40 +0100
Message-Id: <20250807160243.1970533-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250807160243.1970533-1-maz@kernel.org>
References: <20250807160243.1970533-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@arm.com, rafael@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

In preparation for the MMIO timer support code becoming an actual
driver, mimic what is done for the SBSA watchdog and expose
a synthetic device for each MMIO timer block.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/acpi/arm64/gtdt.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/arm64/gtdt.c b/drivers/acpi/arm64/gtdt.c
index 70f8290b659de..fd995a1d3d248 100644
--- a/drivers/acpi/arm64/gtdt.c
+++ b/drivers/acpi/arm64/gtdt.c
@@ -388,11 +388,11 @@ static int __init gtdt_import_sbsa_gwdt(struct acpi_gtdt_watchdog *wd,
 	return 0;
 }
 
-static int __init gtdt_sbsa_gwdt_init(void)
+static int __init gtdt_platform_timer_init(void)
 {
 	void *platform_timer;
 	struct acpi_table_header *table;
-	int ret, timer_count, gwdt_count = 0;
+	int ret, timer_count, gwdt_count = 0, mmio_timer_count = 0;
 
 	if (acpi_disabled)
 		return 0;
@@ -414,20 +414,41 @@ static int __init gtdt_sbsa_gwdt_init(void)
 		goto out_put_gtdt;
 
 	for_each_platform_timer(platform_timer) {
+		ret = 0;
+
 		if (is_non_secure_watchdog(platform_timer)) {
 			ret = gtdt_import_sbsa_gwdt(platform_timer, gwdt_count);
 			if (ret)
-				break;
+				continue;
 			gwdt_count++;
+		} else 	if (is_timer_block(platform_timer)) {
+			struct arch_timer_mem atm = {};
+			struct platform_device *pdev;
+
+			ret = gtdt_parse_timer_block(platform_timer, &atm);
+			if (ret)
+				continue;
+
+			pdev = platform_device_register_data(NULL, "gtdt-arm-mmio-timer",
+							     gwdt_count, &atm,
+							     sizeof(atm));
+			if (IS_ERR(pdev)) {
+				pr_err("Can't register timer %d\n", gwdt_count);
+				continue;
+			}
+
+			mmio_timer_count++;
 		}
 	}
 
 	if (gwdt_count)
 		pr_info("found %d SBSA generic Watchdog(s).\n", gwdt_count);
+	if (mmio_timer_count)
+		pr_info("found %d Generic MMIO timer(s).\n", mmio_timer_count);
 
 out_put_gtdt:
 	acpi_put_table(table);
 	return ret;
 }
 
-device_initcall(gtdt_sbsa_gwdt_init);
+device_initcall(gtdt_platform_timer_init);
-- 
2.39.2


