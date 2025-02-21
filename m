Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E831C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZN090mxAPz84RAmjDf1ffqgTe4ng9t/Mi1/ZHq++UpE=; b=MuTNf+N3tTNEHbvjBYtdHvUHqJ
	zt1Ft5rdf4mtFTrNTyLPh83uzRvbViocAhus10Uf8QAU9RCYHxda3eH7YsnufepGHaMLAhCIWrZXO
	wPYibgQ70oSETEIUbo1W1VR8+86TqvkWIVgH+0+FKu00QjBLGermF7v9ADv2UlxNvxjEKF8kMGgZ3
	dYtKYRkNpcny2zVSumAHywJSl5Npp2QPrsW2JshY4Nm69s4SEmRtzsXCPilAUXHMe4A6ep1i+XCR0
	2CJ2U5k3uu9pGcncUAJPFVYkVPE59bWrG4yQzMZH7drX1xHmvSHX9JMMjzarZR9U4nBWlkpcwABM6
	q6HHUWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlU8p-00000005qM0-1oWD;
	Fri, 21 Feb 2025 14:36:35 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlToR-00000005n4z-2ei5;
	Fri, 21 Feb 2025 14:15:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZN090mxAPz84RAmjDf1ffqgTe4ng9t/Mi1/ZHq++UpE=; b=0/Sbe6zBOF5wWfA8ZGcllkkHOu
	tAQPGfV0LWLk2aLeX2iOW3NchjXJWQjzLAX652zVJ8XRPNZc6RRylLZVEzVtOfzgC9GgS5bxFd0WC
	TyG0hSJXiSZSnId8QQCxJVWSdnr1ccNyBUxwUx0Wsbxx/C06VxWuEhNFProVooYVF1ShrIV7i1MK8
	An9WxG+DHPwaJGy8aCFnKRKK0unAJjNtjvSfjl1/AKDj+Ie8ttmp2B+12n5mUEaV0gG5nJ5hFmGEM
	ln+zk/UrQfwec/G+KuVUJakLk7zIqlAG/lv3zM2UoOrSb/ooFhNywzerlCXYNVMnb2+tfUS8S9WuJ
	ZhqypXRQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33718)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tlToH-0004nV-1b;
	Fri, 21 Feb 2025 14:15:21 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tlToD-00023s-0v;
	Fri, 21 Feb 2025 14:15:17 +0000
Date: Fri, 21 Feb 2025 14:15:17 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>, Eric Dumazet <edumazet@google.com>,
	Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/2] net: stmmac: thead: clean up clock rate setting
Message-ID: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_061531_668338_EF5657A1 
X-CRM114-Status: UNSURE (   6.54  )
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

Hi,

This series cleans up the thead clock rate setting to use the
rgmii_clock() helper function added to phylib.

The first patch switches over to using the rgmii_clock() helper,
and the second patch cleans up the verification that the desired
clock rate is achievable, allowing the private clock rate
definitions to be removed.

 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 28 ++++++++---------------
 1 file changed, 9 insertions(+), 19 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

