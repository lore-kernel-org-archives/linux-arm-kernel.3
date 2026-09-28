Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95435C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=; b=X+tm59uKicpKyZgFaGqEuzFLA0
	2Lk0tf2ZD4KM3EJgZ76JUtUTy7LWGV/ueJ52yN9l9Utaa+dbov+3pbd2OI6dmanbJxmT6zmqx8omx
	4qnop68RM2BsuU//7e7g7DSZUNH1pdd9eS9LL/DlV5SyeBxe/WP23JKSrZzni8tcdAt+sUgTd72yB
	toaCJiHIcWodgnJMOZA5UYSeRKyFmZ77usI9aTipsOlUa0y9bgH2tq2bO1iygqosKLPTt1ASHzvgx
	qJwPE6TAy+fyl48fvK1TS+oAL6xPbF6EaJA3LmJam762yBc/0UtERrA/BRWgaOhIym0d5PtP47E5l
	dey3jpmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Ze-0000000HQKU-0Qhr;
	Mon, 28 Sep 2026 06:10:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4Zb-0000000HQJG-3vyd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:10:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1B1cV3455729
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=; b=MFLmhLoqKeJw0Beb
	PMvzA51gfP43f8C1p9ecE+2l0+8xhIJ/26n913sU6Kbag/i5pwcexcfdXJ+2wEbJ
	JG0DW6LTHCq4rZ1h79IeeUPUi72tmb4YVe9qHlz4M45/LeBti6gLxxapUejtg84t
	3aBSlEPcLZexrvoVdWLogqIaaqnVtk5+D/krEtcbWezZard5DJi0QZl07aU379dF
	gQKfZKIgLt8cjGQM5YLSY1M7seuBXvCtBsjw24pwumGu07uQ3GxYaCBFxgLZjzag
	G548Iy6wXeeCjK4yCkXoB4zuzqdUmeRH7fPx+thFzPkokRilAWWcMQSTdbDcSMrm
	w7EP0Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq0rd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:10:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so3236001a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 23:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790575847; x=1791180647; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=;
        b=gY1uX1MRSvCCqUBv/Xut7t3k/nbFAdrejGYDpL06wEF2G9G+WY3fnE4bHWjlGaK6T8
         46+XUhVT80yWLWqgvUENpN4yrmHaaFBypmpj75pziclCjVwSPtvF5aNV8VzM0MGHTIMH
         6X6pTu16laWs7GwIYrVlHDhnEl8Q6J9dLknhldJjJKbx08gToGa2dDLAnmVn8QRpPNig
         P9FXArX1k9GkxZ759O/sQZ/4z06FOgqALaC4/LBNKEt7WIJ1Ni41S29hWASAfSUTM8U9
         14HDvT2PYsFaP7gmWS+qAFeGDH95D1fjp2ySH5LmGP4qLhA3FS+R2uBwlXK5HOqGTNVk
         7rDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790575847; x=1791180647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+QMOReJW++tScmV4/v9BZkk5QhhaL5ZwAY/yKj9k+4=;
        b=fFZ1vJ/mKFr/WN9s/gGpoTGlYDnD0Lk6FXNltqJMn6kx0skKI6Nd/7+eAxMcI5zXh0
         nupCFqFq31OCLuYDmJz8x90rugoA6TAQQmNAsOw8TzMcqvq0tABbdliHPyV2JgyiL9GG
         Waljp51B57s8xIzaLtBSUPHMfd9P/hyNy3nSeXVJQZfR4Kyc6UhhWVIRyubXZqya7wk1
         k2ykWChtC9rBduBzBOGdHKhSlD07yXppgqQHeDvgnfhKn2+RtHBiD7cST/wMevT/0EWl
         4kk7OsANWsQ/hcgJEVZow8wCR3tzpidCmlBelzAm/pNSiaFHjSPh9hoDjYmMcg+I8wwc
         VW0A==
X-Forwarded-Encrypted: i=1; AKwUvBwtUr/nCn5g5S4lwCUKA4t2jDE1TghnZcZXU/b2dU3OFxAI2mSlAS6frKj0cn+hFmCj5sifssWt5IXzYusG+mnw@lists.infradead.org
X-Gm-Message-State: AFq9FYJHDjUo1xgKLd7IzD+oSqdZ4lbLWJ8uiuoATjlnyIWWQbFc4bgU
	8LbF0NXMlirs56vl0CJUYxR5m813EtPQIVuaaVB+eitOVu4Ag4lhe+ackEAnfPYY2LPhm4MKHk+
	B/TDDEC/INLdPcxNrLi/ger03+dkvTMatj33jdzzn2mnUVEJsP8npiVzqW1SmimXtYJLeVXCg+H
	nnZg==
