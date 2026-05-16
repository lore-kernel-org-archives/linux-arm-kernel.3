Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B92FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 May 2026 12:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tMlahfmEth5dlLQRNO21reZ980LZhICbYSjGZLVRpM=; b=F50zkRPBwTq1qMZ5TMoWrl8rus
	Xe1r00aYLip0cVaWfj8CWVlklPo6W8WcXESzQAWWnG1U11cfG22z8r7ViJl3LVWRX7ldP27300INA
	Vk0Lx/k2HCd+pEPK4CfoqRnTF01O9hcTej8z28VzsLlggQAA5v3ka16Q2in8pL8JnIPUVcZ15iQEV
	lMFE+shkikK1MhcngoRZ1xqKpGrM2Xr8n3vh5GLqv/UuJ0L9+sZD5F+yQdsFo1Fz5GEj6Jr59uLO4
	a3hNn0wScujGZ1+71kf8AEQU/QQO2lUT2SOHg0vGwYgmRwTn8zeRllv+eZy8M43VS8KOpAAtMB2Q3
	nOBdqULA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEDv-0000000Aiih-3mbP;
	Sat, 16 May 2026 12:34:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEDs-0000000AihB-098a
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 May 2026 12:34:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3iLxg3750516
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tMlahfmEth5dlLQRNO21reZ980LZhICbYSjGZLVRpM=; b=THkNH11JahRpcOQh
	cgkOrfRZ1nJ+n25nkWnaibToFf0oA+EAifIhnxO6Z3clJmVte+16rNYY6B71rEDk
	rEalt+HaLjbzvJsdOVg+KWNxw4q2QPa/fd8SjbrTOaotR/9m5mb7IoQrKaPpUuao
	otv0eTHg4hCexmnDuuQxTmOYPWaHEQ4Oj07yrRePtHwAe+4GMnQjzePEFnqB8IqB
	jKoYGHAMs/RlOwawWTZg2gyAO2ftmRS+PB+VR+U6gXuAqV1+bey0xqgE3t/du8Zo
	W3s2QNkmbZyXt3qiJ1T2vdqYJ+nd+FodzmhLo741Izch9T7opqkxdh8SJSHYuO4Y
	FTSJQg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6rtw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 12:34:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fd55bf6cdso494287b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 16 May 2026 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778934867; x=1779539667; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tMlahfmEth5dlLQRNO21reZ980LZhICbYSjGZLVRpM=;
        b=B93G9a4ehiqZgwoUobsk07mpmRCRqqbYK0q8uN9QWNiLQfBqEGvLfFkefV+B0JFOOm
         NOnwR46TpAKSvKhrF6RPXePhOlpbO4i83/MjNaW39ynqvYaJdP/aJgJNDtJJrKOP+Cn5
         Hi/VdTlOI5lLKLtAdOk7wcLrQdAnwLTIrFerOhcAbGqer/9y4J1nKNhJ/rGs7nHXnt2p
         qAvwtFgdVrnrfwa1XotU8uG0Ku3qu6QrxNkooJ1e6miNvUlG3iGoYmzF4anROf+8skaH
         B6E1JHFRAiLbEpNxefLna696rZEOb+KSjTzli+TL+s66ypUib84419BEp2cqziLY+55Y
         z4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778934867; x=1779539667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0tMlahfmEth5dlLQRNO21reZ980LZhICbYSjGZLVRpM=;
        b=IzrFwLTIefgehmxMncaV6Zw5qvaA5fjYvD8nCXylqhyjwe55L7lx9k0/UNzHg2Y/dZ
         kg5FlYmHqhg9yPWyucZShec3cB1Ha5BbdrPgugUAtAFBvo6gujrhX7hI+417MQW/mKRx
         1tPG2H72KbcJ3jyAuv3LvGqhLV/hiNszKCKVzdewYwyT/Fm+Ztb8gLgNwm3/YuW5EISD
         C9H2Cp5u6PTapZr/BQqOe05OoHVm8l9CUuDfcDgeMLicjgXFvy4uzpQIJsue641OH+qP
         moP1Acx0tSz2IesxrgvkdVRUHwW54T8ypX5wZs+KPrFixEy6dcB1/bvQ5nP4BUyv84EV
         eW1w==
