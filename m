Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51250D68BEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QV9iwLUqvGNnwQ/I9B9ocDyfNDL63IncM7/Y+J+tBFE=; b=gYYwsNkGBFdl8VLxTgmWPuEQfU
	xpor5O3Z3YZ52ZdB0oGc4hlO7Rg43zaATFrSrlKLeTlW+q3p0vFSS9dbU9dzvfOytO9GxOpZBy4c5
	3ZZrw280LVf46UdxlEcyhXRgjOBzejusbQMrlhbzYKULKx+Tndly04/5NJp6mCOJ6b2rbeJEGdaPJ
	VQElRm2h655LCpXXjxg/QKteQj7hvRY0AKVTsVy2VNxK//5MThFIbsKQeYZm1DZXZtG/xwHsAC1E5
	xaMA0oIIUjy7i567Xe9mkiAeNvivbRpEienakywdRXYYw92usPNDh1iTwNEetcofAAmJ0t+oW+P9x
	Rsx9FdGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW967-000000080ry-48IS;
	Thu, 18 Dec 2025 08:10:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW95z-000000080n7-2Lgh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YU1J4057276
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QV9iwLUqvGNnwQ/I9B9ocDyfNDL63IncM7/Y+J+tBFE=; b=WBO0apXqgp0Ut8th
	zQWOTvTP1qFCvly9yEVHkOSzPj1VSdx38xQawInH8q3HOdcyq31XdiseoJXrKC/s
	6npe/C17kTqx4mN/NcpHy1GMF9XvCxyVi9ZGJE2dqH1B5YhSXu2szd/A9rXqzZp8
	qbELxHkE3VM2hYCbai7JVqjx1BV6lnjqjq1POBzPqNeWXDbOJnuVUY1FanODFsJ6
	wMuLzqPgaQ+efTO1Yt4DPexter4TV+Th2gJ4ODXCIV8soeOmdjbnCrTXlt1xmSl/
	K+jXZI58yyh5JwkVKyEdNqZaRFoLC5HkbMn1G+etMuCDCFSbQG2M/vAKhYGa9PgI
	fMbXuQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5ap7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso439936a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045445; x=1766650245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QV9iwLUqvGNnwQ/I9B9ocDyfNDL63IncM7/Y+J+tBFE=;
        b=CdGucBBKmTTR1mfLtdHFrgY8fdQe712DMWth7dSM2yPRtffH5QmDTKTjfoGCVfTbE5
         sf8kXPKqelOuatjDxJVxwYU9gIHqAL1c0qQBlKutXQlkLy4agqJBMjXWwQZuBRvQ8Lnu
         uSnSYaaSL+0fcrTvYzzmJdb7y1V3ryrf2/UFENbghisqxCd5mGH0HernCyAj5Q1+ksdZ
         UAwAM0WF1sxDnmgThNVskJJhq1VnmxMcgbelhk/sL0ZNriy4JPrj5RwsD6PCMbEEZSEp
         WzHwmojgnqaBlAGbvXCrCLYWri2WWBFrGuKgbYgQrxwcOiPDDHdBs2SmRJUDkDAoL1qP
         Wlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045445; x=1766650245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QV9iwLUqvGNnwQ/I9B9ocDyfNDL63IncM7/Y+J+tBFE=;
        b=Sua6GD2rpA6qN6ghb0zOxNK89H8m1zNsoJthGIX4OMlLRNb4W6vkdo8gmBsJbAV3T8
         T5eLpjRezWnueYQ2pQyLcuNFFgSVCLt460vfwqQ2j7UKONjNEhHu4VjugfkHJdBPTka2
         Z5w1r9ddUP2H8MIRk+T12gfonBMLJGr6oxQwtQZK5e2LK306pnj9ZpY4Z3EEnzbxrjQP
         i/MvdmadLTygbXMMsXNPvI0HTPgCQGOjs5FYARRQXtSbBn6rOYhjdNhZAvCKbSHcOIwg
         i3YdOvUb1UoeKuI6FdifxO+QwWrPlEyTk+xmsKvqnj/P+JD5Q5lMBNFyCCMm7eEWodqr
         Bt0g==
