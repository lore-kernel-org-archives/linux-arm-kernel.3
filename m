Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514C8112586B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gRxnZD8U/5ckRzWr71ozFSAJCluHjpENwN4p7JUM2o=; b=X1Dz/YmOt2ktREzVbcUspDpHa6
	2OPAAhcVVbzr9YmDLdxPDOTeYerHSuaycuNcSyEwXNUQShOFL8km28kfenVRDsk5ltCrmWXsN1Jdu
	heONJuieJHKoKwhfknEqzcbwqoy0p+EiRlWQ+yZP+7qe3nyyXPSfvl65kcNlr7dLLc3iObCF3BbnS
	p4kQpexVbe9/JbZYow7SJn2SWRpRb7ZJruyawjAkxwX6ij+xzgH4/Bo3S7Rms9iRM7bOo5Vv6YY/t
	sDdjbzy8L345rJlnV4h4W5djyFGaIqm0w4ufilQ6qxJpEHLClhdlwnU9Mncgrt0OsHE7aESFDF0BG
	fK/Ehpow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OsT-0000000CHF6-1vn6;
	Wed, 11 Mar 2026 19:05:53 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0OsQ-0000000CHEU-3mvM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5gRxnZD8U/5ckRzWr71ozFSAJCluHjpENwN4p7JUM2o=; b=S7ZDfcErva4VvLRf6BJtS+bE71
	V+CUHd/1dULG8mhX3qBVhVH9/n2BIn9oqGtazTrBGbOdDrjowC3KwjL1gm/WyIOjGdzkKL8sNomh6
	ouYz7m3ufNA6xwPa+cS/bdLmsUIXWML/zxqj15KxOWtZqFgYHXb21tYCUVKkayZ9A8Gw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w0OsF-00BDzA-CF; Wed, 11 Mar 2026 20:05:39 +0100
Date: Wed, 11 Mar 2026 20:05:39 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: Handle PHY reset during initial PHY
 ID read
Message-ID: <5f8e32e1-c73c-4a3f-a1ff-21b78f764bfd@lunn.ch>
References: <20260302144458.3180702-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302144458.3180702-1-wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_120550_940244_B5C8C209 
X-CRM114-Status: GOOD (  11.91  )
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

> This work was the result of Russell mentioning [1] that placing the
> reset GPIO under the PHY node in the device tree might result in it
> not working.
> 
> I also talked about this at Plumbers in Tokyo last year during the
> Device Tree MC. There a few people mentioned that MDIO reset handling
> has been a pain point.

It is definitely a pain point. I wish we never added support for
resets, just left it to the bootloader to get the hardware into a
usable state before starting linux.

Anyway, i don't really see this being a MDIO/PHY problem. It is a
generic device driver model problem. We need the core to have generic
code used for any enumerable bus, PCIe, USB, SDIO, MDIO etc to ensure
the clocks, resets, regulators, etc are in the correct state that the
probe can work.

Once the core has this facility, we can modify MDIO to make use of it,
if needed.

    Andrew

---
pw-bot: cr

