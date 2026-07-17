Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F8CC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=; b=haBR9cbJymOa/w421uNFFm0sHP
	eR6rA6D5/EnD8YNOKvzWsEEuqT4hr0gMTRDhO3abzWIEGDsQ4Qz+in5MsAH3VPwJLEyCu4j4kweWU
	L+5Zt/TUzARW0YVuq+G/UPYYcNqyoZdJIlguvwWhXrYcN3oOuOFG7ORUcCUSIeKsOKVAnhj1EVgGL
	yNWbphAyMMU4NsWxj3sCfu5MbFhFiPGHNciTx1pVGWjOgBiefyVfTIkJ54S6ntV/okjEoY9aCJ6Vh
	cs15tuFFXfTzhuV5grRmscmEAykMzFshAKHB1y0V5L+7Ja+qbvGzFwQG5G7ZNDYZE0lsvzAxsChau
	KgZTKokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOQ-00000003Dcj-0oUn;
	Fri, 17 Jul 2026 20:42:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpOO-00000003Db9-1dWk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:42:45 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtrfD2753312
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=; b=GD3fzSng4mzaN34w
	lyG3oR0LBYUx3m+Qt/0ZhEE4VliGMDFm6RGxkvWJGSIITjX0E0PIklvvwsPM6VH2
	kazsXfSDaTgjfy0QA0mp+cdKHIegZGn+dKWdOUtkksdJ6EESL7y1JO6MHn7zmnL7
	sn7zeT/ui3A60R2MOqcqLdahw0HdPzn5/q3ZGdaiUVQw0QxcaELNswEc1Keb8wWh
	PYvfue02YKfPd2zbto0SUbUBpe4RJRJGlWFhIHMatbYBdq1KMPdYE8RAqCeYtx9o
	J+kjitAFjiqDO1dexz7SHzgKYcnvP1DPAHd643M5Grm+4UrXs1o7CSOceq9ex3ha
	U5RzAg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffpug19yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:42:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e4758ab46so1606505a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320962; x=1784925762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=;
        b=QTz5B5nIze0lWoYdEtb4N6C1ADGvdYFHnbdtjKGgdofRjQI/1QsYzsSQqsU9XdOzpr
         onPO3tyR/mdcqyVhwG98c9Y4yi91YMLOgeKOdM7rnoDH2ECRwVoYVeC4F1bUqihts3qM
         SB7CWOM3vmNjyqEtpvwBkNPgZji91+mnzHq9L/PSwQqdtBbkuzMgLCogGYS+AVLBsMeU
         B5dx8Sqh5fZO8VU2PVmmO5l5/12tETK1fSI0G7zSWVGVyQ7mX+YJAgUJZf575lbCUod/
         25s+3AHWhqvwcVDBpPN74B+nEUF3M6aI1ETm98mlSfMuLuz79JVMfrtX9inuXDpOCnaY
         qGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320962; x=1784925762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ8bK+zwxNxvelEPDVocGsp3nSNFU24C3BcvFq2dA/g=;
        b=baUnNK7T4Cz1VQmw0TbM3ddijTOpTLEgLjhznOJsILEyDRLhnA1xHJvhE3vB/W7awv
         CRuX/gvG4aEcmhymIHbC4Wii8T0bkouT/uFkyi5bbXIHU34KZg186Z8gHB4b6Rd+cUi9
         yCGdmvXaePBwKg7XZZjS98t5n1FrDVjOug7mwr0Sa8tq0AYe+x6++Xlucv/3uy7b3NA6
         w3uVq9KvNKIv8yflBV71uHJNy1ipiL6S0f/jlxpgvnfWihaecFQZ9W6sAmh8P22lkxXr
         8QGfk7oaY8Ql2Eq2LUN+VcEdBlpyDDO4DKzqDlJWQitVIPtu0p9Brv/yolm1NcdT1bm8
         bAmg==
X-Forwarded-Encrypted: i=1; AHgh+Ro2ppR0tfy3XXICydPIOu2jaSkLI2IQswntle5d9r1NNTo7hW1tIcaZW7v+Gu6robjEilfd/9KPHCRJL/1leHae@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq36xLGh3kmKO42PtWi6duGn1OcWL74dy6yKs/vV2j6ccSQ8XN
	qSpQk1zqmwXOdvha7R7T2jSPEjcbb9JQgCzcmMjCaBs33IRQMJeqz32B7yPBi79uyWr3kPRF++w
	eXe9ZCFNKq66ZGecbArNi3A6R4UsQ6Gkkv8DQIbp64wd/Lk8aYFtBWzmZROhveIR+Kin+eyff+0
	tJaA==
