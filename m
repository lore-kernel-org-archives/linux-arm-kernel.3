Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7896C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKwKmN5MgpqdaSIT1WtFxvF62foTxJhiMC9BORmGGn4=; b=SZJM/zntMHXLaFP8ggHok8byyV
	YFOgFefUNDi4XowyVevgVW0CMmIfV0FI4qYPdGJRfGcgFTZ4g8SVh535HJK9ETy0n3lxCtjyJCWYY
	m2OHf/cEy0xQS7jyCBpLd6p3AvJ8NR2suqm+mCRWebVTUjV0hzFo7166SxcaN7iRLk6oY2/2Ro0UZ
	IlWV+iiC0h/avNI6cYFs+exgzAHBoH5ZeV90qnZJjzA4bO+PtszN9ZEjgh/zctBG3gQMw15mpAfR5
	y/Jn6mJjji+f2j+Y0Fj+tl5owVS3hP68akDduGTEaLaHDpjgVqMz+8F06SQsDFZ3L3bYlLXXyZmtA
	33YtTFzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATAr-0000000Fhwd-2KU1;
	Thu, 01 May 2025 12:37:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASpS-0000000FV4B-1SuE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:15:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iKwKmN5MgpqdaSIT1WtFxvF62foTxJhiMC9BORmGGn4=; b=HuA41PXy9c1qxc6ciZpwfdnFsI
	ejhzB97ntiFaqJD+vKoDqfw3SJwo9Ui1MH0yqx+XtjXI8b8/8hJ47Rlqj7fRlfSwJQeYyv5oTncs7
	kdy0E+uJmtkWrgQKJOFlOhH5gGVwxLxnXLzPhVUi+lwnXJ5poyYdad3B+W9VUK8sumHI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uASpM-00BJJv-Qp; Thu, 01 May 2025 14:15:44 +0200
Date: Thu, 1 May 2025 14:15:44 +0200
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
Subject: Re: [PATCH net-next 5/6] net: stmmac: intel: convert
 speed_mode_2500() to get_interfaces()
Message-ID: <561331ed-b231-4a3a-bc97-7ab11a6759eb@lunn.ch>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
 <E1uASLx-0021Qs-Uz@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uASLx-0021Qs-Uz@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_051550_389340_4163927C 
X-CRM114-Status: UNSURE (   9.01  )
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

On Thu, May 01, 2025 at 12:45:21PM +0100, Russell King (Oracle) wrote:
> TGL platforms support either SGMII or 2500BASE-X, which is determined
> by reading a SERDES register.
> 
> Thus, plat->phy_interface (and phylink's supported_interfaces) depend
> on this. Use the new .get_interfaces() method to set both
> plat->phy_interface and the supported_interfaces bitmap.
> 
> This removes the only user of the .speed_mode_2500() method.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

