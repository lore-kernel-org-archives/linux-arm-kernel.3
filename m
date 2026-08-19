Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4A9C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feUNzhq5Dex7vlE9YWr3DimXFOMzSyfolhfBuwRnZkk=; b=3USmAkP+q7GI7tO0Cu1kh0G4Ri
	3YHjYLV8G9jr9mmcE1/6WetW0fDSAqw7bAqA4aMas53EH6IbsLGB4IVyvRr9fr4X91D/+IN+zQvP6
	1SunOIZtmpAFh/v7a7GawzcYSJ6tHDpAIxfDwTayYPo9ZuGM5uUum7IHcBuDkyf5ehi6Hdl3Dgwpy
	NkmuuDXJIbe0hFsw8kYUGqx4+rXkFVDK8BwqaMQyp3GaPf0VRJLuMO4874S+yubZhRsxp/6p/0DT9
	6Hb3p4Pj50/MW9/bUyHPLJz4t4PjZTtpJ/boH03Mm2lefFDtDJ4j6JNZDlUqKN1+R+rElq6hhNpuj
	AkgeSzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi0h-0000000A3Zm-38Ao;
	Wed, 19 Aug 2026 15:15:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwi0f-0000000A3YZ-1VJY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 15:15:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1ik0212239
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=feUNzhq5Dex
	7vlE9YWr3DimXFOMzSyfolhfBuwRnZkk=; b=JoqoNvOvpksv9Fcn60bfrQfGwL7
	oxctt78YzNZbdVLBTDB3UbHaYAeOvtuHbaY679K2Q9V325HeKhxsnIBxOJ9IH/Nc
	1VoDD0vYDS5/vg3YKU8f4mKMHg//Nzv614HV8FXuw3WDmJLrKb/s7WoZ+rWnAh/K
	ykS1qBgtwK282xtJ8cbOcsKajWSzO3XXCMGmMmh/i6U7kYFJE0SO1ET19LmhoiWC
	2sMs6N06PBQaPDtdy2V5trYESPKVO7PRvcRC2CWzaxYjRs0fmNDGx40z026TWTek
	5Stkvgba5J5DsT8RxY3+lUgd9XgpKb0AZSm8+AgREUs4DbGmTXma6V8IX/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es4g26t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:15:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9349c5af52bso196299685a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 08:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152520; x=1787757320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=feUNzhq5Dex7vlE9YWr3DimXFOMzSyfolhfBuwRnZkk=;
        b=JtvRdQLK+HM/HovGGE1A5EzEJHILvgQcfzXmiWVkJdnC1nnHVXSiz2JfA1Bj5uV0mr
         DMdjuRjsiqwgMu4UXC+607nkVjFsBaHVB3gdatxWSAok/Yici+LZ+/8B0MGMNGSUkF3U
         shPCOyKmwUJWU0NiXF6VShcdcY1xuKK1nhyTrm0np9tzuU7XlCmScqyFDtxsKbDy0zE/
         KX9Aj3S5H/gAWaTB9+uekiJAxO8Vo3Q6DTEv3979EZgVrLQwKavESAiCaxEy3MZy9pp9
         2+fGazNVuexHHK9JQs9ggxOk52plM94NyBeBl1ZEko+MiR5/tOhI1ikE1mSXT7EDOP2P
         kyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152520; x=1787757320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=feUNzhq5Dex7vlE9YWr3DimXFOMzSyfolhfBuwRnZkk=;
        b=GkahkJlMCRs5v53wlEze/kcfEEx1EZ+1FPBeqVC94F4T1O2cqyJAv8WnGCZOzRhcjv
         E5MM/eH9yZ5OOhJ5YhFIdKbm4vbZC9WmuGvG+IArNkSlxsSCCTNY3DbZfPQfEzOyjQTX
         yijt19fsy2K0yyvLtTuSMMcrgyO53HubY+1bC21s/0ngVhr1h2ll4C4MeVxmWIZSjqfC
         pxP+ktiGJAah9O+YxNl+MvQXlFojgxpDWC0hulap4vRcDM5umZor5bGK5iTNzSbJRsx0
         pOpweu0JGS3LJOTUifchtpJDr9kJ3LxKHT5qk8BjAQLfF6YKdsTOwSMbseVnK7HoQpnU
         wOsg==
X-Forwarded-Encrypted: i=1; AHgh+Rorsukk0G3Amdd+EWPjeG0lKkW0F8BMoOjoKvCZBsqNA1bUga+oaOz/j7T08FP+9MmKetXFEb3IX34ATOkZNpDW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+0CdI29zckEGjhwqelLI7nK2IoRcxdgqfqHFCMfOOcc83cqFP
	S0lk5R8WHE9EahXQ5j0YzzJpb6ngioTBei+2fRq4jBhsqv09u3lJTI1CddKeGJ4OtEAGlB9AXOW
	yUd7viA5we1hR/RJ65WANK5MKfmHIkKvX6OfpI4tWDjDupBXYXhvoBvNkdUsoHWXa7jYNa/oiPE
	/bkg==
