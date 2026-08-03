Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B033C55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 09:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=; b=2k6ivrFcAUwdUvGT3s1fliu8u3
	nUglk4v/rAyt4zahdC8KgNq0ByzUfntFscTTlZf9vlPnhAyggBU/OjbTa1AvBOR9UCzudZTT62+Xu
	v2Ke3rxD/cUSud40EQOkZym0DNq6KMrwrUFX+srQc2wpBWkJxB7nFoOUMXhIYzdRJx2sIZD0zKE+q
	NGluRLJFle+WruDPhgdPj4rfGflEzFlLjn1kmfcnE2vA9CKsHlNSsztC9+Yfgj639KbpN94846oN6
	KOvkraLdPCwemAd6ILfJ7DogPVqw09IEU8XKG0ecOQvfu44vwXCvbnJ7yQ0ec00DyIb2jYf8aTiqw
	6MZrda5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFq-0000000GkCK-0I6D;
	Mon, 03 Aug 2026 09:46:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpFl-0000000Gk9f-2PaJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 09:46:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736FFZj006542
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Aug 2026 09:46:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=; b=M7izVdufe4+P8sb5
	LAcVwgnRudqXPYT2ajswUCwjO3LYTD+vzy3GVnFxt5ff8wmQDxA8q+foKI2liHWq
	p+F1m5WiMNS6WkzHO+GXj1KKHchgpQjqMJ0qYmfjvL91jpGju7uOEt4kNWP4pyjW
	i+RCKJUHKTMkq8w6QrX1gFj6X/6e/QDOm2DQPFCcCZFJ7LArZLz9QaWRojvsnxrd
	KA+qlGH6nCZQ2dWVbkihKQbcrJhli+WK6oEhf67u6xHrQzTxLhFX6gXb2bgyLzBH
	C4L5pGlbbRUCnoJjmCTj9kuERSyTnPOJzhD8zZrlXrUMQ+PTyiJZvryq/gWXlxkM
	4J2BDw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnj78w0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:46:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e667368f0so5904336a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785750395; x=1786355195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=;
        b=MXOyRVJx0z8NXkL6Ux4QOVkzUn9AnwKXmGDaqI+Zd2FeZXrNnZaCBIfQkY8uihU+5P
         OUDQUwwBd6xFH78c41k5L7Rgje/G7T2fyp1sMlGEggk2j2vhNvJtQxPYxRlos64aRy6T
         xblVhkWhb40v9R2sZN/wE5Sv0YdehkHHXk3zlG4OUqgAm6TRsuXCGU9LHAoQvDGbu8JC
         O45M9c/uqC7wBVyD7w4V25xGv6lMiOV6fVaU0J9laexeCrBE+HjFXaFVJa49D0E/rcft
         0R/avfZcbUgSN/cxSnpMfQ0JqllFoRjwQoiUj8YHtgUgK9r9rmWQ0g7dJnWOpqBQlTDC
         p3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785750395; x=1786355195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezThn65VJDM09Kdd3e/bqDNQx15D8XtlMr6yKq720FY=;
        b=HKbdV1CzT/TOjPJGiYWhAHtraONMdBbrjNYUhOJkEc8s0EXDJgcgCvkcWx0qnTUGai
         9Ny0T20vnYwJfFy62MSWaFNySKJxNgvFEwKHYh3a4N3t+z/a+MVvVLC0GS3KHMn4SE1A
         h2vomZAKqD8q7rktNF7/ZHHaLdPcSejANCLSD+16+8jWJqXPOiTrgzjylvx6VDoHW0cg
         BdLtiub5HqfulDSN6s/hP3tHxcMyG0vp+LRrZVVwQeiceLZuBZk1/+DfpDjWkOF5iEqv
         Zu9GMLDWqnbdU+ZTilvwD7/KkpiDZN1vbeWSInyn0KULWlp9iLI26AYx0nrTd3KB+6/v
         B5AQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqe5cY181jFRHiXgcf8yNnvsSqt5uYsFoVJlTojuA3x0+tZSWKVF8RykOE3kTaIn3kwxzKmLFlxm0Ch7lb6X9np@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7/sEC8inf1pfvss+0TxR4eaEPC959oC5B/WDj13hRb+98QnjG
	XdQINraFZiiEAhkC5qST6keEmj9a9vAV5yrclJaJ6MZ3UH1eVktJ8eNyMHwbDDWD3HOIRVuSPgp
	GYYLqwNjkyuKy31T0y4dPTaZNd8ChPe4AV7U9JRKlYnFArbPLefIEgegjrpwbQr8JheGLp7X9n4
	Y4gw==
