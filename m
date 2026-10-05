Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0DACA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 16:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=17GfxD/dmICqQ9cPJZzmwk4XPn3JD/KJk3iF5TduUls=; b=JbsN1YUq7l6gu8RgNkgIir9upu
	9fzdEpAmY+GqI35Tl7iQxlgTyU/b6jgnxp/lUgk0Bw9XsNehQM/QLlIvQd8lVJlXqXH4MXyZi5duZ
	2YfP8zkPzJzbzkxr8pNDpp7Gtieoki4CnJpsmnndz3CkoH6A4INMR3eZvToQTadrTZFIZrSjQx/xC
	emBM5c6wD04cyoecb2PcltkfKQ/CJztRrmTOz1s7MX7ycR3Chtu/GJ8oOSQZEycCIGU42EtKz37Ql
	hPgabj+/n0LcSE27Mm8Ds97wXRL13G60nmdyZb13nF8OD+i/IHlR3uxM0vBJfwr923qACmBpVQ+oQ
	Id/IriGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlTF-0000000GpcL-3Bm2;
	Mon, 05 Oct 2026 16:23:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDlTD-0000000Gpbx-0TxE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 16:23:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A18D7152B;
	Mon,  5 Oct 2026 09:23:10 -0700 (PDT)
Received: from NH27D9T0LF.arm.com (unknown [10.57.12.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AD743F66F;
	Mon,  5 Oct 2026 09:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791217394; bh=Y+mYSXG7sOxQkecidf0lc3JWzlGyd8J8+bTbdmTk65Q=;
	h=From:To:Cc:Subject:Date:From;
	b=XicBDFAxgNQFcfVbFd7ubsuA4RrfeC8ebyoDYn5yCRtpFPVytb7e31MnzkZ7zgglR
	 Z9nJWr1jD6nfGR9mz2IJ7LqVGTtJZw7cep50soMkG9FFUwkVBq1b9lFORHXxV8/k2A
	 upGhKZ+sYZQN3muofn4A1rZVsLWm5v/1b7kXumLE=
From: Emanuele Rocca <emanuele.rocca@arm.com>
To: Sunil Goutham <sgoutham@marvell.com>
Cc: Geetha sowjanya <gakula@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Srujana Challa <schalla@marvell.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tamar Christina <Tamar.Christina@arm.com>,
	Jeremy Linton <Jeremy.Linton@arm.com>,
	Emanuele Rocca <emanuele.rocca@arm.com>
Subject: [PATCH net] octeontx2: use arch_extension to enable LSE
Date: Mon,  5 Oct 2026 18:21:37 +0200
Message-ID: <20261005162137.71397-1-emanuele.rocca@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_092319_257800_713B1B27 
X-CRM114-Status: GOOD (  10.80  )
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

Instead of using ".cpu generic+lse", use ".arch_extension lse" to
enable LSE.

The ".cpu generic+lse" directive replaces the assembler's current feature
set with generic+lse, dropping other previously enabled features. In
contrast, ".arch_extension lse" enables LSE while preserving the current
feature set.

For example, the following code is rejected with "selected processor does
not support retaa", because ".cpu generic+lse" drops PAuth even though it
was enabled by armv9-a:

 .arch armv9-a
 .text
 .cpu generic+lse
 retaa

We encountered this issue while building the kernel with GCC configured
using --with-arch=armv9-a. Since Armv9-A includes pointer authentication,
GCC can assume that PAuth instructions are available and may use retaa
when generating PAuth-protected returns.

Fixes: caa2da34fd25a ("octeontx2-pf: Initialize and config queues")
Signed-off-by: Emanuele Rocca <emanuele.rocca@arm.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h | 2 +-
 include/linux/soc/marvell/octeontx2/asm.h                | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
index eecee612b7b2..c525c557b38e 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.h
@@ -786,7 +786,7 @@ static inline u64 otx2_atomic64_add(u64 incr, void __iomem *addr)
 	u64 __iomem *ptr = addr;
 	u64 result;
 
-	__asm__ volatile(".cpu   generic+lse\n"
+	__asm__ volatile(".arch_extension lse\n"
 			 "ldadd %x[i], %x[r], [%[b]]"
 			 : [r]"=r"(result), "+m"(*ptr)
 			 : [i]"r"(incr), [b]"r"(ptr)
diff --git a/include/linux/soc/marvell/octeontx2/asm.h b/include/linux/soc/marvell/octeontx2/asm.h
index d683251a0b40..a9d29f5d6eeb 100644
--- a/include/linux/soc/marvell/octeontx2/asm.h
+++ b/include/linux/soc/marvell/octeontx2/asm.h
@@ -17,7 +17,7 @@
 #define otx2_lmt_flush(ioaddr)                          \
 ({                                                      \
 	u64 result = 0;                                 \
-	__asm__ volatile(".cpu  generic+lse\n"          \
+	__asm__ volatile(".arch_extension lse\n"	\
 			 "ldeor xzr, %x[rf], [%[rs]]"   \
 			 : [rf]"=r" (result)            \
 			 : [rs]"r" (ioaddr));           \
@@ -30,7 +30,7 @@
  */
 #define cn10k_lmt_flush(val, addr)			\
 ({							\
-	__asm__ volatile(".cpu  generic+lse\n"		\
+	__asm__ volatile(".arch_extension lse\n"	\
 			 "steorl %x[rf],[%[rs]]"		\
 			 : [rf] "+r"(val)		\
 			 : [rs] "r"(addr));		\
@@ -40,7 +40,7 @@ static inline u64 otx2_atomic64_fetch_add(u64 incr, u64 *ptr)
 {
 	u64 result;
 
-	asm volatile (".cpu  generic+lse\n"
+	asm volatile (".arch_extension lse\n"
 		      "ldadda %x[i], %x[r], [%[b]]"
 		      : [r] "=r" (result), "+m" (*ptr)
 		      : [i] "r" (incr), [b] "r" (ptr)
-- 
2.47.3


