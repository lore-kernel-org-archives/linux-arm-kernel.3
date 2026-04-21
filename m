Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B46CF89256
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=jLHdyrk2qrIsbIkfyaH6HAxPS3
	8PlQnObe7rOmyBO6FeU8fwcGyethrUe8YA0Ml5OvIqOvlV+M+DcYX5iGQOnVI3LjzbbBbdtyipBdO
	Kd5Zglh5CgJ7z8ThBuVbvzsxMdSfPF17YwhPKK2+qBuHf3qQ8WxPsr8GBzzOMipP/18nbpns65cFN
	cSKlJmC0NvMBui0N4hn5OmvbkeVej9pIbrbD72k8CZxg9fvG7AUOoh++n33GskrC4rXyV3VsiAfHr
	MLbhlZqc1Q+FM3y99SXdwgXZtEJfbVoMwbtEbeFbe5mhgYm2sxoUKA2ujK6QwIC39Z3MaulQPP8RW
	N0/KS4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mj-00000008Tmq-2PRF;
	Tue, 21 Apr 2026 10:56:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mg-00000008Tks-2N83
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:56:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9XVX93164709
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=T2Vicl+PjCLK69W5
	feWHLqGAh88oSlaRwtcu129JfQ34X1Uus7xOIsAgZ3rBUQWQXU77/Etiun81dP5b
	uR1plywNmeoACsmJV+16Zx31Lmj35IoWLRXNeyg/wBXp11kyIhrS9YoMDq1JLLuv
	5i1E7NQjJi9TrrLRbIPRbWYqU+t3CzjGZG3LYS2onqw88HrsahflCt1yw1G9LiC1
	gS2eMHfOVLWuFFyKkGjKzVbqba14Wr68dC60GE6uc0j+Y0Fk2d0Qml5ExyN9bT6Y
	L9kF7AnGXOmhOCg8Imp+uugIMDYXoH3xTZy+pwOJdkgXsSm/2YxsK0fJG0BcySQ/
	QGM5VA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q809a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f5f48458eso2385180b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776769009; x=1777373809; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=X8SZ3WcVhaR42ATNP5qnWROp6++zG52w2BATyOC2OUANDu0x+dEylAc3wwdqAquxmc
         n2NWw2xtNCBxUG4D+50BJDC953aGWa+xnj+MBF1vrTVIgpjH/PWgrdSMS6u7aoSBuhOa
         oNvnlP0I8LTqwyQ+FOeztDohJTTmhG1en2xu9pr3FxHDsAqRZfs1kqdv9gN3l44GttmD
         Ck85Fsmy/w2S7MDB8TxwQy10Uxi6TPRYUcr03K2+w4NjdIMgR8GTRKwA4AZtXZbGd6D8
         0TCHved+Jh1O2MoOYDpDkX/uvnSSkJuohHvfVUOu8U7dbqzMjL0eQj4pVYfn1awdaYx5
         m7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776769009; x=1777373809;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=EvkAt/1o9sMaBnyf2QEkq7/dOrZD9lNd4YhNRw0OXM9BpxYYiqKep66AP2gGJ/LNo7
         LGpe3Sn7zIEIfvGfrd1cxuSsCjAOHlilUQxsIrmNMp70HSjGaofXI/CPbEgVsHm2mIGO
         2I6hv7v6BVFkYlhLzQOS5In15JWx7CpwH3GNKLXq4JQ6WnyM6UH+kD4Q+Opq/nTgLwFB
         iMXSCtzaJgtW7orX0H1YNPiIwEHRHTyzbNt2DHMYdMOTgws3n6kOOV6dM1STI4Am7t+D
         hOEkkXvIvxybOv+iXy7aPQBZ7vAQc0adx0mTIS6Esq9oaGhdW569uXUcrd1Vocf9fXQo
         YcgQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/F46gq5U+PMVZAznjogctR4dft3KcLRDdICTJJKHQHQgtZ60vq1sn1AfDN4vFFbSzwMPNNICQdRR6wCEyxda2@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd/PT6Coa0sne+iclumvXcipuDWJCLiR65pcIbENoenfsU31uW
	SdWGDXPTE3ADskHBMJCXAd8UQGaYVSPasT0NnBBuJAGAW6/w9QCXtJcFDgcLaN8EwlU7XC6Aboh
	iVvKJVxnjNnIMe7hiJwEOJJq7jQ401Ha5wYbZEONVW77u5wPCdb6JyOxg5onP9n5qqm+d99ZDHg
	Y1Ag==
