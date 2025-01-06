Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B780FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 17:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL3AKJ2+DZ+9z5bBIltaAldHFwbwaYtHrCuhGiI4EJk=; b=xt6vfcqdQet2PWheRqoypqGid3
	jS7QyAZihaZSbRxbkS3y81SKsMN+7PrrUKXQL/+T1TXlLv+XPdofxGbeqoJORep+srLdksWng7zyV
	XehPqdHNqhkSGVeSYLvb9KRPtRcRL30RQw+eeA/VOQ/APXsOe5LKSrB2k30T7XZUIbnMCpEZr+2Z9
	BJlWjHQnBxO0KjrxuJ73DVPcGF9QxnbTrkYSFDqFBPhng9Vf6kvbvw5FEohP4QNyhQhOyHb2rJmBU
	DhVhRkmllpKLOBxFQjPnX3UlkeMCbZFpXYl3usMXktRZ9u4vDvzXow2U57cRHRnOJEZeGCHffsIOZ
	OxJm2xUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqY6-0000000242Y-2roj;
	Mon, 06 Jan 2025 17:05:54 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqWb-000000023m6-2Qm0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KL3AKJ2+DZ+9z5bBIltaAldHFwbwaYtHrCuhGiI4EJk=; b=HPbvvjLlJatAB6mq1bcjXWIWDm
	N9uXJ+Vf9SeyrJD27mWCo074zmyb8wFCDDd9FEFdIIwjzw1piL17W5NgbF14yKDX0a5JQMLk7qhpj
	5qvCWNPrVCdvo/TdR885LeZYKYtMHrTHtqrBBUNpyWp91S0YHV0xDAZyTdHLN0MBo9bc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqWU-001wKd-4n; Mon, 06 Jan 2025 18:04:14 +0100
Date: Mon, 6 Jan 2025 18:04:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 11/17] net: stmmac: move priv->eee_enabled
 into stmmac_eee_init()
Message-ID: <e1f9b24b-d31c-48c3-a4a1-6599f7a81148@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAt-007VXh-TZ@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAt-007VXh-TZ@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_090421_615223_C3CEFF7A 
X-CRM114-Status: GOOD (  10.58  )
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

On Mon, Jan 06, 2025 at 12:25:39PM +0000, Russell King (Oracle) wrote:
> All call sites for stmmac_eee_init() assign the return code to
> priv->eee_enabled. Rather than having this coded at each call site,
> move the assignment inside stmmac_eee_init().
> 
> Since stmmac_init_eee() takes priv->lock before checking the state of
> priv->eee_enabled, move the assignment within the locked region. Also,
> stmmac_suspend() checks the state of this member under the lock. While
> two concurrent calls to stmmac_init_eee() aren't possible, there is
> a possibility that stmmac_suspend() may run concurrently with a change
> of priv->eee_enabled unless we modify it under the lock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

