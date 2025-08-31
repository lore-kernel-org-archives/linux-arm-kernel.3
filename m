Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4786ACA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 12:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlZf3qovc7XadcWpXTOZUbLWBNy6tyoy94Ss5nrbIig=; b=YV441xtLfb7XjRc1VHP0h3eD/0
	J1NR1kt1jVzE3tW7+KMskBmiaAOQ/LDR3lChyLlypDUWsWe5kjMP8nmn4vQD/RlLDryk9ounbzauS
	vnLNwkGwf+QTWiZP8oUkwOHObpSclcP+KusSd+6nF6jtGJqGH9LqLGgBI6dyaTb5YUaO+dhAF+RD4
	C626cgMaOQYOIXeOpnXN4cFbe3Kw5wnjJpuBvis3xrLGfiwkyWGqnyuqzcrkh79lUGChRtqhE0Cnv
	n1ANQVdUTDao+SfYnGaTlY9IZyFM+qKHQBOYJo4Zdc1tFAy7Mwt2NV7N7Q+PFTY/LbEsyFeRpwwED
	1SvJAGdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ushEW-0000000AAE4-0nKk;
	Sun, 31 Aug 2025 12:32:32 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ush4n-0000000A9Uy-3w9k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 12:22:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b89c07bb2so203755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 05:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756642948; x=1757247748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlZf3qovc7XadcWpXTOZUbLWBNy6tyoy94Ss5nrbIig=;
        b=xMz0OQ7C8a2+P0NuA2EYUy/tghE3VYrc2uQT5HmDNYPdjpi1GQOrKINk3tSTRv5JRg
         V24uyi4ZWUiRZ+CvlDPIJafL/Wo7YOgzW58Anq2jWmcn8z5Q6fhQwtYitFow0JpMp9a5
         UDYxQxW/f5IPpcnlR/HDIu7Fd9mFBME8vu4/YhpApC/w9K2keR6Vv77j0DFscs4JgM8P
         5VoEax2rGUuAOgEXh4M74PDQOm8baY5yubi/eNPgUMr13DRKQT5L10Ozih1ZjS6Y7N21
         AOaG2KtpPiBQTgIh1bT/hLvxmEL9iO213wqxJf3N5rYRRS6nDNCWPIa23C0F5TVK7SDR
         gf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756642948; x=1757247748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlZf3qovc7XadcWpXTOZUbLWBNy6tyoy94Ss5nrbIig=;
        b=LnlHoZ8iz0zEFYgbT/3AfVWhveNTEyGqsO/VIlDwkNOEudZ5IxMNboH5xFSgMdxg2T
         nZC9ev3giL5ENpE1i5AK1kkzmprztPwSoxP4tcJmR3QC1bhdRSBQ1US8stwfYIxMJwuw
         /A6VomZWiSCSyqxUc+yhCNqtRv4V1buPcigmDGdcoyHvmeUSEejclyfJM2GSqqN0zsp1
         UDz+M3vR9m9+6nrXGv+YbnFVETO8eBdCwcJhh0hAKwFVCmiM4n+1a4ghfQaMetTE8JLs
         WuWrKyJqKxNnJxMFyvOpJGMGW/9QlQsPdE8MpvOrgqKoBBDgiv6VyzH3p4Y9kTO5k0Jh
         wOsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9RgLbtyRGpoq91BAH5zrxnpCj16A6RnY+v9Kd0aYb+ETYH7rNV92qKMVHSwpnOwG+N/JrWQ7RZDSlb3LrulZN@lists.infradead.org
X-Gm-Message-State: AOJu0YwleqrSwlcuAeehvBjvZqQdKsCnjwFUyi5/SOXghfkjOhtDpEim
	sX4QltTt1uuOmv+S/Tkys3zMG9xbpkHZSCz3dvXaGcBCLGPw49tGFjjt9sS+N733jks=
