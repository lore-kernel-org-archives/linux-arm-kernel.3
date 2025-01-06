Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36AF1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3gGizS9H5zqdUkyePmPkcQ12Bv+tJZg7mz1VA9og1w=; b=CDsO78NB52K/xa2SwcGBGVePu3
	EoTKqLa0yo3UGWJyla1FHnGTEg+awTbxK/boSozIFTE9lP5PMdzINYnLjzukSFM+ho3ARSFI0guVu
	9q4Vs234mRf8tytVMyv6YFakRCQATu0lq8IBE4nc4ChHivlCWLIKdRfVwqq8LL71yabcOSKoR06yh
	fUpeeA2U5RlEGxmImJmIIvXcAD015oU8N0b0ig6cNd58OQOayhdB3iXD5SteAzLXifv+YJi+87EB9
	4vnqcmvhsyhRlrg6gzkVl9uhrNiaZ+yIAbvUuqwrU4o6APPeJAVykzN8w6psPZCegsP4GJgdL2wgD
	DnrFfwlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqM6-000000021sV-3s2n;
	Mon, 06 Jan 2025 16:53:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUqJj-0000000216s-1eGe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:51:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=C3gGizS9H5zqdUkyePmPkcQ12Bv+tJZg7mz1VA9og1w=; b=3sX2H3cAHYxI8M2VZfYJ6qcNoR
	jORffTRS3OuwSczDaTDdF02Gat+1YOyCks6Y3/yc7nR3SMqVh8i0k+nXkUjf4i0N9xPc168+RkCeH
	rNZJJ9IXU7aM3kJyqIhNRTfpFbcbqpiqF90hnU+RyaQyQFQ5sgfkiH4azr8qT0zx5dW0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tUqJc-001w1k-JB; Mon, 06 Jan 2025 17:50:56 +0100
Date: Mon, 6 Jan 2025 17:50:56 +0100
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
Subject: Re: [PATCH net-next v2 07/17] net: stmmac: remove
 priv->tx_lpi_enabled
Message-ID: <e0cda443-e7ce-4d01-869c-8791a77a1ec1@lunn.ch>
References: <Z3vLbRQ9Ctl-Rpdg@shell.armlinux.org.uk>
 <E1tUmAZ-007VXJ-DT@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tUmAZ-007VXJ-DT@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_085103_426151_0DD73648 
X-CRM114-Status: UNSURE (   6.63  )
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

On Mon, Jan 06, 2025 at 12:25:19PM +0000, Russell King (Oracle) wrote:
> Through using phylib's EEE state, priv->tx_lpi_enabled has become a
> write-only variable. Remove it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

