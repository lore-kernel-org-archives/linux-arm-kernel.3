Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B552E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VTs1+x2pTFe8tnSREU+rvWGLKyWyVEaBCjCFPKHqA4=; b=Ai14PDd0oNb+8Gu9MEKyhWLwLl
	HkMze0ILojaEHk+T/YrFZA6t9nQCNX8rsr/XcT5WlOqnTHubwoAElaesrYzhnpyG6LQSMbMmaqqIH
	VdlorY4QaXkSjUmTWpizX9zR/aKFLYzQZ76VcMTlMpzwzRbBS2OM91LADky+uyw1qv6QdfjCbRTzV
	ltPwcO+D4qJSk9mN23MFxc9RPVu7PbMFpqpcFlRG9SEaRDQMSDAp8I8d/Uv8UzCXZPgccwwrZ9ML4
	A544kJIx1TE64hzSib6bj0p/oTVtpCspjNMGDjUKHnKsf3Oa5Ep/unqM2jKsoxHVnr1pvTkp9Brnt
	dPV3vm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqZG-000000024DK-0KA9;
	Mon, 06 Jan 2025 17:07:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqXL-000000023tK-3uLg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:05:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8VTs1+x2pTFe8tnSREU+rvWGLKyWyVEaBCjCFPKHqA4=; b=FgllUqI7GoH19JKvDzk+sRkikO
	prK8orwoVZPvT+67lKbx+yXcuoYqtjQ6EcxxdF5vBXV26KIB9taM+/24Nl0wLYZZQO0g3wwhdYnFF
	uOXeaxOIt0Ph28t5ErohAqyxrYTcNeheeC4uM6LoOs1nS2VZGZYmX/JCvQZxsLKjo2lU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqXE-001wMB-MI; Mon, 06 Jan 2025 18:05:00 +0100
Date: Mon, 6 Jan 2025 18:05:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 12/17] net: stmmac: move priv->eee_active
 into stmmac_eee_init()
Message-ID: <59f77c8e-bca6-4b9d-b6cd-167be4012ecf@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAz-007VXn-0o@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAz-007VXn-0o@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090507_965382_1D85159C 
X-CRM114-Status: UNSURE (   7.42  )
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

On Mon, Jan 06, 2025 at 12:25:45PM +0000, Russell King (Oracle) wrote:
> Since all call sites of stmmac_eee_init() assign priv->eee_active
> immediately before, pass this state into stmmac_eee_init() and
> assign priv->eee_active within this function.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

