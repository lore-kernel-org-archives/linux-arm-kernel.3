Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DF7CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PvrGb7QTqbbgE5jM+HH0zZnE557nyu74f/SKnHNKGm0=; b=UAjOB8NmspjmxwTRSHGDP99s35
	6tkhXNzWQxuIXKhVmdLmglUbFhUNxozgtOypeC76cEaPoSEZYzYpcxKH2TSwRJiaNXwqW3mFzJqB4
	aSfY6lm+GUelJy2bX+VDki9hMa5peKCEGJIGVFHD8OxzVxIJ7wKej59855WUgQaioRZR1oZnxVhX2
	fkV3Dk4ns2ljWwzkTSS1uSEiStCqGnNuPBQoChR0aOm/1dj7qjE4Qbat6tRqo8W6KddtgWcf6pSeJ
	WyzpCquJM61MGlOh1yRTVbo0TCJYCghQG50R/5jTnLlbGaeMIsAuuj5mBiOD0ZopPzjJB1uSo6TyO
	4UucLk9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw4t-00000005GwM-3VlJ;
	Fri, 29 Aug 2025 10:11:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urv38-000000054pa-2o7c;
	Fri, 29 Aug 2025 09:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9DE36013D;
	Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E453C4CEF0;
	Fri, 29 Aug 2025 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756458333;
	bh=b+WF2J+qrsGcj8cAU4xgyNrWdpj0Vz5yotbWDF7MJQg=;
	h=From:To:Cc:Subject:Date:From;
	b=fBN6Le+Yb27NYeFRI19Y7gZGNyEtfoOuSZzaNR2cmjGTnaKutu/HJD8nCm6/GsVUa
	 rR9O3eUga4N7eRJfjlBsLuCtqQ5MPN6bj/ITh73AWYxeK4yWWJR49rN6uERc2APZ9q
	 3dfWYSY77GOtTqsw/+vR2DftiEpoNrAXzAZbtwtKOyCcFtbbbLag7k94imaopEsLkw
	 wIcc/EBMeC2wL/F+XH9Ykp7KC0qknZ4Ax3Od18tnE026uz5++x46UJ2s00DmulsTCh
	 5N3xLbdo6D76GPqs/MWUlH6FdoO8no2n4FeIA7A2apktDSKw/Sq91EKztrmZW6Xr9q
	 BU7wZddFlmYSw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1urv2x-000000005WD-04un;
	Fri, 29 Aug 2025 11:05:23 +0200
From: Johan Hovold <johan@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ma Ke <make24@iscas.ac.cn>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/2] drm/mediatek: fix potential OF node use-after-free
Date: Fri, 29 Aug 2025 11:03:43 +0200
Message-ID: <20250829090345.21075-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

A recent change (included in the drm pull request for 6.17-rc4) fixed a
device reference leak but also introduced a potential OF node
use-after-free.

This series fixes the new OF node reference imbalance and drops the
unnecessary gotos introduced by the broken fix, effectively reverting
that change in favour of the minimal fix I had previously posted here:

	https://lore.kernel.org/lkml/20250722092722.425-1-johan@kernel.org/

These should go into 6.17 which (soon) has the broken fix, which was
also marked for stable backport.

Johan


Johan Hovold (2):
  drm/mediatek: fix potential OF node use-after-free
  drm/mediatek: clean up driver data initialisation

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

-- 
2.49.1


