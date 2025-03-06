Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E05EC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 15:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqLTGgFW/Idb/RWJchf5+oj54Xp1Xr/3EggXQFnKjbg=; b=yPRiWSm2AkGYCBNgVDeKBlNk3h
	Nb/BYKS4McN6SGBLZvZgKaFYabiQ8O/z+0oNK7kbiewA1w1U4ib4PYxWtZnRDFHHtdhCeiDPX6zfy
	+Olxlk+mcLwngvxwlOwmpkUIMRSX54AdfPdGNhQIKGvXAgy0jTuYkGJX6+HkC34No0ShYnEmpUhBw
	aBS12qBfE2SB+mH6GKMjWcuT1l25bmxRGt2jbp8e2gp/fcuQTKiAdEHm7E5Jk5Oeb9qwzXOzQ8R0i
	hQKzx1St32BfQFKZ2mSilXNizCqAFiCzORjNB1ZEHC/4k/XDPSKp2J4iH6p0sqsnMrGmiJbW+5064
	K66HBhGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDQU-0000000BMVu-0bWr;
	Thu, 06 Mar 2025 15:46:22 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDOr-0000000BMG0-49Zr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 15:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iqLTGgFW/Idb/RWJchf5+oj54Xp1Xr/3EggXQFnKjbg=; b=zg5fWzzg0ciofiTPI5rB/vbzNy
	WfPtrhrK/GWO2fk4YllvIpM+OR9zwj+nAcHdFxGejKYSLJxFb14lamIUz029dUennkO+S/8xVwuKc
	pWpGlU0OakPqbwkewGvaK7xfdpzRob+q6JwaxaXhNoWbqP9Op+aRtpsOdJre4ZOSQX1nrxyDbY+36
	dwWYXr59SJGNLnf9PF1mlryhiM4aHClD6+aAm22Y4/shvpvQn0l2CNkrHW7lUv7g6/QFOfOTssfz+
	4myjdw/1c6uQYOEnEyXLxfIhfWMGyWFfhFtY6V5aE6sU8xkDUpYR9cz8mguYi05IG5uCLynbEIjiF
	Xtu/bAfA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36454)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tqDOj-00067c-2X;
	Thu, 06 Mar 2025 15:44:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tqDOh-0006uz-01;
	Thu, 06 Mar 2025 15:44:31 +0000
Date: Thu, 6 Mar 2025 15:44:30 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Thierry Reding <treding@nvidia.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH RFC 0/5] net: stmmac: fix resume failures due to RX clock
Message-ID: <Z8nC3vvZWAl5_8WZ@shell.armlinux.org.uk>
References: <Z8B4tVd4nLUKXdQ4@shell.armlinux.org.uk>
 <f783cf9c-9f79-4680-a6e9-d078abbd96ec@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f783cf9c-9f79-4680-a6e9-d078abbd96ec@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_074442_026692_635FE435 
X-CRM114-Status: GOOD (  16.22  )
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

On Thu, Mar 06, 2025 at 11:30:53AM +0000, Jon Hunter wrote:
> Hi Russell,
> 
> On 27/02/2025 14:37, Russell King (Oracle) wrote:
> > Hi,
> > 
> > This series is likely dependent on the "net: stmmac: cleanup transmit
> > clock setting" series which was submitted earlier today.
> 
> I tested this series without the above on top of mainline and I still saw
> some issues with suspend. However, when testing this on top of -next (which
> has the referenced series) it works like a charm. So yes it does appear to
> be dependent indeed.
> 
> I have tested this on Tegra186, Tegra194 and Tegra234 with -next and all are
> working fine. So with that feel free to add my ...
> 
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Hi Jon,

I came up with an alternative approach which should make this safer -
for example, if the PHY remains linked with the partner over an
ifdown or module remove/re-insert.

Please see v2 of "net: stmmac: approach 2 to solve EEE LPI reset
issues" which replaces this series.

https://lore.kernel.org/r/Z8m-CRucPxDW5zZK@shell.armlinux.org.uk

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

