Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D93BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 17:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uGW3vnuOQowUku+yOKABC0SiawHjWOple2z61d4A5zU=; b=khhYu7FUzCY2SLDAm/bgE0Z6jF
	BkGDU2qRcZn30DhhI4+eAkh86ifAaISQFe3cJdzp5Mej7jQ/+Y8Nxd46E76Vb0x32Hr+uruwbp9uj
	PsYsrLyTJOTFfs4JqEAbgnk3rUMs+/XuemBxdDxs1y+H1Oxt9L8NJD6Zn6jO4f3wA+kU9zX+RAwQ/
	ezy02F99o7MUTGhBdmARLg5i8ApMiWD/Ichj8Up+jq3cnVaSQHrgReFkJSE0seAQYYDIoSmEA4ssm
	VXZVwhqyj1RWQioJEKaTssIQlyAXwFRte+RgNTzZftSnvjcW6D5lPXd9T7b3YxxPiyZ7a8e36g1A3
	/roKm50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4DI-00000008cgp-2IVn;
	Sat, 04 Jul 2026 17:31:36 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4DG-00000008cg1-0cLQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 17:31:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c821a50615so12678935ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jul 2026 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783186293; x=1783791093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uGW3vnuOQowUku+yOKABC0SiawHjWOple2z61d4A5zU=;
        b=ZDctpDo5zrL2y0RackA4IbCe9ihbc4+SwIl0SXWjrmmRPS5FfEU6OJce9qiCIO2LeA
         SbiFuJ0wGTaDDr6MmPeAZNM7nh2Vniblkxy4JUzYiPS06OSc2+on/AHxxXnRYLRg15OS
         BMH2kvd1xXFcs9wGJvWyDAJr3ih3iOSzalA7JuABBJTOs+aREFb+Ke3Fz8dIW+JO3tSM
         PscadcIA09hXrT2FJqqnpR6VzKqfDRgb0O3S+Q2jD9P1jN6nyo468QrHkSzFuBDY9yCK
         mfeFUc5iuTHVrGvUT7rvDk76kE4ehnBM7V6akTIgX8gw2mwa2Z6ARwalDbIqvYh93w0G
         sFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783186293; x=1783791093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGW3vnuOQowUku+yOKABC0SiawHjWOple2z61d4A5zU=;
        b=FWn4DDFIBlKuhDPaeuH7q5wrYm1nlHSuKJPXhKfmk5PGLvc33B+McBbwJZvrsh2qd+
         R47LBp9arcqlmcoyEdNnfyii/+otZYI00cEfi0bOnTjhlMfXms9EHk/sSKF3EyLzKD+C
         TnJs+4rN7yah1QZOXCUuFrgzXygK7SoWa0oqEa3a6O/cpVukD0O1CaRNK9clQx78jvVL
         QYLF4b1LMgOgFfLypiYkjqULyM3yJClFxJs21N74OZrXThy9AXoLj7K0rGAhUVg2K05D
         j7Z77Dy7/2BpMZ8VzDqN6H3RPt+ukpn5Au/eQ3PPiyfZ5b6r3pJd7ATv44FZ//fdyqkx
         Chrw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2PQXKakCia/BdKkVEyitEXTg7LsR7HTOoPNUry05lchGyY5szZfoEb8L7K3s5nAFOIlVy1kwHugvFpyk7iLnO@lists.infradead.org
X-Gm-Message-State: AOJu0YyuehlNfA1hkneZVTFyKgiHLaVEekDGab6c0Eiv0IDK7kMtj1ud
	ihYYZEdyFh61Fv0S4mLl86avO8DJjeQQeUIhnow3i9jQd4V3WwH6nG9E
X-Gm-Gg: AfdE7ckmo4IjV0pIh3R0b2jPp6nZ7fw4iz8skI4qGAFdHaaRDIDWBg8RxH+0lSK4u+Y
	9gj+FmU2KCSFJi/m20a3ZnKa08ZuJR/mFj51srNO1VWn6CkkNPpeCABHwEsPMP4cW7ucFW8hosP
	V3QGr4sojkA1RYkKsK44wkmNXzFUA9foB3kAfRD0Xpg/UtDffKy+Cy17c0OcBGwtcvqXcRZLI1G
	YJyRX8eRD4XN28b//dfOBFqG3Sannt1jt9kIzC3K3zrpok/JuWlyIc7GltyiE8gTQOzkE1+KpvA
	fYMb0pr5CSXYwpAcL1mZzAx1Kfoq66b2L33PRWgDGSxnkjQkXwJQNJRZOPNLgNJ7k7jt98M8wfi
	01hasmA/4vA1lOX36eQQfsNOng+ZCaYnJoB4pv1C9u+5Em4sVuS+YuxY4aPBR48RlR0tBAg1fZt
	r7Og==
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr41657465ad.8.1783186293171;
        Sat, 04 Jul 2026 10:31:33 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71328d8sm25082305ad.29.2026.07.04.10.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:31:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: platform: mtk-mdp3: Fix SCP device refcounting
Date: Sun,  5 Jul 2026 01:31:19 +0800
Message-ID: <20260704173119.254975-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_103134_190018_BA979DEE 
X-CRM114-Status: GOOD (  12.26  )
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

mdp_probe() first tries to get the SCP handle with scp_get(). When that
fails, it falls back to looking up the SCP platform device with
__get_pdev_by_id() and then reads its driver data.

The fallback lookup returns the platform device with a reference, just
like scp_get() does. However, the fallback path currently drops that
reference immediately after platform_get_drvdata(). The driver later
still calls scp_put(mdp->scp) unconditionally from the probe error path
and from mdp_video_device_release(), which drops the SCP device
reference again.

Keep the fallback reference until the existing scp_put() call, so that
the fallback path follows the same ownership rules as the scp_get()
path.

Fixes: 8f6f3aa21517 ("media: platform: mtk-mdp3: fix device leaks at probe")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8f4da4cf55d2..121b1006ffdc 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -294,7 +294,6 @@ static int mdp_probe(struct platform_device *pdev)
 			goto err_destroy_clock_wq;
 		}
 		mdp->scp = platform_get_drvdata(mm_pdev);
-		put_device(&mm_pdev->dev);
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-- 
2.43.0


