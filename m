Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C752BCDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 07:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PN4+aDsAu1UBBqtMfoO95odoovyt5n75yyVL3bxa65c=; b=tevK4Dn7DIHrpGbvQzu3Bs/bUz
	vXsgJ9i8gQ574jJCOJLi2cW7doO5sTEhPiYEuQEks3qd83mqPoEvSCZP+Zfu6S+4onD6UBlBWak5u
	4q8D06cfayUsrkukgvM3CP66ZOyma/4DcckYqzFBwTFyGMM5VWE6Oe/tWtuHGzra/QDadzmYaSe99
	i88vrWxho8kaAYXms5nhstu7e4FQ87A8NZeV5uQggSjpe4tE/dvH/Qj2BFgzXEeLplOTggFMV3DaR
	fnzKbxYCDraMhJjRxxETV01hsBRQ7YT0dZP7UN3lvSmIvqelExyA7/2P6ttOvsrW5uRAPALespwDm
	bfwcUgHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvWo-00000005pPX-2GLO;
	Tue, 23 Jun 2026 07:26:38 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbvWl-00000005pP2-1zMz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 07:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=PN
	4+aDsAu1UBBqtMfoO95odoovyt5n75yyVL3bxa65c=; b=T8lNrf1KZXZqdURLFm
	zWhHr07bqDcLIKPHr6GPYbZ//EuGN0YCDLNSmn65lBKi4ymejiMPvXba7kv9PBKc
	dUr0hZ34i4u1HMFUdod4QnKb7XpSZJj1kjRqATMowxk2nkIz+lqCt+UwJpgdC+dh
	kdEHEiW5KWSr8IggtZruf8J7w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCHrrHvNDpqB1a6Dg--.16039S2;
	Tue, 23 Jun 2026 15:25:36 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: paul@pwsan.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: Fix a reference leak bug in omap_hwmod_fix_mpu_rt_idx()
Date: Tue, 23 Jun 2026 15:25:34 +0800
Message-Id: <20260623072534.1997680-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgCHrrHvNDpqB1a6Dg--.16039S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrur4fKF47Zw13AFW3tw4fXwb_yoWDCrX_Ww
	s2gw1kWr4rtF409w45Aanxursayw1xGrW3Ar18tFsFkrW3WF1Iyryvv3s3AFyDXF4xKrZr
	Zr4Iyr1Y9342gjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRNWrWUUUUUU==
X-Originating-IP: [240e:604:311:e68d:298a:1bbc:177b:53c8]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxRBy4Go6NPBPIAAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_002635_869923_7950271F 
X-CRM114-Status: UNSURE (   9.32  )
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

omap_hwmod_fix_mpu_rt_idx() gets the first child node with
of_get_next_child(), which returns a node with its reference count
incremented. The function uses the child node to translate the MPU
runtime register resource, but never drops the reference afterwards.

Add the missing of_node_put() after of_address_to_resource().

Fixes: 1dbcb97c656e ("ARM: OMAP2+: Fix module address for modules using mpu_rt_idx")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 arch/arm/mach-omap2/omap_hwmod.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 974107ff18b4..1d7677ca3802 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -2176,6 +2176,7 @@ static void omap_hwmod_fix_mpu_rt_idx(struct omap_hwmod *oh,
 	if (error)
 		pr_err("%s: error mapping mpu_rt_idx: %i\n",
 		       __func__, error);
+	of_node_put(child);
 }
 
 /**
-- 
2.25.1


