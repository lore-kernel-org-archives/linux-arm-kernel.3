Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC100CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 16:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WRWlBAxaLwlIJ+KJHtMqZraX6wDCd2McXv/vowb6x6Y=; b=1UordHjnhPzTQRSefo2XRfbIxr
	3tgdq91fLQEIIPK/z9GW1N6Ipy6of3MT2sIfI8/aofe2H5bV4xS1M5+3V1s59y8a0HLU7XqVUdg0l
	YyqB8z2eFTNdaoemay+qsRcoS3DMZza0z24PPL9oDyDpQBS32HNFd+5Fvrr0dluC/66ZQ3aOsJDlH
	JpdrcWMjSYJ8rkYFu0v/5twFLbynwVbnaOhZh9aIeN52dwQ8O/cVIXj1yeO8p3VmIUQqSwQMB1gbh
	nzLua5I3sZ7Du8zFYG+KSVM4ArI/TSBwoyMREMmDShNaO+KwPINmGBLqAimn7igvuYYY2gMWnaZYd
	lFZnfRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaeG-00000008dny-3J1u;
	Sun, 02 Nov 2025 16:09:44 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFaeD-00000008dnY-3bhG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Nov 2025 16:09:43 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4d006C1mXzz9slq;
	Sun,  2 Nov 2025 17:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762099779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WRWlBAxaLwlIJ+KJHtMqZraX6wDCd2McXv/vowb6x6Y=;
	b=F9GC5HafzrCeSJU3lMXKf2jcEjvnBUojT6aRb3vRMIaHDsJN9LuYprMzKWTc9bb8VmTpha
	j/jGvjATNXZdaFBCwBY+O8Mx1fxda4WBLiExXthmRGAEb5yI+aq7DlBh1K//rWBUzM1o1L
	ja+X4kiDZy5G1WQIizSB9Wle8qH+E644QBxe24p6sEhajCd1wTo9SawOz0dR/cqPciHWD5
	MdXeelDnqCRFxOBH6EWnc/E56AJXqIK+U4QcyYEKJvRyPgG0xcsZqXGQBqlZPaRm8I/MHJ
	Z8lgiQKmspkXSlzczL/CYMphZAUXCLhBhheuQgs1BeFEBqrLM9eO1IIyA7R58A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CmZydwOX;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762099777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WRWlBAxaLwlIJ+KJHtMqZraX6wDCd2McXv/vowb6x6Y=;
	b=CmZydwOXCdqv2rs2s4kd4EQ0FhAUY+kyls/iw2j1iTsmUCQbrqM2oDtu7NLYpPUwoyCixp
	GXGB9IQ+iLy40Q+BDHyXAFUQD9qBbBtwHsakb/PHPMsJhmci1Eypj3nwm39Jj62AArybuL
	tKStgfRAEtTnC9KiFwTT4soUwa0j3r3N3frMGwKruqcIJ23Fvooi0BAh46d8H50syCk4qv
	YYtmEjhUKEqClp+A6w9ZLv8iVxrWZiYhm7HeNXj7gCLU5aAIi78l8LBme7mjGWtUYr334O
	t6VAN7W6Vj2MumG2vpcDpXxCIRuG/YJ5ZwlvPPrNryZlDzMkPCLBqZZvgFippw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Frank Li <Frank.Li@nxp.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH v4 1/2] dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
Date: Sun,  2 Nov 2025 17:09:06 +0100
Message-ID: <20251102160927.45157-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wnbswggsbryxtn3g8tpcuso9gjh438be
X-MBO-RS-ID: 36e0d0c2e5fa586b9b5
X-Rspamd-Queue-Id: 4d006C1mXzz9slq
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_080942_048127_F6D8ECC5 
X-CRM114-Status: GOOD (  11.00  )
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

The instance of the GPU populated in Freescale i.MX95 is the
Mali G310, document support for this variant.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jiyu Yang (OSS) <jiyu.yang@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Xianzhong Li <xianzhong.li@nxp.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: - Add RB from Frank and Alexander
    - Make resets: mandatory on i.MX95
    - Switch from fsl, to nxp, vendor prefix
V3: - Add RB from Rob
    - Drop the reset part, this is now unnecessary
V4: - No change
---
 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index 613040fdb4448..8da8ceb0308d8 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8196-mali
+              - nxp,imx95-mali            # G310
               - rockchip,rk3588-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
-- 
2.51.0


