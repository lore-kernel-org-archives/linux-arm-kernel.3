Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B9CD3425
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5EkScrYGZ4MJD0Xb7a0j6yPmDr6jM1ZneOg32BJiv8=; b=Fw2qoFGnayzw262q25N6yEbCo2
	Ga3PECtxOKUNvbeK+ssNHvge5B/aZZYF0qD2RObhxIvM9dFklKGNyeeKR/6ERzZHSbCgglKqOj1Of
	v2rSp89Lerq2IoQN7G8RHGqqzqIspYcdC+g2PcZwTu/q1HecP770NOgU+WqbBkhumvoaHE8b6pE4l
	R5uaAujtOQs1CEFzixR/1otmRAeOBkYsEFLpdhHdMxjgYlL2XB7Da0bRxo4EUMDrmBivmAfFslJZc
	gA8arXymYLdp9i9hXHyyHOfGBIHVBGw9cntBClnEkHfe6Wx9oso5K3Rjn+XCy7QY/GjOtdRq0kT8r
	fNVWHS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkg-000000062Bo-1Mvj;
	Thu, 30 Apr 2026 22:20:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZkP-000000061zs-43rd;
	Thu, 30 Apr 2026 22:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777587637;
	bh=QomGHZW/FC7YCeotchHbkL/EFXCUs9zAs3hd5qwXqtQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RkVlz76TQCd63Q/kYuDZJmnC5zcRuCcE+azDTmdvUPejn4aYSVm/Nhqm79f40jM+p
	 YvHUDYoQkv8J+9u+vc4fDTf/QCHKIxB9NzXSU00UKLQXYvLY77mtEDNQdvuiEwIU9o
	 cgAGfN3iSCYXBcxhrVEHbFPY+GgpS+9ztFEkDbUN0N3tCdO2saG1qoG8TAzZeKxM+b
	 dFkt2o+HURE7ye+3d/xSLDy4YmGUQW0Fez10SJL0sMwvA5pVrwT70K2F+GG3OUf0GZ
	 AV07dhe8Bbl7K46iBiu/dW9NYOSOdyczBGF093nncoDo9kPiPNTThyA94shGIHisKT
	 NGSMyEI1iSuuQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 60F6117E1553;
	Fri,  1 May 2026 00:20:37 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 102A4480028; Fri, 01 May 2026 00:20:37 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 01 May 2026 00:20:28 +0200
Subject: [PATCH v2 01/12] drm/bridge: synopsys: dw-dp: Support
 unregistering the AUX channel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-synopsys-dw-dp-improvements-v2-1-d7e7f6bac77f@collabora.com>
References: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
In-Reply-To: <20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1717;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KVUbP2LF4Dc5Xhc4nsxpqOt5dErAkqqa5xyn+yU/zfo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGnz1bRnotRIY9hREv+0yv/5f+Lswm3R1y4d8
 mtgBfnzaP96FokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJp89W0AAoJENju1/PI
 O/qaepQP/RWTLlgpZfq76hDL4H/eEZXNlxQNDKF8YsgAn5XQstqOOCanyoUlYmgs3VgqboNAOSN
 nBsz0+PfwLbvBAic/64V9OUJb6mH1bi7QvRwh9lZgiOPGs7ISQSeY8mG8a+uQC7kvfM6fxjbcHh
 9WtvpGJ+WXOpnBQFXYwtjDfh5hoEegJ8/47Tayj0HCv56Dalb+R10NdBqpPHq8TclURtH2jlEy7
 VwxW4nk9YnRtZsQbZUXD1w4tpjyOAcr3zrCdN+gkyWuPC5e5YlE5fzhRkmOxFQjOsMdRE0tWJ0f
 rRJkLmmqySaJ/bw6h92MbMZ8hdj2s9FGTocnpdi1djB5jaEUbsXoZ7+VM0rMbkDa2bItmvcniDv
 8J1k7wxARNQrxS+ZrzfBuG2Fds+1ErLLoEy3tgO61tl96ovtty8SFf3INPIhz+aV/vq6D/qjzav
 xeNYmvF5ARBv191IHQ6BDHd3kl8ws8j8w+tLNpQZxLm97ziJTbwIR3ULefAMXW4SAWq5OMJ6/ju
 hjaOK36YhAF4hAFI+nurGUK5uKIs6OYVxU7LOd//yiROYEQSTlaEAaWyjVBfe+8i33GaMcnXs6q
 XGni3/Nzs1ba6bFrLVC+oRkPYyMwCVVNKayJLi9OI04VazygdzWdvdlkda8bhNcc3kyijeljUuj
 MqfsSWKa6f1NHlna492c3hw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_152042_164312_7EFDAFA9 
X-CRM114-Status: GOOD (  11.21  )
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

From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

The DisplayPort AUX channel gets initialized and registered during
dw_dp_bind(), but it is never unregistered, which may lead to resource
leaks and/or use-after-free.

Add the missing dw_dp_unbind() function to allow the users of the
library to handle the required cleanup, i.e. unregister the AUX adapter.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 6 ++++++
 include/drm/bridge/dw_dp.h              | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 3f4530c117c7..6211ba6ba7bd 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2093,6 +2093,12 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 }
 EXPORT_SYMBOL_GPL(dw_dp_bind);
 
+void dw_dp_unbind(struct dw_dp *dp)
+{
+	drm_dp_aux_unregister(&dp->aux);
+}
+EXPORT_SYMBOL_GPL(dw_dp_unbind);
+
 MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
 MODULE_DESCRIPTION("DW DP Core Library");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index 25363541e69d..22105c3e8e4d 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -24,4 +24,5 @@ struct dw_dp_plat_data {
 
 struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 			 const struct dw_dp_plat_data *plat_data);
+void dw_dp_unbind(struct dw_dp *dp);
 #endif /* __DW_DP__ */

-- 
2.53.0


