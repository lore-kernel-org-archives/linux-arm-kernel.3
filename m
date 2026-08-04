Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F3C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osSW8pITCgD4+RMq14591sZtxfXFxKGPBcEYIBgm7KU=; b=gK1EQdu/Urha0a5IDyIemxM9Sh
	8q+VkXniFEZWQ8rVUJdRfXr9UOTAlteFfZFQWTN1Sos8Kl3h8RZAcKZOCsTHGov1VqFFWXwEB41qM
	AbcDZcztMqUik0SrWNJuPnELgaHMiEeKoJQfo7ZxuEw6omW1ILuUX7Gpu7dlregZW/YZbirAKE0O2
	hz75o/3zsbJX0vwnVQ9yNE6h7dRE5kVHdvVxpYjRrnDTdJ+F1DEoH3U+Nb758560Jp6PLqL5xQP/+
	12Il9touCikfZs2aYKT67uok43ysV8zj0rMaV4G9/6TzFvJcsrymqjMQjdm6iT8hMogFNrF0o2Y8v
	96MJ2zIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJCt-00000002WPw-3ATP;
	Tue, 04 Aug 2026 17:45:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJCr-00000002WPU-3HyM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=osSW8pITCgD4+RMq14591sZtxfXFxKGPBcEYIBgm7KU=; b=3rEpGIP7KPlH1lZ2dfkUwxFsOG
	VmZgwrCcL/YdqjSaHuXaaNBxVRshb8IFJj0gl/tAAI2uxC7ag3aPuDM9kx9fkA98C0iDj1mKAImy5
	m6AnEoBck3zT8OXdH1ALrtc2QQkODAwKbGVNxmrFJ2MmLykdPLjy73xl162SJSxioyj0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wrJCe-00G1q5-T6; Tue, 04 Aug 2026 19:45:24 +0200
Date: Tue, 4 Aug 2026 19:45:24 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, linusw@kernel.org,
	antonio.borneo@foss.st.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] net: stmmac: manage error case during
 stmmac_dvr_probe
Message-ID: <17bdf6d8-a31d-4601-bbc9-4d7b78897272@lunn.ch>
References: <20260804132052.205273-1-christophe.roullier@foss.st.com>
 <20260804132052.205273-5-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804132052.205273-5-christophe.roullier@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_104537_825164_6C9D713C 
X-CRM114-Status: UNSURE (   7.68  )
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

On Tue, Aug 04, 2026 at 03:20:52PM +0200, Christophe Roullier wrote:
> In case of error during stmmac_mdio_register, pm_runtime is not
> cleaning before exit probe.
> 
> Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I don't want to accuse you of anything, but Russell has not been
active for a while, this is v1 of a patchset, so seeing a Reviewed-by:
by Russell jumped out at me. Can you point me at the archived email
from Russell. Just doing my due diligence, trust but verify etc.

     Andrew

