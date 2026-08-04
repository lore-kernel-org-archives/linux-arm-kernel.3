Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7829C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OdXdwVkKMvJZy3PJIdUzTFPS2ew2EOKKVLqSbTuvnI=; b=ZG5/hv4Se9kzaY/Mu2aoi3LYjK
	9HHevO2NY2D/YXxGb13WkDqxniuzkZlX29LIt7st/15/B7eGniTYJzKspN0FhBwXynThDjaY0htOy
	jtUZSP8C9W2OA5g39QCuPhRy7MwQj/ErkWjpRZ9ye5Ytlc+2gncddyBZ0EYxHE1B8/1G5iA7xc5ho
	5shX9TODbwdm3O7CKXRhhynKlJXNrdYKrMT2jAdskkEbeFuKjWl71LB8C9Q7r7kLWRmL8mTXbkc86
	IJ624c6TEXbgCsLGPPRtfN6ruSVORHcFPfyZZBi5vMjuckN3uwvNuM0Qt6S2/bwT8/ZFPzc+XaJER
	nxGCxwlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Oq-00000001CuP-3zoK;
	Tue, 04 Aug 2026 07:17:20 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9Om-00000001CZM-05tn;
	Tue, 04 Aug 2026 07:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1785827289;
	bh=5OdXdwVkKMvJZy3PJIdUzTFPS2ew2EOKKVLqSbTuvnI=;
	h=From:To:Subject:Date:Message-Id;
	b=ru3iWkOtIVh+/u/mmbGg4zG5fc9wbFylL20SNAVcvq47XocBOiJjzOEQWOe0/4+jh
	 2BJyjyVoeWs2zeA/CbiZ9tDgkpyQ6UiAROiGmiFsQqICSf+rpmgHbe2u29inZqTgrK
	 DVAfT0O8uP42MSs1h85v2NGTQyVWV/ccHnXTWA4s=
X-QQ-mid: esmtpsz19t1785827286te761e50b
X-QQ-Originating-IP: jAGfl1lILVxOAP7hFzihW/Tj4azNJ1oZJNnSI76z3b4=
Received: from DESKTOP-8BT1A2O.localdomain ( [61.154.14.86])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:08:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16862773005327173646
From: Chaoyi Chen <kernel@airkyi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Vinod Koul <vkoul@kernel.org>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 3/7] drm/display: Add soft depend for aux-hpd-typec-dp-bridge module
Date: Tue,  4 Aug 2026 15:07:26 +0800
Message-Id: <20260804070730.68-4-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260804070730.68-1-kernel@airkyi.com>
References: <20260804070730.68-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mrs0LwfWgKNgwzsVLWrapHshH1l90pJ+HbVwwp5zIM4oEVbI0KsG4+UL
	K/a0eEdnSbCxanXPm/fVhgThfPoIps8pqnZs3pWA+j2QSg7o9ftnAJOfITOeRKo1wqamwsT
	fiTKOCcsKptnCiHhfVO4jEeewnb+9zd2jNnrt6r1JiWJ6FXZLVcBju06JA3H+iti6lUNRMS
	sXlKwBCmB/ZLffG/+0S8joAR8+6YPhLlAUvI+Qm88pkOV+I1HAWU1LT8+iw8KP7HG3qybla
	ypmFWKJp1kaW2WtzgT5Q1a9wZv71G+FUqihxVs9d5VtpJPQElxHtMHjx6eURo5B7T8bOcpb
	Pyxa2m0ZmCeUVOJZn6wQ12iwiuRvOCm8wVpF+zDR2GrwRqFHvJ+I5j5wZ8QHOLxgM19HiuC
	j6EZSvk2oVrjSo6DgMizqttXPY/L8WBaYGIHYDDdGWqLuei/G5qivuPoNCGkVarkR0RdNRE
	sG/vCN5msuvIZfzaVqf3XCbmsAJDkJlBgU3uxcpRz3AllTB1afcQTwGkZa9Kri2oFp/OsU5
	lTbQjN5Jgblrjr+KntTu4oBlXGijwnSm3D+sSaVP7jP2N6xSSIE38h0rrYpZ74GEwUTZoHS
	nxn1+S0yCvf4GByJKeJHdEIM3yj6tMoaW8vFchG7/pB13uGqeuU/F+fe81saw4VBEYFdkSO
	bIYdkdsrVeW0RjhQ08im4yFwfsdh5uEKuvlPawjbmTk3S2XbYgGe093hd9bthkBiuqPDwh5
	Hf1lrGtIxf63EFxXroQVwBv7WmB4OT+HBdGbKY7GkI/TGcfyXZ7kt3eNXdOVYSy1Wjvd9ve
	fnR5abAt1xeJbMER3GBUMUIYbxWfIaStlmZEphUfEjU23sf0ukW5lZMGsLND+C6m6gu+tDT
	qKfvlWH5dl15FceMcCc62G7g4PjyU+v5d9IHo/R3PA7x61U6sMida4wEQMCrvqSrFQvqCO6
	k5PxuvIn5VCOQpUmpYhW2YYpbuJUJJOfoB2ZUxHKHHXCrwcjbbNrSRRcNGl70uooSf6CgZA
	LmWjhfSg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_001717_347508_654E1F85 
X-CRM114-Status: UNSURE (   8.33  )
X-CRM114-Notice: Please train this message.
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

The aux-hpd-typec-dp-bridge module serves as a generic TypeC
DisplayPort HPD bridge and is not required by any other
module. Therefore, it will not be auto-loaded.

Given that the drm_display_helper module houses DisplayPort-related
helper code, add a MODULE_SOFTDEP() within it to suggest loading the
aux-hpd-typec-dp-bridge module beforehand.

Suggested-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---

(no changes since v6)

---
 drivers/gpu/drm/display/drm_display_helper_mod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/display/drm_display_helper_mod.c b/drivers/gpu/drm/display/drm_display_helper_mod.c
index d8a6e6228773..f0152d6b0b2d 100644
--- a/drivers/gpu/drm/display/drm_display_helper_mod.c
+++ b/drivers/gpu/drm/display/drm_display_helper_mod.c
@@ -18,5 +18,6 @@ static void __exit drm_display_helper_module_exit(void)
 	drm_dp_aux_dev_exit();
 }
 
+MODULE_SOFTDEP("pre: aux-hpd-typec-dp-bridge");
 module_init(drm_display_helper_module_init);
 module_exit(drm_display_helper_module_exit);
-- 
2.53.0


