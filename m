Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1E0D6B6DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 21:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eaav/kHiULYtRFO7qGHqUzM2GyuXCQUp8En/mARPwCQ=; b=X7vFnJ6+jmmXhLq2nMJ4eLnZSW
	l8mUGnIjnsnDQcRBU91QVoMDUhdPQ8yts3LMnWRPu86WAv80sLpc3E8NVJ3ARjCgOBieQfKpAYk+w
	6Zv23CtUE8mz6xUUnI1QRUW8k1rDVQj5HwKWPX2qJS89mOLC46O89y+Fd0UpWnjK9OJmqF0MB3FzO
	lLwlgMlN/F60hR7H/UQC3xzSv5XQ/bHNCTDPP3UccdWiVAP6TMTrARgZjnMU86KNBWYFhFZhz1LHr
	Fo7dcIh8i3QVYZpZfeyjGX46tmtueE84USI55ww+oIuaAwQ2BkodttvMI9UMjxRvXG5NpRxd+hDRV
	w3IN/KDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GYV-00000001vSb-2DTX;
	Wed, 30 Oct 2024 21:48:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GWq-00000001v5j-2b2g;
	Wed, 30 Oct 2024 21:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Eaav/kHiULYtRFO7qGHqUzM2GyuXCQUp8En/mARPwCQ=; b=EKYDfn3Vh58p9C5n1lAe40Lvqf
	ucFYM5n2r+44VJfBuIUPFlcpOTPfwsyXCjnQX9eaegFSdB4v4LkAe5m1ur3BuhS9bT5jjp3qf0Ffk
	kpaQjznr4/fcD0MP0DPukyvCULZA2pTqtP9rT+KPXq9goFjH8pZaBjua6XOujBirCyjE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6GWd-00BjVC-67; Wed, 30 Oct 2024 22:46:47 +0100
Date: Wed, 30 Oct 2024 22:46:47 +0100
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
Subject: Re: [PATCH net-next 2/5] net: phy: mediatek: Move LED helper
 functions into mtk phy lib
Message-ID: <7cb014a6-ec64-4482-b85c-44f29760d186@lunn.ch>
References: <20241030103554.29218-1-SkyLake.Huang@mediatek.com>
 <20241030103554.29218-3-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030103554.29218-3-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_144700_676892_63889064 
X-CRM114-Status: GOOD (  11.08  )
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

> +void mtk_phy_leds_state_init(struct phy_device *phydev)
> +{
> +	int i;
> +
> +	for (i = 0; i < 2; ++i)
> +		phydev->drv->led_hw_control_get(phydev, i, NULL);
> +}

This does appear to be the same as what it is replacing, but it also
seems odd.

Why is an init function doing a get? I assume it is to do with setting
priv->led_state? But led_state is not used in setting *rules, which is
what led_hw_control_get() is all about. So maybe in a follow up patch,
move the actual init code out of led_hw_control_get()?

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

