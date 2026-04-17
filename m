Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E97F43693
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EJE1EtDskVc3fllBZ5ebizZXuuApx+bNxnjPDCy6KQM=; b=P7PZEP+Ckl0EtZ3IAKafY/LhoO
	E+ErD/kNrPkms8sYYYDc2KHMtZZZuWfp/x/jsGoM1gBtYM9VGhaWbNu0XlpnGGLhE9KMVNNxk6fhG
	Y44qyh3/BCQyOyYqzJ4Ojjm8lKy4LBFy/HONyyqaEJe6TyEgqO/JAPmbkZUcIwBCgzli6+LZiSm7d
	jG2Pla6R3vphLaKYCdWsxeZb3t7eg87mum1f0DvZE2oKHbN87EQrM2pVoVvE/5yC6B8NGk0ahxG9L
	pc+IGnCq9DKqSvEW0wl9EseepAVYBN3qlOIM6pLjeNxVI/fQXJCjN2oh9w/R/K+Qat7jpNiEhEScT
	pMueGwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhRr-00000003z4Q-1hxf;
	Fri, 17 Apr 2026 11:33:23 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDhRo-00000003z3d-3xO9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 11:33:22 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8296d553142so379790b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 04:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776425600; x=1777030400; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJE1EtDskVc3fllBZ5ebizZXuuApx+bNxnjPDCy6KQM=;
        b=atbQZOa/nbAKE0gisMKhmGHU7NWdy+0NSaWUInMZahGSUxXae1TCASBddGg6Q90ffp
         iAjTTrZ0NgWXXDhD6b+yHtDf38i0sXabFqL7MmSMj82levOsUqPI+YIV7J2jOxifei4Q
         I8Ajrj+UuGclln+Xwxlpgv3GG9aY2Hrx0mdjwzzJdp7RTSsgdbvDA8/VTb+nBlB+CQV7
         13ZZHqWGtqGJ/KdxeDI3dhAOKFBy0r9vbBP7d5bxP1ONmBRVhynqCN7Ilw3mZCDmE2YM
         pBrtFrc8wU8TmnQIoIQf5xIgzmQ0gpcemYnkJvdoMi6q8rFfO+v3Z2H8yEin6eUSfGCy
         uo0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776425600; x=1777030400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJE1EtDskVc3fllBZ5ebizZXuuApx+bNxnjPDCy6KQM=;
        b=lKnubKOtLdAJ8oS3FqTpq7g1Az5uzLj+H1QMM/ylguOsmOuPcCyF9kXT3QuWAFmU/q
         /lczMAot05ShbyyC45JmtgRIzwhO2e0hJ6l8UAo+lehdn12TWKCzH5y46mWqj4l7SAtV
         Qg7qUKKMUpHydg4Tgo6FklZSiZ/sv2DIKH7jYDvkRBXL0mkXASN0qp90gDfX6x8S6MiY
         XNp/olFi5h7wNDTdbBv4rL3Mn6sBwWlngBMFo8u0yaH47xkXxz1cCmznicB4Ds3Sa/bt
         Yfp5/bItB4oUsL/Ip2viBrp0YD7HALXyBlNfIXed8toVGl4vMFcxufIu3LljeqGJR450
         skrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jEcAsnA7IhrZxWj1/PbznpwvRQK3irN7s/ZXL+D9/b+ctErUdNRZlmb1dsERNL+cw4syJnyDB1WnWOI6c/RcN@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3s/p0962ovjBQcS9K8T3kMiz3/y6/qstxe/rp0WcMwVmHSVPk
	th9gzuGqwEYz+hb7u4f/9iKOEnBa+H1IeHAc2hJzSxSpB4oQBPSnbhK1
X-Gm-Gg: AeBDieuhcnW0ff2x36vh65tfN/e9EO94NSmsgz6wCCG4J1dr3oOcmnuCxfjeAOLDazP
	IzfWlD5v9PFXS6a4ipPADeXHuYXgcCUn9Cxj11649GGaADNKJgXGEsOVAAwPWTXAshL1zkqXnSc
	/z0hCBP6oUswSdKxwoYA8iCrVSTVqBNB0ZPxlcnlw1F8ZXXmJlOi2STBg/LxkuRpqLWtyxPJ4tu
	/unnLqdOt2tK9y6A/5SayJOsWespjXuG4rkG3eX9Sk7GJrV99/mO58Zci2+Injp3pj1ZXtYrGOH
	BFRDQFWUhgOnDjQDhEjJMtpyOxlE+1stRSjlA2uT7ub+x279yNlnm2lAZC3oV/mVhgOI9wqmgu7
	svJJ+KZtMsUttonuQ2P8nLSguWNsxnUUSiUbIIsCqBfI4fBGeQ3TBb67FXByOOLfm5fp/DHUX4W
	9kuZEhtAKgGJgVxVsxfOLXoJiaLO7GhUHCjuOJOXK0SVk5FbgpF+YUSA==
X-Received: by 2002:a05:6a00:bc10:b0:82a:64c7:8c6d with SMTP id d2e1a72fcca58-82f8c8bc5famr2390055b3a.25.1776425599584;
        Fri, 17 Apr 2026 04:33:19 -0700 (PDT)
Received: from dbc5pt3-os.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb38f2sm1610998b3a.30.2026.04.17.04.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:33:19 -0700 (PDT)
From: sai madhu <suryasaimadhu369@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sai madhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()
Date: Fri, 17 Apr 2026 11:33:10 +0000
Message-Id: <20260417113310.2903091-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_043320_984570_6859A664 
X-CRM114-Status: UNSURE (   6.74  )
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

The DRM_ERROR() macro is deprecated in favor of drm_err() which
provides device-specific logging.

Replace DRM_ERROR() with drm_err() in the Mediatek HDMI bridge
driver and pass the drm_device pointer via bridge->dev.

No functional change intended.

Signed-off-by: sai madhu <suryasaimadhu369@gmail.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 1ea259854780..f431fc9adca5 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -981,8 +981,9 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
-			  __func__);
+		drm_err(bridge->dev,
+			"%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
+			__func__);
 		return -EINVAL;
 	}
 
-- 
2.34.1


