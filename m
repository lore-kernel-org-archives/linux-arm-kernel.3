Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61EC7CD98DF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 20:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qHKb8nZ94N3WA1yikSZyZEzqqdJhxqdxLh9FZi2dFGc=; b=QysLSmBDPxdrazav/a4Bpyb5Uu
	UNFzdYouKApsYH0w8HriIwf6rXFARRWi2JFhm/eYb8j8UsRio37o+As1unyLEdwDvyvf7yEbtgr/s
	0+iJRzjTPqaH7XKwITLzgANczO7GdTMKMljJAxYHv3MHKGGbUxAeKC3XOKzOx/mw8bXuh7NrkOZ2h
	0AItZu0FRJ5MKpOokTIDt9UIJEi52Sbvl+AHt3SgJMRd0u1UwIk0znURX7NYtWskV2GUOyDDfpdMW
	6gt0bCcXPP1wq+SKlDa2e4SXlX5ZiQLaTfxhXmt0eLa1nx7VI8heA78iKo2YRptFKdTxv9/x/TupO
	Mmk5vupQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJe4b-0000000B5JP-2swY;
	Thu, 13 Nov 2025 20:37:41 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJe4Z-0000000B5Ii-1Mhf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 20:37:40 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763066256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qHKb8nZ94N3WA1yikSZyZEzqqdJhxqdxLh9FZi2dFGc=;
	b=qw7RRXK8g7dVcOIwWFyBhCOGxeEyKGlPY8SCf8HGmQ/S+t9XSFbEdnsxIELPr1iMXa4xNS
	Q2kegdj1L07dkQfQs/qGKML2Xpuou3+4Q/uGz02UaYa/rD6lT23lP3llsAd9zTxdsAq60U
	PNRdQTnZk8GoxDN5SpE0mWDgA1qUTjM=
From: Sean Anderson <sean.anderson@linux.dev>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org,
	Mike Looijmans <mike.looijmans@topic.nl>,
	David Airlie <airlied@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 0/3] drm: zynqmp: Make the video plane primary
Date: Thu, 13 Nov 2025 15:37:11 -0500
Message-Id: <20251113203715.2768107-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_123739_583953_FA5AE68D 
X-CRM114-Status: UNSURE (   5.90  )
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


Sean Anderson (3):
  drm: zynqmp: Check property creation status
  drm: zynqmp: Make the video plane primary
  drm: zynqmp: Add blend mode property to graphics plane

 drivers/gpu/drm/xlnx/zynqmp_kms.c | 42 +++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 8 deletions(-)

-- 
2.35.1.1320.gc452695387.dirty


