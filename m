Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B07CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 01:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5H5+bfFpWI0JlLzmp/SN5iCuvqCago9oAPrj5EA3s9w=; b=DFT17Vy3r730P5aimTlGUhlyXi
	ZbgQZUEv1DsTOzM37Ntn05j9KkCyaii3wkOah22shWs9jrW7Kuhg+DfzPEykwtkve9wLSJFdD9XeV
	i1Gt/TXRDYidnz8GQPI2WFbr61bq/x+4SEbr7G7oGW2mBu0189FgWhapUBlyi1onUiS9mXODJfS8v
	9o1XtB5Spfg6R5HbGsy/pTJUY3XU5Yj39/5Q4aSqNkqnzBTrGXZ49qbqBtOIhBqTT2UoaaalAAZ+z
	41APSnQ4S2cjd7HB+BgWdhkoM+QwhX/Ubc/B1I/rjILYDsAGih1gleGzrqe8zkjmXi11AIGgO5K6W
	bFfzzDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyOu-00000002VZd-0z2d;
	Mon, 15 Sep 2025 01:53:04 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxyOo-00000002VVD-3c5W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 01:52:59 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b54b55c6eabso1818606a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 18:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901178; x=1758505978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5H5+bfFpWI0JlLzmp/SN5iCuvqCago9oAPrj5EA3s9w=;
        b=IdIJD92IDVZXWBGPRS3J5I/kTS5Uz2gOXnKE6dIeJS9iQp2b2fNwn3mqtJom7gAnQk
         GtBIk74bFCWIasJcPFu8yn1xyg8Vh0EwwUVsFEicxZXHkPYuvK25Dcfd1tACfxM8Fqiq
         2V6kK6eVXHmTzzn38sDZoVE3dHVdfMvNzyly4zaf6oT3Xri+Cw1X8DitR13554Vp9hWT
         irfrpjQ1wOs9BdEhAKXksRdMm90Kikzyk1UV4lDFMSMqZa4+kxN2wTOR9LrGgBkmRETd
         S7vWXQ1NOEQ2mIPiLsLURwBJQ/Dszmh8qRcjnpnEMiOl1Ze2KRvjW7j+C7SNerByh9KN
         VuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901178; x=1758505978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5H5+bfFpWI0JlLzmp/SN5iCuvqCago9oAPrj5EA3s9w=;
        b=uXlYej+sQlXBiInI82JVtPr1cikQS4A2yiifhd0pQArUzwpyh9DCfIu9m+QDXvL7Xo
         bodVelvXvF+hTDhLjV0z0GQX857QMB47QZlimOoKk6cA51w8CPMlUh3t3VMAODb6y4F7
         9ATCZrYWPxHNTJviZkFnqrpN7KQ5Fa6zZQz+4L78Sa1+tbQgypBqxQ/8DKOiIBPyr01y
         1BLJw07q+DOALQbZj1kbQysQ+yDaF9tsBBhf85aerXG+qpHz/mceICTqrdqIJvFboRN3
         R8m6KTsDTvrfvuGzeCgcDz2CXLpcAjzPnAOfvt9UFiRC18EUNvYWeWBoW2QUmwiBd9pg
         XRhw==
X-Forwarded-Encrypted: i=1; AJvYcCX5boZ4dMSEK5WpfwzJQvpaKzwZVtgPDlspHZg5Z4GOXxzEOxqcK/qcKCR9umqBAp29Rc30uuYcubWE3dhrsQAN@lists.infradead.org
X-Gm-Message-State: AOJu0YxqUXBJjhs4WcHRX99QhMKjmY+5V84MabWyMQwfLKnjhMgQl7l4
	AtHnIwO2qwPNjPTAS3WGnH5VUIqs4UUDhFFKosjYm2phwJZPPderjA7J7XzEHMoZxqw=
