Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE139C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 02:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2oW6HpOtKgK57QhgPONpqSrsIL1o0tkcEsWLQpFiuiY=; b=Xzzr9SgmTAHH07rYDfHMdwM13f
	t1RGc8PVfQQOgdKt4+bWXnLJXbZM70tGL3nIeOWXpg0yyr9rDRIK/9JiC26bLk8wT43fYfu8OJ+Rv
	P5EIqMEYNtA6+WyatLMhMYsiPDlsJ8UVAcaRhtb4BuRRdfXcszkimbY7hF1VzE5lTXrs8Gb5dtQqZ
	cUmdeYcT6DgkuOWU5W75wnAN/wrecnRlKgbU/aJzVkZ6jWCK37lKSk8JngHhs15McH7cJS2vjy5/H
	XU1o8oi8UQjZL1jKJSjCSQvDb7AKEgnbihqzpYk2RAOOYHHdvRMDI3vK2oyg9zxROs3ifjyyGgyS/
	RuSPbh8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whI8L-0000000GATM-0qqR;
	Wed, 08 Jul 2026 02:35:33 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whI8F-0000000GASm-1TT1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 02:35:31 +0000
X-UUID: a8b1a6e47a7511f1aa26b74ffac11d73-20260708
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:7c8b2036-eb0a-49c5-8521-d11b142c6f74,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:c7acf31676b155335efb05abcef25490,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a8b1a6e47a7511f1aa26b74ffac11d73-20260708
Received: from localhost [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengyu@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1743855771; Wed, 08 Jul 2026 10:35:18 +0800
From: Yu Peng <pengyu@kylinos.cn>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Thomas Huth <thuth@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yu Peng <pengyu@kylinos.cn>
Subject: [PATCH] arm64: fixmap: Allow 256K early_ioremap() at any offset
Date: Wed,  8 Jul 2026 10:35:14 +0800
Message-Id: <20260708023514.2445926-1-pengyu@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_193527_713177_2BCCF074 
X-CRM114-Status: UNSURE (   9.67  )
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

NR_FIX_BTMAPS is the per-slot page limit for early_ioremap(). Since
__early_ioremap() maps the page-aligned physical range, a 256K request
can require one extra page when the physical address is not page-aligned.

Reserve one extra page per slot so the 256K mapping budget is usable
regardless of the initial page offset.

Link: https://lore.kernel.org/r/08fd96fa-ee3a-4904-bd11-bb08bd90436f@kylinos.cn
Signed-off-by: Yu Peng <pengyu@kylinos.cn>
---
 arch/arm64/include/asm/fixmap.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 65555284446e..7075a3bd2c61 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -78,8 +78,12 @@ enum fixed_addresses {
 	/*
 	 * Temporary boot-time mappings, used by early_ioremap(),
 	 * before ioremap() is functional.
+	 *
+	 * Reserve one extra page so a 256K mapping may start at any
+	 * offset within a page. early_ioremap() maps the page-aligned
+	 * physical range, so the initial offset can consume an extra page.
 	 */
-#define NR_FIX_BTMAPS		(SZ_256K / PAGE_SIZE)
+#define NR_FIX_BTMAPS		((SZ_256K / PAGE_SIZE) + 1)
 #define FIX_BTMAPS_SLOTS	7
 #define TOTAL_FIX_BTMAPS	(NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
 

