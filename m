Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0703DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fq379oOiqAtrnZ+bkfMKSoTJYOqJ/R3/WeAnEYH+Yms=; b=Jw91yb2SwOAQUpUbizev7Ccy19
	TxQhLTIq6rQBhKPMEJu3fMF+5Di3oGzh+cOK6LRzn+9CVICHT9rddJMsz3mLACQH4oMhy2EbMvAnZ
	d6PCI6xp7RUXmcTxbK9DIv/VfpGMV9E1MtA5BJuu2gPd1nBmzzNoT3ZrpRzBENLcU7vcjTxF25NtK
	xkaB0mthKPd1R9qcmPjQPRnIiR2KHrIoariIMxyscdsnD6XCh6aetvZJgwSsfve64mK0j419xXZi0
	V4OzI6kn/xv61m51TkGABR3eJiCQ8SaUFXmVJ1s1zMs18ZTk+wsO5GCGRtLnBokxc50j9yIFv1BNK
	3Af768Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErsz-00000006Oyd-3vLB;
	Fri, 31 Oct 2025 16:21:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vErst-00000006Oxi-48hm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 16:21:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Fq379oOiqAtrnZ+bkfMKSoTJYOqJ/R3/WeAnEYH+Yms=; b=okGIWs0d0rRBVlo4THIcI4Yndw
	CiHGWSGVQamirayhs3edW5StzRgTkwolWHI8YN1SRf0J0EmlNpv7HywE02ZQZsZDSy4h9FCEsIb67
	ytMp1vXS2uywm9SUp1JvUd+Yy0nOwcq2/Zni6w5eE9tcv1olf1PIEdMweCCZJhIU37fc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vErsW-00Cc9X-R6; Fri, 31 Oct 2025 17:21:28 +0100
Date: Fri, 31 Oct 2025 17:21:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
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
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <651ae46b-8ca2-476a-8545-4c26c4e10f99@lunn.ch>
References: <20251031012428.488184-1-inochiama@gmail.com>
 <20251031012428.488184-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031012428.488184-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_092152_022799_53CC7850 
X-CRM114-Status: UNSURE (   8.52  )
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

On Fri, Oct 31, 2025 at 09:24:28AM +0800, Inochi Amaoto wrote:
> As the SG2042 has an internal rx delay, the delay should be removed
> when initializing the mac, otherwise the phy will be misconfigurated.
> 
> Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

