Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BC2C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJ8Ew+S+TV+XVqus/74shJoWoJJfddIwjRK4epM6VrU=; b=owyiqtl48EXyehHxx1dzf9fmIG
	x/E0pF9+mWrfF3RehqL/h7zre5+rpYteY2/C4TRb38EcQ64F3O22HtqDTRYXAg+haaG6TLKWQlJkS
	D6Htk9gtG1pYNurziwQ42hadmZVaF3IINegG3yVrgnOnZowrQ/AyDp8MXJhVelTBXHeaGFy/FS5kP
	ZD9qqbbSqU5A7skIjFph2jy4jl3wBBqk1BQkL1AqOMc3Vy8uaN/SghGVpBUDAVyid1MsSJALMsZ+q
	mH0F9xZG9gd+vQTRt/UMvwgsXGIxURW8NfKX7xU049pTCYOkszysPQmJ4Cw0JU9yYRvTEpH+BWcA0
	UxFUccew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuTY-00000001lD2-1lco;
	Sat, 07 Jun 2025 14:24:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNuL5-00000001kbL-3RTa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 14:16:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DTpQg004631
	for <linux-arm-kernel@lists.infradead.org>; Sat, 7 Jun 2025 14:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WJ8Ew+S+TV+XVqus/74shJoWoJJfddIwjRK4epM6VrU=; b=RhgnbdseNMM3/L8V
	HbSmqGP/cRWqFmMw3dR+DXBqeOgrKWbM3sT2M9t/CvHaYk6frvd4MGXUko85p2aT
	LSbimrdDyZYNnckDpHflW+wUmlPbCAsoXe7GBVO2Pe+pOdu/4+w7oNJCdFkGZuQN
	z93ufJS++OAze323FXiQpwFv87RYIkn3pmxbB/IC7YNCRsYBJInYGl+pmgPcMxv6
	esckDhZtCWp/xjtnBF+b00C2GQ4QqHPYc9AOa2jw3CZoWWAfqrYAnvIKmfhBccIm
	Rgq6aC0/uLH/48t1eqn+p59+5sHdiPhdv/yEoX20NrmMyPlZVanvRWfCGnyt3BjA
	+q+qoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474crkrqu0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 14:16:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235f6b829cfso19473355ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Jun 2025 07:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305761; x=1749910561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ8Ew+S+TV+XVqus/74shJoWoJJfddIwjRK4epM6VrU=;
        b=jGVMvwx/2GnIYUxko/4iMBGJp0E1Akjf09ykTxoSunvP+0Zea6CejUo2TfxGQXCyqf
         5SUvEtXVSCmJ5B6W2wHO/q+Xaf4CgCM1R0hpg7LhO0tpXpiuskynpmI/NNhFQ2MAFndp
         jcZoObii8RevFSFC/FfO5I+/G717qQyv83TbUdEcNc2bglVNcMrq2h8AIntXyaX47L7M
         jnQWd91kzRZ9eFr5RCKzFcEt+0ke+tEFk6OPcyzuBY39SZl/ZPX/Mv8qhiXaa+d6jCc9
         DPeeNOVeFjvRmHcgA9MmgO1RHMfD3DC/Oy45HU+t7ErYo1MWD3XusnhWJUvd/jfUvVvG
         D8Gw==
X-Gm-Message-State: AOJu0Yw3n2I0U1yAbZAgRddtvBuhJGu1RKvNPvgdu4TVSsh1Z+vBUygj
	xGf1Ao/UqHmfq0bra7khjeCqSs3Yjz94MxBs6JsbULxuovLnt+4JASU/iYNZO1DMWUwvFO+x997
	khIVeHd8hBuSlg6EEMG30LMz2+8cclYSFeKQIADvi/1pG7kVj7o7s6lJlVR7VIUXrTsZ0nkJEG/
	X4/Xtrk4xJCg==
