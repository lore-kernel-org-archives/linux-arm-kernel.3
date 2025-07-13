Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC24C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H+6gXYwyTRWuBa8Md4EiJFqvKmQqpIFr/3pDxL4GvdQ=; b=0Vg/oNhGlrt23ZYKsqxWcI0AB3
	Bj/UJWpmrHtg51Moa7RS4blJmVihzlLhkaw24z0LU/U1TXwA8eRiB1J4fq6SzQAoy9Cn7+Hn3ucaQ
	qYj8JmSN0uMa7qpMdkGOiYsJK/RsVwNJhOhQXNmelw2kdDE4XieJgxA0KmsMRj4Kx2Il6BUyJlHa+
	G0yUy6kcFja0M78qBklgDQmct+bNJi1Wg25as9XHrxFGlKTZoO9bue1cwGQN8XdSgFoUky9fNyeV/
	6GxWQvTNoytxGoUuz61u68/6IbDsiyZBMe170v+8kbTgDQfnpFBlAo7E5XVwzIVzPVlmmgUGIN9nf
	e2oMkK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasFt-0000000HXXC-3wWn;
	Sun, 13 Jul 2025 08:40:17 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uarkm-0000000HUZv-4Axj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 08:08:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2390976f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 01:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752394087; x=1752998887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H+6gXYwyTRWuBa8Md4EiJFqvKmQqpIFr/3pDxL4GvdQ=;
        b=aSY7iB1X6U7d/YM+p8bQGZQ8EYmM3J+XzUxFXM+/JLzSa8JNE1texqGuKeLvmHmRMA
         fQQom1Qw2xEApvdPTUa3Ts4XReDtS+4CA7ydBCKm9xQ9F4DTLN7wBmLv3M1Q7J0EKF3f
         tuEafweBD6O3F8USeOwYHYhKVedlZ0MKFlIPoi6eLqBPm+AqEjzjON2zr4+zGFAL/D2e
         ala6Wc+bvlyPZjvNq3+7wA/d985G8uyc8665FNBrhjvKHZsXxNExJipyy+rW8vVeLm57
         8CMUnJK3w8eJB24H9V8z64BlLTpoLssjuHZA0C0nLOIONt2GCKvzgQkaoJobCijOSoTR
         Gmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394087; x=1752998887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+6gXYwyTRWuBa8Md4EiJFqvKmQqpIFr/3pDxL4GvdQ=;
        b=Hi8svW/Z54JD+GFuDIB6DuJWIq0wREuDErhAO9zgXBJxrwuFexVumb9EsGwIUFptfE
         /748NmfX9stR4+9oWGkvw3cyN2qCxe5tljGXhRuRavGLcfKYRG220Qc2IUL+FLoGj+6o
         5VW8kU6sMvTzL4MYNh1o/wuOs319sWfffO5yaKUJfYQBxw8pb0JsEtBn7ShyqQKUCb+u
         NA26QYGUF7s5W1FwgQ6SbqX+cw8SHQsr3PKGAyNv9MAROatbQGkqVPBIkl7rkGQpq0Tj
         ENRwSYAScQlDOP9aRQ6C+LgpvP9GIB62IxIbXdW9cVxk7mxvY7JRUU607bAZZOfmhbsu
         F4vA==
X-Forwarded-Encrypted: i=1; AJvYcCWPSFF6gS50gVT7GXGTk8RtpfnIWRLlR5MoiEH8SJhOlBcjX1qnhNNA2BlF6qtcCixpd3n6vx6atezWR/VTlYAy@lists.infradead.org
X-Gm-Message-State: AOJu0YxnF3GVTwWZMcs7QV0CV0m56n8lra/wkNQAZjAFBoEIulyBcLtB
	pVbiTxLbjkiP6pE3yz3VaBEEaRQwzGeNOgoPywwpGl7RYiZmpW/PNO/M6xvAKCXyXjI=
X-Gm-Gg: ASbGnctFMBEvpTs8h848HyZX0vwnAtXko+IzWOqTmzE7zrzlv8DgY406dAaVUPbSmyc
	v7Mn6bOWpi7dRf8E58j9YOwe1J8BqPvv+5Dt94lwhG5sxZtD0LVwmbT7lzz02X+Z6Kcj4guWWKk
	3DtMLfwj/rcOrwncp0SdGMp4VJY5UG1tzwCutffG8HHRR6/LaW6gDUGMhVArCOHft2V+MUeT4nE
	t1YUidWS3xr/LfQ0KDBUyomDfH8Hjo/XTafduxiuxOH77UbfHEP8OEQWYvntJom9kAEjOIN6FQ0
	DOiYy23OZz+Bq9t0T8kqVVJ46ERJhLVNswAukFHaejRNCc/dLcQdyCrvooyGhoW6FIQidgH4t06
	hVEVTOZW/JmtHgfjfREols05dDk4q6WBjbmjt
