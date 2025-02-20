Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF598C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0YU2/erqWDrMnbDnClvO8uF+WZwecalDqDcoo48HoQ=; b=O4A4EdmSjkdOGvPB/74p5RifQW
	PtfwMnwlve8YcDPtdZgxyDP+zSKl5qicFLew70bBszvzCp1yTK/8VsPX8YVdlOOoQymnNOWEVPNR5
	J7zQp81MpEHJNM994uzKrjIq98zTVqavH9lD7Y7MXgVXTdrkUOGrKC24e42KRzJvCGJpZyyELh0bV
	2z3epI21dy5IJZyth/ayWOPPuizkq+FajKEypZ/Gk3OzG1mMDwZAxicIwIW/Pk7/9tr462qAE5Adt
	c/RDwLalOFN+JXJI22bmDHVWU/SBTAQNlyG0HaHK/PGc/Rhzw8x2oXkZEKIFFri62TPdaXHQGdYET
	D/AztpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8xZ-00000001int-3rKK;
	Thu, 20 Feb 2025 15:59:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8qB-00000001g5I-1Tlm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:51:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220bfdfb3f4so24154845ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066714; x=1740671514; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0YU2/erqWDrMnbDnClvO8uF+WZwecalDqDcoo48HoQ=;
        b=l+4TEoXWHQ5p8JBHbAGFA6i5c0PyVTsz3LPcFCkm2gXIgkKWmu8gOxYm7mLvJiMhKi
         wbYqS/MZlZQNGrYZ3iX48PXDcW+Y2WMQ4jQnV5T3dpQ8krzROvpI0qQc6iRuAlLsh7Dh
         B29mWWNeOZZvgXwOtboMEzERgoPSPRzpT9WssJsNwWP/H/MYwDxoCDRL9WeW2gEVqlJL
         +inPZLSsoN1PrS7UqED22/B6YaXK9keu0QEd68UaGfVthM2OFWHd1iWQJBowv3gA6Ttv
         gdr1V4fVbKABPPbyl9NWVPx5PjyLBXc7bDvvdJHzpkWW3vKNiO10N7JsSlijU+WWMfDF
         pDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066714; x=1740671514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0YU2/erqWDrMnbDnClvO8uF+WZwecalDqDcoo48HoQ=;
        b=A1S9/47pNbTSmuchBjey1PXtbBVnR3s5+gz02m+mx6CivAgEBGgAed8l1+CefobIDP
         OqsopgJvi2kxJU98wNuUFC31VOftFxEA+hFyWCNq5TZzJMQTjjBP9PLow1GF9J0hVBD7
         f+GnThOgQWKoPVK1YHj1d5kDSJYYGc5OuF9ZGC93xm1XXjh43CdR1NE/pxbRLwqm/YfY
         uyE6ENT+gad20iVDPrbSfQ4PO5Svr6iOi0TCvqY7gS+fSq4fYJONgbZer+jhiJP2sf2a
         MA+JW3oofHDzSqxzgUNn6E5XAZwTUCS/Lt4YCPtZ6cil0B0krSatKsXnFzUM8XFNuSCN
         +bQA==
X-Forwarded-Encrypted: i=1; AJvYcCXRI7Ih/EmxaBKXJP7Sl2Xang1WiaFkPeXepW/WeleVtQFa4QsWjR64SCpehmMdFgM44Ld0es9yO2HKGlNrFDQQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7mO5nHZwowEUZVAoYde3Ic2QYFJJ30DGfBOTXI4SiLyZSzuL9
	fk8ty83jm0kG4qSQd3SnXkB/tn9aIHVixReUlynPOFd4y9Jv+4GW
