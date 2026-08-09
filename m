Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FDBC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lndsmwfidtx9uHQGQyzAm/dtqIU5v3GB+9Tzq4qCPV8=; b=BD9mOYycn6MibVjHXd4N9v4NI4
	zk0vnFndhDLO/hjj2VgG1VJuI4l7Z3pyqQXTtqJ1AnnySU45ozCnwLBKW39ec1wfQdCj+ML3NdSWT
	CUSEJWzC27vJRxOH+cEYXTiTlI7CHO6Ia7EH0ZH44XtHVzEJybMTrL2aetZF8DKHJmqvb9dD7KonC
	UMWZDpGa5Z21mKgOP1WdBnd9Jcv03C7x2zzbBsluQyYLvgNYljF7Lwcb1KCC0AhfSpbKVJC2UX5Qk
	fPPfG6tEA6l9pmKpAkT8SHD+bK61ILWxYEAMoJhVC1a/s8LhPCaAyOU3KXdI7mn5MhYzVS6xJ98Ie
	rPbQeNYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wZ-0000000AebM-3SNv;
	Sun, 09 Aug 2026 20:16:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wR-0000000AeQl-344J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679IA1OF3433851
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lndsmwfidtx9uHQGQyzAm/dtqIU5v3GB+9Tzq4qCPV8=; b=b2BhA7BojyLDIJVN
	px3ZmNZCSEx9YftCCpYfJyzG4utXmHC5dZQh5AX/vu+0ho02lrDQL+MlIQgOyCeG
	9qTWaWcH5IjPbDTf3dtb2RcYmqEBxEnfjxZLUrQiqHI8wu6kKLMdsqViRp051bS2
	G2koxmSY2zj4UqbQxySKKOxElVEAmvM3UYGZiFsaUorfuhrLrES4dtlHkjjvepaF
	0Kh6sBwW8LpkQphBRp7NUJG9GISBtvzvdKVHzP5zZ9aO0QXm60WRcONMDwDlEyJ/
	9cnZwyn6wM3LABsN6dR4Sn4JMyMiNSMNuww3xCLv+uSG9x8BRkUb907LEC8UaQ2j
	fgc6NA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwstp3rwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:16:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso17446541cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306578; x=1786911378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lndsmwfidtx9uHQGQyzAm/dtqIU5v3GB+9Tzq4qCPV8=;
        b=GDBNJmIhJpmQ90bqJtx/3wyDUBLu4bJIEPDL4R8GYFBsYWQy9gc2kP8LNxNeSl/emP
         tSrOGCLelF4RNo26GhMM19qPSCZDQpTmoZnk2VHjCliPJFaTxweyboMOlOyFHfb7DxmK
         QcrHggHgvZtMOacrxSW2XowXLLchH9f938yqK9f5oYHPpYGf4GkHzZO7peCvssR3SQTl
         Q69UdHm8yDPWpWe4ko2Z4qigZIOeuSzI/qriOe5M+hgcP0J8mlNpM7BzhTCJGqUqIppK
         vlJC4D+gs6mEO2U29YV3uW0dQrR2HhaqjUL17yu/vBTYXNnyyDdb2/GpdbxqXimeM1/N
         xp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306578; x=1786911378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lndsmwfidtx9uHQGQyzAm/dtqIU5v3GB+9Tzq4qCPV8=;
        b=R2rJlR8eqAtqVgae7JBdiBBdjSoWHaQTG6tQan31o7XdZ0P5WKndyK7hCVMa/5c1Rr
         bn2WcDkJJgT53z76kip74y9BTxGFfn7/zTw/AVPXmqv7puAeITVBWjKPz5C4ptF5jttH
         7Zg28+Q8KDSbc735BsATTFVcG9uzl4bN0z2H0eKNpvimLqwMmO34DJaMlTgHhpx72QG4
         KeUjPYxxfM+TDl0YJHwV3YCrWLeAwfuRFVy3JxxSpjFc+S93nkp6bm4HhObNrIuMR96t
         i8/ydivTUvclP0vvlqF7dZo8axqk13hpnLHWMfOqzBWOw/6aCKy83rKLo4dZb9sTgyTh
         fVwA==