X-Google-Smtp-Source: AGHT+IHlbVBRzVBx+TB+ru8FP2l2jobEeZXcX09t3vF/BFXG1VnybV1VXvA6fI2r0VYJILh3gQH2vA==
X-Received: by 2002:a05:6000:4012:b0:3a4:c8c1:aed8 with SMTP id ffacd0b85a97d-3b5f2e229a9mr6323377f8f.39.1752394087188;
        Sun, 13 Jul 2025 01:08:07 -0700 (PDT)
Received: from [192.168.224.50] ([213.208.155.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm9386608f8f.34.2025.07.13.01.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:08:06 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Sun, 13 Jul 2025 10:05:35 +0200
Subject: [PATCH v2 13/15] arm64: dts: qcom: pm8550vs: Disable different
 PMIC SIDs by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-sm7635-fp6-initial-v2-13-e8f9a789505b@fairphone.com>
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
In-Reply-To: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752393945; l=8108;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TDGLdncjHrRfwJLeRJx0srg3hwRbkzZPPtbM9rMrBJ0=;
 b=7/Ta1AVjfApt3ZZgioiKcM9HcANPYIqXuA2LD86TP3WHJJEb5D6A6bd7fmkfxJZCxeY/WKqID
 y4uY7T/4HGWCJqYS2e5Ga+XlN8dfeKNnzax7x/f1PVibKRdXAhFmgrx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_010809_041779_38C2C021 
X-CRM114-Status: GOOD (  14.44  )
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

Keep the different PMIC definitions in pm8550vs.dtsi disabled by
default, and only enable them in boards explicitly.

This allows to support boards better which only have pm8550vs_c, like
the Milos/SM7635-based Fairphone (Gen. 6).

Note: I assume that at least some of these devices with PM8550VS also
don't have _c, _d, _e and _g, but this patch is keeping the resulting
devicetree the same as before this change, disabling them on boards that
don't actually have those is out of scope for this patch.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi                   |  8 ++++++++
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi             | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts                  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts          | 16 ++++++++++++++++
 .../boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts     | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts                  | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                  | 16 ++++++++++++++++
 10 files changed, 152 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
index 6426b431616bde2d960780be2bed4c623af246c2..7b5898c263ad8a687e8c914fbb0072c58799b6b2 100644
--- a/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550vs.dtsi
@@ -98,6 +98,8 @@ pm8550vs_c: pmic@2 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		pm8550vs_c_temp_alarm: temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
@@ -122,6 +124,8 @@ pm8550vs_d: pmic@3 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		pm8550vs_d_temp_alarm: temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
@@ -146,6 +150,8 @@ pm8550vs_e: pmic@4 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		pm8550vs_e_temp_alarm: temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
@@ -170,6 +176,8 @@ pm8550vs_g: pmic@6 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		pm8550vs_g_temp_alarm: temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0xa00>;
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
index e6ac529e6b7216ac4b9e10900c5ddc9a06c9011c..e6ebb643203b62ba0050d11930576023207a2e35 100644
--- a/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi
@@ -366,6 +366,22 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &sleep_clk {
 	clock-frequency = <32764>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 9dfb248f9ab52b354453cf42c09d93bbee99214f..ae90b59172d845be9778901f979d579750511dcc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -1111,6 +1111,22 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index fdcecd41297d6ebc81c5088472e4731ca0782fcb..7e0ff2f1c7cd56754e6df6f36634070b19ecf953 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -793,6 +793,22 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 49438a7e77ceaab9506158855b6262206bca94ec..594178ec9d3372ec657e08713a0ab2b620fc2b48 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -961,6 +961,22 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
index 7d29a57a2b540708fa88fb59e821406f400a3174..af963f506269c954e3ab629d8092341a9e44f86a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts
@@ -533,6 +533,22 @@ volume_up_n: volume-up-n-state {
 	};
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
index d90dc7b37c4a74cbfb03c929646fda3381413084..0e6ed6fce614706590ab37eb96c1077622d0d532 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
@@ -661,6 +661,22 @@ focus_n: focus-n-state {
 	};
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &pm8550vs_g_gpios {
 	cam_pwr_a_cs: cam-pwr-a-cs-state {
 		pins = "gpio4";
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index d0912735b54e5090f9f213c2c9341e03effbbbff..19284298d64dfb39bab5355fd98f64b03931c998 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1046,6 +1046,22 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &pmk8550_rtc {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index 76ef43c10f77d8329ccf0a05c9d590a46372315f..ebc9b4b7bd881f8d9098d1a8b3ac281e9c94313b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -688,6 +688,22 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 71033fba21b56bc63620dca3e453c14191739675..97e29b8039d508e343c3136e61b237c7e9111aec 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1002,6 +1002,22 @@ &pm8550b_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
+};
+
+&pm8550vs_e {
+	status = "okay";
+};
+
+&pm8550vs_g {
+	status = "okay";
+};
+
 &pmk8550_rtc {
 	status = "okay";
 };

-- 
2.50.1


