Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5FAFF886F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eM3wqV1xUFVhxSiBOO41QTA+pPXWIIuZqz078+CSduQ=; b=vLDUtJ0wkWf3Zr1seN8St8T+Zs
	Z+n/Ir/z3pbLEyKuNLM2GIbtepW8jiM72GqadB16S/CGqLo8J2K9by+3I4XZ44gMFfPl8sMoU2T6P
	fjq3Uulj6Y2HO5N66Nrwh+sLVp7YrzgEqo3rU4frLhXMF0rJoTWYBQD9WkHrlEGIwqpsdZi6pWWdF
	8/hB4ycZHiXIY0WJ9qMmebZNjherHxR7Bw6Km4g5IXIdrGnmaAygAKeVoBSWHElThsBmO8E/ayGck
	R/qHIYyibKlLvrPXY57Megyz24ijWYMfDOf+e/RC+EmvuHR4D63OQIin+asX2VIvqLOG+f9vvvmva
	gpyXLNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmIn-000000021Zd-3naT;
	Tue, 28 Apr 2026 17:32:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHmIk-000000021Xt-2LxG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 17:32:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsRh81531365
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 17:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eM3wqV1xUFVhxSiBOO41QTA+pPXWIIuZqz078+CSduQ=; b=K5GBQs7drY0uxuOf
	gnR62s5/d20uBj/OgDijTzfHVxTJdKFbfaoiRGDgKzU3LqL4bmRWvQll+CYgoRiL
	6Nizt4FU1ZIrOhXhkq97UqPTT0cEVkTKPNbW4GPsGKFTixwjdD3hGSdURIm7dkwo
	FtcyqSFqBdBPkYCARTSho1YFkiQB0Fv4vMssGZva69NBZ8sJnZa9oYQDfEXLTVuv
	aJAwfokTyUvJiHyEutlijc266BqmIJPsHT1FFUYQIcmDNgYHP3kOq/0TEr8u1TsA
	zmv1kvuI4LtLa8mESMaFSsRra2xpwbJFUHwNFLBYjF4uy4/FtZtxEpOY+A+8YyVr
	QJoaZg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtud21n4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 17:32:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d5d1c2289so249051051cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 10:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777397569; x=1778002369; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eM3wqV1xUFVhxSiBOO41QTA+pPXWIIuZqz078+CSduQ=;
        b=XkTPYE+QsDQHJlu7jJLh0mMqqyBp5ilRCR9B1EiIoLvqiZuu35QKzm9OS1Kt+BbY6+
         RvFI2NerfmFgew9GolvHaPqG3ksPmfM0arZ/cmnCIvldoezrBYtkCY9CjdumpcUW5uAz
         Q17bS3tXMJ59BW0VytkxZaHIkJogs9wqbwWvG9p/bDele7L3VtbENXggEZIqWWSEfBFV
         LDFUXMc419jkCeoggI1E7PA/BwmTzIwGUrP/VgkC1phpPyjsloXFRKcP0UtiB1gXd4CV
         QLO98iOm2IPcrdfEzgCHt1+lBfA7p6FY2Z+Lm31LBaKIKUmFzWcqcOBJiihMFJCq7g+z
         cizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777397569; x=1778002369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eM3wqV1xUFVhxSiBOO41QTA+pPXWIIuZqz078+CSduQ=;
        b=mTCzkqbH/LEATwURkfxmXQcVQrsjBn9FA8DbFaS60c864Dk0vP2aIt6866TOK/f3ZX
         0V8G8TkH9zqvvOuBKyelIgdOBAzLFUiofTdfZYV5lHSBu9LCC34wQOyom0N7TFIkkfQV
         dpJheyqekTzcLdQ0nLDL5JZDSuUym1Rf3UAPoFZqT2wyIh2Xn9u7g4Ln5cxwX1Zppx2H
         C+241fbZPa14JjqTYBIXVzX6JeARbwyiVsvEQ2YRqB3Jz0XBHhoHkRgftaJ9/9/kpZRX
         73VtglV6WpFrC1FsDf+9fqef71hYib1DXPYXCaVyWxCJiWArrLEG9Z/LB2Bviktz2rM5
         TLkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fuTKXlfuv3HOyOfzbHZnwKwzdnggiq0Kx+JTCp8lYmpOzb7UL8IntzCVdXiy+f/+uRS3f+A0McjLz2DluXy1Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxrVpcO27lWLu9RYGshY9Gwkh2HLOQDoNzvWCQFl3yUeGyR1SFW
	dFj6gEiIoKUny254xA1Cs2bQfzg9fdWm3bJ68qeg9UUNVvUoXTPoQwSna+uF8NCvLzp9aT5awiy
	qxq3V7Bl5rs+f2y1D8r4o4J5JSk1xd16WOBXL4JPFhrqFHynO+tt8J9ywBmNq8Fn2jY77Zc3Qgw
	XlHA==
