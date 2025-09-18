Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CE8CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 00:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeuR91ixk5ntGGhaH/WA1gKfRgbwzJaFeZ6oDIjf6rA=; b=BBtqrOYt6/dAIrzNqJklptpWFH
	m7pBXSg+9qxczfAPPzkNzh9vt/A5MH25WD/KsLvldlxUUlhQVXJQk5BM2fwbtme7DMtHEYR2SzcVl
	x38H/lJhwjffRPYJW5q4zmDd08ChaBQWHZp8jfACF9MohIhuCy/r65FlnKmAjknWO6F95Dbg2ZE5r
	O3na9munP0faS592AZwrr0Lv1f7V17Z8fqYIOR5APGjqqwALoeZ08n3FO41itkc2x8bE/ZfisqLD/
	V5Mk5gCclez4cIZGvYxzlfzkbyFxTGKcoyefzE5R4wGIjJSOhJpOkM+RJb2VJ8HRGA2QPJF5n7Qm4
	3/iuaEhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2kO-0000000Fpkk-18Nu;
	Thu, 18 Sep 2025 00:43:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz2kL-0000000Fphn-2vqQ;
	Thu, 18 Sep 2025 00:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758156215;
	bh=Z6iykqCP6Bbd7PBUQgPY8pKSQ5qCdgcJUbUJzP8DED8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pM2MptFkYNNDQVN4K4crDOWD/pgYcJJrmdYdrbZeDNjgyuyzkdxHwKZeqbMseUcNh
	 Oq2ZBopXtgfd6WLkiYl4D+zuIInAuLHFS9/ifD4ngih1hmmG2LU/X+B3U/OmcxgXcA
	 9FB9JyTnOEG0kzkVOSwYZO2/rsVFBvsgE3XP6wU4REXitwPRO+24f4U1d5Gg/XHbVR
	 bWmUM8DV1onFFXKI3nVfpDfZWsW1akVXJ3cpWGxH14++CcVX5BeyV1XeJZKKOObUqt
	 4tJMRbEmTXbcfDXyJ37e/S5OT6GKRmBYkt7jB87ss5mTPEpS/hhzr9jiPBqgTvInHe
	 7Xls11vrMn4PQ==
Received: from [127.0.1.1] (unknown [IPv6:2600:4041:5b1a:9400:62f0:406e:ac79:4a96])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 530D117E0DC2;
	Thu, 18 Sep 2025 02:43:29 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 17 Sep 2025 20:43:11 -0400
Subject: [PATCH RFC v2 02/20] drm/colorop: Allow parenting colorop to CRTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-mtk-post-blend-color-pipeline-v2-2-ac4471b44758@collabora.com>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org, 
 harry.wentland@amd.com, leo.liu@amd.com, ville.syrjala@linux.intel.com, 
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com, 
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com, 
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, 
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com, 
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, 
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com, 
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_174337_882445_2C1A24E3 
X-CRM114-Status: GOOD (  11.69  )
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

In order to allow for post-blend color pipelines, colorops need to be
assigned to a crtc rather than a plane. Add a crtc to the colorop
struct to enable this. Either the plane or the crtc will be set for any
given colorop depending on whether it is part of a pre- or post-blend
color pipeline.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 include/drm/drm_colorop.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index d61c6c40e47162cb8b1e7db58b6746c43ac5d202..7a4e0d0c4a3d594abecef304b1d5990434cdb231 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -206,10 +206,16 @@ struct drm_colorop {
 	/**
 	 * @plane:
 	 *
-	 * The plane on which the colorop sits. A drm_colorop is always unique
-	 * to a plane.
+	 * The plane on which the colorop sits if it is a pre-blend colorop.
+	 * In this case it is unique to the plane.
+	 *
+	 * @crtc:
+	 *
+	 * The CRTC on which the colorop sits if it is a post-blend colorop.
+	 * In this case it is unique to the CRTC.
 	 */
 	struct drm_plane *plane;
+	struct drm_crtc *crtc;
 
 	/**
 	 * @state:

-- 
2.50.1


