Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91225CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 19:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=; b=KQ3ibvbCkHwwBW2/w6qQfKD4N+
	lKXZ6jGwQ+P1N5V76M64hm56p5r3MTwtR+5M6WO6x3wWzRJL5AcPPAh9UkffcW1f6W+z3+V8nwGYY
	pOjOqxI4iYVrMRq1HRxEOjOZsW5UniZBs/WWqVJ0mKej8VzpK+7GHoU1VSw3HZHQRQ75wScOoIPIg
	FwXihcEVdDVYSJKcTbQC1N+D7kwukBIJsLmvwkLx9UAlmGBekWggzQIAgmFx2oMEZN3iiYA7B6UUI
	GBenJPVYQEdz7UbhCJsK+NQeEmHd6KRmCl5gsw7+UmAmZ34dkf1NL4vUTpAY1kDyVHTWy4TnJsMTO
	hmaAJaGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsgU-00000000D1q-09D3;
	Tue, 12 May 2026 19:22:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMsgR-00000000Czt-1fKS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 19:22:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4POb3320941
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=; b=AHIi4XZOid2bnlQb
	QIHtIk5OsfusjNOScnd7fdBKK8XoScIVE8weXJViPK6qOIkFnMDHkzuSXXl3ya4/
	bpcD4oP4jkNV9ukkZTlqRsMojjMcK1FyOWXrq/O1YQbP3t3mbQ7HF9qYAEw38sTo
	NKvqTZMO6cNaXE/9rcm+9nzEpdMaHDd+VT2BCuPUOMEzlz3enK4tIcEZ2XYxYNf+
	1M/xnjIAeV42EbXcQzJuamxAJeElG+D9nzcgTUv67R3R8lHicTuNTbMhksRX1Y6B
	fvz0WGu3BWiBZ0eu58gVfp2UXR8lStUa34jyR/YzOBDa5Nf4yd8ZXKmsa+Vs6Y78
	lHA9SQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1sp17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 19:22:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so77064235ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 12:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613742; x=1779218542; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=OjttmBljI7Q900jjJiF33cdn66tVtSqAM6Ab8zVeMY0mBt36St5tgeooPdPDCOfBkh
         r05RdBL1Z3/JpGP6q0BGMJ800jI4kDkh1XAGwpThrdZbHuQSnZV2gLRkPXe6zlTqAxw6
         fWcrtYIa2J3F3dF6YNdot+viGxtvk+nwl1vNoDl3DqufHZJToII+wtDIdZ0aVjyStzqQ
         Fi7dXLA9hxvox9LPtyMn68+24ci3F1S0z40AAdTjYKOIA82tSBUJ9MFCydCWOu3Y1l95
         Pstk9ULSV+0+DbnPRUFcjokXxqdyfywJE556IvCwP3NnpXnLUSGC95A29IrX6pGUwRVe
         HqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613742; x=1779218542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rSS+0xZwfP4yWE0NsCbw6sj47xOcxhNMbb0P26lUdAA=;
        b=QHeV6UpwqxLxD/nW9C1I4JP3UWnOcwIF2ot892D2LGzclvS43P8445dd5EjPN2B4oP
         CYm0JNpdopALyzsdhoY+dJzx2NjXMhSD0AkYSC8cgHlgdlUrVOK9SDx0BQM1yGPHChvF
         UyN+BovCGrALoUoCBt0/GhvVXVOd+czm3vWFaeUzu8DLEgkSoOOl4WwCvLd8EiMmGiae
         L6xExlwC9HLB6731LrLGyMr1JnrUajbJgWz0kfNSFPJjRhwrzodT4aEpOxGOjuitbqyS
         MB7PqZ618VN7VuYYCVjIz63SYOOt6cy/00fRbby7bbir1i0eRXb/FjYwD7h58evLBo4y
         E1EA==
