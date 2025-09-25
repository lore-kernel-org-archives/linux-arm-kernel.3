Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A07CCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hc9FLuq1Qle+dUOfMSuq+9OePYiOG6ObgpQkfAy276I=; b=blVkIKZAm8Fv/x9NhdWlxHBxg9
	dY8ob+Sb3gj1IlNJRW4isnZEr59pRQBLniiE9iDaIo5Ka2TpOMaCAmR+ab6jh12s9EAnqgruOpFTK
	xo8M6osGd0rK16fVBglowOvcU1lqCn8esYFzbQDNPm5CcbeAjgGpPMzJhd0AwogPW4kecZZPtksVf
	nf3gKrUk0pwRwWvx0auZZQahoLUN8Ome4qi9pgoupwqe55sS71ciE0C4zboC9uYh6ouKOpyCTO//L
	dLWpEqDTv+u9YMqx+zWBVRJ8tFLsxgjgB5PTRTO7UKH1sc1C/upLo86pht+lPSGZI3K1dtEyVsSL6
	fTeoXgFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sl3-0000000CpDF-0GhQ;
	Thu, 25 Sep 2025 20:40:05 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1sl0-0000000Cp8Y-29gs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 20:40:03 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cXlvd1cnBz9tW3;
	Thu, 25 Sep 2025 22:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758832797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hc9FLuq1Qle+dUOfMSuq+9OePYiOG6ObgpQkfAy276I=;
	b=Rl+CXYA3AgQzWX/4AJa0LbV/qICcbZO9/heHpxU+S0CyJRddwmTIuB4jnkLQ1jd00wmYrm
	U+O89ng2qm4VGC/6GR/0YPoOOOiuMSbp2wtf/zw8DAsoinoAyT1LZ4B5mK1wVThovS//zG
	ApAubaoJ/SXXqKuGzlTrkdupHZMfFJwvIZ7CyLzuK969sV+juVsw6yw/QFZ8MmK87QLMUu
	I0r4NrnAn97aKephBGdmF8FlFaIeonidCnYdMdVFxYBAdU3dKzttllvgrXNv9/gQUR0vXy
	iqhuO1mkThdcS+hPM1wxJ+0lBYlvw+Gjc6bL4d/iMcrpe2zS6NiWiI2PXQcILw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758832795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Hc9FLuq1Qle+dUOfMSuq+9OePYiOG6ObgpQkfAy276I=;
	b=yhFHUA5l+noNrPehhfXmDBy6NNPqTttvCXrx58XxmPTr7HFyBWz8s0mmY4CL1V1o5rGdtm
	qshzeQFkR/BEmhBfFAYpGJDBUnqs9QnvmhWtmrYBW8plJQTEEH4SMY6vWaRrnrGd9COHFf
	oUvrl4mlAIc+jNen4vjs8ZodNbgIwIB6H5vNqnyjLVKFxjLlJzgzVSYqqPl8NkA0Frlswr
	KZu9917vOFJbcmDWjYVxLTbiKZ4NZYzE4NlN3v17GL9BHK6guEYo2mOVJ6PDksU3WtwWzX
	kmCrVwEgycfki7OFa/U58/CXnRQdY08HjoqbL4WRHkpD8VrBdb++deUGvQToOQ==
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
Subject: [PATCH v3 1/2] dt-bindings: gpu: mali-valhall-csf: Document i.MX95 support
Date: Thu, 25 Sep 2025 22:38:30 +0200
Message-ID: <20250925203938.169880-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 1a2f3377f62ae1cf85f
X-MBO-RS-META: tfwgks6u4kmgzo837okm8a7dbguzuxds
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_134002_701643_F6A8340C 
X-CRM114-Status: GOOD (  10.62  )
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
---
 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
index a5b4e00217587..b220cbd5362f4 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - nxp,imx95-mali            # G310
               - rockchip,rk3588-mali
           - const: arm,mali-valhall-csf   # Mali Valhall GPU model/revision is fully discoverable
 
-- 
2.51.0


