Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86A6C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tP9hm5Wbxf+EjEs2XHZzI1XGFE1GsHQMkf6PW0oJwZ0=; b=tbpPh6vE3ygb21vV1Eh3NR9avn
	ePWzXwTXyof3SfcsFtjmB37MzXKKat6QuYFIssnH0oxkPIapp4p6MdSrAgXMsm8a1KSZZEXo4tEqb
	qj+LTT4o7LdeGoCFJkwksgpzXb24+Y6SH29+5K6AynPO4axKc2h++L/bfrQ70LudqG7QrfG6xSSST
	6586sJzG490o4dxv1QR5jjRpkI8VugApxSaxXhexaKUlAhirYHTVMKTswxk+T3D2Rcen+CF35p4mX
	QwW0Q9Cq7F8HB77YCmBXPFKEQYk6GuUknZLouypt1Vp69RqaXecxDj1D0Kqu/ot6zGyG4gVDy2u5+
	+6o+4jIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9uD-000000020xp-0VZ2;
	Thu, 20 Feb 2025 17:00:09 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl9si-000000020Zc-0fub
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 16:58:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7A65A615A4;
	Thu, 20 Feb 2025 16:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C901C4CED1;
	Thu, 20 Feb 2025 16:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740070714;
	bh=h5khnN9rm493Ud45EVpbRXLTxQI1CXCGiYSILzqJP+Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MxVln6Aznb5RQsZQWGqyUZKsy62IVbPzUmyFF5Xv0d2oL8d5lsa9g9ESOwJP4tRE4
	 1YCAM3Z5//VBMBMJevQJbFbtXyQIWcYHBYhDpbupMky7kCtCH1dHZWm+QGNmfamf0D
	 qiuNQZ0YNSBIn5j72WEFslJa9qqgYVg1wtsQ68yTIkxlw26oSIijgbOBfSrDJ1Y/i4
	 Nm93nt4OUpvoAtiaivQwKyxvssaGNqubqcYB3RIMG9YLFiSVivTIFfpZ3sElsb1JdP
	 PGPDmFFFJ9yQblFU7oIgQAdFUgoIT+TGnd1G02N8IcfahwQTNU2uyq1n523rNBPM6m
	 LsvWlBGvPSE0Q==
Date: Thu, 20 Feb 2025 08:58:33 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nick Hu <nick.hu@sifive.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Michal
 Simek <michal.simek@amd.com>, Russell King <linux@armlinux.org.uk>,
 Francesco Dolcini <francesco.dolcini@toradex.com>, Praneeth Bajjuri
 <praneeth@ti.com>, Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: axienet: Set mac_managed_pm
Message-ID: <20250220085833.476b3f62@kernel.org>
In-Reply-To: <20250217055843.19799-1-nick.hu@sifive.com>
References: <20250217055843.19799-1-nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_085836_256781_D5A562AF 
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

On Mon, 17 Feb 2025 13:58:42 +0800 Nick Hu wrote:
> The external PHY will undergo a soft reset twice during the resume process
> when it wake up from suspend. The first reset occurs when the axienet
> driver calls phylink_of_phy_connect(), and the second occurs when
> mdio_bus_phy_resume() invokes phy_init_hw(). The second soft reset of the
> external PHY does not reinitialize the internal PHY, which causes issues
> with the internal PHY, resulting in the PHY link being down. To prevent
> this, setting the mac_managed_pm flag skips the mdio_bus_phy_resume()
> function.
> 
> Fixes: a129b41fe0a8 ("Revert "net: phy: dp83867: perform soft reset and retain established link"")
> Signed-off-by: Nick Hu <nick.hu@sifive.com>

Applied, thanks!

