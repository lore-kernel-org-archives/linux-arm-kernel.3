Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44077C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 10:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CWrBGHNoo/3t6uxKrkLr0lf5ykSkpDUDGnod8tywwMs=; b=gU67Dn1ZVTYCBG98yWZT6fzM3J
	CQX4icyxh7Pxx4eg81XidbW6xZ81VUnQmba0q6kzkbv+lRZXupSqXuFCnVmHFPODzAWLX/QfErvis
	cVDoSRwy2+UolWr97oMhXg0GvM4ChF7BD7VVlKh4wI6s7cmdXvwqR0B2tqf31Rxs6tc9lbxdQwJCR
	GInJOxM3HIrkzz2UEFgoP0R7tnsrCzg0jc+X4KJVbP4yWmkgUQBAVhYp/GVMjdUbmozsLaAmDbryV
	lQR4vDB68Uaq/LsTmprRfRFHoiIgOgNe8FnzqgNLSt83UbsTB3xZnJJ0NKgFUFJu3NCt7fhRn9nVh
	00PE+VZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yVC-0000000GO2t-2E7U;
	Fri, 11 Sep 2026 10:29:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yV9-0000000GO28-1hqM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 10:29:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7ktqq3687072
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CWrBGHNoo/3t6uxKrkLr0l
	f5ykSkpDUDGnod8tywwMs=; b=Bu/udOve1Qh/up7WUf4EPd/D/b6mXokd/U3AY4
	vCkCG3jcCZDhY/ZggX3op1dT+e3zMOUkqTzJrawuinDoC//6EySOC5B/L8WuHUk0
	nZJDwHX5eix2mixtxGjynAhyCJholaZ4FHtvjNDBSsOQEmHkF6Wi9bbLg39QR5/V
	6UnVbNB8upZfpNZP1yZ2qA5A5A17U6374Q2iqzhZWSAWhZfxXYN/dSL2wb1pfrMF
	jrfuhM9QA8w1XBtjVioHoIrnVdDytV9uCFVgr/vp97J4hnwTULxxetJacVLB/0FC
	59Zq16dfkaVhk0KOCL/56w4uwWHB/ielA8/t6pa9Q2R/Ow3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1bjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:28:58 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af92138f9so1491544a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 03:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122537; x=1789727337; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CWrBGHNoo/3t6uxKrkLr0lf5ykSkpDUDGnod8tywwMs=;
        b=OGjq6q9MK9dF16PJzIJwmAC/AnsiXixSzVkpiqiX4RpeQZOHBSvh+PDOgWWosTbO6e
         OBouEeRZ6wfyLFe4XzBpjAIsem7N24TW61rieQ1VjPM5M+eEizNG5utgOltaFxyfUvdJ
         J1V8sx0M40UGF9ABHpqgSWLywHU3PxbZ9dVeePkNAFfdslVMDYfI9o31uRI/s1ITaDNy
         fQMVRPQ6W8aD9pIPUQT8yJsBGZk7yvyx9LKNsjVfucYgSrxwcMvon89nSHE2EyZnBnMl
         KEB4KtLlTwTFzBHBdMoblUYb0GEkCcEwtNH/jYVvY10ludh7n4td7boymsaugWLKUflT
         jWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122537; x=1789727337;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CWrBGHNoo/3t6uxKrkLr0lf5ykSkpDUDGnod8tywwMs=;
        b=hejHANqdO+vlN4CMSs0LYRHGlUav6Gzh5MNynzQ4FoFVFyDNTlbJXnhOaW6OuNV6g3
         VaTs7FdonykfICYCwDI/OOuosW0gesOgDOyNZEwOfMNZt94HOCp2U0DP22wQsjq0IkU6
         vUPX+4RtxZzsbUOPuI7pwvYOEpSJVdGhVh8aAO5AQp8NHrtyzKnwg2lNVZ0cjco6Btpw
         +445JBVyjoHPnfne2liUTqULLrI9OVULqfhaL3+2SZwkK/aQou+KvJDGsc4A0J0I/brD
         F01nUNj9T9QwQ+m+73ktJFgcXqMRJr3eNzSHYtvESP3qtyY4aPSlSrQD7zVRK7Ig0onU
         q1Ng==
