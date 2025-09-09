Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1B2CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=028dhRsQ8GM4B2fby7ztoYmOKZAqFSwbDbKA0jLGDMw=; b=pEwAkEPbQGFQSZmKK7sTOgsLD+
	Y0i5W/fdr03sQAh+VQTPQk5/NzKAyCCwz+ekbWCoBPLTo4+SHb9ETi1Aro52qJ24QDFBRbSeq4Ogg
	J1J3cjWkm/aocbqRB9qEPQ4W+rUhzGu5mZx4NGBP7zgECwwoWTEXGEb2OdlGCxUAgqn7QsPneN40U
	DNr5fegWwQeczPbx403duPk3OpBhBOFIdoF1GqY1PcVmceGckEzmCfpvY3VNQIwPiwtm1mbnpw3Az
	26VyZQ/Tlu74QPOKZ42UwQGakPivjSJDgPthN6nOs5mFblyIb96VdnsFJ7e5XxnM6FJIqu20QqRHE
	IWwUfyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw26t-000000095g4-3v5Q;
	Tue, 09 Sep 2025 17:26:27 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1VN-00000008ds6-2BIG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 16:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=028dhRsQ8GM4B2fby7ztoYmOKZAqFSwbDbKA0jLGDMw=; b=FXC5hnDG2s9hgqpprduIxdl6uJ
	UKmEngI7IXYrM8IoDabkmg/pj7Dozqw4/yn0LQ1Kdgp994MDLadIRBf4b74JrguHch75+cjEe70zJ
	DSeH0rLCpI29pnVvnU57TySnyu30TnY4gUZ88Bph3LWLU80on5KV7EoQ3GgXmIDASn9TQya8Nenoo
	pku6JMb8Ekt5lYXV5KxKGW0GSkvoLD94sN29tILwS79HTRjGdtGGJE9c6UGZqHKphhYpHiyGRYQda
	hU0zntD0x7y14dUX956w6JpV1xMdJ7QidlLz/PtpTG/0q9/QZo1E8UM65AkJVhh8E6VTBYaW4HfLI
	uRZMMEMw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44316 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uw1VB-000000008VE-3qvb;
	Tue, 09 Sep 2025 17:47:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uw1VA-00000004MBq-3nnn;
	Tue, 09 Sep 2025 17:47:28 +0100
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	bpf@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>
Subject: [PATCH net-next 01/11] net: stmmac: ptp: improve handling of
 aux_ts_lock lifetime
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uw1VA-00000004MBq-3nnn@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:47:28 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_094741_558055_65C73106 
X-CRM114-Status: GOOD (  13.36  )
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

The aux_ts_lock mutex is only required while the PTP clock has been
successfully registered.

stmmac_ptp_register() does not return any errors (as we don't wish to
prevent the netdev being opened if PTP fails), stmmac_ptp_unregister()
was coded to allow it to be called irrespective of whether PTP was
successfully registered or not.

Arrange for the aux_ts_lock mutex to be destroyed if the PTP clock
is not functional during stmmac_ptp_register(), and only destroy it
in stmmac_ptp_unregister() if we had a PTP clock registered.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 69bd8ace139c..993ff4e87e55 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -370,8 +370,12 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (IS_ERR(priv->ptp_clock)) {
 		netdev_err(priv->dev, "ptp_clock_register failed\n");
 		priv->ptp_clock = NULL;
-	} else if (priv->ptp_clock)
+	}
+
+	if (priv->ptp_clock)
 		netdev_info(priv->dev, "registered PTP clock\n");
+	else
+		mutex_destroy(&priv->aux_ts_lock);
 }
 
 /**
@@ -387,7 +391,7 @@ void stmmac_ptp_unregister(struct stmmac_priv *priv)
 		priv->ptp_clock = NULL;
 		pr_debug("Removed PTP HW clock successfully on %s\n",
 			 priv->dev->name);
-	}
 
-	mutex_destroy(&priv->aux_ts_lock);
+		mutex_destroy(&priv->aux_ts_lock);
+	}
 }
-- 
2.47.3


