Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DEDE81A3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eFUae8M607uXIOUb6KuR+f1ZcnqADfRg4QxjDLkY0MQ=; b=E7t5BCM1Je1c6JIXfHFVLBtmIL
	OwQHcurOSjifrL9rXUi7HvObsMPlGmhFNyVBaRUUMQmcurkLMgl6qqG7Nt0qsAf4TvBReSRCNCsH/
	ntWR2wKds+LUHUtewdv7gXcOYDtF5bpl/BmOLbe0HI8XI15aA3cJbhbNrLBudNwEtJWMxuoA4jQsK
	bKGSjxm/0EnC+fTvwPFhhvYpJk23uuNaz3QbCMlFmAxXysZCKWKlOOuS69+DUHGCW9/UsQf6CdRBq
	NDkZ05GEeypR4vDuKjJ3Ur2AAny3cEXVn51Tc4Pl7xCC9PFZGPOuz5qt0up47VdvhtkNZlFcKN8Nb
	/VkLIl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1P6-000000070nt-2gVr;
	Mon, 16 Feb 2026 16:24:56 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1P2-000000070kV-3Mtf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:24:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-4362c635319so3372200f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:24:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259090; x=1771863890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eFUae8M607uXIOUb6KuR+f1ZcnqADfRg4QxjDLkY0MQ=;
        b=Hf0f016kNMMNWUyaHj9FxHf7p2Vf0fUMSVMOkwfhWT17G5+zutvYEM1sZxu+v9SCJG
         T/D9G5pdCNlkB9rGK1HVkBGKqCIzuqDwSA6JDrQtxDqC+G+3WQ63yYn+Lpmxu1x9Lq+N
         OhYIGVsUp/XotrfzndPCvdHSOuXCZq/FGmxy5CZ7/7g5m+393FhOvFKz7UPb7qP0Hnpv
         g2X7JOkShko8Ue8eKu+pa5jgMnKKDvReb9KcUcacPYySjUVq8RD8AHt9TIYLC8P87amA
         uOl1Sm6wY5rYDHPVbi275uUJvEIFD8FidjJL4+sqJfY20ZyRI1RjQKPaXAXLc+6qlQQg
         6RNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259090; x=1771863890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFUae8M607uXIOUb6KuR+f1ZcnqADfRg4QxjDLkY0MQ=;
        b=JVHKsbyVOQVK9nxl+gofSQQBb7Te7nwEeIdTjUe2/15BPpLkBdUG9B23jE5H8BALtP
         BIZN4aEqzMl19WZLeGORZT2mbgUJO5klpUazgadxbJvkJay1Cf2+9EtYyfhd9NAKG3Im
         tX+up0hmB15GDDnDprx2LeqaLicInjm6a8f2BQgse4Vz/aXp6mG8ssGOHgfZ/GZNVrge
         IHagoNRGaHaheWNGx8jU/bw6H/p7ml6Cl7n/myyh0fc9m7mviUke24SYPbIKX3rlipY4
         3ttr9Osh77BOxVs19B58EaW/EZEiiZgHNjybOUV/AZJz2DXvObJTm8dlgMS7c5xXB6lq
         Gwlw==
X-Forwarded-Encrypted: i=1; AJvYcCWilOOjbBf6WeWzN4kpQIFPm14qhFSFHmoJUpRaJ/AH8kkamPN9MzvCg1cReXlSkp6QIGztxmBlyQ/GRMKvhQSU@lists.infradead.org
X-Gm-Message-State: AOJu0YwmnhymTblZC1AHS9cq5SKn2D4c97fzhrXSmoik+V0DVA1MlyzX
	qzCj0ts3HwULJL6FU4+WIa4NHxFe4Oz1qPoz61zKJ+XpjfhNj6b7kfUu
X-Gm-Gg: AZuq6aJDChQpaCFM1c4SzYhrfOIvQyFXHuXwDELwQNmKxVTFnlPO0TdgMnq2hPQT8dW
	vUJ8T1vO85i3FuA6NAXQ9NQpfu9eoWc2vRVP25QkdWKb/kzjkLZ8ecy3CcsMsGWxXWBTk66d5Qf
	sJs1O6ofED/1OiyWFbzMaIIVnpPgYBR3zbVoiacAdyU0xehOoHDq87/8raHN3QNmD68/riA9HvE
	tjIAbksE2ddPgcm/USMvSrl6PfIniWGwD+H8ykTQbPoXmJTq82KQmdLmkn77JOhDsOKLPHl8FWd
	tumWTaCdz4RWxurubSlOgzVoAJ7R+fkrQ0sbO29CSXQz4f9orZPcZVAmf2AbmGUiEDd2WJXl+WB
	DyDExnyFl1zAdHG5pKIUJl2T57l275zFN38cDqijEXfQjHlBfz6YKmu6xi5CFkFvSH0jOEJgUNc
	KWxMfatyd9W35VI/JNxUQ=
X-Received: by 2002:a05:6000:2501:b0:435:e460:235b with SMTP id ffacd0b85a97d-4379795572emr15102960f8f.59.1771259089859;
        Mon, 16 Feb 2026 08:24:49 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:24:49 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 0/6] Add support for mt8167 display blocks
Date: Mon, 16 Feb 2026 16:22:11 +0000
Message-ID: <cover.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082452_857972_F0EA3604 
X-CRM114-Status: GOOD (  11.14  )
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

This series adds support for the display blocks on MediaTek mt8167.
Tested on Xiaomi Mi Smart Clock x04g.

The first patch just does some reordering of dts nodes with no other changes
as this makes later patches cleaner and easier to follow.

v2:
 - Separate patch for mediatek,dsi-phy binding;
 - Separate patch for mt8167-dsi binding;
 - Simplified OF graph endpoints in mt8167.dtsi.

Luca Leonardo Scorcia (5):
  arm64: dts: mt8167: Reorder nodes according to mmio address
  dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
  dt-bindings: display: mediatek: Correct compatibility for mt8167-dsi
  dt-bindings: phy: mediatek,dsi-phy: Add support for mt8167
  arm64: dts: mediatek: mt8167: Add DRM nodes

Val Packett (1):
  gpu: drm: mediatek: ovl: add specific entry for mt8167

 .../display/mediatek/mediatek,aal.yaml        |   1 +
 .../display/mediatek/mediatek,ccorr.yaml      |   4 +-
 .../display/mediatek/mediatek,dither.yaml     |   1 +
 .../display/mediatek/mediatek,dsi.yaml        |   5 +-
 .../display/mediatek/mediatek,gamma.yaml      |   1 +
 .../display/mediatek/mediatek,ovl.yaml        |   1 +
 .../display/mediatek/mediatek,rdma.yaml       |   1 +
 .../display/mediatek/mediatek,wdma.yaml       |   4 +-
 .../bindings/phy/mediatek,dsi-phy.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 381 ++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  12 +
 11 files changed, 377 insertions(+), 35 deletions(-)

-- 
2.43.0


