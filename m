Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3D9C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 16:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZqorBL9NC50sKW8xRpM5vQTORnlBE5flNUJrgysfng=; b=xMcm83CO7xlmdblpRGwPCx4Ozk
	arqrGYEyN9CLXLgpMaCiucOm+NvTG04dwER2DmtvXUOT9HfOReY9tkDPToD307pSs1FuFCB3VoYhx
	ndGGIV80MNkLDeRih5m8XboSTU+aHZ+2Xijlszqel3uUWT1DdQnJVf0ZWtriyOLb5GmUbn69vtIA8
	lNDzGv9i9zCSzWnLb4WCJzQtKAPF/ntd1zPg4yUUK47AlfMYoVjaaLezvqHzCGFxj6FLWLHQ7NdJz
	RIZ91t5AlA4d9Pn06XJxlFaxb4pQAK0C1urEv2W9DcoKbR1ukF3SQTD88BI+LPmvaxdaaNyggFVxr
	98Vreefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhtu-00000002B1X-45SO;
	Sun, 16 Feb 2025 16:53:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjhpi-00000002AG5-3Ura;
	Sun, 16 Feb 2025 16:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=iZqorBL9NC50sKW8xRpM5vQTORnlBE5flNUJrgysfng=; b=E4mMZ4LTDwAdjflnhCdA8uC2f4
	rkJmaJNQ7qWcJgtQ1rog2qM54zWWe8DM577XKEG7XRhuiMvdvBWNTAThh09Nsh125TkiGb61qecot
	Oy7FpDw2FJVSG2H4qx+F3n70XrAbTYNMztDm/0wn/wf5RbC1aTa7sjg4rNq4t6/K28nM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tjhpW-00EhmQ-N6; Sun, 16 Feb 2025 17:49:18 +0100
Date: Sun, 16 Feb 2025 17:49:18 +0100
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
Subject: Re: [PATCH net-next v2 4/5] net: phy: mediatek: Add token ring clear
 bit operation support
Message-ID: <082f3095-d83f-47b6-b902-2d99482855b7@lunn.ch>
References: <20250213080553.921434-1-SkyLake.Huang@mediatek.com>
 <20250213080553.921434-5-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213080553.921434-5-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_084930_874624_AF87A82C 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu, Feb 13, 2025 at 04:05:52PM +0800, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Similar to __mtk_tr_set_bits() support. Previously in mtk-ge-soc.c,
> we clear some register bits via token ring, which were also implemented
> in three __phy_write(). Now we can do the same thing via
> __mtk_tr_clr_bits() helper.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