X-Gm-Gg: ASbGncvp1ucXyZUP2DR6Z1J6gC11ljIlfAS8TQsRIMRX07LDEavcXzJBNA5NxgyUB+d
	KC6DRH6ZoyTDJVDTXAP+Vp16a/f3LYj1P1NvfKY0adnNi28xx57OGMT7yhLG9oMJ/KZUSrBrehb
	2CBuO3PHjfedGg+Ikx/TJ8rsWlGCsu2qweALGbjZe/XjZVpBzy2eJ/D2AMpl5wySQrkoyejw+l9
	/d4dESDXqtPe0j7RrDeuuI9l9KUqoiseViyaKrCrKtpPDfExhOfuXZ9paa/RPgORZ8z99ZscR2J
	tJeFJHNZQQJNx5nkgQ0Bqw==
X-Received: by 2002:a17:903:46cb:b0:234:c549:da0e with SMTP id d9443c01a7336-23601dcb75emr93146755ad.47.1749305761482;
        Sat, 07 Jun 2025 07:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOApIcU2L2RZot2Csb4zWoWI6DwNf0PlZVtfKtEY3NUUZHvtafg2Uw/6v+Il6tRqW0hYPgmw==
X-Received: by 2002:a17:903:46cb:b0:234:c549:da0e with SMTP id d9443c01a7336-23601dcb75emr93146445ad.47.1749305761076;
        Sat, 07 Jun 2025 07:16:01 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:16:00 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:45:01 +0530
Subject: [PATCH 3/3] arm64: dts: qcom: Add GPU support to X1P42100 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-3-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=5559;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QS5xAbCsPSyfOkc5yt45bGQeG+Bp1wTdC51lAoqzxks=;
 b=pAY2ylCHsX7Jv7ShjBFdy78oBW7AkGOeMibz8rjkArmHDm7fnVviS69DyoeTBupFz5to0/N6V
 prsC/x7m3lGAT2ClArRRTRUbl/Sl60G4rLFyPHzIowAOPwk+HnkgpFM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=dsLbC0g4 c=1 sm=1 tr=0 ts=684449a2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VoI47dy04w1U0DMRdPAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: Jc25hWsbs_fxGbA7Js3cbxMd-vWOGxtk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMCBTYWx0ZWRfX+g1dOHNJleFT
 5K/Azw15A7QBWB7MtXSHNMPnW5OLx/RL9u9WV4EzEfHSnyTABn+GNVgy38To0yiFU5YQMmUKlNO
 f8/CIjD33FzAqB/O9By9iMT31HpTe5HYm735ME7tXx1/ZKIM+fCW0m0CLe95hYxc0xe+WYw1wAQ
 qPvNrZgEVVNZLjGcVdfEi+KHU7ACOdSKym1AY2QGIA2tNxp1TByn1G9/3477nEOKkfjgWWi+V0H
 8FOynH2ZtvpTg04cvM7KdHdHqCLivXPLfWfS6t4lTIsFHTzCPWTmZ+d5/crm7pGwr7XlWdS30dK
 G2GuIOlFJGsWpqiOXfOIheaH1zRYInMOhvFOH7Yb1RN7TWtivj9kWBdbDaIUTinJLgPvfniSuem
 SgchlUY33ds8euFAKdQSKCKJ1lMMtfxx3sBj0mTjkgI33pDJ3J2l0dxoxFaqCGAuxJRRXdNP
X-Proofpoint-ORIG-GUID: Jc25hWsbs_fxGbA7Js3cbxMd-vWOGxtk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=900 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_071603_981668_8E7D33F5 
X-CRM114-Status: GOOD (  16.42  )
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

