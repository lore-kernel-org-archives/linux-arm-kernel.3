Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B975DE6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=; b=QT/w+pDURvr6EIkxZqjLLjeA/f
	bbHMe2cmzpv73HJzbely4y8stpiwPS2F+AbrdH0dhOJH24mxWm8hGEmxo/od5QQXuwpnI8ASHAYMx
	6ib2pcjZVexdUAzYlWdmTgSTq2hAia1yFzWTjUCoXAh3i76+cfsCTjuJ+l6ArkPjXvWnrfmn2OWYE
	6WsfCQZVWiLqPKO1hwx7ITd1xvfKNFm0DjECXizhI4KqtRkV+tz1tB2vUx2F6Ft4/A0UjbzSC6V3s
	XL5BZnJnAl/5Jti7sp4UrvjYjvilMEN8ovnY+kOJjWk4sS7iTUnya90SktP6qomQioNpSbemKRXY/
	XdF308yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sH-0000000FnaG-2IEZ;
	Tue, 23 Dec 2025 17:08:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sE-0000000FnXs-4684
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:40 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFMLIs2115407
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=; b=PA6Q+Mgqq3E6f5TB
	m3GVbyTcNZEGixMWmuAM88Q+QEo7u7GXc8/1pYrpj1jfhwu9AEnOgLHpgkcYzt3Q
	k/QzCw/EhZzROCe41uAclvRqbSE2ZWwCgsMBLw9Qwidk4hN/uP1pi4sN8OucuPeI
	P27Jl7L2LVV3/Imgr41xmgyS2AoPJaoRFyRVwfawWZg5/grnSUeeyXXP4vHNzbgb
	6NahDkT6spxNz77gCKopEGPWvCoQ7r6KefQAqyrI5ZCAPqvhltSPZ1eYvMR1ZcSd
	j8T+a7V/0nJ81zjbFzQiG5Q3oI0+0Dj6EFZMDA15GB1r44x2CPNbWNF/dnOgTaIk
	Y+HDaQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudkfba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b90740249dso8967264b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509718; x=1767114518; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=;
        b=T8RynC3U9V9tk+ox2Hah/ugZRxfm1X/Bns7dIISSXGpyxZn36MdDlz8SBHS6jVlmgp
         //K46gkrkeRsC3xnb/hPA3pq6pYs92j/zoWv/tp2rRU8ivw6rdfmuYYjcxPOv0TKGQXE
         SFhtLIXOl5e9bpo5/KKOzBq8q/6zpfn0xZzQPhV/w9GccDnqnLTK5LF26GrLrMd+/fwq
         rz9hVgq5aGrCyHkr1R2iUXztS6hOcyMWcHcxIhCU+9/0sICOYXcHVSr3+r2moy2SbZdw
         KhuYEpIhcxucsT0jFPkKp4s0v5r0TNpmoaW5dp2IfPHAx4BvxVeHzvrz22+pEEQnMOgg
         wkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509718; x=1767114518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=;
        b=VJ0ifv6TFgJGM2D4ZElDH51Xuy4xes03ZqmYG/Bo6y1462MirdSxE+VZj2EoxyfFgr
         QG1f9Ml6pcI8NQ364aJNFKqpTNi0c1O59qpDYUdbZ5ktromFSLnezh8BSknqSgJSHxYY
         tejr9ht0uILfHs+JMypqnevOfjEugKMVhXcjfiZ7SsPHfIeoM/Qn2UemOt6qZZrKAmEL
         5e3Cssa4Nhm7/pU4YW7Y4w8J7nNd8hXKMKfxGvzPnWRnyWRw01M1/I5kdWMxj09w9hSe
         38IGkyRbE5Ek6GPBghG3IVGl4XkqqiU9rplxuI2WqYyvLCaOsbxSZpSDLfzcHkC3fi5u
         DfWg==
X-Forwarded-Encrypted: i=1; AJvYcCWtApeTe9sWDSGTi8NiAItJc8XMXJYgZnPJayDDnSxyhNoOMvArFvFbq7HKVmhNTfImZE83v+0e7J0zQCXz+rVA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxryc3ltebCwa0eRfmnBMrEVtemOW++1G0Bxz3k+F9XwuP0b5Mv
	WqYZNzspO8JibBzCa5UoKq1iPZy0gyENWz76WrUsfIBwcgQ42AgO1C7OR5Fvdw2jHdAJAIFl7+i
	HM9dUDZA/avVP45JkJ5ZK2x6IkQazF3rU63EzSWZl+WCK8qU7jG3z3C6RcPXAVmZNRVaywzCILB
	BrKg==
