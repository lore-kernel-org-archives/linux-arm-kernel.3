Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D8EC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 21:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUe/akxxdd5c7PreeaH46gc38+PUPMPsy9pqhCZI6so=; b=yEkkllcz5yazSn+P90exqwptF2
	tuGot5XHe9KRSRV3LVMt33tI18/UvgCC7RgMvSkA5bSn1YF1QdHu4irw7qHkcRAetSaXiMT1NDzje
	EcoqfnFUOIJAknT/SqsJg2cPF0NyAwTMkKv0S5QycEDynw1tp21k5KA+2fFq/EcV/asv0fbU4mjvW
	R3+YpzsI9Y90K8xyYNCOEEU0EMkOAwG+YvCm/oEBSQL1oyo2MJ99dYTjHdrHcJF7p4CGTvT73MBho
	hFcCcYcJqvmM6F3RjlvzwEfdhu0aTOEYuM42BfXnF8odJFkijn+s+rK43Gpl2mn/4OuFFMNtJRAPS
	Sf3f+cug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44fF-000000009eA-40nL;
	Sun, 13 Apr 2025 21:14:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u44ZF-000000008re-35wC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 21:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NUe/akxxdd5c7PreeaH46gc38+PUPMPsy9pqhCZI6so=; b=XxvNdeTv0zle75/6+fVO5MC2AX
	+LnDFJJ19t83kFQgIb3uubrraNDj4uRjPP/Q3ay62kUaZiiwwnHe9Uk50IP9Pa2j5C07dtuuwgH6p
	b+h8ClD2GXRAEXGMG+pwNigS77R8KcJjqUEBWvr9xrX+932WKFypTgZaWmqArXa2Sjes=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u44ZB-0096Kj-0r; Sun, 13 Apr 2025 23:08:37 +0200
Date: Sun, 13 Apr 2025 23:08:37 +0200
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
Subject: Re: [PATCH net-next 1/4] net: stmmac: anarion: clean up
 anarion_config_dt() error handling
Message-ID: <ad4d5a18-c89f-408b-b668-82fd83098c6b@lunn.ch>
References: <Z_p16taXJ1sOo4Ws@shell.armlinux.org.uk>
 <E1u3bfF-000Eli-C5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u3bfF-000Eli-C5@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_140841_779316_A3D5D80D 
X-CRM114-Status: UNSURE (   7.33  )
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

On Sat, Apr 12, 2025 at 03:16:57PM +0100, Russell King (Oracle) wrote:
> When enabled, print a user friendly description of the error when
> failing to ioremap() the control resource, and use ERR_CAST() when
> propagating the error. This allows us to get rid of the "err" local
> variable in anarion_config_dt().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

