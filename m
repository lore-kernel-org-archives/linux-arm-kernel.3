Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF27EC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 17:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZUSYhC6o46Hf8IpyKC2uFmsO01aWBnLrFas76fWv42s=; b=4GdXLjA2UQdRtvHA7qthbTud8h
	Mv0R7AALFy/bOnVr+GCzV2o5Ttw3vgV+ZxkCMaKUFXZegejK8JTRcZMHAiYfU9XCv9dRf+TXAIrXw
	qNZsB8naMpq/l22vKhCEb07GHtWME15HiqfAcizH0kb0CX4YDrsA7b69/NInDuq+J3tn4ANbc210p
	UtiNb1L5F3XD9oXJUSPLeIKzbvxt7HKBDOpEH0AuAuln5YeELm2OjjZ4v/QU05z0kJzekhptpTTiA
	JtfgWpANQ/dt+qyvYkH8JLemt3u/3MIm+S8LUsvM4lBXZFze3iCcn9UlNbcpcknHv+uK75yQZxcqR
	3+rjdyVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlCB-00000003aX8-30bF;
	Mon, 23 Jun 2025 17:43:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uThwY-000000030Er-0tck
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 14:14:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9UAka022368
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZUSYhC6o46Hf8IpyKC2uFmsO01aWBnLrFas76fWv42s=; b=KzNVGll30RWi6Znw
	rG62oRtxVLFWOJjMUvNQOaqYsewyjci9iHd7ClacY8Yx/yeDaAsJmQclcxneZZCS
	euqOX3rWADelkrx7LYskaWFG+IJe+xeTNiypoh6J5xcyswo9v85OjhUskVqYxYpL
	tytnql2AAkNSKyNhfxmivRnIQgiiGth2tYYFDoKtPoPBQptsKsRZsy7bgchr5T3s
	U2jokWsXNj9BE384tn5M8/7+pM6b/NtfGnpgJgET9HWW2fbRNX7YBcuOhV0iVx6n
	MTX2G+ZELyhFkb/J9u+x1ohWFqtiCzoMt5e2q6tll8s11PKTREHH3e8pwUtAEZAx
	jBkMlA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3rs2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 14:14:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso4279670a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 07:14:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688081; x=1751292881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUSYhC6o46Hf8IpyKC2uFmsO01aWBnLrFas76fWv42s=;
        b=RCfvzwEMjFEiEtA8iztwD//GLHkua1xVPL0lc57HN0+mFXXpiJKjmHqVrYv5jLtBOM
         3bSG34jOEgecyfz8yzS7K0otuGRK0gv/syXcpuDZ5kJ4DEKwjvJqnUwrIpCxrF+UPWQf
         w9NevYEorATZioA8TMnL3v2I1gpqu21HE/iUL+jIR8J4NY6yeDW/6oa8GP1TyOhPG7wm
         yGTqdCszulcgIjB/2hEknRJrPT1PlqZAEAduCGYWEM9EP8eo70i00g6w0OOk8t/BZnV3
         Irzg8mzBC728jscp4XZSMdxGU+EWcfhQcNYay3pxcoTNF6RQVI66frq482xIwpOn/2ML
         xaSA==
X-Gm-Message-State: AOJu0YzbrGE/nhlF23QJx+2Dv5j9ckCmsXcCxRLw88Otp+hkcAsGF55S
	1Gq84wJhoiwP+0ZkLTAh3oJMITJS9Q7rcSO98YMLCt7gZnnppfZPyCX5lLfN/VEG++miO/sWECl
	If5bNNbtzLR7tUwSvdwQx88PtEn3Vs8IYslrwF0UyB4+PYBkhC5wz02Fe3CzrHRBBZdWHy7VmMS
	ZD7w==
