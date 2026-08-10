Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A547C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a03sD61gz0cND8RfVQQZFPA4HhLVyS/O1QRWlfEqk4Y=; b=HC7/nD3AN7hpD209Zl6BSadGLz
	1P9kkhWB6loHIUCdq8nA0TXRlJAdPjMvsbmR2IY0WrBATmMRZNI5xkuIeA8P98QTeUdkQZ7uQGL5L
	dMrSuqixPXYPTUuQXy+M2VCTMijo1Jjneo13JbVt3efaegmUNVmRGw/fAIuk53oEP7fyGJCiF4BBk
	Uw3CRmFgIB0RLVAU5FqYaS4/D1PxhrRSTimUwBiEQ28Rz1evfpIlbG7w4mZqnBxrpuYXZxzWvR6ex
	XaP/r3AzFHuv2nEyp2lF4FrtHTyaZBR54p9hDUZ9YN/E4rCxA2Hg+cCVHX1apOEu4sDhRaLYSI+xS
	0Fxytg0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSue-0000000COuF-1f1v;
	Mon, 10 Aug 2026 16:31:44 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSub-0000000COtm-11ej
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 16:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a03sD61gz0cND8RfVQQZFPA4HhLVyS/O1QRWlfEqk4Y=; b=dulaZwJdQfNI0osM59GwS+YM8i
	yddMKsbeiM12zrLLmi7ZM6UnTGiusvWfC6MQtrfuxGG0Do/rRp/Qd8zuogGqspMPW2a+E+PlWCk2F
	RG1VDotZQt/scKoOpZhDi6gVOdVIteyjfzVG/pWqOoXOUNws8Ngi7wQM45mGDgoBtMLyR9oqeE7y4
	vVampryx4GCWrckOtDK9HKApl9hFUZGQNp3Q50UD9DVeIG/JpHLY810TC6HgffVUU/WllolPGda/d
	90Y9A+HZA7WAB2yQJj3BA6MAn+iPOgGFwQvH/+r0I6BCJVuH3Xq4lK5dZqYeH6344adoH6pDBFFkn
	fj1NSL+w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wtSuQ-002uot-29;
	Mon, 10 Aug 2026 16:31:30 +0000
Date: Mon, 10 Aug 2026 09:31:25 -0700
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
Message-ID: <ann8fwpUBYhr6aAf@gmail.com>
References: <20260810150749.458682-1-christophe.roullier@foss.st.com>
 <20260810150749.458682-2-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810150749.458682-2-christophe.roullier@foss.st.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_093141_286093_C5C92FA3 
X-CRM114-Status: GOOD (  13.07  )
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
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b2b7d0242dd3c..37d06fc6dba47 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -8080,6 +8080,8 @@ static int __stmmac_dvr_probe(struct device *device,
>  error_pcs_setup:
>  	stmmac_mdio_unregister(ndev);
>  error_mdio_register:
> +	pm_runtime_put_sync(device);
> +	pm_runtime_disable(device);

Confirmed that pm_runtime_get_noresume() and pm_runtime_enabled() are
called  before stmmac_mdio_register()

