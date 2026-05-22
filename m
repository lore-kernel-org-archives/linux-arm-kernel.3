Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DA1CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 10:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=; b=rdMuaCC4UEDUrmyR5R4MptqS+e
	XipmX0LmNUyzWOx5yC+Z2nS5OEem1spPvje5H3ESmjMyLqV8yR3aXRKPeZFIouVa2JuDzRIs5fBeC
	4mWIzNrNfhuISdRaDTF5SPkAQmoQGD6nq0AuzUcNyLNYet9D5tmN5Yv3UvuK/+iO6M/gaDGlTFdP3
	7unBPy36HnjwLECKeFTufqVXzK5vJGYpTAvLUsG4BmpUyxqmvS3lYwmG8hCIH31njOIQbQW9scepY
	DUGziu/8oaPNLd+ZMDuyttiNFh5978ZvSZK9dF3yMlxgN7cSuYFUkFgd20xYYV1wdFWfrWmQE18UR
	c0lJRQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMsN-0000000ASFB-1ITX;
	Fri, 22 May 2026 10:13:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMsK-0000000ASDq-3sQR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 10:13:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M7AXUE779220
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=; b=I62NlWL+HLctD+sz
	RbdpGqtnZ8gtEnLvig5e3IfsqmR1E0K/WnzSTvqMmiLj2m6/CmMdCGK5cSh/BCXM
	acKeiFlymox/EyKIIJMzds1mv8hvms9iY2TLGWoEagq3VC2npTRA8CwNoVhHaECJ
	rALL3h6dLHD5QnzbpXdgViGdNfeExl4vUMCVSP13D3+yPcOT6wyXLkEc+x/z3JCS
	iSplzhT2uNRy81QhANJOd9xeMgX5UXSNphM4LUlFJPfvSPOGiWuljPSuFwP/ha5P
	cU8Cey3uBnGW32Cc2H24hN6uvDJCffFrQMPHvG2WSV+b0R/D92k6fBAL5iSxpSBM
	tT74Tg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eac7at7v9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 10:13:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828659ecd4so3144268a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444783; x=1780049583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=;
        b=NWxRbhWM7Qs85dF1Jok/zuIe4h1bS0f3M/0sLsfzzBZFwHMB/Kh2Hvx6fYk0mFXf8x
         YP4flm+dnXn8KmGXuAh5rzRHw9LwWZc9PR+TnqIQd6gFJ4ess0HGefQRKJdMFE4pQbKr
         IhWUN17hRKHyCEnVd5j0RsS3z43hzTF7gLXJh7WuBM1MbXzS0eXgF3XSZXx4Q3iqrMZ3
         baAzK9kxWqN6fcPxwE6iaqAdSH9MyangLsTiZlPV7eqOiWRZSAFqCQVO2TG+yDzcRjvb
         7/olvwSEIQS0mgwjR9HEPU56EgQQibkuNcplrmyzEriAffesN1EsON1resLI0EixqjMV
         iZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444783; x=1780049583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOy8/GU3XQkZVyXsjJI4YrGNfteshSum3AiTJPnkXFU=;
        b=Wj0qeUw44zqu5HEFZe4Ao2hvmjhxEydRuSqPsNhoJRRtWNHlknq8VuHlSZNw3ts43l
         32EeR/z/17sXaOmx/AAYr7YkwByCibGdqdRVs9HHxrYNYypEEl1I4tXFV+SKFX9n8XMs
         KWnVR1IWTg0MNMIGv6BbuIbEdNHAJTrxx5t5QOVVGVqX1e31UfkLGZYwB6meJO6WNadQ
         vnWmAm+yXkN4Eb4n8Dri/C9gLUNX+qp/+15fZPHOuE2hlzjzQ6l8GzjMVS5SByUlWhgV
         iHWFn/tt2ABBt/8214u/oOy+F9wO2W0i7UUr9BWwrDiSH3p2b/M2nNKu50czYKkWou0v
         euzw==
X-Forwarded-Encrypted: i=1; AFNElJ/FbRBrCVUtgrblWsBWojs00uyxQhB0YnvYbb8HvYptz4227lyZLA/lJyhrTpAsAkH+jjUcr5ujxP10w5OJec+A@lists.infradead.org
X-Gm-Message-State: AOJu0YwrzvwX8PbDF4MaQmZih8uDqP0iGeo3kzRbsEkPrSMIqP/F7SUd
	Na8VncRKRKO4LPiETNIVLdlaHcapblKcYrFCsIQzJuaREKugS86EGqYevEd4hoZeu6Aap+Ya/ns
	ozd1T8KvvbPOZdMOqQhAWzJijUUtvKieddAx9nvzDFShTs+vVRkDjL59ycbHBr+VXwFBPu6xvyh
	dPjg==
X-Gm-Gg: Acq92OGb2PR+jQ7ErI+fIKBzvL9VD29Wy8UVOXM4JFYRuP+tzwledSvbvKbXesj0Q3f
	2WbA/o7jJ+Fb41gPumCES5k1steqv1WKxvVaNylY2SECszOP/pMuz0p+f+Ol+kbHM1CQOUXAx6v
	0gB8VCM/Y6IrsonLP0nHEfm/jN1cUmuYBvibI57FsnJkuioiq4jXRkJd5h33L3nwDZ3nhxv8lTT
	fLZt2LmMkwrj9e2cmYEf04nO2VcAOy8f5r+ok21Yy4+g689DeE3eA3ARW8e9A/NuTFi89mY1irx
	nrVQgrLHUBlik0FT+dcJc1mxynQ2nGxKo6UqVwLgvnY5nbfyD318SMSbknpzhEEq7E0K2aLzQjW
	K6zhRU/shdAXHnAGm5po9q/SoiYPNHiPaGXh+3AvpmsgoOQ==
