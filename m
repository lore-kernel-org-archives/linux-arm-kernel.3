Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186E6CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 12:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bj32BBEvUFT2bJkkrxWT0RFZIhU2FlKAOhIlf8DSq2w=; b=qfF+csn98PvVT/yOwiKFK7zEsb
	99D79tezt/roQBE4Kwj+X8lHjmu2Sd9axMl5a8b+ftaA3/8cAyO7VLscFoaxjbSwWUcyAsF9X7suG
	R+VV/ARhGokvJE4bWaC5v4oQZznC+Ag9CZDI2xu3PlhigxYbrgPEh+pJQ9ZsPN3OIQJe4PfM+FiOw
	uMrZDdCfY/luCG//JlMTv4qhwsTGObMUuTfwWZz+hkyhsW8ZF9MyWQHTgCdSkcLU/P/RPBJVRP2Yo
	kyhNepvBSs8wc0kd4L8dWC+6pRTvWPjyU8NxfDayufHiVwfU/ElRoNiyj+DHFW7xin39LEo2r6PFs
	8KL2eWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu93Z-0000000BYPB-2WBy;
	Thu, 04 Sep 2025 12:27:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu7XK-0000000B0Xk-49xz;
	Thu, 04 Sep 2025 10:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bj32BBEvUFT2bJkkrxWT0RFZIhU2FlKAOhIlf8DSq2w=; b=Lx3+0R+dpb/wJElSmqaV0NtkZz
	eTTNZctX6+i+m9OQ22cwkZZ3TayAC92JyDE9QjiiVa0ezKrm2f85j0udld84+A1Bq18CpP3KIo6gS
	n/8UI99jE0BpF9yNxgIuJRorHPjvbqwzKJ+M2JLYJi8za4yz/fkXnkLjB6u50owuAIfiFwvMvL14k
	CK6jG6j96MktoCUm0+ZYmravCe76zJlYEpzuaTZ8CWYBuIecQVweB/jcGh8rF4/5FBvNETF/Lryai
	KeYc71O2fJxnJKTCPGxJW/YOCAFjPdizfyeyNm55mDOH+MzP/GwwgV39BK1SSiaED6bgRdIt+qvZX
	M1T2GIHg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56074)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uu7X7-000000001qG-0LDt;
	Thu, 04 Sep 2025 11:49:37 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uu7X3-000000001Rs-38vh;
	Thu, 04 Sep 2025 11:49:33 +0100
Date: Thu, 4 Sep 2025 11:49:33 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonas Karlman <jonas@kwiboo.se>, David Wu <david.wu@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: dwmac-rk: Ensure clk_phy doesn't
 contain invalid address
Message-ID: <aLluvYQ-i-Z9vyp7@shell.armlinux.org.uk>
References: <20250904031222.40953-3-ziyao@disroot.org>
 <20250904103443.GH372207@horms.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904103443.GH372207@horms.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_034951_031859_7F1F054C 
X-CRM114-Status: GOOD (  16.44  )
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

On Thu, Sep 04, 2025 at 11:34:43AM +0100, Simon Horman wrote:
> Thanks, and sorry for my early confusion about applying this patch.
> 
> I agree that the bug you point out is addressed by this patch.
> Although I wonder if it is cleaner not to set bsp_priv->clk_phy
> unless there is no error, rather than setting it then resetting
> it if there is an error.

+1 !

> More importantly, I wonder if there is another bug: does clk_set_rate need
> to be called in the case where there is no error and bsp_priv->integrated_phy
> is false?

I think there's another issue:

static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
{
...
        if (plat->phy_node) {
                bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
...

static void rk_gmac_remove(struct platform_device *pdev)
{
...
        if (priv->plat->phy_node && bsp_priv->integrated_phy)
                clk_put(bsp_priv->clk_phy);

So if bsp_priv->integrated_phy is false, then we get the clock but
don't put it.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

