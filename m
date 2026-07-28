Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBD8C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 19:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ferXd6iakb7it62QEva/YVmEUp8gvzZnEnMvOHm4P60=; b=ajse+Lp+u6uP4PCF9mod6lOhaW
	n/khxvqtZ36AmtHWAFmd8OFIZtjLTaujfzwWFIWyYiOtyNDZ5iDP/UMOskHIJsTEmHiL02I062x0r
	QEZ8CfIxt5PkZSFgQgGgSTRVgVXTm1AbR5y21DNLQimy30WzsxXMm4LAJZdy54XoOsYPOs8txQmnQ
	zfdRYl76noW2+XR6gKl/eop56jcPYoS9WmYtNf9dcbH5srNHbfz9fp2F7pIO5s9biZexhMjHL1Fgp
	Aptdy/917agK0E7hIjd0zy5QEGN3bncW30BVX2h9yN2BmZw6NsSkOJthiEarctodgT2TY3/VKlOBp
	XCGYLjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonjj-00000006BME-1B1R;
	Tue, 28 Jul 2026 19:45:11 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wonjZ-00000006BJ2-3xuP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 19:45:03 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-456f7012050so1134428fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 12:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785267900; x=1785872700; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ferXd6iakb7it62QEva/YVmEUp8gvzZnEnMvOHm4P60=;
        b=TaU6n5PKMwCI8t8ZUU7mSAIr/8vFzP76Zjmpje6Na5luq6rL2gbdOG4RSYik1mr9LG
         hEOw/cF8A1GIqUcCGf4zLpzE0WRNt2bkl0aWPBQbPetfxxpnIUsoOiOoYGudLEgvnpJK
         g3Ld4oCmPC9vKufTWNJwj8NepqJ5eI8eKXI9iaKcFxfwKt9CxWH3w51n5YR6hNaEg8ot
         ibS5L0ic64WyJlCs0XCqhoBtjaC3ada4JcGZKB1zW7B2WnJEfQsviG8R6dXZzG/WPzwi
         BOwMnZDFacdn/Gx5zu9F7jqCv+pXn+YZamu0wZvr3TarD5cMmCBSDL0umEeh6REYIDsY
         vGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785267900; x=1785872700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ferXd6iakb7it62QEva/YVmEUp8gvzZnEnMvOHm4P60=;
        b=S32mu/kjVnukHCtVUH2i6ra8xdlK5M4hRBW4XiWryG6PihU+uMKhLEU6fFoz0bmI3V
         X5u1jCNiNx/8xrb/P+aR9yipNNEn9AvOz3S3UYh4FLc3ULc27iigbJRytnRHJF8e0h8N
         o171Sr1sXQ2kozQSbadbUxEzmWJrsnhWoFCQSFSC2uL5oECFR7Oy/C2khWGLbe67NT3c
         DX+aW/xdoLn6Wq0tUkwSxtjEe4nv6lw0ENBbYmN709utT/iDSHuR1BuoO3qdKFG0PKFE
         SbXq7pyCuDoh0RV07KSjT5Gm7rnQK2nr9gSHqKHF4oAAwN8+guxECb1/CSseyFUdWjE9
         nVpg==
X-Forwarded-Encrypted: i=1; AHgh+RoFaHoD5gRW2m5XUkgVH4vuXyJyAFNXz7gKJnUN5TmjR9MyBiGLC4VA47s59y6a7vHQ61YNQ9BCcfczGwXDHeRl@lists.infradead.org
X-Gm-Message-State: AOJu0YxOwMj+Ej3Tm8Bpdgp5cpuoT04I5fQHeZ44eR+DzNZDK48a35NX
	LUh27+uowiGcNoJ/WOrnQJZbdxg7N0b1SMZKW+fVUw34SATYG1YkGefqxeQdN5fmKvU=
