Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8921DC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E7/z05/BU1Ot4Goq15zsDNcp3gCxqZhQV/gnnMd27D4=; b=w7IgqTZHiivdhSAcg7X4AMbzVs
	yEEJAFTbQHWYY9D1xOjv09aF7z1UWg7ZCM4ypfUUEoIIa3t5oddgPXpTbN/3015cEfzU5Zpb9xbAz
	upRA35044HP4EGF5kwnTgm7EMpXI1kTpMaGq68b8vZpE3g+1ZjZazANmb3KbdL7c3I63VkCSaJfB4
	McY6NsIZFoPW2ZahtVvPP7tVKSQhIYugabAQA6t8F3cmUwyI2ycg9fenPsRKeLznt/2fXBS4mCYpf
	S1JLhYxoM8gLqxP6iQZi2cMnX6USdAcplQIaP1DTQIJVjr/tGn3jZexhcMh/gG0eAdv6A6/y5BcU8
	SLHviUeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3iV-0000000Boez-3g4M;
	Fri, 28 Feb 2025 17:00:03 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3gv-0000000Bo9W-3dYX;
	Fri, 28 Feb 2025 16:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=E7/z05/BU1Ot4Goq15zsDNcp3gCxqZhQV/gnnMd27D4=; b=EYpjfiEUhuPorDZ9Z8iDd4iRO4
	Tyf2KtjoTHIo4JAszuhJI5mle5dTaVWG5qcCWGMcWsqRdsTPF6JQITZI6JjOsrXRq2LL7wOnDBITb
	sTksxrkUsqY2xWryMCQ1/2MYukJ8g9Ork6wAK5wg+NBS746cQlZfeC6ZwPr7X7cgl5iCRR4yGXajc
	V9BVvu9PPegbMSUMrwg/ukvTy57SitmArFR+hivsoYu7AT1JfbclzCB70Tmpp1GtG8oeQ3jKmT4WW
	DJC9sitKkwVFOc06dn2ASo5u4byDKTlAj1t4bZSXE0P4p6HS1Q3C1H+4MgXBu1LghQUVjZFWIo5NO
	5RNmn2Nw==;
Received: from i53875b47.versanet.de ([83.135.91.71] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1to3gg-00029i-Nz; Fri, 28 Feb 2025 17:58:10 +0100
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
Subject: [PATCH 0/2] drm/rockchip: lvds: probe logging improvements
Date: Fri, 28 Feb 2025 17:57:53 +0100
Message-ID: <20250228165755.405138-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_085825_930690_9FC4C5D0 
X-CRM114-Status: UNSURE (   9.25  )
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

Getting the panel already uses dev_err_probe to stay silent, when
the panel just probes later, and the lvds defers.

But the phy needed on px30, also has the capability to probe after
the lvds. So make the rest of the lvds probe/bind logic also use
more modern logging than DRM_DEV_ERR, that is deprecated anyway.

Heiko Stuebner (2):
  drm/rockchip: lvds: move pclk preparation in with clk_get
  drm/rockchip: lvds: Hide scary error messages on probe deferral

 drivers/gpu/drm/rockchip/rockchip_lvds.c | 76 +++++++++---------------
 1 file changed, 28 insertions(+), 48 deletions(-)

-- 
2.47.2


