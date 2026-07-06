Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D700AC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jaba91hSwH71CM66VVDdMF22IKaDQ+KdMje88NtsjZI=; b=G85aookKk7+rR8jtzbTsJUiQRR
	zwsuq4TGO7AbhJ2GBFurnKUsQXWE5WaXIQJe9S5NFbAKfGkK5V1x/3bjEayKx5rVzE1iZNvbvXwSM
	8qeGkZ7eMUOaM0vl7iL1TPBBN/CIqCbhYLeZjBurErNO5ZqA8ppgHDzgQXDtRFeUScdTZ7c/qS3LU
	/M2zGQydPp7jHUV8WsTkQmz+EM1ArM09BVcHZDVSHI6lscjan9FPb+1AxejOV/D2dlrZoP4bqkMUb
	1b5qU3+uxiNqX8oVMfLxuYVKQHz3w8LOfiaVRs/HdCxVuk/H2IiF68wVV+eHfgN1zez43ZtnU7+fQ
	Cc5Z8n1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmd1-0000000D7yr-1mTA;
	Mon, 06 Jul 2026 16:57:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmcy-0000000D7wr-3efN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:57:06 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFEiW990343
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 16:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jaba91hSwH71CM66VVDdMF22IKaDQ+KdMje88NtsjZI=; b=FeXA6KSFxxCKlWPN
	zfB4pOD36X4FMU81gH9U7n2TsmhEv11aZ8Of/mtdTTHjcIjKXYgG/kKieTmxPJWi
	9s+yOFk9B8a73ftMjX+rNbDmmjK/62OrWuFZg1gF8zmgxv6qcIraW062mcnyL2nV
	XoGSgYfIJhfDdqlh8w/k+LF7IQOKkIpsHbTw9eQdy10fR/badamJnFFPaJKhdCn2
	1QjAomJdNYKFtLF+xKnh5ZY5FuvUxOsGXgLO8HA5u4+COwDMs9qWmkp+l5temi2i
	NTptCNejQfMwlK7JKFJgFA5vS11aWPc1vM51rHSuQ4NBNauHTaYeBJbgCg8CT2yK
	4AB4WQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gsyp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 16:57:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c856470fe9fso2596171a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783357024; x=1783961824; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jaba91hSwH71CM66VVDdMF22IKaDQ+KdMje88NtsjZI=;
        b=FG/4MCOvjUkpVKBV15vqdifN8d7n/2u5nE2SsRNZszI75kejcf6OSnBAdb6sTDAQyu
         PE7tXUB0Rdsubtkpbpk1/FjRsAirigELoZLlewr/usBvWS1XX+hiJCykrxX1GDjqEtU4
         ao98MFm9U6imk6hTOYQc1f+etNZMB6bzcyKBlKIr5jhhEufjB7MxbzLYCKzxeAX2+b4k
         pJIX+cREHnzj4Yti7iju6bygU2z73VawJsLAZURFkw4r733NFEt6KrhqwUSVHUeL28Vd
         adL/HrMMYL+n2GDvTRlj7egYotPxo/emoq5zFaOM5fwMHMEirbC9aRLuMePYN87AYTkc
         Ug8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357024; x=1783961824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jaba91hSwH71CM66VVDdMF22IKaDQ+KdMje88NtsjZI=;
        b=FQmq74NoIo0DijxURwkuVd8SdTyQv8gAj41UHlen5CuF0QrZS0vqV884nmxAkYJUdx
         RNTOaixP+26ftWsTg/jNBhtpkpju4ttVDSIE71Za74Gqe7YYGMZR+Rqf7xm2eNbTeMIl
         64VhE0XWqcxhXgHVvbBVE1kSTnWRkjJLVZ7b4ve8SaD4J2Ak3tS334hePZOCR3ivMD0B
         ERJ+6m7tM2rw+72CHo56VMhQzEzMIB2k8ewFhe19Mb2jXKkX/5xJqSMqM6hwrDMqg+HS
         tRdlkHT+F5vrVrsh8rH0bZg/IDjrIe7woEjohAVhibfotV/CBB5iJQz119SjGmTCz+yv
         lznQ==
X-Gm-Message-State: AOJu0YzNn2+k6pkggbB/QUtgL2NG5l78YdrkucX1bnbILDrragRcDvga
	ZQa2cOW6d4hMeGO0zyMrcmLKcjI3xyjm1DDuERE1mMYCWxrMMWCBFGWl7uArSvF/DG7tby/Va8v
	ynDgunatI7v/1zN3bFVZYsWVnGX4lUt+IVdNN+NnFWgnl3SSJOYmBJ4yRVwQEADCV943EFCdTpy
	wNLg==
