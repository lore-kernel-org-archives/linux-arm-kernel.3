Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FDDC71131
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1mTuadu9vEQPY2JNEOp+7iIzW/OVfrDJfnLsNvR6oY=; b=P5cmH322qVbCbfniczP2dY2mHM
	VEhxt3cXI6JYAmMx9FEgrv4R8uKYgQVODZCgnwQx4h+l1aQDF1C8I1C1g3oDVybX4ukpC5YsOiixR
	hHSh9C7Gv7jv9xlK7AB/YFt2k7qfFancMXE7w/48gEB6v7/ArZtCOKAqJXttorGqMy6/s8ET6ksLb
	wX4outS0M1bqWR1a1iq8Jf+JyxkpSuk29zM6Kc+beU0Xgxp9TNxdI9PnYsk65H+qiwW8lnLfmHPq5
	NMQesZpR4XmeYWOxE6vHlN7SDtQhiiGZh0FF2nlHjmUQF7kWaRee3WMCa7/B0Y3gl7YLcxP/yX1w5
	nxmBfADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMpV-0000000AHOP-1I24;
	Wed, 11 Jun 2025 14:53:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJRW-00000009jGZ-18tr
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 11:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V1mTuadu9vEQPY2JNEOp+7iIzW/OVfrDJfnLsNvR6oY=; b=O3x1yaSZWTgkcaFLjb/oPZmVNR
	WW+uIyT5wEQmDN3DMONBg07gIbVk0GFBryEHgDMfTVPsDXDIQ91Z4bIo/Li58nZSDRbTXbo5+MeMC
	StG8tg9Gw9/wbbe0gZvPda91IscymeqjaD1kQq8o9/8iTEh+CDTJg4NW8hjOha6IZO/M8JFihUqlG
	PZzZWTUiZHPIYVKudomERTNYHz3xFukIbZ1rKSFK++PFkWpOLLVXruR0b0TS0fpLRTF59x4hybac4
	6BauyMObnWgE3by2gKcEdF69birBHMA0jwIoHV/9HgRdizPqxXzVFRYTCLE9fXs9tusGSDM51b7O4
	c3WSsktA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJRT-00000002LQj-0fxG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 11:16:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DKuS019840
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V1mTuadu9vEQPY2JNEOp+7iIzW/OVfrDJfnLsNvR6oY=; b=l4cGoBcUMc2w+k6q
	94oXsKe6H0ofaMQeEwNmCUKxs0JTRWy7MgtWtNC7LQMOQzLoP35OlOEddwLNVNua
	LLXq0QRdv9x6hOkwIhada6La6YsS97qZv8zssezKF8tODi5FFbpo7SdRb+NdEmhj
	dAEh5o3LyevWqcYYP28317LtDkiCv98FRkZSmaAmSyxJVOWGCBfwiiEurJr1GddD
	SmlUr1DOJtatEA+eGnbzE4IBfqqrGWV1qpCO2novmlEvscRnCOz8gE9OHyNOMRWc
	24mL1wTpu0zocFK17ZUPJ2LuHoH5iw6R7BX1cFVFf9d/HgZBEWieeeIBAUAmPjeW
	H3dJWQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcmq1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 11:16:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-742c03c0272so8414244b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 04:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749640583; x=1750245383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V1mTuadu9vEQPY2JNEOp+7iIzW/OVfrDJfnLsNvR6oY=;
        b=NHk3tmkOPb5auh3NkHVIPiFGNfwPh7bgQXvRiYDksX6fJ921bX203QpjZC1usFaWyY
         V2IXjKJDL7lyEw73dfuAngZYN8kdne0HDDVEvGBYon8hgJfxR/w3mNOLp+Uef3BbKPnz
         F8NQi7aFJleUHz2Hq6e6NvsPqaNlz3OQ0JIQw3qLwRewuM8AaG5UqZ7PZde2hAwmNbLu
         kTTno12SKSgUZ5ggu/ASWprb+Zk+xIx3AJnNtpfXw1nHL4nZcPm25ULt9oaAknOEDqmr
         S12wxihcAefiNNwVQqePqKIkmqXPOIVu8qoJtbXJFaQOWFyGv358yj9KUSpe119h3ioC
         2eTA==
