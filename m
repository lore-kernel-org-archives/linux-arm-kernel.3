Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F0CC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 04:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=; b=hIIR5/8mTDo7l8UHRBNurTlWn6
	oF7uZS8xdrkA0Ted6cYVTWs0EWHCR3aqfQcUVbabjLCTOz1+yTk/lTIEE7gwQVrdjqoK/geDIqyJ5
	qhKjL6TZHIr46IS/+GGlx1UMcRZywBP5baTIv90KJfqqXv98PqFRpUT4RsrAA87jeP5ABrlXbC8up
	hozdDqi2hslFZsm8tSJ9gxpdGu1Mg4qKWbeQVwtTs1ypVVhidW7bU7Zrof+5tnXPvFREcW0+NcJYs
	vdOp2IqldL8wFodWCmioSdi3GwUqIbBSCvc+8ZEA3Mc4bXwOmKOWBLJ8eaeorbIaJUQuczJwuWpQA
	Q7pH5lWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tns69-00000009kED-27ng;
	Fri, 28 Feb 2025 04:35:41 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnrwt-00000009j0E-1d9v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 04:26:08 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2211acda7f6so39055855ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 20:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740716766; x=1741321566; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=;
        b=Y8RB9lAoAs5HHOSa65VEkxat8qeFbIFDONf8KYHvXTKvqjiOJz7H5qCqHFCAi/eQWb
         GoLwxtpVCzH+sdSsdgKtq+qU6GCKNvvuj7+MgluyaQbSgQy8a6Rh8MWeolwY8qkmkc2E
         CeP244vH6QnSaSmyjP3Q80PvcAtABmRVBp0KvCQnQA00Q1hi7v94qoZSZ4l0Nz5rihFx
         Ku6RQ7mbgBxgp9yrygUyM840J28o50mmA2mOJW+FAGhNh3aFwkvZZGS/jQxHz+fIebcY
         Qq3/sp3PIIUm/Kr2bnoam/5s0BA3jfzIK7ethKOXQKvJIoWtCswgh+zwY2SltdXYz71V
         KwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716766; x=1741321566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=;
        b=DFUGSASc8cwVHqHNhOpT+WjdqSmqajrC5U/DI83ekO2YxVKr6zNjsOIJTP8i1Hl+Hg
         vByBeq+b1gXkq9mrocj8/j0v6SYdyeyfrOKcvQp5Akfp5pO9KWFl31wh3BQxzavczLOA
         wW38t2cewQplz0Yii2/k7XysMu5SmhXdPCkq9+BRd89D2L8JDsUN+wwq84p2TcrBd4vb
         bHBOdLeLCLM1Dw5VVQkJNtjEzJKLVbGscaEeswuP+I39a+KKnNCsPS3SIUDdgVXyEbvv
         Rrk7UdDr1Kmy9YsA/aoPRFx9XR7DTYaXL6cslDub38eB39c4JmnhKYuSJqdHXUPA2Oxb
         F4Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXGKyJLJixDpbdyku/1Ht7E8ZwCWN+zxOtIuwbKdC3C39+8bBRGvPrlOzfTRAHiOBaPV7G8Q4xRGkz08pcCwZdt@lists.infradead.org
X-Gm-Message-State: AOJu0Yxjigb4rmWyTe27xvmvPz8Dv6IbOh5i9qhJi44uZt8kJlu+rX1j
	6pfvYty/YVvxoaZBG0wZP9C5Pfs7oSLZrZ+H/FpF5p8SdJ6zblt4
X-Gm-Gg: ASbGncsr6m/uFJ5XFkI0eukYNehz5O+QXTBluv2LJ8vZSrFQYHr982YRqpAWjmCWxae
	SMYir0LVEHg3KXWDSePw87hHPxyJ5VemFyeguQKkviPc4a8E6vEV158UI9Lc6wZd+DPVOB2xGEf
	0tYZ8Zm4LY5u+rapwMisMjAmUxUJti7zPh4Ifc4AhNkk2D1or/IVfDRJPkT8DrayXS527J2/CEC
	5N6/Vhdab/J0msBYYYvBIvNIDJVc2gOQB8IKnS1uJQZFKy7cPMLpvlD46MnhXd1Ne/qAH5BM98L
	9aJe8EztUkPbMhPmUZBQtyhcpQ==
X-Google-Smtp-Source: AGHT+IGcN/7ZdnUnViL3/CiY09K67zXvs2OcKFnG2mtSFgj254Meo+xHdGmJBGbEey5mF0hsG5ucHg==
X-Received: by 2002:a05:6a00:a8d:b0:732:6248:8f5f with SMTP id d2e1a72fcca58-734ac36272fmr3094637b3a.5.1740716766478;
        Thu, 27 Feb 2025 20:26:06 -0800 (PST)
Received: from [127.0.1.1] ([49.130.82.63])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dd19sm2738318b3a.131.2025.02.27.20.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:26:06 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:25:33 +0800
Subject: [PATCH v2 2/5] arm64: dts: apple: t7000: Add backlight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-2-4243fe8647a4@gmail.com>
References: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oCtYD6WrFTqNAI1VrGeNu5viopS22BzTCxA/dheRKnA=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTrQccRqi/70AGCvdLF+ZLysUS8fqDbEUVGi0
 47EJSfrLx6JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E60AAKCRABygi3psUI
 JEVOD/9WIFodfJZl/qM5omn6+3fHjahLg0o8Rm4NIX+Fn6unL8EopVkKG1bxI4jXzxsdL8veKi2
 d4wCK7UiKE9Bc0+fp05IZthkRoxaftKtSUIgmHETLZrRuz0NLwjvKd+Vd5aXkjcspVC34dsNNwH
 oNaXD1u483R2VzY2hniobTUo3NO83/H5iQBWQYzgltpzJzsJ0zjoWpeUDrL8OHNM+Li6CLoKfj7
 JDEDAwRHuQonGDbQJ1/3AuFCryQxnaHjHd2YPGqdnuwZCnpgM0qT695t28ieq2KMemmNWpUEwJg
 3MSOIDQ3NTxlCNPdgKPGLfwNrbCqGnMA35WMjaU2pv0p+A9+wArPkTykjXcyH6Fbvaj3B9JZP7z
 Cv6HtjJ3cSYspFitiMJeQL53FmX8BB8JyOw2upuOOQVb1NE9LLWdqSqtoOA/1dDRNpydzvqb57h
 HuVnbkLyGrxuC7QYryfbOlEWTNMlf2jx2a0J9fVwb7Z/YMybfuRyiFZV+Zw6dLTA5mJLPM4E1LR
 5GtCcC9w9fhzNVTY5jGFWSU+qCa4rRqglMBCS6exBQYGOiSiqc7kNRN2UQx2RlGADSW9IJGGWp3
 qWkr7WdyGri74LaBfuwXm1S+ukhcr6GZUrKwe4lmhZOrlVqe8+Fub1WWYPZka2Jo4+rxGpgtelB
 iE/pMuaMymqNWdQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_202607_430820_A0234C5A 
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
index 32cac8c30e62d657079dbf32aece8af0fd9cef38..85a34dc7bc01088167d33d7b7e1cdb78161c46d8 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -155,6 +155,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,t7000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1


