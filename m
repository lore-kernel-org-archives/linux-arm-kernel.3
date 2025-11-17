Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A951CEBF91
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 12:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; b=woomhSTsq9uRqIgcutSGJZYU2G
	RHrM0FSz7LsoCt7pMXODXAYesWs9MWGycJFIfqP58niDDTFexHER2Tk7ldkI8KF7DsaSXkTSfp2+K
	dMT+ASvX77xqiBeBLvyyHPKJu6Keqi3Exm/4wBiPnZ77cHofwwn0VLehyUl+js5Co0rEgX7g3DvVg
	mbDYgWbmGRd6O4dylsZm6ALSaGJqrx9a+SAPxWxl43gBVxbQE8kEIzY3LFCWppeVxS0efGCmYFWuf
	5bVKRoKFsedeL4Ig0H/I17rq55pQIdK9QbZr9oEgnJxztMy7MzTqMKfhz8U/KT6oiiFQ7aZDO+o0o
	neo7TeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyU4-0000000G4ms-44u2;
	Mon, 17 Nov 2025 12:37:28 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyTz-0000000G4j7-1g9m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 12:37:24 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383032;
 b=i+N0RD0b32q5ZsFE0fETvUERJDtHWzXXwmUSifQbPApZi/wwdHtf/xMONpHwkWPopwEg6SCj
 aNpHAibc8Nbby2nJTxfOiycei6+jl/+A89Sajk6Zo0DBP/dkcbS2/uCsHZ40EkDhUIJ3erCGYPE
 kkvi1kEv/BR+fUI1Om6RFz4A3urfTGSbl8ou1LAYUPjVnPnqvIo7Z1ePZXedji36A4rkzwjFVRV
 v3yCo3fe3OJyaAdROz4Gf/RSr391KxDA8ORNVoAMB20l8kGDCKMml+JRrvOoYbZjQjGy4NuqBn+
 hNrg5smHxZUVv5I1Iy8I3B7I83B6I5r5zySw6kSyttoCQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383032;
 b=LfcnHgOQoTrcL1/m/8N+E10RqxZcoMMRpYdtAHgT6XEwK0m8YvxSejU2BvgPy+P+mC3pxNgi
 m0t0VNVFPxXCVoegzL9s4PSkDouW1bK0fja/fOFccmpBEr7pc3MsNdIdLpnAKGOhPGLxRYOxSv9
 jLErxze3gK004QKjkRkobZkrNtM8o8RaJ8c7aUiXfWZoLeMyfpVY7e3FBqLFiq0mmaTTvsyOZoc
 sdKfIURmkWG269L/zDBKoOFGLPr6Rln9MlOZKisIf6WJ5lHw89LzBNnsazgIMuh2hCmPhThjY0m
 lwkwn9bLWijm2vfYfyPQ5v/CGYH4sq9Pk8vZIS0Pat4LA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Mon, 17 Nov 2025 13:37:12 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id BC3B4CC0E8D;
	Mon, 17 Nov 2025 13:36:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
Date: Mon, 17 Nov 2025 13:36:33 +0100
Message-ID: <20251117123643.711968-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4d96gt3Qwzz3ybvM
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 67e9f8e008322bf58113478606af1b75
X-cloud-security: scantime:1.840
DKIM-Signature: a=rsa-sha256;
 bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383031; v=1;
 b=T6sRizIwC7EmZqKLu+4XckJXpwdAmWdH4oJhgEAA3ZKjcM5haoLV/E7lRAKGp3jIQfcl48/f
 5+daV5vp/Nywb8jLJz4Mvnb3313ZDHEuz3u31D4iU9HiMvNobpTVmODITBR4FFphxfyNBfBIyjM
 jZ7meK0bb/Un8EybZAP1ChOzWVAQIKPouuI3GTRZ+d/aQNc8wqz/GNgBrrDohZBDwP5PH3xKfuq
 hkjmoUsgzqTb8Hbnttl2sSL3JRW5ZQKMTIVnD3ezGBu3+9Expds8VhS12jtv6VzRkaXXmeclfTZ
 HFiMkO0tI1XjAu09oo+H6GgmWPZHjKDqlJ1jzOx6imugQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_043723_578493_A92E9AE0 
X-CRM114-Status: GOOD (  12.50  )
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

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index f7346b3d35fe5..67fe1f63fd93c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -190,7 +190,7 @@ ethphy3: ethernet-phy@3 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
@@ -222,7 +222,7 @@ ethphy0: ethernet-phy@0 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-- 
2.43.0


