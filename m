Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5643AE6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z7eVde9x2/ylK4NN0CCw447RxI38NXyJelzIucjvKxk=; b=OAY6cItblbtWSBr8aBZ3MP2Gxi
	jVIulwuPDWjhxqef5Znb97HkzHAxN3pu+IFRqPMhxrkERHCUt30RyKwXaFQ/iU37pW/oWgKx04QA3
	kxNwrCUIJfz+bxR+6E1/lwTnSiNNHxWTlXqZOrunKKZZn8lZ+9eNPhYLaSUmhbE/eIW7WlGf8s1qM
	hTPPH4ReHNocSVzkMYUejFLfnchBFy/nn2YRtasqssaLra2I8o1rCgEoSKa+dtWTnO28i9az+RO+u
	yNsbnSQ45YW1SJ32/MJhFa+QWm/brUJb7XU+RlFGQI6DMrKEfd1j+IePedj1fzIWS3CtsZg0VgxF/
	jhsBpu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6i4-0000000Fszc-0qFy;
	Tue, 23 Dec 2025 18:02:12 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6i1-0000000Fsxw-2Xyi;
	Tue, 23 Dec 2025 18:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766512916; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g09L0ntADSy9B9c38knwz/8xGekpXqg4IE8DBpO/VBibeXdP8O9BHh8p7nxpThcJR2RFdAvNju7ncsyfFEtZl2uvYDxSqLLJpNLyQLoC6e+2l3tbItWpbPdCWgjj/WD4tjnEt/OS9mlgkAyywhH76XcQLSSt8vADYP38prxxzk8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766512916; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z7eVde9x2/ylK4NN0CCw447RxI38NXyJelzIucjvKxk=; 
	b=KtbdPTvH2BZDqpZAQR6jwF38KjVVBtJZ6aeFrUUIrOtW/y8hoZ7Sk4WaFZwoPF+9OyOuoQzjCRCYh5KA5kSasE2AZuQrZCbg5YxhrZFyW9Kf7KKGxpYuZ8KVFHo7lMPCwdy7IHw0KmUKri3BgIWU3q4FK04nfHbbf1EpZAtAqhU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512916;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Z7eVde9x2/ylK4NN0CCw447RxI38NXyJelzIucjvKxk=;
	b=Jt8BW7WWR6h5Ey90PjbC74eeZl8eJly5g09P3nholp7s7QsA52HwFYgcIvQrknK6
	xiL59CIFyrZBisFcbHPaT0NrLRTNMM/2Hr3cdwdu3FiNxtcJXHs+4hodjAArzJylqo3
	8ADORy+R7TtAtS1mU7ovrxFAZvu4pVR93MwxTz5o=
Received: by mx.zohomail.com with SMTPS id 1766512915055700.2932139936946;
	Tue, 23 Dec 2025 10:01:55 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:21 -0300
Subject: [PATCH v3 01/21] drm/crtc: Add color pipeline to CRTC state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-1-7d969f9a37a0@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=899;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=cz8QLVxeCXsQdnnR7HZ5l+beGwYFPs3Wl2Hw7fowgKM=;
 b=IXphtthoUydcY42e3vBK8Cy80DR1mbOU9n6zAW0xpiwZwSo2WCNhKb1LFydkLVFouA37u/rWS
 y6sefLFlYSbBvvbcJ9YtdYG9fAuatvnux7A/Fy/yyzkwd1H8fvXxCnc
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_100209_705373_309FB2A4 
X-CRM114-Status: UNSURE (   9.44  )
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

Add a color pipeline to the CRTC state to allow post-blend color
pipelines.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 include/drm/drm_crtc.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd68..8490f4bc31260 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -274,6 +274,14 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @color_pipeline:
+	 *
+	 * The first colorop of the active color pipeline, or NULL, if no
+	 * color pipeline is active.
+	 */
+	struct drm_colorop *color_pipeline;
+
 	/**
 	 * @target_vblank:
 	 *

-- 
2.51.0


