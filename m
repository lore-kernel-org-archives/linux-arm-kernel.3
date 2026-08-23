Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4424C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 23:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0hm8ObTDYhg+E35jyHJqZ0AtNesOQLYncxuZuX+5HSg=; b=d6OIoRlJWNCKbFCfr0gdHV0egZ
	RFXAW4F5xrFu4DWDQ2u2uh5+VWTZJ2IXnjVwz85ZfN9RKWEH+IIm9w3GArb97UmXvK7WNiUy5g7Oe
	WMvwV3xP7/8imvlcNGn0E9xhED+jps4RhYJQ+aDFHv5l10DF2i5VaGx+QxaJHOKHLPDaBVh2t40VP
	DaYDL/YNfrx6wI6lRr/wQyycK0wMx4cX1ByX+7fMOa4Ct+WnQhFfQ4Xb3CUTuwH+aQJMAMi2eB7uf
	Ev27Nf39bfCkjgRASjdHSfFyOYI0UpQSwZMbbXBbkd9tKq36/4U7Sb8MnpJ1t+sw5xRdp8/03gikk
	9jFNnp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyI30-0000000FhCb-3oSR;
	Sun, 23 Aug 2026 23:56:18 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyI2x-0000000FhCJ-42Hj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 23:56:17 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3900e39d935so2833099a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 16:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529375; x=1788134175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0hm8ObTDYhg+E35jyHJqZ0AtNesOQLYncxuZuX+5HSg=;
        b=INXooWZaGJk6Eyzepm+Sc/QkKhqwyl5YN1UtkIsypGhmo6/JlRT/vtKsSYEU55vV5G
         XntHSpqviTPYroDUfNIQ07t58Fe5tOTACfLX40X9VK2wMgN76EatKl0Aiu4c/Kv91iUy
         SYRiWkrUmHSVXCz5jbEyf2fMoWz53ujWsWNpFnXgcv2O8FLGqPMPOOg163hSD+w9HvbZ
         IEclSm12wNGtd5WbLSeOtoj9U/paPo89V+Du2Y8SunHXZEBykenf1BYh4ZxCzYnvIACn
         ysC1WQuvlCzVBTToKi0Baxw1/w8BtFUe1lPkyuPLumAsnSdbnc2L2WzGTGxA3VXpkSBh
         4Xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529375; x=1788134175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0hm8ObTDYhg+E35jyHJqZ0AtNesOQLYncxuZuX+5HSg=;
        b=suQq5FB9J6QfUE2+37YXFByCW/4NOHHqHTHU1JbH3T81ds1bjHOJiF+R5/7urS+82O
         07KZ5k+1PYYlj/RpcvPxlfM+MSoGiFffj5+g9ung09TNCBP3vYVICrc3sU6MMwI7eAGT
         IGSb2olafURL1gQEis4BECKALd0hqubsebovYvQI76itKpcav2zIp42E+aH7A6CAyGmQ
         DkBa4eL/QV1EIuwXYqkuExdjv76/HVr7VrxgXXzly762ksbrXqAkp67wbtjRx6gQXdbd
         rO75wU/hhGuwdon57x0iFxnuP3iaScNwvvg5rJBqdYL0lStFzqG5yntJtopaFc7yeS/o
         M4GQ==
X-Forwarded-Encrypted: i=1; AHgh+RptsouarpzjVq6H0UndpKw0pQeH1e/pDERMlxa6fL82ENRc5wr3qzd194g102wSNYTMOVWN2jSg1RokMXZHJuht@lists.infradead.org
X-Gm-Message-State: AFuF++nuURM22dXk4J3xZlFE2Oh8aaatzlM8J9jU6mIHCNg1wdS2R0+2
	xNUxeDfZk6HTL1U9D66RaqyGRzBuNYhvuiKNg6EOfyqUbx8/aQrt6K8M
X-Gm-Gg: AR+sD11+/Frwcn63fqiXluSQSjlNY4P/0EGvqbgrVBBwTrniDdPQQ/vikgHWUxLFGzW
	SjC2Z7qUgGSoPFVcGyYpp4zHtM4bqdpDQMBiwL6FlVDY3r/z80IC1Vy7MwYlmzGYvrlcgRUywEQ
	GP/AfZ/mFD1mt7ImbHGdlmw0eqh3gZwfLEZdpYXxxk/ZETwziLOkY1imiNPvRVbvkjFLGmt7QYp
	kwxFXiIe7oZp02xDPNTkwa6hmeisX3xPnRMwMAzsfwlfR5UdHdOsfP07Jgx8/pM74uMIDHyUK7P
	BA7agSmTjw/8nK4PZYBeGlEiOF17cNOCawr2u67hlt2yKnfjU126MKMbIdlwBD4AfWVGgXdw2lz
	AmGZmhrnoxkq8SEXIYOEIZTieItrTP3i0F8fuI9UeYabd3n7dIMILDaCrOyjoW7rk1Jx2CmoCRI
	FWzPk27EWJvZAtZ1JYOkAYjvZ200ysCK7HZDSn73T7nZwjuBq/BTyOlo6aa/35R4LfNihm52dhE
	wFiAlsSEK0f2m/AZn3zHVMWigKi1ujmrQsiGeIIOKUvlNWXvljA30+C4PPWHya14OqadHlT+tPp
	NRhhvEGucMzZcHHOGW0gAl1RIluxcIN3wtTU4Q==
X-Received: by 2002:a17:90b:4b89:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-395deeae6e3mr23990533a91.6.1787529375136;
        Sun, 23 Aug 2026 16:56:15 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4af75acsm7534205a91.12.2026.08.23.16.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:56:14 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: marvell: add SDHCI clock-names to Armada 39x
Date: Sun, 23 Aug 2026 16:56:13 -0700
Message-ID: <20260823235613.77505-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_165616_024408_95EDD9DA 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
Armada 39x SDHCI node only carries an unnamed clock reference.
Add the missing clock name so the node passes schema validation.

Fixes: 538da83ddbea ("ARM: mvebu: add Device Tree files for Armada 39x SoC and board")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-39x.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/marvell/armada-39x.dtsi b/arch/arm/boot/dts/marvell/armada-39x.dtsi
index 218fcf99ae07..81dd4ca5fbc9 100644
--- a/arch/arm/boot/dts/marvell/armada-39x.dtsi
+++ b/arch/arm/boot/dts/marvell/armada-39x.dtsi
@@ -381,6 +381,7 @@ mmc@d8000 {
 					<0x18454 0x4>;
 				interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gateclk 17>;
+				clock-names = "io";
 				mrvl,clk-delay-cycles = <0x1F>;
 				status = "disabled";
 			};
-- 
2.55.0


