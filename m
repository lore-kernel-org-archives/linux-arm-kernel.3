Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B680C56201
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5uRXwh50cRPL4dYRNSzCiH8imdvqaPOiZtMihoAg2IQ=; b=WZXtHL+azZLavXvjXfxcD8/LkK
	atCOjDv57UtBeX3TClCphnq9NX60/O//q9rfpKxwOgSiKcmrs+iSA8z+t2ZEkTHIbvOX/dFNnm1Wk
	wqQ4AthlHZOmcm1owW44CH8RedXAtcsRTp/Kmy8UplkDjkgizH46hJoMDBP7PcZr9F9JZpiunsIxE
	SF0zy/2GJxHYephYHyyCXV59deq7PHcwJtKUBTka5sVIcfKBOrgYJpcqIu0bK5WkPpKKOmyDKXZxG
	TTknuP9wVp/UgHXHdEQMEiCuhYQJTqjFnOWdGg9nSt+2yHdoT7hVF6yie0GiEhrOjJMGd033roYmN
	xTZbP1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrL3J-00000002h49-3Pa9;
	Tue, 04 Aug 2026 19:43:53 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrL3D-00000002gzX-2vh4;
	Tue, 04 Aug 2026 19:43:51 +0000
Received: from [192.168.0.240] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F6AA229A;
	Tue,  4 Aug 2026 21:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785872553;
	bh=b7wf1MvGqzrmjZLOA7pnXt6FByJlRXjFH8lcGJt/dOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SuybL1fpSKTcjPLB5kJTG2BHc9iI15KSGpxYEsCgUk0oB/Thl2oqT3bRSscNkcTn0
	 wud13PMZnY/NPGhDUtEm4D8wVmLTfQKmdMsVanK2dxA2fEy7DdnAYjBUAqs5mUWTDk
	 qMfu4w+vEzNTMXoVPgb6YgwcFothIaXJpiVzAQto=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Tue, 04 Aug 2026 20:43:28 +0100
Subject: [PATCH v4 1/7] dt-bindings: media: Add macros for video interface
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-kbingham-orientation-v4-1-336998dd63b4@ideasonboard.com>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
In-Reply-To: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-tegra@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 David Heidelberg <david@ixit.cz>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785872619; l=3682;
 i=kieran.bingham@ideasonboard.com; s=20260204; h=from:subject:message-id;
 bh=b7wf1MvGqzrmjZLOA7pnXt6FByJlRXjFH8lcGJt/dOc=;
 b=BC9MuIoK6ZIULs27SianJhWu8A2ay3/+qFpVx1EsOBJpnNjHNlBGO3JiOYMIgFz15dNqq/iWK
 MsWLjXReFxlD7vgo7v3vZOIq3uamrqjra2eEawOHMS90NgLdEsUwMkl
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=IOxS2C6nWHNjLfkDR71Iesk904i6wJDfEERqV7hDBdY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_124347_891156_CD5796E9 
X-CRM114-Status: GOOD (  16.74  )
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

Add a new dt-bindings/media/video-interface-devices.h header that
defines macros corresponding to the orientation enumeration types from
media/video-interface-devices.yaml.

Expand the documentation of the video-interface-devices orientation to
reference the new header which provides human readable defines for the
orientation enum, to help avoid hardcoding values in dts.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Michael Riesch <michael.riesch@collabora.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
 include/dt-bindings/media/video-interface-devices.h     | 13 +++++++++++++
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index a81d2a155fe668a95e0916c99e702de8b5c07005..c9c3f4f1671969ac2e77f2db4cdc598a6886047b 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -392,17 +392,22 @@ properties:
       The orientation of a device (typically an image sensor or a flash LED)
       describing its mounting position relative to the usage orientation of the
       system where the device is installed on.
+      See include/dt-bindings/media/video-interface-devices.h.
+
     $ref: /schemas/types.yaml#/definitions/uint32
     enum:
-        # Front. The device is mounted on the front facing side of the system. For
-        # mobile devices such as smartphones, tablets and laptops the front side
-        # is the user facing side.
+        # MEDIA_ORIENTATION_FRONT
+        # The device is mounted on the front facing side of the system. For
+        # mobile devices such as smartphones, tablets and laptops the front
+        # side is the user facing side.
       - 0
-        # Back. The device is mounted on the back side of the system, which is
+        # MEDIA_ORIENTATION_BACK
+        # The device is mounted on the back side of the system, which is
         # defined as the opposite side of the front facing one.
       - 1
-        # External. The device is not attached directly to the system but is
-        # attached in a way that allows it to move freely.
+        # MEDIA_ORIENTATION_EXTERNAL
+        # The device is not attached directly to the system but is attached in
+        # a way that allows it to move freely.
       - 2
 
 additionalProperties: true
diff --git a/include/dt-bindings/media/video-interface-devices.h b/include/dt-bindings/media/video-interface-devices.h
new file mode 100644
index 0000000000000000000000000000000000000000..d2340b4572927a734f679bcab4f7c845b94454af
--- /dev/null
+++ b/include/dt-bindings/media/video-interface-devices.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2026 Kieran Bingham <kieran.bingham@ideasonboard.com>
+ */
+
+#ifndef __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
+#define __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__
+
+#define MEDIA_ORIENTATION_FRONT		0
+#define MEDIA_ORIENTATION_BACK		1
+#define MEDIA_ORIENTATION_EXTERNAL	2
+
+#endif /* __DT_BINDINGS_MEDIA_VIDEO_INTERFACE_DEVICES_H__ */

-- 
2.53.0


