Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF516C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pDSeFk+LOdLdoQAIClpWcVVVNDGjKxQEEF+U/Jv1pBA=; b=3zsFVR3S/DCAtLodX9kKYVcZHO
	ho2A8bBLYl5lnAetcLxzHqXOO8L4fvNSucWFpyw03q/uEgagfd3EQGQRdxaP+Vt0OAYm2N0CeuskB
	CM6n6tkz1FXRoA5Rnj/N4kek1cv/C2qvgnPzdgO+K4x6pdirVQCpWKMP1S36dCBpCseAREtWhOwq/
	JxG2KZgw4cO5vePM1Opn8/SxEzxBg/rX1cXAfHAcPTTdB9HlKB3SVosSOILAJyUadpZb/8aKjhgL6
	W4uA4lSZsWgnQfcJpr+jWSd9HhKIbrnhTwYT5W3wpAtx8aSAHsum/xXosx7urQp0/Q5nypoUWCgRA
	zPGXOvJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta96r-00000007BPu-2OKE;
	Tue, 21 Jan 2025 07:55:41 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta93B-00000007Ay1-2VlM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 07:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=pDSeF
	k+LOdLdoQAIClpWcVVVNDGjKxQEEF+U/Jv1pBA=; b=ahj6IIUZMKJCkYc/gVT5k
	2LojJslh/h9nEiHrrOLFgAZ4OO091ZLdH+d/wefRgNJOP5vs0XtZ7FvLJ0+wHwdW
	GYHtob1Pryh43Zsk7BBsPMfInpZbTiZyDlrTeVYgJSrP08yDHmz08cmy3BJgStoV
	iza9kQas21cbXJmklBsd9k=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3TwjcUY9n605cHg--.59188S2;
	Tue, 21 Jan 2025 15:50:53 +0800 (CST)
From: oushixiong1025@163.com
To: Joel Stanley <joel@jms.id.au>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shixiong Ou <oushixiong@kylinos.cn>
Subject: [PATCH] drm/aspeed: Use devm_platform_get_and_ioremap_resource()
Date: Tue, 21 Jan 2025 15:50:41 +0800
Message-Id: <20250121075041.201599-1-oushixiong1025@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3TwjcUY9n605cHg--.59188S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFW3uw4UJr1kAFyrJFWxtFb_yoW3KFbE9F
	48ursxXFW7Aryqg3y2v3ZxCFyIkF9a9rW8GF18tayFq3W7Z34DX34jgr1vqr1a9w4fAF98
	t3WUJr13A3s7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbqNtDUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQ3bD2ePUAodpQAAsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_235154_038373_5112C655 
X-CRM114-Status: UNSURE (   8.98  )
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

From: Shixiong Ou <oushixiong@kylinos.cn>

Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index a7a6b70220eb..33f81b53771d 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -146,8 +146,7 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	struct resource *res;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(drm->dev, res);
+	priv->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.25.1


