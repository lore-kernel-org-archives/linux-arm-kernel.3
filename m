Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26428D61013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 13:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyJ741jUIEOp+cohLKvVvyGyWUuo4rd6WkrJSKQdlv4=; b=nHWh2ETM9Mkla8kGZPG9FSg3GJ
	45anIWOdefcV3dRrPIht7qYeOYcWNVn5/2lhddj866gLGLwkMKTSY/xsf5JZ2/cpe7nJRacjFf8hO
	UNXbT7xEkeAD9EKR0mkUDhIyxOcT/R1t+PvDfqf8vCUOu6gCEuxTpyvzmwTpXSOfHdkSG7VlOILdF
	1wca4imJq822wYE1rbtoPuZZnP9PdGfqkVsk2/KVmYFcIUQLyPCqhVSgBPxloWPewHteqgHsfCw0T
	ge8uE7WOi2LP85awl25XE54/LOCbU7c1m67cLR5FQvRyJlneyDhBN8JvRUNaTJ05Uv8KKvGkWX0zD
	hx2QyqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRzw-000000009Vb-18Uc;
	Thu, 29 Jan 2026 13:23:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlRzt-000000009V3-0Yqq;
	Thu, 29 Jan 2026 13:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vyJ741jUIEOp+cohLKvVvyGyWUuo4rd6WkrJSKQdlv4=; b=wNxNHvy6iCbOZmZ9uae3pJyA46
	4EzLt1zQul6a22lm2zyj8wFf+6asivMNv1MpijhV7aea6mKjV3fi6TlvQPljzQ70+f4xPvklqxOTH
	fD0RISdkGCZPM9RswRpPD1TLpPH4GYCbx6sHl/7TvoF/LkNJehdWc44rCfYMxI3qO4w/vwYTM32Am
	mHXvDvS0TsADfGGP2svB+1kJHYe/gwRE6dFwVvWZJyXYaotQSzJuaDA3V3iig2a+D3Mp3K4FPG7m1
	ERV+1jfuo4Pq0t0S11yePwUy4fiWed++Cux30ZvVLS1gcX6nyDS2Z7j4T6AFSAKIc57E9DRuP+YW/
	4Dx61E9A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44528)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vlRzj-0000000006r-0nPg;
	Thu, 29 Jan 2026 13:23:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vlRzh-0000000080q-2fc5;
	Thu, 29 Jan 2026 13:23:33 +0000
Date: Thu, 29 Jan 2026 13:23:33 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Simon Horman <horms@kernel.org>, vkoul@kernel.org,
	neil.armstrong@linaro.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	ciprianmarian.costea@oss.nxp.com, s32@nxp.com,
	p.zabel@pengutronix.de, ghennadi.procopciuc@nxp.com,
	bogdan-gabriel.roman@nxp.com, Ionut.Vicovan@nxp.com,
	alexandru-catalin.ionita@nxp.com, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Frank.li@nxp.com
Subject: Re: [PATCH 2/4] phy: s32g: Add serdes subsystem phy
Message-ID: <aXtfVUb0eLwP4R28@shell.armlinux.org.uk>
References: <20260126092159.815968-1-vincent.guittot@linaro.org>
 <20260126092159.815968-3-vincent.guittot@linaro.org>
 <aXsuRTZUUnw0kdzV@horms.kernel.org>
 <CAKfTPtDfnpzq2CB-isVzvh1ZCWo7kit9KRJvVGoU1C3zZTgdXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtDfnpzq2CB-isVzvh1ZCWo7kit9KRJvVGoU1C3zZTgdXw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_052345_175706_838080D4 
X-CRM114-Status: UNSURE (   9.07  )
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

On Thu, Jan 29, 2026 at 02:01:13PM +0100, Vincent Guittot wrote:
> yes, the usual pattern is :
> - phy_set_mode_ext()
> - then phy_power_on()
> but I can add an additional check

Please read Documentation/driver-api/phy/phy.rst section "Order of API
calls" which suggests phy_set_mode_ext() after phy_power_on().

Having different requirements for different SerDes PHYs quickly becomes
annoying for users of the SerDes PHYs.

E.g. I'm trying to add SerDes PHY support to stmmac, which is used
across different platforms. Having all SerDes PHY drivers behave the
same as far as their PHY API calls are concerned means that the whole
point of having an abstracted interface is maintained. Otherwise, it's
completely pointless.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

