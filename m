Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4EEC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ffKgOK5iZ42DSR6ahIMx/48ZZmDdF/0T5rNGZCJCOdI=; b=uke8DznzUAk97m2GpL3m0oMDb7
	U0uR2wtmLyZzqLaK4CJ2cZgmY7+Bojv6o/jqo7YVOatMP2IBJjDGhgt5B6cjRgFONcTWwzS/SUqgZ
	QCPHCWP5RakgNgNJT7vsCdANJtL9CpL1bWhB/fizn32iUgPJ7CnSY+qgqqBRP3gWdthaOZaPkz73W
	58xWFKpskg8kOpQtT9gWFaSXVjZ4yPdaEYJmY4OthScGTJ4Eo1f9Lkfceb5Be8yYusVNl9OB/6TSe
	41J3dXZE6Ts9b+savLqtq2sWNxIG2R6ls0bP968yq09m7qXwNh64aZgkd7ySz4yCED+dysA+TvdU6
	2x3fyAVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZR6w-000000088bf-2nBy;
	Wed, 09 Jul 2025 09:29:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZOno-00000007kPk-3FRY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 07:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B741343F74;
	Wed,  9 Jul 2025 07:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D0FC4CEF0;
	Wed,  9 Jul 2025 07:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752044471;
	bh=hxPSyY5k5W1yAZvXq3K3ryc/SwkGUc1a7pKy7EuahwQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Ees+XgtXV73RpRtZCFqm9jbRNdg4BDEX7Uiy+Eu+Id3eisjdRXsK/U1Tr1fiJOijY
	 F8HRS0MzuijbA8Cy2H8dq68eMOFCJYyH/qxkoSBUDfgwAJ2IZOhbOzcnb2nF7yLH09
	 CFCNVCi7Uclc8E2PVv3DMBdSVdlSl39uqJ3uOKlmCS66NGRIiLkEVoBuFNAc7v++H0
	 yIKT4wp9ELfwpBTMV4zyXHeXrbWCfTnsY81Cprk3+SF54OzS3UmG9T4vFB9HvI5mXs
	 mDQ7Z28pxa7OqFcwIR1aCWcmOu+iCtJ2/m5yD7RR3esVmdPcludLijl25xEcQsKiTL
	 mBJZ7lV0NIsKg==
From: Arnd Bergmann <arnd@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: convert to SYSTEM_SLEEP_PM_OPS
Date: Wed,  9 Jul 2025 09:01:01 +0200
Message-Id: <20250709070107.1388512-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_000112_831888_CF04070B 
X-CRM114-Status: GOOD (  12.85  )
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

From: Arnd Bergmann <arnd@arndb.de>

The old SET_SYSTEM_SLEEP_PM_OPS() macro leads to a warning about an
unused function:

drivers/firmware/arm_scmi/scmi_power_control.c:363:12: error: 'scmi_system_power_resume' defined but not used [-Werror=unused-function]
  363 | static int scmi_system_power_resume(struct device *dev)

The proper way to do this these days is to use SYSTEM_SLEEP_PM_OPS()
and pm_sleep_ptr().

Fixes: 9a0658d3991e ("firmware: arm_scmi: power_control: Ensure SCMI_SYSPOWER_IDLE is set early during resume")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/firmware/arm_scmi/scmi_power_control.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/scmi_power_control.c b/drivers/firmware/arm_scmi/scmi_power_control.c
index ab0cee0d4bec..955736336061 100644
--- a/drivers/firmware/arm_scmi/scmi_power_control.c
+++ b/drivers/firmware/arm_scmi/scmi_power_control.c
@@ -369,7 +369,7 @@ static int scmi_system_power_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops scmi_system_power_pmops = {
-	SET_SYSTEM_SLEEP_PM_OPS(NULL, scmi_system_power_resume)
+	SYSTEM_SLEEP_PM_OPS(NULL, scmi_system_power_resume)
 };
 
 static const struct scmi_device_id scmi_id_table[] = {
@@ -380,7 +380,7 @@ MODULE_DEVICE_TABLE(scmi, scmi_id_table);
 
 static struct scmi_driver scmi_system_power_driver = {
 	.driver	= {
-		.pm = &scmi_system_power_pmops,
+		.pm = pm_sleep_ptr(&scmi_system_power_pmops),
 	},
 	.name = "scmi-system-power",
 	.probe = scmi_syspower_probe,
-- 
2.39.5


