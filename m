Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B107C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=; b=p/6ZBac6nJFvVXUKAhSMMxr7jP
	E8yzH9GwMG15CP59iNjFCbeqixclrQ04ptJesmpHxtS+jsbgTIm1LVhe4zsCZIRbPHgfa4P+tqhEC
	rzSXWpq1ApWJ7QcZH+hPnlfaIbSPcZ6pFtkJy1lEBo4F57Nz1cjz0+XXSnjOM+Tll4opkcWHpNOtJ
	hzBNwnuLknoTlj38zHY2R79Gs/5+S+S4AQucp+ZqBsFoJvLBSSwMnaASN1/it1yDXQyImE9npgwuG
	nOzbuRcnkXeSMVHjUNjgvt+NsIoNafujlkL3/hBm1b3s0k5tTpYdwixE3fOA4/DRDL0uzrFLgkZox
	UlO/tbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBq-0000000DH0m-0qNz;
	Sun, 28 Jun 2026 18:25:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBo-0000000DGz1-0Xe9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:25:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHjG5I456984
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=; b=OZgboEVuxMcDN85i
	Y5Ji1oWho8PfMGeIZdEbxjJ5YhcbiRGlx1BYYIadY0gw1ON+y14UyGDxP9tbV0PK
	HQi5qL1YHZkIr7FkYaTYWSeNBj3qEUFlot/67+zbO8oIxIVTMh9LdMwOu9rEElbq
	ikEo/IyDHF8/heK0jFMc6LViM6UUyaTbh8LxyQ/4NTmczhRH5Ry/8SRzS9TH+uVS
	NML3evCLmknzYfoGaM3xtTyHWe9PRWKTydf7LxMGmXTnO6pBar/pudLP74K3sO06
	d1eiWBjT06OBmioiovGWr0jppBEvimC0TBPwiNqkR1O9ObmskJ2f2ljbZFoInebQ
	FD0Keg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26u73fnp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:25:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c62861b3bso8507458eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671106; x=1783275906; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=;
        b=RFtlDG9dc27jrUcdBbgUXaSvnch5JHtVb4dVRIp1zR+mv9yDSlTTNvr80igctJUl4f
         xeGhClRYlpaRhbkkNXAHQ9LeIf+5gODS/Xm4SCOse8ZHbY6+BKPix5MYoqeBJRk/ZMhm
         QvLC2ZXbPRpMOBG1z0nPPZ6GQHQp6TCyTnY0ogFtZ+gzbZusUi01YEN5KsLfI/h6MPZX
         1F4Agxfq/D4XinatOlOHPdSHrEydcQOYwCKCszaQZPZstY1PgIGYzDqmHrZVS234/Nuj
         KHf8bnzSzuBN/e/E1zF9ZpMyNJcuZQlhqxZ3Lnc3eXsBypl+W2yvMp2+WsUaoC7eLthB
         9JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671106; x=1783275906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tZWd8W5XX7/HLNdwSpAX6KBOEbdxtoiIAFwHFv69UFQ=;
        b=i4fSLC7wHNcI6ILhlgh6jbeGTkEtaaRTXOsows6A8rChef0J75JtTXNSIUGzmijjHl
         kCKO5bidq0L2sypyfuPCMtjIuaiOjESHpb0/eCi6Y5QwlB9jUcWvVcB84/qdPFTjzeKR
         Jz2VJ+NXsklYxF1AEm4t65fxn5niDNgPWBNMak550LR71VdKeJBE06IgjkH0dVJzewoM
         XcYbt13yDpkS5DcoVf+Pd5UqeT+qJd1jVRVtfVDYxKCcBMWjrG3K3/XEX13nJamnN6t/
         xQHtfGpXEtsDKpjoN23nt3pT5kbJ7d/efaC0RGe+guqO6kF6fWhqyUuYWT4c0N8asW7D
         Ew6Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrq+0hRRxL1x8Dh8695ImQxxPjXsQFl65GaUCpVgC18dpfLjo8hFgQRUvu7wFCRCR5FASvlKAxtPIgDRz0uRT9U@lists.infradead.org
X-Gm-Message-State: AOJu0YwYvOD5Et0vYLbAh8UxqPPuRuPGuGdT3VYlnAN4oSUVZBQ+3azS
	CsSiz3dImsao5hmlpiZz8imBEnXp9Whpuqt4lO8n5Z1KRGL2R25lpU/FXnZaYBSe3oKEi1aj3HW
	V98MZzlPVAs0NA46pV4St1yNn5rqSvgaM0Wm1RO5FKGomS+177CXftK2uOsNZ8TYK/zCOAbr0oM
	34Hw==
