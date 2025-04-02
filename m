Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EEFC36014
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WHapH+yzok0aYQwL8EY1xI2PKPFBkRij3Ec+NuMF6/g=; b=QR5JVuSaPTSk/Cg8nddzkgjbte
	gHydMy/Az73TFHOzcJFokQPrMrm1B3b4QcIMUCIID5PpqiwUKpZyr+OFgJNa8eP8ur6fFR0aop48m
	dqpok/8yKJMiYhN2ytic8i6IaIuIob8VtUXPG4yzIUIc+OhcyrY9Qi47QWIg2hGfla2j3G6cteo49
	iOTXI20h/72erIPFQNb6Wf8gV0cOBRFuzUm1LaIddoJn7d/usq4wacbc0h9IPvNJ77ntXXltmwdU9
	3mrsd9NS0pWmIyyB9a0QQorqgJayWa+4n6kJxN47hnl53LPvcpPeREZ/ubIDwhyNNI7DndU+IX7Z1
	+U55LlhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztcB-00000005Yfi-1StG;
	Wed, 02 Apr 2025 08:38:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztaP-00000005YEy-18WG;
	Wed, 02 Apr 2025 08:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743582995;
	bh=xT/UxSd76HQ2h0k8lo/xYt8WEMzA1J2YiDZlg+5uYNA=;
	h=From:To:Cc:Subject:Date:From;
	b=lpad4w0lS03luxXOD2mWQdUFBUQ8xaHX9GoZUKkMVmEMn0/pEcKp2bjQi6OQUWOD/
	 MfdLhbzaEX0DY+KepaIxiAenUFA0YiaDhFQjPrlHaEa8njPYMP/LIEl8UTle/KpBOv
	 ZfXj7ioL0TcebSNcfPxfjOo10Fsdq83vjob12+KMpdHEYxbtdElliTSJjrl8ZX49I1
	 1jU3zodSuwCZ6uz+wS4vJRPcunAGPy58ZRwZ8kdZR/QFRBHocJTuQMBKaGP4q7IPco
	 M0/t1PHMBjnrXiNpN8u/f0aK/P4xdzsgw1FW7G2houJLCOlB+4XjdnFZSeTBnuPbwK
	 ZAP3mt+yixbvQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64C5B17E086B;
	Wed,  2 Apr 2025 10:36:34 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com,
	ck.hu@mediatek.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v1 0/5] drm/mediatek: Cleanups and sanitization
Date: Wed,  2 Apr 2025 10:36:23 +0200
Message-ID: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_013637_522026_FC61D476 
X-CRM114-Status: GOOD (  10.68  )
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

During probe, the mediatek-drm drivers take a bunch of kobject
references for the various component sub-drivers and for the
mmsys/mutex handles.

Unfortunately, the refcount is not correctly decremented in some
cases, and not correctly incremented in some others, leading to
refcount_t overflows *or* underflows depending on where the code
fails during platform driver probe or during component bind.

This means that if mediatek-drm or any component of it returns a
probe deferral, and if this happens "too many times" (where too
many equals to around 3-5 times, and that's happening especially
when outer drivers are compiled as module while mediatek-drm is
built-in), it creates a whole bunch of badnesses.

This series sanitizes the freeing of the acquired kobjects in
mediatek-drm - especially in the multi-mmsys (multi-vdo) case.

While at it, this also moves the ISR enablement and disablement
to the component bind/unbind callbacks respectively, while keeping
the ISR installation to the probe function: this is done to avoid
leaks and to avoid entering ISRs for OVL/RDMA after those are
unbound (as that'd be dangerous, other than useless, because those
could access memory that doesn't belong to those drivers anymore,
as pointers may not have been set to NULL...!).

As an example, this is the reason (if not one of the reasons) for
a boot failure seen on the MT8195 Tomato Chromebook, pointed out
by KernelCI.

AngeloGioacchino Del Regno (5):
  drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
  drm/mediatek: Fix kobject put for component sub-drivers
  drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err
  drm/mediatek: mtk_disp_ovl: Enable/disable interrupt on bind/unbind
  drm/mediatek: mtk_disp_rdma: Enable/disable interrupt on bind/unbind

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 19 +++++++++----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 35 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 31 +++++++++++++++------
 3 files changed, 57 insertions(+), 28 deletions(-)

-- 
2.48.1


