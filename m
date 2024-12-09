Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BFCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 12:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74SCFEhyKUBw3QujU7m2Ujgf98W8fbRXMPY5M8M5yjw=; b=X6hdhUzojk/a2fnjTpZ5sgffG8
	w/OgAitd2o9QplQ13LpH3YrLhyLABb5BZoeFv7teWK72C0K6iYFM1Jpo2Hns3cBs0CvoRBZMKMpNF
	nCqEm5nyMXwmLUu7gsUU5+6UhaBUEcVBmh8yQ8YarcjLMfOPRi38tQo4FTZ/QGaBXKpA9MO6+XH6F
	mXWcqJ29WaQrU+8AUUaiDMtilN2b+uhgNBRuGjAGEhGNlGukF7gAiCt0DM2cOLS2JrO5B2ES3nICO
	/1wSwjyHnnU5I/iXlN4Uq/DZz0mkC1FhPYb+zSzlrfTA6wFy1JV1fJskTvCNIe4z/I0/ADgZ3HFkc
	345Izvmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKd9v-00000007mAP-0qFA;
	Mon, 09 Dec 2024 12:46:43 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcwL-00000007hVR-1f0v;
	Mon, 09 Dec 2024 12:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=74SCF
	EhyKUBw3QujU7m2Ujgf98W8fbRXMPY5M8M5yjw=; b=mMvkan7X9KHRjf/Ptn6XG
	jdUYzygfkjFLheJg/EJzkjZGrYiefty2e+xeXzR+z/cMY+M7ZjHbkDmtxJOeU/yA
	/v0KvJ3j2JAhUbiT13YjIVAsfRaaC5GBUDQ1Akzm131/c7+b/wr7yvLTbDXYxE7w
	OPX+DFqnuzUCzQSUiyETyA=
Received: from ProDesk.. (unknown [58.22.7.114])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBHDaBQ41Zn269cMQ--.14778S2;
	Mon, 09 Dec 2024 20:32:19 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	krzk+dt@kernel.org,
	s.hauer@pengutronix.de,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	derek.foreman@collabora.com,
	detlev.casanova@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 08/18] drm/rockchip: vop2: Add check for 32 bpp format
Date: Mon,  9 Dec 2024 20:32:12 +0800
Message-ID: <20241209123215.2781721-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHDaBQ41Zn269cMQ--.14778S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF45Xw1rZr1ktrWrurWUCFg_yoWDKwbEk3
	4xZw1fWrs7uFn8AwnFga4fCFZFyan29F4UGayvyas5AF1kZw10qayIk3yUGasxGF4avFn7
	Aayjqr1fuF13CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU166zUUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqR6wXmdW3c3pJwACs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_043241_753665_11C2F9EC 
X-CRM114-Status: UNSURE (   9.50  )
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

From: Andy Yan <andy.yan@rock-chips.com>

RK3588 only support DRM_FORMAT_XRGB2101010/XBGR2101010 in afbc mode.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v5:
-  Added in V5

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index bd8db45eeba6..1f101a3c3942 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1224,7 +1224,15 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 				return -EINVAL;
 			}
 		}
+	}
 
+	if (fb->format->format == DRM_FORMAT_XRGB2101010 || fb->format->format == DRM_FORMAT_XBGR2101010) {
+		if (vop2->data->soc_id == 3588) {
+			if (!rockchip_afbc(plane, fb->modifier)) {
+				drm_err(vop2->drm, "Unsupported linear 32 bpp for %s\n", win->data->name);
+				return -EINVAL;
+			}
+		}
 	}
 
 	/*
-- 
2.34.1


