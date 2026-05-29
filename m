Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458B5CD6E4F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yyfn1S+kqiM446gPjFcTdH4PcJ3eABMwrZuUaedQslE=; b=rRgrhzB8uYWvgLVcIetmZiZqxI
	IW9AajfpPfknk+0CtAgN3WndsCR3pNMDxaXF79LCFaFkKMrXrdk7FyAc+XfiONHfa21E5aHEnrQoC
	lk1R8UYSw5HVTeLFWMunBXv1gay4Y192djnLE8ikh59HT2o41AuvO8890Xd4EifH3NtKQ/d59Ips0
	qMw2YMBA+6ncb0ZT3kHLUspGZmMo4iEv/m+d51x8WCOJ6BfgDoZZrPltee47FSZfhU5APma5amNC+
	SmxlrXKIwgUUr/P43RYWBv7dkoSvG/Q9wqQok0FcNIYiuMpy7Vh8mURau3LhHdXRWUmhOGc58aV2R
	oKFzf/bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssr-00000006zLh-17it;
	Fri, 29 May 2026 08:48:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSssN-00000006ywP-2StE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 08:47:32 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A96EA06;
	Fri, 29 May 2026 10:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780044430;
	bh=wJIwGQWQVF7nXvYZIy7GC96ascev6Pjy2rroRfLoy3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dL7Nb15IJNAJ+HgxmyaRH9ni0e7g2wsadmiQsPja2GhCS9CtmNgvRQeDIRRHXbVLZ
	 szJuNPYc1/I/549QuLF56lxR8iWGY9iGXVlGZlhDucGJrGzhvntPHNiBXrGpn8hnH3
	 GgqHHTom2JHARfZhd0e+mdLhB4X7JQVBHlglKbAo=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 29 May 2026 11:45:43 +0300
Subject: [PATCH v3 13/15] drm/tidss: Add support for AM62P display
 subsystem
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-beagley-ai-display-v3-13-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
In-Reply-To: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=/85nzazta3ZSz2DegZrNcXTx/gK83bzKu5NpUXGKZHo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBqGVKPhfID1DWAq5CXgd5VCH82lv8yt/lkPGSJA
 7gfOwTU01eJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCahlSjwAKCRD6PaqMvJYe
 9R2JEACJGSgd+33+hWkSwInzxOXX+9sCUUuNu+t3vHBc+ivcqVF2uaoX+nnr4W/6melnJXQ59mx
 8j7XqO8RaIzBZljtuCuBPOAbAD3WHz0u6YRkLQpF7fCVQcycFN9ra5RP+/ifYuAuBpfMKmZ8LkL
 y7zGZlds8+BhcKs1WSsIwTS/1zj67X10vEPpsvHSFaO0um46LWxJOlXAmYdjojJWVoesaZ5DBdA
 5HaR4yf89HjNNpJwnN+Ckc1yEluHONUSYxTe3/st8X1smGaQmZpUiBURU87DKAr4/5WYNwgAydB
 +A1gmBruUK6OsoOMTJeFYBbS8XTGodUfu0WM4nKZJXqu/DU/i/QipZA/Vck+upQFyZ0YwawCSVq
 htTzG88u4QpRuWOqZ2rkPPx9dtOGEo801cOdyM0lLcIpZPhylUBF7YyMGW6qm2PiP7pBDkxrHyq
 5iMi+nkiwQmBtRi94jCRcGbZYKK3L3BGqXMtPRDvYjazXL65N+ZeQshCbgzLbw56RwKi+0xIELe
 Lp8ftYaGHs+aM/DHgl0G98IT8fCYLZs+kvhgCMA+QLft6njz6xhvV7e9fKpEeE2xO8Zpp64Jk99
 6MneaXvlViTgNZ45GVMNI0PLl78EO9SyOeGgVRUBzN5KLYMyzfs5l424QGFnN9bK1tr1S7nJRh+
 scot81cdzMOF4rQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_014731_771932_9D8021B2 
X-CRM114-Status: GOOD (  11.07  )
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
Tested-by: Swamil Jain <s-jain1@ti.com>
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


