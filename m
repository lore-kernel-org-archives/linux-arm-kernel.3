Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B674CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 17:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=czPLsVnnob4wEuO1VYDim5CWL4iqX/jfBfFcX+qk1oA=; b=S8Z8m6vjyYPzLsBYBWPC5RnsPT
	XQh88hEXGdBSJYLf33Rd12YvCZeITlYYVdbyswNRQ4/tvAHCYrXWQXTHOXbtprwT4tkDtlkIA128u
	gTO9/uSs02N9H72ocDcbLRYFbQrpB5yuQR3TsCcreYWdi3gsZpSSVxLD3XZRA2v5gGLIaL+atcL5r
	Fnn9KYDMHmqi6s/A+sd2fRDDJOB9haL6I82F2CTJDwZxKhPDB+bzFHI6DfMz+9OO1iKyqB5YI/3tk
	djPdclPxEZvNa1M3JdmoM2o7okN0uSpyWzRAIV8BQnJL2K72QSCFEhSvA+NMpst+oo+TbT/LV5c9W
	HP+iAqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAM5-0000000ABH6-0TL3;
	Sat, 18 Oct 2025 17:04:33 +0000
Received: from mail-108-mta0.mxroute.com ([136.175.108.0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAM2-0000000ABGY-2HkW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 17:04:31 +0000
Received: from filter006.mxroute.com ([140.82.40.27] filter006.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta0.mxroute.com (ZoneMTA) with ESMTPSA id 199f84788af000c217.003
 for <linux-arm-kernel@lists.infradead.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 18 Oct 2025 17:04:21 +0000
X-Zone-Loop: b0a8c6de8777f4ca25d3976d1f84f5cf0f1d0300245d
X-Originating-IP: [140.82.40.27]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=josie.lol;
	s=x; h=Content-Transfer-Encoding:MIME-Version:Date:Subject:Cc:To:From:Sender:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References;
	bh=czPLsVnnob4wEuO1VYDim5CWL4iqX/jfBfFcX+qk1oA=; b=Y75QYPhZdMhhH/QJcgGAkvHXhf
	SN8wY5VjlhHvk3m+yJ2tKwT5SMpnAHI7FC9K62+GZVL1e+VsvL0Ra+EmqPMn3b7CrlB7cbSFm9V+c
	JoHN+cEyznGgMc+cnoNa9eQ3k3pDjBD5a18H8Wff1Tg/izKwrWDA8YD5FHWD16HHORhIJ/2BrSP6J
	tYWv/S0dJL/8ujrSC3ipGu5IAeefZ05XlRweFAkzQE49LGrOgEbXlpQgJA7Jx7MYWPgy6Yf5Fi/4J
	DbmZo9W1FSaps7CRrfgs9WhrG/p3Z70r7mPnxLyKiteXnpoqgZsOFBKx1TTxqrxr/fFoeNb0NgujY
	7UVmvTKQ==;
From: Josephine Pfeiffer <hi@josie.lol>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: ptdump: use seq_puts() in pt_dump_seq_puts() macro
Date: Sat, 18 Oct 2025 19:04:16 +0200
Message-ID: <20251018170416.3355249-1-hi@josie.lol>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: hi@josie.lol
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_100430_673795_4E1952C5 
X-CRM114-Status: GOOD (  11.43  )
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

All call sites pass constant strings without format specifiers, so
using seq_printf() adds unnecessary overhead for format string parsing.

This bug was introduced in commit ae5d1cf358a5 ("arm64: dump: Make the
page table dumping seq_file optional") in 2016, where seq_puts() was
replaced with a new pt_dump_seq_puts() macro that mistakenly used
seq_printf().

Fixes: ae5d1cf358a5 ("arm64: dump: Make the page table dumping seq_file optional")
Signed-off-by: Josephine Pfeiffer <hi@josie.lol>
---
 arch/arm64/mm/ptdump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index ab9899ca1e5f..a35fcd62bf75 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -35,7 +35,7 @@
 #define pt_dump_seq_puts(m, fmt)	\
 ({					\
 	if (m)				\
-		seq_printf(m, fmt);	\
+		seq_puts(m, fmt);	\
 })
 
 static const struct ptdump_prot_bits pte_bits[] = {
-- 
2.51.1.dirty


