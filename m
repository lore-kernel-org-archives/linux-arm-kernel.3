Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785E2C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 09:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d3ETJJSIy/PfakG+9b0NBF2+q++JB8XWsugzaxZ9KXo=; b=vPBg0WJwWc6MOc
	E+3PkW4pVeTRX9cne9VE6QpxJRFxc7I0jKU7wiSJrw7b/6Y3bmerRctAdLIwuVvEEVNGPVEcTZyvm
	cUODx+pEE0vbG1J8FKZfYDRfD3OOZg3dlV+k1r+ktUe3w9/6kvUWB64IcMnfMV6LxS1yhNst5vazz
	6giDgpSpigCkWuzFB8dZH8wYCh+z1RwAHjQ3GCcLIdkpTA8jAOXlhXcEP5q6fwtm7/OKf3fq7gIO/
	lODvmG/9myegV56ngG6Ef41coZEj4dfciK/BmW4dqrM8SnVpJw7Vb1BuBIBfo9hYyDsnk+1QCIE3H
	GNlRK7KFmEkuUAcY+zNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2S3j-00000006kLC-1nIV;
	Wed, 09 Apr 2025 09:49:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2S1y-00000006kCZ-1kEK;
	Wed, 09 Apr 2025 09:47:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BDF868432;
	Wed,  9 Apr 2025 09:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18ADBC4CEE3;
	Wed,  9 Apr 2025 09:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744192057;
	bh=+m0+N46haligEw11nrASxYuR/7DydAeoOe7+i2M73fo=;
	h=From:Subject:Date:To:Cc:From;
	b=rbUfYfs5XOo5tkvyZq39tMu8b4hVDMHci6cq/9DXOBwaKcXCKkRskse6SYupSxtEQ
	 75FRODDHVTWK1FHXjUg1asgP7As971PPBF6wObzRNrQ5BF2Kw846N8HtKpvL3UmWil
	 zbgYe6lPLEWyNRhuz2PVaWXJlFjSZzn9MFYnJPZM+Dhe3dq5E/+Cvo0feP5Ind+ski
	 PrqqBftR8k8UJ2GJAyI4nnQls9+jxDIVwNziaT0MKOiwcuaSmt24xE9M5/EmAKlDjQ
	 d+90Ct/JS+RIUL179++0TBJYmhTRdH8t+KmaMxLw5UfZXIXW8ObK4dgMC1oSh/sMEY
	 X6L7Kym3CSMvA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net-next v2 0/2] Add L2 hw acceleration for airoha_eth
 driver
Date: Wed, 09 Apr 2025 11:47:13 +0200
Message-Id: <20250409-airoha-flowtable-l2b-v2-0-4a1e3935ea92@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACFC9mcC/22NwQ6CMBBEf4Xs2TVtoUI8+R+GQ5EFNjaUbAlqC
 P9uwatze5PMmxUiCVOEa7aC0MKRw5jAnDJ4DG7sCblNDEYZq3Kdo2MJg8POh9fsGk/oTYOkGqv
 awuVGW0jTSajj96G914kHjnOQz/Gy6L39CQtV/hcuGhXqqtxTkb1UtyfJSP4cpId627YvMfYLL
 rkAAAA=
X-Change-ID: 20250313-airoha-flowtable-l2b-e0b50d4a3215
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Michal Kubiak <michal.kubiak@intel.com>
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

Introduce the capability to offload L2 traffic defining flower rules in
the PSE/PPE engine available on EN7581 SoC.
Since the hw always reports L2/L3/L4 flower rules, link all L2 rules
sharing the same L2 info (with different L3/L4 info) in the L2 subflows
list of a given L2 PPE entry.

---
Changes in v2:
- squash patch 1/3 and 2/3
- explicitly initialize airoha_flow_table_entry type for
  FLOW_TYPE_L4 entry
- get rid of airoha_ppe_foe_flow_remove_entry_locked() and just rely on
  airoha_ppe_foe_flow_remove_entry()
- Link to v1: https://lore.kernel.org/r/20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org

---
Lorenzo Bianconi (2):
      net: airoha: Add l2_flows rhashtable
      net: airoha: Add L2 hw acceleration support

 drivers/net/ethernet/airoha/airoha_eth.c |   2 +-
 drivers/net/ethernet/airoha/airoha_eth.h |  22 ++-
 drivers/net/ethernet/airoha/airoha_ppe.c | 224 ++++++++++++++++++++++++++-----
 3 files changed, 212 insertions(+), 36 deletions(-)
---
base-commit: 61f96e684edd28ca40555ec49ea1555df31ba619
change-id: 20250313-airoha-flowtable-l2b-e0b50d4a3215

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


