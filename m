Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A444C1B0FF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhbjhVI6L7X1Yp3pBuL+czttai3RVbeLQIKlHMJuY0Q=; b=Y5ZunpB0pZrLYIVDHfBfdh5BLd
	2Iy5+YoUap6OAElFtSE6APBAtx+BF5TLYfJcPBH6QXAn6CCid3Icx1TTHQQ/NhKMFdrVGCIfNH5uN
	Dy7F4VWtSA+ANzGOHNCEjljV0ZfdZP9kGhhQgNlXska6EZ9ANiTpsPpGfSsWpHNyjBOfGwUhjMBc6
	J+triqDMmb0OiaFCoy9wrAFv6zfirW4ICrmo94qw9Nq791raIwntgodKISSxHeSfnvVlbfGsdcI/X
	StOpLevqKrDMKGVE21aFc0fcIRiJLRIoKMgMMkAfn85SFOaXMRc9LDKOZSM1GKx+txJAy0dljR8os
	9KQxukzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf0V-00000007l6n-0vGq;
	Thu, 27 Feb 2025 14:36:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tneUp-00000007e2o-39nO;
	Thu, 27 Feb 2025 14:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=hhbjhVI6L7X1Yp3pBuL+czttai3RVbeLQIKlHMJuY0Q=; b=w4SRFl513DU+MAiNNSNxibPh0Q
	Y7vuhemGk9JrO2K1FOMUg/CRHt0AVe16tMsaRG+aFB8wy9i94mT0P4SSeM0c5M8LHcx91B52yHzu3
	YCSEOrS3fLYWhF67UYmjiLa2syHG5FoE7EiA/JcTTn5SfdunnM+vwX0WALdNIiPgYSzg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tneUh-000c4W-G8; Thu, 27 Feb 2025 15:04:07 +0100
Date: Thu, 27 Feb 2025 15:04:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>, Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 11/11] net: stmmac: thead: switch to use
 set_clk_tx_rate() hook
Message-ID: <50bb7ed7-189f-4ad4-a486-5ec39b5e0a75@lunn.ch>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna14-0052tT-S4@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tna14-0052tT-S4@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_060415_793658_5F3AA11B 
X-CRM114-Status: UNSURE (   5.71  )
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

On Thu, Feb 27, 2025 at 09:17:14AM +0000, Russell King (Oracle) wrote:
> Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
> manage the transmit clock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

