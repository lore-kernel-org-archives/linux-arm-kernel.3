Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48FFCAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=; b=tgukApk+OrFeB5yEbZgW+f33rj
	OHBm9KIwQDvdqPqIx7bUgqsHboysx6Mayh0cP0DRom8Wqcog4ZzuRkJfMx1PdYXLHBCf/cBlrihr+
	C99Q3nK6Y3c44VAt6EZTBU/jAdlokwkHDI2lu4Cw3FZhsxIy8fBwXTU/CMBfhkwCelMkUVc67xDJk
	f3hs/PlugleKla0zbGEqeQN8hpdoWC7r3pBWPnUgyIBA9OyLIY7KbLkH+Gvajx12K5N4nJ4LoGOdm
	+ez8J7ZuBCWF+mPabkMX3jSe6UOZwVb9yLLLroJXSU05blAnTN6WlPDMtKfyp+RhDTYyv4xIZzYiD
	9BcXZWpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYK-00000001Ti2-2UNA;
	Sun, 14 Sep 2025 14:18:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxnYG-00000001TcO-1abY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 14:18:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2349355f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 07:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757859478; x=1758464278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=b9n79imnUWHsepb8n+h1PUd/52syDAP6j9CuO07Q1zZnVC/+1VFNW4Kl4T0zzwwCDD
         AntSR1Tqfrxbq3cJ1HihuzcT954s+VZrPxHStmm8+w4ePbB6se7j+3PM+ZVJQiiF3kLG
         hHM7MIwFAVcetOdhsaQc7NzPS8NKJ/bFmU+/HFr/aCobfzFjpEiFvE7C+ug3i0vL6r4/
         V4vPj0a4xeCyukeBQXidYxRCLUPCEwobviDJTD6HuimPiFdYyu7fdlg8gZwIXwiiq3Fz
         VKJP0M7VOUI4XpWW+xvqO4Gi2ycJO0k7yKNu65MWTyWpTjrdetidtr9VV+bPCgtl9Si3
         nM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757859478; x=1758464278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UA8yGhG9kMHYtx0Te9toutlRddNLKPlgFwt+Jj5ZBw=;
        b=PU05daSt+RBwXEXNEWm1ScMiPSa0DtLGkjw0QItORhWUcy8pekZgvi8OeJ6p4gOANb
         A9COzp5RS4R4KUx9D2aZcd1CWDNG+1qFxMSlO0Ve/5DebbEAyiir2RMVtAXzZUuQ1O9N
         XH1CAvQZh6z83zDew04+sPkJwBp/OF3JgGUmuorpD/gyytjwx1cQlGkWiBrYl5SOBXLe
         okng+VRODwjMrXucU17meuLjW//FPghhdJxH7izAz5HUISwJkbuEBYcTBVXPzz8xb7a3
         z8uzH9022hAGylR8adry/YRC6WQgZb3sxDmgxcsdkS/qTDX9a+1ADZ93NNrNXSY+IVq0
         ZkEA==
X-Forwarded-Encrypted: i=1; AJvYcCXnPEWshcGtrcz1skSYBUey16751xNAtdlE8T1hsWGQFO0pqEoyoCFcdPJ8mANap8B2xVLidKneACh5oflvWzh5@lists.infradead.org
X-Gm-Message-State: AOJu0YwDuzPHJsYv+Xvbqihez4r9r74lF4mylpf4xrJwJCIbQ6qGrcba
	jSSIPrKc37j0Yjw/bVSKkfOQjQH0Wp5tqlkuL8jsPFQu4vHE/Zlfm0fg
X-Gm-Gg: ASbGncunEwPEGqw/rE1clOFu2whq/jpK/Exs2dvH+fsnxhvr3Gi977SAS4b0QQB0iqJ
	QyS+o59w0rO8Lb4Yh2ZtO81AitESBIVtNoUjeAVmDkTvc+ZI37grs7PJxMSrigb5ZuRENx23uRJ
	NMwOXmL9t9YfueU2QxocntX8KUNTgVtqsewkHZKOD+UAtdxtlP2cGgS7lDZ11uPlC73xe05/973
	+j8l/xRQZn/XjcJJuGLBJ0D5IRuUWVbmqU4YkN81Bu3stAZMJb+Cd8JoT7QKB39WsVkS0kcUlpf
	VlfjV3uPnKTIzd3bCzMPbMxDAyE6NP8pjCjcn/LxU5KxUEcqmoZgEA+VmeAi9lJY1uRu0cJZ6Lt
	Rkpk/7Sg48BbxPE+a9o2qLiT2GIEULzh2EELqnzbszItHPkSbWcI132pwxFmXRXze+S3QZSQRtQ
	==
X-Google-Smtp-Source: AGHT+IEVZ6Z6kRbK2/B6B8AOG5votgND2aiK+Fq2TrFsSb/gyiSqAj2GfqraBbQ0O5p8f224y8alHw==
X-Received: by 2002:a05:6000:420a:b0:3e7:5f26:f1f0 with SMTP id ffacd0b85a97d-3e765a13179mr8756668f8f.40.1757859478364;
        Sun, 14 Sep 2025 07:17:58 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e813eb46f3sm7319270f8f.23.2025.09.14.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 07:17:57 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: usb: samsung,exynos-dwc3 add exynos8890 compatible
Date: Sun, 14 Sep 2025 17:17:43 +0300
Message-ID: <20250914141745.2627756-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914141745.2627756-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_071800_425867_FF21AAF2 
X-CRM114-Status: GOOD (  10.51  )
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

Add a compatible for the exynos8890-dwusb3 node. It features the same
clocks and regulators as exynos7, so reuse its compatible.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 6d39e5066..6ecbf53d8 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -21,6 +21,9 @@ properties:
           - samsung,exynos7870-dwusb3
           - samsung,exynos850-dwusb3
           - samsung,exynosautov920-dwusb3
+      - items:
+          - const: samsung,exynos8890-dwusb3
+          - const: samsung,exynos7-dwusb3
       - items:
           - const: samsung,exynos990-dwusb3
           - const: samsung,exynos850-dwusb3
-- 
2.43.0


