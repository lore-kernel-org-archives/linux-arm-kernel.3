Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B1ECCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qB1j/+I5/ZjuuObSlQbb2C9HSpLcHcdbskR3s4rIdGc=; b=B1qZwn4RthFEZcIzUWKVnXOLkR
	yf58nPCGYnLOb2/pwruP1hfHfgXc9PBgetxroPqYMWM4fcW++2krOOCPmlance+IavBoQ+vu0Pgz/
	SgG6NY8tGnWmKK4VjkNdN39N46GnnJY+17T3MRr25pKmFjwwDE2bk9iYzDCD3oB4F0G/SCjB16euk
	SGTUX3LYLPfVpuPwALrBaIC6GX0+F5ruPfaW0javX2lRvD1JfChUuTYnWcOyyE6DVOaKPAQQWWJ5Y
	zQxbF+dkiErHF3Xd5+55enxffUKHibiq5LrG95pbVYe203ZXFgXLPKP4iDf37fs1Up0eRYztQsaV9
	j7CukrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAMN-0000000ABK9-3nRM;
	Sat, 18 Oct 2025 17:04:51 +0000
Received: from mail-108-mta253.mxroute.com ([136.175.108.253])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAML-0000000ABJJ-2Ucv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 17:04:50 +0000
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta253.mxroute.com (ZoneMTA) with ESMTPSA id 199f847ec11000c217.002
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 18 Oct 2025 17:04:47 +0000
X-Zone-Loop: af70f36b808dbddffa552ec9a3a839443a01e61e577f
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=josie.lol;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Sender:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=qB1j/+I5/ZjuuObSlQbb2C9HSpLcHcdbskR3s4rIdGc=; b=UtYNd+m7cEUGGMDAHNEASp9fXe
	Il0E5icoPyU3EXmklLPkB20OCbbznfoSs3DB1tjKYCwys27L/Q2FBoCvvnTyqMB01P93C6ili0x9V
	1DNVrA4J5sZyYVtlzvSRhyJFnMRHgKAzFNuprMTDPiwYvselR5PcrlR1W2P6fdAoDffGD7q9TNkHj
	/YwjG1OyLl1W1kmxTb8/NkxCUmezHjsIiHu6TO8raH1aoHzPQNslja7JdUuIzT2RJGxzxq7DRil3B
	K4qCkFpu/s+LGh8gVsNJJuMEf8MdpOhO14IAM9zrsPHakLLXRl+7O2qhIfT8DOzcOo/Qza1K6l1X6
	vfKTvV3Q==;
From: Josephine Pfeiffer <hi@josie.lol>
To: linux@armlinux.org.uk
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: ptdump: use seq_puts() in pt_dump_seq_puts() macro
Date: Sat, 18 Oct 2025 19:04:42 +0200
Message-ID: <20251018170442.3355403-1-hi@josie.lol>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: hi@josie.lol
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_100449_719249_78B0D60D 
X-CRM114-Status: GOOD (  12.24  )
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

The pt_dump_seq_puts() macro incorrectly uses seq_printf() instead of
seq_puts(). This is both a performance issue and conceptually wrong,
as the macro name suggests plain string output (puts) but the
implementation uses formatted output (printf).

While there are no current call sites in the ARM implementation that
trigger this code path, fixing the macro ensures correctness and
prevents potential issues if new call sites are added in the future.

This bug was introduced in commit d02ca6d76ba7 ("ARM: 8736/1: mm: dump:
make the page table dumping seq_file") in 2017, which explicitly copied
the implementation from the buggy arm64 version (ae5d1cf358a5).

Fixes: d02ca6d76ba7 ("ARM: 8736/1: mm: dump: make the page table dumping seq_file")
Signed-off-by: Josephine Pfeiffer <hi@josie.lol>
---
 arch/arm/mm/dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/dump.c b/arch/arm/mm/dump.c
index cd032522d902..bc90cf2404d2 100644
--- a/arch/arm/mm/dump.c
+++ b/arch/arm/mm/dump.c
@@ -42,7 +42,7 @@ static struct addr_marker address_markers[] = {
 #define pt_dump_seq_puts(m, fmt)    \
 ({						\
 	if (m)					\
-		seq_printf(m, fmt);	\
+		seq_puts(m, fmt);	\
 })
 
 struct pg_state {
-- 
2.51.1.dirty


