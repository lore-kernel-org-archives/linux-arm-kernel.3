Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7A1C5DF64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rW6YbGwCwODCemZSHGPE83tUot0DKF5hC6yD4MR3y14=; b=UYofVdY8ZpnNbKD5RZLGeDgJDT
	9CsbusQSi4HgJpjLySM/GHkFCN7PC+6ooJJT6WktNc62LOwSK7zJDTpsXOwfMrmxwPRQdyhtp+z79
	an04qTCn+1p2Iqdh02aM+qYCM3d+O+RH3eYZJA6MX5M6CYS4Wn8DFp/r+l3Onau7ioSyaGo32bACl
	b34qV6w8F31GOEUTOG31sq9vknHfU5G7fzd2XmzqLMYt3YeIYr6skakC1tQwESt6MwHr9k3GFtWfa
	SwUgacua/SnMaT5lgBVEZNVHTtLd7cLRcMcw2rcTUw3FjC//MeaS3IDKL4u19t1HtsqzIIid1tH8l
	hYI/D3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWc8-00000000rOD-3xUu;
	Thu, 13 Aug 2026 14:41:00 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWc3-00000000rKC-2oas
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:40:57 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47c2ae992beso169760f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786632054; x=1787236854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW6YbGwCwODCemZSHGPE83tUot0DKF5hC6yD4MR3y14=;
        b=paz810gp9e7mSkPP5s9pnX4ffC+DKgCYyXifqbBDZcAIqWuEUOtzJA8D/m3Eg+dD+2
         S1tYiZzSUEk9PcSzWhSiop6m9ywGcyrhbuQxTqsX32v+x2oV/O8clWVJM+2XpEUfhyLx
         bZcnuYQe5ezmrRme1FSKQs+W6+BcioRwV2l5bcQceKlkbhJCSxmVXahyNLzb+NVMJp6c
         ZjONEb93g0hkmt1kzOJSGe/xLfKWoSNyZiXGdCxU/z0EX/RovFqMqr7fjSOfHuYWFIOl
         CRAw0V5Kaj8hcMIYVDCzIObv/tZg35fjnhyPPlCo2uXpELG2JcJh1pVjkEyaBCBlJ3UA
         bagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632054; x=1787236854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW6YbGwCwODCemZSHGPE83tUot0DKF5hC6yD4MR3y14=;
        b=fqI9UaEVUlwTdrcaSsStl91ESy7JezmZssshfY/jzKUnv2BIITmajC82zpqGYidaRl
         Y/sbX5lQbCOMZpqoMJkkrcjY5xWil4nsM/u9qpOn4b9aQVLbx54y4SegqIRKwT/XRo4F
         l/s+OtMby9YKVkqNrYjLDV7usHHInpFZnM+PCP/J9eji+45rdjK2b97DSLinGLB2zDV+
         gK1IFeeo7UO6bmsaKKZ7GOJWpUvcaLPA0331X2lu4l255y4zaLe4YN3RyMLr8GdCYInb
         bKd85mNqALcqy19osIQ/nX0MnEDP1M6xQu/YzJoJ7so0nbirXGycxgKkFU0bWsCQgXN5
         9AjQ==
X-Forwarded-Encrypted: i=1; AHgh+RplrixCPg87AD4lMzZ8xaJFrkWt8n7M3SDuAlgP9Ym2mmxiEFCRjecMcokss3t0/rehRK0W4GQ4mIrFmkp3B3V5@lists.infradead.org
X-Gm-Message-State: AOJu0YwcnGRdb6WLfJsI5kqZGxepR5lfzU2B3sv7psVBcogK6owCP+Hz
	1/4tltjZzM9ESZptKo+kZZDLCaYl9htCkHATGYEF8MjQcQCyfBwkJol8