X-Gm-Gg: AfdE7ckP4Gg0Qrj0+mp/WcldSPRoz4shN6tvKtU4toRBIqQwNp17So5GEjzNAfKE6Y5
	dJbjb3mpl04lHXYf4PeUh0aNurKZlkBU+hBHXvB4yIH5XCtumJIpj1EEGhlB5SqJfX5haPcg4KO
	yb6zTKv2vpVeiWe1ElOotj0d4tpK3kZM2nd1T/5vsjfgLvPAGWBHXJRq2Y3AdHGcdlL/tf/ROCO
	glz+1xx38weAoN5+llhJxg1uHZ9bDPsdOqw0PwNgVhXKOIpL8Oa2xMOCRqYVkLG7VpF7CZaMDQR
	RduHjeUS9i7QT//8c3JXRkBuSR3rQCGhbkVqyUCXK6cnerVNi1sa3AozqCuScNwS0J90TZkvZaY
	DsX+g0L/lXHpnUTVeAGDmRlcBhyZ6JBaGdrA=
X-Received: by 2002:a05:693c:6383:10b0:30e:c2c0:a7ea with SMTP id 5a478bee46e88-30ec2c0b39fmr1605927eec.41.1782671105994;
        Sun, 28 Jun 2026 11:25:05 -0700 (PDT)
X-Received: by 2002:a05:693c:6383:10b0:30e:c2c0:a7ea with SMTP id 5a478bee46e88-30ec2c0b39fmr1605909eec.41.1782671105369;
        Sun, 28 Jun 2026 11:25:05 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:58 +0530
Subject: [PATCH v3 5/8] arm64: dts: qcom: shikra: Add A704 GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-5-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=3396;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=esFO/JAL5nI43vIKxxFbdEl/5ME/PRB6OGuZfuTuB+I=;
 b=cVh4g1YdCpiwy7z9vQ1tG/9H+36qvoH8yaJMvnRIf/86r21odJv0LC0eJ6esfGD/OIpgsy8dl
 bSGuHuQPLv5CJuKWNam17yWd+3YB9Sd4PLC20Ocorpubqx9Ndcb9TJy
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX160RCOrJhlRa
 kY9uev3yoU10TVL4bhYXXftz9Xrz/Jt2o7drzzRfkqSnqu1bh825VRkPL+cGFx+wrX/x8cnL+dE
 6Srn5uxCGF1hMEBiPGaZ+uNiEhDqdWE=
X-Authority-Analysis: v=2.4 cv=ftnsol4f c=1 sm=1 tr=0 ts=6a416703 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 919xvPD2vlPTyfY5vi7TwNBvTIWPzcq0
X-Proofpoint-ORIG-GUID: 919xvPD2vlPTyfY5vi7TwNBvTIWPzcq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX0JYFAYd4OXiZ
 TVhb8gQzD3OtGm1l8YCD/yVejlTJtdp4A4J9hyE//eP52JJzRbIwmOMOL8WqrMuK2R4PloF4kku
 TAKabl2Ki1ZQIfQ6gT96a3uhovRLabSHwzZcgx6eC0tZgfjLKvtLiG4UQFEVL4Dm61AAbxzsrKa
 6uPvMuQrWowbkMMDGc6GGmn/CRe6zxF0sIKA8ZAlm0X0poIsp94sjJFPv519r4fsRx9xp89PPi1
 OllrOvIKe+pUFnF87o9xg9bab1upsBFjKtVybNTsQXdmjR+NSGJo4TTy4Mf+JbSxcN68adifcf8
 u3mVLVkKFzLEiq12A53A1MXc1kyL+e75CDF5cYSeS1OoaTeRNGAlwISE+kDVtVaE/t4hobca/S8
 P30nZqCxDv5oQ/WfDRDHr8QntHYgBWtwg+k/nCXQcEy+2YHxVOoAe2SmaAf2UPk3zs8KCYslnGb
 b4mup3nK6MUXZ3w4Tsw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112508_295596_A72BD987 
X-CRM114-Status: GOOD (  12.09  )
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
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 398cb1a4dc86..89cc5dc767e2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -642,6 +642,104 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
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
2.51.0


