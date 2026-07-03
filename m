Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=qiwRu+tEzbQh0kM2g8/OvqvXfe
	M++6BYfMpBfeu4TXk6wZsvqEDTZ+kNsF7zJOdGflzzHJ0aW64sVJa1dUpNDo8VGMuVDvPEbz+9jRZ
	zrg7p1BhGYbqI5aA7RL6Qdcq4HCK/XDkDNfHT7C3RGNt5cRqVeOuEOPwG6MGAt/DZAzKzE/f61gYH
	07xzpY8W2cL2fJbTh0bU8EKYSE2d6Tyl0y6RFWAJzLtGW5riqq/Pim5FGYCgkRXlrWA2CPoECRVuV
	C1YvIZtKphFDuR7vze7tPSXdkU/M7EMP1n7FMTIrPPYamogoCDoqiKFIqXK0bwYWUAYXchZlB8dGE
	T07k7INg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcH-00000007s99-23f9;
	Fri, 03 Jul 2026 20:36:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcF-00000007s7w-1wXr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:36:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPmIa1031231
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=kwWcc/aQsvDhuNvU
	sR7hpyO1eDnpBJVtmAbr9xTdsoTDV/umabqbahre0b6e4XNHuWEDLADYcmDPoIP5
	RVRpYv46JJcuv42nh/uIRPKVavgKEomucpLkYOCSstuaFiDolNL3MwQkgUCjNV1M
	Qe90JQBTQwnxVYPLP8yzo4Bw1UGjwwsWfb8jFqFKnLLGzoVAVbyTHxlAuBsbD7aA
	u/6rEvqbMjy+myKEK2uvwWQQ3FJC46T3e86XyArv/GU96C5rwAGjgJP2wF+sgEgE
	zc/24HIlzL3Oj92i18QWYdBgSptNqMIFYbW+1NEYBR0ZksdatmJ15lBv7JiFgbrB
	ol6OSQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5bw3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:36:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso1461926a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110962; x=1783715762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=WpNIY47DL4eCqc5LmuH0W0p3mBNKgGcvLLBEhOjN6aPfJXaiFxoZktlIC9KAdFKgc9
         ibYifL1imSdPVTlQxJsAVCdMRnrU6zHEiGRW+b5JtAyBs/59wgrvbHPoTucHMnAGF1nK
         TgHKFMCgbKDV7rCSBFVOznYj6Ycozyerdn2SolhdUs0Ia34kR1E9h5UHptMq3E+RFcsv
         ihR+O5Du78Tku8+msNXm344qL4qE9FWPWWXslECFi4QR9rV90bHsS6t/Chg7MlCri8aG
         Nr8pF26vfp8dhCDzuJvGEz9G+F9i7BQBCTieEuxHHMq81o7Kucrp83uwkazjLcYTNLWN
         +VDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110962; x=1783715762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=Z4OZIdSUuTrXsP6MF1RsLnrjWuAChLUdQHIKiCtPvYh+TucOlqisIH/FSEJV1y6teG
         uRgUOAyku2iOnyCJkBxrqWi7CmSz5PcumDkNOxqqwGcVxs3YWZVM4MgYNmG+UmHqmhRV
         sl+aW3lYRu2KKinPk39boAHDEJbUyaZYYXr5LNrqcRmBcia1YCdflCmWjy36EIL0qz2n
         8wcWWN7zq/f+n+im7cWiKzwVamZipOwbffxmJlTOdNnxXbXP2LcMGpfl/2VyyRKCWgZw
         PVMvlWwaeo0H34R0NXZQB7tdZVyq4f0Jrs8YUx1JxFY/K/fD5ecxCKu3Icdkh/Nfi/4X
         ZOFQ==
X-Forwarded-Encrypted: i=1; AHgh+RpMOln4DgAMErL2vJw8a6mRcUkHEz/jigI3wfXOFG5l/KWCm+LynGM4TBKJKy2S4pfHxPCkHQiVu/r4eaARtaf9@lists.infradead.org
X-Gm-Message-State: AOJu0YytCmdTZr3Efpnb0awkjsnWBd01s1WT4TPuc527c6TP+50+hZdK
	K58WFDnkSVEE8hhpb5YLP7QMMyXA2/eIKxJ9+ho//wMqkfO9Qik0XJrDelJJ3QgjHedF5vSWgkm
	btZsk2ZyCF/Xe2TT6K+nvfClgt/pzLhRwL1imIjheoN9DFN0K9bFaDUCBtOndWth7PdmoFymxh6
	1k9Q==
X-Gm-Gg: AfdE7cnCJyz1VRcH4caTau1z+oRCSjpJyICggfCnqwinTrAbcQj/4WTy8kyKpFLsIZp
	BLNuNDd8oaKnCU7PSXe/DyHOjCDxnu6cBd22fDCYWgbinVQfuHI0GOHkLUSvVXFKPo8Kq7K0GPj
	IX1WhesX77qsRzIEVoxGBhtOYHXGwCbm/Ko2v0f9YWw9T5hMx1/bHtFXveaEWg1AbL8ykgkmGsq
	+G6H4xe1RqofMsaLx+ca54oD/v2lD0ynCejITETVT0yW7YHLUYK67fQhvfheeL2H6D6NiK/D72Y
	XOxrwQQK34NoZJuAsKbAs2x4n38wMAHlB+Q6t9S+l+3g357xP5nPyIVPqM8JOqaUonyHO2Bnwng
	bYa8q+/oO7+oGovuSzW4xWmuCooGhp9ffZu4=
