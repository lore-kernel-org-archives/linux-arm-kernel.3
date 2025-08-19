Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE2BCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ul4oZAmMUIisCohsZ+bnfu1tIYQt4ZmQITM62Hcbbp0=; b=U2kE9MFeEGtk/CdvMzNBmAxszZ
	YSPY5HHWpnldi2u2EGHaPCvBWoqxzHrIhAgKBA5r2tgaEtdvAOUUebrNVq5ESnifxSE7asIuFEiDg
	xWM78I6yiIzVLKkgF79LS/71/kGrfZJZAmVYhywReICEI3+n48StRGuDk8m6pq/4gpj+DbhSYaxYH
	WLBFKErPDq87nYWMuPpIOphvMALYg+CzVgWNhjDQ+f9mEM/q+E9PDLQpNOeSuPS8Yl5VQOjWq1zXV
	+Y8H73saFovtqblpD7dvtmhTDJTkRwRLsZNSKJLWKtrfhWHFv/jQR1gjLh+XC/hl3DBccsAJZy487
	N9cQKIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQpn-0000000BCLd-2A3r;
	Tue, 19 Aug 2025 18:13:23 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoMD3-0000000AZFk-2xpc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 13:17:06 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-afcb78d5e13so83979866b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609424; x=1756214224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ul4oZAmMUIisCohsZ+bnfu1tIYQt4ZmQITM62Hcbbp0=;
        b=bxDgeSm1By0J86VFEJsZI1vBA+MHHUF6cFMBUL6nihZDTZ88zAD7E8V4R/g4FByRLC
         jQRurmFsxX+j18A7Mjd/mzwyAnlxyXP337TeP18Cnq755x/utgQzkqVqn8/Khr00rPlE
         Tx5e/s3S9rAlKh9KeOhBi+Oi7crmbAP5nP6Y2vTlOJE+Dp+KY4qN1WuEoA965YCk0hmx
         /WUO36KQPzyoebYzpRcU9tV0jyWiHS3ssd1hYqoWPAKt6aZs+R/bTwpWVoaY1EiDVNJB
         laKKKeAmxTMdDiIXt+G/nmTCrHez90W/YAfsdHMzfc+NaKhW4sVy/G/kZRIRVzFAhe/2
         gthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609424; x=1756214224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ul4oZAmMUIisCohsZ+bnfu1tIYQt4ZmQITM62Hcbbp0=;
        b=CeFz+XxNmIg5XoJGUQAq3Igj7NVToBr4zK1DFrmt8UpSD0MdbeJ/fQQBePYWCtIM4b
         6OurWriJI0uHWV3BLkqw21ewCPwmARnggSj3oSMchoKvHhttzWENhsDcOaV+u/4ZjL7x
         6daeZ22IKC+ndtZEykQ5M4IkILQqlEuKlzBxAd44koqtGAUmOmztM1GJo1gZb0oE5lH2
         /2735JyipUaerYztSu4B2V5HKMLaDrxLHD8GPZOqxPudazZaK/+YibH9OVPCLbkiKqC3
         n6zkgwUjFiirSb6dWtmQbF4h/avJpJzPyx10DWy/fqmvVo/y828bb0GJVu8T0EwA5qxh
         kVjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiqGGhrudD+7CosUfP6tJ1TjYNOAi8mnPp4UJLX/PA9/yV3r6uXRglrXbttukVHasl5bveEJAldAf6Z4dGQv7q@lists.infradead.org
X-Gm-Message-State: AOJu0YxjB2IB8YIqhdvzpRI45eQ5gxmwTxJHXst6evNVIQ/qnwCuvryN
	hO7JAeN/o310Z0sQq5Nmoxr43/b4+9ls/LL7yH05AnvnvxtBjsqKOmy5FLpmIzCvw2I=