X-Gm-Gg: ASbGncuYEDeVl2/5wnDEz8NhYnwfIiFMk2vh2D0UyhrQGeM2EE4hmBlzLxz3jp+olfy
	HYYVtWwlWl+wjdVC/NgPMt4CswAviiQzoX2LfLBMbwn17i+ha+nWxXh9Zz46RD8aATnY+XOSYx4
	TjKER5y38qu9TE4rOPfa1DccmHRw7F1MNwy9bLGHhlRUukcwjRv5ZiPpHpitzLHF49dg4zudHM3
	RiJwCYBOi9hJhHSl/ddxOghY0FU3Nu/oBDFeXqNWQOsRBVGEC2k1g67v058p1mp+Mm6C84GNgcS
	8BnHmtrA8IxgmpaLNA==
X-Google-Smtp-Source: AGHT+IE8RED21Bp6xhI9HWjc7ruzxzx5fVu7CJktOQA+Nvq9/CXCB0o39pnbOtdMG0YPDQ7Bt5pSMA==
X-Received: by 2002:a17:902:e746:b0:216:69ca:770b with SMTP id d9443c01a7336-221707775a6mr131233215ad.12.1740066714503;
        Thu, 20 Feb 2025 07:51:54 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:54 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:06 +0800
Subject: [PATCH 4/5] arm64: dts: apple: t8010: Add backlight nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-4-d742431c7373@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=fG5z+I6G4IAhE7dnPnquPSBWf8fdQscLoMVg36c2Odg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+M8LE8bsWThAPeUR40vROINMJjWs37phpAQ
 3m62h1TqryJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JDb4EACoI0y7cteXJJ99qb6oFbOEw39+ZyQLxLjbcKIiBueVvQZo5pYL0TASPWLu/6t3+YmLFiE
 Grrnko+nnMva6uLuS+qfSsOUMKBNkcleZm7/TE3uUXddo8jM6WNqYzuo7wCUJJCOeNKQECt9mUa
 2SQ1/2GFkLPOGKZpw6gADOVSIPQub3gFo79123XTK3/8My3UAx3lZ037gcesBkePNE5yw87k8e2
 8o/k9ldBIGd7ab8o4+9QlnPO3KY4arfOU/d11dlFFoQCXjotqb9mIoV+jqyFfWXY+tcrIpZ1EmV
 JDc03nkvM+FhcRF+VR+eYd4U/EvD+qUiR6mEq1cez0PtEgM4o+q7w0k8JAcmwsilgW6LhoXRy5R
 OR8Fp3YAnYUKlPEiQ1P8QLiyKPj3DAFHAqQ85AJFQih7FLBp1WAgeGM2Q0UsmcVbFHsoCyOFEq2
 bBtYDj3MaRgGpyOC894pZjBYQJQ5gpdv3bIDNKmKLA3wLSz3N/g9tNBPTyLUSSygl1Qb3NyXvag
 Qcg6WaGsjOcUj97xTGhazI8EaEb2T7yJtjU5qL3kRq0u9AL9FWmgQCfszZyfpG7zinSec0mgSpp
 tH7IRdzYLSrU66PLmRfHGzLolNzqBfiWk8eyxLDJZYQ0Em3Tpd7PXSvoBDtvbIGmvl7WyDp10XM
 gFFtK7WMiVNFpzA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_075155_394655_167365B2 
X-CRM114-Status: GOOD (  10.36  )
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

Add DWI backlight controller nodes for Apple A10 SoC, and enable it for:

- iPhone 7
- iPhone 7 Plus
- iPad touch 7
- iPad 6
- iPad 7

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-common.dtsi b/arch/arm64/boot/dts/apple/t8010-common.dtsi
index 6613fb57c92fffd41c34a61a78e7bb6b1888a5ea..44dc968638b13814baf94e782f2267191ce267f9 100644
--- a/arch/arm64/boot/dts/apple/t8010-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-common.dtsi
@@ -43,6 +43,10 @@ reserved-memory {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b355d443ee476e7c98b352470e3b1b5d0fae7652..17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -167,6 +167,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,t8010-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

-- 
2.48.1


