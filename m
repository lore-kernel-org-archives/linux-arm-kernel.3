Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D32FEE4E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 12:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yqjbNB/XsfYwXuWOSP8lMuHZBkrqY+ro88mw9LfBzo4=; b=hNyMytWIbVsb8QL/r45JGtOGML
	+MzSz6xu9NzguoIdy0dUqCctTXZSiloc4VL5flfhGvnG3nWSIo1I8v+5z+lX9Q/6xNDpNSOAU1AH9
	f5fKvpSAcqs8d7zvYQY6uldwVVoKfDzhgqN36Mo0jhJFocBTDpRCSc++/u/OJu2jbIio2O0bRwIJK
	wu82mwc2HK/NF3TkfYELIzruUIMIeXexHqb5gN9ysX4uYYA2UwHg2VKZ7nnyf5PIP4BAbE/BAZm7D
	UNT/71Ky0MM79aqUppZqZanGCzhpopsHLTjPFayCtygizL/4EShzYER1RYT8t5XZ+bjuFbrwU2mLC
	urtHvRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJJQ-00000009pKw-1oTm;
	Sat, 28 Feb 2026 12:20:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJJO-00000009pKi-3Zsl;
	Sat, 28 Feb 2026 12:20:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B90476001D;
	Sat, 28 Feb 2026 12:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC11DC19424;
	Sat, 28 Feb 2026 12:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772281245;
	bh=XIWu8pVNZqGo5T8Mi5TvCmyxj2UX5isJ1r649II4YGc=;
	h=From:Date:Subject:To:Cc:From;
	b=YJCVLLOvaG0vBS+h9Gw34jdd164fJQJj0T56BnTYHo0raVj4p0biZQZ/ynQFMHQI9
	 nDejSKePPOoPW+U5HIJPfJ76XyB9cbe22p4S8tD1sG7iV+lxRVNqwGKyYbd7mC+IA+
	 TJx8zZyvlVD1CyjzX3Q2xUqeJBwd39wVIMzRpUX25DS2QiU72aCYC+HnWejjWxhc1m
	 wblqClO3nIsmYBkzPexh7g9+HuAmFtMCLcJ1fr2iiPJsIR+RrRrA3vWwmSCaC3C1bz
	 4XKVct9K4GfOdRN6/KdlQh+B9lUfoY+deaX6UQeNjCvSS6tlr0isPqlYqj/ztezeNN
	 6+7tNTPicIeTw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 28 Feb 2026 13:20:33 +0100
Subject: [PATCH net-next] net: airoha: Fix GDM2 loopback configuration for
 USB serdes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-airoha-fix-loopback-for-usb-serdes-v1-1-a94be0f897da@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NywqDQAwAf0VybmA31O3jV0oPUWMNLUYSLAXx3
 116HBhmNghxlYB7s4HLV0NtrpBPDfQTzy9BHSoDJSqJ6IqsbhPjqD/8mC0d928czXGNDmtrkEA
 ql8Qpn0u+tVBDi0vV/5PHc98PW9URsnQAAAA=
X-Change-ID: 20260228-airoha-fix-loopback-for-usb-serdes-2670a0146195
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Flow Control source port mapping for USB serdes needs to be configured
according to the GDM port nbd parameter. This is a preliminary patch
since nbd parameter is specific for the given port serdes and needs to
be read from the DTS (in the current codebase is assigned statically).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 10 ++++++----
 drivers/net/ethernet/airoha/airoha_regs.h |  5 +----
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 3779f93b47bc13ae21d4ae088dece4712dc214e5..37fc2b33d3af8a190a74efc69ed54f163afa6412 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1729,10 +1729,12 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 		      SP_CPORT_MASK(val),
 		      FE_PSE_PORT_CDM2 << __ffs(SP_CPORT_MASK(val)));
 
-	if (port->id != AIROHA_GDM3_IDX && airoha_is_7581(eth))
-		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
-			      FC_ID_OF_SRC_PORT24_MASK,
-			      FIELD_PREP(FC_ID_OF_SRC_PORT24_MASK, 2));
+	if (port->id == AIROHA_GDM4_IDX && airoha_is_7581(eth)) {
+		u32 mask = FC_ID_OF_SRC_PORT_MASK(nbq);
+
+		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6, mask,
+			      AIROHA_GDM2_IDX << __ffs(mask));
+	}
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index ed4e3407f4a0e8b6a630ea1213ef155604479b66..29878b954c77c79ae45e63357840a10c23c517f2 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -376,10 +376,7 @@
 #define SP_CPORT_MASK(_n)		GENMASK(3 + ((_n) << 2), ((_n) << 2))
 
 #define REG_SRC_PORT_FC_MAP6		0x2298
-#define FC_ID_OF_SRC_PORT27_MASK	GENMASK(28, 24)
-#define FC_ID_OF_SRC_PORT26_MASK	GENMASK(20, 16)
-#define FC_ID_OF_SRC_PORT25_MASK	GENMASK(12, 8)
-#define FC_ID_OF_SRC_PORT24_MASK	GENMASK(4, 0)
+#define FC_ID_OF_SRC_PORT_MASK(_n)	GENMASK(4 + ((_n) << 3), ((_n) << 3))
 
 #define REG_CDM5_RX_OQ1_DROP_CNT	0x29d4
 

---
base-commit: 621e3634dfab890e8d97e082588b3d6d6d688d91
change-id: 20260228-airoha-fix-loopback-for-usb-serdes-2670a0146195

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


