Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F46FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mXaopxgAUyb+dYnMEPNpUoPGlTbsAgez8gJglbBR/V4=; b=45bzj6zv2IU53taSdkFZhZgnPK
	EQNjg4ylCbw6W+eGvbrS6famofB5wM+Jr/C7ZM1yjD6AlvAq3KPNWmd3HYAQ/ENGpw2vnDKapd1YE
	Nn8JWFaVbCtD7Jl3CHlhA9mEwLzQVNqwv03HlZrg7A4jPfoCoVFwezH+MmeiDweDe/mbaYogR++rb
	lycATX/noDg36OYTx2Ae7u5SIiMjprdh+67sE6EGbrGYfcY+SBKufx8PbmQjpJczSM8RBXenUECyD
	VtniHHbmgcAqa3MQD68NoN7KXxMULqSEPshHFddCWYRWXFRWBZPbr8zzs0c6ngdJXxnIyCiVePBKs
	1cQY2Vgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgio-00000004eKH-2iMt;
	Wed, 20 May 2026 13:12:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPgil-00000004eJR-3IvB;
	Wed, 20 May 2026 13:12:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A9B043F46;
	Wed, 20 May 2026 13:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847B31F00898;
	Wed, 20 May 2026 13:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282743;
	bh=mXaopxgAUyb+dYnMEPNpUoPGlTbsAgez8gJglbBR/V4=;
	h=From:Date:Subject:To:Cc;
	b=elEBtTCQH1mi0PXwjMq+KplsaUDqZ34YzS7/kBjyNcBpBUZIo6vhFsKwnbkVGPM0r
	 TTc2GmfzGKZmrT3Nt8Fi3F8KUHeWIcZZoQr8C2OTvX389ftTiJKcjUAukJhneGBC0c
	 ey63Rnw/c1jtuyQWQhDVF7BcnBSCVz662RQTQHSUFtDgNNyuqvPWcm9TCLcFSdEh8w
	 HYcmypdLkCgra5jEtHQdoPPmtvxemU74V39vlH0oRWtpdc18EUy1lSKl+U1sCy68FA
	 59n3ASXC5IKfVWTuVrIxwAEkZNMTiW5DKWwpDPaAcKJgol3vuu7Q+ILwSExbhO4KLq
	 cS3KtnflTs6Gw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 20 May 2026 15:12:02 +0200
Subject: [PATCH net] net: airoha: Disable GDM2 forwarding before
 configuring GDM2 loopback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-airoha-disable-gdm2-fwd-v1-1-1eeea5dffc2f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqEMAxA4atI1hNoi3/MVWQW1SQacKq0ooJ4d
 4vLb/HeBYmjcoJvcUHkXZMuIcN+ChgmH0ZGpWxwxtWmcga9xmXySJp8PzOO9HcoB+FAYltpqBQ
 rkOs1suj5njsIvMHvvh/BzPOAbgAAAA==
X-Change-ID: 20260520-airoha-disable-gdm2-fwd-cdf18f7d4f1f
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Madhur Agrawal <madhur.agrawal@airoha.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_061223_852387_FC867CA5 
X-CRM114-Status: UNSURE (   9.25  )
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

Hw design requires to disable GDM2 forwarding before configuring GDM2
loopback in airoha_set_gdm2_loopback routine.

Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
Tested-by: Madhur Agrawal <madhur.agrawal@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index d0c0c0ec8a80..cecd66251dba 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1793,11 +1793,8 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	u32 val, pse_port, chan;
 	int i, src_port;
 
-	/* Forward the traffic to the proper GDM port */
-	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
-					       : FE_PSE_PORT_GDM4;
 	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
-				    pse_port);
+				    FE_PSE_PORT_DROP);
 	airoha_fe_clear(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
 			GDM_STRIP_CRC_MASK);
 
@@ -1815,6 +1812,11 @@ static int airoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 		      GDM_SHORT_LEN_MASK | GDM_LONG_LEN_MASK,
 		      FIELD_PREP(GDM_SHORT_LEN_MASK, 60) |
 		      FIELD_PREP(GDM_LONG_LEN_MASK, AIROHA_MAX_MTU));
+	/* Forward the traffic to the proper GDM port */
+	pse_port = port->id == AIROHA_GDM3_IDX ? FE_PSE_PORT_GDM3
+					       : FE_PSE_PORT_GDM4;
+	airoha_set_gdm_port_fwd_cfg(eth, REG_GDM_FWD_CFG(AIROHA_GDM2_IDX),
+				    pse_port);
 
 	/* Disable VIP and IFC for GDM2 */
 	airoha_fe_clear(eth, REG_FE_VIP_PORT_EN, BIT(AIROHA_GDM2_IDX));

---
base-commit: dc416e32baaeb620b9809e9e25fc7b30889686e9
change-id: 20260520-airoha-disable-gdm2-fwd-cdf18f7d4f1f

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


