Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12057109B46C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 13:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DT+vgC5GXM15UUYIt8jVOrq7hQsR3Kl52e6YumuVgbo=; b=d7scS/HVuor/oj78Et4bYAKJDE
	o+XSDoX2nv1QgU1FXtJI58F6pNcfTJYsm/np1NKnDNUDENNzcLJRyeboM239aYk/W8iWFWNVBq6tr
	V9xcy3iJjuOVsgOjkHCLpJjJQTTMcQGYgVSjGkLI04bghD50xznb8OUvAwrbjzGMIEKNAht6Nid8P
	UfA1ULJM+cjBf2LL2P84FEXrY2/RtBss0/S3w8vMdGKE1hFMruc3r+dfYStORk08loxkPmH5CRsvU
	Rs3gP8UbxQiozBQmrHJGSW7VeRFPMEZx21OXVPS0rCM1FvE4na4+JvBj9HIivz/z75Ep2UNfCJ1Fl
	2POTteGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Z5w-0000000D0YK-0G0K;
	Tue, 31 Mar 2026 13:25:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Z5t-0000000D0Xj-1v3D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 13:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DT+vgC5GXM15UUYIt8jVOrq7hQsR3Kl52e6YumuVgbo=; b=ASE1G+jBY0+Zdw7m+MNrwynC3M
	oz1UtlZZ8QrFCgHW01uF8i3NGyZ54AbmCEiMkVTqTAhPkRqLjopmruGoYGctz81Sq5uUPunwrNMoN
	DLbLRt3ZEBAb1pfCnJXhfdw3pLUm1i15h8fpfJCgpXTW4xmXRN16fpK5mILuWEaegy4xefNKObCVf
	heNp+hlKFYCCNrbVfDYkooB3XjjyWeCauOSEresJzTdXLdTvq9YuO06ZXRXqGjwHvSDFmfnBMHK03
	iGMn3gCTXTApIpnrYe/9g30ihDgwiTOovgpnS+5JgWwMXvIkS8lVBMsayN7yPz8I3xDBk/+/wrVjg
	9i8iExCA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:43612)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w7Z5l-000000001se-3Q5v;
	Tue, 31 Mar 2026 14:25:13 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w7Z5j-000000003lJ-3F0n;
	Tue, 31 Mar 2026 14:25:11 +0100
Date: Tue, 31 Mar 2026 14:25:11 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Julian Braha <julianbraha@gmail.com>
Cc: manabian@gmail.com, davem@davemloft.net, peppe.cavallaro@st.com,
	alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] stmmac: cleanup dead dependencies on STMMAC_PLATFORM and
 STMMAC_ETH in Kconfig
Message-ID: <acvLN7toll85veZy@shell.armlinux.org.uk>
References: <20260331125817.117091-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260331125817.117091-1-julianbraha@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_062521_496741_F882E087 
X-CRM114-Status: UNSURE (   9.70  )
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

On Tue, Mar 31, 2026 at 01:58:17PM +0100, Julian Braha wrote:
> There are already 'if STMMAC_ETH' and 'STMMAC_PLATFORM'
> conditions wrapping these config options, making the
> 'depends on' statements duplicate dependencies (dead code).
> 
> I propose leaving the outer 'if STMMAC_PLATFORM...endif' and
> 'if STMMAC_ETH...endif' conditions, and removing the
> individual 'depends on' statements.
> 
> This dead code was found by kconfirm, a static analysis tool for Kconfig.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