X-Gm-Message-State: AOJu0YziF2951wHx+InGMfyhxtjdq882OLuQVX/quf5ARHNRU2FRy11I
	NvoXSMVNokRDOA63wgNLKxspejkMGZQBfAmIbMwHixErCq6ESamCsOkHksiY3tc1dlQENOwPoGS
	c+TvlXSbYBXva+cY/rzzIk1dmxYdq2mvA2K5nj0wX4QUaJUtMGAeFrEvWa9kniy4tzlp9DdWNun
	+/M02gdNqdPQ==
X-Gm-Gg: Acq92OHFetXSbXe/wPkDJLav/HhG+gZMAQHWCEWg7Jr7NgTW9JdRGa4/8S+tUW8Wy3A
	5/dPqV4ymlVDXCabI69vtMJzCSJD7c4SLGlgXhqKzmcqDDViIZGWj0qK4upld2ynR8T3Fzw8aBH
	Gvh7ssXUExgC0nases2pChK7Ye5C++HzA7KOlhOVJ0alss1+twgmlAxWEZ0w57wpceDFxNS33C3
	Yslp4f6MhPLLQHCUEJlH1ynBvICT/wlGTA46UyiDYFjjdETpBkMaHz1P6ajFYdwfXdnNBIzRJaW
	93Z7VaV3iHXlRXDs5uK2q74G3/yPlKCSzAV5k9RS+9ah4s8FpHA3jNbdua1yVx6lAKE1mi/SxvD
	0suhCQO6Q4h9jV+FjvNvRbzpn5LRngDcFTsWdt7ScI0WgjeVpdBDP
X-Received: by 2002:a05:6a00:950f:b0:83e:6fde:54d3 with SMTP id d2e1a72fcca58-83f33f3d3f0mr7854673b3a.50.1778934866920;
        Sat, 16 May 2026 05:34:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:950f:b0:83e:6fde:54d3 with SMTP id d2e1a72fcca58-83f33f3d3f0mr7854653b3a.50.1778934866433;
        Sat, 16 May 2026 05:34:26 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cc9asm11405217b3a.53.2026.05.16.05.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:34:26 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Sat, 16 May 2026 18:04:04 +0530
Subject: [PATCH 2/2] iommu/arm-smmu: Add interconnect bandwidth voting
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260516-smmu_interconnect_addition-v1-2-f889d933f5c1@oss.qualcomm.com>
References: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
In-Reply-To: <20260516-smmu_interconnect_addition-v1-0-f889d933f5c1@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778934854; l=5165;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=TpMlPRysp3w2m+ZFi+sTeXE10yR8wAdZPz/OYCwHJZo=;
 b=yVvi3RjY40p22B42QDBaFIBVse8JGLs/A7douwNNONNIVhxQTgPq6cRhjnRT3p7MvcZ1o11+A
 IheV8q200YLDw6+xJEkE07G/1km2pLjSR1EpkJSR7EqLt4cgHI3mTcP
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-ORIG-GUID: qsCooVPVf0lJisO-Cwen3zoTry_IIzdn
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a086453 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=taUV0mOn9u7JAoyayg0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: qsCooVPVf0lJisO-Cwen3zoTry_IIzdn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDEyMyBTYWx0ZWRfXyuaVUSsv4Oym
 /53EJoxa5c1c73UrPp5dRA/RtEAS8aAUI7DcQSm+Mo8YIFTvHXHvaBiIXBeT6YOwWXIhUtd/niv
 I9k8uRDOIKYLEqty5ORQ3Bli0iIbm7NZFe9Q7srUylsUXae/yV7WtWWjvFg8ms5X7wCZFkM90NF
 vMx6FF1zqiVVA9WnR3srPHV7HYo+NqrSDrIAjPFBp41ObPZqHnPWfoRQMuo9LUC3Yue/yj7JXQT
 d5V4InNeNUJwGkXgvMNc+Ua0/cPVdRKnsVQjOlYtoLcL5JA8IXeD5u2Ugdge8rwEYohBWbZ87W3
 1yQIFmNngkv0b4A4MsKUtlwSKiuXpUqW7iHmCSXqEAZnxcMIwzRX+AqFlB9dNYLIm2AyS+DVwiP
 +fCyw1kFCMzxUjFXLLyDF6wEuIMAc0qOnAdDePue2hhA0zqutcBssqMU3FxOeVLIKXpZOA3gHj1
 NviXnrues/fELW4COMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_053428_086062_C6F9D07D 
