Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5739CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=yesQ/Orb9HZiIbdqsSsdia3fG9
	rk45NuR15Le5K8SSF/jmTQfvMc9fXTEILp752fTTsp3KATG0+8Jxjlty1Et/ayLrx8owe4MgFNIvR
	xdfGMRxXMNH9YGi43OvED7D4lIR12coxm56mMmGYL9VtAVoTPmX2kMWU3RE0RBCC73bpdIuvV+i4N
	vG3vUMtrlwm4I4QFF7eW6HcGKX58EpICNzt7vF3sd++k9ZZYWnH9stflc9mKSIijywp11dx0nUe0f
	u74SXJxri8Hqj+Al223BvzGIej8umRkb+c4drwlGPW7dmaO+aiQNlTW6axl9e6XA7vLOhcFO1IlJ+
	BsubiovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtiE-00000003I8U-49JI;
	Thu, 09 Jul 2026 18:43:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whtiB-00000003I4t-1p7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 18:43:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HY3HK2520612
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 18:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=Nn93OOl8OZNvmHgX
	gvJJp5QWD8pxMtDdHmWnsdrAZYMSIBorgL7VdW313o8cyeJEFCUe+Ns5n6Pj2G1Y
	dfOfGefQdFUOLAmNfMULNJ53GMT6g8U6vVNKvnHfl+CC9+0/XY/dCIgLEz2MS0cA
	OR3ZdUxt/zV2qH3Z1FCZtTtq5dlLlWdpFcWNReTWRvGmA73ZeH4LjvjRPD5Xon8G
	vxFnXP6Fn09KMDSrgj60yrNRaPl7kLL+K4VdnTU+hW7LpwfEMqRKj5xnPZ9qC9d5
	jawDxZjcAW6rl7rDnpyK1O3+hsvoslrNdcV+kd/mtbYCgm9gY4oO4oD+iLH6TbPi
	weFEEA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn8wsc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:43:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so236022a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 11:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622581; x=1784227381; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=CaOI4lj75Vdl7Y5kTvPmvqR1vRSUX4p094hJGMwHA727koYBiNSPhuwJLzPcziuKvn
         i2hlomVFsoBCxPB+5o+81u0zgVnk6X75QGNOyLaWlILWqfZh41MtGL2/5za0TWGSiizY
         LvpOZ+eF/SoMi5lrKflBS3Gc4rlIcq/XUcsQfT3qb5/O//mctxv8EGJO1Wzujkf2lt9Z
         nzF3RhAwyaT6Y0/mLePvukFgRG3Yuwc+34wY0OXNd7Ymg0f/DKTgpf4PsI8BeCRp1lnj
         EHYJE+zWwKwE2CmGiG0so469sgZBOlfgWAS01eH/BONTn9YjxgfHYix1s3b1zhk3m5SX
         V7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622581; x=1784227381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=XUAUIfRLmeb5RUpbOn/EkgLtuOOPEbrvgOc/35eI8nT6CjbsSUCPNnEXgiNvgdXnPI
         8JbaN3tX/orF9KeHG/xmBe/9wkvvACyghpgBrIM8Gjs5h0ypxQaVaK2b+r/bVFUKdfJ0
         5N9Po+z4jd0MtC8CQODCc4d+EZKrjzreBRNZS4IZFc2XYh2tKxgV+bVGWXefk2f/fFYY
         Fd+OaGMk/dXsaZueFmZf4i7MeITe9Fuv3Gt1wlWT7RwCNGqmciuxaZfH3J4Jrbnw9hAV
         DhcOTpauEfq9kpWwETLCp9GPAvQecyCeoy09M42kjaB0NDw4d+k/fLmycyFp4uRJqMkC
         /ryQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbqYZn9pJj6rjEtoYsWoE6PzgVQnU9xDWiI7+Jw2rZfuZe7kTJE2TWgVh13NlCmIGlxNgp/36Ccatu6QIyR4Vf@lists.infradead.org
