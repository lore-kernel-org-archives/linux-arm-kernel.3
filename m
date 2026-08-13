Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56EFC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4182N1qJg8wcsdY0I1VphGRMJvbBfDpbj3gNAH48eMo=; b=5AFKSRXkxd/OV+Wn26FBYk9ZYF
	F8bb+PuwoGr6HknFOAGnlRsUl/6hKP9yM68+eSHi11GZYdlQqDgf/vqq+EJQAmbQFdJZspG2/iCDT
	fMQeTekm/xysjs0xDwE81V6PeIVqylCPRAEVvSN9jwovMo6qVvfo9deUpbLM7SJKQcECF3VDbQG3o
	IChQwtdO8VUgCaw0DxjBXt9i0zU1HxP+f8o2Pq72c/Q8jM5FF//oIYbm1P+Y0zbo+eQaK5rN3wSuT
	KnEOclh9Lxg7d+v2P1GaezzUIelHIvjo2oDEZAKFqxCtzjIs0fb/ljJOwv2V8UA7/+z1jiGewo4yj
	whURqQrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWc9-00000000rOO-0EyP;
	Thu, 13 Aug 2026 14:41:01 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWc5-00000000rLO-02WC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:40:58 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-481595afa73so43295f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786632055; x=1787236855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4182N1qJg8wcsdY0I1VphGRMJvbBfDpbj3gNAH48eMo=;
        b=WDCNItftxIB39lQqMVQ92Ud7HaxYZnTjlClEUodUqbWjcN7AdZy1DcvL0lfr8jjpfL
         nDdEOp1DOV1W6TV/4P75J7J7G2gtuAVjNLV5Q+1tl5yPaDU1bI0+smTKQzopX5N08KOM
         co+ukoq3yhIIejO8oUz4lycoSoDDWHLla/7RUFPyl2PnZFyoCSTLH9sP9+oqdFnYCh9k
         4sny52JDCnLXLpJbGcH70qHvq9BQ55jYLtHUF9QqINZ3bt8iFa0mgV0fQhgIM1wYzcNW
         T+TnEWu5eGAIKFEN3uCifjwwO4RZwmMGtE7sj6TuoQyRcFVa40bTDMlW7C3dFyAvsTGm
         j9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786632055; x=1787236855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4182N1qJg8wcsdY0I1VphGRMJvbBfDpbj3gNAH48eMo=;
        b=WwkPBkJvJ+G7ZdKqVyJ18F/h9C+AtQAOcDyPW9z7a9BbAL+iBsgJyoqeqJEl2cZwnD
         D29tLQlg+NvgNibkgke0LTweK8sOxlCE7ZO614tA8ScdOPlOTKJKRkQ69AomkYGNeBNP
         4tB6WDwz7yc+a5X9nDn+loHbwYpZ68RrZH3NpV9JWp9NNUv6rnJTKm4bZH38XJA5HCUs
         rJEKb4qbEf4bf7h6DAEdZ8MEm2PZPFD/il0RsmZ4seWRetEJXz5SUJzelNYgAzuup1/U
         XLRuguZxWYQ/UuBLYFP9GhsGyaSaNvVvr2kVPCZ4QAwuwzVhIf54eXMdkMp/3nYE4f/g
         8Xdg==
X-Forwarded-Encrypted: i=1; AHgh+Ro54Lh3V9cY3Sg+EFR8TlpsUMopDNSgF+mTkVSThO1xs4iFr/UPtifQ+8W9lOAOvmGPjZI+n6AZ+wV16G3sDFum@lists.infradead.org
X-Gm-Message-State: AOJu0YyXDyxCJvb1GHGFTvu6AplehwCVLt6/xb7YYMZQZ2h20h79pr1L
	h+7Mn6THOhJw9TH9apGABeV++9GFm7xlaC9O1OtQk4PNt0z1m6JLP76R