X-Forwarded-Encrypted: i=1; AHgh+RqnePnmbJAlYIxzLhliSXp31T+r9gGsZAmb3u2SOVKkzAHt39ULNduS09vL/+oRyEEMW8tQqre+eWSyZN1O22X5@lists.infradead.org
X-Gm-Message-State: AOJu0YyGm0B2LqzT2g2qGBiwqJCC+sny0UYhKV2KqWiEqK17CyIPXq0B
	RF2yJtGp552gjJMdxnREPt227gdloMll+7c0GcPT3616oHQaBkCFm+jW2qqsc4ZTQcIoK1uYcYm
	0CwcvtOFCgzZd/TXj9GT2ft2J2kYbOmQcQELk9JH9cWaMPAs99I6Zt6G88/MmqsTPhHDkR8zZDq
	U3+OToeooJKw==
X-Gm-Gg: AR+sD12G4h4GbxG/GRYNgvyNKUJebHvpH6TLhhjfYkrL1qgtcPrmDSCIfFcJOsrsedE
	yjFTaUHpG2yTB4AeBFKLUIf1JEvXgYfsvudS8KJ/HKQ071CcIE3XyCDhMZTVIrnFaKbyewrom8h
	A6C6DPHDqyo0PijufJCfQHac24s9ST15H0MdnhwIeWN41NzY8VAlN0dzQiannbcT6NpUc3/8JLO
	IfSvb27pSW8uYpdMRxoXfBsx/qSvbQLIbnAx4IiJqSUJFEIPqHc7o6Dl+ZYapBmZeUxUwacbQVl
	D/roqcViNi71TU7Zcf8WwLLAcrBDdVgs71HrSD5OX0fIuSzarrrLeWtaILZ6Bkg1dmFvIsO8jOO
	zYgG/JpKTSplLwViImGpKHy4GJ4g7fyHGJhhZfUoFYW5Lckp1wv6xniK4LvQwwpUZllRFhW1e75
	98FPmjffxJbDSR0g==
X-Received: by 2002:a05:622a:5889:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52ce5faa390mr418012451cf.11.1786306578159;
        Sun, 09 Aug 2026 13:16:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5889:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52ce5faa390mr418011841cf.11.1786306577703;
        Sun, 09 Aug 2026 13:16:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:51 +0300
Subject: [PATCH 12/12] ARM: dts: qcom: msm8974: add the IOMMUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-12-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3876;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=d3z1RpIIztzftotib4BZlQb2dA86jL5CK9UV2NYGIsA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/vddgoDzEMAW43xRxwUMrvR2gEnXk7MPZLF
 iM00Re+zKKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7wAKCRCLPIo+Aiko
 1Vh8B/9UwFNa5oRKlBFbtHGLftufbQjd3wp6vkR9tLBIAyaiOSwB1uccTgLwitwP+qgVzM8mK1s
 K+HBJFly4IR07lUBgq3pKbSaOsC7RyF5Xi91+irfPW+V6FyWC1EESUL4ri7Ew4KOwgCa1B3sqRu
 OSpGvhxS7wdd6g/0dyG1ARtH4lba4OIFoOMnBw2avRmzJiW7Lt4MxcMkYmKKtEp8oE/dcGNieAS
 OwAyTfIJTa2y66WDwkBUgPhzL/YdutUu4+5RcpbGwHxmTESoXdewk58pmJGo4PU8eo3wF062ffR
 sjctDaTHEwBONx4SZutIkpYkYK670J62/U58OeXDiKoYlinR
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GYCq2qytKThTl_k_SVec9d1NsuRSCp8A
X-Proofpoint-ORIG-GUID: GYCq2qytKThTl_k_SVec9d1NsuRSCp8A
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a78e012 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=TYXsMWFz8_iR-PVXkd8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX7XnZgWtCz9ek
 MCFnehjAnzvveP8q2qqElo36jzv8ApaqMjtbdK8yHjCusoX/C9glf20Y0mnYVn7Yb0jLTpg1HLr
 N8rPdNoDe9+szEBJNMlmTfgDct4Ct7FFOOEHVhgMg/QetiWRC8lkcVKwkW+M9KojmhtEl8u+WOK
 fu+HiRVXZbt04DVVETqoveGVcfTwTq/to9ERuOZTS1hBqARhZk8CqBJL/Kjzq/RCIIuxSgPfFKm
 vfmZwGSYxMWbunGxMz+MOR+teEr7lVAmrU3zkwm6VNC8x1jd4S6eyaLyJkzoZ5TfbZBB6OjfClZ
 EHTA5tUmHRU2XaboDqFUaduD8BtbPAmvED5QkZsbttLp9d+/ixDipmWttsqxyfrFuDqLX91Qq8P
 I5oN8P0n7ceuKQdZ9F55UqvpX42cL5gsTdT/4CWSuI8Rf7Rm4imjIfibqbuf/Gt6XxnPUMqGYHV
 CMjJGGMMgtrOBBxut0g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX79R1QUmS+mkz
 rmaAzxppkl94k9MPOmaHBJ/8Nbph0slDsrJpeWkFJea6U3XCRi9Ijapb9ayID9c/VlLxEyxkYz5
 Z10zNFaU8IlBJ+JVRERpolxoeS1teAU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131619_919817_C157337E 