X-Forwarded-Encrypted: i=1; AJvYcCXmQTXnC0vd73TVWRG7Yfzi5QQPNpzt5Npz6SC+W9oIFFn0yATM+wDQ5z9YydzzNi2an0nM5NhH+LQ0Wm4lp4vT@lists.infradead.org
X-Gm-Message-State: AOJu0YzEGiW1VuGOK7wRns8pBShRkd+KSkqF925buzz7oQ4tuXK2Hno9
	pz34tQzU5o3ZBYDTyhulCiIMBX2ZQLq4uxG6hSA6gaxc0HbDqlLRm+iTvs9JXO3TlqPZQtcHlp1
	n9VbpM1Oj+Yxxon+VATZar3lbjG3JPntnwMmiBVAREIBp6PBdzF43Rpm9A41KpJ4Ei6AfMUl4bH
	6ykw==
X-Gm-Gg: AY/fxX78qOSNuPLIHEwGW7PMSHTFJ43BK0lR83QTWrNpwf639WjdEytpJPnMP5NdsiM
	HwwTn3ajcna+FEL8OXKNsjF59nGuxrH+rMHQuMqle5ezDUi7HN6BYmnM4CaUowfdrTjmDL9FjRL
	BhaYil5DDc/c0aUb7X8PxKAforJkKyoRqS27dg+P+s/g3d84BkrIlNaJ1Zm6z+/bMQeYZWXZsLo
	Wrc/Y4fW6NgGnVXot7aTdfWoUSeowhQmE0si4eNDoOx56+7bcffPn61MS9aOanWJW/xgeEH5cfE
	VcpOrFzRO0pz3puFRE136SzV+9JdrSYG4su8y5n5VWPgCscB5wtkOLGqtbJM0hHdWz8bM4u7TKe
	RJ0lBN+QwePMZS9GMCHZrCaLN4prpl2mp3ZRMfml0Np25juWRCJbgd7RUgYjL1hxPluY=
X-Received: by 2002:a05:7301:905:b0:2a9:9aed:bb78 with SMTP id 5a478bee46e88-2ac2f870696mr14035038eec.7.1766045444758;
        Thu, 18 Dec 2025 00:10:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh/eDqun5Dk+YDMbUnAnpbT8FADg5NH/ZyAZ/4PHmvghvGhT5S9NEAwXImAIKhHJzZvSD0Rg==
X-Received: by 2002:a05:7301:905:b0:2a9:9aed:bb78 with SMTP id 5a478bee46e88-2ac2f870696mr14034994eec.7.1766045444085;
        Thu, 18 Dec 2025 00:10:44 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:43 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:44 -0800
Subject: [PATCH v2 04/12] coresight-replicator: Support CPU cluster
 replicator initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-4-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=9933;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=zad/+HKvgqcPRsu64plFTKJAgpaj4lRh7Ypv4wC8mi4=;
 b=OxEMcFDqCRURYR2alE9C+qytbvWhgSWbsRUFrDfHwwuMaF1z3EtogAhvMR2S9BtRQMmz0t2Hd
 JGRF9VSAJPVAGqkrNLKWa2i3wDL6eSSDWffrwWGD1JSmqtVJS3Igms8
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: H8nt0PSroHVsoc9f6TvVTKZoXMvmCB7K
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943b706 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iEGaxejzB682sgr3lzYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX9aw1O/CAAKPw
 VUB7h3jtw6H8YCNbN+TnL8wnonnx6EAaexrouksNkN5Wlsxy9YhWst5AEx+ZhlfImGEyabhMZpE
 Ffy+MPjMSMn00+pn9bINFnS/qT/RONunZum0jb32VqlIsDHKeKAgzWXUfMUgOfmcBjiYX6kiOwm
 ReTxIoEp+OpzDMDNJb7Ii1J27KJXsYnFyh2jaGZWhNRTeUbcs7QJEWmGsQblSwCi9tUNGB0U8PD
 7/mUPYMnfFMl7MzSkbnQAxuSBFbqSBrVncAgmEvRLm7CnQPNRXbYDllF9w44qDS4xRg17j9+k7w
 qZL43nAKd5gN1HO6vGekTfhCqKNQL9UKwkmhhY8ZrASTXlR8LCmkWkQXdJQhSN4JOj1jtySdAQ1
 ZirlG4ofnaMjgcXcidEtpKZ3wLrsKw==
X-Proofpoint-ORIG-GUID: H8nt0PSroHVsoc9f6TvVTKZoXMvmCB7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001047_742095_C119835C 
X-CRM114-Status: GOOD (  24.03  )
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

