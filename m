Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C36CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs3HsOd6/CNv2Ke0PIq7Aeb0o1+Qgmz7fNk4tlxLXj0=; b=1OGtZ9fthISbBbTahTvwlL7iAc
	eLouQ+d86SVgeXtsawPjvOnQdwjXbFAqg1Pj85+JDbz6K/PMAoq0XFmCtvupUWzWT+2QLltwzgKWO
	WpvkEQZSZpWWry1L/RmQJUJ54xEeKNIOpp6eQKS7Elti2JAFeXb42JfyNbp+ZpjKxX95cuyCHTeNu
	9FEzvyR4AHeAWxDR1SIsIXgaDNmoYynfbbxcMuSc/tc0hk8MMVmBuPQsMtU820UUTwXwE+PFZ1jUR
	ZDp/Uz0t8XgvFIuDmkoljVUc4QbyJHJsqjK5JWwzp9ANqBe80tF3NKbQqwm+GckiDIHpP2QG5DBcR
	5njtI8Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTia-0000000FHly-31XS;
	Mon, 28 Jul 2025 19:41:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRH0-0000000F3qH-3YRb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 17:04:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Bs3HsOd6/CNv2Ke0PIq7Aeb0o1+Qgmz7fNk4tlxLXj0=; b=yVXRcdIT9NKoi509NOF+Um9T23
	oO73RHWZBJqO1E+5ggj1MPZY0/5np7Co55daFQjUvoZsuJjZqWUjxTfOxldv5sfC+lugL/DsDmjf2
	dy6i6OKN5WbwIUJr6ecawM+pUtHHfZOr9hjyfqBzvw2+iIPH4UXbNStwgia2DDjPEZos=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ugRGw-0037Fp-96; Mon, 28 Jul 2025 19:04:22 +0200
Date: Mon, 28 Jul 2025 19:04:22 +0200
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
Subject: Re: [PATCH RFC net-next 2/7] net: stmmac: remove write-only mac->pmt
Message-ID: <c3e313ed-8495-4d77-aac4-cdc05de25229@lunn.ch>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ2j-006KD3-B2@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1ugQ2j-006KD3-B2@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_100426_882508_5B2A1210 
X-CRM114-Status: UNSURE (   6.62  )
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

On Mon, Jul 28, 2025 at 04:45:37PM +0100, Russell King (Oracle) wrote:
> mac_device_info->pmt is only ever written, nothing reads it. Remove
> this struct member.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

