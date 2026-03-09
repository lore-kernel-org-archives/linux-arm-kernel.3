Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5438EFCD99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yui9egGse2WyJ/Faqva38aIhxCIDPEytRtxU4GnJ77g=; b=qwP9BTw8K+Oau87w3mSZzx9iVq
	20LMsPYB4VDr6stkxibYizHcFrKeDks85JEQFQpflsXPJxDpxYAeripO2CC8P1GG5R8Xs968KLhQD
	0ENPrDXU3p6VZKjpoyYzK+3xgEGj7YliPAKVggrDEEeyvNphX6qRATlthaCi9h3heaPGXtnZPCQIW
	CnBDmAWXbrV+X2oTlOzbGsLVXZhDvp8933VFs5qYnLqyGMPXfZVEHtZupebRnAfScix/XsyPsVNYv
	ym9YEDwvQnZ7/D41sLnRnOMYoQ18iEwxoGvlonqXMXDfYK9NewX6nOplVD4apHa9P7G+0NqP6/5/1
	XseaQJyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYdh-00000007AWy-0YYv;
	Mon, 09 Mar 2026 11:19:09 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYde-00000007AWY-1h5d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yui9egGse2WyJ/Faqva38aIhxCIDPEytRtxU4GnJ77g=; b=wvfZG1rjT6sX1Sw3kQvMN9aRHn
	ISBTN32eHE03RWdjodVFcW9hPL5KC0J3f3eti+P5yKxyHcj7Q9YcnyNRmSbs4sXl8bdR7BdliqJ4y
	o0oBi77ChBO9m1gWcHdT2TVaIxOgVMlvPacKhMxGkCLs1r9HsOr9wXJr4tQ/xbzJ6Dejv6PPd+Tth
	DrsjItGVepXlYJ/WCvwdWwlsSbr3WGZOLh0QCuih+H4CVlq6Zczkx4tMDpD5HxUbJO5iVvltw1Ee+
	iRuaDZ0UJLxFlzTSGReKohXXEQD2OlWnNj1kOfa4SOeOOXIf4fboTi1YM+zzwT0pidN/JwfLQZtrc
	wY2ZwMrQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47002)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vzYdY-000000003f5-0xCe;
	Mon, 09 Mar 2026 11:19:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vzYdW-000000004Gf-08bF;
	Mon, 09 Mar 2026 11:18:58 +0000
Date: Mon, 9 Mar 2026 11:18:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next v3 0/8] net: stmmac: improve PCS support
Message-ID: <aa6sofjFxyi2nkpr@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_041906_465874_C6F99EF2 
X-CRM114-Status: GOOD (  18.29  )
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

This series is the next of the three part series sorting out the PCS
support in stmmac, building on part 2:

	net: stmmac: qcom-ethqos: further serdes reorganisation

Similar patches have been posted previously. This series does away with
the common SerDes PHY support, instead using a flag to indicate whether
2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
time, I have no plans to resurect the common SerDes PHY support - the
generic PHY layer implementations are just too random to consider that,
and I certainly do not want the extra work of fixing that.

I've also changed the last patch which prints warnings when qcom-ethqos
changes the PCS state - this will now indicate in a readable form
whether the ANE or SGMRAL bits have changed state, rather than having
to refer back to the definitions in the code or the databook.

I am hoping that - subject to this working for qcom-ethqos - we can
drop this last patch in the final submission, along with the
dwmac_ctrl_ane() and ethqos_pcs_set_inband() functions and associated
definitions. This will also mean that stmmac will finally be driving
the PCS correctly from a phylink point of view.

v3:
- move printing after register write in v2 series patch 7.
- reorder patches from v2 and add a new patch: 4, 5, 1, 3, 2,
  new patch, 6, 7.
- the new patch enables use of phylink's inband mode for SGMII with
  qcom-ethqos, so the last patch reporting PCS configuration changes
  should now be silent.

If the last patch is now silent upon testing, I will replace that
with a patch which removes ethqos_pcs_set_inband() and
stmmac_pcs_ctrl_ane().

 drivers/net/ethernet/stmicro/stmmac/common.h       |   4 -
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   3 +
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  12 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  10 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 156 +++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  29 +++-
 include/linux/stmmac.h                             |   1 +
 10 files changed, 198 insertions(+), 46 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