X-Gm-Gg: AY/fxX5+7hx2Z41f7dfelWxyY3WVvFzMC0aGL33Hdw7HVEYNPZlTsF3MAUZxO+fy8g9
	RtUc069sBi0uj7EjF+kKe4q5wh84xIFsaJTnSMhnXjsS4GOaXQDDzG3MOqicqs+anwG0i1K8KWy
	Zc+970734a1zUS5xEewwz1mnSGZmNQt3pekZINYtXh9OkOHS4c9+9ypbuTRdZUB3z4glmOCYjE/
	07oG5m2XR9feHNJnQOupC6p4FVN3pAggi5+XUSNRbvpT7coCstVEio8QvxVUyCz2pzsc/iZhXhf
	IoDroa9JPPXW4BaZTn84d3e+b4uNlURg3S+5VweTktHHewp9TDf98Wh7TEB6w/tp+QMpKLtvVhT
	duBZBLVLKcMPos2tC7pDusHrWHvSAh4NVZgdyw2FXZzGDLw==
X-Received: by 2002:a05:6a20:9392:b0:34e:be9b:b67f with SMTP id adf61e73a8af0-376a9eda02emr14169102637.49.1766509717726;
        Tue, 23 Dec 2025 09:08:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEDPsmvLjxgTLHJmtjhdUkmH9fNkZmVphr+AfeK0f30Iygo4+BHC2YUjESeFt6TJsQwor0DGQ==
X-Received: by 2002:a05:6a20:9392:b0:34e:be9b:b67f with SMTP id adf61e73a8af0-376a9eda02emr14169076637.49.1766509717256;
        Tue, 23 Dec 2025 09:08:37 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:37 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:38 +0530
Subject: [PATCH v18 07/10] arm64: dts: qcom: qcm6490: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-7-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=2238;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Uo7klXz4CKVLIAFhyMsmgHyzo6vZoHcxyIjPIsWKeLY=;
 b=UyCKsyR+zpqEekSnr5zk9LECTpKfqgJ2q0uGOYOICyyRGufhh9JWaPmDMoxP2tI3u/Pf5cG2o
 hK4Agq99Pi1AhS2aP3Nr7p9qo6s4YH4vVWalpNtExTQXArG5Yvl89zR
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694acc96 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: x_nxBkOyiYwrsg-ofLDyM3cpW-0Ivq71
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfXzuynZ6avNz8i
 6dwAEXvIVkdT7pycsFKAfnK5sLKe3hcsAdn/xSR34LfS3/0wYSSNqvxmHDc02XulKKb7IPTr/XQ
 wZ2h6MXKZZ8HFcjLvMnfoQPqxGiJtzvSRJpu2Ugz5DDTvAYKsItS3tQsNr3sl4A/gjiVsj1EwLs
 F+KokKN4q420GO7FdY9JrGn9Gsoq0eZEDEeXk/lNL7V1ovVno+r6pOEM+Uu5uZetLCybmEmmorI
 zQRJQtBf/+i5mBoGrP9vWe5ZrfTatg5Kx3yo0e294YC8kupFxoR2BLauQXD0U0NpU290ojmq8U0
 HYRix9i8utSXmQ2rKsiqD5X0nJPHCV3J11Bonk5Wbj4tDOcp5ICLyK62AnCLeVudMCGgTGCeLkT
 gx/tUK7wP4wOOs1EFtNPO2y9HYi4ETN8jb6tNLBwRFGvRoD/9g1/uI3YgtLXG1FGjR31X/Tkmf0
 sxZ8s7dSOvTF0fMP/pQ==
X-Proofpoint-ORIG-GUID: x_nxBkOyiYwrsg-ofLDyM3cpW-0Ivq71
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090839_023118_2DA43464 
X-CRM114-Status: GOOD (  16.53  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
for use by the psci_reboot_mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all sc7280 based boards.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800cb9927627f991e3d97174cc73c64..e319a1894901cc9c56a89cb8b8ad0acb7a18dc99 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -858,7 +858,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 089a027c57d5caed103f41f20c01fe1294b4c950..5816cc1c033c396f49fddbbcd4b09e5a633bc804 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -695,6 +695,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288e9ef554ecfff59820ba39bf2cdb1..6e836e476d595b7e1b69a0859cf2f697c529cbfa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -935,6 +935,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


