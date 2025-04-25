Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2C65C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5BStf2B2YQIkpsSwlraZoA+xWmc7cTuqT4BqqOX+71k=; b=0bbTQhXoOB/2l2eATbuNIJcDMG
	x2OBR7tbTWm09OU/neXFOyEUlatZGxadDS/AhKjIi3o2rTocn3BNh2DHwUuLVUB5GwJK3pmo7wgjo
	IdOWz3MIa9mSL61xTlRuAxWyDKTg4de4HZwbRt5EtERLb3mIl0hzi/+XPGNtSmJxvljhUUtc2tbf6
	rD8nm7RJEh6f+bY2sMlZMw0SLDcckZ1fegFyndCDwQh+/zjbNGicmbBQMM27/edW4VPHvO7Trysos
	OEvup5da17KAQGgyHrPX/UyvGmnH9MZIuUbzXykGFlUnjD4p9bqODVVvaMDaYLDyjocxUskiFF5f6
	JxLVmDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Jz2-0000000HQfu-34GX;
	Fri, 25 Apr 2025 14:24:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J6K-0000000HHFw-0A7k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:28:21 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3085f827538so2953102a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587699; x=1746192499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5BStf2B2YQIkpsSwlraZoA+xWmc7cTuqT4BqqOX+71k=;
        b=Td1AkUEFFTelCIOOcCo4GK2IdQNQi3W2R3iA2tBiz1ywtCL7r/jtGL8G8Zvy0VGDJw
         SdH7iHnXlEtwkcAblNbPEAk08+BbxpeotO7J6h0DL72to/6SLNXfrRwVekL8Ovs7pbx0
         Jt0DThEgdpKn0V44Vu326PkYKQ4BSt/uWIjKjeCoRT7aAKuNCjU7h1KhP0N9a9CFus+N
         aXCVl/xmHeAvwPWmyu02HLePPqEd749sc/M8sEyjIqEoyiz11ww/hp2YlRVwCqNFD9qs
         ibdT73f+++cd5e6j3sYcWUYwOAZhvQRfvUspYjoF2UJwajhp8AeYCgXVEpzRgM6QQaAU
         I1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587699; x=1746192499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BStf2B2YQIkpsSwlraZoA+xWmc7cTuqT4BqqOX+71k=;
        b=L+bZO52/IPGbWHQOyCEHGf+HMjOfMU4k6p+nVPtlWudk6fOX/1HLJCEB5v8LiIeyns
         T5sCXq3jjV7Voy0Kvlb+9EODnsATy1jPdr+6BaSguARRzNJZtF7BmaRpIKtNbYEK1ohf
         LOZ5jQspo650TcagSL0Q2LBo0QO9dRLNH9FcOranThYLS5oHmNXZ28XHuCH9/SvT4yDM
         dj0c3Mz+JSEcS2BPBseYaMZeIxzEAuB0wGl6eBNm7O//YvnBh+lcSgyCEOekAR5oRAcB
         P2eL8JExGRUj1lzbnzZIxMFVNE+HrIFisiChsds6duOWmweNV+bN5RDPRZwllYFLykdL
         9txA==
X-Forwarded-Encrypted: i=1; AJvYcCV0NhrjxoJOGv7UvVPUQXErcZomVuVcC5XNp8gLI2+TgO68T+LShQQg9eNpK7IETAH927nVG7Kg7gcLDTakcO9Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzViwNnc75S3/c86PGKUArPg9rQbWq/VgDRhu3awBYZzpFUbH92
	TmiODQTJgORo9sIZvdrR7pQ9uGFtWvP59dUnWtvrnYjmjcXj+q9u
X-Gm-Gg: ASbGncvNfB/jc4vY1E7jdq//OMTcXu2hYBTLr4La6HbJ0mIFX9/hXUUDGSOYnJ8B3WX
	31Y1BDeNmfnON1SJO7s1/zOK+UZcbMLC1+SrL4DBhgwxo4E8xdY0MjL4wYiEURKpiw4/V5MlZiL
	5LemYtschEgfs+/agyYxhy/Ho8MuzzlNQDU7LwrMqAORbLFlL+quk6X0EAQyQkG6rIACA2qTyc9
	n5aOBIUnPqCz6x1WJJKBvonrmkUFmoCJPIjOyrMEmxwH5H2wMXbS5X8vAhuALBiQtlrwfH0Foo3
	pp+bjdoFTKMvf7tIAMbHr+kncUL1vMuP6zVhHhP2knnkvzdCAMmHiw==
X-Google-Smtp-Source: AGHT+IHNbZ4dO+ZOM7YR+TEwVLncwixry2Elrer6mAYvyb7wsMkO+wjPEKzwaZPQab15oKKKnw+caw==
X-Received: by 2002:a17:90b:3d45:b0:309:f53c:b0a0 with SMTP id 98e67ed59e1d1-309f7e6e981mr3907957a91.24.1745587698929;
        Fri, 25 Apr 2025 06:28:18 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:18 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 04/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 Midas
Date: Fri, 25 Apr 2025 18:56:24 +0530
Message-ID: <20250425132727.5160-5-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062820_082623_405544D0 
X-CRM114-Status: GOOD (  14.87  )
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

The MAX77686A includes a crystal driver with an external load capacitance.
When enabled, the crystal driver starts in low power mode. The
LowJitterMode bit controls the crystal driver, allowing it to switch
between low power mode and low jitter mode (high power mode).
Setting the LowJitterMode bit to 1 activates low jitter mode on
three channels simultaneously. These three 32khz buffer outputs
(32KHAP, 32KHCP, P32KH) are independently enabled/disabled over I2C.

The 32khz_ap output is typically routed to the AP Processor, while the
32khz_cp and 32khz_pmic outputs are intended for BT, WLAN, BB,
or peripheral chipsets.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
index 3d5aace668dc..ad2c7ebfdc41 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-midas.dtsi
@@ -729,6 +729,13 @@ max77686: pmic@9 {
 		reg = <0x09>;
 		#clock-cells = <1>;
 
+		max77686_osc: clocks {
+			compatible = "max77686-rtc";
+			#clock-cells = <1>;
+			clock-output-names = "32khz_ap",
+				"32khz_cp", "32khz_pmic";
+		};
+
 		voltage-regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "VALIVE_1.0V_AP";
-- 
2.49.0


