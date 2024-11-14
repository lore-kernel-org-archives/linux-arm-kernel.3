Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADB1D6A221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 18:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzMfq51YBw3fK66Y4Obj6vDkHx4AScY6wD/SzgxHHl4=; b=acNxmEX5liGEnkTV4UvWmTWzK4
	ZKu7yb1Ea+Mpoa9+o8wYfXxMHpd36Qw94qaTWqbCnks+kiuGb2mqF43fyoB/4rPMVRzKon6icZRe/
	00+f6F2oA0hy+5+eQlmXpw5zzntS/ZkvlkTldrxeVrWsF8yvW5xayY2wjP6FgQ4iC8vIXuoNQkYND
	AMzY4st2zu4q0AvjVY+siuRZuY5bqWT7f38+f3/9bf5mCzXvQHVxpWm1qV4FRQlwSCyM6BtAyXKTL
	nDhMs0J6yayAV80bshtqsVjQejti62vT3y2+qD5GEJ+nxAgl3eWCO+6LhoFET7jVmtKOL6V0qurq/
	Q+QB7Zig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBeVC-00000000TOj-1Qra;
	Thu, 14 Nov 2024 18:23:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBeUG-00000000TFX-2WH4;
	Thu, 14 Nov 2024 18:22:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bzMfq51YBw3fK66Y4Obj6vDkHx4AScY6wD/SzgxHHl4=; b=mDA2wWXhKfxROFPmQQJpxx72zj
	0To+tuOSzd9zK8q5PTY3C3NLf6GzXmJ4x4no0wpM9pYWeGaqHgjbQTOtm0BRDZ0UFfgxudLz+VOVF
	IN5RQ1p/aW6vT7O8ewDG6l84kzG/VakL9qOiZW6XxXWXOVq9MWokesR0TOEB+WrCyGAnvMag5SuhG
	K946c33JCkSAaNjZY1XUqHl/vT31iI9zoqiDSdAXqU3ieuQ6PNvvPfzpNmpzY63qsj7CIi7ZtzNid
	SFFvnYpXFOJRSKh0qp+mGYN5php4Nloz6kAomKKXfT53IW1snuKq2i/Qa+Km6f/dH2iULE/8uQepY
	7dWRu5zw==;
Received: from i53875a30.versanet.de ([83.135.90.48] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tBeU9-0005D3-G0; Thu, 14 Nov 2024 19:22:29 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@pengutronix.de,
	patchwork-lst@pengutronix.de
Subject: Re: [PATCH] drm/rockchip: analogix_dp: allow to work without panel
Date: Thu, 14 Nov 2024 19:22:17 +0100
Message-ID: <173160851639.206583.9258442032788784452.b4-ty@sntech.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621201755.500271-1-l.stach@pengutronix.de>
References: <20240621201755.500271-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_102236_629021_5AF0C8FE 
X-CRM114-Status: UNSURE (   9.94  )
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


On Fri, 21 Jun 2024 22:17:55 +0200, Lucas Stach wrote:
> When the DP output is routed to a external connector there is no
> need for a fixed panel, as the panel may be detected via EDID on
> the AUX channel. Allow to continue probing if no panel reference
> is present.
> 
> 

Applied, thanks!

[1/1] drm/rockchip: analogix_dp: allow to work without panel
      commit: 86caee745e4506528801d9542db54e7b4c4d834b

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

