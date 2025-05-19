Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38923C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 20:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/0IcdVQE5Us1JeC/7Mie5tysbAZM3UKBVkJQ6942JA=; b=K/k+yN7zdYRrdI9T4UNnBmcbvd
	nE84oxBAf/pxXX78NLvHN6oDVbUR9RbKoi3T6UPp/gY6E5cl6GhrBZhBEtVODEhbPlYX1FJRwogvE
	3l7QReTqE1YG7oMhfv5BZ+Bv+TtYb0WCErzy8O0B7ZEKNVnbXrmbImQ7v0B1FoyKC4tf0ZBC5USoi
	ACTmxIV7l+4oS+syzaaTudvP0uSl1Y3OdcrjVwJLUgsEc3e9q5E7IisgcDZozrRt8bEz5bdWyAaVf
	ij2qpSLRpzsuu+iERLI7e/vWhGxtVqTBVxMCBeAEq1OmnwShiNwQfbk1qGsc6sE3tDtHlcntyRBvE
	S8Hh0IIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7Ho-0000000AQan-119s;
	Mon, 19 May 2025 20:40:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7Ff-0000000AQMa-1dGn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 20:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=O/0IcdVQE5Us1JeC/7Mie5tysbAZM3UKBVkJQ6942JA=; b=GP0qDkXtjwpwP4f1GOOTvWNQDw
	MEnvFI+0pp6nHGYpcvjNmLUV2j4HbrlArpvjLp3VunvgL2GEYDmFpxnbdIcx9sKh4lyiSKCY0cCTK
	pfmWqr1u4mtpz89N18QVW5tFQ3+tK/RFBduWyxlFtN192Ydmw1L86QUUfE5pbmopBKyQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uH7Fc-00D3Sq-9r; Mon, 19 May 2025 22:38:20 +0200
Date: Mon, 19 May 2025 22:38:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH] net: dwmac-sun8i: Use parsed internal PHY address
 instead of 1
Message-ID: <0ee2c181-1ab2-4d81-89f0-9d2992464a88@lunn.ch>
References: <20250519164936.4172658-1-paulk@sys-base.io>
 <d89565fc-e338-4a58-b547-99f5ae87b559@lunn.ch>
 <aCuLwuSliICh86SP@collins>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCuLwuSliICh86SP@collins>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_133823_427124_676ACF31 
X-CRM114-Status: UNSURE (   9.41  )
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

> There's actually only two users of this (this code path for internal PHYs is
> only used by two chips), which are platform dtsi files that have the address
> already set to 1.
> 
> I have actually tested both with hardware and they work fine.

O.K.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

This is something to think about for patches in general. What
questions are reviewers likely to ask, and can you answer them in the
commit message?

    Andrew

