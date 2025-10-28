Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B7CCF9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jF+INNhgLS0eIQd6UyyLDzCUNgzjGz+l2LgLPRrmPKI=; b=QIQfxvfu6Gv6BdGxWzqB/YK0Hc
	NCvlcl5GgF917v1P2Twcc6stUcVy3BUkz9PUoFOzMx6rY4uFSK0x5vf/0azvWETYLfN+uFXcgMEtK
	gzK+dc1APwi0rUobBL5doUFgaHK7Q0ok7Q9jyEepP89NbG5jBA4tjdftm0vXzs86+aJBJLOG5HhR9
	5loLCZDRte2grDy6Guh2xnYXz3og1m5g2efyxdDzC4FK+y/Z2jCsZMs6pPfiwr3DgpL5WxY2tdMV1
	z5WgaHFzzbjybGHXBOvA9jIICyk9KYaE1IoVSCcGE8MqAFpXjf7kDq0nO9LIk5KfK7TLUJlCN3jMD
	/e/0Ujgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdCA-0000000FL8Y-0Qm8;
	Tue, 28 Oct 2025 06:28:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBy-0000000FL0Y-2HQc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RMIwll2752121
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jF+INNhgLS0eIQd6UyyLDzCUNgzjGz+l2LgLPRrmPKI=; b=FUEJF8Zll/uH0uK6
	EmJCU2wHG4bKJwhSfRjdG3ZJcenfIbpzSOzat7aMAkKH8uvrdbfw8emXfHfqMIWc
	xii1wGoXh2gPpwRDOUHYGexmVdZSHBwiOC4T21SDYmNWvBaGEspUNc1iyh4o2MC7
	LzlLBQyU06jtNZGqwZdYDdp3ZTI4vaSinfolbDezaJRAIwhtfMDFxqCHFODvJqRz
	MO8n2/Qs+E8LHHveofY28FShItCYK4ZM7T19nRKLelJqPupfBGzdJjYEaBhLlrNJ
	7jfyc9eLYsB/JArL6dO/wBU+Ggm2DrGHX4wC44c9yUL0Hhkb+XDFf4mMPttR2PlV
	IxwvvA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nstw7m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33dadf7c5beso5036291a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632905; x=1762237705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jF+INNhgLS0eIQd6UyyLDzCUNgzjGz+l2LgLPRrmPKI=;
        b=xBp8niDiDwdt4eC1fR6ZuAdfEN3R8coEsvDWSKZfVYRyZ3hHp4BcsBLTVGLze3D9Of
         uaFi9TGQL1bz8c3V6hc4MUkWdNS/AEmv5zAOZA2xSz9c1iQoJfyB1sHYVnD48JuJA8iQ
         77rGBYhFU8AxVtaV0JMRZx61gYYbM+v2W/49fCUrz4bLLeyXcn6u3i88lWy0mkpMmH/l
         vqxklzkJ7w3Kem6RlE99cT1JwuPj/w6PVsR23iWkFHPsWMH0WgiDIRovl+NTJICNHmZh
         VTJdsem48EbUuJpBrVV1UtXQnDKERRAiCApCXCWFACKqGjubzyV7NlMcVUd/CXrRG/X0
         Lk9g==
X-Forwarded-Encrypted: i=1; AJvYcCV+9Emx4b/ZKn6/6ToYWeEfgVZ93UDZdE9Qtz0X6EPYoP9X/3le6POOU5oNojz20vg1K3fi9tIE4FKPpIz5RF+f@lists.infradead.org
X-Gm-Message-State: AOJu0YyJoFZ4Zu/NiZhcJAKWUpFX2fuMegK6hve2129ng56b6OFan6FH
	o2S6FEF2VyFMoTsH1p6LrMlnV7gkGhfJLuBkwOd+ppEWL3RwDxRmUbY6meMYUAFWeCQgbM3mEAF
	DbAnZ9kidZvFdiZmG2ajCfD62oi/D0KQ09hSUGxud35cFvgfcOv9geub5Wjed6PNA1i0QuPrTGY
	bpGIh42aThnYVM
