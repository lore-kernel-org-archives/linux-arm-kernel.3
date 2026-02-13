Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3744EDF172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 15:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gh3/sxP/uDYO1xSje3R4BHnBwgGY2HD14S5Y+6zJzX0=; b=og6w6sfUbl+gzpAWhUyAdFXpot
	NGOQCRH+WoTe58u/WRw1XYRP2ggX1Uy10XZGU3JiHwhOt5EdIV1ne2GrLJLPt3/LYxwekj6dJaokQ
	qyeruM5fIW0AR78etBHOe7St+DdNd6vkAbpEQf36Ju1lkNUrkSxfVKeHvCKwSbmfnHOQYTzcvqp8r
	5nc4rNerayVfgsWiqcowWhvn2iDmN+vrGpBsFDJLYYZgIFQXHbcuuwYVoPHKA9J6CygB+kyVlzUhz
	yrHE1FV8GBN1LzvBvaJxd7Xi12XBe8Jj6gVXyBNDimaw+IHMiqXG33/gT6OMmDNyNZ6Oq5w3vmeVd
	yxzUEI6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqus7-00000003bFs-0Lwk;
	Fri, 13 Feb 2026 15:14:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqus4-00000003bF5-1fQA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 15:14:17 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48375f1defeso4893075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 07:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770995654; x=1771600454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gh3/sxP/uDYO1xSje3R4BHnBwgGY2HD14S5Y+6zJzX0=;
        b=CEOoBicarcur28nVKanq9nU0gX+IVrKQy3fRG0YFeZDbGvMgge1AwB0wzkowKZHP3j
         /hVk6D/Ki2vnposiwcUD7qjD7tQcbatIQkUfWl+qaR7JqV1fQvZn46tROIdtBI0R6TZr
         1Kr/qEIPffMvBHZTWccSi0poerUzjAg8T7S2noGjImBMGjz+jmmU2B9K+KX8J9JdGxrQ
         vOEbZ8XjtRvy7/qIxNEOFM7ym5Iezlsvy0+uccn7dumAWpsvQ910K/li7ElM3Mfikh+x
         /yL7ZaKwKyyL0S6RU/dE7aBscPniDk89e99YODdTwMdjIFZPX8Y8Ijq+91Fb9184kRSo
         Y8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770995654; x=1771600454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gh3/sxP/uDYO1xSje3R4BHnBwgGY2HD14S5Y+6zJzX0=;
        b=v/2BVe2HThTJbpScmReFNW+QE1LNJa/Ea+zSliL9QTG323LEBL/O6kGOd9rEtzZ3Pa
         9YCFnWlEGoxvu3kyh6cftaOQizHSkxY3KNKjAJtLxI8H/p1IBnQPbHXRCPvKqknrlcdx
         2jPCy7wiT6XVhFxOLfM0K7bW9bHarYTQwBuY8i6+j+2GL3RtnpiLNwrUm+0EZv3GJw/v
         /jqNswuop6+uM/vw0reE9EDZnH1h+bKOSgzjTC7S++IQErF8y4ds/avetpMexvUj8YSG
         Ws9C+WjWMRVkGlfwsZ56LVV2Jf129BAHR4RNDe9l4hL9U7xAPsvUil4KA7U5zDc6F0Gp
         rvAQ==
X-Gm-Message-State: AOJu0YwYB+FzG4kqFo8+U473MJ9ZVkUYCwkYzVu8ZKlt/7ZWyeYWYX/V
	UdJLcdJ4B6pl93ej7EJvC7cVczs9mrr8CZbFASmPgmDmjJjPept5KvDx
X-Gm-Gg: AZuq6aLK8FlooEluVvtVhIDP2TGrb7b+xEnQeULilNUN/nYQwH0BUmuUm6/XGVST4Ko
	fM8vACkdd1kBYJRELTKHr+I6MyxTnfPRWm+fgc6xC8/sYSoaYDWGaITu/RCIhYm46UwHWchl1VH
	TfIL8xxx1yPqnPgaS8ZLhluw7clqKCGTusLu4Ma1A8z8SVoo2ofwhuLQ9tp2j1HDjWyR9440iFX
	AukLugFd+O3yq0Oq1AgjpwwcsnV7U5tFc5frYZtAWGMDky9aayT2KMDwMKkMhV3rtvZLrvLJchS
	4J6PJWNgpbzXIoQgAcKjIPjLMHvQG4ZyWkI1APpESFUmX6fFaBCW4P15P7gHHg/4uJhHNRPwsBB
	x9L3w0RMm9aMSijk9KuzbGjE1v+OZgUtaoKTNiFcCl5CummjvEW5R5/PeHmyTNI02XT2iOaitAd
	VnVqWvCWZUdBYhANnAYWGcHhw=
X-Received: by 2002:a05:600c:4fc8:b0:471:14b1:da13 with SMTP id 5b1f17b1804b1-48373a1b6aamr36437785e9.14.1770995653549;
        Fri, 13 Feb 2026 07:14:13 -0800 (PST)
Received: from debian.lan ([2001:861:3f10:3c80:ba7a:d401:2221:cd75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d77b3sm296160035e9.2.2026.02.13.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 07:14:12 -0800 (PST)
From: MidG971 <midgy971@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jonas@kwiboo.se,
	MidG971 <midgy971@gmail.com>,
	Claude <noreply@anthropic.com>
Subject: [PATCH] arm64: dts: rockchip: rock-3b: Add phy-supply to pcie30phy
Date: Fri, 13 Feb 2026 16:14:52 +0100
Message-Id: <20260213151452.535527-1-midgy971@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_071416_450637_BABF7086 
X-CRM114-Status: GOOD (  10.35  )
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

The PCIe 3.0 PHY requires its power supply regulator to be enabled
before initialization. Without the phy-supply property, the PHY
driver does not ensure the regulator is enabled, causing SRAM
initialization to timeout with "lock failed" errors:

  phy phy-fe8c0000.phy.1: phy poweron failed --> -110
  rockchip-snps-pcie3-phy fe8c0000.phy: PCIe3PHY lock failed 0x6890000
  rockchip-pcie fe280000.pcie: phy init failed: -110

This results in NVMe devices in the M.2 slot not being detected.

Add phy-supply referencing vcc3v3_pi6c_03 regulator (which controls
the PI6C PCIe clock generator power via GPIO0_D4) to ensure proper
power sequencing during PHY initialization.

Fixes: 846ef7748fa9 ("arm64: dts: rockchip: Add Radxa ROCK 3B")
Signed-off-by: MidG971 <midgy971@gmail.com>
Co-developed-by: Claude <noreply@anthropic.com>
Signed-off-by: Claude <noreply@anthropic.com>
---
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
index c5f67dd6dfd9..a1b2c3d4e5f6 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
@@ -404,6 +404,7 @@ &pcie2x1 {
 };

 &pcie30phy {
+	phy-supply = <&vcc3v3_pi6c_03>;
 	status = "okay";
 };

--
2.39.5

