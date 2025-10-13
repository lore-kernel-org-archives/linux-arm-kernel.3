Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895B6CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 14:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A8vbJhez6UxT9ITmstXC76OGKsbYvqQDp2irE9U2VkM=; b=suel1tXhr3RDRk
	pIXAuK3jkyACea9TXZ4IQTzJgu2qYvVsTfs2JrlJjLsxYrtLT2eddAPzpqyW8g7vpt6fBtplaVXUG
	UfcidaDoN5NkQxROVodx4+vQhFsIjmN69VLXtwhSFM3jwu4GMoy+3N0eUyzFzBDUcFSPM51UMYNs+
	W+ojdodkgYk4FxwSeqtjRROTBdXPHQsEoZRnxauC0Pwqk6GhPFf/pEX1Fa/YM8hLhpTWffaWYO+qn
	vKpXskDq7sSArl7D/57AuMl2s0VEU9kcRT14S7D3pKaRiNne1y2fSHon4VxmiY67w+0Boesx3897t
	QaHG5GYJhazhmS1dqhGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JYj-0000000DOm3-1Vlp;
	Mon, 13 Oct 2025 14:29:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8JYi-0000000DOlt-1i0A;
	Mon, 13 Oct 2025 14:29:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CB07060279;
	Mon, 13 Oct 2025 14:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2266EC4CEE7;
	Mon, 13 Oct 2025 14:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760365795;
	bh=kC+XxfYUzP+Yf+1ScjmU9ueeS1EQBoD+QY0KhVAVO4Y=;
	h=From:Subject:Date:To:Cc:From;
	b=dEdi1VQV8xRaiCfQ2oSehyxlChzj05g1iNkyVo0jK9/HL/EVDHHhCahi2EL2vBy63
	 OvCqYj066ZfnqXc4UbW8IHwQ+GCZMxVtKKDOkLArTc+bcWKshXNph1iudFfP+7rICn
	 eQqT5hYLRIJt8SCFx0KG828x2uBKivc58DxGSQsTz11m6L5sMM2x0JZ7zEOxKM4Jds
	 WUk9FxUriAlhybA8KXj6P20U+Ns0L9A9h+ylfxBU6Ja2Vfvhph0krh+12QtswJxsUr
	 otryYNATGnKHOpYJs9CqYBsSA8QkEFoS455ws2/GIa6n3h5vnUQPTAGgaw9JFp0pOw
	 MQgLOmqwEvgdw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next 0/2] net: airoha: Add some new ethtool bits
Date: Mon, 13 Oct 2025 16:29:40 +0200
Message-Id: <20251013-airoha-ethtool-improvements-v1-0-fdd1c6fc9be1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQM7WgC/x3MwQqDMAwA0F+RnBeIZcq6Xxk7FBttYDaSFhHEf
 1/x+C7vhMImXODdnWC8SxHNDf2jgymFvDBKbAZHbuiJHAYxTQG5pqr6Q1k3051XzrUgvdw4Ts/
 gI3low2Y8y3Hvn+91/QFYNZT2bQAAAA==
X-Change-ID: 20251002-airoha-ethtool-improvements-08266c4a9d09
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
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

- add missing stats to ethtool ethtool_eth_mac_stats struct
- set get_link ethtool callback to ethtool_op_get_link routine

---
Lorenzo Bianconi (2):
      net: airoha: Add missing stats to ethtool_eth_mac_stats
      net: airoha: Add get_link ethtool callback

 drivers/net/ethernet/airoha/airoha_eth.c | 5 +++++
 1 file changed, 5 insertions(+)
---
base-commit: 18a7e218cfcdca6666e1f7356533e4c988780b57
change-id: 20251002-airoha-ethtool-improvements-08266c4a9d09

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