X-Gm-Gg: ASbGncsK643KiWlcbCT343G6hGgVJMku33OWsJ8yoChFH5kDEe2Z/GeuRKDYMSEcMi/
	gHU/avcuXzCuqkA5JEWtY2+AabaGiJH3s33mUsTe42fPpCGcakDULkreJcQmbCk8W+BLvNOuWZR
	smLoYmW281l3TZpXl2hrhhH9nhg459JVtsPJLCJG3G15GZeUBfiD+fv/pKi5uXTfJqCUtJz0qoV
	op27UXNzo9JpONTDbTnocfa+ij1b0sXXVDi+BJC3ZQPeJNtGf2uSysaAM79vg3VOdFqskLLdbgN
	qJcBQ7bfoy2CkMfjMSznRlwwqqxE4YGO78Tp1CCuMBNFHn3bzQhR+alPzjbt4RpN6KN08HbF22s
	4jRTCDG0dgNIIQ6OawW7sj80DeDPr6FP9Pgh62QO407e5
X-Google-Smtp-Source: AGHT+IFnFYjlAZftIcXFAXoUbNXxsZRoP0QGkBeFfD6J1UbS/LZNxNdYQv7RKd53VW6gkvcHWeZOPA==
X-Received: by 2002:a05:600c:4e0f:b0:458:b6b9:6df5 with SMTP id 5b1f17b1804b1-45b81eb0a80mr29694345e9.1.1756642948423;
        Sun, 31 Aug 2025 05:22:28 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6b99sm194866225e9.4.2025.08.31.05.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 05:22:27 -0700 (PDT)
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
Subject: [PATCH v2 2/2] dt-bindings: usb: s3c2410-usb: Drop entirely S3C2410
Date: Sun, 31 Aug 2025 14:22:24 +0200
Message-ID: <20250831122222.50332-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
References: <20250831122222.50332-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zYRCQi+0wejFXM/43WXjQP9aWgNnIJKlUNtum34adHA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBotD5/mW0FdtzwHuJEB4jcnGQja4NpqHdMXn3m9
 yr02e1dX5iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLQ+fwAKCRDBN2bmhouD
 11FXD/9XsBkrYV+LeU8wPHs+IkpJtomIWP8qNp9O5Fuo8nvKiNG+p1IZgJXhKnfr7WVNTGb8825
 DkoR99gRgG97/ze6tYvEnIMOF+GuMk35ywxX0maLWdsoVbNK4QAM0hVLsI0FUDZSPHabkrVupA4
 Nb4VFWumhNpbq196L6xerhRrSR+VRgM7H6dH6Q86Le1VE6YQxtd8yrfBh5glKK0sgI7XT7m92x+
 elu7YdlGWs08O/sKb5hB05fmWdEwOu1Ll8oIcbCVmhHZARL46oHXXtuIhJftYHBtXnyXQXQxcgF
 FQDmQCPqeAA9O6ET1I1T/nOySfqXOOFG10cZ6LnaKpFvDkiRNYmvv4GP8cfdeFoeyWPnl0quT4R
 wuvG1uyUviTUHQMIZJJiwGKvXr4h7tIVj5IndB69owM9m9skryq9szWpz9G9gba2FUYkNCCZk+b
 443uSbn5LIYHIyAAC8GGPK/NUu8S6D02qL1+Y2MW5ZMtdBGYMGIguGZ7zC9zJdiqsqtOQwL6vla
 2O0Rh5PROZLIGmoFKl1M5br3SFOYN5M+o1z1ys6HbGlXx3kaJX/MI4eRXDadtJVXhDZhwQNOSgS
 6TOb32kG2bVZ8U4OVxlNBxBY8n4dNLfKDvkvB1iXXdP2l4lUEVmg42TSvg98KRVZFbh/swPe6Ap Hawqd3N/hMNEfkg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_052229_979935_554DEFA3 
X-CRM114-Status: GOOD (  13.55  )
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

Changes in v2:
1. None
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


