Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B624BCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmn+mPPOKCrL/iMUxEqnKDRw0ICnEtKbQ28M+LikyI0=; b=WdUxFzltxzzuaelwZLWGVEH/g8
	54lo1nKCC87ug6pmdhpbuvBaU0ra02y/5LfLCd1fboDpmxXvqkmY4Nc25TH9TeXaAxBaSIwRqKPOk
	mbfWWx4PixBz/PZOpeEXCpsT+sQVbuUuRI8FrwQgpKAWLDdOU/OAyRzEK3lLJ27Cn8A7Vgpoj1BCK
	qqMlg0lLTsi30zOvRo8k1s7aYtgcUoduEHjP9n5RXJua2mNLpGWHEJx6dtKjEbnQ6j2i2iZ7+WBIG
	ElnLEIsgh9imxkYPUQR/Hk5zFYK/03cLXdNoFXQGTF937dBkby2rPY5Z/4VBsorM7oYOOpsKgGuFC
	bTyDvIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAdX-0000000BgAH-1LT4;
	Wed, 10 Sep 2025 02:32:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAdU-0000000Bg9l-3nip;
	Wed, 10 Sep 2025 02:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A4AF41A13;
	Wed, 10 Sep 2025 02:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45600C4CEF4;
	Wed, 10 Sep 2025 02:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757471560;
	bh=uKnWLcPvL4FL5EbVfXRQWAlwJ32gTk07l7dEO35EovM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKdRxd5VDS70ED1efdOfAA+1WTSHm5aVv3nvZkgwDzJ1qge/g9SFe1s2Lm/LkMKti
	 sGuVA1Pa6LNdzURqcUX/UrsrEWL09J14dUHCqn4PovezuTHer/JRKSV1ozJgCzjVAl
	 0OoxEanJ1Bd17pUgBTBHHwDqk3xUBvU5lYRgnHKdOZA1gUeqdKhRNCuilljCO8DSJQ
	 Dd4UAKiGbyJd8dZqW9ZwRvTiY9cuPRtwuRTuVlRp6CY1z6TvbqS7+I4yvw2r6CJiwm
	 F6wktYr8fPrRPAALKahxTh/KGOSkMYb5UCJEwZEhz8idVEmOpOZpAAyz2Ne9Ca3NrL
	 VzAL2x5ECk0tg==
Date: Tue, 9 Sep 2025 21:32:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>,
	linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Lee Jones <lee@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [net-next PATCH v16 02/10] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Message-ID: <175747155888.3660326.7601418632786886363.robh@kernel.org>
References: <20250909004343.18790-1-ansuelsmth@gmail.com>
 <20250909004343.18790-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909004343.18790-3-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_193240_961078_6CA68937 
X-CRM114-Status: GOOD (  10.68  )
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


On Tue, 09 Sep 2025 02:43:33 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configurting the PHY page.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


