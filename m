Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08D4C02188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jan 2025 17:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcyrOMr6zvuz/PUU6lJSLE9ffbpG6Aa6FrDGrG0kTrg=; b=1iW9J6rJ1opTKOqAarLSfzpEYl
	aaJBCnTdW1Rti9EH/+o5JOTIQGXKdr/EwQHVOHvTh+/LWgxaYO7foo+sFORheTK4i8an+RmUtVWsz
	+If1DLYZMSBO1djLghghtGN9TjR1Vio3uzb3+M7ZNIJq8xeWeGpAWAO7UGBQKXgyob8oIxf/b5n46
	bUGSQb7J57e+xbGGrv98uezPA2mmSmGXx8QHULu29s8VFudFdMyFi5n+4FmO6G7nFNyQyK1D66Qi/
	hm5Zj4jqsY7Q85Zd3/p/2ZrNRre3EVTypxOeeOq7Rtt/mkY4Md5Kabjfz6BpC8hfyJcMn7crB+WsS
	Wn5UgASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZZER-00000004COx-0WZI;
	Sun, 19 Jan 2025 17:37:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZZDA-00000004CIr-0EHE;
	Sun, 19 Jan 2025 17:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=zcyrOMr6zvuz/PUU6lJSLE9ffbpG6Aa6FrDGrG0kTrg=; b=c36Dp0WN/a+gMwnf0aWi3xcE4w
	ic4ZR8EMddMMANdQv7A4gbrEyTpzfF/m2MC6Jv2B4H4b45iIzIUhHPnqx5EzgtVlwLgxsUF64FE0h
	+zLyznJUiM5fP72AXql0RVleiDIRZq512/CF/hMUeoqkhVxWwwEBD82nTTPAXpFm7xqE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tZZCw-0066wg-T0; Sun, 19 Jan 2025 18:35:34 +0100
Date: Sun, 19 Jan 2025 18:35:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Sky Huang <SkyLake.Huang@mediatek.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 3/3] net: phy: mediatek: add driver for built-in
 2.5G ethernet PHY on MT7988
Message-ID: <c339e887-b576-4f0e-988c-4cd8f27d47a7@lunn.ch>
References: <20250116012159.3816135-1-SkyLake.Huang@mediatek.com>
 <20250116012159.3816135-4-SkyLake.Huang@mediatek.com>
 <Z4hnv2lzy8Ntd_Hp@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4hnv2lzy8Ntd_Hp@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_093548_113959_3BBAA53B 
X-CRM114-Status: UNSURE (   9.56  )
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

> Imho it's fine to add the driver without support for the LEDs for now
> and add LED support later on. But in that case you also shouldn't call
> mtk_phy_leds_state_init().

It is also O.K. to hard code the default LED meanings, different to
the reset defaults. But you need to think ahead to when you do add
full LED support, you want the defaults to be something which the LED
subsystem can represent and take over when it controls the LEDs.

	Andrew

