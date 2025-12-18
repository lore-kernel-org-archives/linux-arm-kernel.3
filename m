Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9311D68BEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bTnCXrZF7MRxf6WPpQ7TGUDn2ihAMOaEliTUQcOUv8=; b=EGvN+dTdGTMXg6xGGo3xrjDRWL
	uOxzYjYTTl0VcdeT9ym9ySZ1cZmSA4fWnLUw1iNMPCE6gtzH6mvQLEZ2bkGvtINYCkjfqteRyINM7
	vdYM96ouOF20hgDiU5/NqERHvXUcUM8m3jb0OzzJkt20fVVOzIz+O9NTyGkc3CZqyYxpjrZGykygT
	7mZuhqR0v24mgxEr6C6fwyUPinhxjoczD9IOhvXAoPPrXmWs9SvRIWeIwwEppiMkaXXwGclBUqisx
	A0RLu7taULViejFOESu1JIYLoKvhTc6vUnnVJGqk5TcC17uTRU8l019A5w6O+gO0P/x+P0scAtG+H
	gG2XktEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW96L-0000000811N-0ymk;
	Thu, 18 Dec 2025 08:11:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW964-000000080pK-0UtE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YiWP4057969
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bTnCXrZF7MRxf6WPpQ7TGUDn2ihAMOaEliTUQcOUv8=; b=XY+3b7aG56wq6J8B
	8qiPpnwIWjJ/cVr+NdLa/eye5DDK6ZK2/PzsAr/QaXvyAX7QA8/jgQvTb5Py5siA
	kryFPKWJw1touYZyr/vz7tRNbJe5Q7fqicEkAXWbkNQEcI3f0gUvzHrn+9mP041w
	4vaPrEeFEL+1nRvNZfkPJPBjYtKsJEEiIxRuDTLB5PthcXDJ3YXQUeXncLLIcFbs
	LeLD94FrOfp5arxPaYEbMpJdfD8Fb3VRNng8ua2xQclJIlSn0QCGBcvJRVfEY70U
	KwW+leZHMHBsHl5zOAW2CKnr0715DYPDS57XpNqCF9eNNvsBkgX+fJl1wOQHNueb
	FF1IOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5ap86-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b62da7602a0so464496a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045450; x=1766650250; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bTnCXrZF7MRxf6WPpQ7TGUDn2ihAMOaEliTUQcOUv8=;
        b=FPuu1M2oRzVtPYxJkIL5nifsyQz8Nk/Ueyb5lqA6DaXbn6kodvARGtw+AOJmpawwqi
         yqiLYk1VqGRDJ6Op9J8WXA3DgxJYF4pjUupUGZLxmg7WDmyDcQDJfG6vqLBI3rWPh1LD
         xMDsS5q0eautVcPAyVtXghTDrUuD0u5fyxxYjWhzFRlBzxdl8KNlK8SEw6mGpIAJJIha
         0Xq5UEoWUz7ZATQd29ZVGBO6ki2/2ZAqB1lY0I1XEyJLZ7XxlYUUmG2e1beVrKLHdQx1
         q8ieEAGr76OHi8Ljzk3uqRT7Gtq5O28FNTX6zcSkB5TFOAtKQY5NyDrKsyFPuZe0QkIR
         VdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045450; x=1766650250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+bTnCXrZF7MRxf6WPpQ7TGUDn2ihAMOaEliTUQcOUv8=;
        b=WhMu3GLh1z62viPUc1RHV9xO7gtUWX1vVUeikoGoWv0mv34ckIWMWFDOYBagMxOUGm
         Q2oyudwWoARPLPgBXnSKv4GVbl/1Zt8V3oqzO4Bg+m6uD5CVHu2L2IoNy6tG3Oj5uP3F
         xga5GyOe7jH3NG2XLepTdmq5QT0bxliFreglaP8tPj3QSbFwpAweSePYjlpP96RSG0Jb
         iq7wtHw+1I8X9luQxQu9tp6BgRRDazUEwKus0OVPQKpMCdCZkfvtr7OBx0nyBFGAP03n
         npO5jHtsEMDFaQ6Vs7vnBylyAdFt9L1lVZtX/myvodjbiSYZmYZUvLsxqC0ktBBm25Vo
         nvIA==
