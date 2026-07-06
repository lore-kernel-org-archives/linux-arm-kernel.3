Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA06C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeMZFJmS8I6MvmecXMPUITG3bfspevNiFJM+WXQ5LoY=; b=Ujj9hdl8Qthwgwwddxy+M29Rzq
	3i6VJItHWqebAeGCRw2qPrzB36wquuKiIMAlQPQ952gqdOFnqNCkrOhDGfIM+tRXFXI4i/v4i0m16
	U/K881C+fSMR3aT25sDST3US+dp4N9MGE+EHe0xVFwvAIxEY7xCln9VtIy4/pEBGTz2K4SDabkhOT
	nSP/0E1ywhZ1axNCsZdp2bJDWyc0V+moWPttp4PRHVlq8wLU4Olp66mHdiLTbAioEhvpJZaIRASeP
	R/8gtQy7BntduGIxc3Ydzu3ac1xrQadO1BmXrbYUf/2XVpLUnacpKtfZzX1aL1oWzZLXsNpTeRriQ
	+7jw9KNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmcx-0000000D7vr-07bG;
	Mon, 06 Jul 2026 16:57:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmct-0000000D7u5-41ca
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:57:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FsUKh1049946
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 16:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeMZFJmS8I6MvmecXMPUITG3bfspevNiFJM+WXQ5LoY=; b=GK//fDZdOHa5Ov5E
	1Q6DboppC21nvaIz6DWKAKlzeZFQ/4WZCHriDrQ0j1LPkmDsgR6RaHtRFOS2QwQ6
	sXfH/wgCUdjIMgyEc1k1T5KmZAndK5qznar5uHSUZJGNGgQzh6rB2A2miqN7qO5d
	E/BcznIboz+P6iFOz8QG4AKLxF31Pa981cqbtkVrz9O31ZD0/vu7ZqWKTyBTJLHF
	54Yiys9b2UONurX00oHr5yFZ+RtgP8i9hOodCM8pTNwJfEht+S09fQ79EHHD/H+M
	zkilUX+SHk404auE3sUt/jNueddEp6jpvp7SzalPe1p5EirkSIw9x++rTphy6CHv
	/g3/1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw0an0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:56:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88fc985a65so5425463a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357019; x=1783961819; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eeMZFJmS8I6MvmecXMPUITG3bfspevNiFJM+WXQ5LoY=;
        b=P6ZfKQpxQi9CR0o9QKr693fLxMEcS6pEsJcQT/9FPrCus1VzaMiMrTV86zsy0eUbwl
         kigpkFeIoQp9jOHhR+ynSEGgck4TRH7kgw/N0Ehj5ekHNu9D2LU5lGMISB0QUs3I4Gve
         a5n07Z6uMc3mS1IxVQMuU79FlSRg+IJMndq07wK7O8Ak99HL38Ik/LCKwf8viVWfL8Gu
         B7/kw9z4kWVY6+2gGMOp1hNs+3x0g71W6maetpOgHg6eYORkk8CX1lJ7LGXOn/vwRz4k
         Yv/1id6CODtH0uAgTpiOoUU8eZpFiFM0NMjkFHrf9EQOBkxohzqb7BJPwq5f8aMJo/zM
         cOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357019; x=1783961819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eeMZFJmS8I6MvmecXMPUITG3bfspevNiFJM+WXQ5LoY=;
        b=Wqx9LLDZEdVNf9Ek2b4lQ8Og4KOJElwVQAM0/bTTgAAvgDpLVwfEa8OFQvOXxepUHg
         VDd3/WzSlnspirbZF8Bd2oFt0qgwbSuZ6jNNf4c5zUWyZfTodjnp+enOdv+ZPiT/aJ4C
         Afj42uQiqpaTUk44w19256rhI0rS+t6faZMExqiXa5ayuAJXcGMeSYlRXo4i0qa9nU4B
         r2v277O/JSXomaNNCPc1CiOZJ7legtQoiaV96/Z66dMWPyx1LGe9jN1JqpZUR3Xh1ySr
         FpxtFqUfq4TchxLITuVNx2ZOO623fGMXLoFxuIRp3rsjWTYNDfPZclGB2G+s7mwCIBjo
         sxoA==
X-Gm-Message-State: AOJu0Yxz0on0ZgH62NtLKcpvXUJaY8DWX6+lhnWuVcquIKyVYuPu1rbR
	bzaE+sqiwfHILYgPNK6CFMXR4OHCBT+z8Ws+Fu87fT7BjsgFdCsbZI7vr8eEBww2Q/4t7Ts4Ag5
	NJ3G6gKskBY2LAYVdU5fMORUraSeytOOGaBuVu/8pa4FCD2ekOq0pN/Dwv7wY4TgBRuL1F/WQWy
	qkKQ==
