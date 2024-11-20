Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D51FD63935
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ut79R+ro+cng2XGjxoygWR/KPjmmgvNLkmlAw9aNz0=; b=mZKyQgSREYv0qhv0S8hUglxJVp
	plBRim/IQUC6nJo3O269VVmD627Afs3oDiQykoxSd/Pt8zWhte+AY8u/I/gqOOvqc6aab3+DMKOY7
	w50W09bw7Nw6xDU+3ugAHkiAylB2mbNWrCWL7oF144n1pYJNCmsd2wh1E3MAE1CXnhIZES69/ZNP2
	WnAZh1RaAFV1CulhxHiyiUINPti1sHJhvKipqvCvGsUeHPRLxmIoiOIRXBMj0UboAqQ79M4x37OV1
	heczrfPvAFnDd26VU2KPpIwgD3cH6qcNL2BNbtuhFw+W5I4O1aCvb6VTUqeHdwgGkVBbJ9SjPd6Ng
	IQAyGE+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk5U-0000000FKCx-20xa;
	Wed, 20 Nov 2024 12:45:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDk4W-0000000FJpI-3PiU;
	Wed, 20 Nov 2024 12:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732106679;
	bh=T7IOQ+7l/mtswWClwEG6ojzsVDbWhMYo3HEeYKoABqU=;
	h=From:To:Cc:Subject:Date:From;
	b=MNvVip2wFXvEdhkx/l5AuIYHV1wP/iI1G7wAOuMv8kp1doEWfu74YbZ4Eb+k3WIuO
	 cXQW0OSkTWetcV7sOJEmdOF2Cu8Zq0zbK8SeOFwANITa4QJO9k60C67cvGu+H7eseu
	 1mvi7trEyqlVHP2WBzRdWa8NB4B07VaKneMq5FFuWD6+IxCp7RVdE03aqksDLRxO2B
	 FjyeKLbtujpWTQsth+ybP2zUIbGCyC+bepGsImg+KN6d3ZRePBpBfUS67FtAmhMznq
	 q/uezROC7WHcLGgnnh8Hu3lHAjFlcDt7NShHirZyk1FvXqCPeHAo8AOZVms60Q3Ye3
	 h0LSuLFAH3+0g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 61C2117E3661;
	Wed, 20 Nov 2024 13:44:38 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/6] drm/mediatek: dpi: Add support for MT8195/8188 and Pattern Generator
Date: Wed, 20 Nov 2024 13:44:14 +0100
Message-ID: <20241120124420.133914-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_044440_992892_3A46DF21 
X-CRM114-Status: GOOD (  12.12  )
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

Add support for the direct connection DPI found in MT8195 and MT8188 SoCs.

Bonus in this series is the addition of support for the Pattern Generator
found in the DPI HW: since I needed this for debugging during development,
I had to code in the actual support bits and it looked like a waste of
time to just remove it.
I instead decided to clean it up and upstream it, as this will anyway come
handy for multiple things, of which the most important (imo) are:
 - Adding support for new SoCs in the future will be less time consuming
   as this driver already has the pattern generator in;
 - CI Testing might be able to make use of this to validate that the
   data that comes out is not garbled (so, to help testing display
   support in an automated manner).

AngeloGioacchino Del Regno (6):
  dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
  drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
  drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
  drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
  drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
  drm/mediatek: Add support for MT8195 Digital Parallel Interface

 .../display/mediatek/mediatek,dpi.yaml        |   5 +
 drivers/gpu/drm/mediatek/mtk_dpi.c            | 311 +++++++++++++-----
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |  10 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 4 files changed, 252 insertions(+), 76 deletions(-)

-- 
2.47.0


