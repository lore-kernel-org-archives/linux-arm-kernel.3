Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9F7CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HqjQNnDIADVjTHQGDd7cp3s0JWTM9pRhnP2/QJpIeLI=; b=il8SDJYPc3SqWSUe2aH/4NSM4b
	49JHjebQbsk1Wcy4xv1rsgqvHKu3V99UV/29fs1f30EkC2ffFKTFD/8hW9qjvlt7VQTaY3MTPq2Fz
	Rx2c/5xem3BSstjp6zYrqBbp0RwFr6IcaExkJNqdCQuigEF1Ox/QocUnlYVFhtbscS3YL/Iz68Foo
	tsKWdiUHMFVHMT/1dXbiPjtQLl4v/eqbMJLnblV5b8eWNzwulgN5dWZ1nGBEdKQs/tSFyQ/wqCfPd
	Boc2M6WMJNnefLiLG3a1QACt+j+BkVHefdX+cKUaJ0Zuifd0EHpqgB8Mu9FBlch7i50JVkTrwqDsQ
	PZHYDQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3i-00000009TSK-2mK9;
	Thu, 11 Jun 2026 13:02:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf3h-00000009TRJ-1w3n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:02:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E37FD6012B;
	Thu, 11 Jun 2026 13:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6A81F00893;
	Thu, 11 Jun 2026 13:02:52 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 8/9] firmware: arm_scmi: quirk: Handle power management clocks on R-Car X5H
Date: Thu, 11 Jun 2026 15:02:12 +0200
Message-ID: <570914c18b34684dd41a1b7b7be9bd7aa377690b.1781171706.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781171705.git.geert+renesas@glider.be>
References: <cover.1781171705.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Renesas R-Car X5H, power management of on-SoC modules is handled
through two methods: module power control and module clock gating.  The
former is exposed as an SCMI power domain, the latter as an SCMI clock.

Currently the SCMI clock protocol does not support advertizing
power-management clocks yet.  Add quirks to mark all module clocks
suitable for power management, reusing the existing clock_rcar_x5h_4_28
and clock_rcar_x5h_4_31 quirk keys.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This patch is included as a PoC.
This does not build as the quirk keys are not added in this series.
---
 drivers/firmware/arm_scmi/clock.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 42e666a628c732e5..c2648f9f283f2488 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -355,6 +355,18 @@ scmi_clock_get_permissions(const struct scmi_protocol_handle *ph, u32 clk_id,
 	return ret;
 }
 
+#define QUIRK_RCAR_X5H_4_28_PM_CLK					\
+	({								\
+		if (clk_id <= 818 /* Last MDLC clock MDLC_GPIODM3 */)	\
+			clk->pm_clk = true;				\
+	})
+
+#define QUIRK_RCAR_X5H_4_31_PM_CLK					\
+	({								\
+		if (clk_id <= 814 /* Last MDLC clock MDLC_GPIODM3 */)	\
+			clk->pm_clk = true;				\
+	})
+
 static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 				     u32 clk_id, struct clock_info *cinfo)
 {
@@ -410,6 +422,9 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 			if (SUPPORTS_EXTENDED_CONFIG(attributes))
 				clk->extended_config = true;
 		}
+
+		SCMI_QUIRK(clock_rcar_x5h_4_28, QUIRK_RCAR_X5H_4_28_PM_CLK);
+		SCMI_QUIRK(clock_rcar_x5h_4_31, QUIRK_RCAR_X5H_4_31_PM_CLK);
 	}
 
 	return ret;
-- 
2.43.0