X-Gm-Gg: AeBDietTXeYnEhiy15YvQhJcBhvVTIiwy+7FAqc1PUztfIMhMHBzOhilxTnygZI2HUK
	Pfv7ePX7EKkc0zgNQNcX690OsjPTKvbSwhSjRCpX/ym7z3wcvgmdyI20RSKe/sKJV/xRjj2yzQL
	U8QMDn5jw/K0tVKhCDeGnRQWpNwwCMKw2L74ZQ6l5MOwbMO13p7B34d70grhx3ToFr1y/Y54pLU
	LHR3/m6hROJFWXmi3oGzk3a+DlnX8OC2elQCXIyl1tXnX2bQkj/5zIHwdyuF3cJEqKHXeNAxDgz
	nPliokjX8bVOuToCZFo3s0cSqrPgsNEppzkGZuHZ2hnXHfffBwW++PrqKeQ6hY/1DF7iYhyK/2I
	/y7C18sV+qIyAoiVeBbu6z8LImMoqMAHfYZNe4zgK1VtduA3+CrZ1zrk=
X-Received: by 2002:a05:622a:4d45:b0:50f:c36a:3818 with SMTP id d75a77b69052e-5100e1eec7emr52738471cf.59.1777397568397;
        Tue, 28 Apr 2026 10:32:48 -0700 (PDT)
X-Received: by 2002:a05:622a:4d45:b0:50f:c36a:3818 with SMTP id d75a77b69052e-5100e1eec7emr52737761cf.59.1777397567777;
        Tue, 28 Apr 2026 10:32:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b8ce444sm2089545e9.0.2026.04.28.10.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:32:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 19:32:38 +0200
Subject: [PATCH 2/3] interconnect: qcom: Restrict drivers per ARM/ARM64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-interconnect-qcom-clean-arm64-v1-2-e6bc3f7832db@oss.qualcomm.com>
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=12403;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lnRojrzUDGF3xytt+6kqTPBWEUZqfOPvXaupZ4RI+zc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8O84FmWchu9gppqtqL869FtkAfAS3T2v3t0gH
 2VchL1mPneJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDvOAAKCRDBN2bmhouD
 19J6D/4ku8cWUNdq/pKs8LQaJcxOXiZ+I8f9xcMPnsEKmWab4IVncVyGr53vknNIeAhuXZHJebQ
 EQAjrLZZ+WivJFUwTHtJBUDNj3B7mmlcwAD0klBSVFXwMwdqrVmAndJTF+yAd4VHG0AzwmdNDDl
 SVKNzE/ONeGULbIZvzoiQWy0dJNS7nagbxoN6//+ETFDIKuqEsXL/s7T4B/NiYwfxfJUE6CsOrY
 Na4Ukp/P1qmW1/izUlY04plIhAVyz2RIH3aPFgNnO1osTN8X58Ttzzn70PcxX1z1n+/ZKqHczZR
 CYwubvFQlfk2eGLA7jesnJ2YRZuis9pfsdFlCQ6MqP0Yixh2l/fLsjWMyqjAyPtl0gwY1celXpN
 RzcGeVMut18ZZOr7GvTUoVk3ZKJC+d26jt80PHh8ljBpVaC9F+wBjLhQGTnlL7o5khpzFwpOZ+I
 wy+h5ML/9Le5ayhOAHdv4hMnrEGGXXKtOn2YkdQ1cUvnTQ+lirJdDOiuEEWi4iZKJH3ks8A2Za6
 BrKPPgWQmbcul915j78BeVbEdZuPoLvUHJuhxXuJFpFFrPFVouPwQYjkU8ABDqSLvhSMcPO8ecw
 WmGWoORqyqNmfUHSoODTNX5ZLLlhoPVnicAJd4IUikbmBMp7lu1Yc1VI7tSd/YjqNSatgHjtIPi
 1+SmXDtGFqYz0sA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a/0AM0SF c=1 sm=1 tr=0 ts=69f0ef41 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2cCFUbKDXYVN_WJ3cWAA:9 a=dKjGhJZ7t35VoLMX:21
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jnw8M5qOBS48X4EZDIxLavGi8hGF82Qe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2OSBTYWx0ZWRfX1yngVdKhKVHI
 cC1FyzJodZL1hsWfNLPyLPwdUFgjE+PxjJ7jd0zKcWdyFmxZNXNDfAMdh//jwDPPx2MgCSNzIx8
 LLZAdZ4SLoWLId0dhw4nsNGG+cFfG5EgifXBw/3mF2l24rywBdRNXJJC/TdSt3RgvXdd8Vq64Tf
 3Tm8qnN8dFcz7eipHelsmTTboScCkFhqJnCQg26HrTBo1fzKZvyhfVgaP+Gfxf7BrpYmqRFUyIf
 6kx+bX5aL+Fe/XEiLrri6Y5vx91YGG+OnZXt4LA3lIUq5myhyW+sMgZQzvXuCt5Qs+5WIo9/F7Z
 8VRBcF2/nTzCFfeGjUw+z3mC4S3t2MIH+7WRUpnuR0w0J/52AUi0Uv+JHQYDkJ1E+te+EJB6c2U
 GKVcxsfWizR1bi8GTk4NES5BATIPMas0csT7dgGP0sEnHrk+jsr25ORP2SYoVGdqt14ZYvK6U7a
 j0R3swtQ62xQKru2foA==
