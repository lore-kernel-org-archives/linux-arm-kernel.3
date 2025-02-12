Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 707C6C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUTQ/y+vc12sFk3R0yRBFfSrcmurNaqNh41K8Y1JKsk=; b=umHqBFXG56KbiK2b1OpAQh+4Jk
	DMWbDErae+Fm0+ewNDvN3fA1n4iG+auYZ1T7FC8MTPuVfOBeyIafgJkxPLo6orMfwNMkjHUX1d2/5
	9UqHRh6LYCFc+cSqjL7q/Ojz99sAJG2TBQTdcYJl9GtFqu3HYD/G+6Nlt1N23DK1ZbHAnchiEAt9/
	v0UwOBnoDk3g3xQfyB3m51sb+evd0PPJvJdmjaR+xMKU7xk+qc6q0pl8iENQbmQqb9TfwFGnPX1L/
	UZDrXSyN+aE7P9GkgZqYMuhkhnecCJREZ3RGh77OoeqzWH5jmOvS9S4S6CGjmIhfHFhdn7LV8yHIF
	vNcrMfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFfn-0000000863x-1gDv;
	Wed, 12 Feb 2025 16:33:15 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiF9h-00000007yQe-3tm8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 16:00:07 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-520525dcd8fso876559e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 08:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739376005; x=1739980805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUTQ/y+vc12sFk3R0yRBFfSrcmurNaqNh41K8Y1JKsk=;
        b=NqkEstpS6TrxaMjl72C5pxufadv4FJ7ULMUhf/1Av3bb6P7u/s9L5cEYewGEnxf3sg
         RD2qN2EfsimuPGXDP2ErYonwZ7SZTSMBKVGEDS8JfMIDYsur9iibxcw/pK5lka8bsw5E
         1RB23NPxaByRpMOFQFBOXQs38F8/XTxNxBAf9pvlOvnQlXFm1xSCQgGMZMkhtTdNXJHl
         x7semQf1t7mUh7+IW9QiUY5RytKEOkuR4jw0oXtsF+jzvHqUpazQd7O47Xv06i+0gdj2
         sX/TYPbekY/9NXFTEjSDMCTgXt6D9CV06pXILV+zwnFZJz8b3U+UHkmcKk4zsuVqKsNX
         jPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739376005; x=1739980805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUTQ/y+vc12sFk3R0yRBFfSrcmurNaqNh41K8Y1JKsk=;
        b=KDfksboMST7+oSZBZiBFu2mSCJQrFcRc0Ipu8+v4xFFWNZU2iNFVg1wX582pLaBomn
         8poLIV7EEP0euIwfVu4YuPXs4JbFpsakdEzLAllML+p+yS2UrotP7cJI8gmDjdyenvbH
         gSfV1+u+nvGwQIrUZBnzfmRyRzasmK+DBDvYdZrZbQQ5yfFEigy+1YM5iLwqtB5jyUMz
         fJ2RyaFP2ret4VoIH5RrYn2do74CjmPD16S/AAd6Kig60wXyb+niOSU4NXpevxZqEKbh
         L+PtpONoFL4EeWoxwe0SgRmSxti67cdBOziFARWhuRdmRZiv+Pk4ufGQwCw5NMkvCvGc
         9X1w==
X-Forwarded-Encrypted: i=1; AJvYcCUmj8PoHNVIWySyXF5NUOqIGReZrOGrLLkVG/kzRMK7jvAgl2qXIpQ8tv3C0B4tvlNhHuzFSUwB/bXA5uGMqCGT@lists.infradead.org
X-Gm-Message-State: AOJu0YxrqJk9DKs2vRb6mJMg8r+uycysOcBst93AW8UTP1JlAWyCMda2
	3d/BxC2wP7UBpvqga2hp9EKEjVT0aCPs9omj4HyxO9eUbX2SudP9
X-Gm-Gg: ASbGncv1/WjUF5Zsxrj0jqKX6PQOPyqtX8ysqiUAXIaBpuyV8nvDrAlXKxa1fe8MeCX
	2GkbAucC8duISbRLAoN0Le9Ukj1Ckfe9/mJXw54bFn+o87SyB1GAaXdtuTnarSXNphaIvp3hHm7
	FwF95NEWp/PnDIYH0IX0yHlHUyki+ShyNHqlcd8edeF1rjH4tUwyDolyCFJTyTM3hUDU0y+FIHm
	Vp5Zb159ZLOJDOOXlxHNcHTvU9s0kCJ11kOftX+F0byGjGGRzFRy0ILCMk+AeCa4iiRju1/YUkp
	28Y5QEcM3JOk1NeW0OYn9w0WLYIqB0EquBF9ve4kNr9GUylD1dEteARoLbg0CIiOrs3sDKBQodQ
	J6g==
X-Google-Smtp-Source: AGHT+IEgr0hm73Trz7viRT6b5fEU+HyboLMwNQtkSJQWi6mRSEmY4HU10MDnQcwDYPy7Yx2+iJNaXQ==
X-Received: by 2002:a05:6122:468c:b0:520:6773:e5bf with SMTP id 71dfb90a1353d-52067c31106mr3019717e0c.1.1739376004523;
        Wed, 12 Feb 2025 08:00:04 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f9636904sm2335213241.3.2025.02.12.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:00:04 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 2/2] arm64: dts: exynos990: Add the peric0/1 sysreg node
Date: Wed, 12 Feb 2025 15:59:43 +0000
Message-Id: <20250212155943.269-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212155943.269-1-wachiturroxd150@gmail.com>
References: <20250212155943.269-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_080005_976203_40A243D4 
X-CRM114-Status: GOOD (  10.26  )
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

Add sysreg nodes for the PERIC0 and PERIC1 domains.
These system registers are used for peripheral configuration
and control in Exynos990.

Each sysreg node includes its base address, register size, and clock
dependencies.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index 843587b17..aa056fdae 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -242,6 +242,12 @@ cmu_peric0: clock-controller@10400000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric0: syscon@10420000 {
+			compatible = "samsung,exynos990-peric0-sysreg", "syscon";
+			reg = <0x10420000 0x10000>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_SYSREG_PCLK>;
+		};
+
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x10730000 0x1000>;
@@ -259,6 +265,12 @@ cmu_peric1: clock-controller@10700000 {
 			clock-names = "oscclk", "bus", "ip";
 		};
 
+		sysreg_peric1: syscon@10720000 {
+			compatible = "samsung,exynos990-peric1-sysreg", "syscon";
+			reg = <0x10720000 0x10000>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PCLK>;
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;
-- 
2.48.1