X-Gm-Gg: AR+sD10Hli2TluPGXl3CjEno+HE1yVjk6phtHfJqtbk1ktarHJhULiCFSEcnxa0luOh
	Eoi5r4JpPrXXruAw0yYSPTlDTmhLSokskxl0Mg0HjI59c/HYRWGyLGOWjYrKrR9+X/Dg6vTLj0t
	cxKl+F5qkyuIm0F3TlG7uSZRt5wMK8DvHS/ZygEA0Zk7NIixExhkyUdpjztc5vvugluY5kf0LJS
	jarM4FKSQEMMud1vnpcZaL3npGYprzzrHIyDbaQ1oJaI13j8B3Qoes73IM8wIeQb0OtK7fD2iYr
	OnI0e1BN4Mh35Vh9rAKrTpJYNN3yvXCRZFApbXgO4dFH62cLbt4LUDmQoZAQSl3sFoiOl/6EgGn
	uYWoVfwp08H5pQkSWTEVUvPj8pRIgEOXaoY7l
X-Received: by 2002:a17:90b:57cb:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fbc4431dcmr9095187a91.14.1785750395459;
        Mon, 03 Aug 2026 02:46:35 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fbc4431dcmr9095152a91.14.1785750395034;
        Mon, 03 Aug 2026 02:46:35 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2be6c8csm3660671a91.13.2026.08.03.02.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:46:34 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 15:13:42 +0530
Subject: [PATCH v24 11/12] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm-psci-system_reset2-vendor-reboots-v24-11-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785750274; l=2076;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=O4Tzed7m01NrjoUwSpC2HzBAZQmMIMSt/VK8SDx89II=;
 b=jIK9eRQowAumFQnJU8rgPJj3lU1UNl6daKuWFCJ3dV5jgI1ReAHdNEUECvVtm84xI7oCNMRfr
 Z24jbNqM8OnCRYo8+wOhwXz1fw6dU/k2BIKAA/ZnbfCF1H8PV6qp1J9
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: GX-M5T9PRni2KZmLBsPmZeRMNSQzPvk5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX6RiuLt1hjEy4
 exPykfwGl0c/f8wuNnIsBUmqWMQ/Xu79KfVkWqkh5o3++4CM7GoUg37csLwNemhLC2o7DyAgqyx
 Ci9OUP53lQ6oWrIkSTOxzE8IqfwFhNzCNSzfbi27+6SN5kggBhGoqkvk9gY5j/ZnRRYialA4H3y
 HzAOtbywm4j7zlKdbx42CqQLAOwEDTvitMpPEj6roZNDQlCtvdXlS1zul5JYiB6+cIaYmyHheBP
 V/rYzldVv+zScHpm1Gw1XKQ6851UrHDPUf+J7TkyPRWFOFYQ6Ou085apqABqbABMN4SM/F+8cJ0
 YOMcTzXF7YAUwHGl6K+m3Kk47DhDyK1mx1mJ+FcWxedxey1VV6RLznoKv4M4U/km8aFi6nnoQ2I
 5jnhubm9SUy26jsEziL3ho2ovkZf3t49OaVMwbhRNF5C0dfVhgJ9HYw7BgDCgT/2B9DEX3oNCsX
 Nx5VJ5a2Bm3QYWjhD+A==
X-Proofpoint-GUID: GX-M5T9PRni2KZmLBsPmZeRMNSQzPvk5
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a70637c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=t9IVmYW30V31rltyR78A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4NyBTYWx0ZWRfX0npDKfig3BAO
 m/4ueV4G7KAruFngu9nKjLGdBqxje1choSOk7LOXYttahNKmU0wuvf7XEo/u4So9TfzYV0pZ1h1
 SOTfg9DNb+U+m0hYEGnN4LCc1G5Kdw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_024637_741529_006D8898 
X-CRM114-Status: GOOD (  16.75  )
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
index 2c0af0326147..81cdc4ccf8c9 100644
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