X-Forwarded-Encrypted: i=1; AJvYcCXbS01hws9duIWfV7KuG/YY9io+bJYuzDo0Ya5UpITAWcxK2qfRq2+an/TTUHKSxjhWcr2+8A+caIVexJOIGs/+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywciz0YuLUV84edVB2lrKTTCFmTWGIHM5WRSaaicet1YzG5hI8q
	InF11XpB94LkQP37JU144KHowfPQrFlO5qA4fax6x/kwygUVUMRnyGhgLVuPZ6/oJ3ZRSKvGHQa
	ArnTS/7Z0AhQJ/k+i09iqon1Un6iDvwSu3/pBK7V634IFlF3d1WU0bQdvN3wbmLRyEnwmeIEe77
	KlEQ==
X-Gm-Gg: AY/fxX4M/M9yvlPcXn1M3uERo201l+fW6O69nLgZYrMCa8Lt3/OJUoMXZD5slN7BaA/
	SKikbEicxuqwMedBLiAGfmKhQzrV6zZHel8qEH+CuP+eNcI3n3ZMJ2/2XA6BB0W/I8EWtUWj+dB
	yPut+8zfnCC1lBnisCnZMQ0Bxwtuk5QulRybss4HeucvhhWsSMzqvQBsJlLirIaIN5knql4I7mf
	rN9cFVUEjdqUlcjY02ZHuDsmNVc5amrcMoxFihzwbzOPKiw736XcdG9r9iTGiTdMpiefwQx74HZ
	Vptn7rj8hLPaHV4v9WSrgfESjEhJJoxtUB/gqwvrdFRQROyWKIgrvyy7xagSpafz2T+/+EjMUxB
	z38NX6KlAfiDfiDvz8CF0dG3F74F9OL+gq13zmKoV8L6SbXjNqgYIN7JU9T4B4Imlrsk=
X-Received: by 2002:a05:7300:2aa4:b0:2ae:6024:7a49 with SMTP id 5a478bee46e88-2ae60247d40mr3081167eec.30.1766045449887;
        Thu, 18 Dec 2025 00:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFO2m/fdcicBAoP4bK1C8K/V7fbv60Y9OFGS5ftQKn46N/HidNKcP8n5iWDeiFhQFJRnyoyew==
X-Received: by 2002:a05:7300:2aa4:b0:2ae:6024:7a49 with SMTP id 5a478bee46e88-2ae60247d40mr3081135eec.30.1766045449227;
        Thu, 18 Dec 2025 00:10:49 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:48 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:47 -0800
Subject: [PATCH v2 07/12] coresight-tmc: Support probe and initialization
 for CPU cluster TMCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-7-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=10021;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=VBlkATc/lcj6oh/+7N99ClnqOVJCbTvJk8ZfbtYCMaA=;
 b=jPtCN8o60f4IkWzznTnCyUC6rslRS9R4ZDA/TzyqRs8sWyR9Yt8N50nKiAJy8EX9fQoI6jH3U
 XSqF9/R2s1CA6VXJXu1DlV28z856e2Q1l3xIErAGKWsTiEJ9ABM+3rh
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: zFKXwSWUmDdq0CIMPdm-QR33JbKqSkpx
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943b70b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AsHEykryqctiG1ll_fEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX7WEmI1C76vLI
 yjzPR932Xw5TxBtwdOPl21L1Xo3oQKtfgoCuZa6Qce0h6DuP3FwubtO3I7tK/lQLfjpEmkOSvEB
 WXgimBxMY3X5MHPE0HjBMToCSkfbxVn//oR/UkfLM34VB1oCDRb4wxtr1bR8CNv0Izxry6aSkaZ
 ZLTd6nApqIlIAtPkKZeYSogmc+KARspiIlUa6Bgp/UAeEH1LNlL4BMB9kMFyQrQA1YnMbSHCPzS
 67+L5Y+lz04GvMxDakRfgTn7wMfpuqjzOP9Ep2YdFO+E+tNYQkGTxZrPV3t1qKA9EWvlBItewst
 iQZnhkK4DGyA29ZVZpKFeoD7hcyoCKd6ClZSKNuKelzu9c28sxNMS11hXmemgcM2KjSoal4Rc2q
 wimiHoA5WMXNmtAeq9+4VtG/OOPrbg==
