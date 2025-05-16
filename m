Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3504BC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CTrlbuanFyRYP8wNPJ7FA8ANvKW2uh8AIezRY3E94Go=; b=2p4ZmMdF/uPM0q
	1p9iFUILHFS/BOidlwx+dRcDhRtmMGW47JpbSPjGN8ePVgqFm35HHmtLpbqdfCXt2iA1D42+Xi4mB
	gDplOFUaWPAMuoMhFxKjD+A5jOznVP3AcSna/JceTwfG34Ec/tlpXG0JzRqPbDNgTnROQGPAJKtyk
	ECIONlTxL7obzFbFUO0Rm6sJrVAClAEQVWxKdCTF83Nh1xr24oPwnpBxRQSop15g2pcvr84Qjlxdd
	ROmJZML0PKAPQAoZ0CjiYv71fW+Tg2uHvHCwtklFxsU10xKbJmtUiK389kU/cG+azK/BG85PZcKSV
	AOFeRGFcdjcIReWs08xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFq1l-00000002jqN-3VlX;
	Fri, 16 May 2025 08:02:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFpzd-00000002jUv-16Ct;
	Fri, 16 May 2025 08:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 63BDB5C4278;
	Fri, 16 May 2025 07:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D84B4C4CEE4;
	Fri, 16 May 2025 08:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747382432;
	bh=kgZ2vse2jLZoLmPeQGmJgqcIfaqnsw+PumeT+CIMfwM=;
	h=From:Subject:Date:To:Cc:From;
	b=AeghaOav/4TjBm0dvFkkrv1O/PfKQcxQg5V8JMlD/3048Xw7fiw6fRNHjLtFox9fc
	 iEuekt/kmCDd7D8Cx/gwIeKfRlGGZWjeaQU49rJxiPXkk9Lsu4Gw3yABeY7uvoPQbD
	 OrcAtzikvLBUqCGLqAoLwOwoD6raYWOCHoDoWQSsBn8L9KnM1fmWVfzOqKb4uEbhdQ
	 OZ/sl/PTQ6iei8rn4CdlKBJGY58/WgGSSUvLlYd5rkXn/eedtQnzuwOymdyyRF+XM6
	 /8w7LdPObvfSNBCI/2QA8bDhoAZUoGrpcnC1fQ0ajRG/k85JDR7pGFxJ0SOA780/rt
	 /uwS8xXbDfNFg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/3] net: airoha: Add per-flow stats support to
 hw flowtable offloading
Date: Fri, 16 May 2025 09:59:58 +0200
Message-Id: <20250516-airoha-en7581-flowstats-v2-0-06d5fbf28984@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH7wJmgC/3WNQQ6CMBBFr0Jm7Zi2UhFX3sOwaNopNJKWTAlqC
 He34trle8l/f4VMHCjDtVqBaQk5pFhAHSqwg4k9YXCFQQmlRS01msBpMEix0ReJfkzPPJs5Y0P
 n1vqTd23toKwnJh9ee/neFR5CnhO/96NFfu2vqWX9t7lIFGiFIEdSGWXN7UEcaTwm7qHbtu0Ds
 I8iEb8AAAA=
X-Change-ID: 20250415-airoha-en7581-flowstats-7e69cf3fd94d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_010033_350247_0DA02D66 
X-CRM114-Status: UNSURE (   7.33  )
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

Introduce per-flow stats accounting to the flowtable hw offload in the
airoha_eth driver. Flow stats are split in the PPE and NPU modules:
- PPE: accounts for high 32bit of per-flow stats
- NPU: accounts for low 32bit of per-flow stats

---
Changes in v2:
- fix memory leaks in airoha_npu_stats_setup() and in
  airoha_npu_foe_commit_entry()
- disable hw keepalive
- fix sparse warnings
- Link to v1: https://lore.kernel.org/r/20250514-airoha-en7581-flowstats-v1-0-c00ede12a2ca@kernel.org

---
Lorenzo Bianconi (3):
      net: airoha: npu: Move memory allocation in airoha_npu_send_msg() caller
      net: airoha: Add FLOW_CLS_STATS callback support
      net: airoha: ppe: Disable packet keepalive

 drivers/net/ethernet/airoha/Kconfig              |   7 +
 drivers/net/ethernet/airoha/airoha_eth.h         |  33 +++
 drivers/net/ethernet/airoha/airoha_npu.c         | 178 ++++++++++-----
 drivers/net/ethernet/airoha/airoha_npu.h         |   4 +-
 drivers/net/ethernet/airoha/airoha_ppe.c         | 270 +++++++++++++++++++++--
 drivers/net/ethernet/airoha/airoha_ppe_debugfs.c |   9 +-
 6 files changed, 427 insertions(+), 74 deletions(-)
---
base-commit: 894fbb55e60cab4ea740f6c65a08b5f8155221f4
change-id: 20250415-airoha-en7581-flowstats-7e69cf3fd94d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


