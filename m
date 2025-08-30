Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8E9CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lgnqVvxFY08GIwRgazphEg7+3QXDYUBxtqlK2TdQQ8=; b=yC3B6tA6F9a+cqwlm90TiwcUuH
	5Ke3OE2089K+rv6uTyuI0GJtinl113v2I3hRdkJpBe6aJf/gxmh+sPGPwYaKAP+/9rh/db06DKXsj
	rSjx7sAylQf+moWsIvv2/TZ7kvx4u+Gqa0pVbnBeRPZ5jS7eNDz/C7nDd82sbcyVqWwDwDgEbAZY+
	71EvrZpv9SLCrPUAwdJXsyC4xL8L/dEo7bilreabtZHxYX1TBz5hbYzjQ64y3Bsle9wEXtSzhiMbD
	uvwP2wIThHge7RWUltT8l12XxbbXA1go9MIAJRjUQ0gh5NpcaP3GZtgancxZZQOsSo9FqiPPfW3+w
	8UII2zjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLbb-00000007w6Z-069a;
	Sat, 30 Aug 2025 13:26:55 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLCf-00000007tm1-3dZl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 13:01:10 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3cd99b4bb72so254661f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 06:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756558868; x=1757163668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0lgnqVvxFY08GIwRgazphEg7+3QXDYUBxtqlK2TdQQ8=;
        b=Yyy2VRVAZt14lZfcsOY2u3JS+qhckrQvxinhVGHzj7dXmwyhTMoO5uRDpKTSI4hEoT
         dV4cAsEHRKD8HP1PsOb3sVRj5QAuEdLSGeU0KksEM6h0Eqh21GKStFfrzRArTKDujPIT
         Mef1CPdBCY82k5A8vbJgFBysRYXKZo6Z2yn8j/wZ6Ca5gvjY4XmSaBGu9hNbDgfrrx1/
         qQiPdH2b7tZa7WBcxr4Ipwi3yaNsCQwI5xUl214qV8KxGC4BbaEhgn4tXmbdi2u6qqVx
         5huIflVJP/7B7Y3ma3T5NLoPG1PYrzbiVSF+pmdVSfpcflIY3DTXzku4ksfJN7jQJuW/
         ykEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756558868; x=1757163668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lgnqVvxFY08GIwRgazphEg7+3QXDYUBxtqlK2TdQQ8=;
        b=VnrIi55pN2Kb2xDmsAwt1boO2nYjJ5X6RJjlXfn724//6ZRcHbvoG1hckWrIXr5Tlh
         hOgJYusiuPgMI0FkauPrsdzFnlQN+woESmUklIcVkc+FnyB+EVPFofUwVOV03rSCeAZZ
         8w6ExFm0eW2QaFYJ6oUZoAcQM45QCqeWxk/Kc224QbzphI+l98GGyn/y+2sqKwhaS6Pt
         sV5r7BkrqmWbRxgeRxQd56U5xBIM+mD9JHtcTd8vNlcsdBb0j1N9H+FXVg6NnRhiQtFR
         KSyGINuIeRGUomZi8RCeP3zPl8VecQu+0BZtXAS9wteu0fruLe9v4M2uJrKgpv343IGZ
         xNrw==
X-Forwarded-Encrypted: i=1; AJvYcCWO1o9gnxGoJLxnYXaH9ePMQ2HuN3aihmZy4QNqNNCIUekgOeHdvRyK9yT1Cjbnr20RBOtypT1XGvZQWp7m5dXV@lists.infradead.org
X-Gm-Message-State: AOJu0YyQStHqSYMD4ZfbAugww2ycppvdfv6RNlWBmGBLbeV8Y0/1m3Nc
	D9U9qnPWZHAkDSZslKgSm1ZGqClwGG43uazTQDOXyUC8ey4l/UuwFxKPmPgojJ0zUn4=
