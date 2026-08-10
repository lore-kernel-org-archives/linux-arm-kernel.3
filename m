Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1C5C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4AITN0RCwXypX6V4I5qA82RE//jsyui6N1bPe6k7z4=; b=iYgSFh9i2xJR0Q3L40bBF6EDBU
	8lvsg7xoe7dUHygcHtw+/zbvUFyI0/6gjt/2ryXZ7i2hwgzxwWn4q06NpfXfbiVP6wFd3aE5E7edn
	Y3ZRLSyv+GpqrICwBeF/SVCvG1f4wrF8N+zIVfySMLVZl9nsicLlVJwBghCsYuxyt2I1HS+sj7RcQ
	Qh03vRA7FO5LIq8juZrGKGOiEhStAJ/sxbTBi/wjd7U0Hy/Tt8TKrvdg5Ugcias0+KDx6KnBgt7Mz
	F8YsFP9UtWWwcpBpepD5INzVzKogaGch5tHJAgTG86kq/b0vCVTADKyhJqKNaetf7Cym6SdN3Gv4x
	5TKQA6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSUu-0000000CLCD-2sy2;
	Mon, 10 Aug 2026 16:05:08 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSUo-0000000CLAA-35y7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y4AITN0RCwXypX6V4I5qA82RE//jsyui6N1bPe6k7z4=; b=JB4wSMFPSr7qsbEipgjPbQ06ja
	VsbZHiaEKMqFqWUo+vk15V8ElqwawHOk8SbyPEXOqrYhHxuzcOdX7y/v2E0jyTU9hWeTJi18aNN3h
	hVUTpa1veO2lLGjWNt0cA0a3+aOJIkkZwXF7WrlRfW8XDRRZPxw2hWEcBB+TQxxlYKgYB9gjF7AE2
	pRnYNNNRmcoe3IgTEao5rreKpwKnr9mfLpNLwEqmUNOGQPLtd5mNq/mujby2j+xRgpYWGY78wK6A4
	TSUz11KH6dk20MzLWdkTjLK3sZVsSeIr7GwLhYb0XbDoBs/ZTRPOY8INhivOb13QH1c4iaPUdXOnT
	at8p2fnw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wtSUS-002s2B-0A;
	Mon, 10 Aug 2026 16:04:40 +0000
Date: Mon, 10 Aug 2026 09:04:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <rmk+kernel@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next,PATCH 1/1] net: stmmac: Fix manage error case during
 stmmac_dvr_probe
Message-ID: <ann2g_WFlHAaTnFI@gmail.com>
References: <20260810150749.458682-1-christophe.roullier@foss.st.com>
 <20260810150749.458682-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810150749.458682-2-christophe.roullier@foss.st.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_090502_785274_E5A8F238 
X-CRM114-Status: UNSURE (   7.00  )
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

On Mon, Aug 10, 2026 at 05:07:49PM +0200, Christophe Roullier wrote:
> In case of error during stmmac_mdio_register, pm_runtime is not
> cleaning before exit probe.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Fixes: 5ec55823438e ("net: stmmac: add clocks management for gmac driver")
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Breno Leitao <leitao@debian.org>