X-Gm-Message-State: AOJu0YwGwLrafX4DzbLGV3orfTkSumqvjLirpP2T22Ka6GbEP52A0Ot4
	W24J60yCth1x719vUVg5dvP610xuEME0Hb9lO5sl5ABJPmFhOrUBZJgBlm2LZHA+qHRYNcQgJBu
	vvsUDdPRBvW2ZauyL/BVN+VOPatJbstkE6AZI/FDVrB/t+q7CTWfcEbvrYiK61xrD+d3jzCYj+b
	yx9Q==
X-Gm-Gg: AfdE7ckjvAiEVWcCVwJamiHrK8ba9ONnrLfMF+jdxWLkhctSFrXrnJmk5kVDFvwWK3s
	7h4+NLQhsJYtoh2K69NWefHYr+i2Ol5d/i1cFryclbdbWp8o/q9eKRK6cu6ZxJtxJYP3yvGBe8H
	Tmm7mZKrAd5Q6emyJkxEO2fdHSfyIMQPV+pmmg7tgpNN86x+Z8mEJDmxsxGt0Aho+46fukl4kgK
	keyy6nwp5dTpd/Kj+/nSwWeofHWW/BxY7RIxWAxu5AUGG0Cmy5saXXzyHPkPCtYBGuOAPo4Q7iR
	gBwEwkpa6Gq1fDYGj+gja1Ba9kLny7HMux+txY7FWy+8eGQo0SCg3IlENNM8OC5JMymdxjvwzPt
	4YZwPyT8WcXtrKlPAWn+CHKykO1hyOiDBDlM=
X-Received: by 2002:a17:90b:3b8d:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-3893f97ccf5mr7914191a91.3.1783622581513;
        Thu, 09 Jul 2026 11:43:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3b8d:b0:37f:eeeb:646b with SMTP id 98e67ed59e1d1-3893f97ccf5mr7914153a91.3.1783622580962;
        Thu, 09 Jul 2026 11:43:00 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:03 +0530
Subject: [PATCH v6 4/7] arm64: dts: qcom: shikra: Add Adreno SMMU node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-4-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=2hVttTTQRx5zMnrLWm1rAziEUo0KqAbW50W+2RE7kkRSP52+sN8ta7ltAR+qhxhPFdVtIsNQT
 21HAwNZOnqjA1MKkTJmHPKDYJ149gLd1W3/OoOL0yOSPJS/9mcqOXYo
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfXy9qFd0RJ/SFY
 gIHLCxvI4/7FBvuRvclxBVX1+/7Sxn41By34fd+Id+nlVrfYCwkv3nujHLi0g6uUEpA3KBCqVyi
 +L/O9gP9CwqKEMqG7HXy7s65BhB/smg=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a4febb6 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: TUkB6QfkBptYuigT2oyZ25geDpWveUkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX3X+otglNBc9c
 xymX1g/o6+S9pbWGGc769tE6e+bYH7TnzhHRxRHYY4MVLP7f21Ea/g94VnDhNzYogFIieumpaPP
 ma9dgfOlwVZ1WPpaBHJeV8rBpoyQL82mlQAxAXwm38R5jINY2x95Q8A6YmNpFJNH1wDKe5wZh5U
 GnZnf+fgQDR5/Oz9oF17x1UVKG3syfy4fRq6VH2i+BAGq7fZPaLHWB3lWKYlHcBemMc2sQKDn/h
 qXoY0JGCq1/MHAInKcpGMrJuTpoYQy7qe5HNFn8umByKwGB8+hY6MKUn/Ckm772lR0pEuWayx6q
 0Swrrl1CQTF6//bN98dT/VxniIkuaOTLbZx/9I1gT3UHZYgxMRepKWtLUqh8OVACxRy65sC1Y65
 b5p7mbv1RXT4DuskS3pgfEXGaDLAn69hU2P6dli6JiyC319ZTZYBs2Ts66LOuAEIEwVeiLXfdGn
 zoUPacXmDgF/DMgzRLA==
X-Proofpoint-ORIG-GUID: TUkB6QfkBptYuigT2oyZ25geDpWveUkB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_114303_612663_C01B4AA9 
X-CRM114-Status: GOOD (  11.82  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.54.0


