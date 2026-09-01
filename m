Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE46C624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98Fq6YcblYcVHC9ni/bi/J3Yzy18g8RC1k8HtrB14fU=; b=ooYc2+CeWS6azRca/h1B3/CR47
	uv1KAb6jRBcq8JXer5MQHnRJ3I/hWzLmkrvxYHKHJ3qp+12EAzfIGYc8m7VJ2L01f44cyYo9XMdd2
	w7kxdJxn3fOAEVXKYmtkO4sqikJc8aK/6GFFTzUnH1OomomDFwcQ96SpKKWvIJtkEBDY7Vlo4p9eL
	65Q7V4lDg7vlxcv5ODzhIfa0xbrxiCAh9vmxIJp2FOMatI/zxWF3FfzLZBaBg96a8kTNX8ksnLScB
	m8ZbM4pcHEBxuVWZZLLhxx7887PUOOZTfTxwuKld0YXAmSnk2cd4ICHLHNfDKVgNsKHV9a2rQNKe8
	M9e8e+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MSA-0000000BfQG-0HaA;
	Tue, 01 Sep 2026 11:14:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1MS7-0000000BfOP-2ZWQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 11:14:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJb4c2406399
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 11:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=98Fq6YcblYc
	VHC9ni/bi/J3Yzy18g8RC1k8HtrB14fU=; b=SJGFh9OZhiz/0QoH0c2f2HKwU/x
	lYS5HrqEabxZvjso7GasuwwFTpiebMYavQJE517p9JrUdzPNJ+XN/XVB+yQWQcEO
	X2Un23StV5uJl4RrSgaQQ6y1UEJRT9DvuyVl0nPeOR/G/ElkcErfbO8VmWTz5klH
	e2COr5AxnR0UmnlrV7suUIxKUNxwxPMCy0Qx3x8m/Qx636haYbBc9B32IHV/hA+z
	uGsBHFxyQxgfva3vIieR7rpKRSQFb1ZKRldGmfCXyW0lzt5VmWD+FfDu/J9QyeTM
	Nh8IPAMAjtRxNgtoIJ2zezfiGeTPRQJKaoqcB3DFJpWN9Js9JI0MV48pK7w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r2071-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 11:14:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9394ad7f64aso195053185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 04:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788261294; x=1788866094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Fq6YcblYcVHC9ni/bi/J3Yzy18g8RC1k8HtrB14fU=;
        b=S0PsjEZlpk8e0TXLzdCTl3578MkWIzp1FV7ttDGg5IZm3LYWIgNf/471fgNYZtpeHW
         Y2uhS05i5c/d5ihKqvhzm8gMbRpV/vQTYM7kUgXavktZeOKfeYZqgUtpeAliQs1k/nX6
         6BypXakCf2inYxujerbcbxXHLaX1WW+4/S4K94kpX5gocqacsEelG2YU3j35uzp26rkL
         Vr0AvCVJH5YBuMIqM2d/WQARV0+XrnTdaIg9wQJGj/nViC33p44j/NsM4HQmL7eob8DR
         JHTix+38y9n6QsAi5NcZkuRVW0SKcEDa0R8VBkFRpGmT+mUMCDBLUj2XLNnoiv6v7550
         gz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788261294; x=1788866094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Fq6YcblYcVHC9ni/bi/J3Yzy18g8RC1k8HtrB14fU=;
        b=ds68YLuwDMqynk5AEXLFfSRUPuy7YVF6n5xfv0WwrgnRblN1Kjl8R4A8FsQ6SAnaBs
         DOfzAjVq6AsitecWH0Oun5GN2x2EuzQdtI5Q3cvw/sR3NT20AN9JQ15sb64FxKTQPRST
         2rQTHcOcKYr++f9jojgPX9Jj1fjy0JpDSXYUOt50ErgIdHLZdHGGiBjiwrQ20pnZBE43
         /QTwIBRo0ThXngh33MbAwUoHRCyxGB7zPNdepfPnMT7mhbiMHkecfNBep2P9vrSQAmoy
         UC27QBjApr8QnM3UkiV1vz+qg9NphjRLlu6RierUIH2IwohLC8lxxANjjbAzP+47NNVq
         5gQQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro9z3duxHoXTJPNxkldykIwmu27/oQekI9lhICCZ+AY5DasTe/tEg7gMKBF/ZBeDRfVdVJVN+03s7YKBzjckqrh@lists.infradead.org
X-Gm-Message-State: AFuF++nreKPgegk48QPL1W6t7wR6D3/s1HLSgDrdxzKlPtas9iO0t636
	y1kBN+UYiUvCz+8Cpg6m1Z4wB4XJ2g0l+ay+ihB3W/2goXsjv6ogdCOPFECtRG4DeW+tlE5Gs1W
	LMWFyiQO/abYziv7xbFGTv/zc8MaH/nrns//vfHGsk1DUrujTC2wHsa9I5+4BOpUn/6xdN7Bmo9
	bW3Q==
