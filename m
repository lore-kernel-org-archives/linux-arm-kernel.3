Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743E1C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R1LgwZo8Yy9jHnLiG1r4EpMcCCNsir16DglYBKVIjxk=; b=ZxJT197pVRJZOi
	kUBUZISizX6p3coIh78059sXqSFq2hqek7GVicPuQdxG3oAXM4wJ1/zljKzJgGNpgwGsUmXZoY12t
	StOj8yKkFaJQoSPOGA+CZJIRwci2pbuN7ktQ7khbW+b1dqFgB7aElzuR+SE6lzgxHKx5rzOvZ1sy0
	bosKfQ49NyphqxA54eXc+V+mKqtVWTetF46TCbew7a/P+JhyG387qawN6JtvrGJNoxQhIfiscbg2z
	EHSGzmSk7+pfqsv0xpV4MABOhyCzafha8vh/0QWUyWWeP4NWu6XGo5Rqm8xBUcFDNZeKPMaZERNdC
	xCo3Arlx3FYCXyIbT9uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfti-0000000G9L7-3IKT;
	Thu, 29 May 2025 16:14:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfYv-0000000G7ta-0Y2S;
	Thu, 29 May 2025 15:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 953B85C67D9;
	Thu, 29 May 2025 15:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AC8C4CEE7;
	Thu, 29 May 2025 15:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748533975;
	bh=hl2EGsrGA6DGqbMtlfQBtSfBMc1FbsIADq0RXh96ZlM=;
	h=From:Subject:Date:To:Cc:From;
	b=kCV2Z42yGt0npy4Ex2G+oPRP+thc3Fkcwhd8enV06PV5M8H2VwCiYZesrJFsBUQQT
	 qgL9LkWnJfGIJMZRbuXBJixkUSLqwMDDV/T3tTKZEMwKleSgfTuCFTWRUOLVtkO5Lp
	 WA/SDlmfskrmgbGIQYBcBMEoYiCcF+i5PNz6yiduLgHy4oJBvZ+VpXg2wmHUAmOIRm
	 LttEO5uOCgA8Qe/7PwyCSEJ8/wBb07GbWbGkODIAGVCbARJ9zhhNe3wwFu0JedvdCA
	 58CWZMz01/lvXOjYEd85XmjNIxFQV7KThwR5bvqc8vJJsVs8nf/vb4FH152iRoFLXw
	 jlRuFHa9LKWaw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net 0/2] net: airoha: Fix IPv6 hw acceleration
Date: Thu, 29 May 2025 17:52:36 +0200
Message-Id: <20250529-airoha-flowtable-ipv6-fix-v1-0-7c7e53ae0854@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMSCOGgC/x2MSwqAMAwFryJZG6gF6+cq4iJqqgGx0ooK4t0NL
 ucNbx5IHIUTtNkDkU9JEjaFIs9gXGibGWVSBmtsaUrbIEkMC6Ffw3XQsKrfT4debmwqR8XIteF
 qAv3vkXX+213/vh9poXh1awAAAA==
X-Change-ID: 20250529-airoha-flowtable-ipv6-fix-976a1ce80e7d
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Michal Kubiak <michal.kubiak@intel.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_085257_218099_56507308 
X-CRM114-Status: UNSURE (   5.93  )
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

Fix IPv6 hw acceleration in bridge mode resolving ib2 and
airoha_foe_mac_info_common overwrite in
airoha_ppe_foe_commit_subflow_entry routine.
Introduce UPDMEM source-mac table used to set source mac address for
L3 IPv6 hw accelerated traffic.

---
Lorenzo Bianconi (2):
      net: airoha: Initialize PPE UPDMEM source-mac table
      net: airoha: Fix IPv6 hw acceleration in bridge mode

 drivers/net/ethernet/airoha/airoha_eth.c  |  2 ++
 drivers/net/ethernet/airoha/airoha_eth.h  |  1 +
 drivers/net/ethernet/airoha/airoha_ppe.c  | 52 ++++++++++++++++++++++++-------
 drivers/net/ethernet/airoha/airoha_regs.h | 10 ++++++
 4 files changed, 53 insertions(+), 12 deletions(-)
---
base-commit: 27eab4c644236a9324084a70fe79e511cbd07393
change-id: 20250529-airoha-flowtable-ipv6-fix-976a1ce80e7d

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


