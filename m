Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F448CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9M25z9/01w0u3UollspoXInN4XqIG89LQVx4RshJL8=; b=GgVOwtwPr2eqblUkHj81pX3lE1
	i7cj0y8GnIKRaiIwt+fLA7IGSdKvgKk+8lZ/s7rEolUH0UEM/COXwy/urCK19vqLW3Q3vIIDCQL31
	HdCulQdRr0PiVMtyKTAj5x++erU5NJLhlVkg0ke9WlxTUmRNb0apibr56x5QeBWLiFFMCVo0kt1EA
	/18APMfgWWKPJCLwk3H6uWqVM7HMLzUEj3DDZ48il6uiwRacGon3MtcazEVbxUCzbZceno70oo0HS
	pPkvXmPcjpHQlQ6XCQRWc4JfmMQA3LAMQUnSCI6gjAN3FfDx8JWodldIrIlYNamhCXx1aKwjsfnl6
	Vc+bPZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbnn-00000000DID-3myL;
	Thu, 14 Aug 2025 17:31:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma9t-0000000HWiW-1dQ7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8783FA56E7C;
	Thu, 14 Aug 2025 15:46:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFB1C4CEEF;
	Thu, 14 Aug 2025 15:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755186388;
	bh=vgKNO9KMKM8wBYx2jsyzSgi+p35j799z+r40TDqKnfM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jr50G62H1Qx9CHSo0nMhM7RMBO9Uw6ApNxLok7rtAUSGkBwZ+JhCsnpYGVJRtHPvM
	 NnLKi5V0XyhSxRWo1/MqhhHRggOgfi2HRkVxD0QR8f1W1zrGkcc/NBV25d4NHzjd2k
	 MHiTlN8dc7WzXm81tD/nYXEIKVJbgq17C9rQ96Xc/+UwXheHmA+JQCrvZGGYW4QXI3
	 XLgjtECPozalHMeOGvLIIa+Y/GziVCIuEqS9I5iHEzObHll/blbvk6dD8bvcJPIjHI
	 ibywTtkmMtz1bF4kGaRZwPZobJbetf6q9xhssw5zeSEpSgj9pEdXBeBY8zDDoQw6+a
	 2AkCgiRl2uHzA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uma9p-007VqB-Qx;
	Thu, 14 Aug 2025 16:46:25 +0100
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
	Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v2 1/4] ACPI: GTDT: Generate platform devices for MMIO timers
Date: Thu, 14 Aug 2025 16:46:19 +0100
Message-Id: <20250814154622.10193-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250814154622.10193-1-maz@kernel.org>
References: <20250814154622.10193-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@arm.com, rafael@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, alexandru.elisei@arm.com, steven.price@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_084629_559440_DB0B882F 
X-CRM114-Status: GOOD (  15.60  )
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

Tested-by: Sudeep Holla <sudeep.holla@arm.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Link: https://lore.kernel.org/r/20250807160243.1970533-2-maz@kernel.org
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


