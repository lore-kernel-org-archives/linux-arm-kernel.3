Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0B4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzcmqTWiYWWPsLQK7fIAFID7YH7joj6uKn9KeMi97E0=; b=1roP14oxuu4d0pyR0R4/yY5Wze
	snu1790MPozB1iUek+cB6/Pqkq7XGsBqINY9a9OUzzP9SKJkJJt0wX0vnYhTnyxuI+s3+WuHtwIo5
	ffxzZtukDKT8RkASpi6AWIbXsuxBVDvDiJ2DkfUOfGJjZugim7DFCeXYvAwuWxA+1P26wV4FGVECI
	PzfJ3t6M8eF/PaEYV/tFVZMwMZNpCHV7NCgzIvmfhsGjrq0n0jDo8zs8YhsjTbso9cbt3lYHCQQYu
	Wzk6vco+d1Cd3HreoVgAgTR8pS5aByNJaooLWm9ZBO4adwM7YbYLs53YPvCQDTJEvTMsaTsRPWtkg
	YBYJyqqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATEe-0000000FiXr-20GZ;
	Thu, 01 May 2025 12:41:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uASq6-0000000FVZT-44xj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 12:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AzcmqTWiYWWPsLQK7fIAFID7YH7joj6uKn9KeMi97E0=; b=lmcJ92Rum2ysCJj/i2s3znt63E
	1GtXp5QE54AGszG20q5544djNWOtWfH72HRNIBEb6Q64YC/uHLf9KoCCgnLROjYRQ/KlKoeTJ3c3B
	E1xhrKpGQL2gDzXFAr++M+5YxSi3QYkCaacaT/+ZCeNUAQNKDITtWMspoPLB2Z6SH57w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uASq2-00BJLe-Aa; Thu, 01 May 2025 14:16:26 +0200
Date: Thu, 1 May 2025 14:16:26 +0200
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
Subject: Re: [PATCH net-next 6/6] net: stmmac: remove speed_mode_2500() method
Message-ID: <37ba2593-6b65-4ad4-98ff-41c2cf9b7f79@lunn.ch>
References: <aBNe0Vt81vmqVCma@shell.armlinux.org.uk>
 <E1uASM3-0021R3-2B@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1uASM3-0021R3-2B@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_051631_009780_F0016209 
X-CRM114-Status: UNSURE (   7.18  )
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

On Thu, May 01, 2025 at 12:45:27PM +0100, Russell King (Oracle) wrote:
> Remove the speed_mode_2500() platform method which is no longer used
> or necessary, being superseded by the more flexible get_interfaces()
> method.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

