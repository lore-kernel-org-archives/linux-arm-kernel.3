Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57C6C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 23:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=; b=jyBAzMs32DbJwerxHnQK+ahv6q
	MusJo2h6VcnjabYpSZhRkq3SzSCMDEoF3SaTCHeNs0yjn8raA1j/WGa3VCXY/9u3BSpBD50SyPmcS
	MMxIGsF2LbbCGR0J5K71cBUJk3L/wMB4aF1RITlBp/zvsRlfk/uG0Ffhp5ALfERidx1MmxiQxOTsd
	asuk8TLjZBeyuJc0Tluxb2DnF2uhJjwhkpI7gFIZL2vq4W2jIV7gCF1C9fggqIQ7He/YvfIvhbRyU
	0PD4qnYRPE8ySOq8K+ZpFrWpRaNXC9zqzj74E8qDp/LNWf25thk/D9r9moc2dH4MTha9e/zk21K5r
	qDOqcVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyHqh-0000000Fgb5-0m39;
	Sun, 23 Aug 2026 23:43:35 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyHqc-0000000Fgal-3gg7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 23:43:33 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-51c2a449c57so15517951cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 16:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787528609; x=1788133409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=;
        b=lAfM0VIdJR7BxRqyklpjVTc51J0as3mL1xdxMlmuT8ya5dB0MxVPrJDfPxp8K+t/0s
         3BkwhHjowgP/ARXiYWMAYH8NwxlpBs4TR4PA8eqUDhcZh+QTCJz7Dd3nNXdcOGa6yC/W
         UNsLAHsuen0RkU1l4D/sA/XAWwB8pF4YURFMdbDNtJUu0vRyFrEE8RwR48HGFAoqth4/
         B5aQdRYzb3DG+1fJ45qex2f/+voGRI32PwPOMa3a4r16whAtq2lDCWcn4nPl2jsvPFcg
         1akfXe9pfXZ5LhUnwDEUfLjuMfK9Vxx3nsaadye0TtgsXjBgPt50raV+7PxIzzvIBEKB
         o5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787528609; x=1788133409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqO2eF1E/cLxqGSvCisTSlVPdaIBeR7m9dvhWx5XYYo=;
        b=KL03VSqdJn5zqGFWHmClpnjmsriatya6UCDu9S9zjuLMpF4hNh+GcBNIqDHELyHxQ5
         IF8az1kyT4GxFgApncU+2dUOOa8eqLC033leLuSsAPpUMMXNtPE3pD3gIN7hii2NRaXJ
         SIbOM+LKOfyfCz+XswWjZkZvz1A7IGBmCm+r3ZwUW6r+ffptJGXus4l4hxE/lFl+13Xl
         /tSSp1STTWnLgdhEIVePWx6oEshZiY8aApsxtxWv1QTwLmzWb7ZMWMrt/CEI0U92Zhk0
         cJ1MDPBeqg7EHa3OS7xczxewoEOvfqz2LQDa72YpuYtD9S42jZYybuJH5+ejjUatCCL3
         gKAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3btfV4Lr0aPYL70n3lI8VGykbC0oCw1B5VIznD+Z1W7J4l7O0XL1I+B6LiU61O6YMYb1oBnvDR1YRUMlwHdNG@lists.infradead.org
X-Gm-Message-State: AFuF++nL6/u9d2puJyMUpS44Qk6ZIFy5lbROfDbX/ewyES5S6jyTIlOV
	z4VZp5PtL0NJGgkyFxRBlAnDWYuCzDT5eRoUJ8CutNh127drGqN/4tPy
X-Gm-Gg: AR+sD10LhjyE8iM5nVid4rOsQT34QZZQ9o7Pnka66ahzxkEvjLoSGMzLhfBl5d3iwny
	Gt3qU9zre72Fx5yzyPZB8azoGK7dI9bWC0RxG9DRoVD8Ss4eE4+Qxp/A8qVJepD1PzRecWEtrj4
	BzMjjscxg1dDGjApR70V/hMXI/sjQ4mk3ld/HJ8HUKztqK2cEDnIbbvOTQ3DC2FqujqM3Pib7L0
	cJdJCVAs1VSc0bDmaCILGIq5ZUuMtw3yDE6Kn5e7OQyUKChns+Nr8JIc9pjjGhdkxEAvBsBSZ3O
	FOZeJLIRoHihTT/SVs/aQIZcNmZA4x+K5M7qvR+wqeMyNEDvE6in+kHBZ2zs2pZbMrSueXTXOuS
	oblqdxvES/itnVegQIGygrvdaA6llcPfVeDeoxYPewjXUE1dGqAmZXk+p21Hl/BgAXUJQxWA6AA
	mSyl8sCIRO+gxt2Hrs2uTQOwAIAfcXBgu49ncmFi2pab5eTbt69ADklHtEaJQjWcM7fYCbspksV
	iH9HwG+XaSUUGoAUdWKCFkhZvumHvBEDKxr2LY6s6wUh7bin5PXHmJnZ5BzKpCS/fgz3VYAAuid
	FgsUSVhbDb3mMp9dGVE09X+m/77txPVVMqrtEw==
X-Received: by 2002:a05:622a:5816:b0:51f:20e1:137f with SMTP id d75a77b69052e-52df5766f0cmr239331951cf.19.1787528609263;
        Sun, 23 Aug 2026 16:43:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52e09b0c8f2sm37012211cf.31.2026.08.23.16.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 16:43:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: fix lm75 supply name
Date: Sun, 23 Aug 2026 16:43:26 -0700
Message-ID: <20260823234326.71111-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_164332_086625_0CD1AA3B 
X-CRM114-Status: GOOD (  12.51  )
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

The lm75 driver requests a regulator named "vs" (the +VS power pin
of the chip).  The Helios4 DTS incorrectly used vcc-supply instead
of vs-supply, causing the regulator core to emit:

  lm75 0-004c: supply vs not found, using dummy regulator

Fix the property name to match the binding and the driver.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 626a7339a5d0..af96d27e7159 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -200,7 +200,7 @@ usb3-ilimit-hog {
 				temp_sensor: temp@4c {
 					compatible = "ti,lm75";
 					reg = <0x4c>;
-					vcc-supply = <&reg_3p3v>;
+					vs-supply = <&reg_3p3v>;
 				};
 
 				eeprom@53 {
-- 
2.55.0