X-Gm-Gg: AR+sD10AZB4YSTID/tgd7DRl001fggMHOqJAKktDcUINxSvutRZYuVwcW/tbDBKddri
	XNIoeicHxHUWiRH+8DWN3PUVAg6liLGo01IQTffPeBPjruQ4U+0P/6Wtes/n3smxCOTu+Abq6s0
	tdVYLfiGGX3SkP5rHwehWR57EecPfZaCnj+6AkLk05gxot1sV1JBYpysK9hVxp1NknY1KaYpyAz
	QpbUJO8VIg8UxTJc19BcVQlc5E1axbqPyoAu6T2DHWBC/AB8iW24N6ADop6+VnBqn+bmV0Zyil7
	xwT05s5HIvISnBb76ngn9eGvYOtglrmLI8ANLzm9nk7Tn1ZcRwUKetIY/QgVVXL8gskuMtXNe1k
	SDgS0BbG/OfhVQOoAiNweym/0QnMfbf5+i8RITg4t1sNMCCHSg33frjFz5WsLqKIpWDfyWleJqa
	Oqun05v8yQCR9kVVUN1NyL+LEMpK0+oiJVZI/AXmz9acb68mBql6TbODPRCwVkbz4I5gPF9tJxJ
	xEZjNqHGPj05TW0EF2rrkc6R7Lgkmkvnd8HocOhmQ1SjhspUcvlvGPOt6bnp+frwZrVhw==
X-Received: by 2002:a05:600c:4443:b0:499:73ca:c419 with SMTP id 5b1f17b1804b1-4998265873cmr41318505e9.4.1786632053713;
        Thu, 13 Aug 2026 07:40:53 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B911C00AE6C52CFC8961284.dsl.pool.telekom.hu. [2001:4c4e:1b91:1c00:ae6c:52cf:c896:1284])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b58700sm66426445e9.9.2026.08.13.07.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:40:53 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Marius Dinu <m95d+git@psihoexpert.ro>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH 1/2] drm/rockchip: dw_dp: Select DRM_BRIDGE_CONNECTOR
Date: Thu, 13 Aug 2026 16:40:18 +0200
Message-ID: <20260813144019.12089-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813144019.12089-1-royalnet026@gmail.com>
References: <20260813144019.12089-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_074055_717243_1EAC4F38 
X-CRM114-Status: GOOD (  12.22  )
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

dw_dp-rockchip.c calls drm_bridge_connector_init(), but ROCKCHIP_DW_DP
does not select DRM_BRIDGE_CONNECTOR. A configuration with
ROCKCHIP_DW_DP as the only enabled Rockchip output option fails to
link:

  aarch64-linux-gnu-ld: drivers/gpu/drm/rockchip/dw_dp-rockchip.o: in function `dw_dp_rockchip_bind':
  dw_dp-rockchip.c:(.text+0x1d4): undefined reference to `drm_bridge_connector_init'

Five other Rockchip encoder options that call
drm_bridge_connector_init() (ROCKCHIP_ANALOGIX_DP, ROCKCHIP_CDN_DP,
ROCKCHIP_DW_HDMI_QP, ROCKCHIP_LVDS, ROCKCHIP_RGB) already select it,
which masks the gap in any configuration that enables one of them.
ROCKCHIP_INNO_HDMI is covered through its DRM_INNO_HDMI core option.

The same change was posted by Marius Dinu in March and dropped when
the failure stopped reproducing in his build. The failure is
configuration-dependent - any other enabled option that selects
DRM_BRIDGE_CONNECTOR hides it - and it still reproduces on current
drm-misc-next with the configuration described above.

Select DRM_BRIDGE_CONNECTOR like the other users do.

Fixes: d68ba7bac955 ("drm/rockchip: Add RK3588 DPTX output support")
Link: https://lore.kernel.org/r/aneNCDU12OzG99UX@venus # ack to handle this apart from the dw-dp series
Link: https://lore.kernel.org/r/20260319155051.1944-1-m95d+git@psihoexpert.ro # earlier submission by Marius Dinu
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index e7f49fe845ea..697c0748eeca 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -68,6 +68,7 @@ config ROCKCHIP_CDN_DP
 
 config ROCKCHIP_DW_DP
 	bool "Rockchip specific extensions for Synopsys DW DP"
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  to enable Synopsys DesignWare Cores based DisplayPort transmit
-- 
2.43.0


