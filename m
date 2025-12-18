Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10753D68BED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obNSaSTOOTPVE2brVhtt4blNBM8SFy3K9RGAeqq87XA=; b=lrr/T0Zll/1jdoygqSPqcAWemc
	leWue5BC+WBdvhBD7kuEm3AYY0jiyirsEs/sdBk1ZJljRUYO0iWs57PrNCpyr+LEmqBFyA37Mtm0U
	HKVIxBQ0JZYyi7yKA0k2naevfmEaB0NQUclhfqwq+pXZJ9ZQwx3Th86vKm0Dma4jtjoIkeeLrp2jZ
	0U2AvEmlwxpoyCpPb4krFV/1AfRlj7F5xh7YAlQR77nmI5CFYCRD94J0HnAWhwY0d5PGqUnALb+oj
	WpIs5zFZWIuP0NUMaKjy3KjtGG5KQyfSyEUhFMn1IAsuBu5kI1J1REja8cQeVoKXDfyXCZf1bwsGV
	85+msBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW96K-0000000810l-3j12;
	Thu, 18 Dec 2025 08:11:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW965-000000080pk-04E6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YTFG680496
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	obNSaSTOOTPVE2brVhtt4blNBM8SFy3K9RGAeqq87XA=; b=fi2Ewbikq3/Mbbl0
	DKmXEo9g4DTUc/lsviEfjQRXOHLJbavYYNECF+gsgjdTVzqjYeDmUlTzMfuW3To3
	X1ALz/LJ3QaQiaKkxZN1p9z8opMuQgoG88b7yxOTK8GJH/bzm6UWn3JwJtwc4Jv2
	MOLpPqAoiuOIOhZFEiCCrzhW62OANxQDSN86Yedo3f/w7oRrCHdEDjITMG4xb3B9
	C19W+kQCvcqbKezSWrRCjtgPDiOsaiYHEfLOF3uFR3aPMVCLAx49zT+9kCeq3gcr
	eJ63SMcOYR7advV9rQOmilgs8uPyqWyU/Qx6KrTzoAQNfCkaCrrrxcU7F0Y8F2kX
	WseAtw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhhce3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b99763210e5so780327a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045451; x=1766650251; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=obNSaSTOOTPVE2brVhtt4blNBM8SFy3K9RGAeqq87XA=;
        b=Q1/Psx9eYDaBQssyJVfhlvZE2nndBW+M5pICXMF9RFhqMnOqjNA0j7hFul35cKE6fl
         zZB4nnsflhn6g0sLI8lEjyErSwBiRaLZpzvO8bHdyJpWdjx7Syn5/5bRtkCpqK97E3xe
         +LRhS1e1uJ5VsHqiKkaRX8iNkT7fea6uwrbVIMUrOucexs/LsxG4Pv2GulThjm1q5bEW
         g1hCU3za9bCAM90yWSzdKmDniYHGzPNCqvLmFCNEYnokdSprpySfPeiEpnHIdGQkwuK7
         Uk6olXCuiYXdf9L7UCcLHD5vs8k5yhzPHGHlF59pyH8pvTvKeDcOCaqz36H1RbAufg+a
         7uLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045451; x=1766650251;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=obNSaSTOOTPVE2brVhtt4blNBM8SFy3K9RGAeqq87XA=;
        b=AhKtuCBNIlpgqqaPS1GRmmIiTws3+aj03xrFPHfq7LFA26i0edu1ITlZqYyolkKOUf
         PG5EcAWP/ju6FC/5QP7rspQy0M368WuLC6k5OzlBj3wLG3LHFxJs+TWfMn0CxO4SrULX
         BFh0YFUnBmJr1xnpsLvxx6knAdxLTdFbYe70d/SBpNmbD3U/TOP/rp751eLY7GLwuIHj
         f46Wa2QX3rULyB9s7QrD9ACohGQnwYDK7tYI3+nCJU49XXXT5Kp5PFP0aPINueiDTkLW
         M7qR0woMBKalQsfjOmN67Br3VSJLaM3kVgNaE9dHxjRRVbESO7BWhZol5YGT4sZEW3EP
         D50w==
X-Forwarded-Encrypted: i=1; AJvYcCU+G5r6KDwRETcDg+lnZOkeSi2DclGamrcocYdOaGMk+0o2rT1Hg0PcEZ0BU2vHjjvVxOJeSlwPaXa/1cltPnFb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3tN3dPpQozNNwgEleQ8t4Wh+D3zGSw3eEr/Bhc8JY1byg3KsC
	55DVpbMC+SfGqHShwP+jBzXNNIeNdR05StnujPMjCi6FGNRntFYm2CpirejCsNtaYYZ+VbNjvOd
	LnhpT7XHhR4phnv3rCuV4Y2/gUjgEFFw5MaKweWYA9yg2qaVh5pkzpqFFGi07KsT5g5nChcD9eX
	Tiiw==
