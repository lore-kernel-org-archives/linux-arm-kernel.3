Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E30CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 00:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5vzd0Jaj6VAF2WEn3/n39Izw4RyCcWn4YeDfe2RhsE=; b=0QnVfaTEabr9bZpGMUCHQz0gaC
	e2ZBqL451o7PNBPmLtBAGJJYLRJKgnevbx4ewSBUjVIhiiDca7Q2QjDtksWXE9rn5zGY6y0CWN1pz
	+OB1PuUUjJGYtxe1k6fM+CU4jqgOSerY/8hX8DX/Jqz/BLvpluWaZEzoSrox1nBo5JHe00/o3zJ8W
	ymxcM234rOldzS2nikCPmgCs0NAEMjFe/xsY2Z6NlK6lVShQHYUKGozod8nDZ2L+vy4EBJQlCecIR
	VbLNAZrGoSSlqS/CNSG85FhSHqiPhgYMjlzex5yrQlfxVbochX15VD6tG+auz2dNMRu/EhHdhNg9x
	HPSZWZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtfP-0000000GpTt-1za3;
	Wed, 29 Oct 2025 00:03:55 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtfJ-0000000GpOF-1otR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 00:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=S5vzd0Jaj6VAF2WEn3/n39Izw4RyCcWn4YeDfe2RhsE=; b=rfUpoI6yiT9hLvLuKG2HkiCvpt
	x/OnG1UYZr3Zj1gJw2GysISE5BYkW+OatHVBWjiMkxgldxHtRWGiZ0MBq53stLup/1zfcijVRhbH+
	RvfmSp71nqn3Ehc5Dex3BV5WaR0rZ8dOwp8BYv2BKWzNfUqz3MyV77bOUp9NnAO12TL/mZ42jGYUA
	Bh8+uqJd63oUIU2V8tJRcqiR5GgGbo+/6zQeyAcjGxz3tJU95vVQZoZkinK6xDHgZLISiXtxntpfv
	4IQVqv0B4IRdZaj3/pdS4OHgiMkXfDLtQ6CT6Hm7F1hNgbDfT1EWONRw549S0kR4j7Up30tp7rxfl
	jUDyoTkg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44818 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vDtfC-000000003iK-2Xhz;
	Wed, 29 Oct 2025 00:03:42 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vDtfB-0000000CCCR-25rr;
	Wed, 29 Oct 2025 00:03:41 +0000
In-Reply-To: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
References: <aQFZVSGJuv8-_DIo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH net-next v3 7/8] net: stmmac: use != rather than ^ for
 comparing dev_id
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vDtfB-0000000CCCR-25rr@rmk-PC.armlinux.org.uk>
Date: Wed, 29 Oct 2025 00:03:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_170349_472655_4D3F4FD5 
X-CRM114-Status: UNSURE (   9.95  )
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

Use the more usual not-equals rather than exclusive-or operator when
comparing the dev_id in stmmac_hwif_find().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/hwif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
index 892cef79c4d1..e1f99b9d9d7f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
@@ -314,7 +314,7 @@ stmmac_hwif_find(enum dwmac_core_type core_type, u8 snpsver, u8 dev_id)
 		if (snpsver < entry->min_id)
 			continue;
 		if (core_type == DWMAC_CORE_XGMAC &&
-		    (dev_id ^ entry->dev_id))
+		    dev_id != entry->dev_id)
 			continue;
 
 		return entry;
-- 
2.47.3