X-Received: by 2002:a17:90b:57c8:b0:382:1cf1:a0a6 with SMTP id 98e67ed59e1d1-3829f5eadf7mr875853a91.24.1783110962215;
        Fri, 03 Jul 2026 13:36:02 -0700 (PDT)
X-Received: by 2002:a17:90b:57c8:b0:382:1cf1:a0a6 with SMTP id 98e67ed59e1d1-3829f5eadf7mr875826a91.24.1783110961759;
        Fri, 03 Jul 2026 13:36:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:31 +0530
Subject: [PATCH v4 5/9] arm64: dts: qcom: shikra: Add A704 GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-5-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=ZlRr5sWqKb8250Ap/ksWBqpMq0V4lok4Fs/7+kMo7z64J193DYFwpD+3fTzxPU/vnV3Pvpcyi
 v/N3wBxCT//DPMPx7VhN1Xd25wRLqcduWT3dZQeV4ed2hEg3ZXl8MJg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX8FuI1Y0FPf3v
 IZyqYdWUBvVHSgK7qxVUktds+XBn2Pb55X1N6BzUBakBWj66w5Z+zgdKMTq7zQ3wTjiLWcvZXIN
 PZ76mBmRw0gEIFo5XzplZvSAyq/YAGM=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a481d32 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qMGev-uMO1lLZDsUI16N4TYqPZQsTTQK
X-Proofpoint-GUID: qMGev-uMO1lLZDsUI16N4TYqPZQsTTQK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX05+AiiJiqnnu
 dtgs3Wz6xS7BJoL8aVS7/FlIDFHwC/N4Ufi5n8EBph78nZ0j8ACZWybCs/H/3ZuaSRAvPauIwFZ
 QW5TwwLZ1IzLsxaQx+XZJPjdaOa+E9hKKWg0NQBEWOJIp7Iwas2tbNhuCgamx7FAdLVNY1TM7Pe
 zV4Z2Aivk6n1LyK2PUuioaenYM67O404dcvo6XZtif7sJ/POO5CILqQ+TGF++qu6bgx3Qf3iVK8
 +QpSGDcRCpiISaYTd2fBVfVBttE9QZi+TcvYtsboh6ylP0h54r8JR85R87KeDTznLaCF3Puu09G
 /4w8gxcRAXyyiGKAEPijJZduBOZ23iIR2gvetRXpgjVPmQiIHd7M+DHqu4RDrw96ujtESpaoNtH
 IUK8NGedlUHcejYlhhjnwvnQXSQj4fNIfaaRrURl37c8B94HSCObHc0WHufoe+zj/FMRSokQcC0
 QaazkHBcamhmeVeqilQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133603_520314_324A6E4E 
X-CRM114-Status: GOOD (  12.22  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
interconnects, IOMMU, OPP table and the zap-shader region.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bb11e832d9a6..34261221664b 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1992,6 +1992,104 @@ glink-edge {
 			};
 		};
 
+		gpu: gpu@5900000 {
+			compatible = "qcom,adreno-07000400", "qcom,adreno";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "gmu",
+				      "xo";
+
+			interconnects = <&mem_noc MASTER_GRAPHICS_3D RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0 1>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			qcom,gmu = <&gmu_wrapper>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-1142400000 {
+					opp-hz = /bits/ 64 <1142400000>;
+					required-opps = <&rpmpd_opp_turbo_plus>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-1017600000 {
+					opp-hz = /bits/ 64 <1017600000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-921600000 {
+					opp-hz = /bits/ 64 <921600000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+					opp-peak-kBps = <7046875>;
+				};
+
+				opp-844800000 {
+					opp-hz = /bits/ 64 <844800000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <6074218>;
+				};
+
+				opp-672000000 {
+					opp-hz = /bits/ 64 <672000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+					opp-peak-kBps = <5285156>;
+				};
+
+				opp-537600000 {
+					opp-hz = /bits/ 64 <537600000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-peak-kBps = <3972656>;
+				};
+
+				opp-355200000 {
+					opp-hz = /bits/ 64 <355200000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <2136718>;
+				};
+			};
+		};
+
+		gmu_wrapper: gmu@596a000 {
+			compatible = "qcom,adreno-gmu-wrapper";
+			reg = <0x0 0x0596a000 0x0 0x30000>;
+			reg-names = "gmu";
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+		};
+
 		gpucc: clock-controller@5990000 {
 			compatible = "qcom,shikra-gpucc";
 			reg = <0x0 0x05990000 0x0 0x9000>;

-- 
2.54.0


