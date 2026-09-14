Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A039C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=; b=py6RsdaOb+AzWx0WLB0JMVw92e
	5AD8+/WpL1NvvArtWzncAqPsFKMJqajpQMPL+NPtR8r9LkwadCURS7A4+9fPusnUF9t31bhXXCR4Y
	vYbwVzOxi1KXGXfi2c1irZTK+5FUVtEfXPdgczTAeBtvObK+OZyuFgpA4ACxuB+KSPintM6cgdbPo
	sXQLAEqoXDPwRssVfYepYqPUA7s6nUZ9EQINoD8dp1wC7qCoKsK3N06mHuFjMrFMkAFsHtLzNgCQE
	C0yfIrFk2E1pNmghaLDAu1fm2CkPxMmCdtB36zvnfm+cbGYUWR7EcqcS6d60VmhoYaDiLZ5gE+EXu
	GCm5UufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68BG-000000044Ya-3phj;
	Mon, 14 Sep 2026 15:01:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x68BD-000000044WB-3fgk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:01:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0RPq1761295
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:01:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=; b=lg1hMAq+rA2JcRsl
	MaQMCeQKDQoXXDEuAkGPzCk9mfww45mYEak/SQD5rKAIFvZKvOB7KTq68eSwDSEk
	lrYhjOQfbmevxvH8RAqdt9Zi2YnB4Sdd3mza3C+v/8aK74qku9giZfPnF68s6bju
	lVvsMQ84PIu/2MkJqZACptjMjLl2vF637F8EmhZS5tAjWF30yMyhEpZvm3crVsNf
	G3Q16S1LjGNS8dp9Bzf6JYiOFOTZ5UbsJcexSlgf4Ndy/n6PKCs/Xw2ShAAZeT/C
	9O0wIa56inkE8gS5835wc2u7wto/QUeZA9Vci1hDCd3jKlgyqEG4ozRJtZn5KI51
	zuShIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex98ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 15:01:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso44219535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789398071; x=1790002871; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=;
        b=hDfQ3xnywL/gblftmdrA5CoBETZacHvxWnzERTutnugCUzRqTbR/SJt3OHi0Ixcsh/
         uu0lDNoSl2Dcvu6XZgI6lu6allyanSQ4z5AYTjX9A1pB45o9CK5okxA30NtOO7c2DkTK
         jiI9TZjlMPS6kCpWNc804VA0/7DCheqQMF1OLbCgeOODgzdD/5P+MPqTAKefTttUVjwJ
         qmfkPaMoLCAIVu8us6WZhLVM9A8nsML6f8/RhVuE1o//CTHZzZ7RRdqMKSEvxonOWuQa
         /ttwLaGcWRmmKH/K1dVWt+Iy4ux8IBY8P7AvfTN9opKJaFMC5GeJeJy+1bx8wxJIfCDe
         lwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398071; x=1790002871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btXV6KHGAw3+GaDmIGslj+LlIRfZXkr4tQ4AjomFcuM=;
        b=Ih3msFmi+dfjq0DEO6PIFEgMFzO6THVbDPRLmQ1FxfIfuBBsc2iZ4JZxG1Eq8w919v
         6cTOOP5JkuEb4CoePVD7uTe1h2bKGUYGp3TI+hOYngQfWoxf8tOy3tlOF3lApyybf5Bi
         i7kwSXLrYkEtsXRASxOoMLs7ufVSOJRK0OmHUW9LItvNM4EfcBAA5iJKcF7KPDVV0UH1
         GXYzm3zfj65k1n85DZuJp3rkxj/YclIhkvvpkCEuCqtGKDW5YEeawCDByTifBTjCmFe1
         j/zoDymRc9WWg5f0V6+acW5HUYNioyBMn7nJyCLGkXp+ANQr/QOK3tX4vXNVhcF9uNLg
         /2tA==
X-Forwarded-Encrypted: i=1; AKwUvByVx+PGWYRfmyhdgDt2R6o1OHxaPXtPe9dFNTwRoCRriugBQ3sr2EXS56u+IPPnmjt+ZOn+CK7peNwTsgq5uopX@lists.infradead.org
X-Gm-Message-State: AFuF++mhpzeA7+g10On2ndp0RrzNZUvYXiA37ULkTAnupmAuJCjoPUY/
	Uxp0da2cnDmWCBHmMnstq+1rpt7vbgHud6TrEhhTpNuW94VpIsJWoj2/6pLpVdoi10NZTOHAZgH
	oIkuGDTEMDnD5CstLVe4AREdmywHZTe28p/Ok1lv2J/sJNyZTFNPD9h6ItHhme1nGW75vCO+DtF
	NmzbTFvb3j0w==
