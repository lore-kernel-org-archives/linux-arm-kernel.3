Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C8C10F3DEE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 18:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVaaXSclUHjQDmoI+yvz5Mlvls2RxxcHW4QNeNejVb8=; b=nv8lJUTxdhL3fS//5p2Etm9VWE
	S1j01g8VUdj06d2hheLzOdGSgGgEWHq6sEFE1ZQKGr2eA8QHXXpVbTfMOAvrMXlXUydCLpY4p+N3I
	CjWOczslBqpuSH2XvZmPxAgx0WYfM/1ZGs3Bo+1zqIZbIpgH8/gFMduCHPm1P2oE+wDaKcCCWnolm
	t4LYy8Gy+yXozV1jR4y12UTjCQqywWHWt8pzWmR5f2eOl661GKvOifft/RRLtjXlR0wWs9TFiJULl
	Lu8n2nQ+YWp6iG9mZfBXD4klpsX404T/9CV9cl84nBjqZMk4wQyP0lDVssLSZhv2JK3hxb+Te3uF9
	V5B/Nv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ymq-00000009D8N-3iVK;
	Sat, 28 Mar 2026 18:53:32 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ymm-00000009D6i-34yf;
	Sat, 28 Mar 2026 18:53:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uVaaXSclUHjQDmoI+yvz5Mlvls2RxxcHW4QNeNejVb8=; b=OsZEvIIIUi9TPtgNM0H+Tmd/F/
	IcnkxgJCpnqi2l/t+wRJoDaexqx2dHhu88jeAwDr363TrFhKYDiSczUIo796D2OIrYWr8+Wp39Y8m
	2DDtxx/Jtp1kIVEHljkV6xBGBRVtov0rCFShgc/ccOLUOJOi1PtW4YzzpQR0lY0UtuIRPqcVgtmh3
	JtnSByXTUepxKynSs1MqN5aL96U7W7icuumSMA0YHCkOhOqQrKI3KMX4GfJQ09KBxfWP5kiM195lI
	vT7LafY1Q7gYsjk2jL8ZZDqccVP09hVwh70doLZd4SF21UKvzrgEgIF9nqcg/uCaqnU9GyjEMPh4M
	PjsdtSew==;
Received: from [189.7.87.169] (helo=[10.0.0.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w6YmX-007f3o-4r; Sat, 28 Mar 2026 19:53:13 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 28 Mar 2026 15:52:47 -0300
Subject: [PATCH v8 1/3] drm/v3d: Use
 devm_reset_control_get_optional_exclusive()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260328-v3d-power-management-v8-1-94336830df5f@igalia.com>
References: <20260328-v3d-power-management-v8-0-94336830df5f@igalia.com>
In-Reply-To: <20260328-v3d-power-management-v8-0-94336830df5f@igalia.com>
To: Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=3nNgQhCOGgpwrqkW8e02Abbe+S/9/aOOeutqX6yGtvs=;
 b=owGbwMvMwMVo/5mvq6zj1yrG02pJDJknlCd+L7Uv5N7xNtqHaW977JwdrwW1Qs+4bMs3X2Brx
 fbnMF9tJ6MxCwMjF4OsmCLLjyextYxi5eyay8ovwgxiZQKZwsDFKQAT+RTG/pstYsmy5LaZKQLJ
 zdqpxcHaT3z3zLq47oGzhVNo/4YTugIJjwznePbnzVl8hF3qbYlTyc4QdulVbqILW32fPom5GHx
 13zEWy2yx3oInu7d4nniakFemZTk33mWKy4xNBgHt/65/fM777kU104I8w76td35Z3Csp/VzXuN
 N4eZ4ti6qmZrxTK8fSlhf9t1Li7T37+H4eP3n0TJyGh8ZntoMS80t6CpT8nf/mS2qt83C6NkN4T
 kex0jbOKez3rRnOhtrelPZQKq+7t1nDov2RnJT4PR3bin45+Sfbw3ICv29ROc9W+Xu7kZjODZ97
 EYf2HA561WjLkuvh8uKB9ALl9xm2uQ2mmWeqDs57bJoLAA==
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_115329_075579_EA8BFF2F 
X-CRM114-Status: UNSURE (   7.72  )
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

Simplify optional reset handling by using the function
devm_reset_control_get_optional_exclusive().

Reviewed-by: Melissa Wen <mwen@igalia.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 4b441afcb602de08bd193d57649121e44ab31f2a..c5e7c778ec7a1a39d81155f7ed2a7ba811b5e3aa 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -401,18 +401,17 @@ static int v3d_platform_drm_probe(struct platform_device *pdev)
 
 	v3d_perfmon_init(v3d);
 
-	v3d->reset = devm_reset_control_get_exclusive(dev, NULL);
+	v3d->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(v3d->reset)) {
-		ret = PTR_ERR(v3d->reset);
+		ret = dev_err_probe(dev, PTR_ERR(v3d->reset),
+				    "Failed to get reset control\n");
+		goto clk_disable;
+	}
 
-		if (ret == -EPROBE_DEFER)
-			goto clk_disable;
-
-		v3d->reset = NULL;
+	if (!v3d->reset) {
 		ret = map_regs(v3d, &v3d->bridge_regs, "bridge");
 		if (ret) {
-			dev_err(dev,
-				"Failed to get reset control or bridge regs\n");
+			dev_err(dev, "Failed to get bridge registers\n");
 			goto clk_disable;
 		}
 	}

-- 
2.53.0


