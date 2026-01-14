Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B1AD38FE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y61uYm3JH/KtNk15jytJHmmEwvziKjnfVE0sSCeGVIs=; b=y2tLIRRdb0o7ahu6X8ejse7cxc
	UJu8SlyBdmKZGkkQLYwHgmlTB3HGy+PhUQxuu/5+JuqCjQNZxrQLZaJ2SU3U0lxm5oQYbDQPh6aya
	0k92bXrk04IQF1wLRgGN9NmGdLUT6j/rnGytWxnseUATbzUxNrzc6jFevPDXWaQ+e4o6tw3WWO5tA
	xlkVLVAMP48BGSEjJ6obQ91NXMx32mN0Z9XyT4AlkqdGGAZTPqiVqBgWNv5LrUVJ9Y5KGjxTpGpAm
	k11uLXUqeCfRdB5h9NnyVomJRVM5BWZnoVboO4iH2bKe2Vnu0d2iFdPKna7gKxVFU0eMpgObc6+fI
	XuA8y5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3kU-00000009vZu-3B1X;
	Wed, 14 Jan 2026 16:29:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3kS-00000009vYR-1HYe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y61uYm3JH/KtNk15jytJHmmEwvziKjnfVE0sSCeGVIs=; b=cyJ8GstRn0EIheiYdc73zL9HtH
	64Su9Ij7Qv7IV/7aNTOGq2uxl2AoucyFgh9I4BWWbTQtWrEU0jLF9cU4CS69+9fPxkYt6mxUAR6eq
	FypwiYnvKw/c835Zv6vB/+2V5vuB9C7ZvW9GpmCRA+mUiIh1t/3r6/A0jVkDAJxjE5qnV/8iCYwoC
	d3pCDrGGWXstTu//2XilB/TD6cWCZaJrjx9lwZdlz/+j4jj4gkI4m0kOc9nl+ouQBbIEBDXMDTwZe
	h9RXCGmNY0h0p01wGoPlkZCQwyEn4suSfM+giJwaqnS+eikXzerGCIGAR9W6MfKdySKZwgknZn05Y
	j2MIhhNQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55620)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vg3kH-000000000N3-00Z0;
	Wed, 14 Jan 2026 16:29:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vg3kE-000000001mn-0F8r;
	Wed, 14 Jan 2026 16:29:18 +0000
Date: Wed, 14 Jan 2026 16:29:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Marek Vasut <marex@nabladev.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,PATCH] net: stmmac: stm32: Do not suspend downed
 interface
Message-ID: <aWfEXX1iMHy3V5sK@shell.armlinux.org.uk>
References: <20260114081809.12758-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114081809.12758-1-marex@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_082932_354099_1A78A582 
X-CRM114-Status: GOOD (  13.93  )
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

On Wed, Jan 14, 2026 at 09:17:54AM +0100, Marek Vasut wrote:
> If an interface is down, the ETHnSTP clock are not running. Suspending
> such an interface will attempt to stop already stopped ETHnSTP clock,
> and produce a warning in the kernel log about this.
> 
> STM32MP25xx that is booted from NFS root via its first ethernet MAC
> (also the consumer of ck_ker_eth1stp) and with its second ethernet
> MAC downed produces the following warnings during suspend resume
> cycle. This can be provoked even using pm_test:
> 
> "
> $ echo devices > /sys/power/pm_test
> $ echo mem > /sys/power/state
> ...
> ck_ker_eth2stp already disabled
> ...
> ck_ker_eth2stp already unprepared
> ...
> "
> 
> Fix this by not manipulating with the clock during suspend resume
> of interfaces which are downed.

I don't think this is the correct fix. Looking back at my commits:
b51f34bc85e3 net: stmmac: platform: legacy hooks for suspend()/resume() methods
07bbbfe7addf net: stmmac: add suspend()/resume() platform ops

I think I changed the behaviour of the suspend/resume callbacks
unintentionally. Sorry, I don't have time to complete this email
(meeting.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