X-Proofpoint-GUID: jnw8M5qOBS48X4EZDIxLavGi8hGF82Qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_103250_725905_D458D25C 
X-CRM114-Status: GOOD (  14.78  )
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

There is no point to allow selecting core SoC drivers like interconnects
for Qualcomm ARMv7 SoCs when building ARM64 kernel, and vice versa.

This makes kernel configuration more difficult as many do not remember
the Qualcomm SoCs model names/numbers and their properties like
architecture.  No features should be lost because:
1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/Kconfig | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/interconnect/qcom/Kconfig b/drivers/interconnect/qcom/Kconfig
index 871663bfd094..b2c4272ae48f 100644
--- a/drivers/interconnect/qcom/Kconfig
+++ b/drivers/interconnect/qcom/Kconfig
@@ -11,6 +11,7 @@ config INTERCONNECT_QCOM_BCM_VOTER
 config INTERCONNECT_QCOM_ELIZA
 	tristate "Qualcomm Eliza interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -20,6 +21,7 @@ config INTERCONNECT_QCOM_ELIZA
 config INTERCONNECT_QCOM_GLYMUR
 	tristate "Qualcomm Glymur interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -29,6 +31,7 @@ config INTERCONNECT_QCOM_GLYMUR
 config INTERCONNECT_QCOM_KAANAPALI
 	tristate "Qualcomm Kaanapali interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -39,6 +42,7 @@ config INTERCONNECT_QCOM_MSM8909
 	tristate "Qualcomm MSM8909 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8909-based
@@ -75,6 +79,7 @@ config INTERCONNECT_QCOM_MSM8953
 	tristate "Qualcomm MSM8953 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8953-based
@@ -84,6 +89,7 @@ config INTERCONNECT_QCOM_MSM8974
 	tristate "Qualcomm MSM8974 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	 This is a driver for the Qualcomm Network-on-Chip on msm8974-based
@@ -93,6 +99,7 @@ config INTERCONNECT_QCOM_MSM8976
 	tristate "Qualcomm MSM8976 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8976-based
@@ -102,6 +109,7 @@ config INTERCONNECT_QCOM_MSM8996
 	tristate "Qualcomm MSM8996 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on msm8996-based
@@ -110,6 +118,7 @@ config INTERCONNECT_QCOM_MSM8996
 config INTERCONNECT_QCOM_OSM_L3
 	tristate "Qualcomm OSM L3 interconnect driver"
 	depends on INTERCONNECT_QCOM || COMPILE_TEST
+	depends on ARM64 || COMPILE_TEST
 	help
 	  Say y here to support the Operating State Manager (OSM) interconnect
 	  driver which controls the scaling of L3 caches on Qualcomm SoCs.
@@ -118,6 +127,7 @@ config INTERCONNECT_QCOM_QCM2290
 	tristate "Qualcomm QCM2290 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcm2290-based
@@ -127,6 +137,7 @@ config INTERCONNECT_QCOM_QCS404
 	tristate "Qualcomm QCS404 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on qcs404-based
