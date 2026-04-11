Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A402F3ED56
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPh0SQsOnsDniPo3dQ9nl1UbMYpXngLC6j6GE4dl7dE=; b=XZCktu2rcMVfQHzHEVHTrPVjzo
	OzCgIwqjRKsJbA2D3kj+uoEAAUdMXkilGQjLJ7yF3YJ/9+9DDyIsBKCnnVbrf7bT0hWO1JZUVw3Ua
	EDcQ3mXXcS0/puhHSUdRI7yA4ZJ1wUkuOixTxR4wllDifujlLWVcWdxn+E07xgch4197tdqynVNPP
	JbmulDcYngdKpn7OmZu7RZW/pv9xXlIpOolJedc8BxXgr5ANIVriCW2bzZZTsHGn6VvFWAJn9JozA
	XJlX39QBN4Jn+4Mxg+oKcN6TUp5dFoavAcvVP5yJm+d0uAFT49lMoS8TYBNjr5fB24zqLPLZJK2VK
	AIh6ot2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmv-0000000DY1G-3iyj;
	Sat, 11 Apr 2026 14:58:21 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmo-0000000DXnx-2qr7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-483487335c2so31511355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Apr 2026 07:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919493; x=1776524293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPh0SQsOnsDniPo3dQ9nl1UbMYpXngLC6j6GE4dl7dE=;
        b=FEa6MxNZlvM7gw26ho55rF0msZ5cK80mKPnwGMJdk0OduJ1yMCZuURphwBSr0pVH+x
         cgH69k9pvbGpR0bt7oZvLBe+DqM7Ff9E6B3q1FlugF/wmYn1k5TPLH1FrTlj+HihQP+8
         MmGYcktxgl71I6H1YJANIT+62LCHay3e3NysUiXawxOcnFn8u3e9csOE3EqYnRYirJyl
         XpZSSefGVbFjodsVGIn/yq34U+CwP1ILtE22GSaj7pEOFClPu+SBvqM4+LPa4DIyTNra
         W05oMuPABnWRwd5quf3ZlnNg+71DnBQXnPqIBsSL4A5j+/uh7gVaGrYHLlz5ubI26Z8X
         wxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919493; x=1776524293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QPh0SQsOnsDniPo3dQ9nl1UbMYpXngLC6j6GE4dl7dE=;
        b=ori1njGwrRHJVW7LkCKpSV8mL7i7aW4ABDD/mIOu6VTwn/ipcuk6dVT9zYdvEfXONx
         PIHI4PPkoybVPIzKrxNqUG+9vd19BGVbYK1IbqpKho4nJHk9c9sVP+lf+1mbk92RZOPk
         UkXsko0ErBTHphD44HBgZcoka8goXeu7iqoEEQrOD7aPTLBGjYWTk7xQVg1pPdSGku/Z
         2F1GqFIvzVV8P6/gBR44WiSzbKrsbPX19d8ePu30rutboS0pbm0pgVW9U46NGi9ht4eS
         DEqipTiu1xwGovdcVKNyXzYlpbo396Bbap8wJWDwq/ORTvfJ9DqVe0NWpCucr5LIXua/
         lHsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVps2fNVl4Z+Cf3N/euaqr6/nYmNGcsiUKMH5GuD4plFAhLlS6atEuq4xPeAHhcRtEhce1Nx9/1S7FhLOOObMX3@lists.infradead.org
X-Gm-Message-State: AOJu0YzA2mzi+pBatkpt3bdZeBGopKXsXa/2GzpGxJtw8yXmH/mL+hA9
	sXusePfMxTFigfEVlR1JTSM+p3pjOZrJsMufIzppeaRTk/ExzTjaMyD+eFlHOix+crA=
