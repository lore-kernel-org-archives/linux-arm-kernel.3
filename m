Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A53E6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQReQiFpv6vZH7tYZ7DJo6ma1E0VnjzdL856AhiNzYA=; b=Y5YAJawGZQbE+XFn6hLRx9D9Rv
	4IFrAkviVfzcPup5ocm5tTl2wKVParlUTzN0JzhzzJCm14Kuia0AegtCepreNIN2wz4IPf4hvuFo5
	Zjr7FaDEsT4OQQ51Rm6o+LYJs7wI5r+3IEDytuZ/eJDwuwleG3Ke395nlS6VDzFsS6am+jVLjOcNo
	+Zbsuvoe78oUhW4ZBKJszMpnJVTEy9OjAFW7H8yqanFeQQvzpSVsHFBA4OpVB+ONqsTcA7Gi3cVkJ
	LThr+Ds0vGHXDbBMaU7OvQR1wXPgba0/02A/GZZIm0dsnocsI33Wyh9xOjn7c38/pVL05H93hXn5z
	QFxQYm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6jN-0000000Fu7t-00lI;
	Tue, 23 Dec 2025 18:03:33 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6jE-0000000Ftyg-1n3C;
	Tue, 23 Dec 2025 18:03:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1766512993; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AnXQojUSU/SyeSwoEQUIph28dP8qWrF3PJZDU3B1Um1fNvnzgNlB5WcPzw2HOQrHxBt2KP8VoBdQfndLWl0qx1e6d6VDqSHwbuktdWDjZ5bEaF3Q5hbgEXhd/h9npnGqrulXVV6yATHC2+pOdDIum/D6yXzyhOL8PSQ1ybHUvMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1766512993; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KQReQiFpv6vZH7tYZ7DJo6ma1E0VnjzdL856AhiNzYA=; 
	b=DCisu1eNWGmf7tYJhocosCn1Hyz9fq2KQTeZx88cAf4b5yPtFE0Vf2cdqBdM5IBqz1amamOdjUdqrY0UHt98Bmb+Jb8NAbyomHRLhMuw+Y8iF+JYlerVWxUpGywL5HKwLQv0FkDWaDAWx4BwXsUNhLBbCpbdn46JtTO81WAZKik=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1766512993;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=KQReQiFpv6vZH7tYZ7DJo6ma1E0VnjzdL856AhiNzYA=;
	b=eLcOHqrZqUKGbA1EUMUhA67zqGG7wacpi4TA8MRaM1aQCKtCJ8Kovbnsfo7aVFUk
	Wk8nDaDCR5uPnFtAzFio5968CYwBR1QSGceeaSKP8bvhtaXGtL5/JNTqPuXQJMjiqp8
	cSpL4seJAUXEYKMOpXOzSoWXLjSx+/94k7x+rp+k=
Received: by mx.zohomail.com with SMTPS id 1766512991205778.3247202321545;
	Tue, 23 Dec 2025 10:03:11 -0800 (PST)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Date: Tue, 23 Dec 2025 15:01:33 -0300
Subject: [PATCH v3 13/21] drm: Add helper to extract a 3x4 matrix from any
 CTM matrix dimensions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-mtk-post-blend-color-pipeline-v3-13-7d969f9a37a0@collabora.com>
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
 Ariel D'Alessandro <ariel.dalessandro@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766512902; l=1982;
 i=ariel.dalessandro@collabora.com; s=20251223; h=from:subject:message-id;
 bh=KDPxSZn2VpvPbiyI2Yt3WUcJYkmoQIaN7UEcEL939Wo=;
 b=qnlX0IQTN43U2W1rLFFR9Hu6CLDTEzbDqEoVpJxhhRN6OHJKVQZExbywOREW7WxC/jba2punH
 ej+ld5idnz6CvU8OlR0wb6rrw61LGe0Xd8Umba9l0QOnpZyqDXymST/
X-Developer-Key: i=ariel.dalessandro@collabora.com; a=ed25519;
 pk=QZRL9EsSBV3/FhDHi9L/7ZTz2dwa7iyqgl+y1UYaQXQ=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_100324_610371_108AC9D8 
X-CRM114-Status: GOOD (  10.78  )
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

Add a common helper to ease the conversion from both 3x3 or 3x4 matrices
to a CTM 3x4 matrix. This is handy for code that needs to handle both
dimensions.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 include/drm/drm_color_mgmt.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 5140691f476a9..51279267ed3fd 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -66,6 +66,40 @@ static inline u32 drm_color_lut32_extract(u32 user_input, int bit_precision)
 				     (1ULL << 32) - 1);
 }
 
+/**
+ * drm_color_ctm_to_ctm_3x4 - Copy CTM matrix contents to 3x4 dimensions matrix
+ *
+ * @dest: The destination CTM 3x4 dimensions matrix
+ * @src: The source CTM matrix (3x3 or 3x4 dimensions depending on @ctm_3x4)
+ * @ctm_3x4: Boolean indicating the source CTM matrix dimensions
+ *
+ * Copy the contents of a CTM matrix from @src, to a CTM 3x4 dimensions matrix.
+ * The source matrix can be 3x3 or 3x4 dimensions depending on the @ctm_3x4
+ * boolean argument.
+ */
+static inline void drm_color_ctm_to_ctm_3x4(struct drm_color_ctm_3x4 *dest,
+					    void *src, bool ctm_3x4)
+{
+	if (ctm_3x4) {
+		*dest = *(struct drm_color_ctm_3x4 *)src;
+	} else {
+		struct drm_color_ctm *ctm = (struct drm_color_ctm *)src;
+
+		dest->matrix[0] = ctm->matrix[0];
+		dest->matrix[1] = ctm->matrix[1];
+		dest->matrix[2] = ctm->matrix[2];
+		dest->matrix[3] = 0;
+		dest->matrix[4] = ctm->matrix[3];
+		dest->matrix[5] = ctm->matrix[4];
+		dest->matrix[6] = ctm->matrix[5];
+		dest->matrix[7] = 0;
+		dest->matrix[8] = ctm->matrix[6];
+		dest->matrix[9] = ctm->matrix[7];
+		dest->matrix[10] = ctm->matrix[8];
+		dest->matrix[11] = 0;
+	}
+}
+
 u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n);
 
 void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,

-- 
2.51.0


