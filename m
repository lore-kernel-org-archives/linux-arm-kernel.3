Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA2CC71156
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 22:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LaGnFqvR1wl2qKxehQpdEmDTUc14ihv8MkUpsGD81E=; b=cOcuP3xW1+irp5QEyIssgrTPaA
	WYqvED3vn9z9vh4UJ/5UgQdq1V0FHAm7b2wqmOFWlD5cn+wRoLOXnYgOQdOZupkIlRaC1SQxdGjtz
	OZ/skrM58OFlcWrPsnZ+FdTsGbX3kZlfnEvtwAk7wDXfogxXQpSBuv2qBjbgYw3ir0fcv4DBK/r3B
	lQHUF3Vkazm0uGqmyLkyhsQcelDNniHVhF6Rui8bw8urEFXnsedvJLBgOLY/c5arJ8IS/gR9f+bxw
	bDbXN+G5juQjaYRi/W+zXFA37UANKPelsb4Sjb7xCDNVXbgIfZb5vG/ehTd/i3FFBUO/+q+Lpwwn8
	6DjjcPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPq7E-0000000EjaS-0aWB;
	Thu, 12 Jun 2025 22:09:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkDs-0000000Dreb-0fh5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5LaGnFqvR1wl2qKxehQpdEmDTUc14ihv8MkUpsGD81E=; b=r8I42CbG3KmgA8m6yGXn09zbH2
	VoNW3CfmhK+FQ4PFds4ddyg3xSmwAlteVx5ggFiJCJOynYqI774/qNLarQQWs6MOLWAZDCdT4weho
	+DO2muzKIIMg+UpMkpP9i2CaaKqQdFFqcz3WW+35sh6wpwcrq5ltNxlmp1fkY36PPb8Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uPkDn-00FZFl-BH; Thu, 12 Jun 2025 17:52:07 +0200
Date: Thu, 12 Jun 2025 17:52:07 +0200
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
Subject: Re: [PATCH net-next 7/9] net: stmmac: rk: simplify
 px30_set_rmii_speed()
Message-ID: <76f78d75-f2a0-499d-89ea-5497f7526062@lunn.ch>
References: <aEr1BhIoC6-UM2XV@shell.armlinux.org.uk>
 <E1uPk3E-004CFl-BZ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uPk3E-004CFl-BZ@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_085212_196139_3E6A4DA2 
X-CRM114-Status: UNSURE (   9.47  )
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

On Thu, Jun 12, 2025 at 04:41:12PM +0100, Russell King (Oracle) wrote:
> px30_set_rmii_speed() doesn't need to be as verbose as it is - it
> merely needs the values for the register and clock rate which depend
> on the speed, and then call the appropriate functions. Rewrite the
> function to make it so.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

