Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3432EB7ECD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q0H9URFaOl3dJ+a7zQ7u6O8wxYctps5ElYmjBdzE7uk=; b=JD/81YZeGwPtMP079ijcrhfVh4
	mBGa5zHWjfjlk5P0LJhU8F6WjPKv0vzx4PsW3vRwHmKW0wM8NyK01we/78zx+mk0EDv+eSSGDMtnL
	nhGVcXuPMXFi6/Be1N5DDx9CDndIjQVQHGBKCkFAkHC6MHf/jgdnZM06YpB1xThLxf3iKBWogdyz0
	pGj36xPMo1QHDTmVUxGKIr1V/z0vtdaCqANYL0pM11WXHebJnOcLzADJvepQpS7Itrc5Cd4bJIQb9
	A9mWEZFnMBcyOlGUq3klEsFfQQQ4Na8iz/UyQ1ZExBce9n3ofqkfQ97iK7eyxZc6DZxIQC7y/EuXe
	wopM/BpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjuc-0000000H1lN-33hr;
	Wed, 04 Mar 2026 10:57:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjua-0000000H1kk-0VDS;
	Wed, 04 Mar 2026 10:57:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E8E1F40300;
	Wed,  4 Mar 2026 10:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77182C2BCAF;
	Wed,  4 Mar 2026 10:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772621822;
	bh=z6mlT/VdSmy3w+18qyHEGpPhQGLQO3j1yCyXX/Y2eZ8=;
	h=From:Date:Subject:To:Cc:From;
	b=k8s2eZLuB8Bi/WwIKoUVlSSbxaGR1HjVmKVaf8cSv+gYS8hub+ZckPZyRRuLl4yeU
	 987rkykVdsoLKX3D4mF/YBvQJ/Xg4WIAWrMrIgdLsufvrTkIPM8XV8xHKD5OhLLwfd
	 xqrQDuNH1RdpYcK9bDRkg6xK0MFaVwJ4j77UepEhEyx7TgJQn1WTKnKIrt3KRC5pdg
	 UkOUikktLorJAt2mwfohWGMT7jrG6Or2/dWdNEHE/6LLOgpbK3R6QAuVPpQ7ogEhY6
	 ebsFD8EU8RjJOib2TsNg/Jc9XWWnleTSWCq9a82M8QqNgeGAvY129ftm8305r3aqrM
	 ua7rn5x00/vxw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 04 Mar 2026 11:56:47 +0100
Subject: [PATCH net-next] net: airoha: Rely __field_prep for non-constant
 masks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-airoha-__field_prep-v1-1-b185facc4e2f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G+jiAn5FpJQaNSBtSUEE8e8Wj
 zMw80AhYSowNQ8IXVw4xQq6bSAcPu6EvFYGo8ygrOrQs6TDo3Mb07m6LJSxp74b9aiDtQFqWeX
 G93+dl/f9AMLy3DNlAAAA
X-Change-ID: 20260304-airoha-__field_prep-5e547171c33c
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_025704_185590_79F65EC0 
X-CRM114-Status: UNSURE (   9.62  )
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

Rely on __field_prep macros for non-constant masks preparing the values
for register updates instead of open-coding.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 3779f93b47bc13ae21d4ae088dece4712dc214e5..09acbe6695368132ddd92c3501f8711476db73f6 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -1727,7 +1727,7 @@ static int airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
 	airoha_fe_rmw(eth,
 		      REG_SP_DFT_CPORT(src_port >> fls(SP_CPORT_DFT_MASK)),
 		      SP_CPORT_MASK(val),
-		      FE_PSE_PORT_CDM2 << __ffs(SP_CPORT_MASK(val)));
+		      __field_prep(SP_CPORT_MASK(val), FE_PSE_PORT_CDM2));
 
 	if (port->id != AIROHA_GDM3_IDX && airoha_is_7581(eth))
 		airoha_fe_rmw(eth, REG_SRC_PORT_FC_MAP6,
@@ -1781,7 +1781,7 @@ static int airoha_dev_init(struct net_device *dev)
 	ppe_id = pse_port == FE_PSE_PORT_PPE2 ? 1 : 0;
 	airoha_fe_rmw(eth, REG_PPE_DFT_CPORT0(ppe_id),
 		      DFT_CPORT_MASK(port->id),
-		      fe_cpu_port << __ffs(DFT_CPORT_MASK(port->id)));
+		      __field_prep(DFT_CPORT_MASK(port->id), fe_cpu_port));
 
 	return 0;
 }
@@ -2138,7 +2138,7 @@ static int airoha_qdma_set_chan_tx_sched(struct airoha_gdm_port *port,
 
 	airoha_qdma_rmw(port->qdma, REG_CHAN_QOS_MODE(channel >> 3),
 			CHAN_QOS_MODE_MASK(channel),
-			mode << __ffs(CHAN_QOS_MODE_MASK(channel)));
+			__field_prep(CHAN_QOS_MODE_MASK(channel), mode));
 
 	return 0;
 }

---
base-commit: 4ad96a7c9e2cebbbdc68369438a736a133539f1d
change-id: 20260304-airoha-__field_prep-5e547171c33c

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


