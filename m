Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5377C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 17:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwXhaxA7ixaqtqzPddoX1oS8D1J/btE2jtBkZI27lYE=; b=OXOUmdRjqKJmNaeDFci5cDwdf8
	4n/AyDaxsuo3dMifVVb9WxAgB2Zanm/8yy6G3d6CrRDwLU1Qr+4Mfyk8Kl/y0OByMiVqAiXU8TbQ6
	2RzIVOclmNpB1i16epH8ZdypjfaUs8FmRMPhAXqT1Bwopm/KJZALLfThgB4/EKvBHvpHf7ENsWHJ9
	b5c1tf9pUcLY0PswAExkGzSjna1YDlfFoCMpFcM9rufXhJihVFXgXB5FPxqyNTKtPiYuLI4Kfkqz4
	vAQmQgjonA93sZgeEcjHP7BjDvvnS2cf33YfyB1q1V1o8wbHnQvlPfumLm3BDqGsoVAOQu9G7+I+z
	nJtcFPeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4NfF-00000002wic-0luO;
	Mon, 14 Apr 2025 17:32:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4NdL-00000002wL2-1G7O
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 17:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GwXhaxA7ixaqtqzPddoX1oS8D1J/btE2jtBkZI27lYE=; b=snsGLG06OR6QoVP8gONg2dBtEJ
	f86M8hOBLcq4ZGic4n+aQDFW+YLzjtYKznL4c3ZilygILPHMKZ/PM55zsxE0P1rxbk/9eiJOraWIj
	jbZs6BOLx3dPo8VzPN++5e27FkP8Twy+uoODw2THnngk+zwFLsvRQq8VsZuB/+JL863Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u4NdC-009EyA-5v; Mon, 14 Apr 2025 19:30:02 +0200
Date: Mon, 14 Apr 2025 19:30:02 +0200
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
Subject: Re: [PATCH net-next 2/2] net: stmmac: ingenic: convert to
 devm_stmmac_pltfr_probe()
Message-ID: <9d7b5f8b-d372-4fcc-90a5-c648db966fde@lunn.ch>
References: <Z_0u9pA0Ziop-BuU@shell.armlinux.org.uk>
 <E1u4M5S-000YGJ-9K@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1u4M5S-000YGJ-9K@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_103011_343777_713C02DF 
X-CRM114-Status: UNSURE (   9.47  )
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

On Mon, Apr 14, 2025 at 04:51:06PM +0100, Russell King (Oracle) wrote:
> As Ingenic now uses the stmmac platform PM ops, convert it to use
> devm_stmmac_pltfr_probe() which will call the plat_dat->init() method
> before stmmac_drv_probe() and appropriately cleaning up via the
> ->exit() method, thus simplifying the code. Using the devm_*()
> variant also allows removal of the explicit call to
> stmmac_pltfr_remove().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

