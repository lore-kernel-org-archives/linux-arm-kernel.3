Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F6BCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c9LF8t05wCPldyGpjFav7F6YUnp2uaWeZeIYO17YxQ=; b=3m5Nv9n8vf7EvuTrJkdZ2G69vM
	xPVsUqfaznNQgOBd5Mpvlu4wITr7xmpHaRgK6XpaDbvdMun8mtP1Per2wTMFj8kl7e7c8K4ehtS0i
	VcL4y6l9m1ix3zhabj+Fjukm0ZNNreUTTPGpdRl6CD9hFr4pj92bckPrvLFuQaHg6riMVvpt7J2bA
	mB4dEJA/2bz9/EYdLDtq4AjwHXojuKb2osxgpchxPBpEoKFPi8WQBxGmvj200bZrED/QVez+M734E
	xNdPVaGgRC8ljBzb/FaMaEBhaesSPph4UdIorlGiALdjN3D1wVFtDsFgRymlOupBwKhYq8HriB43M
	/Mnfu7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM1X-0000000FzCy-0XmW;
	Fri, 05 Sep 2025 02:17:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFED-0000000DnTA-0qnz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 19:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7c9LF8t05wCPldyGpjFav7F6YUnp2uaWeZeIYO17YxQ=; b=Qiump116rQI8IMkUSa7QZlAi7A
	cplaNriHRhCc74m3WtjPza3rxaDBckbUs/+OT7XBH8z8pAFmwA/iQ91ktuM1F5h+SHX/V8JbSQrD5
	KHgKaT+ULRzJEmRIP0O7ozT53XwkbVOV2/8Py3OB1Zh+0wnmdNqm8qGquqprlD/Od87g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uuFE8-007G8T-AD; Thu, 04 Sep 2025 21:02:32 +0200
Date: Thu, 4 Sep 2025 21:02:32 +0200
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
Subject: Re: [PATCH net-next v2 07/11] net: stmmac: mdio: improve mdio
 register field definitions
Message-ID: <7b9f2bd1-76c0-4965-8148-c6c6cc282126@lunn.ch>
References: <aLmBwsMdW__XBv7g@shell.armlinux.org.uk>
 <E1uu8oM-00000001vp4-3DC5@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uu8oM-00000001vp4-3DC5@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_120237_239105_F5F58346 
X-CRM114-Status: UNSURE (   7.37  )
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

On Thu, Sep 04, 2025 at 01:11:30PM +0100, Russell King (Oracle) wrote:
> Include the register name in the definitions, and use a name which
> more closely resembles that used in documentation, while still being
> descriptive.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

