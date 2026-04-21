Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC4CF94CA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZeZJDZZMz3+qOGpna3T/f7tkmlUxaTpTVT4KbTPdlc=; b=xnsLbLJi/hP0m2s24aiXsXERsj
	gcshdwo0H/6cOzT3BbYLfMhw65gXRUuXvXFjoOdOCExwOZ6jStTOeodqtDEp6dOf8VQHpg/ikHu2r
	RsUdMUHdar7801DeXbcf+/NvbAUZ35AXS/89kGQIMW/tq0diwfIZX8uFbBh0EoE03RNWI2fDdxwqE
	3+fGlspl0laqJaeVAD8nwJZmZQsrbvWzu9NW6zdluHK1JklRFW1zDes4ZuCPXji8N6BUvNu++csHc
	Mm6YAbT1kXe5c6Zi2SkV4MYfruzlEG9lzpchX/nxZ3Lxz7wcRQwukZ6LJG5TFo/EWOc+sj3NW7B/C
	iJ0yTtDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFa3-000000090iR-2hiR;
	Tue, 21 Apr 2026 18:12:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFa1-000000090hI-1DyW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0617743915;
	Tue, 21 Apr 2026 18:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EED0C2BCB8;
	Tue, 21 Apr 2026 18:12:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 03/14] firmware: arm_scmi: quirk: Handle critical clocks on R-Car X5H
Date: Tue, 21 Apr 2026 20:11:36 +0200
Message-ID: <e2d0f13794ba0e64b6820a354e5b22268a77161b.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_111213_369694_076090C9 
X-CRM114-Status: GOOD (  12.98  )
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

Renesas R-Car X5H SCP FW SDKv4.28.0, v4.31.0, and v4.32.0 advertise a
few clocks that crash the system when disabled.  Add quirks to prevent
such crashes.

As SCMI clock IDs are identical for SDKv4.31.0 and v4.32.0, the quirk
for these two versions can be shared.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Some of these could be handled by improving hardware descriptions in DT,
or by the CPG and MDLC drivers.
---
 drivers/firmware/arm_scmi/clock.c  | 23 +++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.c |  6 ++++++
 drivers/firmware/arm_scmi/quirks.h |  2 ++
 3 files changed, 31 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index d530882a0bac88c3..4fec8c3216df7a51 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -920,6 +920,26 @@ scmi_clock_config_set_v2(const struct scmi_protocol_handle *ph, u32 clk_id,
 	return ret;
 }
 
+#define QUIRK_RCAR_X5H_4_28_CRIT_CLOCKS					\
+	({								\
+		switch (clk_id) {					\
+		case 468:	/* MDLC_INTAP0 */			\
+		case 498:	/* MDLC_APRTMGINT0 */			\
+		case 840:	/* CLK_ZD_APU0 */			\
+			return -EPERM;					\
+		}							\
+	})
+
+#define QUIRK_RCAR_X5H_4_31_CRIT_CLOCKS					\
+	({								\
+		switch (clk_id) {					\
+		case 464:	/* MDLC_INTAP0 */			\
+		case 494:	/* MDLC_APRTMGINT0 */			\
+		case 836:	/* CLK_ZD_APU0 */			\
+			return -EPERM;					\
+		}							\
+	})
+
 static int scmi_clock_enable(const struct scmi_protocol_handle *ph, u32 clk_id,
 			     bool atomic)
 {
@@ -950,6 +970,9 @@ static int scmi_clock_disable(const struct scmi_protocol_handle *ph, u32 clk_id,
 	if (clk->state_ctrl_forbidden)
 		return -EACCES;
 
+	SCMI_QUIRK(clock_rcar_x5h_4_28_crit_clocks, QUIRK_RCAR_X5H_4_28_CRIT_CLOCKS);
+	SCMI_QUIRK(clock_rcar_x5h_4_31_crit_clocks, QUIRK_RCAR_X5H_4_31_CRIT_CLOCKS);
+
 	return ci->clock_config_set(ph, clk_id, CLK_STATE_DISABLE,
 				    NULL_OEM_TYPE, 0, atomic);
 }
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index e27c21b14220ab5f..4ca6d06f85ebc7b2 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -173,6 +173,10 @@ struct scmi_quirk {
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000-",
 		  "renesas,r8a78000");
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_4_28_crit_clocks, "Renesas", NULL, "0x10a0000",
+		  "renesas,r8a78000");
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_4_31_crit_clocks, "Renesas", NULL,
+		  "0x10d0000-0x10e0000", "renesas,r8a78000");
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
 		  "0x10a0000-0x10e0000", "renesas,r8a78000");
@@ -186,6 +190,8 @@ DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_4_28_crit_clocks),
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_4_31_crit_clocks),
 	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	__DECLARE_SCMI_QUIRK_ENTRY(power_rcar_x5h_4_28_bad_domains),
 	NULL
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 67818b6cf0909f8e..56adb5fa87de0127 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -48,6 +48,8 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_4_28_crit_clocks);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_4_31_crit_clocks);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
 DECLARE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains);
 
-- 
2.43.0


