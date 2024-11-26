Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE10D65559
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wu5gCjDHeReSLpzPU55/g/xBhapW17wwlqNE/BgrMPo=; b=OlakgswKSKY8I/4qdqrAMW7Hw6
	/st6Ulbs7EjWNHM0f2X1m/GVq5ZUue93QniaQfya7otz/wboPshWm2AM/5c02Kp7h9MMOni5VpmAf
	xq4byN04N+Ncv4BE6tOQu8n5b05jaW6VaPwN+T5RHVRKAP05X7766K4h/XVRqbU7H24wT7eHS0P89
	lCUUrSNmdHAKn5qzlHjSTjccHXcE/f+XL2X1XBa6fXFgm2Pwsmqe+7ckTRn8DQoWDA6WhD4qEPeIw
	gWpAQAScziffAt0d2U0BhvCKDgb0MMxit1PoZSj9Us8Cno0PJqdYuJ0FjWmgRkY9iDImOhqjgkC33
	JnzWu3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2no-0000000Bj8C-479e;
	Tue, 26 Nov 2024 21:08:56 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG2mX-0000000Bivi-3ICy;
	Tue, 26 Nov 2024 21:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Wu5gCjDHeReSLpzPU55/g/xBhapW17wwlqNE/BgrMPo=; b=qOpMhdYhodddGlZuayKI/fe3K1
	BixRUYpRYm0lQ4dtBlUN998aCX8aWz3b35jpZVgmjgqjnznN75qKNEbKCjP4lZUJJ/iDOdCfbcsw6
	Jz323atCcO4gcOab4LN8Cm6Su1oZ52UYMpxIfoA+IBnJRgt13fXM6i9Xgw0oMd6A/7ng=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tG2mL-00EZEP-Rq; Tue, 26 Nov 2024 22:07:25 +0100
Date: Tue, 26 Nov 2024 22:07:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next 11/16] net: mvpp2: implement
 pcs_inband_caps() method
Message-ID: <ec787906-a330-47cb-a0ca-b4b2ab581960@lunn.ch>
References: <Z0WTpE8wkpjMiv_J@shell.armlinux.org.uk>
 <E1tFrol-005xQe-Ou@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tFrol-005xQe-Ou@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_130737_822726_621D3650 
X-CRM114-Status: UNSURE (   7.03  )
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

On Tue, Nov 26, 2024 at 09:25:11AM +0000, Russell King (Oracle) wrote:
> Report the PCS in-band capabilities to phylink for Marvell PP2
> interfaces.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