@@ -135,6 +146,7 @@ config INTERCONNECT_QCOM_QCS404
 config INTERCONNECT_QCOM_QCS615
 	tristate "Qualcomm QCS615 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -144,6 +156,7 @@ config INTERCONNECT_QCOM_QCS615
 config INTERCONNECT_QCOM_QCS8300
 	tristate "Qualcomm QCS8300 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -155,6 +168,7 @@ config INTERCONNECT_QCOM_QCS8300
 config INTERCONNECT_QCOM_QDU1000
 	tristate "Qualcomm QDU1000/QRU1000 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -178,6 +192,7 @@ config INTERCONNECT_QCOM_RPMH
 config INTERCONNECT_QCOM_SA8775P
 	tristate "Qualcomm SA8775P interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -187,6 +202,7 @@ config INTERCONNECT_QCOM_SA8775P
 config INTERCONNECT_QCOM_SAR2130P
 	tristate "Qualcomm SAR2130P interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -196,6 +212,7 @@ config INTERCONNECT_QCOM_SAR2130P
 config INTERCONNECT_QCOM_SC7180
 	tristate "Qualcomm SC7180 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -205,6 +222,7 @@ config INTERCONNECT_QCOM_SC7180
 config INTERCONNECT_QCOM_SC7280
 	tristate "Qualcomm SC7280 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -214,6 +232,7 @@ config INTERCONNECT_QCOM_SC7280
 config INTERCONNECT_QCOM_SC8180X
 	tristate "Qualcomm SC8180X interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -223,6 +242,7 @@ config INTERCONNECT_QCOM_SC8180X
 config INTERCONNECT_QCOM_SC8280XP
 	tristate "Qualcomm SC8280XP interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -232,6 +252,7 @@ config INTERCONNECT_QCOM_SC8280XP
 config INTERCONNECT_QCOM_SDM660
 	tristate "Qualcomm SDM660 interconnect driver"
 	depends on INTERCONNECT_QCOM
+	depends on ARM64 || COMPILE_TEST
 	depends on QCOM_SMD_RPM
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
@@ -241,6 +262,7 @@ config INTERCONNECT_QCOM_SDM660
 config INTERCONNECT_QCOM_SDM670
 	tristate "Qualcomm SDM670 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -250,6 +272,7 @@ config INTERCONNECT_QCOM_SDM670
 config INTERCONNECT_QCOM_SDM845
 	tristate "Qualcomm SDM845 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -259,6 +282,7 @@ config INTERCONNECT_QCOM_SDM845
 config INTERCONNECT_QCOM_SDX55
 	tristate "Qualcomm SDX55 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -268,6 +292,7 @@ config INTERCONNECT_QCOM_SDX55
 config INTERCONNECT_QCOM_SDX65
 	tristate "Qualcomm SDX65 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -277,6 +302,7 @@ config INTERCONNECT_QCOM_SDX65
 config INTERCONNECT_QCOM_SDX75
 	tristate "Qualcomm SDX75 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -287,6 +313,7 @@ config INTERCONNECT_QCOM_SM6115
 	tristate "Qualcomm SM6115 interconnect driver"
 	depends on INTERCONNECT_QCOM
 	depends on QCOM_SMD_RPM
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_SMD_RPM
 	help
 	  This is a driver for the Qualcomm Network-on-Chip on sm6115-based
@@ -295,6 +322,7 @@ config INTERCONNECT_QCOM_SM6115
 config INTERCONNECT_QCOM_SM6350
 	tristate "Qualcomm SM6350 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -304,6 +332,7 @@ config INTERCONNECT_QCOM_SM6350
 config INTERCONNECT_QCOM_SM7150
 	tristate "Qualcomm SM7150 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -313,6 +342,7 @@ config INTERCONNECT_QCOM_SM7150
 config INTERCONNECT_QCOM_MILOS
 	tristate "Qualcomm Milos interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -322,6 +352,7 @@ config INTERCONNECT_QCOM_MILOS
 config INTERCONNECT_QCOM_SM8150
 	tristate "Qualcomm SM8150 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -331,6 +362,7 @@ config INTERCONNECT_QCOM_SM8150
 config INTERCONNECT_QCOM_SM8250
 	tristate "Qualcomm SM8250 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -340,6 +372,7 @@ config INTERCONNECT_QCOM_SM8250
 config INTERCONNECT_QCOM_SM8350
 	tristate "Qualcomm SM8350 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -349,6 +382,7 @@ config INTERCONNECT_QCOM_SM8350
 config INTERCONNECT_QCOM_SM8450
 	tristate "Qualcomm SM8450 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -358,6 +392,7 @@ config INTERCONNECT_QCOM_SM8450
 config INTERCONNECT_QCOM_SM8550
 	tristate "Qualcomm SM8550 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -367,6 +402,7 @@ config INTERCONNECT_QCOM_SM8550
 config INTERCONNECT_QCOM_SM8650
 	tristate "Qualcomm SM8650 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -376,6 +412,7 @@ config INTERCONNECT_QCOM_SM8650
 config INTERCONNECT_QCOM_SM8750
 	tristate "Qualcomm SM8750 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help
@@ -385,6 +422,7 @@ config INTERCONNECT_QCOM_SM8750
 config INTERCONNECT_QCOM_X1E80100
 	tristate "Qualcomm X1E80100 interconnect driver"
 	depends on INTERCONNECT_QCOM_RPMH_POSSIBLE
+	depends on ARM64 || COMPILE_TEST
 	select INTERCONNECT_QCOM_RPMH
 	select INTERCONNECT_QCOM_BCM_VOTER
 	help

-- 
2.51.0


