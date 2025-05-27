Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98197C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 19:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xfabu4AMllSeaju3LPHLpuFW8PQMwXw0t82FVJTwvEc=; b=CevbrwMCwgEWBnHcpMsk/FZYFI
	eXYReJp7tbBWkeAqu6cPGWDWKYr0K4l+UmWhJQPT99vNZ+HcEhQbqUx0lq4Lz73ogKfGD7mJdlAYO
	swlETjP7CUl7KoVvw1PK3trM0fw5PfjDS/YCUFLWqYF+jK9IIohQ2kmJFYFvliRiVD1GxfD1t+wTz
	ko85RpQsjxLugY7JPbhfXJJx6oZry6eO756YokfadWPRfVkAR3YKH348RntH7nWYMJ4G2e5aoFbu0
	bH5OsPUu7AJKHcXty7+DyYhrhD2Znn+XF0U3pVOX6+adpCv+UjkZDOKUgRNLLLhMsUloVgXTe3QoM
	PGyM0Upw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzn0-0000000BPpy-0R1S;
	Tue, 27 May 2025 19:16:42 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJzkq-0000000BPZq-24iN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 19:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Xfabu4AMllSeaju3LPHLpuFW8PQMwXw0t82FVJTwvEc=; b=f/ceSIhl0pwULuwRwhuhzl4giN
	laI4TYdBH7PBMivr1Zr5limINaFDa5BQwXAl6I9eEonOEKfY5qJMs4fMPq6APZpumbh0weKMCdbiL
	zT6fTSynB1S5FEcYmY0UPJTQ0BKfb0WpDWjKIgkdi3S2EgpiFRHz3FobBqls235E6GRM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJzka-00E6OW-CJ; Tue, 27 May 2025 21:14:12 +0200
Date: Tue, 27 May 2025 21:14:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Furong Xu <0x1207@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
Message-ID: <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch>
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527175558.2738342-1-james.hilliard1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_121428_534425_FE3BCCB6 
X-CRM114-Status: GOOD (  10.18  )
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

On Tue, May 27, 2025 at 11:55:54AM -0600, James Hilliard wrote:
> Some devices like the Allwinner H616 need the ability to select a phy
> in cases where multiple PHY's may be present in a device tree due to
> needing the ability to support multiple SoC variants with runtime
> PHY selection.

I'm not convinced about this yet. As far as i see, it is different
variants of the H616. They should have different compatibles, since
they are not actually compatible, and you should have different DT
descriptions. So you don't need runtime PHY selection.

	Andrew

