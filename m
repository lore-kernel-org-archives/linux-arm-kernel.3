Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A9EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=P0BJVTY7Soskb3b+IMHmnVJNrK
	z9MANwHr4TCAx0nDddgsFHdvkYeevtElf094Rc7IRBWqJsIuJyflX4G0oJrFOMbvvlwct1F2q3/TY
	6/dslpp1b8czTS2NxjdJWBSFpJ6cpz0Wd2rzripYwsAnCKkMhrU9l8qH8e6KconnlSMpSm75yAPTN
	e5V/ODT9dzmoPVg/RYzHtUU7SiLT3wDZd8B8SbvSwYGjHbAKcjhM7ILFh33Lx1/paSRg4rWVX0H63
	8BCmpBIRO4KowXne2Uf7m69VXngwrt+mFy7Whh/03QAkxfeaz8NfSbqnAPtg4UaIMo5PSoPQ9M2Jn
	VkP9N3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVj-0000000DbHz-0isA;
	Mon, 06 Jul 2026 21:05:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqVf-0000000DbFm-3Otm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:05:49 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDvXG1566484
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 21:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=XemG46oyty96A3vH
	JA1v1oCMxOQ3cCOvgMFdMKkWjuBqWU2a9oT2A2EVwVQZ9wJxfXR0K2XjmIpasOip
	aRUY8tMCzmEKH4WtgI2CK9hM3JGSrbiQg4TtbA49/fjZ41NLRUtyF+BMdjxIQm0p
	eI8xYNc+LjBep57d3DBufKXmyiOSn4qRGP45N28rk8jRoF49vFkIk//tW5092ztm
	z2mJ2xXjBfNpQoHICIKkPg7VVw0azqteM17fEKQNRHtICQgMzp1cBRg6vNanNgE6
	O7NE2cxwuZEXBYycSnnQ5zw7E2nWFojH79aF2Xybym/1W8NMsBxOe0/2xDkTW+M1
	1sYbzA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7kh5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 21:05:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c804e38c65so67446635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783371946; x=1783976746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=W2ogpX4xnULqx1zIww0bQ/PBECmfukywlJj43+2LaIPUtIF+M4jrRDI6lLOLMhk68W
         QgDYIAOF6rS2ZdA4iXUut/oldjglsCtElDVJamuusMC40K+79QKpTqpHONOgazaVwnNN
         uHilvL8wYoICQNxTPOd/odeBs54Ua3zbHmJMLUgLmSZpszcZJygmV4yvSGqH7Bmm8lhU
         naHgDppmD+HmhjJ9EQAgpjVhKHKSga6Jhq6Y4M1LUaymsb7CgEwmP6aod6cqavDRevOn
         oCqRCc2CJdIdo1OSOMwCpSm1/GvygCI8hr7UwkKpCsYSDmVU2ojZkTZ2tbkbus8oA5lx
         1ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783371946; x=1783976746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=GZE4egYaGKTflt1576yDNfUeG3gY4aYFOj4F6JXOYF44qprgxUUs9dZE2Kbg6BQ0TU
         d/vs3zcMpRpciNPslfT7ynsZgGyYcfPnYGb9xyrgIba7KU7QyYJ+tizdYTPMtYGQgs0j
         0QVJUcE+os3FbC/PwMJxOKn2l6gLp4eyfkuEEWV9gS0UrdLENXVK5hajYktXL3p2DDGx
         XU84pdtTY8JJlyYo+ahr14/W2T+Zdyzg1WUJ1dSlySWd6KqKcY5Qf8Y+JGfJncScpYNb
         V3HX2ZIHtRgwKwGKeSxR38ffRbE/vgDPqxwVmkcICedml1dCIBOHNPIEVLjjEGUOuo0U
         0Tkw==
X-Forwarded-Encrypted: i=1; AHgh+Rofe3uPLNXv6ZZeDgz4DAXkVyk1Eu8QZcUZ+WSVRQymtICKun/9tKq35057QdjqTM7kgBlQrYTGgL9FvEw3EBpV@lists.infradead.org
X-Gm-Message-State: AOJu0YyrQpRMg9x8XpLrBfWuFWyzD1ynJrBE5+YgFP2+FEdCZ1T7Znns
	GaRqSuD9Mx48xjZl9s/Z0eTdM69FO7HHNq5pu8H352HduGE0mPgUZa6wZ+VL5ewvPfYcR6c926l
	1OpbQsuUmT8K9dBi1GLlSov8lS4qmDWcoARfRUyobuczKHyfpIPq8W0GpyddbCiDXTMM9aGFI3u
	0zCg==