X-Received: by 2002:a05:6a21:e545:b0:3a3:1071:89f0 with SMTP id adf61e73a8af0-3b328c3aef7mr2746409637.2.1779444782739;
        Fri, 22 May 2026 03:13:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:e545:b0:3a3:1071:89f0 with SMTP id adf61e73a8af0-3b328c3aef7mr2746356637.2.1779444782221;
        Fri, 22 May 2026 03:13:02 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:13:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:42:00 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: Add GPU support for Glymur
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-4-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=6197;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=9LRaMcv2V4zbaC8556pmvtif80qwwMxTZ4+jktXJcsQ=;
 b=zOl5Y89TsckbbBpFdAJU2lXL8xlzh6ufa28T/1DvnFneuixTugelWjOX7t/1gn4pxgQgmQQF8
 364+zozaWZJD4JlmMOvoAmhkuklertg1pkeCuQafrdtXHBVfOUW7dJD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: zWDzeBQasEXbScZBsVIAskVmGYtji0hk
X-Authority-Analysis: v=2.4 cv=JrbBas4C c=1 sm=1 tr=0 ts=6a102c2f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0FMZnqfP4dmqgQdt9j8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: zWDzeBQasEXbScZBsVIAskVmGYtji0hk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMCBTYWx0ZWRfX6jenRg8ua9CO
 ECq0xjoPtFMPI1NdfTB95tdRy39mpQ50QLU42tY207rvJb9JLCkppH5qb8Q1Zm2G97cB/xO4hxX
 1uy5h5pZriM5zEVAwa2lQkwRbgFLOcEBDtzxSPNb0g6tKneAuZOLFp/CvPa8iyg40rNwAwzZWzU
 rVxVgWYE5mm63inJJdHWmkIdilZUc/YWcZ4cRaBZzHQ+IJFIFbjebvgVoK8tSoPeXqrk25SzelK
 oNJ/jJyoVkvLPEy3evBu9cMSamXilycvvMvp+hJJg1rRRj4lHsILBKzT0/pkFSGjK/PPHXt/8lm
 vL3+Pxne0OzIF1BdEkBFnD6jecqt0gSv9bIWQSr7dxcpdt46EOCoQUnyflBEKHC7f4fLo3sDgPz
 4vh7StkpM42H3z68wPjWcm9DoH1ceJYH8s1Fms6hi6WZW6FLTWQRVAMpfKqZExdOg5IqsglprwL
 iJcI0faod9p0Fwvzd5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_031305_092915_23CB742D 
X-CRM114-Status: GOOD (  14.37  )
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

The Adreno X2 series GPU present in Glymur SoC belongs to the A8x
family. It is a new HW IP with architectural improvements as well
as different set of hw configs like GMEM, num SPs, Caches sizes etc.

Add the GPU and GMU nodes to describe this hardware.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 183 +++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 5e76a0d53f01..01a2e32e503b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3701,6 +3701,129 @@ hsc_noc: interconnect@2000000 {
 			#interconnect-cells = <2>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44070001", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x6c000>,
+			      <0x0 0x03d9e000 0x0 0x2000>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x0>,
+				 <&adreno_smmu 1 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			interconnects = <&hsc_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-310000000 {
+					opp-hz = /bits/ 64 <310000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <2136719>;
+					opp-supported-hw = <0xf>;
+					/* ACD is disabled */
+				};
+
+				opp-410000000 {
+					opp-hz = /bits/ 64 <410000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074219>;
+					opp-supported-hw = <0xf>;
+					/* ACD is disabled */
+				};
+
+				opp-572000000 {
+					opp-hz = /bits/ 64 <572000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449219>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xe02d5ffd>;
+				};
+
+				opp-760000000 {
+					opp-hz = /bits/ 64 <760000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449219>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xc0285ffd>;
+				};
+
+				opp-820000000 {
+					opp-hz = /bits/ 64 <820000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xa82e5ffd>;
+				};
+
+				opp-915000000 {
+					opp-hz = /bits/ 64 <915000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-1070000000 {
+					opp-hz = /bits/ 64 <1070000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882b5ffd>;
+				};
+
+				opp-1185000000 {
+					opp-hz = /bits/ 64 <1185000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1350000000 {
+					opp-hz = /bits/ 64 <1350000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1550000000 {
+					opp-hz = /bits/ 64 <1550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x7>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+
+				opp-1700000000 {
+					opp-hz = /bits/ 64 <1700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x7>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1850000000 {
+					opp-hz = /bits/ 64 <1850000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L5>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x3>;
+					qcom,opp-acd-level = <0x88285ffd>;
+				};
+			};
+		};
+
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,glymur-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;
@@ -3712,6 +3835,66 @@ gxclkctl: clock-controller@3d64000 {
 			#power-domain-cells = <1>;
 		};
 
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-x285.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d6c000 0x0 0x32000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_RSCC_HUB_AON_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "memnoc",
+				      "hub",
+				      "rscc";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gxclkctl GX_CLKCTL_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-575000000 {
+					opp-hz = /bits/ 64 <575000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-725000000 {
+					opp-hz = /bits/ 64 <725000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,glymur-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.51.0


