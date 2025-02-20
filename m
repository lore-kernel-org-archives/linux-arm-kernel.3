Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56B1C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4aQgk3OaAz+HW++uMuDv22SLEQxIAOkffPV23e8MfM=; b=2OUZuG1GA5hQcjaldV4pyw2H6J
	B5/yAD6uNKaOoxDLC12Bpq2b5fSuJNLGHi4DPxVfzWcvlRY5O+emWIWW9E+DtxiVREryAx9RGfImC
	MOvtahofG1JhnkP7vmf/xOXzO8TrCGrdp7dBGJVr9VSw8K+ZtNjXIyK1o54Ih0Hc4D96uDAJoK7zQ
	xaNeIUwGzPodtKFUEYKiR6SVUVxLvdKKJ9OPYbEbVBL041YrKUFVLcZ2hB5j1NP0aanB75+X4PAt2
	dFdwepGh1nETpixw2rjVQVMLn+wSb6dKdhKn2oZTGWl5arWwE5nAD9vzv2ob94GTlwlLdpdGRj2C/
	FsMJKyQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8uf-00000001hvB-1z5E;
	Thu, 20 Feb 2025 15:56:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8q6-00000001g30-0hB3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:51:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-220c92c857aso20341365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066709; x=1740671509; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4aQgk3OaAz+HW++uMuDv22SLEQxIAOkffPV23e8MfM=;
        b=VLd6aLxPhVcVCHosT1WPuRAy560p8TtuAlbsMQNVOjlUNWgZbsjA6jXzbl+MDfrCAG
         4rv6/MMBMkneVWa7HLggBsqitiTxCdVM5s9paX+N/mIhJg+YYgEffXnotZwaKMJ9+5h9
         7botxxrULLqCJgpJy+Spm/lz20lUdSPNO/uYAkWT4Szb41kjoI616EmTi6YTW8bcHlD+
         G9FrrrwDKZtc0TnPAIp0BHzozI0OkOTCOcOcQUqokvqDWf7zylCAlwRBC3hyT0mOpiNT
         N6JpJLQ7zZBp0QVxcMEJFwHqeKca3JYNi2uZXFFPakzbFKGavLm4mDxNNyzShRmbN/yE
         Shog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066709; x=1740671509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4aQgk3OaAz+HW++uMuDv22SLEQxIAOkffPV23e8MfM=;
        b=kRCco/YQyIJ5rMUEemHNYcU3iE/XYBsATuZ8k03TKXzQzqclQagbezTMQeCfcx6JT8
         lg3+p1HU+NEMfwco0UQvkOlMfqrvh038/KblpmygEDpOftWR488k8+Dni2+dNzUEXneh
         6YnWR1FiPCDIRTpqr2AY+ySP4g9kGy4KK8eAu4rcsVVC3wpkcrTrAMTuRrGpSHEP0voa
         vWZK1xr20LBAOO+1EQRlmiiw5xx9sVAVMrFuYxVVXIumM0GOyffPOzuny0hky3Idoc5Z
         3DKqTNdv4S0EfRjhEutxpq2+VU0QEp8MSA3WU4ZmxKtuhnO39q/3UbRpg7k+h1s3ZHW5
         A+OA==
X-Forwarded-Encrypted: i=1; AJvYcCW7Ilq1YaqyD/8lNv/WCOPrf5HNOcPtxeez4QOOpzHqAAPRDzWNdGDTifkPATfHJdYzFHxfed2JMoQxAVs4a1dh@lists.infradead.org
X-Gm-Message-State: AOJu0YzHAUlP9f3aL3s8xVDZepvYtmEhHTJGOSjIY8NJFV7tl4IkEbQA
	/RVE2o2EChWFTzvlkwyw+eDmNKtfknUZPa070IUEyZEGYO8dr/SN