X-Gm-Gg: ASbGncsu3cOFOVO8WR7WP17q5QPXy+IcOv5/ZYDfEEwIpSj4RvPRZ1DUQFQYTH97Ytd
	kYkExbQZcyBZYfF1gaQB5Fyfuu2FUZ6AAS4Hel5yGffkZ8EYso7qJ9QlheiK6asTOT5IQZ4o+lL
	NgH3pBFgR6N16n5dI08W8oSCGNtyufXDiol5hDl5LxX+A9ShGbfFDzlpDqXFC9NIvvxrN0lnBnP
	xVhDR0Vei/vsBwX0gZVnKZSmrcuk8RPEzurVqNCFJwFaUR6Ed2CMcI/058JFyO1q/80vIOwPmId
	DWQO+D4cdQjol+txXcBFfB2EiNEPfZJI
X-Received: by 2002:a17:90b:1f8b:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-3159d8d685dmr23300710a91.24.1750688080575;
        Mon, 23 Jun 2025 07:14:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl1qyuN7gQNvPm6W20g4kJcQ/+98rCZ9ZS65bbUUQKpRf+w15+pvrZr59iT4MKwZX3WdgrHQ==
X-Received: by 2002:a17:90b:1f8b:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-3159d8d685dmr23300647a91.24.1750688080133;
        Mon, 23 Jun 2025 07:14:40 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:09 +0530
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-4-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=5912;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=MQN6pHg2XU+7FGCZBrKWg0kNH29zk0vF/Z7d/e3l7a4=;
 b=cMApY9dMEMtm0TOSSRpoZVVcb0aMMXaCw2trIESEtt7ToKAeFPBno+Kl9hvbWWuWnxoRLFDpd
 XtgMTQXizmKD99IYT+3MfqIzaFEvS5NyRB4eDKlASetkPWn7K4gWuEd
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX0OOH6kKNIJ57
 1eiQIAjA7u84/dghhSH09/nT7qzTFDmKBdJbgbuQs12HCksY08ocSc7nmurrb4ZuAta13SXSRSD
 bj819UBm7W/jnFzAwOT91vcBPudOIJcKp+Gsqg2K+B7zSdGYZIavVsXPDUnAeFHfUOG3fHqfip3
 fjAjOVCbdCt3wI2nmThG2AJgQ+dQUNoLnCYzfvPDWBAQ1bPhQ+jRVZLX1d0eq7mTtZekFGJgSLY
 0XVb0A4iMu/p5PJKZ8uPEu92ockW/VehLPR0ZoMJsRT+GL4E/l+39MUOxnIDb0KpPegSgTN4bSj
 pRQvqwDEu2ZxQOwyJBA4vFrZifS/QbOx9skm2opriUnrQEdArwaXuvNeU/vTzsf7FrP2YdzLieT
 ByXSQE4m8LT5kfz3O8Y6sFSn6mPR5GbnDYaxdXw4GWOO4okD5zAG8/apRh92XykRjhWKpAj/
X-Proofpoint-ORIG-GUID: 0PhwVWYV3ztcmHifBI1VEqalM85cvXtT
X-Proofpoint-GUID: 0PhwVWYV3ztcmHifBI1VEqalM85cvXtT
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=68596151 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=8xAZcMgD8QFAYO27TxYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=944 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_071442_260267_FCFD1D9F 
X-CRM114-Status: GOOD (  17.09  )
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

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |   7 ++
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts |   4 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi    | 120 +++++++++++++++++++++++++++++-
 3 files changed, 129 insertions(+), 2 deletions(-)

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
index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..090659b8bb8942cdcc46f8d4a3e7dbcc043a0f78 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1p42100.dtsi
@@ -17,15 +17,124 @@
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
+	compatible = "qcom,adreno-gmu-x145.0", "qcom,adreno-gmu";
+};
+
 &gpu {
-	/delete-property/ compatible;
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
@@ -41,6 +150,13 @@ &pcie6a_phy {
 	compatible = "qcom,x1p42100-qmp-gen4x4-pcie-phy";
 };
 
+&qfprom {
+	gpu_speed_bin: gpu-speed-bin@119 {
+		reg = <0x119 0x2>;
+		bits = <7 9>;
+	};
+};
+
 &soc {
 	/* The PCIe3 PHY on X1P42100 uses a different IP block */
 	pcie3_phy: phy@1bd4000 {

-- 
2.48.1


