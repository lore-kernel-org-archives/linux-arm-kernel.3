Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BB2C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JGVhoJBTQ+C/shIBMcaZxxiUzHSDCbdKbDb/tDZozNo=; b=HpfkGnDfyXzwZtZ8yxfAR8U7Oh
	SlHS7W6JWHS0Dq9/llttOfxZMePcNKzoK3eK66IjscG8Ex37mBgcfABa+oPwA/Sdmz+bcWW+zkT5c
	FlobWqWlMaMVM3t4w/qwZTWk2UPV0fPjtXei3Met/jPscyJ7MtyNwE0BEHmr3UuOJKsx2vTbZG9K9
	qtMPYyzzDFZasDxFRSXyBFIv/AjglQhCXmJFfZN3tbs3rbNjTshVQG56nn36KUSxmj8a20HUxGOju
	3Pp6bw4kRIvTp8eJxdLYR/AlgqZhVEgwd6ZpgZDLvXl/fF1cOfCBQROKrtgDJsg6Tcc8wkoxw9WAc
	xZXz5ouA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7MP-0000000FF9t-1KOe;
	Tue, 07 Jul 2026 15:05:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7ML-0000000FF8X-2Ykg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:05:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cace91f112so37422455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436716; x=1784041516; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JGVhoJBTQ+C/shIBMcaZxxiUzHSDCbdKbDb/tDZozNo=;
        b=PWoqVY1QaBKMmvMb8Lv/6R3F7cJLR6IaWQ8pF/AM5fr/dP0iYtdukxpoBBymIx9Ec0
         YIG2qU8u2CS3R2SgpJ2YlTB533Rx9j9HVbDcfgXFsP4jXhonI7zyV/YHe9dV+bD1OU2X
         QqL2v6EhQf+onL9Lhy0e7njUvTUaBq2PVTw5fcKoInVkG7Ta5/AeL6ZC2C888A6t6rHm
         qN0BvkeT4jGG5PqlYn+xHWWZH4GvblEU7j9U0vNscGRindw5TRPuf5h9/F7w7csDd2cL
         2TLEg0ydbCCvOhfgBzrCZv0OrNhTTGEIW+Bcha/EyFPfC6mAB/NU/M8XQLYQLNkwabMN
         xrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436716; x=1784041516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGVhoJBTQ+C/shIBMcaZxxiUzHSDCbdKbDb/tDZozNo=;
        b=Dx1DGHBZabp17/KqTTEjfCoY2vEBi+LIqP34xRO7+3pA886NA1l+DZhqWWv+8VDVSY
         todqe0ogfQAx8YSnDybfsz8krOdqOz9dMv3nyfwoJrsDDwIBgGdFR1X8Pbj5GKAGJljT
         7oVp+MXrn+cLLgyWaX1oGN1IQhoAh+05dqNimC4Lz0cbjZAeOFW12Lf34rftcOiByNEt
         VG4F+AG+UQuoGbKky4O0ghvGc68zSnHmhdixkApZvRIN0iNTqC9y2OZpTHZFc4x6EhKe
         vPpR/KCP+Smt420pATV+ReCS2fQvRMv+O/CSG1dNK+2MOGi/sImJq7owqmlzRs/pBXJo
         RDpQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdoRqdCHJFwuCgNHaFWZWXtgUknwJkKYFFEsnpe5JkYF9S0OaYBa4p+PxHdK5LaZjTL/cjrZexPxyh9+XFK9TF@lists.infradead.org
X-Gm-Message-State: AOJu0YyvS5s6ocuKLQBpoSJQo00SqX7SLbRjz0kQojVIKl6qggRzM35Z
	GAad8bwRxfGDdp6v67pPIPN3xPpzNzmjoKDfuwZYUKkAzOPjFWgslCaW
X-Gm-Gg: AfdE7clkss6l0oHb4gDnM0igK5g6CKMI4PrjvHA9LWuPx6ZxsmAk4pR0C3pJ8KE128F
	vrsGE4ex2jbekWlbTaJ4w7vYxzSQGLsx+bshCdqigoQl/WzrpjrSzwqhoRxQp+Zhc/alge7Gj4Q
	e3/Izl+WxFEnXiiJbLM41cIYjHP8jN2PbTlyLsE389QIjvfqbnTv5zG8d9t4o5wqnrnOATClWRh
	gEH2K9W2+WA/42DG0dEsaYgx5H51QQ5weKW9mhoTH6Q+gATuqxENBGRmv9lEyFP6N9dE3tES6/c
	qb3p+GUP+TZ3/CcjTLbgsUDnXkIyxF0ICuitCQYAMgrC9Zm0XVfeXjJkFxem36M6DlZ3I5E4Oli
	/3Hgy8IYvEfix4aYbioUXfX4a7K6yTZdFqwRO9KQ8cdVCav2ahkLDuq3N+WeyOtYu+RR+6Fd0CQ
	c/+XMyiggYU2RqaMwipkUrW8LikE6aet0UXzTseumTZEE=
X-Received: by 2002:a17:902:ef44:b0:2c9:cf62:6f61 with SMTP id d9443c01a7336-2ccbe616252mr55602255ad.17.1783436715990;
        Tue, 07 Jul 2026 08:05:15 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:239e:a31b:1d0d:374f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bc42sm13598865ad.63.2026.07.07.08.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:05:15 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] drm/imx/ipuv3: Check CRTC state before freeing
Date: Tue,  7 Jul 2026 23:05:08 +0800
Message-ID: <20260707150508.2267884-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_080517_649542_06571475 
X-CRM114-Status: GOOD (  13.68  )
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

imx_drm_crtc_reset() destroys the current CRTC state only when
crtc->state is non-NULL, but it always converts crtc->state to
struct imx_crtc_state and passes the result to kfree().

When reset is called without an existing state, container_of(NULL, ...)
does not produce NULL. Keep the imx state free in the same crtc->state
guard as the helper state destruction.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 8ed5dcf966dd ("drm/imx: Use __drm_atomic_helper_crtc_reset")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
index 1405e50ee56b5..e4f0c91dc7610 100644
--- a/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3/ipuv3-crtc.c
@@ -111,10 +111,10 @@ static void imx_drm_crtc_reset(struct drm_crtc *crtc)
 {
 	struct imx_crtc_state *state;
 
-	if (crtc->state)
+	if (crtc->state) {
 		__drm_atomic_helper_crtc_destroy_state(crtc->state);
-
-	kfree(to_imx_crtc_state(crtc->state));
+		kfree(to_imx_crtc_state(crtc->state));
+	}
 	crtc->state = NULL;
 
 	state = kzalloc_obj(*state);
-- 
2.51.0


