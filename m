Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA48CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=laoGGEVO+Nzxj153VQlyUvl8GS6WXFC6jR/xWNH0R9s=; b=c7JEcXOL5ZFtgP1c9DnCGHsNoX
	ro8aGUvCeJX4NNxbuLcFIHy6uB8Gv6qrOZmOrrhKTJJI0qrtBYUOhhOqXStdAFedUHMVTQsMQMdt1
	Ezt81QDJ2oZj5CoNCPODsWH4H76VZrz9TuAamqyBm4kZm83wkV8rrPDIPdZsEaQxl+MZbMFo8AK22
	qFSAr7YM5er79Foes38mOewRTy3+av3TQlpjI3hZYfn9Py1y7OW0WpyQjnSmGbna/44kip1YutCmg
	K+mSSYv0E8pRMowYf0JeEx/AgghWImjefwaxf5ZnbHXsJnJsi4Q+8D0cGJHyzIeuz8P54fAlkOyQy
	sPpkqmPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2i-0000000G18E-1sXX;
	Fri, 05 Sep 2025 02:19:12 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGCZ-0000000E8un-0eeZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:05:00 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHr6v3lLTz9tFV;
	Thu,  4 Sep 2025 22:04:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laoGGEVO+Nzxj153VQlyUvl8GS6WXFC6jR/xWNH0R9s=;
	b=wKkdMKr+7B0Cy62ni773W4TSsAfK63kketfLjxrrSg/NVj2rchJygMzCU7qNgZRMCOHNrp
	cq3KdHrM1LLejQhNtINYxzCqzGWT58z1sgqiZpm1buZhitvEUxPo6H8MB4BsGSVeX6cDZE
	5zjlaSJjPXmOWI54b5HwdzV63CpshUeTKjXJtEwYvHL9/CJXEmTCCTQnl+CNl4jS55heTF
	SnZ3rJaLg5ZVy09meDrrzndlE4HMwmx+ghUoJcUMl8qJOz26A9X4dFjycZh3V0XfECjdwe
	NgK4m4hbjXGitYoOZt1RNdhiYp/9KpQDnLQW/qnNrOQEdn8puzveOSEB8QhdlA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Ht8buZKJ;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=laoGGEVO+Nzxj153VQlyUvl8GS6WXFC6jR/xWNH0R9s=;
	b=Ht8buZKJynSs5acSPh9eLlgf9Aix/WrZj66Nh/zYQ3EG0MymY4YlT8FOXRlZhx74FmFXLT
	8weQET6B4XP1kVcpHLvjIJ5xWFTv13pgrp/HeoFoKley+NpVPwukE1EtLQu127YTi1P50G
	u+Ak3aTZ0hIveG3TjY0ORgTOuEHRzF6uZkkomg3LeIKljIYzibIF6B6wQzrJxypjC8S1Sl
	VEqLQi07ns84C/JkUW4msY4PF2TlCfGuC5DzCV88hj2eE2DLk8/YFS4JWDjVgYyDO7mcdN
	nFIJvGVEa7gHeKpjYmeCg1eEqG8SsLZN1NZmwWrZRTfysKfZicdhqa1DyoiwQw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: renesas: r8a779g0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 22:03:06 +0200
Message-ID: <20250904200431.168363-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: zif16n154yhntpkif6dd91yozr1xs9fx
X-MBO-RS-ID: e07c121d75dd1735519
X-Rspamd-Queue-Id: 4cHr6v3lLTz9tFV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_130459_337288_58CAD33C 
X-CRM114-Status: GOOD (  10.45  )
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

Rename dsi-encoder@ node to dsi@ node to follow node name pattern
in Documentation/devicetree/bindings/display/dsi-controller.yaml .
No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 8d9ca30c299c9..4fae063bf91b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2476,7 +2476,7 @@ isp1vin15: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 415>,
@@ -2505,7 +2505,7 @@ port@1 {
 			};
 		};
 
-		dsi1: dsi-encoder@fed90000 {
+		dsi1: dsi@fed90000 {
 			compatible = "renesas,r8a779g0-dsi-csi2-tx";
 			reg = <0 0xfed90000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 416>,
-- 
2.50.1