X-Gm-Message-State: AOJu0YxzTSKBOm+gpb/qInje9hPjR9wm85n+7XvyOYMvk8ASU2KS4Z32
	ZKEtKQgfMKA6BA3l0uMz7pmSR4b8S/JZo7YATx/rZ5skFHSOFFfIwqwALot3b+yp7Jzi9eeOTrT
	iqnM+bcNWxEuzzOZOHjMfzRx25pAHk1Dr2IKKhX/FKa31nPB9d5gXEC3O1VrRxV7zD9tGnxsBRP
	XANQ==
X-Gm-Gg: ASbGnculLIJGyrWF9r/1y6eSG+WsEY1sM8+rsxu/E8ct0SEnwSt+UhV3NFs3Oklp37C
	HAVSih02QG9vXO1aS/L3JEhBmj+YspH7SUfMkJUQVas0T9iXaEERj33X4F7AD89XtH47hiryNG0
	XCGx0E2VMEJjrtTuBG7EvjgzyPkF5Ldk57ZiZssZEaMlyVI4q6neVPNtQa8DpoUQr8I4Z/bcTq+
	eqyeSknfcl6KvF2TuMWFigN1zoWmkWdVJ5UQIKHZLhNtqeiTrsSYlqIEljek1xImApqyzbFeVYt
	M1c7470W5WZVy6c6R3aX0Ar8TQD28FhD
X-Received: by 2002:a05:6a00:cd0:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-7486ce18619mr4023748b3a.20.1749640583404;
        Wed, 11 Jun 2025 04:16:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGP76o/U3R36AYVd5ja9f6V1AiXn/VNLDR7vVtnNsh1JLfgCInvw13ZQN98n1A+o2dtgplzQ==
X-Received: by 2002:a05:6a00:cd0:b0:73c:c11:b42e with SMTP id d2e1a72fcca58-7486ce18619mr4023697b3a.20.1749640582924;
        Wed, 11 Jun 2025 04:16:22 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 04:16:22 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:34 +0530
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-4-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
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
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=5718;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xuCoARRIycvnlpjtSpht+VThiMR7a/SohDoKqRPbgOY=;
 b=UMTfzq8FiqNsPn2/SX0+89dDo+MECO6N05n12Ur/ZdlD2OlNCN88i9nw4gHUDWVY+y5CRFIh/
 K21qmVooZJrD6Tk143u/2uGvqfiiSM8aryPHgPK6TiPCs3ul9Okz08W
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX6SW1V3F8iPck
 HEHIHFAV3s+3BX/lggpbi2YX8d38S8aAGBW2Z+iBKKBROeNrdRbLOLjQP1vcmR0579FYfSbGEwh
 AyiUxLaYuJYcbpuhW0fOeOTCjmgBB2gyn5ab4Sv1Zmy4C2qKeitWtFYbZBf9y4LHC0WmiP2+v4b
 EBjfABoY9iadYGhg0UZNEzRwegKIgkD35VWqRP5K86e+2gZpGbKi9KFuEoN7JPfknq8HjzH4kHh
 m+rxB7vdgEe+ddBThJAae0sRw/CU8lxQaVFxh2N2Z275xrqQCdeqmNEqg7vGzQuC0Z5W+q8SAXk
 oEM3u82Yoa99MbikCm70oqUcY6mx4JpaWLzbjF8XLr+hJWCU0YCCvXYrdgbjYNMk3+Q4RLSx4OO
 90RWZRtiPgYBXdExX7H2fw2/PrdZEcDqz7M3Kp/BMP+7qJOzilxGFT4MResZ7bQJpR9bNe23
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=68496588 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=VoI47dy04w1U0DMRdPAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: iSGDzmOfD5BO310GBXZame-PIKQjFKUP
X-Proofpoint-ORIG-GUID: iSGDzmOfD5BO310GBXZame-PIKQjFKUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=823
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_121627_618780_216A5C18 
X-CRM114-Status: GOOD (  16.77  )
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
index 27f479010bc330eb6445269a1c46bf78ec6f1bd4..807db5a079394442596939847e0e6aef4b0525a1 100644
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
+	gpu_speed_bin: gpu_speed_bin@119 {
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


