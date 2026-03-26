Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FACF10A88F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1f6J7MFQ+d3Eprch19nvBJN8SwLx9u4Mt/IcSuHYlLw=; b=R3e0+89Ax2MKW3MJCgxPgPdnF7
	6Khm/irpJawR9AA3l8HjXqGt6zJvkLBohGEH9dM4pY7ynSg2pH9B+4LtFRaBpZXxFUECykOlcp3Zf
	ZckKE10PD+Erl7Zz20SK8u3NPJBYmYeajmsfiH05FSirdahXKYJo5+4tzLyglrAO2egT6CMT1EJwP
	6BfuH2/2cC9qp2OulY1bkqOGzYhwIBYw65N/gMPM8psQkv1HVA7+uirJkrSbkVsHpCiaS6Ba3M2iH
	7/bZUJJ/KxyPYqlNj+VAMSexsb0oesrcMhp7Ojzchpquhgq7tK42E4cNvK58E7iWx3U0mGMzOokvk
	9TW8R/og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5okq-00000005ykQ-2W4h;
	Thu, 26 Mar 2026 17:44:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5okn-00000005yjp-2qZx;
	Thu, 26 Mar 2026 17:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1f6J7MFQ+d3Eprch19nvBJN8SwLx9u4Mt/IcSuHYlLw=; b=pi6DLka26kwbyiEEB6f0eCDWa3
	6+fgpsgwMuo2hHTi7NjvwYDaE28XI06phkkv6LoAdpoSVu1wGEcuB/B2b7dpbcYLy2qO3OttXzjME
	q+sWCBOkrWZI5i1fnQy3cpbCjLda4+i3eZ6IiV3X05HIlDpxyUeWguchdj38m/DUEhKv8zxzFow9s
	sp1alZgomfd1xRGP5gl+s3xYElOko2K4JVrtIVmaeaZCC14vQraGxxQJ7JfhW59B3Embg/9SrBZY1
	1eqDdmQtKX/3gTk9kqWNxl9W1o9VgVPvZXphGHKZx6FCpLvYvQEMQGxpgkjVyThlTnKUNR+Dd8q69
	E4vR7l0A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51818)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5okW-00000000574-3f1q;
	Thu, 26 Mar 2026 17:44:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5okT-000000007ER-3JGz;
	Thu, 26 Mar 2026 17:44:01 +0000
Date: Thu, 26 Mar 2026 17:44:01 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiner Kallweit <hkallweit1@gmail.com>, kevin-kw.huang@airoha.com,
	macpaul.lin@mediatek.com, matthias.bgg@gmail.com,
	kernel@collabora.com, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 4/4] net: phy: Introduce Airoha AN8801/R
 Gigabit Ethernet PHY driver
Message-ID: <acVwYUKxIkKUEUJZ@shell.armlinux.org.uk>
References: <20260326-add-airoha-an8801-support-v2-0-1a42d6b6050f@collabora.com>
 <20260326-add-airoha-an8801-support-v2-4-1a42d6b6050f@collabora.com>
 <acVND6DdpM9czIwU@shell.armlinux.org.uk>
 <044110c5-da1e-48c0-93fd-35553e86b271@lunn.ch>
 <acVQQQiciPQBkQOG@shell.armlinux.org.uk>
 <425217fd-f74c-455c-9aa7-5b6682d887fa@lunn.ch>
 <385d2137-0d15-4dc0-8994-9cd48e4150b4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <385d2137-0d15-4dc0-8994-9cd48e4150b4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_104421_739634_EEE9A07F 
X-CRM114-Status: GOOD (  17.44  )
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

On Thu, Mar 26, 2026 at 06:25:20PM +0100, Maxime Chevallier wrote:
> On 26/03/2026 17:56, Andrew Lunn wrote:
> >> What is the timing requirements for a system going into suspend vs a WoL
> >> packet being sent? Should a WoL packet abort entry into suspend? If yes,
> >> then we need to program the MAC before the PHY is suspended, because
> >> suspend could already be in progress.
> > 
> > We would then need to hook into the NETDEV_CHANGEADDR notifier, and
> > call into the PHY driver to let it reprogram the MAC address.
> 
> We would also probably have to re-do that MAC addr programming at phy
> attach time ? If the PHY isn't attached (e.g. link admin-down on some
> boards), we can't use that notifier as we don't know what netdev to
> listen to. Or I'm missing something ?

Another point to consider in this area:

Should a detached PHY remain with WoL enabled?

If e.g. the network driver is unbound from its device, which certainly
disconnects the PHY from the network interface, should that PHY still
be able to wake up the system when there is no way to configure,
check its status, or handle its interrupts?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

