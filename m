Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB8FEFCE4E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 22:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ndwHByA9+rPpcw7aenooep5yaqS0L412XpVw3mJ5S2Y=; b=03XfIBcw9qj8zILqGJVpHnUaFi
	3b9z49Ka9eywZLwN7LnCERZczh2OoL2ZbffqMX4fYZdc+PF78WjSYhfm4TAbkfe+HhFFJPua5+zBF
	4MRUDm6VQFZ8mkoU1VzI0h4VDVFyHVGhoS4XPd9FcWjIk0R7ZpdG4nYfOUYs4CZGFFAf8gvW/cwQ7
	BX9200GH/wy/hBPfDvtQNJzM9BX3EMuR33V1G3yIjdHxBgSH8Z3hspoNt8Zje4a+JHL5En3KEWxXp
	++IvFnyB4y4G0TQgl3gmgT6rVx4zgVhwMqnx0K4AIDSsmEblWPzwyVHQalXNJS0kCR5gjrhEyPTop
	xyZJBuAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuiZ-00000000aRj-2VFd;
	Wed, 04 Mar 2026 22:29:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxuiX-00000000aQC-0Qtu;
	Wed, 04 Mar 2026 22:29:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ndwHByA9+rPpcw7aenooep5yaqS0L412XpVw3mJ5S2Y=; b=n2HElQtP92EIhUCnCa6CVlf3pY
	qxyCOpqdiH2QBUshhls/62Vq1l7ycd4FOoPGXh2Vb/+9jUbdsHKLKOCqrX5QRHHAXc1928LyimG1A
	3o2UK3eYpUmBdotImYqAhQ5xtRaVAPnyrQ1X8+1isNr0xbZO1dN05ATmXsjomU9lYL2Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vxuiH-00ABPT-Mx; Wed, 04 Mar 2026 23:29:05 +0100
Date: Wed, 4 Mar 2026 23:29:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
	heiko@sntech.de, romain.perier@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: arc: fix use-after-free in probe error
 path
Message-ID: <b6ac1471-e33a-41d3-9e67-e6463612f05b@lunn.ch>
References: <20260304025303.145493-1-fanwu01@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304025303.145493-1-fanwu01@zju.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_142921_140887_B439306B 
X-CRM114-Status: UNSURE (   9.40  )
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

On Wed, Mar 04, 2026 at 02:53:03AM +0000, Fan Wu wrote:
> The arc_emac_probe() function calls devm_request_irq() with the
> net_device as the dev_id. However, in the error path of
> emac_rockchip_probe(), free_netdev(ndev) is called before the devm
> cleanup happens. This creates a race window where an interrupt can
> fire and the ISR (arc_emac_intr) will access the already freed
> net_device structure.

It looks like interrupts are only enabled in arc_emac_open(). Have you
seen interrupts before this?

     Andrew

