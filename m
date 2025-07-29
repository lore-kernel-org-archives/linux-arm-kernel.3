Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C592C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDb4J5a+AiGLZI7v9e7yzeDvRtwwpyCg2pNHaK7xfOI=; b=RPdmym5G04SlNrJ3Rnah85V+ad
	BxUxTK23Zn8+YzKCzZdPhgcdsGmdcIqEsuOSmg2BHtCIgQXv/YDA+7NzFOKPfcFxYz/aQe3EWXR/9
	5aghBSsSYrTEJ9epwUHfUFnl4+wCg1X+3XiPzWXtLICE2YpcE1i0D7Co1kg/2Mc8ne1og1v+UvuET
	t5UZUqDeUJJFKNB/srQKIFil/fgPRm4ygKYx5+vlv4+gghvSBGRm6Zw5Gp4BRvwLfkO3PFy84UI7y
	HC/Xnc9N0XNAyrLR9UOVudycplReIXdyfCS+DvbCxSH90PSuVwsU1Ost4x6bI6qjT4UKDBHN0Sy05
	vdnguQPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugglx-0000000GPcF-2E5b;
	Tue, 29 Jul 2025 09:37:25 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uggPp-0000000GMQw-0KvC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 09:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BDb4J5a+AiGLZI7v9e7yzeDvRtwwpyCg2pNHaK7xfOI=; b=UTfonjKqPZWb97am0NhvQMxJ3G
	L8uQyv5HsuohTsD4JC7FSV6pnzjYCZxOXGTwMtSrbfBIFhFBzk0WmnwQQ8m5+e08P4SHXxhv1FCnB
	GDkAiF/xcXnBDGTFz/YVI7AAseRF/aS3/HMEHLR6taygI4xAP4BZj+j9i1zf5oOiyK2LwzJMqW9hJ
	a9zxncFZXGABYCayhilVg5zHJLTT4URhTPKmYTzc6JZiEZoyDZYNa5898ahZAmQWwhpJ1e3Dpp0sS
	zG2HtxqDVguqdhBdh4/psmtJpbIbnI9uL6tK/i84ylBNNhB079EQeCTFuwr1paITdi8FVLF3MUmsf
	NtJS3/mg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48204)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uggPe-0001ds-0d;
	Tue, 29 Jul 2025 10:14:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uggPb-0007HU-03;
	Tue, 29 Jul 2025 10:14:19 +0100
Date: Tue, 29 Jul 2025 10:14:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
Message-ID: <aIiQ6qnj1M2qTudc@shell.armlinux.org.uk>
References: <aIebMKnQgzQxIY3j@shell.armlinux.org.uk>
 <E1ugQ33-006KDR-Nj@rmk-PC.armlinux.org.uk>
 <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_021433_117632_752EE2D9 
X-CRM114-Status: GOOD (  18.64  )
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

On Tue, Jul 29, 2025 at 10:03:22AM +0100, Russell King (Oracle) wrote:
> Without Thierry's .dts patch, as I predicted, enabling WoL at the
> PHY results in Bad Stuff happening - the code in the realtek driver
> for WoL is quite simply broken and wrong.
> 
> Switching the pin from INTB mode to PMEB mode results in:
> - No link change interrupts once WoL is enabled
> - The interrupt output being stuck at active level, causing an
>   interrupt storm and the interrupt is eventually disabled.
>   The PHY can be configured to pulse the PMEB or hold at an active
>   level until the WoL is cleared - and by default it's the latter.
> 
> So, switching the interrupt pin to PMEB mode is simply wrong and
> breaks phylib. I guess the original WoL support was only tested on
> a system which didn't use the PHY interrupt, only using the interrupt
> pin for wake-up purposes.

I will also state that the only way the WoL support for Realtek that
was merged can possibly work is if there is some other agent in the
system which configures the PHY such that PMEB only pulses on WoL
packet reception. Unless this is the case, the PMEB pin will be
pulled active on the first matching WoL packet, and remain there.
That means WoL will work for the first attempt and not after.

This makes the WoL support that was merged completely broken for the
general case where there isn't some other agent configuring the PHY
e.g. at boot time.

I am in two minds whether it should be reverted until it can be
correctly implemented. It's a relatively recent addition to the
kernel - the patch is dated 29th April 2025. See
https://patch.msgid.link/20250429-realtek_wol-v2-1-8f84def1ef2c@kuka.com

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

