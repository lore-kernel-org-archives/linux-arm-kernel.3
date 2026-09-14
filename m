Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C3DC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLdSqd1j1OI9R1VCLztteaDRbyZgd0G1W+hidlStvuM=; b=jfcVkR9VUBoCbrmOfq9ab8trWT
	j+LNzLritnWTnPXAb2fkAxFnNJ6/QZZEixT26Piy8Cg+P+eqqUkeYAdbYMIxUHXY7MavgB81FIdtH
	6KwMNhOdgkWTBrJKmu0qv+LN/Wbi825G73Lp5XFO3S8mzuqevsrM7/TMoaS3Yqp2Q6MqB2vEqakMQ
	O+xFlMKs96rVUc9Q9ygG//mScEA5dwlt3uf1HuzNKTilM63KE6juXevKH9WjlZLCtAQm/o4Y9pZ7M
	Dyp+2wHTCqRzycHCySUBgQSJLJ+Wps6kA/sUE2qxEgTr2ER+qJGtTDQiNfKiIouzFfbs/6VDuyF+N
	HZGSDXYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C7-00000004570-0prE;
	Mon, 14 Sep 2026 15:02:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68C3-0000000453R-0boI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:02:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0PZu674364
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RLdSqd1j1OI
	9R1VCLztteaDRbyZgd0G1W+hidlStvuM=; b=R3D4A7tR5d6I3rYhPblK/7F13xj
	AtTzyHRvih+2EcXm6uSQ0JMN8fWKau31PjhjVP1fKuVn4NZabhznAjLY/fZIjEwq
	xb13o10X7gO5PBKmqw5k32+A6sMnNShAKY2i3/aZokrEzkIrePrwASc3rpvVTSgz
	6NUa5hwLodYARnjnafLyNTAGxx8cGN6mmnng1XaB+FmV8lauRVKzYpBk3/CYtIfE
	9dAm3ZxGus/ox0z7V9dPmxHfs3hGhD/wrXxw7LfrdWxmBJ+Y+oFHdlBzrGV9jbTA
	ald+qtSAfzIPTBIbh7gnCPD5DwNqBTJtONRzYM8fEMYcUR21v0lyu5huWNw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs9a72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:02:02 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c34cd4bffbso1090601eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398122; x=1790002922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RLdSqd1j1OI9R1VCLztteaDRbyZgd0G1W+hidlStvuM=;
        b=LUCsvYjx75BE17TmyU6L6pKPLa/Laq4bkj+qncYWfR305POHLJcP1ZPF8uwa6A87Gm
         0ObqM4dpB5mZLf/z0DWyEYXCD/NhuLwWUkzXYxaLqFP1cXCF8LPWTJBBYG6ahLUdm3kx
         dYNBXNFXPYNj9/Clztr8jinUpvit9+uBeLj0D8WLN4nirEts2zaifLGj5yd4sbA4M1kR
         JWJYOaJFmebD6O2kGTb+SUl5F4sfqyL6l+AfNhCLTEhKDiEiCkuUMwDZJhsyV3t276q9
         08NU09vqTrx4yDc67Qjvm3U4YBr1iq0w1/oUtj7KJDPKmLeuPqBIPtPEwRBa2yC3+ilz
         iQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398122; x=1790002922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RLdSqd1j1OI9R1VCLztteaDRbyZgd0G1W+hidlStvuM=;
        b=V/WSAph60hYBao/o80Sd3MFax80bR563AYaJGLr4In1opJTaEA9EM+Mz4eXQwDoPFE
         N7chqkKVLPgHgi5crKy4ohm7nfyqzffanYqQ3q8838d+4jFBLUOAJsPGdCaRHrZwmW+m
         iVMEYOh9+zQ4Wb6dfpzRgfcasIx+oYpQCJs6OHq4UUYM7NS6xPH38/BNVuQLytCf8E7h
         b3MwhQyeApuCOyKPsYzM05L3ZYAuWTaC45euM9GBuB+AqYDVjx31nXjZgogIMoBS4CCb
         v1/z6pX+F9VFzBiKyorDkf6twuFtlJKHIf0/8d9zmAe8+zOY6JoR0mn3zAuM77ye+9Cd
         i3XA==
X-Forwarded-Encrypted: i=1; AKwUvBzVuaUnynKLkeoGZhtLesf/NhynYY2zj3I+PFJtq+em+ofZZZMBNs7bfIDR3Ud+wf4jfTZN2Nbp5Rtk3N1LxMR2@lists.infradead.org
X-Gm-Message-State: AFuF++lGZhyDTirWMBFNpyxQukVzhnMVPk+A18Fs6r+y7B9UHj7i61Vk
	eV2hpXE3xxU1umsj1KrLH+qz0mvBIxLrfBRGTBbfAFpgT5h1PkQY9Sw6GTHXWFljF8rJ2zq5wpX
	h1jniOWGlNog69XoGo+uS9NbptJSmzALUFvAgZkE8ThRaQVJak/BGhEM9pLkRRd/MZe9dDuft7Y
	ehNg==