X-Gm-Gg: AR+sD12TpgsmsXeV+mL02e0zoDLaNa6OjFq1bZcl6ntRmk4tqDgAlcoCoc7/bNLl8ud
	oJqUudXrEUNCHTNY77YiOS8U7TajduaYBPuT6Hzcv4ucZtGThHCbNQlyoGeTNRNIlpMc8DdmzdD
	MkYJV27cXrICtCL7mbGHZ2HpayM5JEAqZ1zg+suPb2pMs9PCZYuJsgsV+FkV3Tk4eykE6QfB5Kh
	dVdfrwEQ38JCMVX/5LuQUXG0fe4AdQFwP6gY6jytCgmzK9fHml+QNHsYI20RqrJWnKTGewVvmyS
	cS6H+ZBKUBcknnVVYJmhGtZDZsqGw3TlrGxK2lOtGjBFJi92j6t6eN1qOrGodsQtrWbT8UgyP4A
	qdrNtTR9cgNh2hV5aSnakWr+yvJqcGjOsamuMIYmxFaizPCY26OvnCWy9vuSbFHZ6sqlzRO7B1p
	+Qvtb1XiCSVHJ+lcyUY8MXq0uNOIx/Qe3U6oYpZaXD5bffgkL6QeWQJaRCaYFOUUv15luzrzq/O
	B2nzhSSepEI+JnARs+7pPofI/vM7kX0uxttXD+yWSFWxZLN2VJD1SSU7khJRg10sky7Kw==
X-Received: by 2002:a05:600c:4513:b0:499:5b0f:72b with SMTP id 5b1f17b1804b1-499821aa11emr43142705e9.1.1786632055178;
        Thu, 13 Aug 2026 07:40:55 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B911C00AE6C52CFC8961284.dsl.pool.telekom.hu. [2001:4c4e:1b91:1c00:ae6c:52cf:c896:1284])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b58700sm66426445e9.9.2026.08.13.07.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:40:54 -0700 (PDT)
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
Subject: [PATCH 2/2] drm/rockchip: rk3066_hdmi: Add missing Kconfig selects
Date: Thu, 13 Aug 2026 16:40:19 +0200
Message-ID: <20260813144019.12089-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813144019.12089-1-royalnet026@gmail.com>
References: <20260813144019.12089-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_074057_069871_9D3E9DCD 
X-CRM114-Status: GOOD (  11.73  )
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

rk3066_hdmi.c calls drm_bridge_connector_init(), but
ROCKCHIP_RK3066_HDMI selects neither DRM_BRIDGE_CONNECTOR nor
DRM_DISPLAY_HELPER, whose module carries the bridge-connector code. A
configuration with ROCKCHIP_RK3066_HDMI as the only enabled Rockchip
output option fails to link:

  aarch64-linux-gnu-ld: drivers/gpu/drm/rockchip/rk3066_hdmi.o: in function `rk3066_hdmi_bind':
  rk3066_hdmi.c:(.text+0x7a4): undefined reference to `drm_bridge_connector_init'
  aarch64-linux-gnu-ld: drivers/gpu/drm/rockchip/rk3066_hdmi.o: in function `rk3066_hdmi_bridge_atomic_enable':
  rk3066_hdmi.c:(.text+0xe74): undefined reference to `drm_atomic_helper_connector_hdmi_update_infoframes'

Select both, like ROCKCHIP_CDN_DP, ROCKCHIP_LVDS and ROCKCHIP_RGB do.
DRM_BRIDGE_CONNECTOR in turn selects DRM_DISPLAY_HDMI_STATE_HELPER,
which resolves the second symbol.

Fixes: 57d6811e8a6d ("drm/rockchip: rk3066_hdmi: switch to drm bridge")
Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
---
 drivers/gpu/drm/rockchip/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 697c0748eeca..4e58685f58ff 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -146,6 +146,8 @@ config ROCKCHIP_RGB
 config ROCKCHIP_RK3066_HDMI
 	bool "Rockchip specific extensions for RK3066 HDMI"
 	depends on DRM_ROCKCHIP
+	select DRM_DISPLAY_HELPER
+	select DRM_BRIDGE_CONNECTOR
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the RK3066 HDMI driver. If you want to enable
-- 
2.43.0


