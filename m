Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EF9CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pFLLYdbkRgAZWnhHmXH7fo0GfkcQe5REoGIKDLet53o=; b=MlS0g2HLmw6NMZXNNn7PDNRMPu
	1JaKjDX+57Eb8YUZkXdT0rUcgxM554YkUGMh/f8b/GJ2JKhTkft53GAEkI4+/Lz2OHuHkP2hwVqtX
	BWS/Zf4E4OsTvN2DMi9TB9cAlHBzAtn4xDD4hfoaNvWcrKVGKSRhGWfjag6t8iYn45XWOftUjJ/aR
	GzhcB17gsKq8P/Uwc82H+jTRLpuB+gBSQEwjIhV2FslRXSUVbOO1H1b3/uAk+D85Kf3DN6UKK/TUU
	jUquKf6ruUDnmUkXvtIc2RdTS3+Noyc83Gqc4F5f81zthwMkrqMvNoAeyy/IVIQuXf8KlVeQ7CH21
	8nlIHW/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7vGk-0000000BLGn-3Npa;
	Sun, 12 Oct 2025 12:33:46 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7vGh-0000000BLFz-3b2l
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 12:33:45 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b54f55a290cso440639566b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 05:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760272422; x=1760877222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFLLYdbkRgAZWnhHmXH7fo0GfkcQe5REoGIKDLet53o=;
        b=SEQnLyaotrcdkH5RNe5v6W+D+ASEdbxs8zAxjSNla9d2DVmhdbmluYomHR8ZmGxp2e
         p7zA54BwXlfhsOPPzzMcyjcr1RhPyK44wP1SiqApg3quYgiT/YtalR611y9jw3fEcMHa
         aJsGuDsPg7H7e3w9QL0ybV+WSj3ScnZvi1YKxUgfARPUt2mE3PutN6/9PDM2J1bMaCWP
         UVOsPeY9FTiK+qmaHDajkS/17R4ZJ9y2SC23dep5S4ieT+Kb8TAHNKWj+Oqdp5R9Cm++
         KF2wFIIQFxbFevVX8qm3tWZCsUlUEv98Fs+ud2MNPtlN1m8CA5ekpvwAGvYLEGJYg27a
         OX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760272422; x=1760877222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFLLYdbkRgAZWnhHmXH7fo0GfkcQe5REoGIKDLet53o=;
        b=NH3Ep5IkD9o9svCKMizWHvFAAUt6I7kseucZuzSEU7hFhBqm/OTZBg16cJAALTov/H
         3JbsiiVQmJ0UETnqlch98DAqPzFUEcB9VAHOFAB/8EFrGCtgloL4OQWYrtg8QgpFjZWy
         b8WBqk3CHobPoZkhil6vVvItacEQN4lLMfRVuWNyzhb+cuyxDRy2ICvtMDjD+rYfvQLs
         0mva4VSD616JJ1O7iq3bezWVsA5N1GBcDJKurka/kplR9M81fV+aHYwuj/zRw5ER6oax
         4jUcPX6kAv5HOMMTPnIU8XHtH6iqv5fn58UWEGiZaXQC16SxftVKE4klBbfuZidsqNzk
         W6xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqcYAjE+sZ0lFFx1mAMyLR+dhqZ7ttDNvvj/wNO+vFxhPcGBKJbN5yTr45ch6KayTIKVA4dyw30il8RdfCJpIs@lists.infradead.org
X-Gm-Message-State: AOJu0YzFreZNqAlU7tZBntueHbs2Me/lm7UdYykmodjY4UNhANZxiaax
	Ks1rIpD4V2l5N5gHKsiZMcpqFgYHT0gvubyGOOeNVy1UwwWZkySBH5g9
X-Gm-Gg: ASbGncuKWVclA7jcrkbL0FoeBVbhVkWoxIIi/ba0GpAphyEHjxKmfuzfz0dJEK5p2sZ
	rZkFLHZ+pk8BK4XWC4p2Q+v9mNF+Y4pFn4i8eokyPm2HNNT+GNLn2mPb3jZ0dNBd8VNHxl5n/PR
	8wtjTFP8i4CuoApPBiIXFQwt8kVcWKTLDjs5ord+auysnHbDgbeojHgISxdP8/SwkjY8pkG82CF
	mmwXpa9TdaJ1u56isMeEY/drwsqv2umOSCr3YjkeYPhJWg2ZBXTFbJ+1UBUc62MUrAxnqKOXtUd
	kGKO4vqWbcoNe/eNX52K15dMXNaLha08vP3FVchgHsAQf2bimDB7c5hhpk9nP7Zcxwa2Svzb2yh
	TBSCRNACaHwAwv0jMRooH55zHHvvbQ0sTotiHYKI+uXacmmi7Tb5KMlEEdnSR9kjJYaKyVunQMk
	aU
X-Google-Smtp-Source: AGHT+IFAjyDvaV3oWT4PWZK+4NQ4+mKhqPinNjTBXV2nObp2QaUZEx9ZFWF36Ui7VatYnmT32IIKmg==
X-Received: by 2002:a17:906:f989:b0:b57:1f86:b30f with SMTP id a640c23a62f3a-b571f86b72amr448630366b.24.1760272421798;
        Sun, 12 Oct 2025 05:33:41 -0700 (PDT)
Received: from HomePC (89-67-214-154.dynamic.play.pl. [89.67.214.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12a8esm708449266b.42.2025.10.12.05.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 05:33:41 -0700 (PDT)
From: Andrey Leonchikov <andreil499@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: Andrey Leonchikov <andreil499@gmail.com>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Subject: [PATCH v2] arm64: dts: rockchip: Fix PCIe power enable pin for BTT CB2 and Pi2
Date: Sun, 12 Oct 2025 14:33:36 +0200
Message-ID: <20251012123338.344271-1-andreil499@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_053343_899751_BCF9311B 
X-CRM114-Status: GOOD (  10.91  )
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

Fix typo into regulator GPIO definition. With current
 definition - PCIe don't up. Valid definition have on
 "pinctrl" section, "pcie_drv" (gpio4, RK_PB1).

Fixes: bfbc663d2733a ("arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2")
Signed-off-by: Andrey Leonchikov <andreil499@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index 7f578c50b4ad..f74590af7e33 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -120,7 +120,7 @@ vcc3v3_pcie: regulator-vcc3v3-pcie {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc3v3_pcie";
 		enable-active-high;
-		gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
+		gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_drv>;
 		regulator-always-on;
-- 
2.51.0


