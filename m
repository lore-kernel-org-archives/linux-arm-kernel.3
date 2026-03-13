Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD6A107BCCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UejB3qVgkYmEnpufL8aa0oz3/KfUNofcBGyIyzafnKw=; b=ry0eh7xOG/gci0U259/Hazd3+q
	8e6vESN7dOBlr9npdyeaV5ILtBmPxKgWlcP4217qrL5xbbzFhZPMafxw61uUIK/bmDKmAEjxSIAN9
	T+oScrZgOlU5aUAjrmHZX/8yluLRrTUqJplQ4bMtlLbi1EMUVUBOKnN5r6snuaUATf0ZGnGzCxFb0
	QJUpE7LjZia3LCE2YZZ+FajtLr3YAMJiwowPCPJX3SjoJaX16ZOeaxFFkK8ibXx5vzjlfNGI4qQWz
	YrXM5Z5tSOiOpksSJ12TkbUVVs8CtVFd9+BUxbl14iIgvQ+1zpw0nJmXMlMCH/b9MwwH4+yDaArxp
	/n2vbkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15NQ-00000000eBh-2YkX;
	Fri, 13 Mar 2026 16:28:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w15NO-00000000eBE-045g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B4B7B42A1D;
	Fri, 13 Mar 2026 16:28:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D9FC19421;
	Fri, 13 Mar 2026 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773419317;
	bh=jKX0pj1jKoF+guypTdltnGFFHDEUGXo71s4o3l+W9ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwDjLg6jIO0j0FTjXyAfgw0KCGHJdLhSMgy1pL3MJmbzy6Srl/odcTsWnVe7U+cp0
	 IacU1BcRWTNaqqoDFj5o9pnRSPa0T5KDbFPlD0VWqkRgl4LfanuNCQR6+tniPU56LI
	 3QMIg7nSn98UedFpmrli2/EmaRSvbPJ0RLuQoB2aOeVbUfIF01VRb1w6/pgxl73AYA
	 01eeI7zdaDI/kGZWvQpVCC/LrT9YgRq1JeOJgupkW4K/39nHdBQD6Rf2CNOp14WqO2
	 l0vlaNEyb8SHVX5gKSvVNnvZ9U68d24u0ZsJqn/daxnFvnSlIYhbh2iNOpHT8YzO6I
	 SgvafFB7qbLtQ==
Date: Fri, 13 Mar 2026 16:28:32 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: avoid passing pci_dev
Message-ID: <20260313162832.GA1363644@kernel.org>
References: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w0evI-0000000CzY7-1fyo@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_092839_343196_F4828269 
X-CRM114-Status: UNSURE (   9.48  )
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

On Thu, Mar 12, 2026 at 12:13:52PM +0000, Russell King (Oracle) wrote:
> The pci_dev is only used to provide the ethtool bus_info using
> pci_name(priv->plat->pdev). This is the same as dev_name(priv->device).
> Thus, rather than passing the pci_dev, make use of what we already
> have.
> 
> To avoid unexpectedly exposing the device name through ethtool where
> it wasn't provided before, add a flag priv->plat->provide_bus_info
> to enable this, which only dwmac-intel needs to set.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Simon Horman <horms@kernel.org>


