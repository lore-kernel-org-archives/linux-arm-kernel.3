Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C183EE77194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xxKWJv+ffT1sOqGI0qRmYKwPB2g47K0/F/JQkScz9Nk=; b=EsfRs5FWCUIDbjl5RD4+7KQJJ6
	LLo4JDVV/XvktzpI7F7kIhDsSF3K5BhXnFW7lh8+pmYTtCTxML2WMooHJBTOUrb74jsALTS06e8Kx
	hMHg46zYYB7/1sPjTfB1uqsRNQ5BrRpVBIRk9Ru2FSwRVAdgD7/+AEzjUQdbPXlZU8IE7FPXDoljD
	Ys8KlRaoIA7ZQxXcJgD8xUXygENLqSikL13Wj7+wZZh5JkYAQ35oZY0OgCB4wK0ru/T8u6EanwSc/
	JVQcPnj3Fgjlc9Ldz52bSLVaUFgr2iob/NjKv+XfAJgrfgvJLSCujaxgBYXdX2U7LbG0dCkl5lIUp
	utS/XLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHfT-0000000A40H-0eJ6;
	Thu, 02 Jan 2025 09:39:03 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHeJ-0000000A3u2-2aXs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=xxKWJv+ffT1sOqGI0qRmYKwPB2g47K0/F/JQkScz9Nk=; b=eOTzSmPA27K32Oyd1t8ucPEezk
	MI18xWYPmWjAYwVcawWZM1ujjWN7fE4QDiOYoYT0rWx4tljBYrL5F9jA9lak9uyGkDTT7JkZwvrti
	uHynHpcIUQirSPR0U3awS3NSqZSaTOfycrT5GHEJT/kJtED4MH9w6dqxMbWnGvFi8fFxpLTWe4eHW
	erPx0LA2xZbL+WhpCb8JLwR5N9GKcvl4ZCx7wfqpEUJrDmJgLRzBxeuoqfxpe23NjcyQZGo0Qbse3
	jV8Ya4xDeklc1kQuKb7EpaNTSlAgcwBgyez76a9vdMxYz0qtTdI0uj88KW3kMLG8IPe7EczuNZR6l
	BJRoRzqQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36588)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tTHe2-0001p5-2X;
	Thu, 02 Jan 2025 09:37:34 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tTHdz-00009o-2T;
	Thu, 02 Jan 2025 09:37:31 +0000
Date: Thu, 2 Jan 2025 09:37:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	jacob.e.keller@intel.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, robert.marko@sartura.hr
Subject: Re: [PATCH net-next v4 0/9] net: lan969x: add RGMII support
Message-ID: <Z3ZeW_N5bZkRAQ_L@shell.armlinux.org.uk>
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
 <20241218143354.eh6iinemupxncblj@DEN-DL-M70577>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218143354.eh6iinemupxncblj@DEN-DL-M70577>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_013751_711389_7144DB68 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, Dec 18, 2024 at 02:33:54PM +0000, Daniel Machon wrote:
> I would like to defer the pontential removal of sparx5_port_verify_speed()
> function to a separate series (see comments on patch 6/9).  Any chance for a
> maintainer to give the OK for that? I would like to give this series another
> spin before net-next closes. No changes in next version - except adding TB and
> RB tags.

There's no need to respin just to pick up tags that have been given -
patchwork will pick those up automatically.

I'd rather not have the current patch 6 merged, because we've had cases
in the past where stuff has been merged with "we'll fix it later" but
later doesn't seem to happen. We especially take this approach with new
kernel internal API functions - we don't merge them without a user,
because we've had too many cases where the user never appears.

We're currently at -rc5, which means -rc6 this Sunday 5th, -rc7 likely
next Sunday 12th, and probably the merge window opening on the 19th.
I think there's enough time for sparx5_port_verify_speed() to be
dropped during that window.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