X-CRM114-Status: GOOD (  14.74  )
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

Since the switch to DRM_GPUVM the drm/msm driver can't work without the
IOMMU, breaking display and GPU support on MSM8974 (and MSM8226).

Describe the IOMMU instances and point the GPU and the MDP at theirs.
The nodes follow the MSM8916 convention: ranges points at the context
bank array (base + 0x8000) so that context node offsets equal the
context bank indices.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 85 +++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index 06c0af0aa317..ac3058995d49 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -1958,6 +1958,8 @@ mdp: display-controller@fd900000 {
 				interconnects = <&mmssnoc MNOC_MAS_MDP_PORT0 &bimc BIMC_SLV_EBI_CH0>;
 				interconnect-names = "mdp0-mem";
 
+				iommus = <&mdp_iommu 0>;
+
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2125,6 +2127,28 @@ mdss_dsi1_phy: phy@fd923000 {
 			};
 		};
 
+		mdp_iommu: iommu@fd928000 {
+			compatible = "qcom,msm8974-mdp-iommu";
+			reg = <0xfd928000 0x2600>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			ranges = <0 0xfd930000 0x1000>;
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>;
+			clock-names = "iface", "bus";
+			power-domains = <&mmcc MDSS_GDSC>;
+			qcom,iommu-secure-id = <1>;
+
+			/* MDP_0 */
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		cci: cci@fda0c000 {
 			compatible = "qcom,msm8974-cci";
 			#address-cells = <1>;
@@ -2180,7 +2204,7 @@ gpu: gpu@fdb00000 {
 					<&ocmemnoc OCMEM_VNOC_MAS_GFX3D &ocmemnoc OCMEM_SLV_OCMEM>;
 			interconnect-names = "gfx-mem", "ocmem";
 
-			// iommus = <&gpu_iommu 0>;
+			iommus = <&gpu_iommu 0>;
 
 			status = "disabled";
 
@@ -2201,6 +2225,65 @@ opp-27000000 {
 			};
 		};
 
+		gpu_iommu: iommu@fdb10000 {
+			compatible = "qcom,msm8974-gpu-iommu";
+			reg = <0xfdb10000 0x2600>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			ranges = <0 0xfdb18000 0x2000>;
+
+			clocks = <&mmcc OXILICX_AHB_CLK>,
+				 <&mmcc OXILICX_AXI_CLK>,
+				 <&mmcc OXILI_GFX3D_CLK>;
+			clock-names = "iface", "bus", "tbu";
+			power-domains = <&mmcc OXILICX_GDSC>;
+
+			/* GFX3D_USER */
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* GFX3D_PRIV */
+			iommu-ctx@1000 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x1000 0x1000>;
+				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		venus_iommu: iommu@fdc84000 {
+			compatible = "qcom,msm8974-venus-iommu";
+			reg = <0xfdc84000 0x2600>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#iommu-cells = <1>;
+			ranges = <0 0xfdc8c000 0x3000>;
+
+			clocks = <&mmcc VENUS0_AHB_CLK>,
+				 <&mmcc VENUS0_AXI_CLK>,
+				 <&mmcc VENUS0_VCODEC0_CLK>;
+			clock-names = "iface", "bus", "tbu";
+			power-domains = <&mmcc VENUS0_GDSC>;
+			qcom,iommu-secure-id = <0>;
+
+			/* VENUS_NS */
+			iommu-ctx@0 {
+				compatible = "qcom,msm-iommu-v1-ns";
+				reg = <0x0 0x1000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			/* VENUS_FW */
+			iommu-ctx@2000 {
+				compatible = "qcom,msm-iommu-v1-sec";
+				reg = <0x2000 0x1000>;
+				interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		sram@fdd00000 {
 			compatible = "qcom,msm8974-ocmem";
 			reg = <0xfdd00000 0x2000>,

-- 
2.47.3