X-Gm-Gg: AY/fxX6U9wGGSwcmy/iyCm6WWniDaIp26eXaI/wIwsEUI7Mv4E9FzejbWYLpoE55izJ
	9m2bFWjv//jlm+Maj5CcniXEuiZuGDyedum7AevkSLGDqRHIBa9HEHsJRaxrnmPJmCWuz4rYj9Z
	Y2U9nUAMvDspah2gVPbGGlRlCqvwV/kqQLeL78AQF3jyGlLkFKY+aSyATuzlBN7kK+Ld41+zbjb
	iYialjhf+eKmRHnjS/zKdxPyl29hksFpq8mK131KU1zpuyvp5YcHqv5YwS9s4VKgW4gp2iODDek
	yc0wQuypG0JxCCpf2R9kALQ4qzoWG3IxcUGSWdhkBCHFMYsD/FRGnQfGNMue5xO+SJTAox7vd0y
	G/b9LRdFgi8OXhiPIJ0dn+yUth7xfoPwAK0mreU73jD4bEMPl9Sb10OTVV9Gpadluorw=
X-Received: by 2002:a05:7301:470f:b0:2ae:598e:abe8 with SMTP id 5a478bee46e88-2ae598eaf3cmr4491209eec.24.1766045450732;
        Thu, 18 Dec 2025 00:10:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG//Ua7KzwxbW7K7yQH3IjKB6SQcK/rZ6YvZkRgVKeAv1W0+e6EfSeQeXBeDYpI+5c+wNI0NQ==
X-Received: by 2002:a05:7301:470f:b0:2ae:598e:abe8 with SMTP id 5a478bee46e88-2ae598eaf3cmr4491181eec.24.1766045450152;
        Thu, 18 Dec 2025 00:10:50 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:49 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:48 -0800
Subject: [PATCH v2 08/12] coresight-tmc-etf: Refactor enable function for
 CPU cluster ETF support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-8-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=5305;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=1g8pF946hN6QW1p+2Y+2RyrV1bnSaFCc0AvdfQQfoFE=;
 b=WalzKq5mo+m1DDBa+j4hcG65FGQtoJ3y4iK+EaoBGFEl1Vw118qcQjkGDdZHOm1k6i33ttt5x
 1kKC8wGvW7OBjHIQk7Fy4CY0PWitDwlSVzZ8QiZKiX/Izb0Z5cmPHwy
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: 6k_Fv-hBHyipBNkzoHjrf3nbVH_XzUVE
X-Proofpoint-ORIG-GUID: 6k_Fv-hBHyipBNkzoHjrf3nbVH_XzUVE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX6lDULZ9w/Gu4
 pKJghP7o/pd3mLPPmlnck2PM0kG1rBr1RQnXEPIkBzuhKG3/MRm6A2tPAV786kW4H+XoMfR7Q/7
 kPDZib7z5o6Mk+ab+iPJkIuMsvZVa3pWekPcuhgpIiI3217hbWZIblaGvAebRcL/ydWLTC7JWu9
 JlI4kMzuCMqufHlDd41FlPEntH4tcgwzDpT2tQ6DeQcVyfUxBDKJc85p/BX2w5dFo0oL0ovSVjx
 suaFV/Zf2BZyvRN7lPffFq/1vU50vhHCkmaCL17YS43U/ESGhoYm8Cf6ZAjrwt5xrChngc1gm+X
 OJWvoNf26EZMh/R7UMMvboGvQA4nzRkZP7xVoHJD/YMhvGQF1hI7nk0zXWRm2HdLdcM7X6dULG6
 gIKU8hDQuxFJLQ5gvPA7hbICw/fbNw==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943b70b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ArRTHoG_oAt2a2GmjD0A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001053_221039_0D09444A 
X-CRM114-Status: GOOD (  23.07  )
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

TMC-ETF devices associated with specific CPU clusters share the cluster's
power domain. Accessing their registers requires the cluster to be powered
on, which can only be guaranteed by running code on a CPU within that
cluster.

Refactor the enablement logic to support this requirement:
1. Split `tmc_etf_enable_hw` and `tmc_etb_enable_hw` into local and
   SMP-aware variants:
   - `*_local`: Performs the actual register access.
   - `*_smp_call`: Wrapper for `smp_call_function_single`.
   - The main entry point now detects if the device is CPU-bound and uses
     `smp_call_function_single` to execute the local variant on an
     appropriate CPU if necessary.