X-Gm-Gg: AR+sD10tRJozT4DN6xiDtZ6HfSpdHqGtnz7kRy8BQBmeYm7QUAQYzxgEOK0NcrXYsPC
	+wvYjyjIH7BgRM8uh3G6pvdIc2PaZfA2qH2hKNOJcPbR39v9QuqocKAujBxNZ4fD766gmni6ApH
	Q5y2w5HqpodFSbLfpB3hDqy991jmaaLv6haucSXGrVhTpjEMTdVfrZfZa498KDDPUkfY4YnD2aZ
	+3WCMCPWhJYYRMokqOJFztKTHjLT4W463NkZcFZClbmYCshxKEm16RVjx4OOM5QbiiuTSHiqbo9
	U8Vj3pd+OT9jUYb5YPkCgrUD1E/yKN2fgK1v800qSIP5fmkDpdGa5jVx0Lxl0oNadhWTpgOmgwc
	aYgcYvYevUDBqkBNx++rX0kSKlaIYJTWXPKMdCibWvTuVLCyktlFKQ0l+kQ==
X-Received: by 2002:a05:620a:608d:b0:937:65d:d89e with SMTP id af79cd13be357-9371e1dd574mr581278885a.3.1787152519553;
        Wed, 19 Aug 2026 08:15:19 -0700 (PDT)
X-Received: by 2002:a05:620a:608d:b0:937:65d:d89e with SMTP id af79cd13be357-9371e1dd574mr581268685a.3.1787152519023;
        Wed, 19 Aug 2026 08:15:19 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c4ac06asm94124666b.33.2026.08.19.08.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:15:14 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>
Subject: [RFC PATCH 1/3] pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
Date: Wed, 19 Aug 2026 17:14:51 +0200
Message-ID: <20260819151457.256959-2-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
References: <20260819151457.256959-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FJxZ6Ha-UWixpaqqAgB6l5XTX4-DyfVY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX4RnpRI0XB8UT
 sMWxrQuUYKtxePRhEUYLinuSwzTg8aPPAN5+PLobo0Bjva9cr752lWl2ib+QAnL6U7Jav5PciGc
 TxGIoGiPsd74OJ2Q8cbbYWwcXd5vwvjrrG1gsa0NyU986BqHcZkjRtSfHKYQGsYtiSsNHeRnTNk
 vcEaDUV1900/bImizqts0OLPUBj0FwPLkdauJxz8coITpba8+wtflzM3/6ys7oS/jPuhl1dm6bI
 2YCeYePFhcAh5i76XOn8icnSVEclWj88lGl0kd7M989eXDZvJ4O2kcGqEw0g3zQ9h7csQI5g9CX
 RI5dHTqJwnMIIUSHJHpQjF1WE1vjD8bmgR7rzbscu7teNDvUGU+0DeVqpiUp9OVLiphvi652Q1J
 0AlbUzoshq+d3STsSuLjzZAlvjx0xi3tVG8f9jCAErUcFjEVVlaDVLmt1AP+djdmt2EdnR6yP/C
 bn2ABrx5z56IjOP5iDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX4jtFk6NCIID7
 cis6mm6uoyeYWOcY+/KVTH8uIL2WbZW9YVRHI2BlfeIp0xaJ/Kg2B9OTlUsOlVSzWbrsu2OdNfa
 jK+sIqmkeRl73/WjMzEDYyG3XhJ9E2U=
X-Authority-Analysis: v=2.4 cv=CN8amxrD c=1 sm=1 tr=0 ts=6a85c888 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=u8BtVuMVLpZXKRMe:21 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=VqZmVlX21PZHT1he1CgA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FJxZ6Ha-UWixpaqqAgB6l5XTX4-DyfVY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_081521_536601_BACC57BC 
X-CRM114-Status: GOOD (  33.48  )
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

From: Ulf Hansson <ulfh@kernel.org>

A driver for a non-CPU device that is attached to a CPU PM domain (the
genpd has the GENPD_FLAG_CPU_DOMAIN configuration set), is currently not
able to power on the PM domain. More precisely, to power on a CPU PM domain
one of its corresponding CPUs needs to be woken up if they are idle.

The current support for a non-CPU device is that its driver can only
prevent an already powered on CPU PM domain from being powered off. This
leads to problems for a driver while probing its device or when it needs to
call pm_runtime_get_sync() to turn on the power for it. From the driver
point of view it looks like it all works fine, but when accessing the
device it may end up with various errors as the device may not be fully
powered on.

To fix the behavior for these types of devices, let's adjust the behaviour
in genpd_power_on() to wake up an idle CPU that belongs to it, in cases
when it's needed.

Link: https://lore.kernel.org/all/CAPx+jO-sCierYj8jnoKQHckJG16dOBxnNrsZVYO=38R2cLV8nw@mail.gmail.com/
Signed-off-by: Ulf Hansson <ulfh@kernel.org>
---
 drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..7345c06f1d55 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -10,6 +10,7 @@
 #include <linux/idr.h>
 #include <linux/kernel.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/platform_device.h>
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
@@ -19,11 +20,14 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/sched.h>
+#include <linux/smp.h>
 #include <linux/suspend.h>
 #include <linux/export.h>
 #include <linux/cpu.h>
 #include <linux/debugfs.h>
 