X-Gm-Gg: AR+sD1117r+f1Y6+NOcreaQYd44CpgpkF+Djkw3XdJ4/ALoRTN+54rOAApGt8IBcqpU
	MNTrMSkIQzaUldfPk35fCb3s9BnNgsyagvxzw4/dqRZO/uBr7rM5+VuLFIjks2rqD/Ya+swXzO4
	PMTeWu76bUWiyE0pI1z9ZQ7MUc6vXi71E6DRtpepWP500+eENq+CRIOc6wgXdBTSwpRnmhYwe/t
	n6K7VU5Py8jXVZ1ZYlA7mM7K1XGaFpv+MX3nbNDmnAYmn+t0Z1XaQXQ6Sgdu2Dct0HGQDqMpHwB
	RPraCPp2EvbzdWM3IoLIUkOJT6VKKKZW64L5TRsJZkuU+M51d4Sxbo/JQ/DTEaHQb5VCm1nx2uG
	DXUWIsZR7Obwbdnp08e4ZjZ9WO1uSlZbu975Xe0A+EJ9JmaVPBjvjMrfCGQ==
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr781222785a.8.1788261293804;
        Tue, 01 Sep 2026 04:14:53 -0700 (PDT)
X-Received: by 2002:a05:620a:a183:20b0:938:8ddb:5e9b with SMTP id af79cd13be357-93947f81d7fmr781217485a.8.1788261293273;
        Tue, 01 Sep 2026 04:14:53 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25878ba94csm380686366b.47.2026.09.01.04.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 04:14:52 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
Date: Tue,  1 Sep 2026 13:14:05 +0200
Message-ID: <20260901111441.122436-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a96b3ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=u8BtVuMVLpZXKRMe:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VqZmVlX21PZHT1he1CgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX5ilTqggtcdRD
 XesxTeBVAbp6WtKZWU+SzLxmkffC9G010kaJ+IU9AB4CBfr3oQhde4IKoejTXG9F8Efo5SmTVB+
 BGh8Kk4B6AQGxK6aA/L/Ybn5nBKpbZxLm1jB4Y7W7uqrZ4a5UZT0ZgPmKKNwEJMiidU37RRkFG2
 xUL+fNGr6KZsBX5TOHxfiMqiVmZRRAOjKs3pHHmu2fYXBaFqZtRZAKjp0ie+6NLQrcCRIlZuFVA
 3TafX6ddhmW18Wyw56JbVP5xa2BS3WPxUN2MQuLMbncDEtqaP+lmqJTYSHiL8mYuFtNG8PhdrPl
 tSFqMhHtF6YkdjkHlxmYypgPD6MX+r+BB4sYPaFdx3pToFbT0/RgKn/J6aGQPwe6RpDIGMqFo1z
 wR7/AzRWzV5A+2E32SZOKKiZmOn9KKWogYf9a+yLFoNVcwCHvOVrRmCbktk1LudLyDYGqGVZQu0
 Si64vlFNLj8/E/kPHjw==
X-Proofpoint-GUID: cMsXleSrjppWz_0SKUCVhu6zH7XbxU5P
X-Proofpoint-ORIG-GUID: cMsXleSrjppWz_0SKUCVhu6zH7XbxU5P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5OSBTYWx0ZWRfX9ex16IdPEU9z
 LmoUEQbb3Ki6wgZeRWDWxExiMcpNV4zI4ON+oOITOgl7y1u713c+RvexlY8Du0d1k8gaE3eq6cM
 h0Tkpur0PWqZh+/6tv4k6AVAK1RQSKc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_041455_777001_0885C24B 
X-CRM114-Status: GOOD (  34.57  )
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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v2:
	- Rename a function according to Abel's suggestion.

---
 drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6ac1ce18fda3..97273ed2f825 100644
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
 
+static bool genpd_status_on(struct generic_pm_domain *genpd)
+{
+	bool is_on;
+
+	genpd_lock(genpd);
+	is_on = genpd_status_on_unlocked(genpd);
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
+	ret = readx_poll_timeout(genpd_status_on, genpd, is_on, is_on,
+				 GENPD_CPU_ON_POLL_PERIOD_US,
+				 GENPD_CPU_ON_TIMEOUT_US);
+
+	genpd_lock(genpd);
+
+	/* Re-check the status as we have released the lock in between. */
+	if (ret || !genpd_status_on_unlocked(genpd))
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
 	if (genpd_status_on_unlocked(genpd))
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
@@ -3411,7 +3481,7 @@ static int __genpd_dev_pm_attach(struct device *dev, struct device *base_dev,
 
 	if (power_on) {
 		genpd_lock(pd);
-		ret = genpd_power_on(pd, 0);
+		ret = genpd_power_on(pd, dev, 0);
 		genpd_unlock(pd);
 	}
 
-- 
2.43.0