X-Gm-Gg: AfdE7cnFYZcGDt5oIGVhprurvLT5w3ST3ICSnqha/VTBa0Ej8+Frkxj3AQKHLsVAWns
	RFYBnff2C/56D2PI2nINkTB3UQEHTE49WNmbfaEMD3hXD+tHuVavYSwNh9sUXUSTNnjaDfXgglY
	KAORLnYgfJ6xtwDQ5RD+hWUnUy2fYkZE3ioBkGpEeQ6DvGskOHHhk/Z41h84DNTflv1R6gjzcKI
	bjnAXh92BcqcPkHsfraOFQsRmg2ye1JYBvoYz/wW7X9wam+TlPDtu2rkqaiB/+8aKB2b37e0npp
	z6IZEYW4u7rjnNUVSkqs71e7H+mR5i+hEI51WW9q0cPlIbyoTJGa5Isq3L6JprZ348cFRcbLwOn
	OkA+J1D8t6v7za8yq69S1ZN42
X-Received: by 2002:a17:90a:d44e:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-38e4b3d0fdamr4149526a91.1.1784320962267;
        Fri, 17 Jul 2026 13:42:42 -0700 (PDT)
X-Received: by 2002:a17:90a:d44e:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-38e4b3d0fdamr4149477a91.1.1784320961810;
        Fri, 17 Jul 2026 13:42:41 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:42:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 02:11:31 +0530
Subject: [PATCH v2 6/9] arm64: dts: qcom: eliza: Add GPU SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-eliza-gpu-v2-6-64379dbebd7a@oss.qualcomm.com>
References: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
In-Reply-To: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=2286;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=q+INaEIUNj0EXeDmcw5Jx9wg9/Og5BIcLTww5DoAVnA=;
 b=Xr36ABXncw9ToqIETUKiq9f7DTuutD8YoPX7Fr09ffFks3kKWGRv7D5+Z2AlU0qI/PcuMN7JI
 vyF+B9p/KGSBhQbdfWh2JQz3GCVlOhZthUh2mx0IpSvMqUeKCWSYaS+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX1DSwVbLv2Zq5
 1z8DRp5DTrQMKDYpnX6fQYLTuv4/fcLoYluRK3sr+t0RjccFzZVv+K3CBdQjIi6TqKnNBBA3nFO
 v72jWJgnCX7+QCf3bNS1Vz8ovbzjLMk0eifwI2Z/8dq/3CPvcVoKJ6vxWoY6IPpTmPTYEWpF8vn
 MkQ4LaBufiqae8IlWYYPEDB95q+mtFyN7s4NYX5/VB98hUlKkrpV3u3BRwka1WcBn7QNoAD8Sjy
 WnoH6vjYdQu9Y6nHNFlQIOlSMARMtICLlt4KgSmk7Z+es+Xke6168IVz0JD0Acb3/25ZQN5O9LU
 lfMEIf3RL706sOSDxYfxnZ2z3FEcNnJAQuN36/7eIdv/hIb/BuXdu0wVFJ9Ra6IfZ9r/UiD9aSL
 ogg0Cv6vE+HGbmg+uOyd1utGiE+zEBsifPr4IX0NMoxpwwfsDBq6nSLktgP2abiP/cfmcfd8n8f
 ++pTShw9O9Pa2BM8Dzw==
X-Proofpoint-GUID: IOE10nenIL84NvP_8rfAE0IktaZOC4pJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX8Ru2n5HE1Xjd
 2q4w+Ket/JgqHzSLCEKflsfDirxvW0WeZuw4ZUGYW1n2gY5dI5e2aEJDH+VogPIomLW7odgoo6t
 1KIhU/4SwqaC45Qo7R7f5NpEHqUTe3A=
X-Proofpoint-ORIG-GUID: IOE10nenIL84NvP_8rfAE0IktaZOC4pJ
X-Authority-Analysis: v=2.4 cv=Q63iJY2a c=1 sm=1 tr=0 ts=6a5a93c3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IlPRAfYEAefbqxDJwzkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134244_564638_12355509 
X-CRM114-Status: GOOD (  12.21  )
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

From: Abel Vesa <abel.vesa@oss.qualcomm.com>

Add the nodes to describe the GPU SMMU.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index c5635f22e2a7..e5b8377e6c3a 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
 			};
 		};
 
+		adreno_smmu: iommu@3da0000 {
+			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
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
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>;
+			clock-names = "hlos";
+			power-domains = <&gpucc GPU_CC_CX_GDSC>;
+			dma-coherent;
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,eliza-gpucc";
 			reg = <0x0 0x03d90000 0x0 0xa000>;

-- 
2.54.0


