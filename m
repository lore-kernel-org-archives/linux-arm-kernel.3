Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1A510BA424
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 07:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LoOZn3v94QiOgVjPkKxzDKU/RFUoSB5XRbx6p7b+DQ=; b=AaCofJZbkhWCW2wiIsvRxAC7uW
	qoIM5ByM+kpLau/4E3yQdE4DkYKnC4SSftNrCALTQcwRsaDoGwOxJYhkDMWpNCqAht5O1baPWgizj
	lsHqvceZZWXFDcjQpx8Onxx5mjgJ3xl1B2ORNPx1YuFclYxnw2qrTGzXtWeehXmZS+IWnRe9RJIvZ
	wZ0ifwvF9HOp1MpSfs3m16wMX8jIK4HfIyQ9gvGzjuVLbzYKh8pNcviCl1zfIo2rhsjRnHGdupdtl
	10okNEVNKAUy3LpWIp2g4op82FyML6EpOr1RxUEbTVa9BSUu8fLqMii/ErpKfcLpWwwGp0iEkJhpQ
	vPdn9UnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OXr-00000008iVk-0QRU;
	Sat, 28 Mar 2026 07:57:23 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6OXo-00000008iUw-2gex
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 07:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+LoOZn3v94QiOgVjPkKxzDKU/RFUoSB5XRbx6p7b+DQ=; b=r644oDVyLnyUEceUBloN04Wi1i
	HG5BS8wP0wuCbnrBumQgdGPInRO1wusoI+THwSJvbiL/8B+X7SQyb9h3kVY/Fmee67VwJmvguxLNb
	w5ki4vAtVY1x2nBiZrzJIE6X3yUEWjMAXX/Vw0IC/bp+T6Zrj70S+ojLcgcNHzhkesMhmU568udaJ
	PqFIeHFUiqMVYZnbxGVWgJVjFLgfrm73T/1RY88KkX9F5SBZncWAoOdgX+3MBXYx+gFm+udexfpGp
	JdUjZLngZvHiQOr7ojLrpKeBF2KyLXTnbrGEGJEtBxJ/iM/pGPoydZX1E0MYPmzf/0cxQqBrXrzpH
	lpEvAaBg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49052)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6OXj-0000000072B-1RuQ;
	Sat, 28 Mar 2026 07:57:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6OXg-000000000Ux-0mXz;
	Sat, 28 Mar 2026 07:57:12 +0000
Date: Sat, 28 Mar 2026 07:57:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
Message-ID: <aceJ18UxKMM_PxHk@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
 <E1w62n4-0000000E3C3-251S@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w62n4-0000000E3C3-251S@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_005720_680763_53ADD3CC 
X-CRM114-Status: GOOD (  10.87  )
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

On Fri, Mar 27, 2026 at 08:43:38AM +0000, Russell King (Oracle) wrote:
> @@ -687,7 +683,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
> -		 * ethqos_fix_mac_speed() is invoked.
> +		 * ethqos' fix_mac_speed() method is invoked.

...

> -		ethqos->configure_func = ethqos_configure_rgmii;
> +		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
...

> -		ethqos->configure_func = ethqos_configure_sgmii;
> +		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;

AI review of this patch is still complaining about the comment above:

  The comment still references 'fix_mac_speed() method' but the function
  ethqos_fix_mac_speed() was removed in this patch. Should this comment be
  updated to reference either ethqos_fix_mac_speed_rgmii() or
  ethqos_fix_mac_speed_sgmii(), or perhaps just 'the fix_mac_speed callback'
  to remain implementation-agnostic?

Artifical Stupidity at its best! :/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

