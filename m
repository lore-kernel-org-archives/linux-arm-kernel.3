Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7D9F94CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KF1EIw6zuGUGiTw7gdswP6hvpUu984ej2BPM3eH7lCo=; b=ifZEvDuMfXjj+Ct+SwuBn3sXcD
	F5o755B60kR6D6C6iKoCffserP18z38NpHT2VTbNy63UKX912QtmO+5pc2fjczcWO5/6KdLEVspeT
	v+VHkw1PiWJO+GOAG8FUo3TnED50f6i1si7eKlzbORw0FcuDHFvq2xmNeknwItpn40rTwCbEime5c
	sCpAhIko7ubPrROpSe2Us58wjCFzrwqyItAOnjOvgcepM9Ec4Mz0fJMk0Ij6t6rav/SUSl7/AAp78
	fmYbmUDkhi7MautnwXzJLQF/eve6LRpB/OMlUfLQlzWbRIgBrhppu2rZ841W4fke/Q4f8hqrV5XBT
	QZlNisMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFZy-000000090g6-1T7I;
	Tue, 21 Apr 2026 18:12:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFZw-000000090fP-271G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB1F74091E;
	Tue, 21 Apr 2026 18:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18295C2BCB0;
	Tue, 21 Apr 2026 18:12:02 +0000 (UTC)
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
Subject: [PATCH/RFC 02/14] firmware: arm_scmi: quirk: Handle bad clocks on R-Car X5H
Date: Tue, 21 Apr 2026 20:11:35 +0200
Message-ID: <24bea8791a53e6c969ef97b506cfec25054099c8.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_111208_586600_8CB50A48 
X-CRM114-Status: GOOD (  15.00  )
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

Renesas R-Car X5H SCP FW SDKv4.28.0, v4.31.0, and v4.32.0 expose a few
clocks that do not support the CLOCK_ATTRIBUTES or CLOCK_DESCRIBE_RATES
command.  Since commit 0d8b0c8068a8ff5f ("firmware: arm_scmi: Harden
clock protocol initialization") in scmi/for-linux-next (next-20260319
and later), scmi_clock_attributes_get() or
scmi_clock_describe_rates_get() failures are no longer ignored, but
prevent the SCMI clock driver from initializing.

Hence add a quirk to ignore such failures, like before.  As the quirk
handling is harmless for unaffected systems, make it generic for all
R-Car X5H systems using SCP FW SDKv4.28.0 or later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/clock.c  | 14 ++++++++++++++
 drivers/firmware/arm_scmi/quirks.c |  3 +++
 drivers/firmware/arm_scmi/quirks.h |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ce6f968925af38c0..d530882a0bac88c3 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1232,6 +1232,18 @@ static const struct scmi_protocol_events clk_protocol_events = {
 	.num_events = ARRAY_SIZE(clk_events),
 };
 
+#define QUIRK_RCAR_X5H_NO_ATTRIBUTES					\
+	({								\
+		if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)		\
+			continue;					\
+	})
+
+#define QUIRK_RCAR_X5H_NO_RATES						\
+	({								\
+		if (ret == -EOPNOTSUPP)					\
+			ret = 0;					\
+	})
+
 static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int clkid, ret;
@@ -1256,10 +1268,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
 		cinfo->clkds[clkid].id = clkid;
 		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
+		SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);
 		if (ret)
 			return ret;
 
 		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
+		SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_RATES);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index c1a2f58505c1a757..e27c21b14220ab5f 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -171,6 +171,8 @@ struct scmi_quirk {
 
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000-",
+		  "renesas,r8a78000");
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
 		  "0x10a0000-0x10e0000", "renesas,r8a78000");
@@ -183,6 +185,7 @@ DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
 	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	__DECLARE_SCMI_QUIRK_ENTRY(power_rcar_x5h_4_28_bad_domains),
 	NULL
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 108c8d11f6043a61..67818b6cf0909f8e 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -47,6 +47,7 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
 DECLARE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains);
 
-- 
2.43.0