X-CRM114-Status: GOOD (  24.56  )
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

On some SoCs the SMMU registers require an active interconnect
bandwidth vote to be accessible. While other clients typically
satisfy this requirement implicitly, certain corner cases (e.g.
during sleep/wakeup transitions) can leave the SMMU without a
vote, causing intermittent register access failures.

Add support for an optional interconnect path to the arm-smmu
driver and vote for bandwidth while the SMMU is active. The path
is acquired from DT if present and ignored otherwise.

The bandwidth vote is enabled before accessing SMMU registers
during probe and runtime resume, and released during runtime
suspend and on error paths.

Generally, from an architectural perspective, GEM_NOC and DDR are
expected to have an active vote whenever the adreno_smmu block is
powered on. In most common use cases, this requirement is implicitly
satisfied because other GPU-related clients (for example, the GMU
device) already hold a GEM_NOC vote when adreno_smmu is enabled.

However, there are certain corner cases, such as during sleep/wakeup
transitions, where the GEM_NOC vote can be removed before adreno_smmu
is powered down. If adreno_smmu is then accessed while the interconnect
vote is missing, it can lead to the observed failures. Because of the
precise ordering involved, this scenario is difficult to reproduce
consistently.
(also GDSC is involved in adreno usecases can have an independent vote)

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 53 ++++++++++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..aedf5edf8f9b2b75f80a61af66727b52a5b3ad49 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -53,6 +53,11 @@
 #define MSI_IOVA_BASE			0x8000000
 #define MSI_IOVA_LENGTH			0x100000
 
+/* Interconnect bandwidth vote values for the SMMU register access path */
+#define ARM_SMMU_ICC_AVG_BW		0
+#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
+#define ARM_SMMU_ICC_PEAK_BW_LOW	0
+
 static int force_stage;
 module_param(force_stage, int, S_IRUGO);
 MODULE_PARM_DESC(force_stage,
@@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 	}
 }
 
+static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
+{
+	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
+	if (IS_ERR(smmu->icc_path)) {
+		int err = PTR_ERR(smmu->icc_path);
+
+		if (err == -ENODATA) {
+			smmu->icc_path = NULL;
+			return 0;
+		}
+		return dev_err_probe(smmu->dev, err,
+				     "failed to get interconnect path\n");
+	}
+	return 0;
+}
+
+static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
+{
+	if (smmu->icc_path)
+		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
+				   ARM_SMMU_ICC_PEAK_BW_HIGH));
+}
+
+static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
+{
+	if (smmu->icc_path)
+		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
+				   ARM_SMMU_ICC_PEAK_BW_LOW));
+}
+
 static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
 {
 	/*
@@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	/*
+	 * Acquire and vote the interconnect path before accessing any SMMU
+	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
+	 */
+	err = arm_smmu_icc_get(smmu);
+	if (err) {
+		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+		return err;
+	}
+	arm_smmu_icc_enable(smmu);
+
 	err = arm_smmu_device_cfg_probe(smmu);
 	if (err)
 		return err;
@@ -2294,9 +2340,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	int ret;
 
+	arm_smmu_icc_enable(smmu);
+
 	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
-	if (ret)
+	if (ret) {
+		arm_smmu_icc_disable(smmu);
 		return ret;
+	}
 
 	arm_smmu_device_reset(smmu);
 
@@ -2308,6 +2358,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
+	arm_smmu_icc_disable(smmu);
 
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -15,6 +15,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/interconnect.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
@@ -335,6 +336,7 @@ struct arm_smmu_device {
 	int				num_clks;
 	unsigned int			*irqs;
 	struct clk_bulk_data		*clks;
+	struct icc_path			*icc_path;
 
 	spinlock_t			global_sync_lock;
 

-- 
2.34.1


