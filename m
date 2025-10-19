Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2ECCCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 00:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rz0DjI9FG3R+Vf1dNEL5GbVU6jXA/C1j8hwA+dUf/6I=; b=vVsBAJCdpQ/uBDWd4W3sAeUjOm
	kasotQea1RLqhbP3EjEzsylrNS+Wje297Ux/0fNSH7XdboziDifdAKK69tvqYucWgDXEshsTGlWPo
	8t+SBhB86v5CB/jv2Pj+CFadCK1I1FBGUugZ35Zc31PHn8zHGzxpyzUN7/6UVhd7gOFWpwtxhziG4
	2Vr4IXhs3FBoxS73D5oBk6RZcwoq2pEORSjgMkJwRfJpoTQt3o13uLkuEWh2LI4hLaOOLv8BtTM1J
	AM9n/1nHipbgnY0ifxbUySN5k51zanQ7wCMzW7WEViZTBOi1+taqY3oaUcU8yyToLrz1zRBvljFhY
	8R6QI/7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAGux-0000000AYgH-1dFP;
	Sun, 19 Oct 2025 00:04:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAGuu-0000000AYfm-1AIW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 00:04:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rz0DjI9FG3R+Vf1dNEL5GbVU6jXA/C1j8hwA+dUf/6I=; b=AcN5Xqb1JNtWQtEk5ZUe7Vs44j
	z6+QascX8RZXSMzyNmZzlFs0g6XLvpMzTZ0U8eTgVmWGTWkCOapk0xir30PnWmjZ3UOLRQTKoWVuS
	ukLu99pJOm6qI3+yfv+f7nNyf4DISn160d2zMZr8VTYh9aVfCTZXUGhortzxREz4zatY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vAGu2-00BP9M-KF; Sun, 19 Oct 2025 02:04:02 +0200
Date: Sun, 19 Oct 2025 02:04:02 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <370d13b7-bba8-449d-9050-e0719d20b57c@lunn.ch>
References: <20251017011802.523140-1-inochiama@gmail.com>
 <34fcc4cd-cd3d-418a-8d06-7426d2514dee@lunn.ch>
 <i5prc7y4fxt3krghgvs7buyfkwwulxnsc2oagbwdjx4tbqjqls@fx4nkkyz6tdt>
 <c16e53f9-f506-41e8-b3c6-cc3bdb1843e1@lunn.ch>
 <aPP9cjzwihca-h6C@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPP9cjzwihca-h6C@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_170456_315931_CCDEDDAA 
X-CRM114-Status: GOOD (  10.75  )
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

> "rgmii-id" doesn't mean "there is a delay _somewhere_ in the system".
> It's supposed to mean that the PHY should add delays on both tx and
> rx paths.

When passed to the PHY it means that.

However, DT describes the hardware, the PCB. "rgmii-id" means the PCB
does not provide the delays. So the MAC/PHY combination needs to add
the delays. We normally have the PHY provide the delays, so the
phy-mode is normally passed straight to the PHY. However, if the MAC
is adding a delay, which it is in this case, in one direction and
cannot be turned off, the value passed to the PHY needs to reflect
this, to avoid double delays.

And because the MAC delay cannot be turned off, it means there are PCB
designs which don't work, double delays. So it would be nice not to
list them in the binding.

	Andrew

