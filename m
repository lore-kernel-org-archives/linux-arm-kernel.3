Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C54CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xy3iOEWnL0tHwimE1DNns8Vy695o1slJtCha6gEPJ2w=; b=PEKFayeh3xHbhn/CBYjKksEEAJ
	L20xevEGDB9K3boUoRAVWRvD8MAxSWVcYy9zv+ua86ARhLvhPf/D4773/bMVR8+h9WFTKyAz0j6YO
	N54h0Q42cWGN3s0nRpT0H8tPn5+l7W3Ji8p3mk0pn+Fa8wZHfVQEs9U5EX2HaZvKjRqceoez39O1n
	1POAkvPxPcXy+hNH6VC/HPt6BUTFjzYiCu8lq4+ZQDOtB4c8mDHPpqqeNleZabGVi+gkd+/eVvVmo
	x13xKqeKgVk1ivRhnz3sxsgHsIRJE0L1QijIj+N9NzLC/JCyok6IkwonHJ0/dsJYsaeq0sZQS/F2b
	aypKpwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqeH-00000005ZS3-1L1q;
	Wed, 30 Sep 2026 09:30:49 +0000
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBqeD-00000005ZPP-0x0t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 09:30:46 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a605c198fdso8141701a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 02:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790760643; x=1791365443; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xy3iOEWnL0tHwimE1DNns8Vy695o1slJtCha6gEPJ2w=;
        b=F+ZgDoZk/4LQKqd+6FjEyMM67mycB5HFCqDYIUir7EV6nlgOFKmySohGyioba/FhyI
         SiUHGGtX2BRy5nUP+NEATAr7+qKFdoVCS3YJ5E7YKDVfjpbUOGKOyMn+ji0icEcUqX2/
         pLfd/bnmuTyW/6WCzXu/Gw/rUGrKhBSPxOn41l3R+Rx4CdFJAxeELpozUdu/Tr9QyjaY
         2sVoqCi4ojVZiGRut3w8dKqnYmyWk0a/zoKpWutusjwLRngkGRpZ4QjU5UYSW7b28HLZ
         XiKuoeNrJLmryL49CNxWeA/UkrYubOrKLYEgpAldll3IVfimI1uVmbk/DvPAsqbjIkZr
         d40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790760643; x=1791365443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xy3iOEWnL0tHwimE1DNns8Vy695o1slJtCha6gEPJ2w=;
        b=WGeAuDetbTVfBmydM77wNB1M8lBTYZ6qyM+0jtyAFfi7LuxFtZPWim4P12x5zAaElH
         C2UhuXJgZ1IhnXUySbitQvBWTOXoWB/hVb4kzOfcxYQ7CKRpvUWaOb3HBw6edUh7EYdR
         kj/Hwo5sP8kzh3xkd1Li1gH3FPdc+scYP0NmqFDr6seJ86aP0xXcFVE8eCiCY1fWxTm3
         PGdy8OcQ6lnMGHhCOL5wwgwCET1eCnLU8j/Gz7k3UVwv/DRXoCTouW875z5dPBg11qe2
         U2pAx3rLe9HXJnCbKsTCDCHccj1UVq3tUHDw4lxwUtJ4OGhzEAGkvKiGIJcYvOCBWa2p
         FDvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzDnQp864zHh8MHi09rMfO+Tg7nUcQYdVkP2YPixqfIZRlhwvIdWnjgHM48TgsrapampzInOwEovltrfTtHlTA/@lists.infradead.org
X-Gm-Message-State: AFq9FYJrN0Y9l9BqUEdYA9eFKRKeJb+D3Pmk6x5qScyImK4AFb33njEw
	3I3ZsYi2ob95mmk0h7TMJUYFNQdttKZtCcMnFqPpVcUZPGVMyE+8T3mU
