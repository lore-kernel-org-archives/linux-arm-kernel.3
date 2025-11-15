Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E51CEB2CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkXk9r3jFuykw1dEMp6tF/onCAw0uT5g6Ohcknth0o4=; b=Ik0WR1FzsbnnsUwFJktbdmFR91
	QkbL2uiUlAU9Bvmqcw7VRU6vfFOPsE7v8mWUsctisEmHxNPsmLjVWey5gdPYFGFMjHJfIIcArYY2I
	vCEWGAOXgql0XnAMhHktMJpAWh9jsTkWwQ/OsGZpUGRBFv2Wdf6XrxVB0eSusdhjbUye1PjwF26Pf
	aWTju7tJFGYt0GzSpoQrIaGO2Rt/2Q4XsOSTC802U8yx0S2rLmI+S+Tdr7a6EwmslcjaiZA/04vx/
	29k2uLaV6AOSzIRy6ScblOlrmHWnFt6YOEuqOY8Ip1xykSghCxqlICWlRL9MNGCke5yfnbytGwRVP
	jDrVpSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKFHh-0000000DlXf-3Tyy;
	Sat, 15 Nov 2025 12:21:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKFHf-0000000DlWz-2aKT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 12:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CBA1401E6;
	Sat, 15 Nov 2025 12:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EF2C19423;
	Sat, 15 Nov 2025 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763209299;
	bh=qnbEQfJ/X0ZmpMOyN7rpabYvjrZ5czl2oCiK6yZ/aM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GbhUTg2yrGlqBqVcfC9aqi1YG/6NW5DUwhyWV5txF5m9ZyTAKTz4BxGdHAxWXA+z/
	 ajY63z2+iHYvGDaOnpHL8KOwJQ+bXOfC8Fr0xhYnthlwHTK8sXSVUwZvfzhmIRBIYe
	 jE6a3yvmWy0jZ6Hr1QMg2MV2qXco19ljCMv+g0jPfD6GUioaFESwYdCG151UU09IvA
	 en868vAL8EhhCnk6SXMC9QHZAmXMfBjjNRYgbtGkpnAMjwMYLJi2sE5Ge4dN7nlY8d
	 gGSYvw8rKDUP0ZDisjQin1CkHJxVFx3Xb5aIDUk4DkCqXOby51UQsbzJfJELPcry/4
	 KArbIYHHxlkmg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Harini Katakam <harini.katakam@amd.com>,
	Shyam Pandey <radhey.shyam.pandey@amd.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] dt-bindings: mmc: am654: Simplify dma-coherent property
Date: Sat, 15 Nov 2025 13:21:23 +0100
Message-ID: <20251115122120.35315-6-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251115122120.35315-4-krzk@kernel.org>
References: <20251115122120.35315-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_042139_679939_64BDC3DE 
X-CRM114-Status: GOOD (  10.39  )
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

Common boolean properties need to be only allowed in the binding
(":true"), because their type is already defined by core DT schema.
Simplify dma-coherent property to match common syntax.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-am654.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
index 676a74695389..242a3c6b925c 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
@@ -50,8 +50,7 @@ properties:
       - const: clk_ahb
       - const: clk_xin
 
-  dma-coherent:
-    type: boolean
+  dma-coherent: true
 
   # PHY output tap delays:
   # Used to delay the data valid window and align it to the sampling clock.
-- 
2.48.1


