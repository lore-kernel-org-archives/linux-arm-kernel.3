Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75214C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 16:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEkCAs/Rhm3S6/6tTKrC5dGrEE0/b2vF5aFA3/U0TKE=; b=Wg7RknNy9Fw3/7fT+qIPQoixlv
	0NrFxJK/adFqq3rgbsbSzzSAT5wqjS5Dx7EvwmbZgQh89MTXWP+B7d53ZixYz5nKkOkA3Ed7srN0G
	KMxsDPMxUB3lDKTK1KB3hJPwW/ebjQcQGMngFeNrW2Fj6fJQ+S2/QjqLk9J0qbnU15hD5tGj8EfYe
	U9zA6rMnRMGURLzvSNz4dnYkdzrTVoBVO523r1UmnlquG3xHKzkTGbjFNeXV580mN/ZKSf5Sjmn9u
	E9He44P9SagdQkpTpQzu046KoYbqVOtA53X5AWRW9v4ay2WjO5NNN+aXVGQMaSK8QuTg5bHQNik6t
	tlkfE48g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhpd-00000002AE3-3zxQ;
	Sun, 16 Feb 2025 16:49:25 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhoC-00000002A1L-0iaX;
	Sun, 16 Feb 2025 16:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LEkCAs/Rhm3S6/6tTKrC5dGrEE0/b2vF5aFA3/U0TKE=; b=mId+bfbv+NmHRgGafrz4SFmU6R
	9vxduBhLKI6G+vbPIGyZiya7x+5TdENPiQNHhesNFES2+sx0cvAwMV1iTHmBjXRgQyPh/WTVImjV4
	w26MDDWvmNdbQnfDk3du5xh6pJcdXp65XrIfXuhnHlGOQY3nQJNen7aKPfhy+rEuijmc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tjhny-00Ehjc-QC; Sun, 16 Feb 2025 17:47:42 +0100
Date: Sun, 16 Feb 2025 17:47:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v2 2/5] net: phy: mediatek: Add token ring
 access helper functions in mtk-phy-lib
Message-ID: <8070a622-c6b8-4cf7-9845-ffa8b0478fb4@lunn.ch>
References: <20250213080553.921434-1-SkyLake.Huang@mediatek.com>
 <20250213080553.921434-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213080553.921434-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_084756_213027_70E8C58E 
X-CRM114-Status: GOOD (  12.10  )
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

On Thu, Feb 13, 2025 at 04:05:50PM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> This patch adds TR(token ring) manipulations and adds correct
> macro names for those magic numbers. TR is a way to access
> proprietary registers on page 52b5. Use these helper functions
> so we can see which fields we're going to modify/set/clear.
> 
> TR functions with __* prefix mean that the operations inside
> aren't wrapped by page select/restore functions.
> 
> This patch doesn't really change registers' settings but just
> enhances readability and maintainability.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>

This is better, a bit smaller, but still pretty big. If you have made
a typo, and broken it, it is going to take a while to find it, no help
from git bisect.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

