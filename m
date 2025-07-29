Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFFFAC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 18:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b0ZxO4zaTBDiZ70aFZFCdiOcnI2dippFCSPeeEmtK4A=; b=otgHvOTirIJvLgrbb0iQJgmizF
	5TPixKSv2KBogRsKeQZxP+cTMjMY0dhxgTI2DufIQOPdTkngF/UmKu//iAsYn/IOJlV/x+MZkblef
	5cRX2qX6SwZN5KShIjs2ikL55PqL45E5Bp+E2UnoMoK7vE0zKpT4gK70eae4qbaxAFN2tiZ3n+/vj
	yuOpCG8WssJRLL3qGOEldGaGteN8NYjuqrVpAAzLoSJaBOFCMZso6H1zyScEs1MjeD1AAbYiGuhod
	rxqQ01KVuTQL4QPhvQf0M2B/ERpCUdhqMN5INeDMHVhgwwcwRLFfFtR1aTv6M98XllijqnrOahIyy
	xErMmORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoyI-0000000HRET-2bjE;
	Tue, 29 Jul 2025 18:22:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugovp-0000000HQss-0wGt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 18:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=b0ZxO4zaTBDiZ70aFZFCdiOcnI2dippFCSPeeEmtK4A=; b=ZE21ZVYPFB2jAHQsq8YihIXAYh
	FH+BI3PDBCZslICCC7CKweHWy7PdUAm3UtMvyFtuEfJyfGbqSWApdp4cMM0jfL5zeM9Gr2W6Ifxek
	wqd233XaxmNsMdVvrzh15z19q0PCGgWB/vlfOoyY5sslW+Iw2oXZCVZ0v/pRcRocG/WtPjXDyO4cM
	G9Ee3BS1udYhI9EAECfxCZFt71y7bN750e8a5RUeS9cafyDXrZnvYNpC1aagzH09LhxKyXAVq2lUo
	KuCa/FTLGu0zCu6x5eFNuCv7XEpQ/+KtKbvF31+aq/5XbEMKlZUwqZo+bHpMpXyR/SaZ1cI3RP+FK
	cLO9fegA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46032)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ugovb-0002KX-21;
	Tue, 29 Jul 2025 19:19:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ugovW-0007cp-1f;
	Tue, 29 Jul 2025 19:19:50 +0100
Date: Tue, 29 Jul 2025 19:19:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 6/7] net: stmmac: add helpers
 to indicate WoL enable status
Message-ID: <aIkQxlqmg9_EFqsI@shell.armlinux.org.uk>
References: <eaef1b1b-5366-430c-97dd-cf3b40399ac7@lunn.ch>
 <aIe5SqLITb2cfFQw@shell.armlinux.org.uk>
 <77229e46-6466-4cd4-9b3b-d76aadbe167c@foss.st.com>
 <aIiOWh7tBjlsdZgs@shell.armlinux.org.uk>
 <aIjCg_sjTOge9vd4@shell.armlinux.org.uk>
 <d300d546-09fa-4b37-b8e0-349daa0cc108@foss.st.com>
 <aIjePMWG6pEBvna6@shell.armlinux.org.uk>
 <186a2265-8ca8-4b75-b4a2-a81d21ca42eb@foss.st.com>
 <aIj4Q6WzEQkcGYVQ@shell.armlinux.org.uk>
 <b88160a5-a0b8-4a1a-a489-867b8495a88e@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b88160a5-a0b8-4a1a-a489-867b8495a88e@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_112009_260133_7368A63A 
X-CRM114-Status: GOOD (  10.31  )
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

On Tue, Jul 29, 2025 at 07:27:11PM +0200, Andrew Lunn wrote:
> And i did notice that the Broadcom code is the only one doing anything
> with enable_irq_wake()/disable_irq_wake(). We need to scatter these
> into the drivers.

It's better to use devm_pm_set_wake_irq() in the probe function, and
then let the core code (drivers/base/power/wakeup.c and
drivers/base/power/wakeirq.c) handle it. This is what I'm doing for
the rtl8211f.

IRQ wake gets enabled/disabled at suspend/resume time, rather than
when the device wakeup state changes, which I believe is what is
preferred.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

