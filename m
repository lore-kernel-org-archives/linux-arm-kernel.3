Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6E8CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 00:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4POqQhvWWdidJ0gt2EIIr9UWMS8WdIjB7Sv2bwhgGB8=; b=WPGMhKypIkBtqu5f/bH+p3J2ow
	tJjzWWe4yN8sWvoTaYJaBwQkHxN4NM/AluxAoFTot6OimAxr6N99fRZGrKA49+mcEiOPCEbxuEiAs
	EXhIyM3QsHx1HFCb2r01q4AwnjizDLwHoBCD9u8jb1H2Owd1GfLAJSCy4WytTYmGpYHQOCpaB6500
	weL2UB/CGEcHtgrSmWhE4gzWj2N44O4Maf15AITtuYBHkRy6a0RltXhNYcCC+YUn+fpUFeI4a00nk
	1ffSRfsr3d7NBVouDIf4/Lw5h4ga5WixC0KhCP+g0H91+8CLYPoyez3ooi8+F02BmjBSJKIKTxTz4
	or9DQaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4oI-0000000Aq6W-35zW;
	Tue, 04 Nov 2025 00:22:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG4oG-0000000Aq5z-3okl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 00:22:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 812C843DA6;
	Tue,  4 Nov 2025 00:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3140DC4CEE7;
	Tue,  4 Nov 2025 00:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762215724;
	bh=PZC6ZAFX5mF9YpTkaCf/jKGSfMQTSFoPUl3PB0kzxEA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jgWfkAHbxDoD2BP9iwLha/1gvlsiF+jnLgr+WZifolFV8R5Egc0AIiBEvR5rsz4g5
	 eK7tWcNkCdVUq+7RKQHBkE8gcWNmBDvriEI0qcRx5En9g0HpHrA0UAOAnQOYiY8UmM
	 WT1XtGrThAoV48lvxFlXafD7NhcgI6X3J49WtET07eOA8P01A/SQpoxOyiO+dUgm/a
	 NGNek3UIn5jcORQ9NXJ1pGpsj0MXt+NgvNWy0TPuJGVQKsRqsT2bwGdr3FB1IFqRB4
	 t+RQF86mNa+58QWc81TjbMTVQBV9+/qYLVtQeN21XdaERSkPYbo5KpT5x046flgsCO
	 dB9BvXJGVm+HA==
Date: Mon, 3 Nov 2025 16:22:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>, Vivian
 Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "Russell King (Oracle)"
 <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin
 Li <looong.bin@gmail.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH v6 2/3] net: phy: Add helper for fixing RGMII PHY mode
 based on internal mac delay
Message-ID: <20251103162202.1bd0dae0@kernel.org>
In-Reply-To: <20251103030526.1092365-3-inochiama@gmail.com>
References: <20251103030526.1092365-1-inochiama@gmail.com>
	<20251103030526.1092365-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_162204_972694_43B5FCE5 
X-CRM114-Status: UNSURE (   8.95  )
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

On Mon,  3 Nov 2025 11:05:25 +0800 Inochi Amaoto wrote:
> +/**
> + * phy_fix_phy_mode_for_mac_delays - Convenience function for fixing PHY
> + * mode based on whether mac adds internal delay
> + *
> + * @interface: The current interface mode of the port
> + * @mac_txid: True if the mac adds internal tx delay
> + * @mac_rxid: True if the mac adds internal rx delay
> + *
> + * Return fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can
> + * not apply the internal delay
> + */

Please add a : after Return, so:

 * Return: fixed PHY mode, or PHY_INTERFACE_MODE_NA if the interface can

otherwise kdoc warns:

Warning: drivers/net/phy/phy-core.c:116 No description found for return value of 'phy_fix_phy_mode_for_mac_delays'
-- 
pw-bot: cr

