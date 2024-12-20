Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419AAE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g9dJf4L0++WPDZDbpjztD+8tY61PcfJag/zyrPkxhcM=; b=EWZcGkV2swbLYQtHu9WPW2mKxh
	HbvE4dMJ4qjtZSCy21faf5Zh0GQVVEhfqtpkKBGOfw9MBLwEFjemqacX20yyOP26RYlzG6mqMTwFt
	6U7fkK2Xnx4jpQcN42q61JH+Q+r/P0aynSoIVfwz+E5s5ckDmSVxvLZs1xRe7mZEN+QFDXuHCNj6I
	jsGZ/RUBIum94/qMnWVz9ec45xPRNNNkEt5oMAgMdcUV7wSCz7EeRFPBFGoP6d/thEJf6Fua3WwsE
	KFvaMwq/0ajbjIlYB10EVDhlBG828iLdgGPpT4pXQNr77b6hU/h/E+vQ6JLtagsBWf8mLUyIxSlzF
	9hZdAMuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdU3-000000054Fd-1wtc;
	Fri, 20 Dec 2024 13:56:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdNm-000000052yZ-2SKO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734702575; x=1766238575;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=lemXgBt8K5epQpEb61dWKaVFgFUFmL4Rw5o+fkyVr/0=;
  b=JaVutL27tALyrFgAQYSG79wF78E3CVoBvvLCcHLczU2oL3vVrsKviUtI
   SyTCCHrh1PfscUpHQrk1q6L1iRuNoQ1XT4h9d4eb7igBg654opfhCObPD
   uyhNkBjyTQXNmzCYoyNije7SVFNdR+aNMQ2db+Enqv0umSk8ZY8C6xJDN
   dHSjSDlOLuS+wZttgP1m15BIaC8Vree0o73kRFtfsGvErJD5iI8KE1D6D
   +rZaRfIAIkOdrk2QbHVZEug5thMu0WdvRYlNDzbjUSaCsZ025G5DhbozM
   5quFKEX5rlhRdokDDwZIpIQUuWAjd4/kA9gabxSO4nAcobJEEuqhdOxw4
   Q==;
X-CSE-ConnectionGUID: mIAoSPyhQLi+IAfuQfXUsw==
X-CSE-MsgGUID: NrK3wFoBSpiFGbmNu+VlEg==
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="267028403"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 06:49:34 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 06:49:11 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 06:49:08 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Dec 2024 14:48:45 +0100
Subject: [PATCH net-next v5 6/9] net: sparx5: verify RGMII speeds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241220-sparx5-lan969x-switch-driver-4-v5-6-fa8ba5dff732@microchip.com>
References: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
In-Reply-To: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<robert.marko@sartura.hr>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_054934_632955_3C511F7D 
X-CRM114-Status: UNSURE (   8.30  )
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

When doing a port config, we verify the port speed against the PHY mode
and supported speeds of that PHY mode. Add checks for the four RGMII phy
modes: RGMII, RGMII_ID, RGMII_TXID and RGMII_RXID.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_port.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 0a1374422ccb..86d6c9e9ec7c 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -257,6 +257,15 @@ static int sparx5_port_verify_speed(struct sparx5 *sparx5,
 		     conf->speed != SPEED_25000))
 			return sparx5_port_error(port, conf, SPX5_PERR_SPEED);
 		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		if (conf->speed != SPEED_1000 &&
+		    conf->speed != SPEED_100 &&
+		    conf->speed != SPEED_10)
+			return sparx5_port_error(port, conf, SPX5_PERR_SPEED);
+		break;
 	default:
 		return sparx5_port_error(port, conf, SPX5_PERR_IFTYPE);
 	}

-- 
2.34.1


