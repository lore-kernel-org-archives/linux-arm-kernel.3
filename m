Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EA7CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 22:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBlygsgGnxpPMz3OC32mVCAkxjkMriPy5M65BYzsWwU=; b=T6ou1cAqEfiNR19jswOM5gXod0
	gbH7oHChHjowRbE/7PT+l8j7sPXuGzjoe6gF2k4MCNSmerKT1VxxmV4gzUbONQYqp5+SV7CO6cCHW
	IKNHw37oSw+4Hs7vXuMi9mL+IVBdvZDqmz3TbWpsr+lM6xDbO/yiLU9tbWz7OSTegTskChOSEC1+h
	MiGUqk9zX1TfSiea8dPdOG0hBr9TAK7eEi6aHMyROvCXQtD7UXuTsfMdGZ6PqnuK6A8FH8AO5HcT8
	qI5ruujp6ZePa8skVGUYFrgBxvRO1hGx2bNNVlS96tU4K/eudUP6ioCW3n1+QIPMqP2xswMsc7n0i
	99s/KWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2x-0000000EugG-2gAV;
	Mon, 11 May 2026 22:24:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMZ2u-0000000Eudv-3jyi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 22:24:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK808V2172840
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBlygsgGnxpPMz3OC32mVCAkxjkMriPy5M65BYzsWwU=; b=aMevEelDPgBpPBKd
	820JcWpezKtVXryRm7ieHXKBnYKlXJNsczb9JH9PnQgi+Dt+7T+R3UdAtURDJfxO
	GahvsmKHgD3++i0nq+9Y0dqHVyswpAXlVHpVlBcayTzXi4sbFmm4KXuHklzw27mh
	Dqmd+AmNXhGJ80R283HfR46NhYhrvfd6rIJ7xwwi3H1zocPpmjtWLUegaXO3B+6F
	anIWxBuc/Fwje72Ot8i8wXwaqc0qstB9eAHfBhIE51ZeuvPc7716EW3cvyAcdtR6
	+uixQ3UXczHwQlSt/GIKg6RUqK7B+F5V3fwFZKNGVXDg3PfC2axuQwzQQk/3CadU
	xHEY6Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nvj8gk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 22:24:15 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83565161a6eso2739126b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 15:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778538255; x=1779143055; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBlygsgGnxpPMz3OC32mVCAkxjkMriPy5M65BYzsWwU=;
        b=c2zXtG7tS4gCwZLFZe195L06DdVgbD5YQtJEt6OlfHjEQsqBXM5HvX4f0sBkCX8bO0
         XOGGvtPqWb1MXsG+yUoDoO8wJvgUDkHH7KQpIe6FDYPpQv5P9rc2kHnw1aHMYf7p9rGq
         ItLssPQrgxf5SrpMwBR2TD0aLa0aaGrLhhYqxWHYwvLxGIPV0OFUU4LM00e09mGt+Dps
         /tKjy1CLRGKVhIpqMr2zSwKgQEqcwDeq9nwe6Aw1GKbLAU7qvw5V6IZo37TEzhFeAPdS
         gCV2ly8+jygYQ4LBJ7S2v3mcDQtkENlOxgxdGVYSfBPQZRWPmeOxpj+XKLHJGHU6/XHj
         nTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778538255; x=1779143055;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FBlygsgGnxpPMz3OC32mVCAkxjkMriPy5M65BYzsWwU=;
        b=Pwwt5h+PiDb/TGSxstHQO9BcKFlUR31Nfjf+eNSqQTDUVYIT8tweDnSC4mg5nLO6pJ
         +CrS92lrXi0ECJ3lLaGePZOKO4LHSmSDfwWSEweLuGJChm4ViCPatibh2jPgi/jKR8JA
         LmQDElLUu9eFLdRLypfBBi6IBQ39829EGYu7m+BqxN5sdiRCYYz9BgRwGIrXYGw/CKh5
         qOW2Hkkgy845RTr6haKYfWj3l30dEfJyuXlSD6mc97KJsyCDGYErDMI3OHUhBUJFUUIF
         LT63hvoQFa75GHiStOp9ucdNfjuyRgBRY0ol4WKmaa48VAJIazKLBE9IIwH1XMIdVXWE
         W8Xg==
X-Forwarded-Encrypted: i=1; AFNElJ8TVaiG7x9dNYCFw4XoNTnJ3Wmh6PYbyJE7XQ3LxdsDsXSnbVcvzOq5Ba6IsyWJaTHi0hkRlXprjDd+SUdZ1r3K@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1jag/BTbcoiaCZJzoWO8dA/zfItJgu/nZG5164yKMdjVqcMRh
	walyKwIZoRG+cpfZJs3A0bHZVT74Y2y9Es+F/QYOeW/7e4FClCVh+0EYCffiRpAf9/Pxhpjj8e/
	oGsXDehNKalYj6GxQQyoOLcJnE31+Frg4oObniu+GIEdaZEK2MQCUignCbIp42tGQbnYsRqzo3w
	xf0Q==
X-Gm-Gg: Acq92OEhWM4o5PNaKU7Z1hNX5LdgxcrXC6qU92DUXzttgxe6oC6VSEWE3g3kD+8ovL5
	iyREo42FMaYx4hmPQ7L+jZqe1mR/ZKWU6j5zVcaLU19MpFgnYS++0xHV3MfrfFjOcd/bToXEaJ3
	LUUL0mpUnQctmPNCdfEdgFkNWdqdxaquqldC/kiltTNBFlAh/2mGSdRjaKBFOe94oYMiglCBMJl
	UzmhFx8C+96QhAe0KTICZUOMhJrLXn7n0dqMGRgosQQOqydRRmR9LlNxDeEq6crJQuy9TkuetEA
	zdoy7q1qaeXGMq3OmYq+zyUb40gvX/w9FwhuZdfszH3tg01WSOxuZO8aWDrNunaG8KfZ7PvdNjg
	FOQ6K6IWWOl9C3Q5N1oY/VvN6JEJFU/NrG7hw1qrgdlfz98BRyWVIb7zN
