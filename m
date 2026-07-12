Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 307E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 09:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=; b=eqcRmv+q7U6yRI/7xxf5Jea7J1
	bqeTNNdA1MzRIv6G2h/dtL3jOCWs+R7ExSF8kfGM1UgW7Yf01RTioHGpBCk87HaM+wJe8mEDUVDsp
	9jz2jCzg8oIaDEFpJcaeFXbs1OpuKedbNpEyNjcEjKXsvFDrGeiWUa3fw3bwLLV2akt4elazgZynf
	WSpEl1WPwOBbi7wD5lzilLrMabTM2rGXeMTzpnyEo63EqKFzuhkNbhlKKXnTuxrxUEum3cZRmawBb
	w6HQ3cNdE23ASpnJEjdq/gsFkSJdtaHi+5hBJcelxsyDJlUPcb4nP5KxnrjEKwJbNPDqUoiv/GOh8
	/D7FgNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqkC-00000007Jkf-3DUO;
	Sun, 12 Jul 2026 09:45:04 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiqk7-00000007Jeu-2hzB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 09:45:03 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3811074a8c5so1704414a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849499; x=1784454299; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=PxGyFcEfGpRfiVarMd9YSoqLMsvUeDASp/j+aqRZT6GVZ2xXgB/t6rliC887qgZkje
         rGYyH3501ZWwD/7ECzjjwjJ3HNDKs74R5E326tPhWILco2kdSbGpDfATFQfNnznj80UI
         KihnWwFApFgCVoKQeBSIRkzep7B+h8IsyGa0dE8cstT3tC4lL4YhCekGBbyRZCRnlUxS
         W2UpTmCuf0Zmyx9dujZlPeQcsyg1pWg5IlZ9gD75bJ/5htQK1tw84oEExFTpm82U2wby
         saU8/Q9SsXre4K9HmndGfLR2CqJEdAf+o3xz2znDH/MXB6MBfHuTschkyWKHsgYumkCM
         08Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849499; x=1784454299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=JWjNmJoVqmvRQrjufh7dkD7xwoZ1Y3dtbnyeL5Fmw8RI998mpkqegqcsHjYMSto0Ok
         kJC7Cf3o8wCNNVvpEOBQ4bLB1duuVDHWiBJwHs9F5Z1z2g/hwPwO5OnlM3QQXuv4zYNO
         btigvvIkpwz56Rpw6b4DMM2rC7wZyCPFVa9ebNtAfrIQM9Mj6xM8FHXYrZT2CSQYLRtG
         MBtEf2BV2NMu/qy0f55ZZTsXNQXmOvxOwoDbotzLuvocxN5v9CJ6D0RNfxKdz1rqC7TA
         FoJCin3dm+Zptmzl+uxQ/yHiqmHvAoaikeIiVxKB9+irkw27+g4LqjYx7m02efBDptA3
         zwrw==
X-Forwarded-Encrypted: i=1; AHgh+RomX+44V/CJICM45IAtEo91I6cQiyaVyA4zP6uLcsq9xgrmOK7rs4DTIuZgo1ev3G/30eafrVuHNbaZ9ETNGDd7@lists.infradead.org
X-Gm-Message-State: AOJu0YwSM1JCDrVzu6/Y6Y2na8T4gpq6cRsOpPukKgMnu20tDGBmwWx9
	gHZ1pe2nLOP/0BkZeCdO/LNIbfQTpAg5sy4aZ25Py0+M8sRFtpK6MlCf
X-Gm-Gg: AfdE7cnT1XbQT+E9Xd4vI59ezFxTmxIMM+E5axie6lsl8hyPX+Cl9VGC4Awi0iEJ407
	0AT4tnhZM8bBRA6JALPsjgSuonzRsCIe/uwm/EmEnfUWMitkrpUhajMBgditpy+G+0IGC1D9x7r
	tTSseLQNlUs/7TkzUM0VEo3YHUge4P5jAWUx+33c3exejkdfjcBbOtP8llXtag2X0u19E9p54LP
	5Oz/8hJaGhngIRgwgKI5vDeMNoUjV0jlEKqFGMfHi16AYCuFW1gI8/BZONqiaGaMQi4FxQK7AuO
	uGgLs3Xd+r803LSTeSPTfWSgRA+2N86HtTD73XP+OQK8Zl4p/R45vNTeuzIH92XIDVjecaoGUVE
	dwUJ9RPc65EB8aqmkSAfe/RSEan2rfMXXxU1i5BBfxn73MP+fHI3T1DJyl6AIeYza0eS8VqmoTL
	/ChMYQutJvHEbbDlldcj3jrSXDyxMgAndl0C2sZgNvViLl7q0A1OdLMWtWNiLaMjznVvpHas72P
	A8V6Sc+EB/Mv+t50eKKqBDes4uIvjZ1etDKBcKtZBw9YsT1vinNROa+QXZEvury
X-Received: by 2002:a17:90b:3b89:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-38dc7779d6cmr4445784a91.20.1783849498894;
        Sun, 12 Jul 2026 02:44:58 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:30 +1000
Subject: [PATCH 11/12] arm64: dts: apple: t8112: jxxx: Add device-specific
 SMC hwmon sensors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-11-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/XXn4VvKanw7kqSsbi77ETk/afz7nt27dXzWhWY
 oRC+teKjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRPj2P4n8l+4XNXcXJ8Do/WB630KceKm8/HHfzCW/nkms2Onbue32T4w3PSjIl
 5gtbbmDn/VzwpK+35cbxOMY6n9mGuiU7l2c9TGAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_024459_763757_F4BCB161 
X-CRM114-Status: GOOD (  10.32  )
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

Add the device-specific hwmon sensors for select T8112-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 1a08a41f369b..7ccfceb08093 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index e37c56d9fb4d..fdc3409d2e07 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 438f972546b8..105a9d118980 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -84,3 +84,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Back-right";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index ec116da3e4dd..7cea5c594810 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -146,3 +146,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"

-- 
2.55.0