X-Gm-Gg: AYBFou24ySX1jKy4qHFkmskM17a3+kzncaa8b+9FNnSHcClTlrboK0iPJT8Py5TkEcK
	ACgeXmZCdvYurEVIuPmXBVcslmkaWn1rn5UMjZdTcEQvjWnfSgXJkH/4nhJlfPFZrnLjWyE7Ixi
	bPC+/ISscaE16gO1oyHFx038mUiBsYl2yF/a5JrwtloJUs6Yd+9sGvYcNVdUT7F2GApimmzOx1D
	srsTqQAiIvfsGT0O21ddAQpUrbPd6EOkET+7z5LpKwSN6hwY6hilAg0ZlSCvZpJ8QMbU7OpjCa2
	eD4uHa6NnIhMddYJcQU1M4xkNOQWOX9kShr4WH4o/6DEsVmfl/eHn4pz2742sk1VscFunVKxs9L
	C/lIKjo610BDu7fyWDQhI/u3KtQtvFzGlfagB
X-Received: by 2002:a17:90b:2790:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3a0d265389fmr4181618a91.8.1790575846601;
        Sun, 27 Sep 2026 23:10:46 -0700 (PDT)
X-Received: by 2002:a17:90b:2790:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3a0d265389fmr4181598a91.8.1790575846112;
        Sun, 27 Sep 2026 23:10:46 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm20040846a91.1.2026.09.27.23.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:10:45 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:39:19 +0530
Subject: [PATCH v26 07/10] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-arm-psci-system_reset2-vendor-reboots-v26-7-b24e2348e8e1@oss.qualcomm.com>
References: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
In-Reply-To: <20260928-arm-psci-system_reset2-vendor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790575761; l=2145;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Pc+ikFCDBvxBSt1eTUgtUUWzverxRmRTMcb4LNEPMcg=;
 b=0pnzFtnpSSGd6K/ogS70pPcICal9QhK0HOM606A0GQXA2GVuZ73fXvD4bQl3mspOIjHAaNbO2
 T+hmTqYkGURA0r246+yqn1A8hmx6589xHrz8CqG0yxko+qSqJ5eRXgn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: qhzMoicWTgqyi90BIbxqKLKqd3rTaSWE
X-Proofpoint-GUID: qhzMoicWTgqyi90BIbxqKLKqd3rTaSWE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX2SpFOqOX09Wg
 ZcXHU24sgsFScbQSwr/DD3AVLd045gf1VToNQw6g7uAhjjFVpr/+OZS1JjBFkAH9Glfq0aVaEmF
 D6iAEuEpwNImIlMMC/5pk/NntUaRfxo=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba04e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNCBTYWx0ZWRfX+AadCZFnfzWd
 qKNhudf/Vd0R45qh5SKzqE88eLPjjsZjHKCCNQkdLfwTI/x7CwV08yqV+rf8F7jrfcqqLcRst0/
 0lz9Z6dwsOzDn2iyAg0mjr+kA/1PpWb4DBxefmrHTTmqQcbbpXuqoKmzR3iwO26ZSkNnGv2kydA
 Lm56H52gshs2Ku7SfawINjn+8Nl1m/T4/QGTcxY8X/WS1wndpZyIsCIn3fVHPI0yUxVd28CpHKy
 fZ06iS02fopbG6jtigVe+Bo9TJSo5IZ23nYiWrDYFxeqqZiv6hnMm1Q70BPF3Co15d5DGVCFk2c
 jBlLb9X7UFXGvkB8Ast+1z1mQ+IWJBMfSWkok1QuKHxBpnPL7Yi+Dxdffiyc22TRqPZCu9ESz57
 +ku2iLe5frSm3bFI1lNZWr67QVjwgT2rba7PPqezdrLMNg4S25rD0ga6eYfYmBCkEq4NOg7T/3A
 I3e+rjbt5RfXDSkjWWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_231047_995660_03154D43 
X-CRM114-Status: GOOD (  18.87  )
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
for use by the psci-reboot-mode driver.
The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent and not available across
all kodiak based boards.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi         | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 7 +++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 347815e5983e..307fc45af37a 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -867,7 +867,7 @@ pmu-a78 {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index 58cce89a0c1c..c9c1b0c48550 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -786,6 +786,13 @@ &qup_uart7_tx {
 	bias-disable;
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
index 477d671bcce4..a2ccacdc9ca1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1102,6 +1102,13 @@ &pon_resin {
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