X-Forwarded-Encrypted: i=1; AKwUvBzT0xbgff51e09SlVG8Cj+X9yo87pnTlod/vkqqQgGB/NxqrtU5z0KUS4p8CPMj5998JwfzdZ7vQIuuH3hygJk8@lists.infradead.org
X-Gm-Message-State: AFuF++l3FFvgVDqlh+WzB0cVFjxjtV4Gh3+BdI9Qc1H6ujViSDS2gKJf
	QUuOd/aUs2VinxlnKs9pb9U5uAb5WEmi16dujgvtzawK0FVTzP+TqOqpY9elVR/4SsqgOnciNsF
	ghKKaUhf9I5A4r0ScbUlxAlvQGfM9gYfnqcVqbfxGD+FTAH7/XCKG6YaONZs0aw+hBiVOPa3Wfw
	PQ0w==
X-Gm-Gg: AYBFou0mxl8pLHXL++vF3sAhSWPflKbHOaK8XxHNLC9F7lxXbp+1QSOTO5Em1t0Y20u
	GO4VgKUxMxytn8bqn4tgzMbFLQzYUn+tUvT9oXFNcjS6JmzX3Tc0JItz4E/J3rMLLpumEESVKt5
	Y3qjhivW2GK95xTIlYXN4xXesGpJuS0hceOmLRto4Gm+apRP2zHixBuLe9hfY4kN90Tmvub+e1N
	xZNNp5yEQ783dw5YgDqXIg9qXYpTvdzYmSu+PiJyU4PAJzewo0SejfZoTkrhxx5YAlowoPaN8ed
	IO3Ywg29WRRTGLfNnQbY/psQkGb3JsK1DuK3F2XaJEsJFj/xLYKaVah0eji8mJYzvBoXCwHmcdn
	aC/s2fMSft6ChF6M1KTh0uZy5OKV0TapvzIhvtpoCEnTewc75BaUZMpURvA==
X-Received: by 2002:a17:90b:2d82:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39d77d22aa2mr11502016a91.32.1789122536940;
        Fri, 11 Sep 2026 03:28:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2d82:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39d77d22aa2mr11501979a91.32.1789122536304;
        Fri, 11 Sep 2026 03:28:56 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm5471657eec.12.2026.09.11.03.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:28:55 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 03:28:52 -0700
Subject: [PATCH] coresight: handle runtime PM resume failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-b4-coresight-runtime-pm-failures-v1-1-acdf49756e11@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOPXo2oC/x2NSQqAMAwAvyI5G2iLC/oV8VA11YBWSa0I4t8tH
 mcOMw8EEqYAbfaA0MWBd59A5xmMi/UzIU+JwShTqUZrHAocd6HA83KiRH/yRnhs6CyvMXmslTO
 lakxtaYCUOYQc3/+i69/3A3QR8ftyAAAA
X-Change-ID: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789122535; l=10711;
 i=yuanfang@qti.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=prgnis7GOywHrLI4Gw6b1Du/gpVpGDzh7dABj60kp3I=;
 b=RZqAyHsdCRu7ZdV2WOrNsOBgZ6rC7W7PfdWNwS7MTzK4pgOoaM7tphS/7+46nw4R49XT7gZM9
 fOrKAVb0EK3AF4Lj55xh5CueGXfOOdz4vem3GtD8JBcDfmMZiaKr5DO
X-Developer-Key: i=yuanfang@qti.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: l0xLeY37Jz9hbJpvSDDFWmg69A_m9NjP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfXxImsFimGwWSI
 EPMmZZ6lfEZ/H9qFpAmoI2C/oeN4iHK6uZsVJMm7znzjSUWL8ijbfcaLs2GZXgWbe5TGJnE5B8r
 StMB+Fzwj/IQ2JrEvU0vZJaSSvq5Wp8=
X-Proofpoint-GUID: l0xLeY37Jz9hbJpvSDDFWmg69A_m9NjP
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3d7ea cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=AmsXAa7n7-pT3CpYTX8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX/0mtDWdSMxGq
 4wXW+2ccNeo+dp772UKy0g9IsBM7h7Yk9BpY2BZ1r1X7aUzD2jaegtf2Jqu43oDKnpk0lx3ME8K
 CmVN58cxObeeLK2+F87oC6CWoIN1Kd+cYuF6AEI54sm8BIGLnsz7DfMmmWEWsUsT5up5OqNhVtc
 n4e69jIC9LtW8DlpESzitQ1zemTKEKqYKscAt+jrCStQ3LyFQ6W99fbBWvllgQbWlSDkmFY6em6
 rY4zWbFrZcxF2S0jRBdxXRorl3kLzNhhQHw3/tEdPV0x7OJrnRiPvqrKU5W/TH1R3Wg/F/FeYFz
 bYBppAsA0WuS6RHu6xurA6uco0AZ4/1UM4g7HJuudWizOZx1v27dEupIf88pNUjIG+0q+u6Vn4h
 tdrnsZtGg7CPSJAdbi80/0xN2xzYZ/zX0IoMlmjF/5FSbrb8FFnm7oiaLQUB/o1I3+XFKYKeOXn
 zVcWAvqUnOfLctX6ZXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_032859_580412_E569A3FD 
