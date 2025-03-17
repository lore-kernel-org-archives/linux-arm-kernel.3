Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A7BC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 16:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+e+FGLBIe9dlEkZgjpfWAiWhojPGQIipu9cJEe5ODY=; b=mSNSPL/xUV0qO1Fo1XznmAW6Mk
	MLpaToJyb6RRdAsZwBDm/Jt7c8c3wpJVwdlqzTugLzSwGvOMmEICQmfcN6fPmAKXJo9Zdfu41rLH6
	xEgmseOXIJoPag9XB78pFSjO6/hQ5K7acCqDgEurusRUaoLdc1eUq87y1hCsmEkyb+5ugHHHviwW/
	4A3AsU2XYIbPVoB6TfJWF4HYSjY5s4zwZVtiwtrEFHnigborgEqLFROC8nTh0e8n/tF7wHJVNmiib
	KaqJhabBEbX40DbKOvdYQT0pcSEJr5n6FTX9FOGKMsfzAU4sz20CV/5l9nXLrQpKvqZYn9SjBnvIt
	aBOrldAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDEo-00000003JO8-3py3;
	Mon, 17 Mar 2025 16:22:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDD8-00000003J86-35Yn;
	Mon, 17 Mar 2025 16:21:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 587B5A4553F;
	Mon, 17 Mar 2025 16:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52745C4CEE3;
	Mon, 17 Mar 2025 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742228465;
	bh=vF7ad/Mcki5NOq2HyTnzqiMe2ZTcqukB3pbb+0Dn7dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UNP6zHfbeqKFnPIED0zdcRQimNpHnL50ZjQw/SF2NtUKHkJKf+WsK8Puc0q/HRC5Q
	 onsOiDyvNoV9I+gK/9P9UtAQWijdj+yFOF294HY5ZRdwOUJESoBpFeDSMjOUnV/tMb
	 LGl0pVHBIhsIpmJ4mCJBqxLGoyFSE8nwWvMrmpAR5euAb3/3Y4JF8rCW/r7HPLZ283
	 tEjE0x3ifwLcDaMyGL+724wsBU0E2DxXpycWU0RIX9dNzNk31tWJF72zZU1HWW4xSf
	 dOMKc63X/TiQUDyNsTttNXexINS3UNfcOMokM+zEqcHr+RjiWmygyhgkt9/MmX/MKB
	 fBchnaF6xNSFA==
Date: Mon, 17 Mar 2025 11:21:04 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
	linux-arm-kernel@lists.infradead.org,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-mediatek@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	upstream@airoha.com, Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [net-next PATCH v13 03/14] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Message-ID: <174222846382.166778.10361750788975293677.robh@kernel.org>
References: <20250315154407.26304-1-ansuelsmth@gmail.com>
 <20250315154407.26304-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315154407.26304-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_092106_839198_7B54BE62 
X-CRM114-Status: UNSURE (   9.81  )
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


On Sat, 15 Mar 2025 16:43:43 +0100, Christian Marangi wrote:
> Document support for Airoha AN8855 5-port Gigabit Switch.
> 
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configurting the PHY page.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../net/dsa/airoha,an8855-switch.yaml         | 86 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


