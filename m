Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87714F588C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShNPgz8bvc4EjhIO0EgziOh+vFIQGa2rXp3i6z0Rnm4=; b=eSbyte0wKoVl7t17Y7dMkhQsKH
	7gHuN8quN1zVNEAYVN7nfAdzwwqzyb/lm7XkN1xyy6cRAXRxJeQV/IRUhBUDG6LpSzxCtvjjpxa7D
	0+Fp31iSRrF8dXBeDbjabk4e1VXVGkuaQI+g/c42t9qVGEA5vjwa+gzUhLUBwSt1WFwirq8Jt/7nz
	Uo6O1dmq5pqBMRcEvoWwCXhfsyk0NBPnWOr1U3TScvJuH56dILBwq5CZ7N/ivzsZ3TsNZtTQF2quc
	7KteshWGWcM2OKy0734crfjHmZfTRdsRIvOfhphaDJlyxHG3KpaFeXDs2pksLSzEMvz4pXLi+TBJl
	QrBMF2OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo9Y-00000006vFm-1Twr;
	Mon, 20 Apr 2026 12:55:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEo9K-00000006uzG-1geD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 12:54:52 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EB9838CD;
	Mon, 20 Apr 2026 14:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776689592;
	bh=ftJA0XjrXWcWh0A9bVVXnc785Y/5czIJavleTc/LMk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qLUA7TQMojUxynQ5XHBZDwXDDBzT+yPKmpTNga+zgIocW1v2rQVQY93pLyFsyqNX0
	 ZutFSG2wGM/o2MZRX4d8k62WYz+dJ/bx0JW+UhfS1eKEhNqjNy9YEfxLMXcicerrcn
	 EreqsQBedzpqAr422HtMIEzbSEDmNPbYKWkPR8G0=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Mon, 20 Apr 2026 15:54:20 +0300
Subject: [PATCH 13/15] drm/tidss: Add support for AM62P display subsystem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-beagley-ai-display-v1-13-f628543dfd14@ideasonboard.com>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
In-Reply-To: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1533;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Z0/bujOPUdfgWsjguSYf3/7CnQToK2r3sqOLo5iE8kQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iIH2cIJoxnlyxCngD5064wiw2Ubg3BDIzIhV
 /eVKEool8qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYiBwAKCRD6PaqMvJYe
 9Uu/D/47vs5olQNXHdLuxo2dfHwwwxFiMHrN6V/LndDoHvtSpelIr9i+xGvyVr2O73tOXQmEYEw
 76rHpoIhdGZXfs/ey+8/FnhoJs5F9gDNxbaOkeEjSS2cCjc6R86AtNWW8x3HbvMxHekubvp/eWc
 OsqzovwDR3LLBFHjNF05x6VaUA+rxpdtfhUQeZ0TcYBmG3lKgM4P87q7UMCW44UbiGBFVOaMxUg
 gd2t8wRtECQOKrfWN4fZ3UuEFqD9ehLfKwxqDaXMGl+B5iGKyMWmpWl9ZfiLVYs0odjGGc14OxX
 Pga+H0cLbacn8nCKMHfey/3zosy3FA8EYKAh/SvrCH/Xyp173F71ffpRsmX/e08aUToZ9d28sS5
 YMn/2W4BTkZGSKogzvABqNl1KUa8aDPcVX4MYnRwlfxYmB/ZRwwtFuqm+bekUlflLH/BdC+1IPo
 mQtpKq/JaFXgDueF35CBUKmSf6NbCr2ZjzFJxvLMy+4qkvVcW0t8pbO98CHfsoBA1PZ4DfwixLr
 qTa5RlFhmMDS/8t9FuRDSicnpuh4E6Wg3w7cAP7LwUed3dIE2TQGhktYzE44326zI+x+oAbOXYa
 PzJ5AzIeUrXn7AgLRNd+k4aJU0NZhB3hqeLSwfS89Z/RgqFkzWHd1oNoY2I1EscdFzJmfcF36sM
 evm+Ym3INc95+LA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_055450_962543_A24E26F3 
X-CRM114-Status: GOOD (  10.98  )
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

From: Swamil Jain <s-jain1@ti.com>

The DSS controller on TI's AM62P SoC features two instances of the TI
DSS. Each DSS instance supports two video ports, similar to the DSS
controller found on the TI AM62X SoC. This allows three independent
video streams to be supported: OLDI, DPI, and DSI.

Since the DSS instances on AM62P are architecturally similar to those
on the AM62X DSS controller, the existing dispc_am625_feats
configuration can be reused for the AM62P DSS support.

This commit adds the necessary device tree compatibility entry for
"ti,am62p-dss" in the tidss driver, pointing to dispc_am625_feats,
thereby enabling DSS support on AM62P devices.

Signed-off-by: Swamil Jain <s-jain1@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index aef945101be4..2d056dc1c5ff 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -246,6 +246,7 @@ static const struct of_device_id tidss_of_table[] = {
 	{ .compatible = "ti,am625-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am62a7-dss", .data = &dispc_am62a7_feats, },
 	{ .compatible = "ti,am62l-dss", .data = &dispc_am62l_feats, },
+	{ .compatible = "ti,am62p-dss", .data = &dispc_am625_feats, },
 	{ .compatible = "ti,am65x-dss", .data = &dispc_am65x_feats, },
 	{ .compatible = "ti,j721e-dss", .data = &dispc_j721e_feats, },
 	{ }

-- 
2.43.0


