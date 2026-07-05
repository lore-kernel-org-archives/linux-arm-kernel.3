Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E853DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=; b=J4j8dn0cgE0ksR89E32Uct0U7d
	/8YBEOJ52vtYAAl6hdolAxkUwn+if4ZvGhwoujyvc8lcRJn4PxQikNnyDA407uTfjm7jpehbKehma
	YkxuGOo/0UigZjPSI8usynsL9Ttf1/GaiTZp+3BY7z1+JRhzWLLayHeoDhEqWaiEka1v0j0g1TsCP
	Zd+3tYP0XhD84K9AxRnwsrB4MZBCNsRY5Pakf+HmcTXbW5w6Vj6aRZpCPUVND0vvNwFj2jQKqEuv+
	XIbx0H+JRcpaWf307vjHCayg6kKCX/KYF9L6G8ad8kQW26nPJZH2qRoYhnwzn4+95T1rakqULhW59
	mHGdoBeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI0p-000000096gB-3Ysp;
	Sun, 05 Jul 2026 08:15:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgI0m-000000096dn-1kUn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:15:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6651rSio419357
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=; b=IqjMzpklbdTVi2Sl
	eJU+QuXMihuCVjTL8+eQIS+B8Sng6SlLTXsHqA/PgfjaZwyo5X6kv9TGVKxPgD5e
	p5bra/LAAZAiQ8zip11R16R2Gdfjln6QhSJEEcdas5k1lPq0OKHOIW1UlXAiPeb9
	U9RnZC+tk0FMue+ypLLWgDKEAZv77mXZu4S1m6PImdnd5E4oQKGCniCNulUEX65p
	/gfgAZuSnuZIgmKTCBYRBwDvdci9K6wCIb1nUDUB9F91CCXT91DvgfGiZNNqd+uE
	WTUhOgcvs9c4CFEtkn2OKChWA0f9f4eZzzPdzENs5kt+4aoB7P86/UzN7pRWazSo
	35rQ7w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3aarv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:15:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c9b71388fbso45926145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239335; x=1783844135; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=;
        b=Jyd2fyWxsl6pw1MI4ELJ4v5IK8oHYbgAw6Yia6DGe3/nfJ4IHHtQvW1Cie5G9c8IoI
         fgGTAaOCNmrGBw57alDAKWAu1qjQlWz3lYytMqdPQBAdcBwoVAvODph9zRBfLqkLqu5D
         ccFL7a5P2tkoiVmXwbASilZ6ACtzJK2Qv/MahiNbYNiRluWsxEjgmV9zslEdbvRDqhjb
         nAp8DJEISRmpt2kpj/Ma7Mf6HawzVWfqCQrN93w+m/iwi6KsRVXlC3ozYR/ypTB4JuK1
         J3Isbl0Y/cFpugKAr43oU8mV112L9UJ8aFWdMVinkaUDb1QE85qneeUBn6pU9ibclBrP
         cO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239335; x=1783844135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4k9UzutMXiZdlWIeEIUwNCwlg80QNOnzM/93OOz7hjw=;
        b=ZLQswxdbMkkUZw36wnIPaakvbNbBRvFRvhvVAupKL6YFyZYqXUrpj+hCP8wNaV4MxY
         TpYiLvI8orwtYhTChHiNMVdqVSeFWcWysnWVLeDaMTpBVu/Fl84OTDbU5/ArOcLJ4qrj
         PB6sf5eanuzAB9vlkIlbUylkczOeFQwOEIqzT/zMA0yhIk1XyIax7xG7XpFtUIzVjbn9
         W92VponCyNm5llGrgyXE4lcikF2ejB7ZcLcaHps4YfUu5q3JQrlvmVMcq+EdM8hNrmHV
         GFKzjO9O814GEn9CKhuRiPYKQNpDR5oCfXSa5GtyvvMS1HGbbyNV9Grw/eUsIFyf2B+s
         xAHg==
X-Forwarded-Encrypted: i=1; AHgh+RpljcCZqaBHwwOZjcTv/w51IF47UiaEV9AhYWIe/NlWWDU0/3n6wH33+k9pVSk7GYUF5Pk2cvW4Ge+pQYgjqs6r@lists.infradead.org
X-Gm-Message-State: AOJu0YySUOv3R8XNWyEHA16gw7FKIiWY3uVBqQ0kXibmqeR+pg3r5Z6r
	LR8OVtt3GIkdcvfPgN6JLKTrXItXdsO33fIThMKVS/XioAyHIyRQtqXy4Dy8wG4CsAX0NX63vps
	wCHKq3ODS8dvwKUF9QDLrKfeVg2myK3Rzac9sCvhzt0rUegvygPPPZ2X+wvy/3yQdJGlUcydaN4
	DpwA==
X-Gm-Gg: AfdE7cnWEO2C9v2ydp7P+RFN8mq7xxBasW1qdsEuO6otTD3r6OvN9f1BAtW2xhJuuzu
	tHZ1XdSqQiqaAfLptpSfpFtoucICvyE3r/T5QxYLH7w3b62t1cT3GGTPh6jSHCooZuAjVY5r+BQ
	zc+FrY4YzZV8T6mfTCM2evIc7MxZIlvdjcj4/lIXNYaa5wc9LlL0k8Jp5B1CPPgPtWW/U1JT+td
	QSXjfFH6ukwDdCIrmFoXMSPBLqyAbIZBi3qYh8l0utgt31bVWvcg7X7jlgpeTZfA9OtMubElWPc
	iZ7XvaN8NJKvkN9mw0KhBreIo5Fxipr3bw5Uk7xFPG58pEmFykjygKpmon9CBsv2Eo6kTRQJMIV
	N2EUyd44QlnlPQoaYlnRd0PfW7Q8ssKZshZQ=
