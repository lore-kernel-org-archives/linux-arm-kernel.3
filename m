Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A33DE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 17:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=; b=c3ju5fksJrleeFL9CCdmM2A5QR
	ckrXnH+xeHYTCrCpzfyXXUiQsUkyuz2QDoptvwDR6kVtTZDtLsa952AmZzFEdNRXR3v49sRP+bswc
	sFuWYrj5XJPOpzvI/HM1Qd4bDiWWcITLCCodIDyO0eCBcMfex7XtKXmnqOAG4zI2OZ0E9Wl7ujhuQ
	Y9eYG7YyFCiT9XSlmEavhZmPj2IPR/X70dF3tNH0FVvoGwN/JH+v++mQ1wpH9TTqoVagRsfD2HJuC
	N0qzOAzj6/o7QmKOh+mymxaW3t0PSq9EIKB913HFoe2BOUmhDS1kQi197srQY2MjmjYaZrvLddNxi
	z4BFe2Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSR-00000002uZ4-2U6y;
	Sun, 28 Dec 2025 17:21:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZuSO-00000002uXA-1qsA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 17:21:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSGtQMP674702
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=; b=EzoJRjUL8QD7E1Ae
	HKl2pINuG45uoRMGUNlAD/al3FkjgqxLl/ps3pgvOW6E+dusZO9NvAQT7Fy9nteh
	4nQayV9pkeBHCjzIZVQpsywW4KEIllG5mAyWystic3c3F756tV1FQD/dr6uB7YQ1
	t1NZAUURUOYgsChzdx6ByGKbigmuQN0j5xjsWc5fOJiRL7zNbTzYIFhWCauUwIab
	iMOixZTTd1TwkXocvpypOX+d5wGjKkKD+v4L8ROpY0OyNGUPpTuai8mjAAUMu7pU
	RZhvCG8l3TLtLleQ5GtD4utdZV1JUuaf7pX2YDW3DrnTQv3uRFbEEUPUSBZVt9oC
	pkN6cA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj0w8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 17:21:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0c495fc7aso126275965ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 09:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766942487; x=1767547287; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=;
        b=jp3gYD0/lNDN1++jJuuQCvIuwcsY6ln77miob3C5uNcKoWiDuyv6yY6sRV7CbP/lpb
         jL6vICFCRcHjkGqTxMgUcLflYXPpahfNOodWrNE3BYWz2lyE89owqic5xZcB8qgtGLdj
         kBrzOFUfdpYZYZRLW7x75QmqW7JA3Hky68h7ghtIywdVZjWpJVLaLgLZBVW0v6Fb9T6U
         lK48FRg5KJhN8pV+AhCq1HtV8At5TTErOihc/4sC0id9frrmSyRyRvGi/oqbnbYwy4Lu
         wl/3a41Od45CDKgllHuA1mZ7Iks2FD9L3cP+aCFp3HrvqFldwG6LJF9LUsaM5dCQI1P1
         oGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766942487; x=1767547287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ppJ9L8xk1apLAmwIJtT0Qc7Ciy7FBPgdY26Q+dCWm5A=;
        b=OzXVH4V5+seAQ2KKjQ9ABrKFJ0mbg4mfci3zNFnlnG3riaJLLDUnFGTrfMFBo7h0/y
         Ki2h/+8OEnAKRw5UzC74+Xa70ZNZ/OU8DlymVC1Alg6o9Sk9hZ5MIl5srS5Yw68EXwx7
         eBny8zthhluxjLwBFlPcXj1BJGm60kzqTRDTwsV1ct3KHqvuzu8ZT6yI4jPKdsa7plJC
         HTCaMvyatD1f73pocpoi/v0OaRlqAo8gdmXRUWSPXr2na90DgZ63SMzr8srKGglQhOn3
         hFlt+g5SenxGazA8lMcaNS4bEqfrMqqq2iic8k7uXUV8NjjU+aMSxbk8m3vxQPMl8jb9
         FFfA==
