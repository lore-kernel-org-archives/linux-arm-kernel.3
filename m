Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55D8CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhW2LAdK/O40IilBcsQR0GmhR3+9FiYFhX96Jv6HCFs=; b=j+6DkoGgE0x6w7wfQ+pro9g6Og
	xV32CWm8kq3QRG4KNrsedySNpnwvsms11YO/baJOKw/bQA2SbYU4Dq9VhjQv19sadv/p+4hERdDx8
	UNyPil17LzWtFNVJbaCDdXga7nqWsI8DsHLuLwX2LTbuRsfvOJFtW/SGXwwbLonxKhVTeOQZvvyDt
	5nfax7J5cZukAquDzjcsssgaSUq/Jn6x5s3LPnEcgeH2iJEDjr4urAaJLBJALxfz+qnjeVoUAYsQc
	TWHUpw+uJ1SAH2Lw8pWfQQXAZIHwJYj80EEA9yHJH4i70j9dZxF/Lmcb9uQdvgFS/i8feCKBUkNBk
	fiJ3NAXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF6-0000000CBWf-08iG;
	Fri, 02 Oct 2026 17:40:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xChF3-0000000CBME-07dG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 17:40:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B35642F;
	Fri,  2 Oct 2026 10:40:11 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.2.212.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1955F3F85F;
	Fri,  2 Oct 2026 10:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790962815; bh=cLLKP3U6uTx6o1zZB57WXKqW2Z6IQSnB5jwj6Xxm9hQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MrtfFBfeYFHgJQwzTXfxJkW/enC9vXWGafWys2PrJ+nvb3uVtcA6X5jNEogXrk6Bz
	 oUCcmtTF4Fi6+EPWhgk+GZdKoVtZBMsWcpip3s6c5iTt3Vpwwr+Uka6Qd3M+OhoXuU
	 3PNtNO8mX9czG8HyLd2mfzN8ovhhJw/FtRXICPtk=
From: James Morse <james.morse@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Gavin Shan <gshan@redhat.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 11/27] arm_mpam: Switch to kvzmalloc_objs() for allocation of component cfg
Date: Fri,  2 Oct 2026 18:39:24 +0100
Message-ID: <20261002173941.292319-12-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002173941.292319-1-james.morse@arm.com>
References: <20261002173941.292319-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_104017_116255_4B6293AC 
X-CRM114-Status: GOOD (  12.70  )
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

From: Ben Horgan <ben.horgan@arm.com>

Each component cfg is sized by the size of a per-PARTID multiplied by the
number of PARTIDs. On a platform sized to push the limits of the
specification, the allocation using kzalloc_objs() will consistently
fail. Change to use kvzmalloc_objs() so that large allocations fall back to
vmalloc() based allocations.

Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: James Morse <james.morse@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_devices.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 67545df984fa..527867ab5f1b 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -157,7 +157,7 @@ static void mpam_free_garbage(void)
 		if (iter->pdev)
 			devm_kfree(&iter->pdev->dev, iter->to_free);
 		else
-			kfree(iter->to_free);
+			kvfree(iter->to_free);
 	}
 }
 
@@ -2698,7 +2698,7 @@ static int __allocate_component_cfg(struct mpam_component *comp)
 	if (comp->cfg)
 		return 0;
 
-	comp->cfg = kzalloc_objs(*comp->cfg, mpam_partid_max + 1);
+	comp->cfg = kvzalloc_objs(*comp->cfg, mpam_partid_max + 1);
 	if (!comp->cfg)
 		return -ENOMEM;
 
-- 
2.53.0


