Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA6DCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49lJcqz2Atyj8/fHFhx3OA4I/7oDRXdi07p+7Ym8sf4=; b=l+k2WrIxluuZSHKqmEfbtJBulK
	a/FaPiU3UR9NqqYystm9YAZYpjFHEgTP7V5RtEFRZjeaV0XV7BQOZV+EqhiSHy11GN5wCqJrl767e
	9LDSSr1bwKn8+SjoYEYAbpaJo9nDT2XCCnaZGxMayLIhZtK8FalKV55+IKlU9Tosh6yN902qzOl4y
	weMccfmUJZFjsm2lKcyFCd9+gYkpHe2UnHBzsmM2ypEXto2NM2XQWQqxGorrfIuwejdSGKp459HCa
	p7An28BazMqLNH5SK1uY+TSHvEXMTEmv1CgQ3nsVhiRXz/f5OMdBZS5W+vq7w+0RPlrajoXNhsXzL
	TljX28eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXjR-00000000AuO-1sBN;
	Wed, 06 May 2026 08:35:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXjQ-00000000AsH-0mVX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 08:35:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C3E404E42C13;
	Wed,  6 May 2026 08:35:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99A236053C;
	Wed,  6 May 2026 08:35:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACFD3102F15EB;
	Wed,  6 May 2026 10:35:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778056545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=49lJcqz2Atyj8/fHFhx3OA4I/7oDRXdi07p+7Ym8sf4=;
	b=yt3ih61HzrkDb0yi6wxVYk0W9u8yK6qBPKjwU+uRLkXJPLbXoV+cTA9eWYBgqbw2a33TKP
	Shj9mu/gzpeTHi8w8hTaaY5Q20HW1Zw/Qnxb9rRJCQ/UgLuCOQaCHI9OOoOt8eVUwywXDx
	ZWTqLX4vSbwK9kcflrB05VjgPiCs5nuegRqBJogm5vp5GM842v1uBQhkxpWlKePOfpZmup
	C7d9p5mye+rPpeWP+pUqS4RheCwfB8cFlck+86QwQ/EexMCWTMST2V95AiaU+BfAueT9n4
	NJgel2FrOw5QaslODgj8ho4T7cWlFKgi3VoZ3XWjloQDH1lNnxzXsmPd8dn3gQ==
From: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Date: Wed, 06 May 2026 10:35:28 +0200
Subject: [PATCH v7 4/4] firmware: ti_sci: add support for restoring clock
 context during resume
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-4-037098a35215@bootlin.com>
References: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com>
In-Reply-To: <20260506-ti-sci-jacinto-s2r-restore-irq-v7-0-037098a35215@bootlin.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, 
 richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>, 
 Abhash Kumar <a-kumar2@ti.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, 
 "Thomas Richard (TI)" <thomas.richard@bootlin.com>, 
 Dhruva Gole <d-gole@ti.com>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_013548_371389_AD35E25B 
X-CRM114-Status: GOOD (  13.00  )
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

Some DM-Firmware are not able to restore the clock rates and the clock
parents after a suspend-resume. The CLK_CONTEXT_LOST firmware capability
has been introduced to identify this characteristic. In this case the
responsibility is therefore delegated to the ti_sci driver, which uses
clk_restore_context() to trigger the context_restore() operation for all
registered clocks, including those managed by the sci-clk. The sci-clk
driver implements the context_restore() operation to ensure rates and clock
parents are correctly restored.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>
---
 drivers/firmware/ti_sci.c | 9 +++++++--
 drivers/firmware/ti_sci.h | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 531ac3aa38b8..1ee8f67d3f7e 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -9,6 +9,7 @@
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 #include <linux/export.h>
@@ -4022,6 +4023,9 @@ static int ti_sci_resume_noirq(struct device *dev)
 				}
 			}
 		}
+
+		if (info->fw_caps & MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST)
+			clk_restore_context();
 		break;
 	default:
 		break;
@@ -4182,14 +4186,15 @@ static int ti_sci_probe(struct platform_device *pdev)
 	}
 
 	ti_sci_msg_cmd_query_fw_caps(&info->handle, &info->fw_caps);
-	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s\n",
+	dev_dbg(dev, "Detected firmware capabilities: %s%s%s%s%s%s%s%s\n",
 		info->fw_caps & MSG_FLAG_CAPS_GENERIC ? "Generic" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO ? " Partial-IO" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_DM_MANAGED ? " DM-Managed" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_ABORT ? " LPM-Abort" : "",
 		info->fw_caps & MSG_FLAG_CAPS_IO_ISOLATION ? " IO-Isolation" : "",
 		info->fw_caps & MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED ? " BoardConfig-Managed" : "",
-		info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : ""
+		info->fw_caps & MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST ? " IRQ-Context-Lost" : "",
+		info->fw_caps & MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST ? " Clk-Context-Lost" : ""
 	);
 
 	ti_sci_setup_ops(info);
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 67f16e8c69a1..2d75667a6723 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -152,6 +152,7 @@ struct ti_sci_msg_req_reboot {
  *		MSG_FLAG_CAPS_IO_ISOLATION: IO Isolation support
  *		MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED: LPM config done statically for the DM via boardcfg
  *		MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST: DM is not able to restore IRQ context
+ *		MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST: DM is not able to restore Clock context
  *
  * Response to a generic message with message type TI_SCI_MSG_QUERY_FW_CAPS
  * providing currently available SOC/firmware capabilities. SoC that don't
@@ -166,6 +167,7 @@ struct ti_sci_msg_resp_query_fw_caps {
 #define MSG_FLAG_CAPS_IO_ISOLATION	TI_SCI_MSG_FLAG(7)
 #define MSG_FLAG_CAPS_LPM_BOARDCFG_MANAGED	TI_SCI_MSG_FLAG(12)
 #define MSG_FLAG_CAPS_LPM_IRQ_CONTEXT_LOST	TI_SCI_MSG_FLAG(14)
+#define MSG_FLAG_CAPS_LPM_CLK_CONTEXT_LOST	TI_SCI_MSG_FLAG(15)
 #define MSG_MASK_CAPS_LPM		GENMASK_ULL(4, 1)
 	u64 fw_caps;
 } __packed;

-- 
2.53.0