X-Gm-Gg: AYBFou3OcOG54VQ19xH4GmXYH8ifocxXUCY8OXEHP4mWGsmWQt+ijyAfpAjw3e9QJL9
	ogTJOVGSZv6VK8ytIh4RFakaFqOoXyJHmE8KrQQZ+6azM1//kfMyVH/a2gdiJfI6cFZHujBy2dm
	IprA5SVjnJwKTl5mHIAgBg5OqYW4H5bAv/9AiSy1gIFpwUIosU5W1mLDfEpRKxn7UtR1CpniNEA
	mStZgoBIcU0ZHg9vmOgqCPX3bRuFh+LeOxZcd2yZvhjyIcl2vOiyyScGfDrvb5M0c1qeZeHDBLj
	I/qpebeJ38WqrFc72GL6MdpzQwBX4BWTQeEkhgqVkIIQKhkxIMIJ4IVifswDWbm81JuFO8vhLBk
	rFBYwqSZ9AWnEXuk/y83mU29KOscf80VgA+fj4rLW3zflG1aj2Eit34Db+GogQabxpvpoQEbzti
	zHq8BQSDZCkrq9Eg+b98vWr4c1aA/uIpPc+C00Q9xwi4rf/z8CaQFmCjm0+RrUcy+F5CXZtwu2H
	N99HguqEQ8=
X-Received: by 2002:a05:6402:24c6:b0:6aa:f1d2:ddaf with SMTP id 4fb4d7f45d1cf-6ae1992a5f5mr389769a12.10.1790760643233;
        Wed, 30 Sep 2026 02:30:43 -0700 (PDT)
Received: from localhost.localdomain ([193.107.16.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1568e8b2sm485221a12.19.2026.09.30.02.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 02:30:42 -0700 (PDT)
From: Dmitry Yashin <dmt.yashin@gmail.com>
Date: Wed, 30 Sep 2026 14:29:07 +0500
Subject: [PATCH 4/4] arm64: dts: rockchip: add FIT-PCIE-SATA overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-ok3568-c-v1-4-a0ffd55f5c95@gmail.com>
References: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
In-Reply-To: <20260930-ok3568-c-v1-0-a0ffd55f5c95@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dmitry Yashin <dmt.yashin@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790760632; l=2276;
 i=dmt.yashin@gmail.com; s=20260930; h=from:subject:message-id;
 bh=QtaCvtB82nVMHgqJpRLty7FgR+XTbYY1+IELklBAaFQ=;
 b=14smWAzHi2xRrXpAi13KJaNbjx0ttZoWTFTNLI/D7Q5zDrRvqa5emJFRD2xr8nDIQxXywPHPT
 +IVUk/ck9r+CLpAB3/8taFFhgxzFtu2slMMBjccsD5WGzHH/SqcCadx
X-Developer-Key: i=dmt.yashin@gmail.com; a=ed25519;
 pk=vBe9jaaOEH5bQEvfzb1tWOlz3AMIcXCu/GL/CdlwJco=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_023045_292074_004F97BA 
X-CRM114-Status: GOOD (  14.57  )
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

FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C board
and allows to connect SATA drives to the device.

Add overlay to use combphy2 in SATA mode.

Signed-off-by: Dmitry Yashin <dmt.yashin@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile                    |  5 +++++
 .../boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 48c83f79f83b..45e94a44107e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -155,6 +155,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-mecsbc.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-nanopi-r5s.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-odroid-m1.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-photonicat.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-qnap-ts233.dtb
@@ -275,6 +276,10 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-lion-haikou-haikou-video-demo.dtb
 rk3368-lion-haikou-haikou-video-demo-dtbs := rk3368-lion-haikou.dtb \
 	rk3368-lion-haikou-video-demo.dtbo
 
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568-ok3568-c-fit-pcie-sata.dtb
+rk3568-ok3568-c-fit-pcie-sata-dtbs := rk3568-ok3568-c.dtb \
+	rk3568-ok3568-c-fit-pcie-sata.dtbo
+
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-puma-haikou-haikou-video-demo.dtb
 rk3399-puma-haikou-haikou-video-demo-dtbs := rk3399-puma-haikou.dtb \
 	rk3399-puma-haikou-video-demo.dtbo
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
new file mode 100644
index 000000000000..474488ea994b
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c-fit-pcie-sata.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * FIT-PCIE-SATA V1.0 is an adapter that included with OK3568-C
+ * board and allows to connect SATA drives to the device.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pcie2x1 {
+	status = "disabled";
+};
+
+&sata2 {
+	status = "okay";
+};

-- 
2.55.0