Replicators associated with CPU clusters reside in the cluster's power
domain. Unlike system-wide replicators, their registers are only
accessible when the cluster is powered on. Standard runtime PM may not
suffice to wake up a cluster from low-power states, making direct
register access unreliable during initialization or operation.

Enhance the replicator driver to support these per-cluster devices:

1. Safe Initialization:
   - Identify per-cluster replicators via device properties.
   - Use smp_call_function_single() to perform hardware initialization
     (reset and claim tag clearing) on a CPU within the cluster.
   - Refactor the probe flow to encapsulate device registration in
     replicator_add_coresight_dev().

2. Cross-CPU Enablement:
   - Update replicator_enable() to use smp_call_function_single()
     when enabling the hardware on a cluster-bound replicator.

3. Claim/Disclaim Handling:
   - Introduce replicator_claim/disclaim_device_unlocked() to manage
     device access safely before full framework registration.

This ensures that replicator operations remain robust even when the
associated CPU cluster is in low-power states, while maintaining
compatibility with existing system-level replicators.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 200 +++++++++++++++++----
 1 file changed, 167 insertions(+), 33 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e6472658235dc479cec91ac18f3737f76f8c74f0..c11da452559c73af6709b39d03b646cb4779736f 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/clk.h>
@@ -35,6 +36,7 @@ DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
  * @csdev:	component vitals needed by the framework
  * @spinlock:	serialize enable/disable operations.
  * @check_idfilter_val: check if the context is lost upon clock removal.