X-Gm-Gg: AfdE7ck1yPv3dByvc7DDWEv2yLuhXYmfSHA3FCqw6QvbYBapyN8+DfSIKsdZu5Bg2Cl
	bDPrMh0l+NNXZIPoRLRPeZYE6IIb1FSsrQ93uHDckIxKx4CaeGINIbrt8NMykPoEGKcRcVWxSK7
	0oGo1Qc3efU3Fr6PLEgGJ83Jkvp0BMMxUGYNr85+m8coiY2lPrPTiRrGPj0ka46UjGPECAKqkiT
	9yE9MuhUiuSMvETQuhcWSP8hKqCftmQB5W43JcQ+Nc6A1pnlqPWObaDTFa6Np0XQlUowEw06fgp
	H5KFMbGp5VLn39ZnGOaq4mfI1mapogNxLypLGF86yAoMmVgJa9MQu7NTxSp4ncEr91GtFGrRsYZ
	scBIBu6Jk/UX35IsaXhUtRweaj1pykRHx7+M7TCKPjg==
X-Received: by 2002:a05:6300:67c2:b0:3bf:d487:4b38 with SMTP id adf61e73a8af0-3c08edc70dcmr1771529637.23.1783357018620;
        Mon, 06 Jul 2026 09:56:58 -0700 (PDT)
X-Received: by 2002:a05:6300:67c2:b0:3bf:d487:4b38 with SMTP id adf61e73a8af0-3c08edc70dcmr1771478637.23.1783357018123;
        Mon, 06 Jul 2026 09:56:58 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:56:57 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:35 +0530
Subject: [PATCH v3 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-2-afdca0125a65@oss.qualcomm.com>
References: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
In-Reply-To: <20260706-smmu_interconnect_addition-v3-0-afdca0125a65@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=8198;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=lat7Bx/Hq+cGZXWIYs7lxJhgcpijDQh+OJ5u9DwkhsI=;
 b=nAo1SdSTHRgHqoWATvufzYzKXA6ZSzlLu/yclNPZ/Su18G0rQKinCdWabI3CJGi0YHltUYo5y
 O9zxAukcXszCKTXclXBkKXSAOAvDyoEonRQeqlyX4jAe0fn3JicK1Zr
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX8kzE3lecmD7n
 9gvS2Y/sSFZoY92lKoEHvEfSenFmPRbC0Ib1aiDHdovXv1npUcRRAr855FpVACqWNMhRlHHsRLA
 0IpJc25xHP7meL/WvyXK1Qo7rLTtLeA=
X-Proofpoint-ORIG-GUID: XUbUc2vJ9V-2Pp2hQEScnshK-spsnPk7
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4bde5b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=EBvdZ6k9WR3IvNukGaMA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX/sr/KGZOYknQ
 bHAAUE1Q7HfVn0RY1Id3c2LndojCehEQaWgMH7aWSXpJmTCsdCu2HUDdbzMMraEp3nB2cEG9R5n
 PHjL6VoS0M1rZocbDjUhMWERbeKHkucsD2/JIJSLmy72H/OyTf1Wq+5CKNbAiiTCCJQDx3cO5I6
 J5rcolLHw2evYXn9eKtQybJB++EmFloTDnWXI9GR7IBJUij4ZwLTZl90TGJ6siOcFd0qldsDRyV
 qUp4mEcWqeKjjR+b7GPd7C7oUMWgoJaGQ4h5J/RfY2Zbt2EbG0lAyKa72CQtbEM8Lp6LDmxl9Al
 f0D8l3fnrPjSmOmjltZ7QC8ekpWXz+PojGO4FMOyTvxYoXA4GA1kYTXsAcAba0yR90Tg+D+IFnw
 01CerY/kZ4SFC9hRjSm+2mF23YWTiojlrnCzkTBmnqi0t7k+h82uaWufhhNZ5NNbHLrMit/6lDh
 rzVEB1xNU09ahv/qCXQ==
X-Proofpoint-GUID: XUbUc2vJ9V-2Pp2hQEScnshK-spsnPk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095700_022806_0F3DDCD9 
X-CRM114-Status: GOOD (  27.95  )
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
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 55 +++++++++++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  3 ++
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 27 +++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 ++
 4 files changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index e2c914fccd6f..5133d3ab023a 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -6,6 +6,7 @@
 #include <linux/acpi.h>
 #include <linux/adreno-smmu-priv.h>
 #include <linux/delay.h>
+#include <linux/interconnect.h>
 #include <linux/of_device.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/platform_device.h>
@@ -607,6 +608,45 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
+static int qcom_adreno_smmu_icc_init(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int err;
+
+	qsmmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
+	if (!IS_ERR(qsmmu->icc_path))
+		return 0;
+
+	err = PTR_ERR(qsmmu->icc_path);
+
+	if (err == -ENODEV) {
+		qsmmu->icc_path = NULL;
+		return 0;
+	}
+	return dev_err_probe(smmu->dev, err,
+			     "failed to get interconnect path\n");
+}
+
+static int qcom_adreno_smmu_runtime_resume(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 1);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
+static int qcom_adreno_smmu_runtime_suspend(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = container_of(smmu, struct qcom_smmu, smmu);
+	int ret;
+
+	ret = icc_set_bw(qsmmu->icc_path, 0, 0);
+	WARN_ON_ONCE(ret);
+	return ret;
+}
+
 static const struct arm_smmu_impl qcom_smmu_v2_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
@@ -648,6 +688,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.runtime_resume = qcom_adreno_smmu_runtime_resume,
+	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
 	.context_fault_needs_threaded_irq = true,
 };
 