X-Received: by 2002:a17:903:3c70:b0:2ca:c01e:8836 with SMTP id d9443c01a7336-2cbb201b5c1mr54322655ad.13.1783239335217;
        Sun, 05 Jul 2026 01:15:35 -0700 (PDT)
X-Received: by 2002:a17:903:3c70:b0:2ca:c01e:8836 with SMTP id d9443c01a7336-2cbb201b5c1mr54322345ad.13.1783239334746;
        Sun, 05 Jul 2026 01:15:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:15:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:44:22 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: eliza: Add GPU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-eliza-gpu-v1-7-c9f1354dbd29@oss.qualcomm.com>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=5380;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=hj4XTXJRwVTJobJx71cynzfN1k4QxqJRtGjaWZFWW2E=;
 b=35fe4KBw3FTsKp/hdtdHgczUQWi7qZh48PQEJWcKngdSxoOThZmRYCaTgT42VxCbWOhn0KKp0
 UEUQorWapK4BW8DnOpoaHEFoo0f1BSJ+my4rJ9t3PMLzdO39S3p3+89
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX/B6Xjmi+lJkT
 eKI7aosUxlTrw0B9RJoNzbaKE+0Bj/6G5ozcTdhtTbiAi4AsD7mrC/40xNHXgO63cxCu+xBc9wm
 1efefsSzyCKQhMYoMWSMkZL5ucyKQro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXxljCKDUKWJr/
 6QPM6Q7kxoKrHv6Ug89XUuRq2PuwWl94yCjT7oS2BwiJwA1lWhjewLuZaDBsFfBqNrt98nRET3a
 73PklV2coX318LiDu5OA2hTiWs+Dym8DUmKWqtSQ60i2qAesJt1+/IvA6xvnIcHNtM6O4UnoWhB
 3FKkOHLXUZU8bMzKXHdUaSYMqRd1ZM9+X3KIsRkjMASHM59yfOChRiqGQf855ggqSKcdmhp49Bs
 ge7HgGGMEMLMUt5VfEj12S/nq7Btn7tvmzjw6tSPforlx1KFJ/zLmno66O+TGzjy3bsdH6M4vOu
 +7kxuKGZ9eSQXPOpIWpognkT+BoaZDIp7fGJP8SmsdRbTWaJrI4ft35pqWwrVUAC2TRy9B1vEDW
 xaB1gYxI4Mqv+04o90NP8KjUQBR6pwQ0LkWX7gm/3BsUTWq+zas4tYQ4yRou8RhpbNDA16xvjey
 /mxJsHap3kF6d1Woasg==
X-Proofpoint-GUID: Rb6t0hP9lwcUfp3fojahpjxQI_plBKR_
X-Proofpoint-ORIG-GUID: Rb6t0hP9lwcUfp3fojahpjxQI_plBKR_
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a12a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=p8LQYYvwJZuHz2WWpfMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_011536_475049_59D233C3 
X-CRM114-Status: GOOD (  11.65  )
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

From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Adreno 722 found in Eliza chipset belongs to the A7x GEN1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include lower cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

Add the necessary devicetree nodes to describe this GPU.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 152 ++++++++++++++++++++++++++++++++++++
 1 file changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index e5b8377e6c3a..c24c5e9695d5 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3742,6 +3742,158 @@ nsp_noc: interconnect@320c0000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 			#interconnect-cells = <2>;
 		};
+
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-43020100", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x1000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0x0 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-259000000 {
+					opp-hz = /bits/ 64 <259000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <781250>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-345000000 {
+					opp-hz = /bits/ 64 <345000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <2136718>;
+					qcom,opp-acd-level = <0xc82f5ffd>;
+				};
+
+				opp-515000000 {
+					opp-hz = /bits/ 64 <515000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <5285156>;
+					qcom,opp-acd-level = <0xc02d5ffd>;
+				};
+
+				opp-645000000 {
+					opp-hz = /bits/ 64 <645000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <6074218>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-724000000 {
+					opp-hz = /bits/ 64 <724000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <6671875>;
+					qcom,opp-acd-level = <0xa82d5ffd>;
+				};
+
+				opp-796000000 {
+					opp-hz = /bits/ 64 <796000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-900000000 {
+					opp-hz = /bits/ 64 <900000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <10687500>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-975000000 {
+					opp-hz = /bits/ 64 <975000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <12449218>;
+					qcom,opp-acd-level = <0x882c5ffd>;
+				};
+
+				opp-1075000000 {
+					opp-hz = /bits/ 64 <1075000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
+				opp-1150000000 {
+					opp-hz = /bits/ 64 <1150000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L2>;
+					opp-peak-kBps = <16500000>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-722.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6a000 0x0 0x35000>,
+			      <0x0 0x03d50000 0x0 0x10000>,
+			      <0x0 0x0b290000 0x0 0x10000>;
+			reg-names = "gmu", "rscc", "gmu_pdc";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_DEMET_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "axi",
+				      "memnoc",
+				      "hub",
+				      "demet";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gpucc GPU_CC_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 0x5 0x0>;
+			qcom,qmp = <&aoss_qmp>;
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-220000000 {
+					opp-hz = /bits/ 64 <220000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-550000000 {
+					opp-hz = /bits/ 64 <550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+			};
+		};
 	};
 
 	thermal-zones {

-- 
2.54.0


