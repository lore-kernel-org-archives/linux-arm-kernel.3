Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77261D41C37
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 13:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfFxejg/br2zDaiaEBdU9ZBdpu/3APgsmRYKWbR2RV4=; b=rjz1yR9c5B2gYIdg4CApqL7F0H
	jJ/B0umlR14ICc1nhIVW7If7vF8TlRT4egKT4YZvijp7exI2pAMDnRmjgKwaNX21Tr/jFlhLVH966
	6WgVMGLRoV1ck4/vi4noq69JGIyhGvDgVI1xDgNPcsNMKhEuo9IVvzANfJQAvBCS66tjsnmmu89y1
	MTKqK8KKSNP3yEHjKON043+FgWP21CgxNa9xgVMyfvAniy+PsZx5oIN1RLNcGi+52mU1QjDJYR1Su
	ETq7Ka1NKb2Ag/WTMeFuVUvA02JGqe9ynXY7ofTsoci9Tfo1eupxY80f40e3izFzy0F2MMVe1eXAC
	36DTB5EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgjy-0000000GdnS-3lej;
	Thu, 11 Dec 2025 13:29:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTgjx-0000000Gdmb-2RNR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 13:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=PfFxejg/br2zDaiaEBdU9ZBdpu/3APgsmRYKWbR2RV4=; b=P04z5f9QZhAjh49Y13gbduOzqp
	vV0qjgaGNF2sYUMqiw8k9BpvW1l0DPcwMmbvMmXV31PKHlCovv5/Jms0qP4AD55otX18xsVdDdYeG
	jLjA5stL9swHDLi/q94ykBcZAtxj0s/q/UgX5pPCDfEP3rJvRHJgEmfh4htwQZCklaCc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vTgjQ-00Ge9n-Si; Thu, 11 Dec 2025 14:29:20 +0100
Date: Thu, 11 Dec 2025 14:29:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Potin Lai <potin.lai@quantatw.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>
Subject: Re: [PATCH net v3] net: mdio: aspeed: add dummy read to avoid
 read-after-write issue
Message-ID: <f53fcaf3-0154-4cc7-87be-ab815fa8b6f5@lunn.ch>
References: <20251211-aspeed_mdio_add_dummy_read-v3-1-382868869004@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-aspeed_mdio_add_dummy_read-v3-1-382868869004@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_052953_621688_B393AC7C 
X-CRM114-Status: GOOD (  10.55  )
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

On Thu, Dec 11, 2025 at 02:24:58PM +0800, Jacky Chou wrote:
> The Aspeed MDIO controller may return incorrect data when a read operation
> follows immediately after a write. Due to a controller bug, the subsequent
> read can latch stale data, causing the polling logic to terminate earlier
> than expected.
> 
> To work around this hardware issue, insert a dummy read after each write
> operation. This ensures that the next actual read returns the correct
> data and prevents premature polling exit.
> 
> This workaround has been verified to stabilize MDIO transactions on
> affected Aspeed platforms.
> 
> Fixes: f160e99462c6 ("net: phy: Add mdio-aspeed")
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