X-Proofpoint-ORIG-GUID: zFKXwSWUmDdq0CIMPdm-QR33JbKqSkpx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001052_296022_1BC8C87C 
X-CRM114-Status: GOOD (  25.45  )
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

TMC instances associated with CPU clusters reside in the cluster's power
domain. Unlike system-level TMCs, their registers are only accessible
when the cluster is powered on. Standard runtime PM may not suffice to
wake up a cluster from low-power states during probe, making direct
register access unreliable.

Refactor the probe sequence to handle these per-cluster devices safely:

1. Identify per-cluster TMCs using the "qcom,cpu-bound-components"
   property.
2. For such devices, use `smp_call_function_single()` to perform
   hardware initialization (`tmc_init_hw_config`) on a CPU within the
   cluster. This ensures the domain is powered during access.
3. Factor out the device registration logic into `tmc_add_coresight_dev()`.
   This allows common registration code to be shared between the standard
   probe path and the deferred probe path (used when the associated CPUs
   are initially offline).

This change ensures reliable initialization for per-cluster TMCs while
maintaining backward compatibility for standard system-level TMCs.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 195 +++++++++++++++--------
 drivers/hwtracing/coresight/coresight-tmc.h      |   6 +
 2 files changed, 132 insertions(+), 69 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6203e871fdcb8de569cc6701c52bb..0e1b5956398d3cefdd938a8a8404076eb4850b44 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
 #include <linux/spinlock.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -769,56 +770,14 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
-static int __tmc_probe(struct device *dev, struct resource *res)
+static int tmc_add_coresight_dev(struct device *dev)
 {
-	int ret = 0;
-	u32 devid;
-	void __iomem *base;
-	struct coresight_platform_data *pdata = NULL;
-	struct tmc_drvdata *drvdata;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
 	struct coresight_desc desc = { 0 };
 	struct coresight_dev_list *dev_list = NULL;
+	int ret = 0;
 
-	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	dev_set_drvdata(dev, drvdata);
-
-	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
-	if (ret)
-		return ret;
-
-	ret = -ENOMEM;
-
-	/* Validity for the resource is already checked by the AMBA core */
-	base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
-		goto out;
-	}
-
-	drvdata->base = base;
-	desc.access = CSDEV_ACCESS_IOMEM(base);
-
-	raw_spin_lock_init(&drvdata->spinlock);
-
-	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
-	drvdata->config_type = BMVAL(devid, 6, 7);
-	drvdata->memwidth = tmc_get_memwidth(devid);
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
-	drvdata->etr_mode = ETR_MODE_AUTO;
-
-	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
-		drvdata->size = tmc_etr_get_default_buffer_size(dev);
-		drvdata->max_burst_size = tmc_etr_get_max_burst_size(dev);
-	} else {
-		drvdata->size = readl_relaxed(drvdata->base + TMC_RSZ) * 4;
-	}
-
-	tmc_get_reserved_region(dev);
-
+	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
 	desc.dev = dev;
 
 	switch (drvdata->config_type) {
@@ -834,9 +793,9 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.type = CORESIGHT_DEV_TYPE_SINK;
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
 		desc.ops = &tmc_etr_cs_ops;
-		ret = tmc_etr_setup_caps(dev, devid, &desc.access);
+		ret = tmc_etr_setup_caps(dev, drvdata->devid, &desc.access);
 		if (ret)
-			goto out;
+			return ret;
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
@@ -851,44 +810,141 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	desc.name = coresight_alloc_device_name(dev_list, dev);
-	if (!desc.name) {
-		ret = -ENOMEM;
+	if (!desc.name)
+		return -ENOMEM;
+
+	drvdata->desc_name = desc.name;
+
+	desc.pdata = dev->platform_data;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	drvdata->miscdev.name = desc.name;
+	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
+	drvdata->miscdev.fops = &tmc_fops;
+	ret = misc_register(&drvdata->miscdev);
+	if (ret)
+		coresight_unregister(drvdata->csdev);
+
+	return ret;
+}
+
+static void tmc_clear_self_claim_tag(struct tmc_drvdata *drvdata)
+{
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	coresight_clear_self_claim_tag(&access);
+}
+
+static void tmc_init_hw_config(struct tmc_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
+	drvdata->config_type = BMVAL(devid, 6, 7);
+	drvdata->memwidth = tmc_get_memwidth(devid);
+	drvdata->devid = devid;
+	drvdata->size = readl_relaxed(drvdata->base + TMC_RSZ) * 4;
+	tmc_clear_self_claim_tag(drvdata);
+}
+
+static void tmc_init_on_cpu(void *info)
+{
+	struct tmc_drvdata *drvdata = info;
+
+	tmc_init_hw_config(drvdata);
+}
+
+static struct cpumask *tmc_get_supported_cpus(struct device *dev)
+{
+	struct generic_pm_domain *pd;
+
+	pd = pd_to_genpd(dev->pm_domain);
+	if (pd)
+		return pd->cpus;
+
+	return NULL;
+}
+
+static int __tmc_probe(struct device *dev, struct resource *res)
+{
+	int cpu, ret = 0;
+	void __iomem *base;
+	struct coresight_platform_data *pdata = NULL;
+	struct tmc_drvdata *drvdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
+
+	ret = -ENOMEM;
+
+	/* Validity for the resource is already checked by the AMBA core */
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
 		goto out;
 	}
 
+	drvdata->base = base;
+
+	raw_spin_lock_init(&drvdata->spinlock);
+	/* This device is not associated with a session */
+	drvdata->pid = -1;
+	drvdata->etr_mode = ETR_MODE_AUTO;
+	tmc_get_reserved_region(dev);
+
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
 		ret = PTR_ERR(pdata);
 		goto out;
 	}
 	dev->platform_data = pdata;