X-Gm-Gg: ASbGncugK7bUiBk/GggMhbKHVLQHOqhIaT/ieqmTBRmx/2bnBF1f+XF5VOcnGBhHcvn
	gd6VMjJcChKB9it99s7yv5WH9mXioqhVTqNn4k1Mmw9TlTU3D1w+FvH6efbp9x5QiLPtBKFj9sf
	Jvh7AyAPH2O3nCPWg6AptJKy8EytfKBkHyoE1FhOJ8cYu4aq2PFVCo2WtJomIUR7Pl0FDKl9eu2
	U+0srYwiv+QnD2DiEiN2o4fPJIT7M/RygGBHYWks8/xV3jFMRIzgM/NlC1rTZ6UzBU/Ax3Warp0
	KI5/q0J7Z6ody0ppiC1dkPOVFdTqMmx8l4hc1DuzuQXjrtAIjH/4GDhGiWgmCqa/+yRCL43ZB2i
	+VD4EKydx7beYLSlbfC3+YkZ4f070hJdEzaOiW095e5Yz
X-Google-Smtp-Source: AGHT+IHIEZ0cqAuQ9z2NxnVy2zmkSoGqZVpGMt4PSnkN+/AzbQ7kBspgtZUPvFrM+aYznnjNvgIxIQ==
X-Received: by 2002:a17:907:3d03:b0:ae3:617a:c52 with SMTP id a640c23a62f3a-afddcb63ca0mr100010466b.2.1755609423877;
        Tue, 19 Aug 2025 06:17:03 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccea7sm1005948066b.67.2025.08.19.06.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:17:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: dts: ti: k3-am6548: Minor whitespace cleanup
Date: Tue, 19 Aug 2025 15:16:55 +0200
Message-ID: <20250819131651.86569-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
References: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=741; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ORjrWSJV9aCCGAusfNEVPPkAuUkckxWAi/ugZ/Z4HPI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlGHslltHets9pe9QRd/Nka4ehFvGyWO1fzw
 3Crv5EMFQmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5RgAKCRDBN2bmhouD
 1xnzEACSo5uaWhdcpZ3vxl4F+ufrZhnxwghg1RpSkqDbNjA14v/O14NJ0BplGA1kN9H6teg0/tD
 45eZc5/jrsjOU2ePK4/mzmrVErEppjEpBNeiWcPc67j5nPnt2RZOeJEDoFNq+/QPZB56FRbVooT
 8jVo6FZiqWhTRQDrDBasWAvXwW2J+vY3KmturJdMyvmaTUlvE3jS+vS36IqXmXbH/ZJ3wvmMK9m
 No3A9cORAdHIkilGC/8fh5lo2Ss2IUPbhGOQptgHDdGUimDF9S4piGtE3ZUCGX1RA8LzSD+wE5K
 rsc+TbXc1scsxMYLhEgb/cKHNLWKg6eIFZcCcp7HSEHLPBBf26kFQAryE1O8xglgrC0TkY08dHS
 csk8/K3o2iOkIA+nEF3ynmMLPTYj9a917Qvtfoq0XbVZMzQ50wDpj7EdWcded7k97bPrb5iQw/j
 mL8M20Cs795m35cCeBdFKtBwgeqPVs/HTfUgN8LAQYbPFOtzb0ixnuJppGmzeKobrUT/tFIeCQA
 IxdroEfyAMgsQyru3AGY20HMh4Okr9J43LRAYPrHMChOJ/TssH5/shCRQxX9ZV3wc9M88LQvZbv
 uWW8cDEiUGIJx7MhidAnsqA/6WAKyXN39bFNt62VNYMVWZxHmwVbf+nYllcHCN6pjShEEVuPnzN Mcg5heNDUIFaX8A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_061705_765486_F6009A39 
X-CRM114-Status: GOOD (  12.13  )
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

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
index b829f4bcab69..adf4da7dfa2d 100644
--- a/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am6548-iot2050-advanced-sm.dts
@@ -145,7 +145,7 @@ &main_spi0 {
 	pinctrl-0 = <&main_spi0_pins>;
 
 	#address-cells = <1>;
-	#size-cells= <0>;
+	#size-cells = <0>;
 };
 
 &mcu_spi0 {
-- 
2.48.1


