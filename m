Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211CBCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 20:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8BE/inF98kPrlo4jMfLeCVrWalnzfK85oql9uKs5zs=; b=RKESOX4sytL4lvOP5xIaggawMQ
	vMY65pelNMwpcY2csWzyZzrAHVEmOVqzIBqqvLmsO4j4fiBunQ+gRBNHXN46Nm2gvg2nmHGgBOsu+
	KIO3sxU60otu8eovNm4rC6oYyZhOK5rz47FGNFgzh4ofKTcEWtcCDI1CeSHWZXbbGbkHBsUSJxOS+
	RnOCx1EH77YuXS4NH51c2YeKYPr7vRpN+zP+F90oBeZc8OMWCPFN6Rn7VrUYf2YJqplJV5C5XRehl
	S1Zu3s8ov8gDfIAWw15Kcc8vFzt7C/chhQVKUVOmakt5/wZdqAaKT6xt/3a9pJKNdnKDsbKWUdtzj
	gBKXUXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vADnZ-0000000ARft-1O6q;
	Sat, 18 Oct 2025 20:45:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vADnX-0000000ARcw-2HHQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 20:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M8BE/inF98kPrlo4jMfLeCVrWalnzfK85oql9uKs5zs=; b=w+wfa6nn9XaNfQieOBRXpVCGS0
	KIocCTz6+kVqACoV8E+DfvOZD9Xn+FRup0EJo1XSE0ldg1snzcKwQlVWCd0/w5tZg16xpoBIgLvRg
	xCppfZ3PimGE0EKsdpfg6h0MjrjihSX1WKdP1vruH/pmu8KY8rh7b2N1ttfhMEBPB+2A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vADnH-00BOap-4N; Sat, 18 Oct 2025 22:44:51 +0200
Date: Sat, 18 Oct 2025 22:44:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 net-next] net: stmmac: mdio: use phy_find_first to
 simplify stmmac_mdio_register
Message-ID: <d262d94d-219f-4f8a-95c0-7867a8f2ad93@lunn.ch>
References: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20ca4962-9588-40b8-b021-fb349a92e9e5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_134507_577368_2FFB581B 
X-CRM114-Status: UNSURE (   8.77  )
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

On Sat, Oct 18, 2025 at 08:48:07PM +0200, Heiner Kallweit wrote:
> Simplify the code by using phy_find_first().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