X-Gm-Gg: AeBDiesYB/1aMGVgnJepEO6YmIJ5yQZP39bywvsmTNtOmgqF4HNV5SIVIUwQdWgj3I0
	7Ngno/TVFrh7MI2/hXcAQOSGun3swnC6sEPqM3MkiL+Ct5DH0JuelHpmlp755rcJPhbtxJCzYqX
	Cw2nFoK/EipBgRBIbkWNvrNGrXp5ar8X18djB42MGLhztyfHMkqOhQemuJWuCiwhmmnRCg6uM2w
	HFoaewE65xjEqS5wEMa5353f/6EwVdOt/VSLpI8+bn+1ElIt/WqAnMilcZ/wsWbdwfWFAY1jA+G
	74QE48xzE9tdmXZV55oQiGzo5ZkhmrqBMhJtftdP4+iFBq1ww6lukAKnoDZrceX1Z/RrW6J/8Gv
	s+KXqiL/3O7g+12gefM+NVpqFxs7uFYj8f/LmWriX7SiJ4Uzu9ydXVbdWrZ0zV5Crg5K/4Bd8j0
	TYPbDooO0Ym4MgS1w3wyI=
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr17372793b3a.26.1776769008700;
        Tue, 21 Apr 2026 03:56:48 -0700 (PDT)
X-Received: by 2002:aa7:914b:0:b0:81f:3bcb:af2a with SMTP id d2e1a72fcca58-82f8c8c39c3mr17372763b3a.26.1776769008211;
        Tue, 21 Apr 2026 03:56:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:54 +0800
Subject: [PATCH v17 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-5-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768976; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=dCtlo03cBs3X5l1VhW746PQdMKk5Nr7hUDLc99rGvodxoulubJqgxT9IZaYBrHvYb0ocFDLYx
 jtbUug2pvSqBPRpenK555AWYnohpryTyhmMRtz/Ln1hrMNdRzzJgraE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX6tGSI1N4IMfG
 PCiwSq0lii7kVYFlBApM9c5T7NG7sKMOg/696HpTqbrDKecsdZBJaDI2SAjKQVdPRVI2OOQPusa
 NVTNeXv5nc/GzypU5FeG2KgHJKT+8Bxf5m0Z4eCiSb6cepw4aRSs7+G1xNP9e/fkRKFSwZhNpTP
 JOAAlWkX5/I9grRW+UBtq9sNEiRx61Zqkrk+7yfLLLhd8nXOhohzWs3UcsWjeVFBvu5KknRsIeH
 WyXFZ9lM50HuHCCd7brXf4mBo43thJTMynEA4UIYkK7kHvzrzNHLzV2zRlkuzL7WsqlhRSCgMZo
 BZ3gC/yIY7IZyzBw+KBzI2H+WVONavRNVhrMCDfb8yF1H15QZhN5j7zrUnCPw6mqNY7TxAcB0GV
 YKs+uY5KaUHQgiVwyKd0Eth61c0gRxbUYrXH+h6jTJrGVe6P40lY5O95inL8psL+Pq+6Pdwt4Bg
 m+gLAbekaI4SAA5BQhg==
X-Proofpoint-ORIG-GUID: 1WItFJYwZOrg1GCZjRbgf1DDxF63pViS
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e757f1 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 1WItFJYwZOrg1GCZjRbgf1DDxF63pViS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_035650_727404_CCEA2B82 
X-CRM114-Status: GOOD (  14.49  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