X-Forwarded-Encrypted: i=1; AJvYcCUxAl0PXIUzFfXVGM10tPRs/RldKODw6YZ0xbA3IQozzk/iuzRa550WYDd/eWkoX/65ivUexFAZtWTM56XrqlEq@lists.infradead.org
X-Gm-Message-State: AOJu0YyGhyArNN1gc+8Q2K7TfFYIp+HIdx9Hs6DR+v4J8rfvaHoBQbpQ
	O4cWE1wHN/s1BsR+PZL/kZgUlWpU5oAtU1fHr2EoBDSEtPKLeIIz2baiswCID2ipN2YoNDWZ619
	nwu7zq4r7X1tKL6xJ2igKcIEnpJo5xQm+NMCMdDcYeTU+lniUYyOZvDSLOqbJNm2dKHyF2YVWyd
	N74g==
X-Gm-Gg: AY/fxX4b55Rq1UmYaL8sEX2fOBv74gJjLS/5TrOMaDmM81Rl5Ze3M1sqtQFFnys+AWK
	6r5w/rmcCK2BqKGPDc0XBeDPpKbsEoVyTnrCy/Pu+ZiGloYysMYFklrlHOMnm4DjJ7WlXBxOoOz
	qO390mPx8gr1S5dPTym60YSNSwU7fgNP3XXEBSnSs1FY39G0BQmG0HYr/4qrTQS/Lj3aN5zaDqn
	KQxUGYrmrTII5y4E2OLkAVyHURREPps9UySYsLjlMzba3tGx+F7fFXOZyCOcyYlJ425zBzo6SyH
	S9Zbrcc7xo4VlEnaAKavE7/TbQu7QXIW0ssRDPjQIn/tkBJwML8IRplH0OSjYW2g8SoFwwuOPgd
	LfnUXE4JGEQBoGq+SdXDtjMk5Tqeb6uwftWNlkzksJLqulg==
X-Received: by 2002:a17:902:f60e:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a2f2a3b006mr265902155ad.55.1766942487124;
        Sun, 28 Dec 2025 09:21:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJSx0CMlPpO1gbVee/NasF0jklirO9YTG+DoM9fRKyeRuAQjt6WQfhSmoqGrvLFTbitc7NEQ==
X-Received: by 2002:a17:902:f60e:b0:29f:cb81:8bd1 with SMTP id d9443c01a7336-2a2f2a3b006mr265901855ad.55.1766942486618;
        Sun, 28 Dec 2025 09:21:26 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776ebsm255743965ad.99.2025.12.28.09.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 09:21:26 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 22:50:25 +0530
Subject: [PATCH v19 07/10] arm64: dts: qcom: qcm6490: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-arm-psci-system_reset2-vendor-reboots-v19-7-ebb956053098@oss.qualcomm.com>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
In-Reply-To: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766942426; l=2238;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Uo7klXz4CKVLIAFhyMsmgHyzo6vZoHcxyIjPIsWKeLY=;
 b=zjun3NJ8FbNcNuWN/6W2esPCepQblwL/KYhsLnapaNMIgfPaJlJOlH3y48HuSQBk1iYvQhDM+
 ar18UWmDTO+AJOzp1Ozc76c7Cd1XOxCe0UtGpGJnqzOhsYWwxlYo5Y3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: KUYGHBiwcqMwH17V8czik1r_wuisDrPR
X-Proofpoint-GUID: KUYGHBiwcqMwH17V8czik1r_wuisDrPR
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=69516717 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfXwyDDJk/PSx7E
 a27uHQinQs17uoFL4vWnhYQ/yIESzuj53ljRAoh0tkwTE4TFkJNbFDVVsdoikrBaJ6B3mqrG4GZ
 WD0urn5ktMAX3YVaGVjC/Hh7kR++8XdEekMEnKgevz+ayy3XpuDdQ0ONEwJ/L7PFLee+uRt2KYC
 7kX2i264/gOgqKrOoBFTDNiL6kCZCp0W14fWMvVMPgextTiTNbNxlDPP7x8eID9ThkP/adgPhIg
 sUBJSom29XHi0SbNrvT8HEfTUoS83k9sBmaYBvZMLSvCemBagc4YEyjqnV76shb9e6a/Ljw6MxV
 ORtpyFefSwyOVnNeCHbvZSQkPbAFItzkpNbepxEpyMDAukEDfpwEzVbEWByFNyHqxaAwDm7LREg
 DiPTHQ41DtsXhJxHiAyvYQpKa/OQZ348zTYHPJgo1JBYtgNKlfJGz060FXiF17bXmyje8oVxn2A
 O73XBQHah/kQLEXbJmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_092128_497852_A7A15144 
X-CRM114-Status: GOOD (  16.23  )
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


