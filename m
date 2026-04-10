Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA14E99050
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1BxrsFUKX6jqT453u4B/bslW6vUL7jkrbnkrOn6egc=; b=pXmNZFX6UElW6LVRvSV8VUIdMv
	4txqFfBzy9RGJ2a4oKXbmqSpCF+yeuZie7EhCLFbgHMeWY7krbvZaqZyWczholTEJEDR4cFJCpDiQ
	5l/EAwD9QlYZTVwDzAL/FGYlJyWe7DcR3lFDM69tN5npwP+sSAufEwHa/pBQOCC8fYLX1LW6zVhvc
	FzoqBNyWZxrGY77qKamE1aPVXHKofvJvgwBesbfstziwvB7SpqKxH8isziwVbrF8Qd6V5g+o6uFzu
	PjpIb+qnDRFX72DqxEpe4jlYB55IG2dtz1UgM/xBXKsHJeqhoayBk7iOCe88dygUOZiYcuQg4omSl
	943MBj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6dM-0000000BnV3-1cuc;
	Fri, 10 Apr 2026 07:50:32 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6dJ-0000000BnUf-24YE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:50:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B1BxrsFUKX6jqT453u4B/bslW6vUL7jkrbnkrOn6egc=; b=a4OlywblGMI3RLpc/SxnvAjiYp
	hBQ2RFziq7gw7crLvOQT4/8c9Ml8bV/Kajls5SLyyMa9plyXZWrLAvg4Dlcd5085D1sFMVb+m+egg
	utCpC0dSxe+lM1a77OsHX8XgstoACYu+DYpHq4n5MgTMULv7kcS5Y87ZKs7DjZS94Z0DuO3kQPwak
	WBm8Zw3yKG6PVMKwCl3iChgH6AKDnBVNaXA2c/56nJL3Qka2zqCT+kbxbMZM70iAOls+gtCAgGn7W
	c77RGstUTegUNzrhum9gFYjKQtlt8NjmpP97w8w5A1Zdpz0TeoTFRrNgwqUj9/urh+DTKzTEP1PJM
	XnZQvAVw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36062)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wB6d2-000000004bi-0CC0;
	Fri, 10 Apr 2026 08:50:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wB6cv-000000005S9-3wXl;
	Fri, 10 Apr 2026 08:50:05 +0100
Date: Fri, 10 Apr 2026 08:50:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: KhaiWenTan <khai.wen.tan@linux.intel.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, maxime.chevallier@bootlin.com,
	ovidiu.panait.rb@renesas.com, vladimir.oltean@nxp.com,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	yoong.siang.song@intel.com, hong.aun.looi@intel.com,
	khai.wen.tan@intel.com
Subject: Re: [PATCH net 1/1] net: stmmac: Update default_an_inband before
 passing value to phylink_config
Message-ID: <adirrTJujEsrsK4F@shell.armlinux.org.uk>
References: <20260410020735.327590-1-khai.wen.tan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410020735.327590-1-khai.wen.tan@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_005029_555569_9C59F38D 
X-CRM114-Status: GOOD (  10.38  )
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

On Fri, Apr 10, 2026 at 10:07:35AM +0800, KhaiWenTan wrote:
> get_interfaces() will update both the plat->phy_interfaces and
> mdio_bus_data->default_an_inband based on reading a SERDES register.
> 
> Therefore, we moved the priv->plat->get_interfaces() to be executed
> first before assigning mdio_bus_data->default_an_inband to
> config->default_an_inband to ensure default_an_inband is in correct
> value during PHY setup.
> 
> Fixes: ca732e990fc8 ("net: stmmac: add get_interfaces() platform method")
> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>

Patch looks good, but the blamed commit is wrong.

d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")

introduced the problem.

The commit message could also do with mentioning that dwmac-intel
regressed result of that commit.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

