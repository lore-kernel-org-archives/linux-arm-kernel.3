Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810AEE7716F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgxhGFMxN+jv0nTpz40bEBVbfKGaKfIyIzOmjG7Utww=; b=zcD/RdxgL6ZVp9mnexTsn+obLn
	fdLD3J74WIvzqNAyRyRPBLy4hOpAd9LgEVHET66q/UJwjKViNOGie/8VI9n8Q0fGj5MDuGNfqdeoR
	LCBeHh+G4le30LqwrrNoMARGOoQKphIU9IAfIaepc+F65/c4JnjIgk8+P3AQmLxFu3BmhwueAh+vM
	AjB5neXoZbuSmISIpXyyA+LiIUxz4wEGj6/0Tdl/BcFc6t4sSI17PfoDpIy203Tmr4NBqziGorIVp
	BQHqSclE6ATJwf8yfoy671kV0emgSqA/YJK4KHGW4pZ3N/oDam+ljC9g81QTOR6Tf3r/YSLJ6xTOH
	wN0PGpJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyxh-0000000ECPv-2rpj;
	Wed, 04 Dec 2024 23:39:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIymr-0000000E9Ke-0ekr;
	Wed, 04 Dec 2024 23:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB9B25C7145;
	Wed,  4 Dec 2024 23:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25020C4CECD;
	Wed,  4 Dec 2024 23:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733354884;
	bh=Pk0XYOaSRK/hR93+uDXH8B8FrNukHwTXjp5RVOSUmb8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7JpU6SLU8CAYTzrG24RXFK4auc0Z8H6RSoOGCArqJ9C0tppXRwJTO+uFEamIkxFD
	 SC9QwZaXJJH9jQk3EPdY1RPIeSeRhpCZra9Qe4YxCP2/FmKVwfjiEAoHK5ujTbYck+
	 7GBhfBB5T3P19lhdcmMCUqkk8PQiXlD0Lzr5Wbne5+JSmU13be7qqjFCKLIWZE/XpV
	 LwdCD/rONJLEAItyC6QBHFXrOAmOXWJtcUIwEwMbLwM06G/SePs0YaVK+2dFOFqVkt
	 zVilk5cC24jHSBIfVnbl5jcU6ErSKp/jULFqChCqUDrHUoVSO/C3NtntSDcYGnf2Te
	 f9tEiX1fn+LJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Saravana Kannan <saravanak@google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	elder@kernel.org,
	sumit.garg@linaro.org,
	ricardo@marliere.net,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.12 08/15] drm: display: Set fwnode for aux bus devices
Date: Wed,  4 Dec 2024 17:16:02 -0500
Message-ID: <20241204221627.2247598-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221627.2247598-1-sashal@kernel.org>
References: <20241204221627.2247598-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_152805_235439_8110121E 
X-CRM114-Status: GOOD (  11.37  )
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

From: Saravana Kannan <saravanak@google.com>

[ Upstream commit fe2e59aa5d7077c5c564d55b7e2997e83710c314 ]

fwnode needs to be set for a device for fw_devlink to be able to
track/enforce its dependencies correctly. Without this, you'll see error
messages like this when the supplier has probed and tries to make sure
all its fwnode consumers are linked to it using device links:

mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) with backlight-lcd0

Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca4598@notapiano/
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Signed-off-by: Saravana Kannan <saravanak@google.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20241024061347.1771063-2-saravanak@google.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_aux_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_aux_bus.c b/drivers/gpu/drm/display/drm_dp_aux_bus.c
index d810529ebfb6e..ec7eac6b595f7 100644
--- a/drivers/gpu/drm/display/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/display/drm_dp_aux_bus.c
@@ -292,7 +292,7 @@ int of_dp_aux_populate_bus(struct drm_dp_aux *aux,
 	aux_ep->dev.parent = aux->dev;
 	aux_ep->dev.bus = &dp_aux_bus_type;
 	aux_ep->dev.type = &dp_aux_device_type_type;
-	aux_ep->dev.of_node = of_node_get(np);
+	device_set_node(&aux_ep->dev, of_fwnode_handle(of_node_get(np)));
 	dev_set_name(&aux_ep->dev, "aux-%s", dev_name(aux->dev));
 
 	ret = device_register(&aux_ep->dev);
-- 
2.43.0


