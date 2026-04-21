Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE0CF94CA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyQbcLOBKrREu8Uj+N0XNTrRdJ1Trc5MZpMrQM+ltjU=; b=W6AJTkJdmBwW7URodjye1hKdOh
	XYJVmMNzn52OJaaNKMxrfV7doGXeOdqM+MRyLsGElA2TXLkNiWc3WGybcFwLNVNJSgD/x8XDhOZ1y
	xYT3qI2DDvC8yangUwxkUHfqc4YDp9eV+R4WkeBfPgjkFhKTF+SrrBixFwZvPqjB2UIz0Zcb4pS+n
	fjva9PwAgT8l5kNoIvs3XJDEdRvZr961lt7saX7+GplIG5TiuJY33nJj61dItfxw27ltSXn5P/Qim
	SX44EKwP739g8x8o2oH9U4S9zAoB+QXxVa0PAVv6fQuTeZ4XnRKuMh6idYnigNK98adrdYT2jTpck
	DdeCxaZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFZv-000000090f2-0Gp3;
	Tue, 21 Apr 2026 18:12:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFZs-000000090eU-0Gy3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:12:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C458740A66;
	Tue, 21 Apr 2026 18:12:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FABC2BCB4;
	Tue, 21 Apr 2026 18:11:57 +0000 (UTC)
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
Subject: [PATCH/RFC 01/14] firmware: arm_scmi: quirk: Handle bad power domains on R-Car X5H
Date: Tue, 21 Apr 2026 20:11:34 +0200
Message-ID: <393522103906f8b2a6311c13c7c793bdcebbc96c.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_111204_144395_6CB09203 
X-CRM114-Status: GOOD (  16.91  )
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
few power domains that crash the system when touched or powered off.
Add a quirk to prevent such crashes.

As the SCMI power domain IDs are identical for all three versions, the
quirk can be shared.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Preventing power off could be handled in the MDLC driver, but no-touch
cannot.
---
 drivers/firmware/arm_scmi/power.c  | 20 ++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.c |  3 +++
 drivers/firmware/arm_scmi/quirks.h |  1 +
 3 files changed, 24 insertions(+)

diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index bb5062ab8280e02b..81b9035aa5a2eafe 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -12,6 +12,7 @@
 
 #include "protocols.h"
 #include "notify.h"
+#include "quirks.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30001
@@ -150,6 +151,23 @@ scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+#define QUIRK_RCAR_X5H_4_28_BAD_DOMAINS					\
+	({								\
+		switch (domain) {					\
+		/* Do not touch */					\
+		case 29:	/* PD_RC08 */				\
+		case 92:	/* PD_ACL0 */				\
+		case 116:	/* PD_CMN */				\
+			return -EPERM;					\
+									\
+		/* Do not power off */					\
+		case 76:	/* PD_AC00 */				\
+			if (state == SCMI_POWER_STATE_GENERIC_OFF)	\
+				return -EPERM;				\
+			break;						\
+		}							\
+	})
+
 static int scmi_power_state_set(const struct scmi_protocol_handle *ph,
 				u32 domain, u32 state)
 {
@@ -157,6 +175,8 @@ static int scmi_power_state_set(const struct scmi_protocol_handle *ph,
 	struct scmi_xfer *t;
 	struct scmi_power_set_state *st;
 
+	SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, QUIRK_RCAR_X5H_4_28_BAD_DOMAINS);
+
 	ret = ph->xops->xfer_get_init(ph, POWER_STATE_SET, sizeof(*st), 0, &t);
 	if (ret)
 		return ret;
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 2b38ba3f59a13c9e..c1a2f58505c1a757 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -172,6 +172,8 @@ struct scmi_quirk {
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
+DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
+		  "0x10a0000-0x10e0000", "renesas,r8a78000");
 
 /*
  * Quirks Pointers Array
@@ -182,6 +184,7 @@ DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
+	__DECLARE_SCMI_QUIRK_ENTRY(power_rcar_x5h_4_28_bad_domains),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index d8ba60b956522d04..108c8d11f6043a61 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -48,5 +48,6 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+DECLARE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains);
 
 #endif /* _SCMI_QUIRKS_H */
-- 
2.43.0


