Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34697E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 23:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6Yuh/OmTAP4BY+DrKFVVUfpaNKbWq2VwOzCNPfHCZ8=; b=xb+zXPY2gsADNErpuSZqjkt0BG
	ymL36DJ/d474kFj/ZHbZoYQjvdeSGkm5mUdBfMKSeCmL92ViDRLxJUrJ7/W98bN8PEdGAVhzvso2C
	ozoL2F28Cs4eyihgo6Oai+lyYmj5/Ar7IVpWGCQBHJ8YfJwHtrh02j7NpS7s17JtWpIqfNsufDRfv
	Mn+3LWULQRqoIunu71Sscv5IqGFSgO9uFScHk8iJTqBGzgknTflMjuBHZlQQiyGxr7VOMixgJrO/r
	oVn3H/EwJUa2MKxeeFCYOuqlFi8VxsSWrnYiDMqHCj3+NIT/3IcD2RYWv4Fudh/lolw0Bgk6svYbR
	7D/Qcz6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIz0f-0000000EDHu-2xfB;
	Wed, 04 Dec 2024 23:42:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyoY-0000000E9mR-0CFg;
	Wed, 04 Dec 2024 23:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76C1E5C5706;
	Wed,  4 Dec 2024 23:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A8FC4CECD;
	Wed,  4 Dec 2024 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733354989;
	bh=4U/41yrQhAgGlFXof3lgFDnpKDOh8dgnlYbwVbFkVHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YX8W2WJeY2k8rHS4Pb68xweHp7QjNGU+hwy3fWi/2Pf5mWQrI6JIkF9gngUlmcH5B
	 6QVZOxr9EyJ+sfIq5mk6fBnOUttZ5aNJygjNAwf/uRpj7AusAK+mCwcJy6W/n1XxSf
	 ocFQ47zjPFJYFUffhJj1755B9YUdwLa5dv3Dx69b5XmOOsbtI414GqMrdNKUChy1Cv
	 d4T/itPa1096jdbagkV2ldTxNUxe96JAIPtXUfMfuBVxUyPtTOLhCWm4EvURQP3FTZ
	 oe0aj60ziSSxgiuJMmp06BKQ0A9mLojzmhFyiOrnB9zuQxU5mGLwjw96oqzWQpDfzx
	 FbhmMb7jgnuQA==
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
Subject: [PATCH AUTOSEL 6.6 04/10] drm: display: Set fwnode for aux bus devices
Date: Wed,  4 Dec 2024 17:18:02 -0500
Message-ID: <20241204221820.2248367-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221820.2248367-1-sashal@kernel.org>
References: <20241204221820.2248367-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_152950_127264_56CF8B09 
X-CRM114-Status: GOOD (  11.46  )
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
index 8a165be1a8214..d15c0f184983b 100644
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