X-Gm-Gg: ASbGncucAjOhC2AwriJ9lAlN6NpnTajeXoPnyS3AXT1ytA+wlCNfg30qaWTaDPhuon4
	mPD/esqguz+tXaZZLovWTKv5NAiV8b3L8WKf9RnZHa4G0XfosFRystEGc/bURjyWc0nqQu6Gttu
	pZLe+goU1OzpM/DZ2iubF6N2zxsVZVSBeL+kv3uSt8tCslYCglPyLquEKTnGXmA14Q8jdsF9KmC
	6wi4p7dnLf/1k3deS8VN3st5NnQK88P3374vrXYQwR1bCGmyIxtoM/Rl8LCq7hhN1xS78EFAtph
	O3EEDs4fbXzrdIaV1797VH8En+wmPYsBv21r6IeuQFY0h0ux2n46LL9LJdH+LRjf20xosYq624D
	eUglO/5cn5qjGj7s7IRbyp4EUm5rMubXiNCPAGFjI3tIaY5eiGfLCWuhw
X-Received: by 2002:a17:902:d4c9:b0:269:9a71:dc4a with SMTP id d9443c01a7336-294cb528b7cmr29036245ad.41.1761632904838;
        Mon, 27 Oct 2025 23:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0PQhb7nrOPw0owTHAb3UKocoVdUClhf+q6Z+WRWbHQ8BqO2EjJqP+VdWfwsWlpn2aNVCP9A==
X-Received: by 2002:a17:902:d4c9:b0:269:9a71:dc4a with SMTP id d9443c01a7336-294cb528b7cmr29035985ad.41.1761632904243;
        Mon, 27 Oct 2025 23:28:24 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:23 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:09 -0700
Subject: [PATCH 07/12] coresight-tmc: Add support for CPU cluster ETF and
 refactor probe flow
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-7-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=10579;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=2oaRzZpkpBcaDL+LXhi7LqTRCwRt9ypQSujziItZ0/o=;
 b=VbRLKaV4ZZf4K+mfX6223CCeK+C08cMMtg5ExiBoeA7d7WYQ+SrZBEsI6X/0m+K1BD90HjSrP
 YrqnvJpPDTjCu/4Ah1MCMgwVDHRCo6qdyWZXPDGgsCIUD3y2jzNnZv/
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXyCmG6RUXzJXm
 XJ4YVl5Mi9/2itp3KADLepKmr7k8wE/3uZsZfD1oLhjCKCW672bdAQyA0NE4SHXBUxYI3qjdKEe
 AB998Q7ivPVhVjQFj5OHaHe3+oxXGHgZuVljD3PMrGgNA3dar8ZQglzmfU3HtG6OhcesXQMlGEC
 rvHuorOtQB82m6jGaXQ/GYwW8Es3p58fuGjE9pJA4/wr+qA5lS13J3WKSuvqIdFTyccZSFFr5tl
 FpdqsE+btmRC7I88FtQKdPgXBzvTQ9Pwy9OlqDaNIyNJJlbBpQzreiCy/4LCZOKZSLupfIkAp0K
 vC3duBZdGstmCmcBPQi0wAdUIrhZ+NbbbESk5QttbAWtwkrO08HvrMnCU3e7kPZgzJ/0hc52Yvy
 +D8iMvArPVtvlJ0luCCN7tapcwMaIA==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=6900628a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ko4GrPIkLBdci27uQwEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: GJAcCESzUDf9r7wIn8Pk7LrlafM9Hy_n
X-Proofpoint-GUID: GJAcCESzUDf9r7wIn8Pk7LrlafM9Hy_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232827_146164_19C21DF0 
X-CRM114-Status: GOOD (  27.33  )
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

