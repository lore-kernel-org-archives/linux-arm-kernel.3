Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47212CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3+1A7Jfz8pBcO0Bhp0hsCdGQXjpTyyhLH0OvHF0N0Os=; b=dhX9vGwrVpFEYe+wjrh6eTiYEb
	BIAT1PZWVHzuKUEGhF0Wbw8y1xEIBYy6AlDHIvAv7iV0d0F8VUgL+NSwsuPcB/S5yCboJTT2oO0VV
	4X7tkFJBBP25wmVBiFejGE/WIbtZB3vA9TStDoqEF9uJSMk1xl5AiELnkRWIjIY3gVo4Ds+hbVhui
	Mj8TDgVqe0tkbcl8ZgFUQMV/99ZO7uTBhbpw5tL/m0o8MebJhPeTDfH/sS+V0vf/lzx7pYOQeRqUK
	nNwXkOkL/i7Nvz4KDGfsLsSoPVh2GRKdgxGPqVyXcCcsbkdhOPsYtB17UIAkcmWw5g3hk3QDnO24V
	oBkGrMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LIV-0000000FxAu-0dnK;
	Wed, 24 Sep 2025 08:56:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1LIS-0000000FxAF-0szN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 08:56:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso45356435e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 01:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758704178; x=1759308978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+1A7Jfz8pBcO0Bhp0hsCdGQXjpTyyhLH0OvHF0N0Os=;
        b=g46PAgsDx/NPPAA/kMkNNr+Jb+kvzhKGpLTNS2fDUCiquO/wbt5bUYF3p94Rt8jdQI
         BEcb9DqdTricVwiF8JFRn9SfIrK/byux2MBE5ppAT1imAXR+0QGaOGDb0Rx4uwU8SUau
         HUGlk3RcR1yq2AYOmjrFwhbPtJ8toa+hBCFj6whbTBbYHjMawA/bPNrPOn5I8bTQi/s+
         qQSbvLM0i4QZdX8oB1ZCPwptwrb3VhGH/sjZAne2Dvw6yi10XAUaRNrE1iUfPZD7ODJL
         djsYKdoqqndJdOtYgaqBpNEaFBSzyNnuyZ+kOs0SRQ02drB7razo+LV67vFu7PqQaUni
         CmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758704178; x=1759308978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+1A7Jfz8pBcO0Bhp0hsCdGQXjpTyyhLH0OvHF0N0Os=;
        b=O8LTP1wNBelEUHGRUCmEBmhg5vsboRGwz/nUgrB5K4fFmoXsxYbIDEtCyZABVX/Jd9
         ZaXAL00o1S0Uj8tcw/NE3VF/oxYKARw/POXxGf7HgpNAxf2GEyNv/u8b6vkN02ex9zui
         jmuhAWOjDwGWdky7CiIp5ev0QTRbvF+SpxzNzbFfqlq7mG7hxN28CTWLJ3gkQ196tVXg
         Nu/ECl+Z9YAYKUWXUtKau3oQQX7403KlH6KTMUpJbgO7wIzzhhQRFr9SGtqK2EyDWZ/i
         owjwq5m1jRL3O4PKOS1bqbxQtWhWC8y0yECPSI9sU1xvVVRHfmZcYTfDH355JX+Od6Tx
         Fzlg==
X-Forwarded-Encrypted: i=1; AJvYcCWkJL+YqET/SIWHTm+3QWrVQa85+dO2yD2Rb3/o0wCbgIFh355DZKXCz7CwwEL14dq8qnIWyjHF6drR3fy9Z2Ct@lists.infradead.org
X-Gm-Message-State: AOJu0YzCH0KTblIXKlnsqf7khRhmdN13roeaS1A8P+iuT0phy3t0nucz
	QRu0QJoOXwSICKfFTV2uJaiG4qSX8YHwTQMK1s7LjJNzyEB7dTvaCzOp
X-Gm-Gg: ASbGncuzn9crawKvdeYVgQZaMYiH82OHcNzyuccZRX3FTEOERT/kFIucAXqFq/NFnW5
	6f+ZrWwOwq5lPnvu456DAXvtkGaazxWTHgCWHNXdjg5a6jGozEF21sOKCk2yH/jX+b4dtxU1Rei
	XtFrZkIhnRvDR+GvBwfdx5/Srdc/LicbYdw0+96UPoaHm0oI6GC8f8GLkHS7Z9lS4DNPVyXC0KA
	x7oLRvURXcdqaJ999LAsUPtW9jta2eOV0s+B4Akd3M0ZWgB7UcjKHm9ncgOzC7jLAgNXiN7sKfl
	gpf6xycvbx3RuRFYIXkdCzenf1HVc9SltAUvNDrcXSMzSC0SVI0p8M/uoH5X8ApTFkOE39SXIJy
	Xg/ZKPKqM1l83XNvwfnk9GUUBS8e7p5wyHzdq9pOMsCVGHgcNVqm/zJqn6TPgLz31
X-Google-Smtp-Source: AGHT+IFsIXsQJRVx0IId4V0ByF2DFXWaJ2yupkNUOMJBnlYYIer+UD4cK/Vz2Jf/rXM6xy9cx4VDYw==
X-Received: by 2002:a05:6000:400f:b0:3ee:147a:9df with SMTP id ffacd0b85a97d-405ca95a206mr4825807f8f.39.1758704177759;
        Wed, 24 Sep 2025 01:56:17 -0700 (PDT)
Received: from cypher.home.roving-it.com (82-132-239-193.dab.02.net. [82.132.239.193])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3f0e28c83d6sm22415983f8f.56.2025.09.24.01.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 01:56:17 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] arm64: dts: broadcom: bcm2712: Define VGIC interrupt
Date: Wed, 24 Sep 2025 09:56:05 +0100
Message-ID: <20250924085612.1039247-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_015620_259191_2D5BD2BD 
X-CRM114-Status: GOOD (  12.40  )
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

Define the interrupt in the GICv2 for vGIC so KVM
can be used, it was missed from the original upstream
DTB for some reason.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Fixes: faa3381267d0 ("arm64: dts: broadcom: Add minimal support for Raspberry Pi 5")
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 0a9212d3106f1..4cae17c04b50a 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -270,6 +270,8 @@ gicv2: interrupt-controller@7fff9000 {
 			      <0x7fffc000 0x2000>,
 			      <0x7fffe000 0x2000>;
 			interrupt-controller;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
+					IRQ_TYPE_LEVEL_HIGH)>;
 			#interrupt-cells = <3>;
 		};
 
-- 
2.51.0


