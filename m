Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAABCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 18:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Fqr22ggTJV1jyun682iQwk8f5dcYH5XeO5RUl0DkB0=; b=A6iU/zUeFy9PKfi/sXPKyLvJHG
	pmolFKO8ny5qxyFVZIaPE5bReLAcK5MuZidWYpLSIEszgH4x5zUI86pTxuabxeMnGpKe/346aSuWN
	p0ohiH681GJk9kVy5SbDbg4j/ea6to6+IS5savwKDMpDBqdPAp0GXB6P7RiFoDq/7wIjWP3dCRn1G
	Gx97k5zOPyF671qWmg9+RDxBZP6m/mWOevCyojchdKwaUpSDJFf1uBBnHvdPugWUpeowc8XBKxVpE
	eU/Qr7vih7rKHuS/l6AzoaKCuHLIbF6cRBjxuY0YHgceyxV1Sva1jGsNp8X8Vkx1unUALEub7AnT4
	LvLZbYTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0M6-00000007HMG-22XN;
	Thu, 23 Oct 2025 18:48:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC0M4-00000007HLa-3OXG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 23 Oct 2025 18:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5Fqr22ggTJV1jyun682iQwk8f5dcYH5XeO5RUl0DkB0=; b=LQCQen3SllZhwrDo6Ku4QrF16U
	M2lbqEcaoMengwo4YyVVukLB358gOOZGKMQwAfgdiQhIUrRYix5UGNy6P+HnGuExBWS+Vd3+6Lmkd
	SXKoPfF/rN5zRw5CZ673rNdLIOGycxXJ8pyh8kg+7Woyywr5LIoKn0bWiyawAkmp8EKSuvkWqCIoN
	hFo9XEnetfo7wo/W/yXB+mDLd7qOPignD5w4kqIyBWR3SE4+NXcIjXvMoUJp5ZNrAjCridIO3sJ/b
	lOlTU1nZRC54EdFw6aA0179EC1/ePayo+5qyFVQn442Ks7T8QyHJpK8dKUmtPldsSaRrVTEamqv/r
	bkseUhMg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzUN-00000001cre-1Qh7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 17:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5Fqr22ggTJV1jyun682iQwk8f5dcYH5XeO5RUl0DkB0=; b=XcbfuMrSpf3fzfDxgFHTkcDrJp
	RiLsrktBggcFKNaHGASbmS/OACEAWj5VnRj9OSriRBmY+F9qddn+mzjblr+pMOVYFwR0PQyMI82lY
	3BLxEb4KFJMZM2/68+kXli82gzhDinxtk3Vn8XbWm2+zTHE/YRlRTOai+oxgPmchCd1U=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vC0Lx-00BuZP-RF; Thu, 23 Oct 2025 20:48:01 +0200
Date: Thu, 23 Oct 2025 20:48:01 +0200
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
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 3/8] net: stmmac: consolidate version reading
 and validation
Message-ID: <88dfd6f5-37e8-4bd5-81f6-615b1e1cd518@lunn.ch>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <E1vBrlG-0000000BMPy-29xx@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vBrlG-0000000BMPy-29xx@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_185239_471042_94B36FE3 
X-CRM114-Status: UNSURE (   9.20  )
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

On Thu, Oct 23, 2025 at 10:37:34AM +0100, Russell King (Oracle) wrote:
> There is no need to read the version register twice, once in
> stmmac_get_id() and then again in stmmac_get_dev_id(). Consolidate
> this into stmmac_get_version() and pass each of these this value.
> 
> As both functions unnecessarily issue the same warning for a zero
> register value, also move this into stmmac_get_version().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