X-Gm-Gg: ASbGncvpqVkTze98MnnIXAR0A4IuLsS9Zp5YFFqwN2wCxnHsHJhnyEurSC2fs07jnHr
	Jv6IsvEjtP8Wk9/3v2a1u94DPjiEAp3diwiHXw+U3wNrGVPyHrI6fUhcOTC1Q9yH08DVfGvATFY
	R+MQ3QE9+NCkgYDsEmB/BI0ny3Mx2UnqU8qUH43SzcDgxF8R3HL5szYfJF8S797NnEBAd54uhqi
	dJpMIcgDM5lkODdD3JEYEAIuxgr3a/cKtcwvG1k1+6ZBQhCfIOe/oCwSODHmXeGYy82vDvg7sv9
	0ndVq8o5s1eZxXTcs4Crx/OXl2jOSUsfENdppr8fOYTP/KffMEmiRoiKdasIGn8uWvGM8qMeJkZ
	XoShwkuMJJKuM1jnAocOeqXhuVL0A55wRoFG6KbcdY/C3
X-Google-Smtp-Source: AGHT+IHQ4DW0XyUDaB3fbWwROqp7gBrugB5J2s56UPJs5B0GsbXF2q2Or8Czb0QcdVqITphsFKBwug==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr20236775e9.0.1756558868189;
        Sat, 30 Aug 2025 06:01:08 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e74b72esm80211125e9.0.2025.08.30.06.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:01:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: usb: s3c2410-usb: Drop entirely S3C2410
Date: Sat, 30 Aug 2025 15:01:03 +0200
Message-ID: <20250830130101.142934-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
References: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=x5aMDALxgOI1H+xD/vQpZoAkDT2ZtplDl945kHfXUoA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosvYOCRo3slczvzWNNs3J9n9kGWOjXZfTcdttO
 hFhXAnXOzOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLL2DgAKCRDBN2bmhouD
 19gOD/99eTNOuqRJwZe9iS6GIhCcEqgdSGbZS3U64+s0yQv5H2LUP2ITmr75wgmS7TNSn9C2Yul
 OzJyYDvmx7TJlABGo2Xtt5zFPvji0hNI6uY+E8EEpjiSuRzI6XpYkggkPMAF9ROCu2tpwFI5jeJ
 4bCG6RFu0wz18mYfYEQsGs4W4bulmhXNxcXT6YDqTL21AJcGsdAYZEyRu7TrX06bOeoros78mN4
 TsRc0FcJUlfvCVJO9IhPd0VxKyBP02Q/H3fC0ttURdcTo62IPTuoR+tnYNqUN8HzuvNeYbRCjuL
 bcbKCpGjDSRE5Bji4rSE/HqdR3CaE98Yr8h7d6o5lQ9GrVicM3u/7J7UbColzvKVYfuC5zdZtE5
 eajbzgJXg7dcW2WazI85qy77ajmeY/lzZHHbo73LqcvyRW0DRSfrgpdztEB0+OTyv3NiG4sx6zk
 DdkRridi38Nwv8Nl5LVkXTvRvND7COC5cyEDsSKfaGMAapS+zUjVzbYNDbuQjNkBfVeFkDddoGV
 vG9nvK+fPFWHLNhI0DVtvrm97bSCMHw4gUZ9+xVAF2/4ZGOzXVD9cMMvrGbLX9A8To3Fd6YyRRV
 nnLkgr2mgS2ouRXSSH9dBfUpfUrZ35RIrSjCYNWU0Nb3lY1t6cEN1fN8w2NeLo6tyOtQpcGeWq1 ZZt+hW4MoUpIPVQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_060109_915928_F2735A6E 
X-CRM114-Status: GOOD (  13.09  )
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

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/s3c2410-usb.txt   | 22 -------------------
 1 file changed, 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/s3c2410-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt b/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
deleted file mode 100644
index 26c85afd0b53..000000000000
--- a/Documentation/devicetree/bindings/usb/s3c2410-usb.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-Samsung S3C2410 and compatible SoC USB controller
-
-OHCI
-
-Required properties:
- - compatible: should be "samsung,s3c2410-ohci" for USB host controller
- - reg: address and length of the controller memory mapped region
- - interrupts: interrupt number for the USB OHCI controller
- - clocks: Should reference the bus and host clocks
- - clock-names: Should contain two strings
-		"usb-bus-host" for the USB bus clock
-		"usb-host" for the USB host clock
-
-Example:
-
-usb0: ohci@49000000 {
-	compatible = "samsung,s3c2410-ohci";
-	reg = <0x49000000 0x100>;
-	interrupts = <0 0 26 3>;
-	clocks = <&clocks UCLK>, <&clocks HCLK_USBH>;
-	clock-names = "usb-bus-host", "usb-host";
-};
-- 
2.48.1


