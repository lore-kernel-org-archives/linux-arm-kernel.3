Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21A35C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qc3aItDznK9eNLgbGrQcjkgrtgUZI6baFp+cJdIi190=; b=l0mJ0pZA4Y6MKFk1qLTY55vX6m
	jlviqxPMT1fC8E2PKTQr6n9Dsb1htJZnIOfQKeB/qC4ZD+OxiRxoFYd+L7twcoucT9kL9Q76UWho+
	w7rcmuLtUehpCKlgp81TGy5NTq+L+TY7X8IetBLxi9ebxr58jQ+3czZJgo5ogS/iu8bZ6QHTfTQSe
	2Si6h56Fh4Mu7FG/NRxQNUhKFSjBN9dvLNeCFu0OMglyeuv08WCTWZ7WqE5DHv7xgK8WrVtBNlhsH
	KS0bKjwx1IUMQ/l4id1u9GBfL1RB6dH3dBtILtL04gbOMHxVD1PwJbVgB8eTNbOnhtFiWXvH38Ssl
	znueQgDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLk-00000006cWf-47Ii;
	Mon, 07 Sep 2026 11:17:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLh-00000006cV9-0QK7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:17:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An8jp3350140
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 11:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qc3aItDznK9
	eNLgbGrQcjkgrtgUZI6baFp+cJdIi190=; b=KM9RgnRBoCz1wPP+BQZ1Q5Oq01+
	RazZJXqBUbpn5yUGvYC9zTiaV4Ln2eMHYutAomBj2tloDuWuxISBPUV3Ls+Nq3br
	GbRtdq36E7Pb9RDcD55E4DHZyDyn34bSkKRA0zaJk0o7lcdU003o+ao3yuQSPKlY
	RBdDij03LCuY5qN2arSlWCu94glqp7clD8AX3H5fvientMxrpUlNAu7XQUiHVJbX
	LSy7GZ0uJEoT17p+hDR7s1ZxpVlSk10N2ELjx+d5YnPJl/Da/XEydLDF4usR0nUw
	PktKGkG2CAQpREwx8hqshIxxG5c+lNT7wEybQOOGsNppayk6r4XLGHyU9zA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0gm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:17:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6751db2792dso389041137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779835; x=1789384635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qc3aItDznK9eNLgbGrQcjkgrtgUZI6baFp+cJdIi190=;
        b=aHu6tpzW3MLXzHOUpA2EDPCA2TPykStR/yF438W1lQbmptgRZdERA3kwh7lGsAeK7Q
         /VuIGey2uDy01fLVephmJ8PKCHQCC31PnQce52SoRBF5cvoY284c+NPWX7K/RWNoDbfo
         k6Gc5njMCTRL9+J9Pb9Pq4Y8uBoFl0alC/dLjFoRqBcOstMQLX3diVju+c3kc2xURX45
         7foUwtfMdCSb1J1zeAG9sMMAa5z8gQfounSHWsdZiJ/wTWfyjhTpUrZPvcJxf5/oKjUu
         PJdo3XbxyV8eFpEIkw0nYe4jyZlay5YJSl7EXnniINWesCPSdwPFkyDSLkjcGacfxIcL
         OKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779835; x=1789384635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qc3aItDznK9eNLgbGrQcjkgrtgUZI6baFp+cJdIi190=;
        b=TAb5priipSVBiWA6C+1rr0m5qP4jOB/YNd7hYDqZZvyX4G2yvD6HrDeDTXvQ7T353l
         RSnlr5INZpZhb+GIe1oXlUHdpw06RfbFCS0KWO0lsZj/5HPgUAPuVjr8Ao69h9IyBIh8
         soMDvB2zESnEsd2IXKd1J92PvtXfjaSSGbjUvgW6uyYrcrpAfqcKcqf9dsirputz0H5O
         39OgGFQJf7NNoFbt/d2HtzZOPJ6Hf6NVSL9+VffmzwmdqZlg+GoBGkdX+UdkIadDITlZ
         theLRIhYTwVbgAS8PthO/C9ATq5YH+sapFMpaE15/rY4yRwXXkQvEYJukCIDzFMckOYs
         5Meg==
X-Forwarded-Encrypted: i=1; AKwUvBxS1NkGa9LgKQbzlmJiPXr1IbEERYepO5Xq7KKJ7WvsGrfIx+N3kpY7kuMAU11mJU5BjIF3Yl24d8GtnC3I/qWn@lists.infradead.org
X-Gm-Message-State: AFuF++mm/X6Iot9oGhGxopo8bLZUZB7QGcvQtlJ9bIUKFtxjmrpn+h3I
	sTyYi07Ia9zkmcibBL1ZOvfvrdICiR0bF0JLguRAnftJ6benVG/XzozjsMLkwrE5bQS/zv5Mibr
	RNGVbjRnYzNk4iMp0YYKEOYNQ783W5SR85dbcA6yskcv6VDSN5h0dnBV5Cfm4LZ+Yaw5Dx0aNVG
	0cIQ==