-	desc.pdata = pdata;
 
-	coresight_clear_self_claim_tag(&desc.access);
-	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev)) {
-		ret = PTR_ERR(drvdata->csdev);
-		goto out;
+	if (fwnode_property_present(dev_fwnode(dev), "qcom,cpu-bound-components")) {
+		drvdata->supported_cpus = tmc_get_supported_cpus(dev);
+		if (!drvdata->supported_cpus)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->supported_cpus) {
+			ret = smp_call_function_single(cpu,
+						       tmc_init_on_cpu, drvdata, 1);
+			if (!ret)
+				break;
+		}
+		cpus_read_unlock();
+		if (ret) {
+			ret = 0;
+			goto out;
+		}
+	} else {
+		tmc_init_hw_config(drvdata);
 	}
 
-	drvdata->miscdev.name = desc.name;
-	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
-	drvdata->miscdev.fops = &tmc_fops;
-	ret = misc_register(&drvdata->miscdev);
-	if (ret) {
-		coresight_unregister(drvdata->csdev);
-		goto out;
+	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
+		drvdata->size = tmc_etr_get_default_buffer_size(dev);
+		drvdata->max_burst_size = tmc_etr_get_max_burst_size(dev);
 	}
 
+	ret = tmc_add_coresight_dev(dev);
+
 out:
 	if (is_tmc_crashdata_valid(drvdata) &&
 	    !tmc_prepare_crashdata(drvdata))
-		register_crash_dev_interface(drvdata, desc.name);
+		register_crash_dev_interface(drvdata, drvdata->desc_name);
 	return ret;
 }
 
@@ -934,10 +990,12 @@ static void __tmc_remove(struct device *dev)
 	 * etb fops in this case, device is there until last file
 	 * handler to this device is closed.
 	 */
-	misc_deregister(&drvdata->miscdev);
+	if (!drvdata->supported_cpus)
+		misc_deregister(&drvdata->miscdev);
 	if (drvdata->crashdev.fops)
 		misc_deregister(&drvdata->crashdev);
-	coresight_unregister(drvdata->csdev);
+	if (drvdata->csdev)
+		coresight_unregister(drvdata->csdev);
 }
 
 static void tmc_remove(struct amba_device *adev)
@@ -992,7 +1050,6 @@ static void tmc_platform_remove(struct platform_device *pdev)
 
 	if (WARN_ON(!drvdata))
 		return;
-
 	__tmc_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 95473d1310323425b7d136cbd46f118faa7256be..b104b7bf82d2a7a99382636e41d3718cf258d820 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -243,6 +243,9 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @supported_cpus:	Represent the CPUs related to this TMC.
+ * @devid:	TMC variant ID inferred from the device configuration register.
+ * @desc_name:	Name to be used while creating crash interface.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -273,6 +276,9 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct cpumask		*supported_cpus;
+	u32			devid;
+	const char		*desc_name;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


