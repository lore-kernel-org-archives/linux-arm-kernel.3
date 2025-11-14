Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9543CE7A9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BshqSWf6ajQjP9885Vu8L329S870vsNwaEvLA6VNzwA=; b=3DpjyK9s9PtXODugoPEik4/A6O
	op8cpObLxxJptF1gPBzfO4LKo06N2aMwaVbS4R00OlNIpHDbzPZLjTrpz9Spp4ouMf46wANMwTdEj
	CN8m68zO4Lvltew2rIf3jsAMp4WcChJn/nhSQHXlXW+mcGjIZjxuXIuDMxOTts9KKiEZx6Oh7Z8/d
	+UWB9oEz3WGOmu5Eq95wIathw/f71caBdDUUiF/DU7R7ZRYQi7KbJoeZaAI9YbOtjL1RD2zjz7V95
	tZsSEgnHbQhhFC9GgiuBWyfIZMhB+XvXdaN1jVSbtYeXU+kE81sUMI3pIzu1b09Wl+IhWaUpE0dcO
	5dGOf+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJptz-0000000BsZe-45v2;
	Fri, 14 Nov 2025 09:15:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJptw-0000000BsYl-49pJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 018F06012A;
	Fri, 14 Nov 2025 09:15:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A643AC4CEF8;
	Fri, 14 Nov 2025 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763111727;
	bh=uIoL6F17tP0jesir1V6cycmjCPl3jlFWKbnDbifqVNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LrPTgg0jchX4Ugutwsxk2kal2kbS9DxT4VFtFczn+X5exV8VYs6kZIojrfoayxUqE
	 zzdiEO3q3qjna1vVu88ui0pLLODqJD1bTpfPt7y73u7cSzsuIxL3ve+XtyC2gOo97u
	 pno6F4BUb47da/BARTZVBu/2SFBfKFIqDdb56AxXeNCnaUDjIVDJPCVMR86CKlG83/
	 k7FQpGkPtb/QN3jSJzZ+HeoQOOOnS5stT9LC+2vftjet7p5wveEzKACaXSgSSY+UBw
	 s+DSZOJ5sgV3UgwG7rBFuT4BnpLbIEdxlSNB4fCDrcpL4HTqRN3Ef0CuHuIFBu3e1h
	 HhMGtc4ZbWzTA==
Date: Fri, 14 Nov 2025 09:15:20 +0000
From: Simon Horman <horms@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v8 2/3] net: phy: Add helper for fixing RGMII PHY mode
 based on internal mac delay
Message-ID: <aRbzKI3NpXPv-JpK@horms.kernel.org>
References: <20251114003805.494387-1-inochiama@gmail.com>
 <20251114003805.494387-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114003805.494387-3-inochiama@gmail.com>
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

On Fri, Nov 14, 2025 at 08:38:04AM +0800, Inochi Amaoto wrote:
> The "phy-mode" property of devicetree indicates whether the PCB has
> delay now, which means the mac needs to modify the PHY mode based
> on whether there is an internal delay in the mac.
> 
> This modification is similar for many ethernet drivers. To simplify
> code, define the helper phy_fix_phy_mode_for_mac_delays(speed, mac_txid,
> mac_rxid) to fix PHY mode based on whether mac adds internal delay.
> 
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Simon Horman <horms@kernel.org>