+ * @supported_cpus:	Represent the CPUs related to this funnel.
  */
 struct replicator_drvdata {
 	void __iomem		*base;
@@ -43,18 +45,61 @@ struct replicator_drvdata {
 	struct coresight_device	*csdev;
 	raw_spinlock_t		spinlock;
 	bool			check_idfilter_val;
+	struct cpumask		*supported_cpus;
 };
 
-static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
+struct replicator_smp_arg {
+	struct replicator_drvdata *drvdata;
+	int outport;
+	int rc;
+};
+
+static void replicator_clear_self_claim_tag(struct replicator_drvdata *drvdata)
+{
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	coresight_clear_self_claim_tag(&access);
+}
+
+static int replicator_claim_device_unlocked(struct replicator_drvdata *drvdata)
+{
+	struct coresight_device *csdev = drvdata->csdev;
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	u32 claim_tag;
+
+	if (csdev)
+		return coresight_claim_device_unlocked(csdev);
+
+	writel_relaxed(CORESIGHT_CLAIM_SELF_HOSTED, drvdata->base + CORESIGHT_CLAIMSET);
+
+	claim_tag = readl_relaxed(drvdata->base + CORESIGHT_CLAIMCLR);
+	if (claim_tag != CORESIGHT_CLAIM_SELF_HOSTED) {
+		coresight_clear_self_claim_tag_unlocked(&access);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void replicator_disclaim_device_unlocked(struct replicator_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	if (csdev)
+		return coresight_disclaim_device_unlocked(csdev);
 
+	coresight_clear_self_claim_tag_unlocked(&access);
+}
+
+static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
+{
 	CS_UNLOCK(drvdata->base);
 
-	if (!coresight_claim_device_unlocked(csdev)) {
+	if (!replicator_claim_device_unlocked(drvdata)) {
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER0);
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER1);
-		coresight_disclaim_device_unlocked(csdev);
+		replicator_disclaim_device_unlocked(drvdata);
 	}
 
 	CS_LOCK(drvdata->base);
@@ -116,6 +161,34 @@ static int dynamic_replicator_enable(struct replicator_drvdata *drvdata,
 	return rc;
 }
 
+static void replicator_enable_hw_smp_call(void *info)
+{
+	struct replicator_smp_arg *arg = info;
+
+	arg->rc = dynamic_replicator_enable(arg->drvdata, 0, arg->outport);
+}
+
+static int replicator_enable_hw(struct replicator_drvdata *drvdata,
+				int inport, int outport)
+{
+	int cpu, ret;
+	struct replicator_smp_arg arg = { 0 };
+
+	if (!drvdata->supported_cpus)
+		return dynamic_replicator_enable(drvdata, 0, outport);
+
+	arg.drvdata = drvdata;
+	arg.outport = outport;
+
+	for_each_cpu(cpu, drvdata->supported_cpus) {
+		ret = smp_call_function_single(cpu, replicator_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+
+	return ret;
+}
+
 static int replicator_enable(struct coresight_device *csdev,
 			     struct coresight_connection *in,
 			     struct coresight_connection *out)
@@ -126,19 +199,24 @@ static int replicator_enable(struct coresight_device *csdev,
 	bool first_enable = false;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (out->src_refcnt == 0) {
-		if (drvdata->base)
-			rc = dynamic_replicator_enable(drvdata, in->dest_port,
-						       out->src_port);
-		if (!rc)
-			first_enable = true;
-	}
-	if (!rc)
+
+	if (out->src_refcnt == 0)
+		first_enable = true;
+	else
 		out->src_refcnt++;
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
-	if (first_enable)
-		dev_dbg(&csdev->dev, "REPLICATOR enabled\n");
+	if (first_enable) {
+		if (drvdata->base)
+			rc = replicator_enable_hw(drvdata, in->dest_port,
+						  out->src_port);
+		if (!rc) {
+			out->src_refcnt++;
+			dev_dbg(&csdev->dev, "REPLICATOR enabled\n");
+			return rc;
+		}
+	}
+
 	return rc;
 }
 
@@ -217,23 +295,69 @@ static const struct attribute_group *replicator_groups[] = {
 	NULL,
 };
 
+static int replicator_add_coresight_dev(struct device *dev)
+{
+	struct coresight_desc desc = { 0 };
+	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata->base) {
+		desc.groups = replicator_groups;
+		desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	}
+
+	desc.name = coresight_alloc_device_name(&replicator_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
+	desc.ops = &replicator_cs_ops;
+	desc.pdata = dev->platform_data;
+	desc.dev = dev;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	return 0;
+}
+
+static void replicator_init_hw(struct replicator_drvdata *drvdata)
+{
+	replicator_clear_self_claim_tag(drvdata);
+	replicator_reset(drvdata);
+}
+
+static void replicator_init_on_cpu(void *info)
+{
+	struct replicator_drvdata *drvdata = info;
+
+	replicator_init_hw(drvdata);
+}
+
+static struct cpumask *replicator_get_supported_cpus(struct device *dev)
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
 static int replicator_probe(struct device *dev, struct resource *res)
 {
 	struct coresight_platform_data *pdata = NULL;
 	struct replicator_drvdata *drvdata;
-	struct coresight_desc desc = { 0 };
 	void __iomem *base;
-	int ret;
+	int cpu, ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-replicator"))
 		dev_warn_once(dev,
 			      "Uses OBSOLETE CoreSight replicator binding\n");
 
-	desc.name = coresight_alloc_device_name(&replicator_devs, dev);
-	if (!desc.name)
-		return -ENOMEM;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -251,9 +375,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 		drvdata->base = base;
-		desc.groups = replicator_groups;
-		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	if (fwnode_property_present(dev_fwnode(dev),
@@ -268,25 +389,38 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	raw_spin_lock_init(&drvdata->spinlock);
-	desc.type = CORESIGHT_DEV_TYPE_LINK;
-	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
-	desc.ops = &replicator_cs_ops;
-	desc.pdata = dev->platform_data;
-	desc.dev = dev;
 
-	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev))
-		return PTR_ERR(drvdata->csdev);
+	if (fwnode_property_present(dev_fwnode(dev), "qcom,cpu-bound-components")) {
+		drvdata->supported_cpus = replicator_get_supported_cpus(dev);
+		if (!drvdata->supported_cpus)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->supported_cpus) {
+			ret = smp_call_function_single(cpu,
+						       replicator_init_on_cpu, drvdata, 1);
+			if (!ret)
+				break;
+		}
+		cpus_read_unlock();
 
-	replicator_reset(drvdata);
-	return 0;
+		if (ret)
+			return 0;
+	} else if (res) {
+		replicator_init_hw(drvdata);
+	}
+
+	ret = replicator_add_coresight_dev(dev);
+
+	return ret;
 }
 
 static int replicator_remove(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	coresight_unregister(drvdata->csdev);
+	if (drvdata->csdev)
+		coresight_unregister(drvdata->csdev);
 	return 0;
 }
 

-- 
2.34.1


