Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5ABFE6FE23
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8tVdDl5X51j5Ux5xji9PlQBIjzS9DLtBXIu2gVhHv+A=; b=MwWDbxv4ZjoCKH9Bd0tmOGWKn5
	9KLGGPFj0YSuK3HjusWo7j6XCfdcEdQrGWApwRNuVGLZM4XHYtw2cRsUaSF13needocrUTaSdiSrt
	vTckZ060eZ6j29cwVsiwrXNen4nm+TttFSSTwPkv8mZq136mePBIadJfo4awIDa+EVk5pSVPiDtyW
	WPij9lRxezrnrFAnmkw2eyqL7JEpQBonfzo227S21jErEDtcslE7IQpIMbtoqbENq3hXyLIOAguIp
	JCkXWbWXS8yE8ylKIVUWFBW+wnNQ6Nc/jo/7+8GeY85ITrGM1K/uy4VenDzg8KheJsXRqGLn32+41
	gqk++SZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6ip-0000000FtcX-2bUC;
	Tue, 23 Dec 2025 18:03:06 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6il-0000000FtXv-1zej;
	Tue, 23 Dec 2025 18:02:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766512960; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mA7mnyyb4V3jS/5YbPKp2L15a9As8zz9retIRr6cFJ1gUHGxNmrig4Hyk+S2Qf1rqW2OeJ8hpmT5mb8J5vNaFO/dxUD/4NLAvbuvGwDLQ4J3/QVsB6EVCAJXniGpmvZdD1I5aCg2kwFoi58X42nxIfidqsIDCwXZqmC/BHbaCek=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766512960; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8tVdDl5X51j5Ux5xji9PlQBIjzS9DLtBXIu2gVhHv+A=; 
	b=Jdzq+aK9t5I6gxYknwZt7D5LUyKhnbZaKHnjDlCVSVX9xFkk1p61KlCxgeiPuBDeNdUAyKDUhIPtesZYiH7o//cD6WrzY96FuDaohjPhErE0owsEFutxyP4NV8dGNU9xuSma96Kvb/5Yojdik6vMAtAVXoxABp9YN5bAeioaOI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512960;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8tVdDl5X51j5Ux5xji9PlQBIjzS9DLtBXIu2gVhHv+A=;
	b=XAWkDFu4uEmp0fx9A1FVlGZK6B7ywx9qtfiXdNaHyGVhwkhj25Mc9A13bhapEAWr
	OuWoPvQWzvtJpAAPKtBhqecFGOBZTd6B0zxJMio0+K5DXxXR9fA9JIL2/YdVWuthGw/
	QokuPqyLYSTRqrsJdyNiDTODXyRLKMQ+Nuo7w3rg=
Received: by mx.zohomail.com with SMTPS id 17665129596543.9630842896659715;
	Tue, 23 Dec 2025 10:02:39 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:28 -0300
Subject: [PATCH v3 08/21] drm/atomic: Print the color pipeline as part of
 the CRTC state print
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-8-7d969f9a37a0@collabora.com>
References: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
In-Reply-To: <20251223-mtk-post-blend-color-pipeline-v3-0-7d969f9a37a0@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=1191;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=rcwbsd4sgvqm0zAsHPgYyQ8i3zpA2VcJDltqzHchMVA=;
 b=bA/+hM2Fz8JyB+uOiYZi/hBKhWQasDCTdvY+fKqXClHT06O3p7FmR8Kgugm1sNBqu7ztnkA+R
 wsRgP2bwpkHBQkHe8GPD6wZdQxhhkiaN6SR3FwD1qzi/8z64BtgbTJk
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_100255_603596_63C0EDD8 
X-CRM114-Status: UNSURE (   7.53  )
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

From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>

Print the value of the color pipeline in the CRTC state as part of the
CRTC state print.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Co-developed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index e9022d7ad04b0..aa4aa2f589b3d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -475,6 +475,8 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
 	drm_printf(p, "\tplane_mask=%x\n", state->plane_mask);
 	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
 	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
+	drm_printf(p, "\tcolor-pipeline=%d\n",
+		   state->color_pipeline ? state->color_pipeline->base.id : 0);
 	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
 
 	if (crtc->funcs->atomic_print_state)

-- 
2.51.0


