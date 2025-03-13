Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F77DC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNWRjxoA9JsYQRCUVG8bkf0reIJyoWkhEVKiEfrJEN4=; b=uLCBGeOHZ1R4Vwf2/8MPgGUFly
	apGNEKbpo9AgrSlOo3g6tZXfNovktuinMSvmabbVGI02q0BfHrJeboDvqWa3wit/LPt5NsEqYIsqr
	xpDEftdcItHGFwUYiEGX9AUQfDLDnnoO/ODChL2hIf7xT9w2VPd9rghRwSFwZemkzz6YYhvnyaWLY
	ZWou41j6FbO/hocLxskMChFC8B6de4d4plp3xfx2UlBilZEF+9ZfNg+Cj93VJ/l+HSsIEYSdJIOCp
	7bdPLvc61xkjjSWLocNQWcTRPc7vDwVbbyCE/M/UiWA4+eHKLrJ7lcpimdj4wheIV901gwUWpqNCu
	0rH1dsfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdiV-0000000AW3H-2BYm;
	Thu, 13 Mar 2025 08:14:59 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdgq-0000000AVwR-24Bx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 08:13:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KNWRjxoA9JsYQRCUVG8bkf0reIJyoWkhEVKiEfrJEN4=; b=Y8K6rmu/SDHkEIdnY6m360zt81
	8kzPwsNJQ4rc5IACAg6B5ZDIV5DFMtvgcp7InuiR5xaNzbzQiiXN7ZGThD8agyyGt35Rg7S7bl3ZI
	jvkMah64c+1BwKawt0hM12P7VXqqjbSgvWRzOTygixRoM/83PLiORN5nYX15gO0gROoDaNH9GMcUr
	oEk4oT0grTn5KIxWUEQVn3SDrCEXbCU0sK8a7BOBD7VWB6PKcsz7JSXW8gA6Xva1qsUzaZ6GqdpmM
	/7e1ry+fVNsDUGSRYMVzkgqNYl97VhCmWX9AR1xZihatto/Vd+hhFSSxJxUS2DQvYKTcpx52dr9TG
	6QyXQYGQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56136)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tsdge-0006fC-1T;
	Thu, 13 Mar 2025 08:13:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tsdgZ-0005QW-1c;
	Thu, 13 Mar 2025 08:12:59 +0000
Date: Thu, 13 Mar 2025 08:12:59 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: avoid unnecessary work in
 stmmac_release()/stmmac_dvr_remove()
Message-ID: <Z9KTixM7_vc_GFe-@shell.armlinux.org.uk>
References: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_011316_529245_FCEDBC0F 
X-CRM114-Status: UNSURE (   9.11  )
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

On Mon, Mar 10, 2025 at 12:31:32PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This small series is a subset of a RFC I sent earlier. These two
> patches remove code that is unnecessary and/or wrong in these paths.
> Details in each commit.
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 -----
>  1 file changed, 5 deletions(-)

Hi Jakub,

Why is this series showing in patchwork, but not being subjected to
any nipabot tests?

There's also "net: phylink: expand on .pcs_config() method
documentation" which isn't being subjected to nipabot tests.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

