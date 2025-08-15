Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C19BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dCHpsPzt3N871lYTqD8K0ojQdoAKHiNwK+1vPLjHO0=; b=vb9og8ZkET0R1bKN2ujiAf52pq
	mHnuya+8Gbw0X8AUyMuloAxXdB+dbh9ds9ZSJ9+TK4YA9MurgDemQDi5dl9kZwUpCg7VeNTi6GTay
	Whygdmvjl9LUzIgQflVMXS6o6RYJXB51sEqiElQr/3PLu4asNI30U/CY/QjOC59tCaa4JQ1KN9ezJ
	fdvKIlrRdaozlcdI3Tc2RVsJ5NWZoWB/7Q2hHqBiCw9TzhbgTd1vHwxC5qFsZX0XNPq+ODPCcPadB
	4O9JbbL2h8xCBtcucjB0XBr6KfzYDsUTHf1GK7zDvX+8/yWYTQydYnx1krSoduiQIA8uhN1LGzeEh
	gP8KgOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuMo-00000002ZmT-4AWP;
	Fri, 15 Aug 2025 13:21:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrfF-00000002Cvz-3u5B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 10:28:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 561341EA6;
	Fri, 15 Aug 2025 03:27:53 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94F563F738;
	Fri, 15 Aug 2025 03:27:58 -0700 (PDT)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	johan+linaro@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	quic_mdtipton@quicinc.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 2/2] [NOT_FOR_UPSTREAM] cpufreq: scmi: Add quirk to disable checks in scmi_dev_used_by_cpus()
Date: Fri, 15 Aug 2025 11:27:36 +0100
Message-ID: <20250815102736.81450-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815102736.81450-1-cristian.marussi@arm.com>
References: <20250815102736.81450-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_032802_097158_1CF7BA15 
X-CRM114-Status: GOOD (  14.25  )
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

From: Florian Fainelli <florian.fainelli@broadcom.com>

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
[Cristian: Moved quirk directly into scmi_dev_used_by_cpus]
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

----
@Florian: I reworked this minimally to avoid the global as I was mentioning.
No change around the version match either...so the NOT_FOR_UPSTREAM tag.
(also the if (true) i smaybe a bit idiotic...)
Please check if it is fine and modify as you see fit.
---
 drivers/cpufreq/scmi-cpufreq.c     | 9 +++++++++
 drivers/firmware/arm_scmi/quirks.c | 2 ++
 include/linux/scmi_quirks.h        | 1 +
 3 files changed, 12 insertions(+)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index ef078426bfd5..9b7cbc4e87d9 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -19,6 +19,7 @@
 #include <linux/pm_qos.h>
 #include <linux/slab.h>
 #include <linux/scmi_protocol.h>
+#include <linux/scmi_quirks.h>
 #include <linux/types.h>
 #include <linux/units.h>
 
@@ -393,6 +394,12 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
 	.set_boost	= cpufreq_boost_set_sw,
 };
 
+#define QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS			\
+	({							\
+		if (true)					\
+			return true;				\
+	})
+
 static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
 {
 	struct device_node *scmi_np = dev_of_node(scmi_dev);
@@ -400,6 +407,8 @@ static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
 	struct device *cpu_dev;
 	int cpu, idx;
 
+	SCMI_QUIRK(scmi_cpufreq_no_check_dt_props, QUIRK_SCMI_CPUFREQ_CHECK_DT_PROPS);
+
 	if (!scmi_np)
 		return false;
 
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
 
diff --git a/include/linux/scmi_quirks.h b/include/linux/scmi_quirks.h
index 11657bd91ffc..ee72a5f6e885 100644
--- a/include/linux/scmi_quirks.h
+++ b/include/linux/scmi_quirks.h
@@ -40,5 +40,6 @@
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+DECLARE_SCMI_QUIRK(scmi_cpufreq_no_check_dt_props);
 
 #endif /* _SCMI_QUIRKS_H */
-- 
2.50.1