The CPU cluster ETF is a type of Coresight ETF that resides inside the
CPU cluster's power domain. Unlike system-level ETFs, these devices
share the CPU cluster's power management behavior: when the cluster
enters low-power mode, ETF registers become inaccessible. Runtime PM
alone cannot bring the cluster out of LPM, making standard register
access unreliable.

This patch adds support for CPU cluster ETF and restructures the probe
sequence to handle such cases safely:

- Wrap hardware access in tmc_init_hw_config(). For cluster TMCs, use
  smp_call_function_single() to ensure register visibility.
- Encapsulate CoreSight device registration and misc_register setup in
  tmc_add_coresight_dev().

This ensures TMC initialization and runtime operations remain safe even
when the CPU cluster is in low-power states, while maintaining
compatibility with existing system-level TMCs.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 204 +++++++++++++++--------
 drivers/hwtracing/coresight/coresight-tmc.h      |   6 +
 2 files changed, 141 insertions(+), 69 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6203e871fdcb8de569cc6701c52bb..d00f23f9a479ee9d4bdb4e051ed895d266bcc116 100644
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
@@ -851,44 +810,142 @@ static int __tmc_probe(struct device *dev, struct resource *res)
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
+static struct cpumask *tmc_get_cpumask(struct device *dev)
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
+	if (is_of_node(dev_fwnode(dev)) &&
+	    of_device_is_compatible(dev->of_node, "arm,coresight-cpu-tmc")) {
+		drvdata->cpumask = tmc_get_cpumask(dev);
+		if (!drvdata->cpumask)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->cpumask) {
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
 
@@ -934,10 +991,12 @@ static void __tmc_remove(struct device *dev)
 	 * etb fops in this case, device is there until last file
 	 * handler to this device is closed.
 	 */
-	misc_deregister(&drvdata->miscdev);
+	if (!drvdata->cpumask)
+		misc_deregister(&drvdata->miscdev);
 	if (drvdata->crashdev.fops)
 		misc_deregister(&drvdata->crashdev);
-	coresight_unregister(drvdata->csdev);
+	if (drvdata->csdev)
+		coresight_unregister(drvdata->csdev);
 }
 
 static void tmc_remove(struct amba_device *adev)
@@ -992,7 +1051,6 @@ static void tmc_platform_remove(struct platform_device *pdev)
 
 	if (WARN_ON(!drvdata))
 		return;
-
 	__tmc_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
@@ -1029,6 +1087,13 @@ static const struct dev_pm_ops tmc_dev_pm_ops = {
 	SET_RUNTIME_PM_OPS(tmc_runtime_suspend, tmc_runtime_resume, NULL)
 };
 
+static const struct of_device_id tmc_match[] = {
+	{.compatible = "arm,coresight-cpu-tmc"},
+	{}
+};
+
+MODULE_DEVICE_TABLE(of, tmc_match);
+
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id tmc_acpi_ids[] = {
 	{"ARMHC501", 0, 0, 0}, /* ARM CoreSight ETR */
@@ -1043,6 +1108,7 @@ static struct platform_driver tmc_platform_driver = {
 	.remove = tmc_platform_remove,
 	.driver	= {
 		.name			= "coresight-tmc-platform",
+		.of_match_table		= tmc_match,
 		.acpi_match_table	= ACPI_PTR(tmc_acpi_ids),
 		.suppress_bind_attrs	= true,
 		.pm			= &tmc_dev_pm_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index cbb4ba43915855a8acbb9205167e87185c9a8c6c..f5c76ca2dc9733daa020b79b1dcfc495045a2618 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -243,6 +243,9 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @cpumask:	CPU mask representing the CPUs related to this TMC.
+ * @devid:	TMC variant ID inferred from the device configuration register.
+ * @desc_name:	Name to be used while creating crash interface.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -273,6 +276,9 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct cpumask		*cpumask;
+	u32			devid;
+	const char		*desc_name;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