X-Gm-Gg: AfdE7ckpVjjbow4VOqsBUM8GzcTamjDIWIVU8293PlpECA1/h4zooLIQCwRYFgZk4fk
	orThC0G6vKlXjjvgwLAgPf8NypCOhDlat57mTd1Jux6XEi6UrBKNsVyAzEgjW7N72khJcLLJkR5
	GyrKgDPndq4lJRvtyjsgqydEQYCDZDs5sHsBCagCNLWePIb6ObR/2N0ts+hGl1NeJ6eNM5wWxnP
	X/sD/0SbsHRIXzGHXeUcjfYeFW4an5gsAqWNdP5WqztgV8ODcMsMObhbt1PvqMZwipAegqajX5k
	wvkIg7S/QeTULZ+wDMbuoWdW+aXZVAZPjwU9tvHyLWgd6FnRr2yJcdawS0zGYRKvfZE3t5kJI1Q
	BpMzgyQKHSZ5+m5ZubfgedQheYBj41sSO32s=
X-Received: by 2002:a17:903:19ec:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2ccbf041c8cmr26646695ad.29.1783371945822;
        Mon, 06 Jul 2026 14:05:45 -0700 (PDT)
X-Received: by 2002:a17:903:19ec:b0:2cc:8ad3:423d with SMTP id d9443c01a7336-2ccbf041c8cmr26645595ad.29.1783371944672;
        Mon, 06 Jul 2026 14:05:44 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659fa13bsm305031c88.15.2026.07.06.14.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:05:44 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 02:34:37 +0530
Subject: [PATCH v5 5/7] arm64: dts: qcom: shikra: Add A704 GPU support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-shikra-gpu-v5-5-d2f373912d3f@oss.qualcomm.com>
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
In-Reply-To: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783371890; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=Hg2Kf+dWXJ+whlWJjf8ja7E8O66IAXgviTZ41pNM+vxeAaoMmTklSyb87ZwbbzCvOrJtjZe4o
 VVlCMvVeNWWAZQO4FGDVlUVdpIrYZG85JDUmqOliICPcLii0AxUVNsV
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfXwnmnXdj9tz/3
 xqPneQCDy73BgwqTK7MqgdbD/wlRPlsK9VsF75Ztox0FHObXqg2jpZoLkv4+cmLhHfhO69qT+eL
 mX2E3SBTcA1LVL8mqIGpmXF7Y4JqLM6rITEcxaFMBHROIq4D73yNRQt8of7rRyJxu5mBSWqxDpe
 az5I9wwG1ulMIDcB66pL6zkv2DXBC6UL/ploRAFYuXiWxpaSQgal7Hmp52ITd8KR1jejYU9pUDP
 kTtF7Mqu74+fqbnqnU4lsXFtKu9HX7tnxB+r0GoylTrSPjw6i0+gIldli2cIrZfqZ0TXE6pxS0N
 0J/3aIys/byHTdub3tMZJ8uCr+paVOE7CmubQiRT8lqMgr1HDgmfrT4mnH4TyTr5k2ecr6uYXeL
 F/i58WPWRnT1OLpapX2V5hbHS/I7yo9MHJKnpNOvzCSncxfjZ/4RxsWWQHbeOoKzGBjkMfrU61I
 ClptgEmAdR/Lc+ZuYRw==
X-Proofpoint-ORIG-GUID: TAjAjGktlETF8JSdzxbh8b2uBE8T-2se
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxMyBTYWx0ZWRfX5/VSd7vWkRk/
 CNtLzyKR4UrDM8uBg2wioopg3ScTy/U/CP9zv1Y7dG7GvesdLSdSvfDR8KP+Ld/6jp1agpOJK+q
 ry4WnQKam3S+NCkayRScwDN37nxUSbM=
X-Proofpoint-GUID: TAjAjGktlETF8JSdzxbh8b2uBE8T-2se
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c18aa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_140547_966041_DDFEF4C8 
X-CRM114-Status: GOOD (  12.36  )
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


