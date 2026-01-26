Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B329CF65E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 11:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eDo/t9bIKMtTAaZO5ytczGAZFxRhOK77rokq94b9fQ=; b=ZygNNudvXpAb/YW3oZFxGFjSJ/
	60bpm9hn9NRjEEDNMWmBseKXp9MeDtYyn3njXU5QGR9B+uM5Wz/j88xDlnPC68r/Ab+Cxlrh+KtG0
	6PoLw8ejoOhXJfrUJnx7UoODs9Qo61qrSDK1sDmeYsm9EwsJjW4eW9U5EBPmvGsK7tpqZG7yo/CI9
	oXTGjYlmTibLrl+QlCCZh7lFWxIy2sG/w5ndYeA5L1OVgQSjzVnwbGnCQd12ErGtLwBPrqe1a4oBi
	KfZXQaBA4OLs+MHma6D7epcXuQjIpd6UoVBtXpEzVtdhOMf29jsacSpGuf/TIKrm/jYFJl4DYH9R+
	TXZgLkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3d-0000000CSGG-0Hfp;
	Mon, 26 Jan 2026 11:47:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3S-0000000CS4u-3la7;
	Mon, 26 Jan 2026 11:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=5eDo/t9bIKMtTAaZO5ytczGAZFxRhOK77rokq94b9fQ=; b=pU7iugUWbxmbbpIfhhM4UFNt/P
	a5o12izGy6LnbKiCMY4yzdgYWkvoCcOoDhTKYI0refUI/OxqJ4w4lkyWy1774Vw8IrWErjXqBSZHz
	vF3sE4ML+nCosf5KxtDDu8OjHcaIB9lSgIKDhZ2+olpvbeGCPgqnnFoqQvqwD4u5RuRCvS4yz4L/U
	PrKMQAV7ZRv5U+2/RMGHHiaUTmae+XEhQBss0SkuIz4gH2ambG9WCl+x0S3tiSSlZBCFtc13TxxFf
	gB0Cm+za5dbrCDB2ZtT7OhsS2sgz1gnPRI2MgeGdtcYyWtS3Lp6DC6ILJjn281I8e7tY3u8npK4++
	VoK0H4Eg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkL3P-000000058hu-0OKf;
	Mon, 26 Jan 2026 11:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5eDo/t9bIKMtTAaZO5ytczGAZFxRhOK77rokq94b9fQ=; b=G9K9NzpCyrjWBJHnJGemXb93As
	YzvGQ3pmbFEyD7NzBzTBzTxqewgwN6vfhEGqa8RSHFD2GwM8wHTrvCaAyxvmIz6jtuDpwJMd0Hvkx
	Kdp/eN0Hxwd46KEltn1AbidxBInjag/iolughbIOerIW6ZaFRuiZPTVeTjzSM4tofe4At+560hFu/
	ZMENy9TOYYuwH5KOmH2Kk3Zf0HVw+bdxPVpNZinB6AbPKo5+ThTFqlwchBm6BlVoTM8pPk7jnFkS+
	bLSIE375bHaVXjpQKt0dhgydiRq6g93rVW60j7JzhszCJwRG/31XTLGka+pCGwR/CAV7tGrMtKOiW
	iLIZ1A/Q==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38870 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vkL3K-000000004jM-0hGS;
	Mon, 26 Jan 2026 11:46:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vkL3I-00000005uu4-1n24;
	Mon, 26 Jan 2026 11:46:40 +0000
In-Reply-To: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 20/22] net: stmmac: rk: rk3528: gmac0 only
 supports RMII
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vkL3I-00000005uu4-1n24@rmk-PC.armlinux.org.uk>
Date: Mon, 26 Jan 2026 11:46:40 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_114647_987890_E21213CE 
X-CRM114-Status: UNSURE (   8.71  )
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

RK3528 gmac0 dtsi contains:

                gmac0: ethernet@ffbd0000 {
                        phy-handle = <&rmii0_phy>;
                        phy-mode = "rmii";

                        mdio0: mdio {
                                rmii0_phy: ethernet-phy@2 {
                                        phy-is-integrated;
                                };
                        };
                };

This follows the same pattern as rk3328, where this gmac instance
only supports RMII. Disable RGMII in phylink's supported_interfaces
mask for this gmac instance.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index ae9df91a018d..26fc93854cb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -728,6 +728,7 @@ static int rk3528_init(struct rk_priv_data *bsp_priv)
 	case 0:
 		bsp_priv->clock_grf_reg = RK3528_VO_GRF_GMAC_CON;
 		bsp_priv->clock.rmii_clk_sel_mask = BIT_U16(3);
+		bsp_priv->supports_rgmii = false;
 		return 0;
 
 	case 1:
-- 
2.47.3