X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
version of Adreno X1-85 GPU. Describe this new GPU and also add
the secure gpu firmware path that should used for X1P42100 CRD.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 121 +++++++++++++++++++++++++++++-
 3 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a8eb4c5fe99fe6dd49af200a738b6476d87279b2..558d7d387d7710770244fcc901f461384dd9b0d4 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -8245,6 +8245,13 @@ sbsa_watchdog: watchdog@1c840000 {
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		qfprom: efuse@221c8000 {
+			compatible = "qcom,x1e80100-qfprom", "qcom,qfprom";
+			reg = <0 0x221c8000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		pmu@24091000 {
 			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
 			reg = <0 0x24091000 0 0x1000>;
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
index cf07860a63e97c388909fb5721ae7b9729b6c586..cf999c2cf8d4e0af83078253fd39ece3a0c26a49 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-crd.dts
@@ -15,3 +15,7 @@ / {
 	model = "Qualcomm Technologies, Inc. X1P42100 CRD";
 	compatible = "qcom,x1p42100-crd", "qcom,x1p42100";
 };
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/gen71500_zap.mbn";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1p42100.dtsi b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..5ed461ed5cca271d43647888aa6eacac3de2ac9d 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -17,15 +17,134 @@
 /delete-node/ &cpu_pd9;
 /delete-node/ &cpu_pd10;
 /delete-node/ &cpu_pd11;
+/delete-node/ &gpu_opp_table;
 /delete-node/ &pcie3_phy;
 
 &gcc {
 	compatible = "qcom,x1p42100-gcc", "qcom,x1e80100-gcc";
 };
 
-/* The GPU is physically different and will be brought up later */
+&gmu {
+	/delete-property/ compatible;
+	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
+};
+
+&qfprom {
+	gpu_speed_bin: gpu_speed_bin@119 {
+		reg = <0x119 0x2>;
+		bits = <7 9>;
+	};
+};
+
 &gpu {
 	/delete-property/ compatible;
+
+	compatible = "qcom,adreno-43030c00", "qcom,adreno";
+
+	nvmem-cells = <&gpu_speed_bin>;
+	nvmem-cell-names = "speed_bin";
+
+	gpu_opp_table: opp-table {
+		compatible = "operating-points-v2-adreno", "operating-points-v2";
+
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0xa8295ffd>;
+			opp-supported-hw = <0x3>;
+		};
+
+		opp-1250000000 {
+			opp-hz = /bits/ 64 <1250000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+			opp-supported-hw = <0x7>;
+		};
+
+		opp-1107000000 {
+			opp-hz = /bits/ 64 <1107000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0x882a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-1014000000 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+			opp-peak-kBps = <14398438>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-940000000 {
+			opp-hz = /bits/ 64 <940000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+			opp-peak-kBps = <14398438>;
+			qcom,opp-acd-level = <0xa82a5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-825000000 {
+			opp-hz = /bits/ 64 <825000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+			opp-peak-kBps = <12449219>;
+			qcom,opp-acd-level = <0x882b5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+			opp-peak-kBps = <10687500>;
+			qcom,opp-acd-level = <0xa82c5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		opp-666000000-0 {
+			opp-hz = /bits/ 64 <666000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <8171875>;
+			qcom,opp-acd-level = <0xa82d5ffd>;
+			opp-supported-hw = <0xf>;
+		};
+
+		/* Only applicable for SKUs which has 666Mhz as Fmax */
+		opp-666000000-1 {
+			opp-hz = /bits/ 64 <666000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+			opp-peak-kBps = <16500000>;
+			qcom,opp-acd-level = <0xa82d5ffd>;
+			opp-supported-hw = <0x10>;
+		};
+
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+			opp-peak-kBps = <6074219>;
+			qcom,opp-acd-level = <0x882e5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+
+		opp-380000000 {
+			opp-hz = /bits/ 64 <380000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+			opp-peak-kBps = <3000000>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+
+		opp-280000000 {
+			opp-hz = /bits/ 64 <280000000>;
+			opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+			opp-peak-kBps = <2136719>;
+			qcom,opp-acd-level = <0xc82f5ffd>;
+			opp-supported-hw = <0x1f>;
+		};
+	};
+
 };
 
 &gpucc {

-- 
2.48.1


