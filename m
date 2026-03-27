Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B83710BA44F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JlF/V14PwB75IsbEuhaJfwWNwWzBEh6C98Euf38uuoQ=; b=WQoyxRhgy9jzVvi6Jd4S06YoA9
	evnUT8qZVrItfQfPKCbpKECgIT8gVmJOsbkYrUwrsC/mpbjPGbHRcwWp7y6VjCFvfwCAFG9So+Y7i
	b6qNuJgR+FrKLJg307A1JBuXEYYMZmlISdQvij6gu9YN9nwq56OOVK86aO4qiQ0LNegsh6npwBSvK
	EuVEYmI3oCUiELhptlxB/dyrB8oPNtCQ4U9Iyp//HgKyW2exw8k0ui/4ZLy7DlpwHhir3mc8dKULW
	QCC0b/9ZRMHH0fD2f4b40kLb/997ntlYUpF89fLrc6t6rkpby5EhTogUwJwY2G5zuHFwBGByZqRoh
	zH0XeEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62oP-000000070Px-47Xv;
	Fri, 27 Mar 2026 08:45:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62oC-000000070F5-3B0p
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=JlF/V14PwB75IsbEuhaJfwWNwWzBEh6C98Euf38uuoQ=; b=jObrkTe0tH9vhgRNb6Q0frjCtC
	yINzZ/5TL5uWzkcHxEoJnhuo1pPcMFA4FH/TxXYxRKWXtWd508ayBgA50YF2Xf1sOyOmX8jIbGOfR
	1SDaS463wEDbXeHzzFBDVZpsrLizipwUs7nMOkjZp1fap4Ti1+pp8iPT8IVWMkq5G/51dcTn0v5mj
	b6eRqAIBKQ4QnwLBKNbi6w1hCfp2/9fxZrmiDraQUnG7y1lzoqzNCPKp6sUJhdoGHGA9KT2NdV/fC
	OK1YVQUOwNxPA66HsstZT+PIpmd36MKa+xbRxVXY3ZmOrhQgnQ3wyW5Bad7d5wmmPSzXK/KJk4g7G
	1lBtbAJQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62o9-00000009zyj-2dAW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JlF/V14PwB75IsbEuhaJfwWNwWzBEh6C98Euf38uuoQ=; b=0RI78cVQOFbDkwM5SB0Kga7EPE
	YwEVJ1p5CZaWpSZDXommseI6/EYomQo72SXo5S62kdRyWZCsKruRANJUx7L/pZ9e9f19ls1Ty85Lp
	Nn90d9CV4MTpzUWHe5SmSuOWH1XujzWfPzKBwboCzM3Jv7nhvWqMiH9lTQ4CRSARpJo4bhedB7wwu
	hH8nLEs5ZUeFWaWIpgrx89vzczjN5jzXAA5nQEBVOZeVH9yH4KpF1C9FCQbfSiyqAM5PioVuUoz5/
	7iF5CAnVO3+j9iEt2PZr3fM4fCP+UaOTI1RpYNWMHxwrI/fnj5jQBqrJtx3JIxc3wID8hcPhSHLT4
	t3I0Uc+w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51102 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w62o1-000000005sI-1Sah;
	Fri, 27 Mar 2026 08:44:37 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w62ny-0000000E3D8-38Yp;
	Fri, 27 Mar 2026 08:44:34 +0000
In-Reply-To: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 14/15] net: stmmac: qcom-ethqos: correct
 prg_rclk_dly comment
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w62ny-0000000E3D8-38Yp@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Mar 2026 08:44:34 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_084446_053733_61AC7F9B 
X-CRM114-Status: GOOD (  10.78  )
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

The comment for calculating the prg_rclk_dly value is incorrect as it
omits the brackets around the divisor. Add the brackets to allow the
reader to correctly evaluate the value. Validated with the values given
in the driver.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 9dae40c27903..667676c29a95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -450,8 +450,10 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
 	} else {
-		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
-		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 / 2 * RX delay ns
+		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT /
+		 *  (2 * RX delay ns),
+		 * in practice this becomes PRG_RCLK_DLY = 52 * 4 /
+		 *  (2 * RX delay ns)
 		 */
 		if (ethqos->has_emac_ge_3) {
 			/* 0.9 ns */
-- 
2.47.3


