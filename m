Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE3CCA5FE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 22:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xO5R81dRFmvXP+oBvrJJLiArFPxToNNZBXws0YgONPU=; b=Tq9jd9EOlRRhZzis61833IWcEw
	YpBIsuNiXJBECGsm25Unq2PktsxdjL61OvT1Y7TFgAoCXA7nu5y/Usd14r/MqsJ7eSjpX4EJNFHT/
	MNRaIy9rySTrq/X1wHaW0Xyyde4ZseIQCu2QsnHOIJPN7+ofOlX2faVvWUHsZAr3ZbtsQHiBJnqLs
	qUEZf0FmkU+BR7BnBXu+UzB/awzlHjArCkjJnao3w8cfsyQADNRzO20x/wxpYcBwHi0qLhJnUb2Hq
	C3GOErLbOhkdfgciuFhkPcp2xUxCME/sqMCI/2aQvXiCu54IIGBS2Obdy3pIUTiwUv9AluZM/CUB4
	nNE69mNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD8NX-0000000E7xP-2psL;
	Sat, 03 Oct 2026 22:38:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD8NW-0000000E7x9-3eBx;
	Sat, 03 Oct 2026 22:38:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F257660214;
	Sat,  3 Oct 2026 22:38:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 898EF1F0089C;
	Sat,  3 Oct 2026 22:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791067129;
	bh=xO5R81dRFmvXP+oBvrJJLiArFPxToNNZBXws0YgONPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a8gsQoBhJC5EYlxZ27z608xFzxwPohUilz2EuP2ADNGIfR8h3+S2DcTuy5XPEmdOT
	 7RHHGx+t9S4U6X6No7yx2d/jgaeVJ36MhyypFTYXDgK0D+lHqLzwyvPGPa6hg8uFmd
	 YwCWjdIZY0Ip+gSgouzHbEMQ4SMeRpCyZuZ9s4ofNBUYPeGodVKFvmHWDSDbHC2xm1
	 VFBwuM8JECPeh324dFaO9qLdx+2hjEJLonsWjTrGQR/EI3QrhLKhcCM6SMkLme+N/d
	 uFbZ/W99f+oU/Z9ixdyc0LHchzEeZomG5lQ2Jqd6JSbrmj2s9nbeXMxE2xP6Q3H8Dm
	 +BhzzRg5YecvA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	jason-jh.lin@mediatek.com
Subject: Re: [PATCH 6.1.y] drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
Date: Sat,  3 Oct 2026 18:33:03 -0400
Message-ID: <2026-10-03-1-daily-reply-0022-re-mediatek-crtc-destroy-null-6-1@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002194413.20810-1-artem@trailofbits.com>
References: <20261002194413.20810-1-artem@trailofbits.com>
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

> [ Upstream commit 4018651ba5c409034149f297d3dd3328b91561fd ]

Queued for 6.1, thanks.

-- 
Thanks,
Sasha

