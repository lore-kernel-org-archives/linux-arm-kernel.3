Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED61C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 20:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8crQoGFjLWEj4q6o0Bneeo4CWNa5+XlpQvMdv/3ao0o=; b=FrcYQOq7vzUevMkQbDz0yYOpPd
	JwOGLC83RJ69fAbd/KerdOp7ExqiX4TrUMM+mv3Gq6zFr8p0OjWZTG3oQYUj7ZWT9z0qPA6W2MTZy
	B9LFbdW0MR98pDSeY83fw5eVWUEyCD6BRby5484V+/gvq/De6DD2poGnn5DGQ7Adxbez8dWT920R4
	lAPJ/4aJfwuZensJKTiyX5ij8FQMTonu+WhsK3u/95LHHDzylQeiimyUgPGtzAvcFnbV40fKwyiW8
	2N8aufZ5hGaK6K/ldy/ra8ZpGEwLapppIch6dTzWIbSIEd24af3RhK+6/you498vqV4+SVaQtJMt5
	4b6w5Auw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2FJR-00000005JdT-2mqZ;
	Tue, 08 Apr 2025 20:12:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2E7s-00000005Abw-0YmK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Apr 2025 18:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8crQoGFjLWEj4q6o0Bneeo4CWNa5+XlpQvMdv/3ao0o=; b=gpfcR1qwHEpyD2xseSXnrb8biE
	MYmtS4OWezQn4BMKLrKh2Mc5pTvG1RqdzOT5KNvv213TLpcbCvKc778NXh145td1KGnhV42znqiZs
	inPLeler8JjCJVi4r9PA42g3FDLJlpbwBqWE2BzCygkdsU4p/zTzlQj29RBk+r/e9NMtVclKSpszB
	L5fUzT6QO7DhR7X/ZvoCTDpRqtk63JWE3i63QaLwKf5xLMCKuyhMw95gDsbMNkBVTG+s6SWDERp/N
	3XdELSaGkHFcuef5pb5ApsynwqW0pY9CIIJpSRqJVWBkXuqXHa6KwcuK48eauCPvOk64+lLEcsTys
	rshskftw==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2E7p-00000008OtD-1eZR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8crQoGFjLWEj4q6o0Bneeo4CWNa5+XlpQvMdv/3ao0o=; b=dzeR6h+DY+XQ9DTSdxCfcDApK+
	4bHLC677M7yfG3UnQ4g/AjsdnNpfT/9uatPZwSSIYIqHKiXWorIqYt6xzaxGXDvZx26BnqDl/T0WF
	S45k2uJ9xZGB5gt2sdMnvw5iWs/xzEWWS1JbiQXqvGaiDDt7XN641exj5Pc+R2uL500I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u2E7c-008RFE-Qy; Tue, 08 Apr 2025 20:56:32 +0200
Date: Tue, 8 Apr 2025 20:56:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Richard Cochran <richardcochran@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH net-next 1/5] net: stmmac: dwc-qos: remove
 tegra_eqos_init()
Message-ID: <c28aaa03-b2f7-44a5-9025-dfbfa0925ede@lunn.ch>
References: <Z_QgOTC1hOSkIdur@shell.armlinux.org.uk>
 <E1u1rgJ-0013gd-2q@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u1rgJ-0013gd-2q@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_195645_512522_4083F9B8 
X-CRM114-Status: GOOD (  11.11  )
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

On Mon, Apr 07, 2025 at 07:58:51PM +0100, Russell King (Oracle) wrote:
> tegra_eqos_init() initialises the 1US TIC counter for the EEE timers.
> However, the DWGMAC core is reset after this write, which clears
> this register to its default.
> 
> However, dwmac4_core_init() configures this register using the same
> clock, which happens after reset - thus this is the write which
> ensures that the register is correctly configured.
> 
> Therefore, tegra_eqos_init() is not required and is removed. This also
> means eqos->clk_slave can also be removed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