X-Gm-Gg: AeBDievOAaa3uDjf0T4FxIwKmhdlbgwkQ8d2ARzgW+ZCHQIuaF472AgRMSfJ+uL1L/M
	M2NLe6hsAmQ1WvmNDiPNQuaIzJZr/Z5+creG7lLjlN0/eA+EKA76x75mO1nr7eLf1GZbHKglyZ3
	vanDEeYSwguqqhpH7nUZP3s933AvqtnfjXl0S3qe+KTBpKPaJP683MoxYkEXRVYRoRY6RcdH25r
	lohUWb5Nv8MR8MbQA9EqpJoqCCFvIWckyouG4UQxR6pSfV2PhdPRYncJoNYaiDCnKa2UT8cbOaG
	316GTmxXuliYjuCCjiSOZfMMF1qI2+iZuK0hSP5CEWuairKCtiyYFndG3CsXVbBqos8yULuEU9/
	VvVVsV8jthO05RFUajKEOwV/IHcMEKKWq6Mts8cnqwnlH2bQ8FGSl/ZYyObwg6V0wR6GqsPi0pO
	sUYeIQMj4+iQqEoWYG4pnx
X-Received: by 2002:a05:600c:45cf:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-488d67b8dddmr90911785e9.6.1775919492745;
        Sat, 11 Apr 2026 07:58:12 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:12 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:36 +0200
Subject: [PATCH RFC v2 11/11] arm64: dts: amlogic: odroid-c2: add support
 for I2S audio input
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-audin-rfc-v2-11-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2057; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=G0Gm8t6IneiVYTkTeSCPBc6CjJqlMmdql/bqJBW4d+4=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EkvqxVwT5VamJ1TGemSZrpGo//vDKYVhXsDtaT9/n
 d2a1vCyo5SFQYyDQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABOZtYXhv3uboq/N4frukMUf
 t4nU8UmbXFJtuSO040y/Yqmh6CY3I4Z/mocXTZBzknidk319x109g85X2gJL3tnpVhtHXvs7SYC
 dDQA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075814_756950_D63931B9 
X-CRM114-Status: GOOD (  10.96  )
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

- Enable AUDIN I2S decoder and all FIFO components;
- Add AUDIN I2S Decoder as AUX device to the GX sound card;
- Add AUDIN Capture frontend DAIs in the GX sound card;
- Add I2S input data routing to the GX sound card.

Note: in the routing part, usage of "AIU I2S Encoder Capture" as source
for "AUDIN I2S Decoder IN" is fine (despite the Encoder/Decoder mismatch).
This belong to the fact that the interface is implemented by "AIU I2S
Encoder", which was already existing (and named) before the AUDIN addition.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 5943bc810678edc81fe1a8e3eeae69786e27010c..54798e5b631fdc594cabc5876ab73a3a85944ab0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -188,6 +188,12 @@ sound {
 				       <270950400>,
 				       <393216000>;
 
+		audio-aux-devs = <&audin_decoder_i2s>;
+		audio-routing = "AUDIN I2S Decoder IN", "AIU I2S Encoder Capture",
+				"AUDIN FIFO0 I2S IN", "AUDIN I2S Decoder OUT",
+				"AUDIN FIFO1 I2S IN", "AUDIN I2S Decoder OUT",
+				"AUDIN FIFO2 I2S IN", "AUDIN I2S Decoder OUT";
+
 		dai-link-0 {
 			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
 		};
@@ -209,6 +215,18 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&audin_fifo0>;
+		};
+
+		dai-link-4 {
+			sound-dai = <&audin_fifo1>;
+		};
+
+		dai-link-5 {
+			sound-dai = <&audin_fifo2>;
+		};
 	};
 };
 
@@ -216,6 +234,22 @@ &aiu {
 	status = "okay";
 };
 
+&audin_decoder_i2s {
+	status = "okay";
+};
+
+&audin_fifo0 {
+	status = "okay";
+};
+
+&audin_fifo1 {
+	status = "okay";
+};
+
+&audin_fifo2 {
+	status = "okay";
+};
+
 &cec_AO {
 	status = "okay";
 	pinctrl-0 = <&ao_cec_pins>;

-- 
2.39.5


