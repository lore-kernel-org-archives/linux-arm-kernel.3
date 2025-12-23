Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B587E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vfc1C7nBT31/IB8cYgr8/rpLOiC94SQh2GEhvCforDM=; b=01I5gEw3MpG67jdinRyJCCeCiQ
	YJvvSACP5GX0FMywXsHa1hDMSKBXO4IuF21qEk4q7eLBYBMcH5Gx8Q6kTAoxVh2rVZ9j3+xbtr6Ht
	9/Fw7+LvlNKCceMmceTK0lostfnBQG8fSvZI+Jc1vc7QkqKVwPMXTb3lqbgWtII99xB9ZBezSzhI4
	VZpgJZ6q/BYnqwqSEHPw673dKkaAMGKHhnvQVi9+HEagqMFZz6lN3KA6hLpsAjnSt9EpGn9qI7K3g
	wptZa+op1ezx17//r4LV+pS96Bt+JiUTRIDDDL3WfWmFggLMPdfnAsMmnC2vVWAMfVi4iExhpYgxl
	6ndPft6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Le-0000000G0P8-2ME2;
	Tue, 23 Dec 2025 19:47:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Lc-0000000G0M8-1UU2;
	Tue, 23 Dec 2025 19:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766519226;
	bh=d65+SB2H0w2cmmN+b2Qd2Ub01bbiCbXtCXzu6iJjU7g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MkuWQjTMGWMNMdSoXCRbAoJoRo/EvjuSsMC/g8JBxKi0P2iIfhmY4JI1kLjQbXGVv
	 PVV6xiOr8SwGOlgql5nbAwsydBSAqggmz8vLA/XSjj8QrQJDDWwJwBB/9BtD5AU34K
	 +IcLdMtlotN1KAUaK1uMr6QTNO95d1K3qUG5TAKGfFjUzU0etkn72fCx5bamHiyLQ3
	 cYPuXDP2wXn1bnO+aBIUMd50GJddmabstAsPzF3ckpedo2F8yiW5MuYqSMIneYeAm6
	 kBOF90GsJKiu18zCi8qNAwfCRW3VnNHuX7vvwC+C9gvZrTKNNtY3lUZJmCupqgqj7K
	 ZqmKEZmaoQ0cQ==
Received: from [127.0.1.1] (unknown [IPv6:2804:1b1:f803:74:81c8:6a7a:6e11:8f81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2CA3E17E153F;
	Tue, 23 Dec 2025 20:47:00 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 23 Dec 2025 16:44:48 -0300
Subject: [PATCH 07/11] drm/colorop: Introduce HLG EOTF
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-mtk-ovl-pre-blend-colorops-v1-7-0cb99bd0ab33@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
In-Reply-To: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 daniels@collabora.com, ariel.dalessandro@collabora.com, 
 kernel@collabora.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_114708_545787_2BAAE326 
X-CRM114-Status: UNSURE (   8.09  )
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

Introduce definition of a hybrid log-gamma electro-optical transfer
function for 1D Curve colorops.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/gpu/drm/drm_colorop.c |  1 +
 include/drm/drm_colorop.h     | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index fafe45b93ff8..a19e03fb9c7c 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -79,6 +79,7 @@ static const char * const colorop_curve_1d_type_names[] = {
 	[DRM_COLOROP_1D_CURVE_BT2020_OETF] = "BT.2020 OETF",
 	[DRM_COLOROP_1D_CURVE_GAMMA22] = "Gamma 2.2",
 	[DRM_COLOROP_1D_CURVE_GAMMA22_INV] = "Gamma 2.2 Inverse",
+	[DRM_COLOROP_1D_CURVE_HLG_EOTF] = "HLG",
 };
 
 static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] = {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index ee6454b08b2d..8ec98521607d 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -126,6 +126,16 @@ enum drm_colorop_curve_1d_type {
 	 * The inverse of &DRM_COLOROP_1D_CURVE_GAMMA22
 	 */
 	DRM_COLOROP_1D_CURVE_GAMMA22_INV,
+
+	/**
+	 * @DRM_COLOROP_1D_CURVE_HLG_EOTF:
+	 *
+	 * enum string "HLG"
+	 *
+	 * Hybrid log-gamma transfer function.
+	 */
+	DRM_COLOROP_1D_CURVE_HLG_EOTF,
+
 	/**
 	 * @DRM_COLOROP_1D_CURVE_COUNT:
 	 *

-- 
2.51.0


