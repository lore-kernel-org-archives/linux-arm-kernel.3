Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABFED10369
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 23:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ukMBHd2xprh1k/N8cNGlN+MYj/FJerUlkN0OU+0nrSM=; b=FjDTXAclVHu1pnwMEfnUg7Ctcb
	gxz8zZbKlc0kxEPnd0cpuxta07sulRJHxeJcLvxq57U0NOViR32n1LlPY6qa20pni0bulk/8voNUM
	cThbX9uzkcfLhhGu8ldQboxUnZZjua1bO/kjb2TGdC23m4sBHyaojZllz9PTxuwBXSAx1YVA0/lFK
	Ebx48vc6JF/mM1qTCuKoakWOM7pnMeD8U6f7oCWv/8YbxQFHLQRTgMriPp5a/3VaU4BHXqutqSKJX
	bYCX1N0MnkwlrxR0p5pKz63P7QvFxpLlbYHmn6oQBvpQjS6h3rZPjZ3tewThxVczGzJGl44XDnN0h
	ywEmnMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2Jn-0000000E3IH-2dzs;
	Tue, 25 Nov 2025 23:19:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO2Jj-0000000E3Hd-45mh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 23:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ukMBHd2xprh1k/N8cNGlN+MYj/FJerUlkN0OU+0nrSM=; b=Tmkl9DgGtXT1tFoDpAdbmsXLu2
	wPfi67ITjX3MMczRG20rf2PbUhq4ZGCG/KDNkBGrpGO+cN+ZFzUAi1UFWV1q9dAU55D65VFvfK/+v
	CijIMS61dPmELwsL21oN9hO8F057RmwJbKrEu0o9u66hmRyhu7TYQJL4I1Xcyzr9ienz1xQ78akqf
	RquMtihWgU9RyHFTEoJ+Hw2IsjlFXCPXyzGrOLfg2QnvLGfG0eFuUlqnxqH1oCpROSyT/AjVs7xCl
	VuniJyZ9A2qMyXOxayYK+EASCMWoEKAOE3jDp0UaeuKiqTAxpRI140EdlLrjJIwKMqVxAEAdPTBM4
	4wrPwEKQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56056)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vO2JU-000000003IU-2m6E;
	Tue, 25 Nov 2025 23:19:12 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vO2JQ-000000001AF-0Uv7;
	Tue, 25 Nov 2025 23:19:08 +0000
Date: Tue, 25 Nov 2025 23:19:07 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: rohan.g.thomas@altera.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Fugang Duan <fugang.duan@nxp.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: stmmac: Fix E2E delay mechanism
Message-ID: <aSY5ayT0X_zFeYFs@shell.armlinux.org.uk>
References: <20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-ext-ptp-fix-v1-1-83f9f069cb36@altera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_151928_018182_47B77153 
X-CRM114-Status: UNSURE (   9.88  )
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

On Tue, Nov 25, 2025 at 10:50:02PM +0800, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> For E2E delay mechanism, "received DELAY_REQ without timestamp" error
> messages shows up for dwmac v3.70+ and dwxgmac IPs.
> 
> This issue affects socfpga platforms, Agilex7 (dwmac 3.70) and
> Agilex5 (dwxgmac). According to the databook, to enable timestamping
> for all events, the SNAPTYPSEL bit in the MAC_Timestamp_Control

bits

> register must be set to 2'b00, and the TSEVNTENA bit must be cleared
> to 0'b0.

Are you sure 3.70 is the appropriate point. According to the 3.74
databook, SNAPTYPSEL changed between 3.5 and 3.6.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

