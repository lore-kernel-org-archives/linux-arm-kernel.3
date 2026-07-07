Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8A2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7SSWQg6HrEbpp/1xgGT38ar/90z2MxrGW6oImpnAmb0=; b=bK5pM0QpCbna0gdzkz2Fcz0Mxm
	av9nb4RBLgKt2Bw74XAcwex4OC+gbBiz2JSzxGP8+NLRLTSAZ6nJdq0hZrNm77Ggk1tXLcbfDLymL
	+oysGeoC0eMj0dgFEXyazpVOFGcgwlbyGebh9gLap37cCcWXR2ebS5C5SRGoErG2oWNDL7pyMCelB
	RAsxE3Yl3NVYYjANyofPFbg0nfHn4YTk4nHUd/j55IJXLVa20BCZw8PazCd7E1hU4TPBgPt6rBMr2
	LlrYnXq3Qu/Ztca5EBpysbGRKybxI/ZvasUbyPA61H2oABkx/HtQrmd7DDWZTzvgZ31O2QTyWaXEY
	d4QDpbWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Ml-0000000FFHN-0PQL;
	Tue, 07 Jul 2026 15:05:43 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Me-0000000FFED-24L6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:05:41 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-381891a9525so4046607a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783436736; x=1784041536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SSWQg6HrEbpp/1xgGT38ar/90z2MxrGW6oImpnAmb0=;
        b=pxV6ZV120m1PsMPpaxl1fWqKeJHZRu11CCJRfThXUFwuq5KSgTtjsI/R3n92/23eWz
         iNAr6Ru4+oObseSJnHhu8l3aIrP5wx1H4E0PLgnBTyGHvp3lptTnIvZTRulGzd+lMmFN
         SGuSC+OCaaxTenczr/xrkK0P3+46jru62E2ilT3sCP+4YBG8p+c3+OqN+n3OPKyZjrbv
         rSRKvQ/1KjV3jcXl8YW6TYknbUeakY1+T06Jb7WHE0/luZxo+HnkneoexbBYviysiiMM
         ir98g/8KzBYqmTDIaXLieHKRJWDvGOJCyrmBp2AMtLgyGGSi4w4B/SSSnNJBUPwcHU/n
         3ArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436736; x=1784041536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SSWQg6HrEbpp/1xgGT38ar/90z2MxrGW6oImpnAmb0=;
        b=mDKNLynOyfddiG5konxaiWnBDxfpcKU5pud28k1iqW7k6s7xabW78rJbgNO2cN80Ac
         19two6fIdKiyZUwTaMnLu+j8PKMIpbe1J6Izbv/l9Hi+MM/6dabzmdHRAeQqv/MRPyZp
         xgkCP5vqS8l4vVnCn+u/P1VFGvp3g6xh2SVan+R89oqjFFWY3KeM+L93JlDJYHcWrM4v
         IHW55dLPhRevq2FimZhougkPhiOW8MHIcuzfdqhV0q/HdRMciXxdwbsFm5rzx9DOjtUT
         DvHJMue3YlArIrlY4JiOfSoeCYADgPuFKKPCrHlG4IeSc6VkQeRf2z8rP5lVlokPYwoF
         zgQg==
X-Forwarded-Encrypted: i=1; AHgh+RoJdF637posARDOQNh7f0jUl3O3iElaOWVOSWSlRGPxeuD0LfvZDsZlTVZNzR8liZIKOAwJZpp8JUYutWG+PlL+@lists.infradead.org
X-Gm-Message-State: AOJu0YxuVDCKFKL6s/Hmf9kvl0Qqd0QDZePx3U6Nvv2HIb3e3ALlGqDA
	LvASp6OM/85Uev1QY0+gf1CNU/1jspw8p+JB4w02GBEW4A8cUoCwOJoD
X-Gm-Gg: AfdE7cn+9F+CIbZUVKF+MWnqDoTtYayD4Qe5j0MW0gyWx87864eNThW/OpeD+KxytzX
	ZIh+kRnkbv3rKv9fJrI/FFl0J6HxSg5Nxd7qESpgOVMk4uAvpusfc06iryvfBD9N2Th6chXOPO8
	xNxdSiua4vV/H1sTEuE+rWBoa8KC533Ze6zhAc/fPxsAbSN+xNR+Z5GEKv17lVO2G18W3o9On4n
	+geJ2moABVbxxTPg7Df3BaszeNCUwFsZ8LLxtB+eGA98P2+j532RIeYIbN9ht6rcZCfco8hI9PO
	64jJIMOerrN/h/OJOhOaXkTNrwNY5WlyYJGihy75ug76c4yqVuozLNaPLn4dWaemtUWxDTyl7sS
	zKIs4YMbUzUb/Q85UukMtvbNzJwfV+yzlWidcuhTpvsLqcyZCqkCbfK4o3O5NS587cQ+O7KU/h0
	YTKjug8ZHgrV+hcu/J08QmlGZoshxG/8xv
X-Received: by 2002:a17:90b:4f48:b0:387:e0bb:57f6 with SMTP id 98e67ed59e1d1-387e0bb5c07mr2778290a91.39.1783436735574;
        Tue, 07 Jul 2026 08:05:35 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:239e:a31b:1d0d:374f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d229a20csm1284197a91.16.2026.07.07.08.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:05:34 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] drm/mediatek: Check CRTC state before freeing
Date: Tue,  7 Jul 2026 23:05:28 +0800
Message-ID: <20260707150528.2270739-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_080539_663035_133D3500 
X-CRM114-Status: GOOD (  13.69  )
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

mtk_crtc_reset() destroys the current CRTC state only when crtc->state
is non-NULL, but it always converts crtc->state to struct mtk_crtc_state
and passes the result to kfree().

When reset is called without an existing state, container_of(NULL, ...)
does not produce NULL. Keep the mtk state free in the same crtc->state
guard as the helper state destruction.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 2d267b81898e ("drm/mtk: Use __drm_atomic_helper_crtc_reset")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 8e552cdc3b53b..97e3ff412e6ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -154,10 +154,10 @@ static void mtk_crtc_reset(struct drm_crtc *crtc)
 {
 	struct mtk_crtc_state *state;
 
-	if (crtc->state)
+	if (crtc->state) {
 		__drm_atomic_helper_crtc_destroy_state(crtc->state);
-
-	kfree(to_mtk_crtc_state(crtc->state));
+		kfree(to_mtk_crtc_state(crtc->state));
+	}
 	crtc->state = NULL;
 
 	state = kzalloc_obj(*state);
-- 
2.51.0


