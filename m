Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A446C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 17:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SeIdKvGzh7s/Zod1za/yckFgL52L7iFEeDXKnd5/Wj4=; b=U3ldwgBmEAdGGsQq5R8WPnpD27
	1FLEprvTcZ7DzQpJYE6Iu6ITdvpZtIqMnv4O5j4yS7cMMHImeyLTNx463K3W2J756THs8EOS9LVSM
	WDHbvQn6Tpm+Z6x1ePIzXrqfon/gOZdlHnBYxCJZGy/1PfIKxVqAmKGMRexHRIWzpx82w9ZN98hjG
	idwug4G8MFQh34tOYTgnJmvTky6dmxiaXVh5wgL71SKx3EO/5yDJeFXLkkdrdzr9yHsnagfLcyiF/
	nKv3vdOYi8SFoJhDzeSK0+y7/TqrBQt9EobPGBWMMjOtuImhbptFTGvhCrHre35QYECCVjMdV6kfz
	4elYX/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqM-0000000FETZ-05sn;
	Fri, 18 Sep 2026 17:57:50 +0000
Received: from mail-wr2-x27.google.com ([2a00:1450:4864:30::27])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7cqK-0000000FESK-1jUq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 17:57:49 +0000
Received: by mail-wr2-x27.google.com with SMTP id ffacd0b85a97d-4843796e373so594894f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754266; x=1790359066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SeIdKvGzh7s/Zod1za/yckFgL52L7iFEeDXKnd5/Wj4=;
        b=oHTEEgue0yBzTTQBfRLC8UcOgAZ0NJ8CrmP0LmTGnvehmusZXUaig42uPEZMm60gNc
         eLbvJJOlWg1F/uGcaRPVz4G7JhCC8PwZSquo7hsZHn3gdQW9PxbWBLs3eD1Rhzh7AHeH
         2eHEntkrhnX4Yv24c9YtCJ23krWuQayX4ZxiJ2SBCfr/nB386yeK7uklFgCy9glTKlG1
         rdwFEfi6sPod6g5LE3eGZtkFovsmLN3vMdq4X2Mn0wNHKZVpetoaFTbrxv/9/fDqB05d
         r5UhqchPd4ee1kshOKuLUCyYj4NjW74CdnG6IWAXmpr/XMH6w6D3g/igHf22Ix9mRunt
         Qr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754266; x=1790359066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeIdKvGzh7s/Zod1za/yckFgL52L7iFEeDXKnd5/Wj4=;
        b=uxLNxppk/Mp6sYqf5U1bHX+ZZpB91RIjGZ2k8muyC2ZvdL89rjocVNyUiePqV0RChd
         ksoBAtYhKe7eNYCL/Vis9f2EHYUZvVeDJ7Eko1Ny//I+5qOQ3ZqyGtFiUqzIk1Xv285h
         M0DscFbTRXVT3TovwArshgcMLFR2U89/KujB1fh8+DRn+5S3ZqNd78xBv66HKlIEAv7w
         ZRCqr60AKqCGFYEdgQkK3T2H/eSO7O4lM0222LlBt2d5IsgvfQ8cStFZS5PtK6Cub4qU
         Rl+RsmyIPR14oLgGl1u3Fihf59zEXI2o9ZJJ7tYFrgWZ3oFQYHXmK4jOHbxG50UntQYr
         Pfdw==
X-Forwarded-Encrypted: i=1; AKwUvBzOCpOryJx6Uo7R7GFKf6YbvID/mXxaS7wTNuUPjVTSzs+76dgD4uOCizbkOJ9pkzZPU/dr/RTvviR3Sr9bXTTu@lists.infradead.org
X-Gm-Message-State: AFuF++ny8aayuowyVcizF50zX2BgAX45sOTB+cBADg0OhlRI9Ng5mD7o
	tsG8tMAspq0wG0P6CeauFh7WsOep9wqBeJGMhYacXL4v1esKvJ1qUB+jK3RwwIrq
X-Gm-Gg: AYBFou0X8sit8hCLMiv7yq7Ul6xOpVFLFKenzf8TROcVKDHokmyaIUDHDdEc09ohVhE
	m/WFbS541Ck81lMKRJ9IH0GqD518Ht8fI0n6SDg50McokvL19TjebKp2i6TuDqKqhKoN3l8yYcD
	agDsUzV3B81IUHWWh6nRM2RS3OGkiylducpnTNOWtDD8a+YWJcWhhOR+dkcPxs01CAM0jzJGuc6
	zeFIFme3t+0JgWBbZTjGuTAisggkaMnwsPYRll18bkDUV6/V1fTuYmyBJjxXldw1NcGC0IH78cl
	vYQbAKL16Oh2baCbFUhFcY783sCnZmb1y6M5xoR+H/LwujLUMP/Nac7EzCHwuKCqt2IyuJsIRTu
	AwzOQ3ajbP25wEOz7+1GaSVGwRDXcmdoNMikfbwPIAIFKtuZamjDRZRelsObzJoGRr1VWKRmn62
	7DyItOw23RZPglw/PmbrSQnCfBrHAiGQN2GscM/Lz92EfWYXULyTY7h5sX2la1pjHP58k=
X-Received: by 2002:a05:6000:610:b0:487:1681:2218 with SMTP id ffacd0b85a97d-4871e36bf5amr5507663f8f.45.1789754265990;
        Fri, 18 Sep 2026 10:57:45 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm268461f8f.14.2026.09.18.10.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:57:45 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] Add support for the mt8167 display pipeline
Date: Fri, 18 Sep 2026 19:55:24 +0200
Message-ID: <20260918175736.355305-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_105748_460017_C04B6116 
X-CRM114-Status: GOOD (  15.20  )
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

This series adds support for (almost) all display blocks of mt8167.
This SoC supports a DSI or DPI display and has HDMI output via a second
DPI block wired to the HDMI phy.

All the hard work was already upstreamed in the past, now all that's left
is some glue. In the first two patches we add support for the DPI output
blocks. In the third one we describe all the possible combinations of the
SoC display pipeline and in the last one we add the required nodes to the
SoC dtsi.

The final outputs of the display pipeline in the SoC dtsi are
intentionally left not connected to allow board dts to specify their
own output node.

I said almost all display blocks because HDMI output is not included in
this patch. I have it tested and working at all supported resolutions, but
since it needs some fixes in clocks and a new phy driver, I will send it
in a separate series.

The series has been tested on a Lenovo Smart Clock 2 (DSI), a Xiaomi Mi
Smart Clock 2 (DSI), and a Sony Playstation Classic Mini (HDMI via DPI).
Unfortunately I couldn't find an actual device using a DPI display, but
since DPI1-HDMI works, I feel confident saying that the clocks divisors
are correct.

Luca Leonardo Scorcia (4):
  dt-bindings: display: mediatek: dpi: Add compatible for mt8167
  drm/mediatek: Add support for mt8167 Digital Parallel Interface
  soc: mediatek: mt8167-mmsys: add routes for all display paths
  arm64: dts: mediatek: mt8167: Add DRM nodes

 .../display/mediatek/mediatek,dpi.yaml        |   1 +
 arch/arm64/boot/dts/mediatek/mt8167.dtsi      | 369 ++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  23 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |   2 +
 drivers/soc/mediatek/mt8167-mmsys.h           | 183 ++++++++-
 5 files changed, 569 insertions(+), 9 deletions(-)

-- 
2.43.0


