Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB36C982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkYmtyUOM2/Qgd1TVc7yIM4+JG4D4rShlOJzTdT3O1Q=; b=1XZjxTJhpuUSLzuxiVtGij6slu
	7CMQXprbAOE0wYiRYKmkvG1FbFwTmbOmA8XNk4DXRYB7U8TtXU8SI0cTwWk3oD+eM28hQj2GrBwXy
	yUNoNZBHxTU8klL7vnjEYJsrs+dcn33fDGfsAXh5Y7ZLIMMfpq/jbipeVNF9ojodqidsJt0xN/N2f
	j4VZgpCCZyNjTLI/ZuqVxEOExhz7Vr5Ek6X0iy92l7ZDznCzKxzJg9l39k+KvnqlyBclYDzXIstny
	x0h7ZNmlzFgJZfS13kC7t/prFBqQcrrwsa4hKgBSZrfx+/Ag83/EMk3xhS/i/QhOMZ0r3p0k7C/Dj
	bO2Yhu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VTf-0000000E2sf-3Yor;
	Fri, 18 Sep 2026 10:05:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VTY-0000000E2ng-1K2Y;
	Fri, 18 Sep 2026 10:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wkYmtyUOM2/Qgd1TVc7yIM4+JG4D4rShlOJzTdT3O1Q=; b=Q4rspLCfA5qSBttqajA5y0sxT6
	/Csid5x/1rzgSsHqUWVO1n5kJs9Huc7ChuAdrlWCDm6DZo6DA9qwvJW2hZaWWPYYY4VC7/tUuKTlo
	Fwrezq/ygrVmuwWmKRTbiR5ZhDfVVZfO94X27yDMFZF+k8xMowy5w45JkatHTZqpcMU/uOQxOkfJ8
	S4z+fZiotz5ezIkfzRrdwGL2ZTIsl+YQh9DYKKXl+7gjXZa3k04xFn5Y+C2akSFPMI3DTPbeXajXg
	SWRpL6ziAdQPXxFulVVwIzrWp0KHbBuvC80hY3pexz6wKjuk1PZ2YzD7HC/jO8dSFmgQLWqGcJGmM
	5X0DXMNg==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7VTQ-00000009tpG-0OoG;
	Fri, 18 Sep 2026 10:05:47 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCA714DC;
	Fri, 18 Sep 2026 12:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789725834;
	bh=QFTOhaxbNKiRh+xncxOUmiTCEvJLsCL6JfpX52u6oT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mBRAV3oNkUzEVc8JRRrTLm3XdEQrze39ag23nBEd8WruitHgP6MI8sozYPsOf1gct
	 zu/gW/24ltcxrBZ8AC9/cKpGO4Xc1R3+xIG654WS40F4zMIUI07cr3yT/LTQ+t2YDB
	 sVbGQGsCASFvBmTFTM+G+JQgim0PxCm1dTCQIVRg=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Fri, 18 Sep 2026 11:05:22 +0100
Subject: [PATCH v5 1/6] arm64: dts: freescale: Convert to new media
 orientation definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-kbingham-orientation-v5-1-e1a134326988@ideasonboard.com>
References: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com>
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
 linux-tegra@vger.kernel.org, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789725933; l=2320;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=3O+4xX7IoHfTirxspRvjf0vHNpVSxg5lGVxFyXmAfco=;
 b=e02vAVV4DJp+ccHzqJCVqoUx7FgDfyL4O8D6F06H9MOPjSsfkwA5NVlxRigq6w7qsw1M6UXOY
 q1JqvweL+ycBTS/LyK9xSqBAdkG2nx54TaY0omGVF4LufKADalbAXA1
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_110540_255414_5F169B39 
X-CRM114-Status: GOOD (  11.10  )
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

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

The orientation property for video interface devices now has definitions
to prevent hardcoded integer values for the enum options.

Update the users throughout the freescale/NXP device trees to use the new
definitions.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso      | 3 ++-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
index e5a2b3780215..7b44ae0f19b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso
@@ -9,6 +9,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 
 #include "imx8mp-pinfunc.h"
 
@@ -47,7 +48,7 @@ camera@10 {
 		VANA-supply = <&reg_cam>;
 		VDIG-supply = <&reg_cam>;
 		VDDL-supply = <&reg_cam>;
-		orientation = <2>;
+		orientation = <MEDIA_ORIENTATION_EXTERNAL>;
 		rotation = <0>;
 
 		port {
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..178cfad93483 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -8,6 +8,7 @@
 #include "dt-bindings/input/input.h"
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include "dt-bindings/pwm/pwm.h"
 #include "dt-bindings/usb/pd.h"
 #include "imx8mq.dtsi"
@@ -1116,7 +1117,7 @@ camera_front: camera@20 {
 		vddd-supply = <&reg_vcam_1v2>;
 		vddio-supply = <&reg_csi_1v8>;
 		rotation = <90>;
-		orientation = <0>;
+		orientation = <MEDIA_ORIENTATION_FRONT>;
 
 		port {
 			camera1_ep: endpoint {

-- 
2.52.0