X-Forwarded-Encrypted: i=1; AFNElJ8MCz0A816nE7EbaTw0vkkBLU271/FFoMf48yYK6j+7yPI9ycX60bm11jgfSFO41OW9J6dX0Vvx7WJLF86Uwhrw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw6gJMjyGWoPdc36EGp/bAPBgzqnfJrI6PnMrniWFFjDJS7T1H
	tH6lbsMlflaPWUJG87vL0sjPvmI+krNnnj2S81Uge+ZXi6JyUvUYxa5LjUq76+SS849RHYNI5+W
	7hfCn2Qamkkh1XgfrMTZykKo79uPW4Aof50YYK+Nn7M8F68U/xwLZF7WM3SUoFZlPJ0LOTiFkE/
	OlcA==
X-Gm-Gg: Acq92OHe0SDC/xePHFePdTxJDyyBUSIAyOMFNumUKshPOBcqSKRR9NEUuFBe0tr+9Ul
	A9JfSEe2JJ1sI9WskfWAwgA88xm7ERia8UBvnjC2oXgCZXWLz/mIY+rKiCUu2UIy5cq2VMBEixT
	QKOz7eMjugZgLBYCaHQ/sA6T4+rP2MCBIpdcgmta0vdfCf2chb+t72Ch8p0fz9MKGsEiyHHaJkf
	//TF6lt33TwoYzrY64WrQGhYfKzw2siJfF98Qn2j1O1IfLEd6fOrGUdS18/Ty1NCTRRZLFAZ/nw
	3YLHvLx7n6jHSUSR3q0BFfFwJbvi2NUpPxYEYbfrjMmhsgpBZw5ufYC29ZI62OdU3Nl75naTAib
	746xmL9Z4Qntsds8QptSabbUI1QV8lOvPAth05Tnqc1oNPw==
X-Received: by 2002:a17:902:ea8b:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2bd273a8a92mr2766015ad.11.1778613741956;
        Tue, 12 May 2026 12:22:21 -0700 (PDT)
X-Received: by 2002:a17:902:ea8b:b0:2b7:aba0:ac10 with SMTP id d9443c01a7336-2bd273a8a92mr2765565ad.11.1778613741469;
        Tue, 12 May 2026 12:22:21 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:22:21 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:21 +0530
Subject: [PATCH v4 4/6] arm64: dts: qcom: glymur: Add GPU smmu node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-glymur-gpu-dt-v4-4-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=2464;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qFdQhBrAHggcU0GWES+ohMA4WsH2wnpDPMNFqXrANzE=;
 b=qewqACwvjsAf5rvaenjM+cLqWEE+eh0c4Ai2zQhfpx1rVMx5eMwCU4q16+hHSs93d6WWBiv12
 Z0Idzufub4tCvGngKqrEcib/6jgSNpiH55A8CXbP5MkDaWFgVCZm9hL
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: VPIoamULWPAPW4l2a6PTlqRYsl8eyEBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfXzau0UyY1NTR8
 EBB+Gqi0AhOL9GvZkYzCOirnE6jmjywp3xDQEYAvK6FmAb44gphGKyc1KNXT4zhlcS9KcvzldqX
 18zjYYsHLdCjMdEQLgTBbLW15ZTwVpLf/J7rtl2MLCBk1MPYJmGhcuIVHN62dZ9dIPylp5ztwvz
 6vbuI3b6GhwnLI1+A7GyiHrUauES2VoeVbqP5OKcS9EMd5a4G0i27xXUyT61Hb86PBGD++tPFpu
 eKt7qZMjDKzAIE4ion8qblW+odrGlmREitj6fATabTKzfrmpd2Auy3V/9aZRDRgV3bhZZypqLBk
 nqNoPac+qTJusKLqms29eU4bGWc1f87DYeDpKDTfuqkusdC0XgSamc6n6RqBFv+4u2+fdYcBfi4
 RvKU4Rz6qtsbcGBzPjGuE2QjObhjL11yZBZcYzBxP+nPeExL5OrfPy4GLzVzW7xcTc2UZ/AwYrs
 fLAqKQjqhPjTb49GJow==
X-Proofpoint-ORIG-GUID: VPIoamULWPAPW4l2a6PTlqRYsl8eyEBa
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a037dee cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=XZrIUYhEBg08vmH-lqUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_122223_453516_CE735200 
X-CRM114-Status: GOOD (  13.25  )
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

From: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU node.

Signed-off-by: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index ed9aac42fcbf..5e76a0d53f01 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3729,6 +3729,44 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,glymur-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;

-- 
2.51.0