X-CRM114-Status: GOOD (  24.87  )
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

When a CoreSight component's parent power domain, such as a CPU cluster
genpd, fails to power on, runtime resume returns a negative error. Several
call sites ignored that error and continued to access registers on an
unpowered device, risking an external abort.

Replace the remaining pm_runtime_get_sync() calls with
pm_runtime_resume_and_get(), which restores the runtime PM usage count
when resume fails. Abort before accessing hardware and propagate the
error to the caller.

In coresight_get_ref(), unwind the module and device references. In
debug_enable_func(), roll back the CPUs that resumed successfully before
the failure. Finally, release the mode acquired by stm_enable() if its
runtime resume fails.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
This patch converts the remaining CoreSight pm_runtime_get_sync() users
to pm_runtime_resume_and_get(), propagates resume failures before
hardware access, and completes the related module, device, CPU and mode
unwind paths.
---
 drivers/hwtracing/coresight/coresight-core.c        | 13 ++++++++++---
 drivers/hwtracing/coresight/coresight-cpu-debug.c   | 10 +++++-----
 drivers/hwtracing/coresight/coresight-cti-sysfs.c   | 10 ++++++++--
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 10 ++++++++--
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c |  5 ++++-
 drivers/hwtracing/coresight/coresight-funnel.c      |  5 ++++-
 drivers/hwtracing/coresight/coresight-stm.c         |  7 ++++++-
 drivers/hwtracing/coresight/coresight-sysfs.c       | 11 +++++++++--
 8 files changed, 54 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 928488a216d4eafa3cdb5f882ae5f44ddaff0448..ff93a017dbe22b01236ac2e5021da9b82890e72c 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -822,14 +822,16 @@ struct coresight_device *coresight_get_sink_by_id(u32 id)
  *
  * @csdev: The coresight device to get a reference on.
  *
