Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1254EC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nhZODBc3yQWuwoe5FdhPLSZkoPupsn7Fy4qR0rl4EDE=; b=wKIXlhzRXIp/IEVVwu+frvyb17
	i9g6L9mzNwvKm2mkyckJoHaVNYQk/vNswvUpqfzuEwvy3ZkCqYTZdmzXFbpwh6BQqfT4ZVYvxpETT
	DqcOF2wgqLVtkNE+oz9JeEV9Z7qmXKkDApzhFj9RDU+9eMJ1R1dyfvLmPAXP5k2ov3eFjKCEyQHvi
	Ii5QYrO4M93u12TZu1pMOjd/js3l1V2qrT73jqGmWvzTPcLGs5W1W+J9ZWJdkVQE8ZjeEQNd/CwT0
	Yg6nsZO0p8M35EvvaoDRbeqWGQfkudvl4koxI+2peX7mYJHxw9fuM2cZ1uwKKLiYMcXcfwmCchkW5
	hB7FWilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0IXW-00000008fUG-2DF0;
	Thu, 03 Apr 2025 11:15:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0I6s-00000008cF2-194a;
	Thu, 03 Apr 2025 10:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743677264;
	bh=krVSqUMcdIJm0l6D8vCcbNrCt6hb1FXOmk01RVoxGgI=;
	h=From:To:Cc:Subject:Date:From;
	b=gDiS+LNWako3Yd4OZmxHJpbbQH24gPo3P7AJpjH5rPQQSYCi/aTFkSG5zooc6fazC
	 2l2sQJ9ByJfzScLHLeHRx48qcuokSKnvopPznQaaoIfx5xewQk+T9spIXHrWeEJkpw
	 bpKuqH4Ckro4vF9Xv2Zk+nRivlZuzDc0HpiTct15XKroXv4iJrPm5oX6oM/qrEs/QU
	 MUTOq+FRkRN1PPc8JI0rZ+POhoxRu+N8AK5p51gbmtubkk2QgXKqbs+unl3oRBpV4J
	 Macve0O4vLxKgaGRsiZILjto1gDlZ2ohY0Fp3n4MzNkKRKfy9ccqmET6shy6f0Pe6P
	 pY5zacfHULYgA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 828FC17E0702;
	Thu,  3 Apr 2025 12:47:43 +0200 (CEST)
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
Subject: [PATCH v2 0/5] drm/mediatek: Cleanups and sanitization
Date: Thu,  3 Apr 2025 12:47:36 +0200
Message-ID: <20250403104741.71045-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_034746_510274_6BE257B2 
X-CRM114-Status: GOOD (  11.00  )
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

Changes in v2:
 - Fixed typo in description for commit [2/5]
 - Using IRQF_NO_AUTOEN in devm_request_irq() instead of calling
   irq_set_status_flags() to set flag for the same functionality.

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

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c  | 20 +++++++++-----
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 34 ++++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c   | 31 +++++++++++++++------
 3 files changed, 56 insertions(+), 29 deletions(-)

-- 
2.48.1