2. Adjust locking in `tmc_enable_etf_sink_sysfs` and `tmc_enable_etf_link`:
   - Drop the spinlock before calling `tmc_etf_enable_hw`. This is
     necessary because `smp_call_function_single` (used for cross-CPU
     calls) may require interrupts enabled or might sleep/wait, which is
     unsafe under a spinlock.
   - Re-acquire the lock afterwards to update driver state.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 87 ++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 8882b1c4cdc05353fb2efd6a9ba862943048f0ff..11357788e9d93c53980e99e0ef78450e393f4059 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -47,7 +47,7 @@ static int __tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
 	return rc;
 }
 
-static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
+static int tmc_etb_enable_hw_local(struct tmc_drvdata *drvdata)
 {
 	int rc = coresight_claim_device(drvdata->csdev);
 
@@ -60,6 +60,36 @@ static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
 	return rc;
 }
 
+struct tmc_smp_arg {
+	struct tmc_drvdata *drvdata;
+	int rc;
+};
+
+static void tmc_etb_enable_hw_smp_call(void *info)
+{
+	struct tmc_smp_arg *arg = info;
+
+	arg->rc = tmc_etb_enable_hw_local(arg->drvdata);
+}
+
+static int tmc_etb_enable_hw(struct tmc_drvdata *drvdata)
+{
+	int cpu, ret;
+	struct tmc_smp_arg arg = { 0 };
+
+	if (!drvdata->supported_cpus)
+		return tmc_etb_enable_hw_local(drvdata);
+
+	arg.drvdata = drvdata;
+	for_each_cpu(cpu, drvdata->supported_cpus) {
+		ret = smp_call_function_single(cpu,
+					       tmc_etb_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+	return ret;
+}
+
 static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
 {
 	char *bufp;
@@ -130,7 +160,7 @@ static int __tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
 	return rc;
 }
 
-static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
+static int tmc_etf_enable_hw_local(struct tmc_drvdata *drvdata)
 {
 	int rc = coresight_claim_device(drvdata->csdev);
 
@@ -143,6 +173,32 @@ static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
 	return rc;
 }
 
+static void tmc_etf_enable_hw_smp_call(void *info)
+{
+	struct tmc_smp_arg *arg = info;
+
+	arg->rc = tmc_etf_enable_hw_local(arg->drvdata);
+}
+
+static int tmc_etf_enable_hw(struct tmc_drvdata *drvdata)
+{
+	int cpu, ret;
+	struct tmc_smp_arg arg = { 0 };
+
+	if (!drvdata->supported_cpus)
+		return tmc_etf_enable_hw_local(drvdata);
+
+	arg.drvdata = drvdata;
+
+	for_each_cpu(cpu, drvdata->supported_cpus) {
+		ret = smp_call_function_single(cpu,
+					       tmc_etf_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+	return ret;
+}
+
 static void tmc_etf_disable_hw(struct tmc_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
@@ -228,7 +284,11 @@ static int tmc_enable_etf_sink_sysfs(struct coresight_device *csdev)
 		used = true;
 		drvdata->buf = buf;
 	}
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
 	ret = tmc_etb_enable_hw(drvdata);
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
 	if (!ret) {
 		coresight_set_mode(csdev, CS_MODE_SYSFS);
 		csdev->refcnt++;
@@ -291,7 +351,11 @@ static int tmc_enable_etf_sink_perf(struct coresight_device *csdev,
 			break;
 		}
 
-		ret  = tmc_etb_enable_hw(drvdata);
+		if (drvdata->supported_cpus &&
+		    !cpumask_test_cpu(smp_processor_id(), drvdata->supported_cpus))
+			break;
+
+		ret  = tmc_etb_enable_hw_local(drvdata);
 		if (!ret) {
 			/* Associate with monitored process. */
 			drvdata->pid = pid;
@@ -376,19 +440,22 @@ static int tmc_enable_etf_link(struct coresight_device *csdev,
 		return -EBUSY;
 	}
 
-	if (csdev->refcnt == 0) {
+	if (csdev->refcnt == 0)
+		first_enable = true;
+
+	if (!first_enable)
+		csdev->refcnt++;
+
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	if (first_enable) {
 		ret = tmc_etf_enable_hw(drvdata);
 		if (!ret) {
 			coresight_set_mode(csdev, CS_MODE_SYSFS);
-			first_enable = true;
+			csdev->refcnt++;
+			dev_dbg(&csdev->dev, "TMC-ETF enabled\n");
 		}
 	}
-	if (!ret)
-		csdev->refcnt++;
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
-	if (first_enable)
-		dev_dbg(&csdev->dev, "TMC-ETF enabled\n");
 	return ret;
 }
 

-- 
2.34.1


