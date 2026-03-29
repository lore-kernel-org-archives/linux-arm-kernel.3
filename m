Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30895F3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 13:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOwPiFeHtk98f3yVo5FWd3NKyO34x2E2ZRsudEcrmKE=; b=PBO5NWweb0fdRITIRJDoJEbhpT
	2bIUziMFFZhc+9uUcP/kEDHSleJXjFA2WIYLb0utty2l/f6tAeRf1mp8h+cECq8qKF0xINsX8Uxwr
	fiOXlQ8moSXjcGf8sGQgrLTuDSTAUajHYapc6xx+Sul8PR/NzI2mpW3H0H7WTxzPFLU0dIw969olf
	Ls7eISUDfXEacOD4Op9H7tfB574zgceVdPsAuzO4JJmQroF3p75lVsg4RsYnA3oZJt1YM5ZOkb5bP
	qGDk8QilS8ZypEKsp5xHUfhSLSuiEAapkaqAhaJ+Uo/HyawsXSu0tCSNvjGfEZ6PZ/nRlc2hTTCxl
	TtXmanDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psU-00000009wog-2Eu3;
	Sun, 29 Mar 2026 13:08:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6psL-00000009wkx-2zhb;
	Sun, 29 Mar 2026 13:08:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 29FDA60126;
	Sun, 29 Mar 2026 13:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86001C19423;
	Sun, 29 Mar 2026 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774789700;
	bh=4EhZThLH7oO/aeN4dZc7bHt9j7nfkfQrYsBvUetgK48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=H58wW6ItX9MBfojrR0xjlUdD3KnMeTSkBWPW95ulvBn9jtgdtdzS3zsHhjapFH1Fb
	 pL0nKhSS5UMZRCup4AiQn9vttyMZFOOSy+Y42Iox6gWUjWjuiOX/KME4y83A647dQC
	 qKHrNA6nbWapc4yLekKrDi/QTGiYvYNLHppRJC5+ThuDpUy14oCYFVbpDrPahLxG+3
	 4Euk2Hxqo+yAPTezhxEpuLGurqW+i28Nt75piIi3FI15/w6x7zDspDCm3KThC3fEtU
	 7G/VlAjnNb/KWebtZdVcrgvS5rFMzU2n2Ao4kGSsnc2Jn+j819ERlVf5BAwqJdBHLA
	 3/XZ2kurDshDQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 29 Mar 2026 15:07:52 +0200
Subject: [PATCH net-next 02/10] net: airoha: Rely on net_device pointer in
 airoha_dev_setup_tc_block signature
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-airoha-eth-multi-serdes-v1-2-00f52dc360ca@kernel.org>
References: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
In-Reply-To: <20260329-airoha-eth-multi-serdes-v1-0-00f52dc360ca@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 Xuegang Lu <xuegang.lu@airoha.com>
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

Remove airoha_gdm_port dependency in airoha_dev_setup_tc_block routine
signature and rely on net_device pointer instead. Please note this patch
does not introduce any logical change and it is a preliminary patch to
support multiple net_devices connected to the GDM3 or GDM4 ports via an
external hw multiplexer.

Tested-by: Xuegang Lu <xuegang.lu@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 743ef0db30980ce74059dfb63553030ef3bf735f..421a154ee7189eb7919382b6cd893ae5d4e03766 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2671,7 +2671,7 @@ static int airoha_dev_setup_tc_block_cb(enum tc_setup_type type,
 	}
 }
 
-static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
+static int airoha_dev_setup_tc_block(struct net_device *dev,
 				     struct flow_block_offload *f)
 {
 	flow_setup_cb_t *cb = airoha_dev_setup_tc_block_cb;
@@ -2684,12 +2684,12 @@ static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
 	f->driver_block_list = &block_cb_list;
 	switch (f->command) {
 	case FLOW_BLOCK_BIND:
-		block_cb = flow_block_cb_lookup(f->block, cb, port->dev);
+		block_cb = flow_block_cb_lookup(f->block, cb, dev);
 		if (block_cb) {
 			flow_block_cb_incref(block_cb);
 			return 0;
 		}
-		block_cb = flow_block_cb_alloc(cb, port->dev, port->dev, NULL);
+		block_cb = flow_block_cb_alloc(cb, dev, dev, NULL);
 		if (IS_ERR(block_cb))
 			return PTR_ERR(block_cb);
 
@@ -2698,7 +2698,7 @@ static int airoha_dev_setup_tc_block(struct airoha_gdm_port *port,
 		list_add_tail(&block_cb->driver_list, &block_cb_list);
 		return 0;
 	case FLOW_BLOCK_UNBIND:
-		block_cb = flow_block_cb_lookup(f->block, cb, port->dev);
+		block_cb = flow_block_cb_lookup(f->block, cb, dev);
 		if (!block_cb)
 			return -ENOENT;
 
@@ -2797,7 +2797,7 @@ static int airoha_dev_tc_setup(struct net_device *dev, enum tc_setup_type type,
 		return airoha_tc_setup_qdisc_htb(port, type_data);
 	case TC_SETUP_BLOCK:
 	case TC_SETUP_FT:
-		return airoha_dev_setup_tc_block(port, type_data);
+		return airoha_dev_setup_tc_block(dev, type_data);
 	default:
 		return -EOPNOTSUPP;
 	}

-- 
2.53.0