X-Gm-Gg: AYBFou2iporwajHEtkmtYRyGCRLy8dp8mj9t+wttRXK4bAFy3ZCl50BMg43THpqvkIg
	1zn2UX0CKMn0VJG1BmZnP/wtOfWeI/kvKjgDfaKOe8zc5n/9L4VZ7hnLN1aiMACAZSKHYoowIXO
	zYvSsdANyUqWGYxJ2mnDOBYgbD9mef/OQDnUAfudYoT1+V2V237auVw//5fF0z18v5RmNVT/ShZ
	I3FC0hA14E42vPM3p80GMCPhcyJfoyhlkYVaa4c8YtiT7UymGt5ZQcqUtEdnbJ/2Kl4uvDzk6W5
	zY5fC6mwEzwMUsdkq5wpsFg8+MSrRY/NWpLOedupHSJOJzrPPwY99Ixax7XTz+1GGCImXwnt1OH
	GNAQg/XriNdN6hmEdX/Z4Nb6QKukNpMmJLVgiQCBgLiqFB2YOZ1znJH8r3w==
X-Received: by 2002:a05:6102:5814:b0:786:b28e:f980 with SMTP id ada2fe7eead31-78a4a99f7c6mr7574444137.10.1788779835451;
        Mon, 07 Sep 2026 04:17:15 -0700 (PDT)
X-Received: by 2002:a05:6102:5814:b0:786:b28e:f980 with SMTP id ada2fe7eead31-78a4a99f7c6mr7574414137.10.1788779834862;
        Mon, 07 Sep 2026 04:17:14 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:13 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
Date: Mon,  7 Sep 2026 13:16:52 +0200
Message-ID: <20260907111659.263324-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e9d3c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=u8BtVuMVLpZXKRMe:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=VqZmVlX21PZHT1he1CgA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: Q8_ITExr1TuJxxtmqR6PUdG4RmnABV-f
X-Proofpoint-ORIG-GUID: Q8_ITExr1TuJxxtmqR6PUdG4RmnABV-f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX8/x3DOA5+mv1
 vjwHF+YQ2mK5+HoUUbmb/qfajolFYKpz0lIaH5AqHU9IkDVy7yaPtHBnkjsyDoFZN9QHwgOwmBf
 f0iOo7gvNotxwEoOg6scjczZE6oIrLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX6Q3UQryjKGwb
 5DNdgkCaUZesVt6AyZeBjX91otTF7RJq8+z57qdeuJhs+M3PFpIHNM7c85YqimXgqx32gXrmEAJ
 MOqSUI0Id71Sf3abyQH5gtLlKlOTEEsB2a4bxY3StWeDZyUJi/tJxIZlsIJru7XJKqhqnTufIsQ
 t/OPOClgcxjWc8DlXTtad38AInBDooFWtl4GAdong0iMOH/dVkycHUU3m2KmUKabQxnNpjpImkf
 dZFKrAAdeKqCjDeVr5lHX5CmEOZB+ZbazYwPkjIdNytznn/8XsR4SyZqOEd0uJAYVhVDJebz2eQ
 RUvgQczbvN1Kg6vyAnY3XigsAwoYSWNm6IzxRWPXwtUFD8pl26Ym2hwRVhdz3Xdw8tRYWGknKti
 Up4xxttoonEouDxcraB+8sp+AA4dPx+kllxM55nUyPTcSw6RW+mkR0VBihqAotMLXvQpzVzgK9n
 Yi9j+ZhsKj2UtI24o2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_041717_158214_4C112DCC 
X-CRM114-Status: GOOD (  33.86  )
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
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- Moved to atomic polling, pointed out by Dhruva.

Changes in v2:
	- Rename a function according to Abel's suggestion.
---
 drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6abe8b198949..b62d4e544bc5 100644
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
@@ -1026,15 +1032,75 @@ static void genpd_power_off(struct generic_pm_domain *genpd, bool one_dev_on,
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
+	ret = readx_poll_timeout_atomic(genpd_status_on, genpd, is_on, is_on,
+					GENPD_CPU_ON_POLL_PERIOD_US,
+					GENPD_CPU_ON_TIMEOUT_US);
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
@@ -1042,6 +1108,10 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 	if (genpd_status_on_unlocked(genpd))
 		return 0;
 
+	/* Special case for a device attached to a CPU domain. */
+	if (genpd_need_alive_cpu(genpd, dev))
+		return genpd_wakeup_cpu(genpd);
+
 	/* Reflect over the entered idle-states residency for debugfs. */
 	genpd_reflect_residency(genpd);
 
@@ -1056,7 +1126,7 @@ static int genpd_power_on(struct generic_pm_domain *genpd, unsigned int depth)
 		genpd_sd_counter_inc(parent);
 
 		genpd_lock_nested(parent, depth + 1);
-		ret = genpd_power_on(parent, depth + 1);
+		ret = genpd_power_on(parent, dev, depth + 1);
 		genpd_unlock(parent);
 
 		if (ret) {
@@ -1306,7 +1376,7 @@ static int genpd_runtime_resume(struct device *dev)
 
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


