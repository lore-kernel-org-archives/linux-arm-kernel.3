Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953FCC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 17:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J+kBD+umUXykiUBc/ZHW2mNCyBvtMKWKtE2BZjjUQ0o=; b=eTtQePNl0gVdd1OfJ4kGmTZuYE
	cMj02uPK18x3xI/4+VtMqkBPzELBkX4wUJyFyoxv1nMcmtgJOVagAfqia43OKJX8pZyRG8L+eQ7Nq
	CPYpscvXCbh64EXkWrt8t26U7KLtoL2Fd058fhzpKZtmPtPAyQ+OePbHHq/A2nqWEa2JF9SIq4UP2
	ygPdBRnFn6FvJSnkosvZEKj3XDVMKislHZqUOF6tZyTnNtVzfCKjawgYdUxJppA+RtVqZClGxCKM3
	xfjNz3cysM8IhNfun7TiUCzhqEs/cV9vDQxunm6yPDh/Ap3cPM205PrtfhFp9LvOneaXs+z0Xjfyk
	WCGDKIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toQmh-0000000EhPe-1KIe;
	Sat, 01 Mar 2025 17:37:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toQl8-0000000Eh5D-08rN;
	Sat, 01 Mar 2025 17:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J+kBD+umUXykiUBc/ZHW2mNCyBvtMKWKtE2BZjjUQ0o=; b=N9DbZbbTYYICbIZiQ55tMUXqI9
	tECi3pylY1Wp+SFH18VXjRsHeO3dqQIpyowHARVS5pE5q3nz+o2CA20WqWuWtZZkWKB3WC5iuKZuQ
	1/rrijQg0CpjhdEle/8XjvtgmGzGSyr74NKKGcLGI2iUR3mVyZYp6Iizx0cgKLoR5hYKn9eBV2400
	7KRcaWtfxcDs7vVs+/ML5LzA9Mt6+oyQUFjvELhCTYNFVhGakE48bZo+VnH6pxzZdungB3OcZyYJE
	FgOGISHNLIzolmgVEqXUfoagWVesWl3c+C8/Aj/uXco9VJEmjrFQTqDxaLjck+/8j+OhR2zY23Yan
	XvlEtlQw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1toQkn-0001Tm-6l; Sat, 01 Mar 2025 18:35:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	quentin.schulz@cherry.de
Subject: [PATCH v2 0/2] drm/rockchip: lvds: probe logging improvements
Date: Sat,  1 Mar 2025 18:35:45 +0100
Message-ID: <20250301173547.710245-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_093618_095190_BFAB8402 
X-CRM114-Status: GOOD (  10.01  )
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

Getting the panel already uses dev_err_probe to stay silent, when
the panel just probes later, and the lvds defers.

But the phy needed on px30, also has the capability to probe after
the lvds. So make the rest of the lvds probe/bind logic also use
more modern logging than DRM_DEV_ERR, that is deprecated anyway.

changes in v2:
- reword the messages about getting (and preparing) pclk (Quentin)
- use a ret = dev_err_probe(dev, -EINVAL, ...) pattern
  in some (additional) places (Quentin)

Heiko Stuebner (2):
  drm/rockchip: lvds: move pclk preparation in with clk_get
  drm/rockchip: lvds: Hide scary error messages on probe deferral

 drivers/gpu/drm/rockchip/rockchip_lvds.c | 78 +++++++++---------------
 1 file changed, 28 insertions(+), 50 deletions(-)

-- 
2.47.2


