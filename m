Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4125BC02188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 17:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cwa9u2fPg49cZpocEba1WtOgv+XdMwm9Yjg+x4Tw2Kw=; b=gPrhkWZueS9Mfcf9hEKKxggT32
	jh/kP3nZ47fbHRp0Fe++Ou5eaR1fvkHcFn/3/ifAoiqC+lLFMLUtK5HLOQcqMyiXBnAZGFmBEQZG6
	+cnAvAQsnjZnjp1VpRneRdtPxH7qXEaCTsR+jOvZn7JDqy6VQHAC5NZADtVJ6RUuBXMtBWnWSZbfS
	+0+KhoLmdSl3uNdDdXh9gAEt/bpDCiYIBtoHYWNJAMwgDnuaobOModIxZYGjhFz3R35b9WB4TFayg
	AjT4DuD0UH+4l7zO0uNwJUi0m+oxztHYauZ8f5TJzsYsNHX/H//N3uOUujpo0FaOnvSVeps85xdPZ
	2xECqiRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYsA-00000004AVK-39NC;
	Sun, 19 Jan 2025 17:14:06 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZYqu-00000004APw-2jIX;
	Sun, 19 Jan 2025 17:12:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Cwa9u2fPg49cZpocEba1WtOgv+XdMwm9Yjg+x4Tw2Kw=; b=qcoQ99WHAN7cfwSzN6lDUgQrGL
	DcMMdKlPmI8yJe/ME+IE+OpMS4LIg6/MBZpp7TZXARng3wzB+n9UFeb7tOtPkMBwZpGAcqgW11+9a
	OPyWC45IwFc4Z4Ea4M+cBA7b2d8l09Jhynzp+CGM2wHu7Gk627RtcTMPKDxyKF+ZvpPQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tZYqb-0066bO-BZ; Sun, 19 Jan 2025 18:12:29 +0100
Date: Sun, 19 Jan 2025 18:12:29 +0100
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
Subject: Re: [PATCH net-next 1/3] net: phy: mediatek: Add token ring access
 helper functions in mtk-phy-lib
Message-ID: <5546788b-606e-489b-bb1a-2a965e8b2874@lunn.ch>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-2-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116012159.3816135-2-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_091248_695853_A29DC8BC 
X-CRM114-Status: UNSURE (   6.95  )
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

> +/* ch_addr = 0x1, node_addr = 0xf, data_addr = 0x1 */
> +/* MrvlTrFix100Kp */
> +#define MRVL_TR_FIX_100KP_MASK			GENMASK(22, 20)
> +/* MrvlTrFix100Kf */
> +#define MRVL_TR_FIX_100KF_MASK			GENMASK(19, 17)
> +/* MrvlTrFix1000Kp */
> +#define MRVL_TR_FIX_1000KP_MASK			GENMASK(16, 14)
> +/* MrvlTrFix1000Kf */
> +#define MRVL_TR_FIX_1000KF_MASK			GENMASK(13, 11)

What does the Mrvl prefix stand for?

This patch is pretty much impossible to review because it makes so
many changes. Please split it up into lots of small simple changes.

    Andrew

---
pw-bot: cr

