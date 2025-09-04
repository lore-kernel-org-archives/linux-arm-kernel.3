Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6768CA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ajgl4VkcAvKSjVnpuARRFDOopjNfFzRrXajmAnDP0g4=; b=Shxcm+XcYZ+et6THuvbwJs1rBQ
	WofVJwlFv8fzSdYy3GzLfcCwFKlKfou6ulfj6vXMeYVlxQxwISaeH4gq4B0/14LjRbqOTSwQxke1W
	B0hjrjcxCnDXLZdyAwsMQGkwgTSHGG1wwUHxJ7hp/vSib/SMEqLalEmuKB44SWxpspAuNekyxdNy/
	RnMAo73CIaKEN7FhkHl22OdGg8aWePB33ycXhStsBSim9do6e1MzvApMJMORq4E+iSWCE/kKt4EVg
	AFmdALAsI7dzPVS587A3lZZ5/lCBo/jcMJYnsXb80QVn6jtWn3t0MuRm51Jpu5cvkzU1YWBIuRrVL
	3nPxpNEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2j-0000000G1AV-38gK;
	Fri, 05 Sep 2025 02:19:13 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGCZ-0000000E8vE-476V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:05:01 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cHr6y4HMLz9tB1;
	Thu,  4 Sep 2025 22:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ajgl4VkcAvKSjVnpuARRFDOopjNfFzRrXajmAnDP0g4=;
	b=X6keGGjel+lKtjCAF2XKf2EdVmHMTrtJI2qc7yUTRfnr+9LyL0cRqgprgV+IuKHUVxGo96
	IWDY9fCRjikoCIii/GAiOiozzfCGqBai4HVYwiGc60HU6yBWBlvFXpBHr8FrECEN17e6oU
	nrZySrMXnA8VAXf8o9kRneRgawgbl126Z+9dhjLrMMpsdYHdQg3DBL5+w1NPcv3Gz6rmG6
	BrMLWNF4AFx+DwKhBMgt7cKKgrvQC9f3d46/hg9YWzyiA6mhxXMlWbyAU6bHSmJ+awxfb8
	90fTAc/LvDwTHClDNBUJoE+nY266iAFzoVMMOXRYjunmhzFIr5qdqR+rMUi47Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ejXENH9q;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ajgl4VkcAvKSjVnpuARRFDOopjNfFzRrXajmAnDP0g4=;
	b=ejXENH9qkowuOTQpyYJzNDSF++JA4mGaY3b0XEhUhS42/MJEycKsc6k7wDyzRp+jd1VB7m
	/2gdmNP+KmkVq2JyYMYEPuXyBmsXYFcemm8cBLg6MqrjxIeVVGoojZrQ9c1bFNdxkSVz50
	/yGeqyxCWrYZEtla1quz+isubeTXs24ueXkqfwZnFfic1Igosp1cBrGw0Eyxbij+TNkeuJ
	7ELni9ZHlJ/PgTxsIsjiQ6JOw5/HpXyB2W/sHetazFDYT0UpvC/gblWdRut4BdFwH1a9AL
	r6KIOqoJEBotHfo9tJT6Q2fu60HqaIcK6EV87xi2RQS1BR9fmSjpXYzfUuPiRg==
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
Subject: [PATCH 3/4] arm64: dts: renesas: r8a779h0: Rename dsi-encoder@ to dsi@
Date: Thu,  4 Sep 2025 22:03:07 +0200
Message-ID: <20250904200431.168363-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5mkbduokp49hwggqng9sp43kx7pzne5i
X-MBO-RS-ID: 75d0db906adc813bcf6
X-Rspamd-Queue-Id: 4cHr6y4HMLz9tB1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_130500_160568_4BE2F431 
X-CRM114-Status: GOOD (  10.51  )
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
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index ed1eefa3515d8..0f20a2d239834 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -2144,7 +2144,7 @@ isp1vin15: endpoint {
 			};
 		};
 
-		dsi0: dsi-encoder@fed80000 {
+		dsi0: dsi@fed80000 {
 			compatible = "renesas,r8a779h0-dsi-csi2-tx";
 			reg = <0 0xfed80000 0 0x10000>;
 			clocks = <&cpg CPG_MOD 415>,
-- 
2.50.1