X-Gm-Gg: AYBFou2YuxU0zOAt9IU2Y6QGPK/8PQV6mMt6hDvn7TqVghe/ayprkTZ+qo/JG4PxjCB
	UKMneLpZ4+MqcqZ4N8rl0dRAwJWWxXHSZkiorBkw3+gwtM5fGmvQppDS3Jca2Y0rL0/qKBVKFIu
	Gcs26SoAKIALzLsw0G82u4RVcr/WpGiiFkOR1lRzqYTQn/s+cDYG1D1/C9dsKu+veviuT/i3ThK
	3URoQ10CvetTuUccm4/VwRPVOnSm26jiHiT/M8fIi1cSysM5WGbRoJsWbnlNojPPyxFQdajHFoy
	FNMwdPlKoDZI8ZefXe7gPxYc5HCYd1Vr0CV5dnsYw/fbYWjjkgvO4b7iEIu5hidb+OsRV3iub+s
	nNpsHtRlZA1hR7zspwLD+pM9zYzB5cDiqo34Nj+es9SUd1remiNViUkotTg==
X-Received: by 2002:a05:6820:4b91:b0:6b7:8396:f3cf with SMTP id 006d021491bc7-6c541b451edmr1405303eaf.49.1789398120193;
        Mon, 14 Sep 2026 08:02:00 -0700 (PDT)
X-Received: by 2002:a05:6820:4b91:b0:6b7:8396:f3cf with SMTP id 006d021491bc7-6c541b451edmr1405146eaf.49.1789398118846;
        Mon, 14 Sep 2026 08:01:58 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c296608480esm468632666b.36.2026.09.14.08.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:57 -0700 (PDT)
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
Subject: [PATCH v4 2/5] pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power on
Date: Mon, 14 Sep 2026 17:01:38 +0200
Message-ID: <20260914150146.187622-3-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
References: <20260914150146.187622-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX4cAAA7JL4dkn
 GVMpM9y2V1NnACyarnp5IW9VP1yE1z1l2UhwyA2ONI7L6kovnxPabfOq9qoTJ/k1ox+El6j0Z5j
 JUZKuUe5rdnpf7GEj3SKYcmH5z2u6s8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX5unp7M3GVXob
 kfjBq6qkFzAHcU2jATOzEWNNPsk9xerHp5zpltsI3c8FfhARPvXpEMpN9xBGKkuce8jCqhBT5Mz
 99aGUmJ6saJzDsruJFNx8gG+gdc8Q0yfEf2IYRGT+wY1nFoZZgaiu+6JGBPUnB3DQGTVHxs3dcC
 K8MiFw3Ir9bplr2brwvs5CgpgPS5TznwAQoO/R2IH13GCjDI+xvjCaKLIJWAlA1/XehNseuDFC7
 BiKunf2zZVgVO9moHctB+kpyvsnCWrwRo5hZV5qkBk/YU6y4Ilmwld/w2Q9q/+q50uLXG7nmwC8
 nkkECsY+CVeOKx12Ae4Z/05U57LGLt8X2iDR+eRAbpBJXRspM/FKsSrsbXErOsZ09G5UiIM9tze
 IX+VhKdoR1Z1X+cKqD2GkpjZoHDD0fy0a2mAICdEaYhFmuMVy96eIS7piX6lpyME8E3d3HzIuzZ
 PbE1KtH04vS293z0riQ==
X-Proofpoint-GUID: lcpSEvlgTb1k23vRmhVtbdp7dkyiwTta
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa80c6a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=u8BtVuMVLpZXKRMe:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CAA96EveQzfqUpAuUaoA:9
 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: lcpSEvlgTb1k23vRmhVtbdp7dkyiwTta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080203_193831_9C2B9D51 
X-CRM114-Status: GOOD (  34.08  )
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
Reviewed-by: Dhruva Gole <goledhruva@gmail.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v4:
	- Decreased the timeout.

Changes in v3:
	- Moved to atomic polling, pointed out by Dhruva.

Changes in v2:
	- Rename a function according to Abel's suggestion.

---
 drivers/pmdomain/core.c | 80 ++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 6abe8b198949..c593a3479ad0 100644
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
+#define GENPD_CPU_ON_TIMEOUT_US		300000		/* 300ms */
 
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


