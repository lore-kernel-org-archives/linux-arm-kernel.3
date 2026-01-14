Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD27D3900E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTNLp10Ro+X5fPkwXrfSV4iRZlIf0RMpE69VDQnSaDU=; b=XMgwVYbqgPVDqDQGt+DPfJcCOd
	HorQ3fOafetUolKxtZRIpCNzDn3D8HTh9J8ELTFeOAZ2yq9+ex7Ue7yvx7mdGatumpTZOfPkWevb1
	zagS777vN/YAiF1Qyc1U/X5VL0n6G6rFgIG9Ikbw89rrqvbQ/cLtKKx0QV4Hwv356jPor/LPDTcCr
	nXLUIELIDCvTggrSytGCigviYhy2YrGrhR7BwpaTjVbaRNf/QXSjWrwwQhybbdPzOwhj8f70eczn6
	/PtV5VG6GCO/U9kLXoGDGpxxdKl9inGlN8TPVm89fTFo7a4pQPjeBnlKPj/MLC3MyElLXUkG8rXRs
	EwSu+h6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg624-0000000AOeg-1nad;
	Wed, 14 Jan 2026 18:55:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg620-0000000AOdj-427E;
	Wed, 14 Jan 2026 18:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iTNLp10Ro+X5fPkwXrfSV4iRZlIf0RMpE69VDQnSaDU=; b=1LhRzFKXkFPsaaOO+voWBOqmCx
	WlnkLzJfHlydzw2SupdC0FtuHxJFpWUTE3rHxleSIvoNimmsJ74c4uQvhjZ5mKgk1erkai5LToTCu
	KGmiXHFeAVwhRvi7Dr7f08JrQRzAfcc9+n1xowSCaSCfv74kEjtro56lOmizuDoQHXoweuV6H04bA
	ATi3Udti/sDsrn/o9G3B40TwksP84ndpiOAovq7FyzWG+L++U1By4AXv4Q1+iLLOGqE4SWX74XiWb
	zisnyNCoVk3fB4Ad/jxIeqn8mldsG2eB5Re8HQizk8XYDzCQuP/9mG7DR3gHc8DKVBNFTX2s9SJQa
	Viw5474Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40706)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vg61r-000000000b8-1JiZ;
	Wed, 14 Jan 2026 18:55:39 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vg61n-000000001sW-0Hze;
	Wed, 14 Jan 2026 18:55:35 +0000
Date: Wed, 14 Jan 2026 18:55:34 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 03/14] phy: qcom-sgmii-eth: add .set_mode() and
 .validate() methods
Message-ID: <aWfmpq-dJ-mUCvz1@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <E1vg4vs-00000003SFt-1Fje@rmk-PC.armlinux.org.uk>
 <20260114184705.djvad5phrnfen6wx@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114184705.djvad5phrnfen6wx@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_105549_284234_07D28374 
X-CRM114-Status: GOOD (  14.01  )
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

On Wed, Jan 14, 2026 at 08:47:05PM +0200, Vladimir Oltean wrote:
> On Wed, Jan 14, 2026 at 05:45:24PM +0000, Russell King (Oracle) wrote:
> > qcom-sgmii-eth is an Ethernet SerDes supporting only Ethernet mode
> > using SGMII, 1000BASE-X and 2500BASE-X.
> > 
> > Add an implementation of the .set_mode() method, which can be used
> > instead of or as well as the .set_speed() method. The Ethernet
> > interface modes mentioned above all have a fixed data rate, so
> > setting the mode is sufficient to fully specify the operating
> > parameters.
> > 
> > Add an implementation of the .validate() method, which will be
> > necessary to allow discovery of the SerDes capabilities for platform
> > independent SerDes support in the stmmac netowrk driver.
> 
> s/netowrk/network/
> 
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> 
> Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

According to patchwork (I forgot the RFC tag on the patches) it needs
linux/phy.h included. Plesae let me know if you'd like me to retain
your r-b. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

