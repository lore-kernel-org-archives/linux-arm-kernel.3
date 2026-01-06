Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DD6CE9D7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hLJ5TSFgVxNb97ViY0bF75+yIlZ7EweJuk9FX1+8Rs8=; b=LjGcMrZw2GnxJGcbzlgssCAkBg
	5T4Btt6T/lekt+pEW2ZhL8hbMzbEPg8mIj0zN35BazWiKPMrs1YRGu3XILK3ug7jdxslpdXGuoYSt
	7a/uVluwwX4FfQJwS8qcpI9Y4RTjieb0WWBsULk0w4G/O1Mccez7Guu7sp7W+Z60PY2UoETZ5m5Fi
	Y+qKfphMx9R1ZQsjkU+JGKct/CBiHrz2/Prbcx9ftMDRefEkw6kFiJs1A3sjtCBz6kTWKh+kCJCny
	fRhcyaomJrycBcBLBV0Q9zVtavC2NCwc0iEsG1fJFMRvDGCo025tFgyPhgG9ozmQGlpcYYvndyGBI
	AYwYNUrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA9I-0000000DVvh-3KGx;
	Tue, 06 Jan 2026 16:43:12 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdA9G-0000000DVv1-1Hog
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:43:12 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767717785;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hLJ5TSFgVxNb97ViY0bF75+yIlZ7EweJuk9FX1+8Rs8=;
	b=eversUs4uq7J0CoDWipujPj+7P8CGr5Ig60nfSJn2W1JXdDo0egx9IDjsqZfW/c06CTFVW
	sGpdkXyGeFavWav8XbSXYLpHMOzp5+Vlr6Yq6DekMzXAaPtyaIxJr/h2Nj5ZO4PBz55uMk
	DvmORhgPPjoA7X4/D3Lej6NaIMNtNi0=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 0/4] drm: zynqmp: Make the video plane primary
Date: Tue,  6 Jan 2026 11:42:43 -0500
Message-Id: <20260106164247.472544-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_084310_659292_E9183011 
X-CRM114-Status: UNSURE (   7.60  )
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

The graphics plane does not support XRGB8888, which is the default mode
X uses for 24-bit color. Because of this, X must be set to use 16-bit
color, which has a measurable performance penalty. Make the video plane
the primary plane as it natively supports XRGB8888. An alternative
approach to add XRGB8888 to the graphics plane is discussed in [1], as
well as in patch 2.

[1] https://lore.kernel.org/dri-devel/20250627145058.6880-1-mike.looijmans@topic.nl/

Changes in v2:
- Allow specifying blend mode default
- Advertise coverage instead of premulti, since that's what the hardware
  supports.
- Set default blend mode to none since that's what the default was
  before this series.

Sean Anderson (4):
  drm/drm_blend: Allow specifying blend mode default
  drm: zynqmp: Check property creation status
  drm: zynqmp: Make the video plane primary
  drm: zynqmp: Add blend mode property to graphics plane

 drivers/gpu/drm/drm_blend.c       | 22 ++++++-------
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 53 +++++++++++++++++++++++++------
 include/drm/drm_blend.h           | 26 +++++++++++++--
 3 files changed, 78 insertions(+), 23 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