X-Gm-Gg: ASbGncul3fMh5QDyYHQCOIxDZzE5jeiQXOCNU3tGBZu8CyeJnndM3fHPPxuiCrW0o0u
	eEHwU0cukMJuvXI/Hl1UjjI8qyKU2KEjMqXX5gaswkCRaY+01IGUd9XFdf8oDbgqJX86MexfQGc
	xJTZI54jSiONp5KCFczW9tiZGrd1azSKQTPWhqyiAUQqClr2ebb1xHAcWkp0k20BtVshlzabPQK
	OsznCluFWw6W1TsnwmfyWplQ8dc4jsBYr1jr2SdKIH7PBnOPqzQKDg8u+qq6lTbopR5fsYKTYa9
	oc2xnnOxJuP6FGO73FJNqpITk0+Jt6c0r2H3mXlhCeTaz6utsW+zeqsfVxNVo7LtbO4sLkFz5bi
	xxEXG2ytirfnD3Eg7HvjtUaHM9A1yaeekvu0=
X-Google-Smtp-Source: AGHT+IHMm6zQWGhC4CRJdwqcwAn6ExfzlmynisceaUa39WHIvw//bJ//An8p3b+Oihj72okwQgAGDg==
X-Received: by 2002:a17:903:2b0d:b0:267:95ad:8cc7 with SMTP id d9443c01a7336-26795ad8ec0mr6064675ad.54.1757901178029;
        Sun, 14 Sep 2025 18:52:58 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-262df893ec5sm41565255ad.46.2025.09.14.18.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:52:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 15 Sep 2025 09:52:25 +0800
Subject: [PATCH v4 2/3] arm64: dts: apple: t8012: Add SPMI node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-t8015-spmi-v4-2-758620b5f2ae@gmail.com>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
In-Reply-To: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=SoJ2s/7xaJZqpkZFG/E32MO93SiVWiC2LB23uiW2KAI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3FxeqmBzqAGD0XoST/Z92rIDU/5LkiQ3p/3r
 NRJnPkuJ6+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxcQAKCRABygi3psUI
 JFfQEACShZQC6WLqLE/aDkYMN3XdssIhvINVp+gaUZw3BZ2/6GDq6jyuhu8I6j6HpOthCOP9PXf
 lQPdknQu8U7P5vGITb510PzdyI5GWk2tbjECEFM2GCrHvua2OCaPvKU8iTDapw4oG7QvT3mrda0
 kHmnObP36QBiuawsVeuw9y/7fm7cz3vPVI1FiSOFdyQC7+yBpWurCfYYNd0/vaK0nQOeiKtiKy9
 Rhg9nG67+GSijrBI3Rciv8VSo5Gcd8txQyJ+xYiA35aadAukvnNgtrk88YaThNPq5rRokB9DBuQ
 6Q1hszoSx9I29qdqBn9p0APfkumQ8PuLxVtDGBox1B6yDL9pH3iQg3IHFxWAimt7LU4QC/TZBrG
 Pjbsh7PBXLqUMLHb6KtjFEBe/U26LpKKv6v13cZeF91cKWJczxVrTwfYb0TkILbH/z3fMGFvow5
 a5rAvPuRoDL/sPa/SBnTnrWOdC2m5YgwaWR1bNc9cHCcirB+G9x9kB1kaBBTVY93dwpCGLqPpJE
 FJL1IBL9PMnQLCY0b9+QD/urD9nMlZT4z7bZdT9cynrka3jO0AhveaLQftQ7s+Ls2THKiN/ZiyU
 26L0cky6XnlQ42ZRnyi+Yj2EsQJTTJIiM2lfd4O0Ixs12EFrLSNT9C+zCAWZwroItStwD4ZZyIo
 G6LJq9iuN4EqQ8w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_185258_910420_84EAA12E 
X-CRM114-Status: GOOD (  11.15  )
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

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..e7923814169bd4060706945561910ed1d5c2e0c8 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	interrupt-parent = <&aic>;
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,t8103-spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.51.0


