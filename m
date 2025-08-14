Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF388CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 00:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4pFVfRVNOwf2+FlMJlDWYO4U/oV/9E6WbnVyhCzLlg=; b=DSEIkoV9/FRJ1dNw8hR0/Uqf7i
	/EXL05tv8Y9h90dbQg065+DHx2KIzWNPyY4BQ9Mxwhr+RXsNypyu1ciIuJjSe/54yFItEDYTjQxfG
	VIo8j/e6OGJ8S5QNyym+esUAXqllmMAcwroymx4/4trvnrfmYiU69TzyUN2e+JofOMJ4h0JbcM48h
	zSRaUHZSuqJcVxw8h9NYf7D/vhSrTCQTgCiCdpiX9Csp4HDYvqd1NaAB8Gwa1bSU6JErq6R62s6ym
	Io4woPOGbK/P0VAOxTN8ecOxn/RpC9/daoE0Q7fAYPOhkuLJJnvwfiYN/HxbA72sNn+L0txrHIUAh
	yxBG0pqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umi1z-00000000qoY-3ADB;
	Fri, 15 Aug 2025 00:10:52 +0000
Received: from relay.smtp-ext.broadcom.com ([192.19.166.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umgo9-00000000j8t-1aZN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 22:52:30 +0000
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 72489C0429D7;
	Thu, 14 Aug 2025 15:52:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 72489C0429D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1755211947;
	bh=v6sq3o9BJiULKoiDIE8D7omTK29z5q2no/7JhhhhtSE=;
	h=From:To:Cc:Subject:Date:From;
	b=iS3nV2Tor4uJI2rBygWdOBNAsFghb0Lba6BXBA0lzogf80dA/ffrGS0zbGPawRcZq
	 H9hE9gqBeZaAEJSuEFa4195osXErq87OwVKOuFMSk+lIjVB0Sx3VtUo0sRuSaYGG+V
	 D42r13zVm4TtFOSXsskbXpH6qS8io1SkLTf3TFGs=
Received: from stbirv-lnx-1.igp.broadcom.net (stbirv-lnx-1.igp.broadcom.net [10.67.48.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 468901800051E;
	Thu, 14 Aug 2025 15:52:27 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: james.quinlan@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Mike Tipton <quic_mdtipton@quicinc.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] cpufreq: scmi: Add quirk to disable checks in scmi_dev_used_by_cpus()
Date: Thu, 14 Aug 2025 15:51:55 -0700
Message-Id: <20250814225155.3519000-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_155229_489595_48E3D965 
X-CRM114-Status: GOOD (  16.58  )
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

Broadcom STB platforms were early adopters of the SCMI framework and as
a result, not all deployed systems have a Device Tree entry where SCMI
protocol 0x13 (PERFORMANCE) is declared as a clock provider, nor are the
CPU Device Tree node(s) referencing protocol 0x13 as their clock
provider.

Leverage the quirks framework recently introduce to match on the
Broadcom SCMI vendor and in that case, disable the Device Tree
properties checks being done by scmi_dev_used_by_cpus().

Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
Fixes: 6c9bb8692272 ("cpufreq: scmi: Skip SCMI devices that aren't used by the CPUs")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/cpufreq/scmi-cpufreq.c     | 13 +++++++++++++
 drivers/firmware/arm_scmi/quirks.c |  2 ++
 drivers/firmware/arm_scmi/quirks.h |  1 +
 3 files changed, 16 insertions(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index ef078426bfd5..80647511d3c3 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -22,6 +22,8 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
+#include "../drivers/firmware/arm_scmi/quirks.h"
+
 struct scmi_data {
 	int domain_id;
 	int nr_opp;
@@ -34,6 +36,7 @@ struct scmi_data {
 static struct scmi_protocol_handle *ph;
 static const struct scmi_perf_proto_ops *perf_ops;
 static struct cpufreq_driver scmi_cpufreq_driver;
+static bool __maybe_unused scmi_cpufreq_dt_props_check_disable;
 
 static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
 {
@@ -400,6 +403,9 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
 	struct device *cpu_dev;
 	int cpu, idx;
 
+	if (scmi_cpufreq_dt_props_check_disable)
+		return true;
+
 	if (!scmi_np)
 		return false;
 
@@ -427,12 +433,19 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
 	return false;
 }
 
+#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS			\
+	({							\
+		scmi_cpufreq_dt_props_check_disable = true;	\
+	})
+
 static int scmi_cpufreq_probe(struct scmi_device *sdev)
 {
 	int ret;
 	struct device *dev = &sdev->dev;
 	const struct scmi_handle *handle;
 
+	SCMI_QUIRK(scmi_cpufreq_no_check_dt_props, QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS);
+
 	handle = sdev->handle;
 
 	if (!handle || !scmi_dev_used_by_cpus(dev))
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 03960aca3610..aafc7b4b3294 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -171,6 +171,7 @@ struct scmi_quirk {
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
+DEFINE_SCMI_QUIRK_EXPORTED(scmi_cpufreq_no_check_dt_props, "brcm-scmi", NULL, "0x2");
 
 /*
  * Quirks Pointers Array
@@ -181,6 +182,7 @@ DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
+	__DECLARE_SCMI_QUIRK_ENTRY(scmi_cpufreq_no_check_dt_props),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index a71fde85a527..64ac1f05d0d3 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -48,5 +48,6 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+DECLARE_SCMI_QUIRK(scmi_cpufreq_no_check_dt_props);
 
 #endif /* _SCMI_QUIRKS_H */
-- 
2.34.1