X-Gm-Gg: ASbGncvgKYIG9evZDuyui8n6uGT82ShJhAjZk8FF59S3Kz+8tZtixbpjtyWDv2Z3eVG
	+ig7pMjJhl4raq84MGUyWm5m+ZCpXQDORcqcwpIg2ffFAd+2oRmb9458xD1VM9l33mIKwFkjnNW
	1wfyfdWVcQIUIloQpVA971C/vf19tZc6sj6bXWq4caq0a7zWJ25BlgkLugTgodLNAV/YJpbF2LW
	txG5WO2k26qoNuzYKvV+F4yiXPRyfuyut2FK+Sc7KCa5qMs5ymJee2kyhSMQzTwaIOZO+MPPSFt
	cvA+yAXBa11xpGkCEw==
X-Google-Smtp-Source: AGHT+IG8+tySuiPwp6e1P8g9EupJn2/5mZidEyqnFWhQeW8NtqM+gsjp8A0ihVyYanOl68AklBppTA==
X-Received: by 2002:a17:903:32c5:b0:220:fe36:650c with SMTP id d9443c01a7336-2218c541d8dmr65265325ad.23.1740066709139;
        Thu, 20 Feb 2025 07:51:49 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:48 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:04 +0800
Subject: [PATCH 2/5] arm64: dts: apple: t7000: Add backlight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-2-d742431c7373@gmail.com>
References: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
In-Reply-To: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1519; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=luAsDSB6foc9kXkHd+Wi1yTbVUxTP0P63sH7ctTXbEU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MtrP+HahF4Ws+El6cSLJedb12Xm/j/cLRD
 c8h5+KlHauJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JD80D/9KdUg76YCKbS0mSsA3J7LKv1mLTD6o4hPFbRG9wm4HfANcy+GEfQ7inaMUAtml5SCsk52
 dtyoiPt+It9mjEzAHpL4Xu8BZpw3IJpHsDmrYUsRrtg7M41drnQSd+5M9DwUV4htDnOw4/0yFde
 Lai5NyA1NBuBJiO12jeTfLI0EfDhjFxuNSjYC+zRWdxPcbJt3mC9LJI4y0rzm6/nts79yiM89oP
 8cJMkPS3ocfFdpwFrThvSYVH8dvG/EmMYutIdgQ9EgvdvcmI/k8/RpLsK/WYy/c8xTTWqah+YDV
 WhZ1fSSVAagxQZpiyFPWQOnhRuZodpKWPK5GjOfOEXCNqqAjV7S/pl4qToTJZiSBZ9YI8tUMSIa
 rhurXE00I91EtQhPyvOsej8etIiDLfF+7NORGfHY9+ydNtuaHtXT+FkdAMgqnN5F84S2YYADaOa
 SCr3GMHHGR4oynxaMqqLgESA4W3AQj78txtNCbOnd+izrdjhUVWC0G310q8ul4yGkWRYc5rSbYw
 WDmsoZD2KU5UvT4Mt1GLGgGQ5HcebnpTZCUm4XZnS7ecuNK90doy1+lw8EC6u1Dc2eyJ1wTgYE9
 vFUTz+79CGowyTiTlWjuvj3i/xdqup9TglEBwoxS9TwpulHQFoJqT934Q2o1zBoPKjW6NhyC1Ba
 qJ+a5JHbK0RvOYQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075150_212104_1CC9755A 
X-CRM114-Status: GOOD (  10.45  )
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

Add DWI backlight controller nodes for Apple A8 SoC, and enable it for:

- iPhone 6
- iPhone 6 Plus
- iPad mini 4
- iPod touch 6

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi          | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
index 8984c9ec6cc8e3c86281a3da719edb56c5bb7f5a..7b58aa648b53dadafb3a01d9ae1e01afa6cd5869 100644
--- a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
@@ -22,6 +22,10 @@ framebuffer0: framebuffer@0 {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 32cac8c30e62d657079dbf32aece8af0fd9cef38..98e510b81e26154c258e3359f37a7964484f034f 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -155,6 +155,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,t7000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0xe200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1