+#include <trace/events/ipi.h>
+
 /* Provides a unique ID for each genpd device */
 static DEFINE_IDA(genpd_ida);
 
@@ -32,7 +36,9 @@ static const struct bus_type genpd_provider_bus_type = {
 	.name		= "genpd_provider",
 };
 
-#define GENPD_RETRY_MAX_MS	250		/* Approximate */
+#define GENPD_RETRY_MAX_MS		250		/* Approximate */
+#define GENPD_CPU_ON_POLL_PERIOD_US	100		/* 100us */
+#define GENPD_CPU_ON_TIMEOUT_US		5000000		/* 5s */
 
 #define GENPD_DEV_CALLBACK(genpd, type, callback, dev)		\
 ({								\
@@ -1027,15 +1033,75 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
 	}
 }
 
+static bool genpd_check_status_on(struct generic_pm_domain *genpd)
+{
+	bool is_on;
+
+	genpd_lock(genpd);
+	is_on = genpd_status_on(genpd);
+	genpd_unlock(genpd);
+
+	return is_on;
+}
+
+static int genpd_wakeup_cpu(struct generic_pm_domain *genpd)
+{
+	unsigned int cpu;
+	bool is_on;
+	int ret;
+
+	/* Find the first online CPU in the genpd's cpumask. */
+	cpu = cpumask_first_and(genpd->cpus, cpu_online_mask);
+	if (cpu >= nr_cpu_ids)
+		return -EAGAIN;
+
+	genpd_unlock(genpd);
+
+	/* Send a IPI to wakeup the selected CPU. */
+	smp_send_reschedule(cpu);
+
+	/* Poll to wait for it to complete the power on sequence. */
+	ret = readx_poll_timeout(genpd_check_status_on, genpd, is_on, is_on,
+				 GENPD_CPU_ON_POLL_PERIOD_US,
+				 GENPD_CPU_ON_TIMEOUT_US);
+
+	genpd_lock(genpd);
+
+	/* Re-check the status as we have released the lock in between. */
+	if (ret || !genpd_status_on(genpd))
+		return -EAGAIN;
+
+	return 0;
+}
+
+static bool genpd_need_alive_cpu(struct generic_pm_domain *genpd,
+				 struct device *dev)
+{
+	if (!genpd_is_cpu_domain(genpd))
+		return false;
+
+	/* This is not for CPU devices as those are managed differently. */
+	if (to_gpd_data(dev->power.subsys_data->domain_data)->cpu >= 0)
+		return false;
+
+	/*
+	 * If the current CPU doesn't belong to the genpd's cpumask, we need to
+	 * wake up one of those idle CPUs to power on the CPU domain correctly.
+	 */
+	return !cpumask_test_cpu(smp_processor_id(), genpd->cpus);
+}
+
 /**
  * genpd_power_on - Restore power to a given PM domain and its parents.
  * @genpd: PM domain to power up.
+ * @dev: The device that needs the PM domain to power on.
  * @depth: nesting count for lockdep.
  *
  * Restore power to @genpd and all of its parents so that it is possible to
  * resume a device belonging to it.
  */
-static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
+static int genpd_power_on(struct generic_pm_domain *genpd, struct device *dev,
+			  unsigned int depth)
 {
 	struct gpd_link *link;
 	int ret = 0;
@@ -1043,6 +1109,10 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	if (genpd_status_on(genpd))
 		return 0;
 
+	/* Special case for a device attached to a CPU domain. */
+	if (genpd_need_alive_cpu(genpd, dev))
+		return genpd_wakeup_cpu(genpd);
+
 	/* Reflect over the entered idle-states residency for debugfs. */
 	genpd_reflect_residency(genpd);
 
@@ -1057,7 +1127,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 		genpd_sd_counter_inc(parent);
 
 		genpd_lock_nested(parent, depth + 1);
-		ret = genpd_power_on(parent, depth + 1);
+		ret = genpd_power_on(parent, dev, depth + 1);
 		genpd_unlock(parent);
 
 		if (ret) {
@@ -1307,7 +1377,7 @@ static int genpd_runtime_resume(struct device *dev)
 
 	genpd_lock(genpd);
 	genpd_restore_performance_state(dev, gpd_data->rpm_pstate);
-	ret = genpd_power_on(genpd, 0);
+	ret = genpd_power_on(genpd, dev, 0);
 	genpd_unlock(genpd);
 
 	if (ret)
@@ -3410,7 +3480,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 
 	if (power_on) {
 		genpd_lock(pd);
-		ret = genpd_power_on(pd, 0);
+		ret = genpd_power_on(pd, dev, 0);
 		genpd_unlock(pd);
 	}
 
-- 
2.43.0


