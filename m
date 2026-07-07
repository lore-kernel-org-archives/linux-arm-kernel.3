Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D8BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 17:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=Q5JM7bNL+vvD39sKvHstP3GgCnVUZ9CKB+B+yeWlQEg=; b=OZazwz7VSwZzl1jTsTW8EWgJE/
	NyU20smrOTtNEQt6veUeSzjAro2KcFmLHP12sZVbW6n9/Jn7G0DIE0tTcDNuJF7qYn3n0GZ27CmB3
	IfqmIZS27/4HPaE/0A3SNEg92yojRDBv5dfHJDLR7NRdmIFXsqQEwxtEBRPmAStSSDC63WqiwRl1N
	gRF63BpkfdVqq7NBwDZCxqtPgtkfgBYn1NgLM5KMrKu2hCRaiJmHnBZdxzjMC9e5AOWcjHj3V7yKu
	HwHHPxKv5UzuNxxCkio2BarK/lFuLBa9rwowARN/k6/GEIN0m6A5zeYcjYkV/PR8UGFS3HHPiDYkv
	jIJE8TpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9no-0000000FZeX-0dEt;
	Tue, 07 Jul 2026 17:41:48 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh9nf-0000000FZb2-0OAr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 17:41:42 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260707174135euoutp0292703c41b5502e0880dd052a3100deca~AEsZXPdBS2060220602euoutp02Q
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 17:41:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260707174135euoutp0292703c41b5502e0880dd052a3100deca~AEsZXPdBS2060220602euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1783446095;
	bh=Q5JM7bNL+vvD39sKvHstP3GgCnVUZ9CKB+B+yeWlQEg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=L/Y3F9RTlHLo98VkCsSuh+UtR71ATMVFANv9mPj2yDBHZrlpg6+aRld7uyr/joUN6
	 v0g+wmPShDE3aSnGD9TvS7mUCx6NsMP/sPQ/Gmz9rN47FQvmvwmBu74VwRhRc8Wnt6
	 ehtqLK3NID0EkXo+RsrvbYXXtq1HcjYzsVMDipk8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef~AEsYmDoRO2783027830eucas1p2n;
	Tue,  7 Jul 2026 17:41:34 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
	[106.120.77.61]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260707174133eusmtip1f584699ca9032f159ed4a173781ce399~AEsX6Tayo1541815418eusmtip1L;
	Tue,  7 Jul 2026 17:41:33 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Cc: k.tegowski@samsung.com, k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jakub
	Raczynski <j.raczynski@samsung.com>
Subject: [PATCH net 0/2] net/stmmac: Secure against failures of DMA memory
 allocation
Date: Tue,  7 Jul 2026 19:41:13 +0200
Message-Id: <20260707174115.1264466-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef
X-EPHeader: CA
X-CMS-RootMailID: 20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef
References: <CGME20260707174134eucas1p2d88b2b6007e833f02ef6497b388374ef@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_104139_596394_0DE1E4F9 
X-CRM114-Status: GOOD (  11.41  )
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

This series fixing two possible issues related to fails of
__alloc_dma_rx_desc_resources(). Original issue from 1st patch is related to
page_pool that has happened in testing env, while second was requested by
Sashiko to have similar change for DMA allocation. 
To have complete fix for all failures of __alloc_dma_rx_desc_resources(),
merge two fixes into series.

---
Note:
1st patch "Set Rx queue page_pool to NULL when freeing DMA resources" is
set to v2 while this series is v1. I know this is inconsistent, but this
series is not v2 and would be even more confusing.
Hopefully that doesn't break some CI, as second patch is v1.

Link to original:
https://lore.kernel.org/netdev/20260630100953.747868-1-j.raczynski@samsung.com/

Changes in v2 (in first patch):
- Added reviewed by Maxime
- Dropped null check as page_pool_destroy() does provide that
- Modified comment to reflect that

Jakub Raczynski (2):
  net/stmmac: Set Rx queue page_pool to NULL when freeing DMA resources
  net/stmmac: Prevent dma queue NULL free on allocation failure

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.34.1


