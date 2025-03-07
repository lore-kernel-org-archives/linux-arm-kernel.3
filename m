Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E7EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWbVuIUV4GkljN1k7GKXrppH1dlxoAA7vzJpSPCNsbU=; b=X/Q2+g/MvHaN6wGNtkaQd7Ivqo
	UYG0Qae1xgq/JTmsAh7iFKvTNeIB+cmc/xdTfj8JRLj7kSQrvLRDv0bzToy6S25XRO63VEKzOwLV1
	GvE2gVVh3tw4HzXFeSqc+gtF3X9BT4vxI7Aq4IWYzJdEwVfaML2/FC31Y8FFdA1sO7Q7hRMw6JylQ
	Vme8JZ53UdzUVz8oQEqsxcGVg1HtffhUGFH38s5rJFzh3muIw8lVdeB/trIHh9R72d6EJu/0F9Tl5
	ma6iKBPiTPHErDjFG0/Ev7jiIjczarBUYez1k1mF/x7LxkhWd9aFNjEVrPfm18LMNo+AWtqdSDDO7
	RrRAdm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcQF-0000000FDrF-0Zgq;
	Fri, 07 Mar 2025 18:27:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqcLU-0000000FCvY-3voU;
	Fri, 07 Mar 2025 18:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MWbVuIUV4GkljN1k7GKXrppH1dlxoAA7vzJpSPCNsbU=; b=WMhOKhuglrHkpbV/vRsZcs+D0H
	zLiPV7i2eS2xvJsy0QnqQ6mVDhonciTp5SLpB27cs0NnxoDn3yM7TG7eV1jDuQaZdcMZhuBUn3Fsa
	qfRUokBI3yXbTHrB6OJXuykdi02AgOzdCuoESh6jeNdui4Wgbra/wOXOnnPZPiZ55dAdBo7nH54vb
	408s4a7FJoZ+suIFg0bI01v/KJv1Fg4eWSb91v6g+ab64bDZI/QjTbcCf3psM2U0ukL9L2mkjwct6
	cMr+fGCgpq9y5z7Dfqn5r7xbKtX9fAZPLc45O60XUV5vmcE0nzlnIuBWreEHZ7MNpwGWE8AywAKeg
	fJe3EoKw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53270)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tqcLB-0007sw-21;
	Fri, 07 Mar 2025 18:22:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tqcL7-00083J-0h;
	Fri, 07 Mar 2025 18:22:29 +0000
Date: Fri, 7 Mar 2025 18:22:29 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and
 php-grf during probe
Message-ID: <Z8s5ZZyTCpS9xHlA@shell.armlinux.org.uk>
References: <20250306210950.1686713-1-jonas@kwiboo.se>
 <20250306210950.1686713-3-jonas@kwiboo.se>
 <bab793bb-1cbe-4df6-ba6b-7ac8bfef989d@lunn.ch>
 <1dd9e663-561e-4d6c-b9d9-6ded22b9f81b@kwiboo.se>
 <20250307085558.5f8fcb90@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250307085558.5f8fcb90@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_102252_979577_D8C6CE98 
X-CRM114-Status: GOOD (  10.41  )
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

On Fri, Mar 07, 2025 at 08:55:58AM -0800, Jakub Kicinski wrote:
> On Fri, 7 Mar 2025 00:49:38 +0100 Jonas Karlman wrote:
> > Subject: Re: [PATCH 2/2] net: stmmac: dwmac-rk: Validate rockchip,grf and php-grf during probe
> > 
> > [encrypted.asc  application/octet-stream (3384 bytes)] 
> 
> Is it just me or does anyone else get blobs from Jonas?
> The list gets text, according to lore.

Looking at the emails I've received, some which were via the list, some
which were direct, I don't see anything out of the ordinary - seems to
just be text/plain here.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

