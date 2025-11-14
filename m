Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C3BCE7A8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dStSDG/8VfXRxbeypT+XI0U3z9AC8hNUHOahod0PYR8=; b=y/jfTUVlvTUEV1xazIDY+cQYHF
	ZOkinclKm1hbM4hwQ01Pd/e1Oh9G7CNaCMfpKdpRdvcMQ7RvTHhQakLrcn3184R1iHCxll+dCkcMU
	Ea0XWGFcXQFBlzvH79jeNtwY/JA2XBuyBGLZHadSibXLVgLPBxotiX81MhAsE43eIp2gTQA1T1IIs
	eSr7RZUAwkER0ffMqWm0i9bxgCWwVM89Uieu0v0Pd+8i0t2w/6QRB72o2HIudreaH7TKVZj9oDLo/
	6oU4L/Lk+DLKaZYq584feM3LQAv9YMXbOW50rlgeOR/OG/viXpG/ovnPuio+F2+XHuXXNwaYpaZip
	K30ByMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJptg-0000000BsTA-2n0K;
	Fri, 14 Nov 2025 09:15:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpte-0000000BsRf-1E0Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36F5743296;
	Fri, 14 Nov 2025 09:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC346C19425;
	Fri, 14 Nov 2025 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763111709;
	bh=kbbz3wPLsY8nHQqv/+1SqRtx1it+jT7BWo1yvJHgzbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X6Uq+CGSHZEcFvyGEAUK4pc9y33nD+Jt6d6Ud5m2nl90pHN8xFkNSeLIVJloO1kfr
	 oAg7QzRhvlYEiN3dmhejq2EJc07MRTDkwC21KkfzJbXtp+rTwNlPOTx8jTj0JnlbBi
	 2gLqlvWOEyquRPYl9sTbJaa3Ub9A+mNOHT3l1ODPaR4Bu4GvmOKh5JWxpvnDbFubMS
	 gbr+apaUh7HffU8O4atzgS2qPZKmAPGmPifnoGW0qZ14S65qSs1C/3ukWYHrh2VvuM
	 skZmJNXmXo8bxBnny/DiciS9f8PDatyii7JrAAiy2D9M2Ot6WH/C7U9JIVfnD04ck2
	 fDHQJgQheIvsQ==
Date: Fri, 14 Nov 2025 09:15:01 +0000
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
	Longbin Li <looong.bin@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v8 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <aRbzFUWzvkiLO8wx@horms.kernel.org>
References: <20251114003805.494387-1-inochiama@gmail.com>
 <20251114003805.494387-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114003805.494387-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_011510_349118_0F508E5F 
X-CRM114-Status: UNSURE (   9.14  )
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

On Fri, Nov 14, 2025 at 08:38:05AM +0800, Inochi Amaoto wrote:
> As the SG2042 has an internal rx delay, the delay should be removed
> when initializing the mac, otherwise the phy will be misconfigurated.
> 
> Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Reviewed-by: Simon Horman <horms@kernel.org>