- * Return true in successful case and power up the device.
- * Return false when failed to get reference of module.
+ * Return true on success and power up the device.
+ * Return false if a reference cannot be obtained or the device cannot be
+ * powered up.
  */
 static bool coresight_get_ref(struct coresight_device *csdev)
 {
 	struct device *dev = &csdev->dev;
 	struct device *parent = csdev->dev.parent;
 	struct device_driver *drv;
+	int ret;
 
 	/* Make sure csdev can't go away */
 	get_device(dev);
@@ -843,9 +845,14 @@ static bool coresight_get_ref(struct coresight_device *csdev)
 		goto err_module;
 
 	/* Make sure the device is powered on */
-	pm_runtime_get_sync(parent);
+	ret = pm_runtime_resume_and_get(parent);
+	if (ret < 0)
+		goto err_pm;
+
 	return true;
 
+err_pm:
+	module_put(drv->owner);
 err_module:
 	put_device(parent);
 	put_device(dev);
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50eafb4249ab516ef846e437831b9681..39602d610e5b22ec4f165dbb126a7c06aea08eb0 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -429,19 +429,19 @@ static int debug_enable_func(void)
 		if (!drvdata)
 			continue;
 
-		ret = pm_runtime_get_sync(drvdata->dev);
+		ret = pm_runtime_resume_and_get(drvdata->dev);
 		if (ret < 0)
 			goto err;
-		else
-			cpumask_set_cpu(cpu, &mask);
+
+		cpumask_set_cpu(cpu, &mask);
 	}
 
 	return 0;
 
 err:
 	/*
-	 * If pm_runtime_get_sync() has failed, need rollback on
-	 * all the other CPUs that have been enabled before that.
+	 * If runtime resume has failed, roll back all the other CPUs
+	 * that have been enabled before that.
 	 */
 	for_each_cpu(cpu, &mask) {
 		drvdata = per_cpu(debug_drvdata, cpu);
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 3fe2c916d228808233ef19e9213a0cc0ce3cf297..6886b8713368058b9cf33ab7fafb5f87e23c1ec9 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -167,8 +167,11 @@ static ssize_t coresight_cti_reg_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	u32 val = 0;
+	int ret;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		val = cti_read_single_reg(drvdata, cti_attr->off);
@@ -185,11 +188,14 @@ static __maybe_unused ssize_t coresight_cti_reg_store(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cs_off_attribute *cti_attr = container_of(attr, struct cs_off_attribute, attr);
 	unsigned long val = 0;
+	int ret;
 
 	if (kstrtoul(buf, 0, &val))
 		return -EINVAL;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	scoped_guard(raw_spinlock_irqsave, &drvdata->spinlock)
 		cti_write_single_reg(drvdata, cti_attr->off, val);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index b3c67e96a82a4995515457d1ac0a5b183b162f0f..b34e282ec4a5f37f7de1d2ff118042b47368acd7 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -47,8 +47,11 @@ static ssize_t etmsr_show(struct device *dev,
 {
 	unsigned long flags, val;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int ret;
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 	CS_UNLOCK(drvdata->csa.base);
 
@@ -933,13 +936,16 @@ static ssize_t seq_curr_state_show(struct device *dev,
 	unsigned long val, flags;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct etm_config *config = &drvdata->config;
+	int ret;
 
 	if (!coresight_get_mode(drvdata->csdev)) {
 		val = config->seq_curr_state;
 		goto out;
 	}
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
 	CS_UNLOCK(drvdata->csa.base);
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index cc6cdd3ae29d502a2e67f07400de957b6dc71af6..55e05c20b302d4bf55c4df30c9ee6d6a1b5f1031 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -2457,10 +2457,13 @@ static ssize_t coresight_etm4x_reg_show(struct device *dev,
 {
 	u32 val, offset;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int ret;
 
 	offset = coresight_etm4x_attr_to_offset(d_attr);
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 	val = etmv4_cross_read(drvdata, offset);
 	pm_runtime_put_sync(dev->parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c5272ebd55df9e98544e3b401cfe6..5824a1e4d046a3caf5b32ed1d8526b8bd7e9ca76 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -190,9 +190,12 @@ static ssize_t funnel_ctrl_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	u32 val;
+	int ret;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
 
-	pm_runtime_get_sync(dev->parent);
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return ret;
 
 	val = get_funnel_ctrl_hw(drvdata);
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f6fff640090cf58298b89a31e6359..b9f15990ed994ea827c8e237d764e74d8d231ddd 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -196,6 +196,7 @@ static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		      __maybe_unused struct coresight_path *path)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
+	int ret;
 
 	if (mode != CS_MODE_SYSFS)
 		return -EINVAL;
@@ -205,7 +206,11 @@ static int stm_enable(struct coresight_device *csdev, struct perf_event *event,
 		return -EBUSY;
 	}
 
-	pm_runtime_get_sync(csdev->dev.parent);
+	ret = pm_runtime_resume_and_get(csdev->dev.parent);
+	if (ret < 0) {
+		coresight_set_mode(csdev, CS_MODE_DISABLED);
+		return ret;
+	}
 
 	spin_lock(&drvdata->spinlock);
 	stm_enable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-sysfs.c b/drivers/hwtracing/coresight/coresight-sysfs.c
index 4b010f8bc4c08da31b3d295be6c37b6d941629d2..5849dfbd9d0bd3ad10734919f78bc39cc968539c 100644
--- a/drivers/hwtracing/coresight/coresight-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-sysfs.c
@@ -17,8 +17,12 @@ ssize_t coresight_simple_show_pair(struct device *_dev,
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
 	struct cs_pair_attribute *cs_attr = container_of(attr, struct cs_pair_attribute, attr);
 	u64 val;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(_dev->parent);
+	if (ret < 0)
+		return ret;
 
-	pm_runtime_get_sync(_dev->parent);
 	val = csdev_access_relaxed_read_pair(&csdev->access, cs_attr->lo_off, cs_attr->hi_off);
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);
@@ -31,8 +35,11 @@ ssize_t coresight_simple_show32(struct device *_dev,
 	struct coresight_device *csdev = container_of(_dev, struct coresight_device, dev);
 	struct cs_off_attribute *cs_attr = container_of(attr, struct cs_off_attribute, attr);
 	u64 val;
+	int ret;
 
-	pm_runtime_get_sync(_dev->parent);
+	ret = pm_runtime_resume_and_get(_dev->parent);
+	if (ret < 0)
+		return ret;
 	val = csdev_access_relaxed_read32(&csdev->access, cs_attr->off);
 	pm_runtime_put_sync(_dev->parent);
 	return sysfs_emit(buf, "0x%llx\n", val);

---
base-commit: 08df884136f1c1197bab2a27814404fd329d9aac
change-id: 20260911-b4-coresight-runtime-pm-failures-70f250927aeb

Best regards,
-- 
Yuanfang Zhang <yuanfang@qti.qualcomm.com>


