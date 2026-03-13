Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695FD105F78C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 12:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5Zoz41AgUppJCM7dJNs79i8XgBzueAV/7XPUocAqnQ=; b=3TQ0WgWWQOAshs6smt1vADqgkI
	rZ3OTbvlJhsex1cft5ZoVHJitZcFsyzLarmOeIFuVXffN1hc/PV7rHmfhBkRdhjaUCEH5r87tHzqh
	boJ85UzUd2A+bgJuf4HH4sCwvaWVCkT55JirTM1kMkGUEOLwtNKLtlFoRiVMOQLm1TL4zIoT18m6X
	U8DEbAb50IZC1njL3uRHlGhHvS6waY9Igs23IX8zJy597Fr197RPSjNgd2j1Efwpf+bbFB7mMyuet
	ex2KcM5vISFkez0zho3tNiaBx6DaHJity3gykbuiV9vV8ct5hWAQcsLBOwmv+7EwDuV3LGuQHhlP2
	wJyoRmjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11dw-000000006p3-0xvJ;
	Fri, 13 Mar 2026 12:29:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w11dt-000000006mL-0x6Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 12:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=J5Zoz41AgUppJCM7dJNs79i8XgBzueAV/7XPUocAqnQ=; b=ATv3EgJvfcIk8EFRUMOFlRUbob
	itDse5dUHSK6N35yuV5fNtEaG8fAp4MaQQoVmLc0SWXspIT2ZbXpAg5twqdHYa3S3eECAAEq8zRvw
	Nbfk/N7Ies2kuo9WTOG3iCvdaZldUhOZlCoWGQFvSsGHjxvsHLW0aFHw+aHR+k4T2BbjbCi/25geV
	cA+P1WqWwYe0fbQrfjBI7tF3np1pxfHyoPGhUDji1tPmbLb40Icrb+/fcnGr1zBJIdkhYXuxmJgqP
	CgyJ3pIM4JZPR3OyO5fEDSuC7UHbeEc7pia5xBBq6Ng+6baZ4jrvxf4EzuGXIn9w30dcCvvxj+6Jo
	hgO78+RQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55750 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1w11dl-000000000va-2B9n;
	Fri, 13 Mar 2026 12:29:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1w11dk-0000000DEiM-2Bad;
	Fri, 13 Mar 2026 12:29:16 +0000
In-Reply-To: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 5/8] net: stmmac: qcom-ethqos: enable 2500BASE-X
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1w11dk-0000000DEiM-2Bad@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 12:29:16 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_052925_269698_6B41A313 
X-CRM114-Status: UNSURE (   8.78  )
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

Enable 2500BASE-X support in qcom-ethqos to support the 2.5G speed with
the integrated PCS.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 3ccf20fdf52a..f0e7a060ca73 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -828,6 +828,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+		plat_dat->flags |= STMMAC_FLAG_SERDES_SUPPORTS_2500M;
 	}
 
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
-- 
2.47.3


