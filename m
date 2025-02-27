Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDF1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXo/gwQcHIzjTzOx3CIOMAATJASGHIlvjB+ltGLd90w=; b=khPNMGHg5NAmA/pRXq8wmR870+
	87sAVb7QfJ1sXOK8Ehq8N3ejtAX3B7t3kvcdG3ICVfMA690CuXwm2FC7bhDMfL02gK3wZBrfUkJp2
	gim3UDCV+ZiX7lRHpxYGUiT/TS7LVeeRE1yvNq/MUe97KKNx9+FvP/99pAZL6t8rs/7k08upZ5ZLb
	kR0hc0Tx76rnXbeej02pLtl3l3FDkG3jumUuUG+JJn5LQEUXA72eEk+ztTrDqOa9oQc1YTJNp5P9C
	oaV1lZXw1TarTlrMngtTyzj9tb6dl3MbMaeL0lZe1K/M/RbUdrmKf4o70P+VnVljtsnpSZKmumoMH
	lRpP3Shw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnedo-00000007fqs-06O5;
	Thu, 27 Feb 2025 14:13:32 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneT0-00000007dYJ-2ZVs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 14:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JXo/gwQcHIzjTzOx3CIOMAATJASGHIlvjB+ltGLd90w=; b=lgISJFitMArp1pyFbmmz7qXrym
	cYJMCGJZ1iOqhPso3y+jmxfwI6EQoFxD0MRfJZB76SC2Ejis7hJm6VZqIMjG2T0Yn4UyHAV/dUOOW
	CS9s2M1gaWN5QgTBiXR8S9HpbhqFMNck5XhhwHZr4Acg6ArJf6Z35H3YRJNwUNdlyegM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tneSw-000bxn-0G; Thu, 27 Feb 2025 15:02:18 +0100
Date: Thu, 27 Feb 2025 15:02:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 08/11] net: stmmac: rk: switch to use
 set_clk_tx_rate() hook
Message-ID: <1e7b72d2-b2f1-4ec4-90ba-5b712edf8f0b@lunn.ch>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0p-0052t8-Gn@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tna0p-0052t8-Gn@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_060222_645900_FAD3D2A2 
X-CRM114-Status: UNSURE (   6.61  )
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

On Thu, Feb 27, 2025 at 09:16:59AM +0000, Russell King (Oracle) wrote:
> Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
> manage the transmit clock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