X-Received: by 2002:a05:6a00:4484:b0:835:537a:6f15 with SMTP id d2e1a72fcca58-83ee836743bmr1216710b3a.15.1778538254804;
        Mon, 11 May 2026 15:24:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:4484:b0:835:537a:6f15 with SMTP id d2e1a72fcca58-83ee836743bmr1216671b3a.15.1778538254242;
        Mon, 11 May 2026 15:24:14 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965946543sm27028110b3a.16.2026.05.11.15.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 15:24:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 12 May 2026 03:53:19 +0530
Subject: [PATCH 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-kaana-gpu-dt-v1-5-13e1c07c2050@oss.qualcomm.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778538205; l=7460;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=04qu+sqiESXvq4vvHI0DHaSeLTlPn1EdVFCIopBEhMg=;
 b=Fp2lHKVXgWkT80McpFjFpk7lZesnPTKO8OmzeleCMQcA7tzko3rc4qUbCoqC+IAtunBNHtuIY
 2fEnr0n4vK1AmKVxQ7tsGndv5skP7bhDuYJMozfgwa3oAPLqgIQIKrZ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: lpKiTbWIYP1iyZ60mkWvhxSdBsID_-dT
X-Proofpoint-GUID: lpKiTbWIYP1iyZ60mkWvhxSdBsID_-dT
X-Authority-Analysis: v=2.4 cv=H8brBeYi c=1 sm=1 tr=0 ts=6a02570f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NK6jBuhQyghv6pUElKUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDIzNiBTYWx0ZWRfX8v1SxDgGEfcK
 Q0YWn4cxTi2CU0MXFm1xUGiN8Bx+IDejee4azUOJn0/gVPado+uwpEI6EWz7+5EaAAa+aYRr8h2
 ZJQnjmVuriaN9LI1PuoQu+okmn2eB6VNqUGvccwo2fdpizkQAULC+AUCUDdfa3zEtBlNe6rC0Sd
 vr3aAqw0mtMrZkydMPHc37vXUT7SyDB3bgGQJAlIeBC7kx3N1M90zkjBwDA0Si6jJkz0nGmnHME
 zKj4U32SZehtsLJNDlVlMRN8FQZuwM3ktvd/5ZyZpsieG+fP9JyhFev4zhIHTZy4gUIY2sWdSHt
 WjTSc+fQ205spHLNTbaROBmzFz5wdJ1f4IJCx1e3+PDIYdmIbaO1X//odiLb7o3cBT8RHKieeok
 YijUcXSZQb/wHDtmdCT7Uy+fm/nTM4DNXJ87RkFtRWasj961BCmUx4x+3PK7DFE1ErSaP7dcieC
 WYCb0ygJaSmylU7FLiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605110236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_152417_077414_BBC1A66B 
X-CRM114-Status: GOOD (  14.91  )
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

Adreno 840 present in Kaanapali SoC is the second generation GPU in
A8x family. It is based on the new slice architecture with 3 slices,
higher GMEM/caches etc.

There is some re-arrangement in the reglist to properly cover maximum
register region. Other than this, the DT description is mostly similar
to the existing chipsets except the OPP tables.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 232 ++++++++++++++++++++++++++++++++
 1 file changed, 232 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 0211fc9f8c88..c57aea44218e 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -2573,6 +2573,238 @@ videocc: clock-controller@20f0000 {
 			#power-domain-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44050a01", "qcom,adreno";
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
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-222000000 {
+					opp-hz = /bits/ 64 <222000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+
+				opp-282000000 {
+					opp-hz = /bits/ 64 <282000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xca2e5ffd>;
+				};
+
+				opp-342000000 {
+					opp-hz = /bits/ 64 <342000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe22a5ffd>;
+				};
+
+				opp-382000000 {
+					opp-hz = /bits/ 64 <382000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa22c5ffd>;
+				};
+
+				opp-422000000 {
+					opp-hz = /bits/ 64 <422000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa22c5ffd>;
+				};
+
+				opp-461000000 {
+					opp-hz = /bits/ 64 <461000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L0>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82e5ffd>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82c5ffd>;
+				};
+
+				opp-539000000 {
+					opp-hz = /bits/ 64 <539000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L2>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc82b5ffd>;
+				};
+
+				opp-578000000 {
+					opp-hz = /bits/ 64 <578000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-646000000 {
+					opp-hz = /bits/ 64 <646000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-726000000 {
+					opp-hz = /bits/ 64 <726000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-826000000 {
+					opp-hz = /bits/ 64 <826000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
+				};
+
+				opp-902000000 {
+					opp-hz = /bits/ 64 <902000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-967000000 {
+					opp-hz = /bits/ 64 <967000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1050000000 {
+					opp-hz = /bits/ 64 <1050000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1200000000 {
+					opp-hz = /bits/ 64 <1200000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0xa02e5ffd>;
+				};
+
+				opp-1300000000 {
+					opp-hz = /bits/ 64 <1300000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x03>;
+					qcom,opp-acd-level = <0x802d5ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-840.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d6c000 0x0 0x68000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "memnoc",
+				      "hub";
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
+				opp-475000000 {
+					opp-hz = /bits/ 64 <475000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+				};
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
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,kaanapali-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;

-- 
2.51.0


