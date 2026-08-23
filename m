Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1F9C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 23:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xlY+RMZdBnQ74zf8vY3yLEI4IPGDkLn/SUP8M0vfoHk=; b=naMXti4zz+NJ13jKn0TmAVwKH6
	0HAIaF/quIFdhv4sJqGslf4InQYauZk8c87OiOIrWxOvAmLHIcAoqx0kkm8UAkgZUzzl6y8TFG4Dl
	7UFZ4BSgPmzsRfbsZV0LKIvfuXOLKgW3xYB03587wNZNV3U+XXhvQbxurlKTwR9zp0Jb16F8CD3Vm
	uHtU9GIDDP5QbZqUO1z0JUx/XiQhEK6I5pjfPJfHQLI+cLde/TnIW9tI+AFoMOT/4z+bA0UA7bdVa
	CY/CRKlNDguF529ylblE2iDusDOdl3u3VXaErMjAarslB+XAr/QZ5Udcqu6P7fzUdrlUDlfc+r/Dt
	GCngoZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyI3e-0000000FhGd-0UIR;
	Sun, 23 Aug 2026 23:56:58 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyI3b-0000000FhGJ-22yV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 23:56:56 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so1763558a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 16:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529415; x=1788134215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xlY+RMZdBnQ74zf8vY3yLEI4IPGDkLn/SUP8M0vfoHk=;
        b=Jnk3Sj6thsT918V3qyM0SaeiZjozg4Jy85CxeJk4L0N9v7un7HAN1VizNTtQlP4SVZ
         hIvyqkgqFYNdtqB9a1oy+jAuVjsy3gPDyDlteTv0kNFRhR9VZu+hhI9pDxrxmfvZkpYJ
         HYM0okOA1IsL2mn7MBIDY7ZtJumCwz/iHzc4IpzeycPqKvwRmYLX8jHg6KhV9cONORYO
         y/tOJ3gec0dYj6SwsrPJDl2eEusHTfSOaRj0Y2FK+1oJsu1dPBvu/FUQm0rJaGSyIz00
         K6+vUf6YzrzeJoI60H5+I0U4gyvarYn86cNxkq7SbzQqQzLVkIKE20XT0E8uK2HvNnkJ
         z+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529415; x=1788134215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xlY+RMZdBnQ74zf8vY3yLEI4IPGDkLn/SUP8M0vfoHk=;
        b=PoNKnz0Q6i6i7b9kREw4tDrlAwzOIIPb78ktn1QMcETsY/kEztoOCf5RfZRJneRRkc
         Kyi90EAahsNlRy5F+Hq5onjbmal6FdjePbH0Vc/Lg2cJaflGlxI8ZIkT2u9f9bLeV3Dm
         jIBEYedN3EvasujiQ5xjvEi//yKPcrTsTv/9VGdeBnwxFrfUUh2WZYGVN9+0BJmiKZlx
         Mzkf1mnYxz/tLF9Tfs5W8nNUpl85kIbXz9oX8w9245Og9wM5rJKpTnz+kY9dD4tC1Q1D
         0S5tedpQwchFUvGLKLpWR6XlvPLEoSy1ue773eTI0RuAsqMWXTTf3BTJVd4v42gQ0dy1
         Weqg==
X-Forwarded-Encrypted: i=1; AHgh+Rqx8ti/f3cdTKCznIM7h9HhBGUCAmeDl7vtN2BZ5yLB93pu4u6zmBD0lcC1FXdJp9Awq7YQd9j1WUMFC3caF9ZT@lists.infradead.org
X-Gm-Message-State: AFuF++lh+1jfbx4Q+wDpCQkbFBIzKwf8QiaG9ESzQ7KGskyHi4SqI8tr
	rh3LbCT0rzlCZPrIOkdhKar/u2FmXpp2X+J3lYRPf6xoZ+LUm+tT5Qnd
X-Gm-Gg: AR+sD12b/nEKjYA8ZMHsmBPY6jl49O7XPqm83NVAbu+6Gjrfmt3wiEuXAlpLxaaIUud
	HjvCKbsZJYnx4AzLWyb4UgVF12tpBC8C7oUCt40qHBLyfU4N0Y8CG/eZui4qOz7WIh4A10BtVax
	nFlQONm1W0ZPQBOR8T6NMCtAFILhRCnXBZdgbKqnmr0TmMA37y35qlLPcI8f60hhyZ/tlK4ktrn
	ajeSi5W0TnWnJX6+pseksWoNsbOayb4Pv9o7FGeHVIGUpDw/eN/zBqzfSirYxwDLAAe6HzZ452S
	f2SqfPZJRee8SLXGpSaO0V+lzhw4UC7Ba6GF1JhjCoiJ6OF7/5KJAmAfQZ5n8kMrvdDlGkbZ4fY
	iiUjGnOIiVCcAbcJlExqEMg6dG8+CfUycfwhGmiET8Rkqy4C5a6Zvm7WE8FYetTCYCVJUxisd5r
	YbWBWSSxBdQS9TN++qIxsshOxkStlzu+JwaJcnS4ubh7t1Sp32yqLcCgwP2vsf3gNpUqMtlBDVL
	1630dc1znWYubNKTS/ykx7PO78i7bSy/L53s/NMPM/wGb9Wm/UdgRe3mratXz6+sa91nvljx5Jg
	BSz8dxT1LII0OwyCAhK6JH22BpaGlzgTk5PcfA==
X-Received: by 2002:a17:90b:5288:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-395c3368e30mr43320247a91.4.1787529414679;
        Sun, 23 Aug 2026 16:56:54 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c9174be7sm3460508a91.3.2026.08.23.16.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:56:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 38x
Date: Sun, 23 Aug 2026 16:56:52 -0700
Message-ID: <20260823235652.77997-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_165655_529390_D2376E37 
X-CRM114-Status: GOOD (  10.44  )
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

The marvell,armada-380-sdhci binding requires clock-names, but the
Armada 38x SDHCI node only carries an unnamed clock reference.
Add the missing clock name so the node passes schema validation.

Fixes: 6eccc52b448e ("ARM: mvebu: enable the SDHCI interface on Armada 385")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-38x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-38x.dtsi b/arch/arm/boot/dts/marvell/armada-38x.dtsi
index 1155bee20523..598022645dd2 100644
--- a/arch/arm/boot/dts/marvell/armada-38x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-38x.dtsi
@@ -627,6 +627,7 @@ sdhci: mmc@d8000 {
 					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
+				clock-names = "io";
 				mrvl,clk-delay-cycles = <0x1F>;
 				status = "disabled";
 			};
-- 
2.55.0