X-Gm-Gg: AfdE7ckhY7FmnZ5/4wfJIzSmEF/+OxHUFNiVJpHGx3e71OJeX7hq/8lGsizD3Sodn3o
	KmS4vbHCbgcYv83G8Rbk3eSlRhnGEgnpXDHMwk/EZDUnhfdQXyc+43Gi25UrH3UhFhuveJSiKNk
	mJ5b/LgCto3TTLG2ySMbyMSE+G/jgdFzX3DYxi4wrEoR95uwLXqHSbd0hb22TJReL6lYulYz0QW
	wPoGgcTN1N2/Iz1OFr/c82Y8IE8jksMU2YH+5kAFV8NqY8fNeCPAvpzyPoRnGStkIf3VL0+VGLf
	6hrLqXkou4UtmgFRnig9x7q5lb8Aedk8KuM44R9nCt7NRDDwF73nk7WrDQKb/P2qPxBnJo/mixw
	R6hlhRJzqSr09DwDkm9LLTF6inbioratoq0FjJDJ+cg==
X-Received: by 2002:a05:6a20:c786:b0:3bf:7bf7:7903 with SMTP id adf61e73a8af0-3c08ecc4d61mr1761477637.15.1783357023705;
        Mon, 06 Jul 2026 09:57:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:c786:b0:3bf:7bf7:7903 with SMTP id adf61e73a8af0-3c08ecc4d61mr1761441637.15.1783357023259;
        Mon, 06 Jul 2026 09:57:03 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb0efc8sm6960604a12.5.2026.07.06.09.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:57:02 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 22:26:36 +0530
Subject: [PATCH v3 3/6] arm64: dts: qcom: kodiak: Add GEM_NOC interconnect
 for adreno SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-smmu_interconnect_addition-v3-3-afdca0125a65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783357002; l=998;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=p/ZYI2oyj2fs74BmC7SPx8h3Tno06dXdJ6gC53S2YGw=;
 b=In/dpfQ0xnfFS+WOyQM3+imZpa80Tr/uA6h882KzG/ER312er3VHUUqUAf3DCUI2XXwGHJYct
 kmZUcNUIAtVDcoKEsJ1BEuLuR8xQBkY1E84nx6fVeqE5mDpvMzLTqj8
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-GUID: rHH3o1JkQ8mg0Zs_LKhWsiw1vct-0Tv4
X-Proofpoint-ORIG-GUID: rHH3o1JkQ8mg0Zs_LKhWsiw1vct-0Tv4
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bde60 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_R9ktDxRehPmGBbURfwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfX9AolcndzSpWN
 oHyqnEcSBBzuK/mK/iclN7F7ODV2tRSt20IRG2u9o8CY+7eEDuUJXVpwI9nopQIs2H4mU0ZPeGo
 IiehTDjYK77DuDRb4DC8pvySYYLuK72JBTPFi5x6Robo4NqDtZWmuuCugsP717ynhVC6xOt6ssr
 OcfJ3CbuZp4Sz04p4yIItK5+R4j7qc8UJ2L2IpXLkOc3WVo5ikliTts++eXMNph4LgfG/rYT5uo
 5fpTCCpIpD/uoeDFTFFAvB7Blltkl5zQFCifNNJWxvisgfnSISNXCZTyxIyOEaU/xRR7Ycu/8Er
 tNtjD3DgOeJYuiIhbiSBNmUby3szanPCvqmf4nEbST0YKR7f1m3IuzmtWbCXhCarS3+56rx8Dpv
 CbP9Gj6bE1rjNF/JpnrmmOHvwWKyfF858gwrPbEpQdzWhiZa4vBtQukbyO8KWkuAkodH9kQ2XeH
 GkCVzC52rCOqLl9Rs5w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE3MCBTYWx0ZWRfXznYXw5BxIjc4
 y8p5NOwjstzhu29LbR+kWRhPaARMEvDlXsSWiwaArwYkhrZmv5AEhV4tM3UoU4otDO0uia7tGq1
 vNi36nEeXzgPBEMHsn0n2etp/IYq3Hg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_095704_923038_624EC2A0 
X-CRM114-Status: GOOD (  13.32  )
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

On Kodiak platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 90e50c245c0c..721526f023dd 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -3389,6 +3389,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		gfx_0_tbu: tbu@3dd9000 {

-- 
2.34.1


