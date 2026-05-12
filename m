Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4B7CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4BQTc4T1OOXSNZ2RCg5v8h0CYbT+t3RxhIuDD3tfTiA=; b=0h1rE+7874cO/Qk2t+cJ7S1OV0
	n3xyCLjVTEZgmL4Xm04Xob6yUbHe5HSpeNaj2FlrrAnkq3yMbxgg15xvqA0oY+pj2jZxaOJkTHhIY
	LLxqz90LqcPqaJ32P0N2s5WfbzWYcln59yGlhNBngfwb5t2/fntJMB9sMg3587tKwv2xp5MOLCKcU
	uZfLeQbYFH4f6ZZ8NVBeePxBwriIfRbbnt5/b7f+Ns3eG4IV53hJw6mUet31cqVFLN6iH9J51O6Hd
	5xrk9ymUhTEB4EWwiqHBRZb3wp11VGSWsjswSCa+3yRZ4MIe4GkiNncdAA+SQyKmNtr1MacBzlRP7
	z5dyh05A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjMX-0000000GFi2-3HF0;
	Tue, 12 May 2026 09:25:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMjMV-0000000GFh2-1mYq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:25:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso32363325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 02:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778577909; x=1779182709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4BQTc4T1OOXSNZ2RCg5v8h0CYbT+t3RxhIuDD3tfTiA=;
        b=XZEZQIPneSOFQWA6YTtaeQiRM1jQBolmLZjdVbjVg27f+3RiFGebUla/IpkyWgGJIR
         UjoybhjNBMKVoB6U4N9IyfZJpWf2kXKKQ/+BxVdUYo8iCLQ7UCsRAFc7vWpOMh5PN3et
         KsuFXq6Fq/OAA0gOq0hOdr6OUAvyB2/mINqUEJX+5PjsTkIx+HTo+LwwlPRl8eeBW5FF
         oKlrLRgmWgiIljPr5hPucwiGi7reh3sdOr1gyf6XSN/N0j24IBRIq0BdyFgnqTBzeAex
         fD/vwevP3gx2+ymC/ZN+8w3Z7dbsuYKDUaqruD7EjLkPbWIsKABtQSfiDtgKWivM/DuV
         c+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778577909; x=1779182709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4BQTc4T1OOXSNZ2RCg5v8h0CYbT+t3RxhIuDD3tfTiA=;
        b=iHF1MmGmV0Qc82jdmxt9PBVA9qDVXitv+9Op4NJ1dFHomW1thR+2fDqqw4axo1M7vv
         EVM1AjgwB8k4noba13+d+u9LHnib1A2berByYnoyelptVpFkF8eU7F3Ut3cCsbD8yPke
         S9RelqAqB7xIcDD0rectxgqLNy+o4ZfpwKYzt/9ZPKtsWzKQwSUEB4x147yhnzgnuUlq
         mtFLDxRoNdSEmPusFWrd/4X6qMexKDg0f5gWeBMdt9i+XSkhhbBMB8BhD+ZplVZZymGW
         kmAjrdV7GenmsPu1f4zMrUZWfYkWzEiMgsJApX8rIr0hiVSFYxYFaxC6NXJtDt3FJcwT
         v6zw==
X-Forwarded-Encrypted: i=1; AFNElJ+g+RSjFSfJG9VcsNVlib2S9R86PKbOsZgjKaZ40B15b+tYBHb4u5FObEuVJdyuRzuCq3sFaaJhu9nsQpqvOEZQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9sho6zUOkmzemJut+msYBZrFDVqjVLNxqBE1SFyCuTQdYNdxw
	Adv5bL//zhCSj35UhT/Fe/o+/s4A4rRhFZjiJaQWTrbTMikCqVXDYDWB
X-Gm-Gg: Acq92OHt+xpgvw93eKgC9gLPFp2hkao6gqlJr7+XgoUN4PbdBcPrk97SJCmvfIXmlAR
	GiVVA+CoSBPwLy7FT04UPvBvbxfLE+mZzeyY0jO6LZylXuOFRRDGSOdYz/t//nafAqmZvpeWH3M
	oE12PtFwjhxjjqf3NVu22c6BWKNszG4xoWkXQGmdETytR/ppWfxjwSaH2zh1N86n7Qg7NJhpP7o
	7yn76a+M6DS9FzhMgLXygbONzRov6mz4NEApGK648hGzbHQ1O1rqaR03YHq7Z7MDHT0CKuB9Shg
	94GJEie0WSYsmuTFW8lbNKm+onA/DJvQ6DBhRikLrqKJWSzV2JkcA0IyXam+pOyMKC8OL/U8XaJ
	OIDqCcTznQPgVLw5ugMqeUckW7e3ZnyCKWF/Tv6kjldGqHpq0rUdOwyj/N2BdYM9lHkLjMoxiVy
	c+YKPO8xHK6LKJORDAOca5xUuyHZjQX0IYyInF2Y9goPlJdi6vQAy+UV5VhakaouZintMam7XD4
	GNPuKzAW7P8z5QtUxd5cJ+Z1t3YIdLRbW2F9AH18exr
X-Received: by 2002:a05:600c:4686:b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-48e676b6882mr288356675e9.26.1778577908947;
        Tue, 12 May 2026 02:25:08 -0700 (PDT)
Received: from thinkpad-l14-ju.lan (ip092042140082.rev.nessus.at. [92.42.140.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e904bf792sm59883195e9.0.2026.05.12.02.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 02:25:08 -0700 (PDT)
From: Jakob Unterwurzacher <jakobunt@gmail.com>
X-Google-Original-From: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
Cc: stable@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: fix emmc reset polarity on px30-cobra
Date: Tue, 12 May 2026 11:22:09 +0200
Message-ID: <20260512092225.34835-1-jakob.unterwurzacher@cherry.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_022511_478896_5BA4E3B4 
X-CRM114-Status: GOOD (  13.62  )
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

Technically, the reset signal is active low - it's called RST_n after all.

But it is ignored completely unless RST_n_FUNCTION=1 (byte 162 in extcsd)
is set in the emmc. It is 0 per default.

For emmcs that have RST_n_FUNCTION=1 we failed like this:

	[    3.074480] mmc1: Failed to initialize a non-removable card

With this change they work normally.

Cc: stable@vger.kernel.org
Fixes: bb510ddc9d3e ("arm64: dts: rockchip: add px30-cobra base dtsi and board variants")
Signed-off-by: Jakob Unterwurzacher <jakob.unterwurzacher@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
index b7e669d8ba4d..90751b04f95c 100644
--- a/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
@@ -35,7 +35,7 @@ emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		pinctrl-0 = <&emmc_reset>;
 		pinctrl-names = "default";
-		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio1 RK_PB3 GPIO_ACTIVE_LOW>;
 	};
 
 	gpio-leds {
-- 
2.47.3


