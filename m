Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B835CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 01:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKYwiHYcuuEX9qejRBfR3UwnpUS97A9Moe3qYNz8slM=; b=LtP1xUij6PgHPEQIH7wNSyfwYy
	giFRJ1B90R/nxarlEOIyPiFY9VognDxRowSP7Wlgb3/c3s70Dt6sJsnTUOCgo3IOo7L7pawADduo7
	FsGxNz53ODvL7rhoXabMmPs6uTwJv/bOs1EB2kr2z0KDVmmFNI142BHfxxFtGSG1l74MXuE8mgkcK
	dF0NFCfW5LUFFtGH6fbtS6j9AXX0R+rE4BR6bC95rwCg8sihm7pRDjVAzIeLU+9t4VOKJAPj86etN
	aFRt2j4GR7geRJ6uj4De+2JxrI/pPNyYE6QHl9A3PAznYtLAlf0O1N84kuB4XPvJPtzX6cOYPkjmu
	c3t70x0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoeL-0000000Eh2l-0sgS;
	Thu, 06 Nov 2025 01:18:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGoeI-0000000Eh2I-2wxc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 01:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE759440FE;
	Thu,  6 Nov 2025 01:18:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BBBAC4CEF5;
	Thu,  6 Nov 2025 01:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762391929;
	bh=7t9OsvQMT3GaIT7WtbZ9AfqGl0859XgGoz1qrHm8cIw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fK+J64KVtoqMUiia8DqYAj3mLb2EbeTVQJDLNET7uSXx6xkJNbVlqhgBSgS/+esmH
	 osqooD18fN/tusq3rzwdigzwNxx3K/MReAVBadPmPAXV0bUEviLLFat45a2GTiwG2u
	 47nNca+FpVQG/RslwUlJneevwJGkiMhH1F8z2PXBQGw5nwGulQtJZ9dkhn9TIaapIj
	 9QNVgkYqAivr2ymBGor2DjZFofAAG3LG0HtCQ5SfxGfNBd2glLNFnng/E/e4n6owDc
	 mlmRLGn58XHMcAxX93bSc+rYeIM9oJd7IJxN0LLrwmraEYlnE2Gxh3AxwfnAI8qsZ2
	 7QA5lyNghsK4g==
Date: Wed, 5 Nov 2025 17:18:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>
Subject: Re: [PATCH net-next 09/11] net: stmmac: ingenic: simplify x2000
 mac_set_mode()
Message-ID: <20251105171848.550f625a@kernel.org>
In-Reply-To: <E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
References: <aQtQYlEY9crH0IKo@shell.armlinux.org.uk>
	<E1vGdXJ-0000000CloA-3yVc@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_171850_771271_81FB684E 
X-CRM114-Status: GOOD (  10.62  )
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

On Wed, 05 Nov 2025 13:26:53 +0000 Russell King (Oracle) wrote:
> As per the previous commit, we have validated that the phy_intf_sel
> value is one that is permissible for this SoC, so there is no need to
> handle invalid PHY interface modes. We can also apply the other
> configuration based upon the phy_intf_sel value rather than the
> PHY interface mode.

clang sayeth:

drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:13: warning: variable 'val' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
  128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:142:2: note: uninitialized use occurs here
  142 |         val |= FIELD_PREP(MACPHYC_PHY_INFT_MASK, phy_intf_sel);
      |         ^~~
drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:128:9: note: remove the 'if' if its condition is always true
  128 |         } else if (phy_intf_sel == PHY_INTF_SEL_RGMII) {
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c:123:18: note: initialize the variable 'val' to silence this warning
  123 |         unsigned int val;
      |                         ^
      |                          = 0
-- 
pw-bot: cr

