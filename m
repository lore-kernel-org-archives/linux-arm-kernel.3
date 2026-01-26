Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D6AD13C20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKl2m6va+k/i4PnbhNmJevuXFQu5TbTyIVHNC2U/pqs=; b=GHzLAahykucqiYrIFyRiHd6yl1
	GxUZ2f52dtK73dTvz/iGkjVWyDCKlrd+CpiO8ENiuiiM5m41Nl42qRBZe+aDKHcM5mHutwJX/48pV
	ONjQ43hnAkLWbNRJ6lBCYwoqWRzYLtGFZ3Soi4r99gx2hgIn2qnvEWGRWyh7PTMkIxaQjjFyXDIau
	2XG7YIvhE4ic2dCnp08427os1+n5zCxVn/UiEvJihI+ThvZFf9h1W+E55TMXOxe9R0aLOQKeG5qzH
	PWToos4GpohLxAOfBl/bC5FJxzKSAP+5AKDYIeT1jyRAPI24Yki3XFwUwYo4uw+inzwaGdB2uxF4Q
	l+LiR/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNfh-0000000ChZu-2aUC;
	Mon, 26 Jan 2026 14:34:29 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkNfe-0000000ChZK-1Sw1;
	Mon, 26 Jan 2026 14:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VKl2m6va+k/i4PnbhNmJevuXFQu5TbTyIVHNC2U/pqs=; b=vqhWKydRpU++6I0VMWU4R8u+ry
	c3/S/6h0xAtwKEUGK2zwOFafNmYy2EG6Y+rGlmhQt9ChS9Co6DJvurXoHAc1wwxGcNS2nQ/IfpHdm
	u7fw1yAj5+AXRQ9HVuRwxjohpXz3AyQ/CMBektS3EYr07D9u4Z25TzrFtJR9QfHihh/baiCZGoSAO
	FrQU8SbO7lL4bctk42PY1j+21N7huUE9CsbzZdFgTqg/M2+qjOLAU5Ek1OBQEunz1pUvxvu3AaChh
	efyVu/+8tnO0WCFIbHGG0DRqX6ypfKk7NsiXuTkKhcnV5FaPwZIruGlJKVkNsHbYbajEWmyXS4Jgp
	DJnaq+Tw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58188)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vkNfY-000000004xP-0oMi;
	Mon, 26 Jan 2026 14:34:20 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vkNfV-0000000050u-3BFU;
	Mon, 26 Jan 2026 14:34:17 +0000
Date: Mon, 26 Jan 2026 14:34:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 06/22] net: stmmac: rk: add SoC specific
 ->init() method
Message-ID: <aXd7aSk7KIxlQd5z@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
 <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_063426_416148_5CC692A0 
X-CRM114-Status: GOOD (  10.13  )
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

On Mon, Jan 26, 2026 at 11:45:28AM +0000, Russell King (Oracle) wrote:
> Add a SoC specific init method.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

I see the AI review has identified that this patch has an issue, whereas
in the previous review, it was fine with this patch. I can't imagine what
it's problem with this patch is, and there's no way to find out for
about 9 hours (more like 19 hours for me because of the timezone) as the
AI reviews are not accessible until then. Makes me wonder whether it's
worth continuing to submit patches to netdev anymore.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

