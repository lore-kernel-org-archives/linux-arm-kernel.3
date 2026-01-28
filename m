Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07617D46BE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 17:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnS713poB+YyzdGgaOoZvVbr5bFa2FQ/LZh7487hWGA=; b=G0iLbTv7uPjLcroy6XwPAKoV2J
	8PylgGtfRKE0VVsvrOrKMgGBBkjK0TDgYTUwmiGa9E/DBcy/QvIw0FHo49Ea/o++LwYvRWF/bapxf
	Z0gGbKwrkdMb8cTSCknPP2cOJZy4mOL9ZFQ2udlxKLx9ib3vlTifD4+tL+60987Qw0COmUrKAGVgX
	A9U9SiLkAXO4U/Euo7eVzPA/WmlGqyKuxH+agK3L+LpoFxfu+pG+92MIgrBnUfYKjLRLovAshDVAV
	ITWOz/TQfnsT459YMaBW78G9Z7LteJ3zPZdnLZK9crwfj89P+ygDPGTOwUfI8HggtbLf6NGScTIWg
	ucIFmbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9n5-0000000GX0X-3Fjx;
	Wed, 28 Jan 2026 17:57:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9n3-0000000GX05-46Bm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 28 Jan 2026 17:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bnS713poB+YyzdGgaOoZvVbr5bFa2FQ/LZh7487hWGA=; b=cc7OCYX8cxpQwTMwMBu6ZaErN8
	JPWTPnE8nNTRuIEkNFTFhSDmIT0Y/lZaCZIwYgZDDnM5p2SYlbeDTjXAEVV3HYjtgz8EqrCqWtSae
	tfaPMI+KO+0PTFjPwIEDieQGdwEQWd4+PGqEWkFwDuKu+SMazy2hs63DlcRDdHEVM084AFGh9q5nN
	9xhX5IvpZ0W0fCn7o+qEhkYX+6Ha37eFX/9ml5u5+KjoBN+wCDIemvltpLmQlCn0gyDlzH4pRx7bQ
	rpxO/TilB8FJu+cyLX/L7HcMq+6cNgySV2/1rpMupHgfQZs/aZrnVqk44U3POYvByWofQOzftPepk
	il6H565w==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9n0-0000000993s-20YQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 17:57:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 279F34E42303;
	Wed, 28 Jan 2026 17:57:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE6CB6071F;
	Wed, 28 Jan 2026 17:57:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6398D119A882A;
	Wed, 28 Jan 2026 18:56:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769623031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bnS713poB+YyzdGgaOoZvVbr5bFa2FQ/LZh7487hWGA=;
	b=PlQx1TSUk3qeikxBysclRPfrjPgUrXm4+lnXTdPPLZL0wh9H8L/gYbILXGdnr/76CI3Ihs
	CzviA3VASMkPEXbwjd32K65yDf0RKncEcqY9ZFPHR0UGNh7+yOaJeFpMclc42jw3SSLRzH
	OuYzDgnLx3i0Vhn4r7uk15VKjrZPeOViH1SqT19qG17kLJbjLkA8BKh4wnqCxyAGD58597
	ORdbzzNJJIAK3Q5WD1VsKXV2uusYLCarkBQPN8kZMV5l3BYihk6qaYjUz39KZRazkIp1C7
	bMsoqzgEv289SAdRg2oLNkZ+8QsLR5G9FKd8uo3IqGCFsgcsOUKX7DpsMbky/w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 28 Jan 2026 18:55:09 +0100
Subject: [PATCH for drm-misc-fixes] drm/bridge: imx8qxp-pixel-combiner: Fix
 bailout for imx8qxp_pc_bridge_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-1-2138d0933cf1@bootlin.com>
References: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-0-2138d0933cf1@bootlin.com>
In-Reply-To: <20260128-drm-bridge-fix-imx8qxp-pixel-combiner-null-deref-v1-0-2138d0933cf1@bootlin.com>
To: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.15-dev-5464f
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_175714_684328_7DBD5343 
X-CRM114-Status: GOOD (  12.50  )
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

In case the channel0 is unavailable and bailing out from free_child is
needed when we fail to add a DRM bridge for the available channel1,
pointer pc->ch[0] in the bailout path would be NULL and it would be
dereferenced as pc->ch[0]->bridge.next_bridge.  Fix this by checking
pc->ch[0] before dereferencing it.

Fixes: 99764593528f ("drm/bridge: imx8qxp-pixel-combiner: convert to devm_drm_bridge_alloc() API")
Reported-by: Liu Ying <victor.liu@nxp.com>
Closes: https://lore.kernel.org/lkml/20260123-imx8qxp-drm-bridge-fixes-v1-3-8bb85ada5866@nxp.com/
[Luca: backported on drm-misc-fixes where the original commit conflicts]
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 8517b1c953d4..dc1cb094afd0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -349,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
 	of_node_put(child);
 
-	if (i == 1 && pc->ch[0]->next_bridge)
+	if (i == 1 && pc->ch[0] && pc->ch[0]->next_bridge)
 		drm_bridge_remove(&pc->ch[0]->bridge);
 
 	pm_runtime_disable(dev);

-- 
2.52.0