X-Gm-Gg: AYBFou3IOsSW5JLpf0fuS6TizHg1duo46EY/y68bsjPCEiiuuckt3hrST4XToJgsTP8
	lMu3bODwVzPPg4StkLC+2RFOrz/Uo8s+WiorkrmswSBRYg1CrGY7Q1ru1nkk5MDMkv++6SjkFWb
	/hmYZdCBSP8plnb22BslzuUOa/P6dxlLM+LsTisRhwm5RquTVmA+YLCfB57ufTUcicunsG87BxQ
	QEXaMCCq5mKqdsS4kgJZevnvTlkO1nE1ZUsjSrwOv67JsxzncYbHGFmyfqBycZlHtbkqW/f9kTx
	bj0fcn/1z3u4Ih69z7oK+Kb2oNCDOU6QGx3pbAoP/7W7fK8g+xpY5eyCc1UZM9k65Ryyphqa03w
	hY73ZAZNdYKe5hQzS2PPbIcqH4VqI7Y7MMbNZ
X-Received: by 2002:a17:903:2281:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2dd6c5c121bmr55028795ad.3.1789398070554;
        Mon, 14 Sep 2026 08:01:10 -0700 (PDT)
X-Received: by 2002:a17:903:2281:b0:2d6:fd55:3a9d with SMTP id d9443c01a7336-2dd6c5c121bmr55027765ad.3.1789398069890;
        Mon, 14 Sep 2026 08:01:09 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd4007bd4dsm42943345ad.4.2026.09.14.08.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:01 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 20:29:13 +0530
Subject: [PATCH v25 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-arm-psci-system_reset2-vendor-reboots-v25-9-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789397948; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=HciPNJeroVrXrUOsjAQZrtcE5R9UzHaUh1eqHckGx+o=;
 b=UfsY7hvxgla20/C84Iw/tfliv3ND94oAV4ltNhIsRBPYTiUf+dZTp14djxCjGxqCD1wyPym5h
 ja9i2LTf4ynAyKkvvXv59iyNjK7EUvPNRdV/B681ucGMj9XpztqZlP2
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX8jMtS9o1LfTk
 ZR2qwKaa7dcAmJyNvJAySWGtgLK2og1qmGyKd3rD1PW0yljSn6hoVAQ+D1AL6rU5HrLt1cnpekR
 IeU3n0bnKQNUDgGiG8pMDuypP0flU8d5sDaUIujapyLOITjkeu85qUMWwEuW1YOZ3LMiocR3vj2
 LBnxWvrh6q7l03y0F4SxAPiSagrrUUvhEODoM7i8TDenGSz3wWJlvKU/kNnJAA+j+qqX1lhogwD
 bM3edRPp5IzpMNr4qzDrrfVdGppJ4MbfrrCD8qHZur8bnyLKfRM0rNHBldli8j5ZF9jdzC/QbE3
 HUfcKJdAlhSMpLRkMB1goxLSsYR2szz1CIk03ldTNvUO8L4CcgiLKlnv+tiSxeKU/7NhAnOGxFy
 7w882mP7sUN47XZx5nHtg6n8v6/r0bFwOTR34EyyfX2uhxKIs5QT9sSw9hC4ojzxpcKQt990i7u
 0ARfPi/VWH7iwIvZc9g==
X-Proofpoint-GUID: A4yUNmxVnUFBA2WSdgJ6FeKxMZDOoLvv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIxNSBTYWx0ZWRfX8TLgszSFGqgW
 OA6vJu+cEkjo1yoZHpLj8+1bvrFkYsFouhCalB4jnOi4ZujKgUo23EyqBgWnFxS++o6eIahCTt1
 qSVIslluOl9fGLKU2WjjN9n5lYnco0k=
X-Proofpoint-ORIG-GUID: A4yUNmxVnUFBA2WSdgJ6FeKxMZDOoLvv
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa80c37 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_080111_960888_7295D6C6 
X-CRM114-Status: GOOD (  17.42  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
qcs8300-ride for use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts   | 7 +++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi      | 2 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..df668dbf2bc6 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -661,6 +661,13 @@ usb2_id: usb2-id-state {
 	};
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
+
 &qup_i2c0_data_clk {
 	drive-strength = <2>;
 	bias-pull-up;
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 395d32d36844..9f1ab59dee2d 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -654,7 +654,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 1ff39530ea3d..aa95584b000d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -678,6 +678,13 @@ &mdss_dsi0_out {
 	remote-endpoint = <&dsi2dp_bridge_in>;
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

-- 
2.34.1