@@ -658,6 +700,8 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.runtime_resume = qcom_adreno_smmu_runtime_resume,
+	.runtime_suspend = qcom_adreno_smmu_runtime_suspend,
 	.context_fault_needs_threaded_irq = true,
 };
 
@@ -667,11 +711,14 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	const struct device_node *np = smmu->dev->of_node;
 	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
+	bool is_adreno_smmu;
+	int ret;
 
 	if (!data)
 		return ERR_PTR(-EINVAL);
 
-	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
+	is_adreno_smmu = np && of_device_is_compatible(np, "qcom,adreno-smmu");
+	if (is_adreno_smmu)
 		impl = data->adreno_impl;
 	else
 		impl = data->impl;
@@ -691,6 +738,12 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	qsmmu->smmu.impl = impl;
 	qsmmu->data = data;
 
+	if (is_adreno_smmu) {
+		ret = qcom_adreno_smmu_icc_init(&qsmmu->smmu);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	return &qsmmu->smmu;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 8addd453f5f1..6835b40339ce 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -6,12 +6,15 @@
 #ifndef _ARM_SMMU_QCOM_H
 #define _ARM_SMMU_QCOM_H
 
+#include <linux/interconnect.h>
+
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
 	const struct qcom_smmu_match_data *data;
 	bool bypass_quirk;
 	u8 bypass_cbndx;
 	u32 stall_enabled;
+	struct icc_path *icc_path;
 };
 
 enum qcom_smmu_impl_reg_offset {
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3..a27804e15738 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -2189,6 +2189,14 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		err = smmu->impl->runtime_resume(smmu);
+		if (err) {
+			clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+			return err;
+		}
+	}
+
 	err = arm_smmu_device_cfg_probe(smmu);
 	if (err)
 		return err;
@@ -2273,8 +2281,11 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 
 	if (pm_runtime_enabled(smmu->dev))
 		pm_runtime_force_suspend(smmu->dev);
-	else
+	else {
 		clk_bulk_disable(smmu->num_clks, smmu->clks);
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
+	}
 
 	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
 }
@@ -2294,9 +2305,18 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	int ret;
 
+	if (smmu->impl && smmu->impl->runtime_resume) {
+		ret = smmu->impl->runtime_resume(smmu);
+		if (ret)
+			return ret;
+	}
+
 	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
-	if (ret)
+	if (ret) {
+		if (smmu->impl && smmu->impl->runtime_suspend)
+			smmu->impl->runtime_suspend(smmu);
 		return ret;
+	}
 
 	arm_smmu_device_reset(smmu);
 
@@ -2309,6 +2329,9 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
 
+	if (smmu->impl && smmu->impl->runtime_suspend)
+		return smmu->impl->runtime_suspend(smmu);
+
 	return 0;
 }
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328..ed08f86cf99d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -455,6 +455,8 @@ struct arm_smmu_impl {
 	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
 	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
 	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
+	int (*runtime_resume)(struct arm_smmu_device *smmu);
+	int (*runtime_suspend)(struct arm_smmu_device *smmu);
 };
 
 #define INVALID_SMENDX			-1

-- 
2.34.1