X-Gm-Gg: AR+sD10j5MDNnMYl8so4CT932mGgJQUPi+4EsH/uguGKxEN+Gf2jWa93EmN/LhnfEqS
	cdoB1Yz5ERYQ3YORDMwcjoxcYDohkOCty0qq1JINm+QAeK6TgHFKS38HfQLadagPijPPZykqd+A
	4LxV8QH5b7Q7HSF1vFmoF8YoUwajj1pDSNym4yRbaOzwywERPH1fw1R0XWKO2FR/2PlS/CcFnXT
	U29XSRSLAcJZwxDZqae+Kf0dboUcGuTsskNsbcHMSS4GjKa7sDeNpQgT4c25zfEVq4Y2a37oc2f
	P1jWkCTJKJdT2dAPPvQ25Y7lUo3gS70Emdz87mGDfOHMy3VGswvtQIKx1Y05eQDZn6H3MIkbUkY
	s7sxa0XXwMmxmmjt0pqIQK/0EEiLiaWyyOvDXLD3C3eanbMzcu6KEsAyyFixixQidFOse7xHPjT
	hId44U6JY=
X-Received: by 2002:a05:6820:823:b0:6a3:7681:1f0d with SMTP id 006d021491bc7-6ac96c650c1mr1638351eaf.21.1785267900394;
        Tue, 28 Jul 2026 12:45:00 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:3026:75d1:db9d:8984])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca5254057sm290017eaf.4.2026.07.28.12.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 12:44:59 -0700 (PDT)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Date: Tue, 28 Jul 2026 14:44:37 -0500
Subject: [PATCH 2/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio line
 names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-arm-dts-beagleyai-gpio-info-v1-2-783ec90d54da@baylibre.com>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "David Lechner (TI)" <dlechner@baylibre.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=6NDzAas2NzocRdXIQyRlLp6OMaRnjX1tk1dYyF+MMxg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqaQazZEy4mSpZcVwhOr1pVGmB/zn+SLZHNZae7
 M1fzVXTKkSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCamkGswAKCRDCzCAB/wGP
 wCvPB/9X776AlVD05RxR4JtcA4ai2byh711XTSm/ohs8uh2tnsKhkQtwYJ6hirT4lWm2kJy/L2a
 2PhqrZoyQ2Zs8tpatiSq2JfkjAW0xo1i+ARMa73tSX/2+os+doEhN2dmvPcnsqxPF2MtK1EU55f
 h4R3oXzOVkzpo1J23Y8t4ClfBNWCUH0fMQA3wRryU8E5vOygoQB2eVwF7CqXUlTyM9vtC5Q92BQ
 fZYn6V3WKp+5E/dDNSE8BTOiz0b4LEhu+TJZor4v+dvUHf9it3HDidudzBvfd35Gskc0LkvfeEn
 6kBWVd5bkY+ITzL9rzyzBFoL0HfoaRektW3Bw3//b3H3Ny1F
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_124502_026185_A9257B97 
X-CRM114-Status: GOOD (  10.17  )
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

Add gpio-line-names properties to the BeagleY-AI .dts so that gpios
can be requested by the documented name on the 40-pin header (and a
few other board functions).

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 599d576f694f..173c091116d5 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -267,9 +267,32 @@ &cpsw_port1 {
 	status = "okay";
 };
 
+&main_gpio0 {
+	gpio-line-names = "", "", "", "", "", /* 0-4 */
+			  "", "", "", "", "", /* 5-9 */
+			  "", "", "", "", "", /* 10-14 */
+			  "", "", "", "", "", /* 15-19 */
+			  "", "", "", "", "", /* 20-24 */
+			  "", "", "", "", "", /* 25-29 */
+			  "", "", "USB_RST", "GPIO27", "", /* 30-34 */
+			  "", "GPIO26", "", "GPIO4", "", /* 35-39 */
+			  "", "GPIO22", "GPIO25", "", ""; /* 40-44 */
+};
+
 &main_gpio1 {
 	bootph-all;
 	status = "okay";
+	gpio-line-names = "", "", "", "", "", /* 0-4 */
+			  "", "", "GPIO16", "GPIO17", "GPIO21", /* 5-9 */
+			  "GPIO20", "GPIO18", "GPIO19", "GPIO15", "GPIO14", /* 10-14 */
+			  "GPIO5", "GPIO12", "GPIO6", "GPIO13", ""; /* 15-19 */
+};
+
+&mcu_gpio0 {
+	gpio-line-names = "GPIO8", "", "GPIO11", "GPIO10", "GPIO9", /* 0-4 */
+			  "", "", "GPIO23", "", "GPIO7", /* 5-9 */
+			  "GPIO24", "", "", "HDMI_RSTn", "HDMI_INTn", /* 10-14 */
+			  "", "", "GPIO3", "GPIO2", ""; /* 15-19 */
 };
 
 &main_uart0 {

-- 
2.43.0


