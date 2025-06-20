Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E848BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 12:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d2TiFIcxRdEOcQowB43xhS2fEZ3dKXdXw7+mORTC+/Y=; b=hJ+Wr2GlkJ0qGYLef3cXNF0Dkc
	pNCeRB4UCObO7COVWJAg3p85v1MGU+36wlt6NCcUe/sE7hs3M1ocbprE7LevViikj0KywqBm2pgNX
	O69h20ZAxhC5uougEh2d93+/yf5NTs575jj/eAGVmei5J8MGxW6+aVUJ9iLq3OtpaZ+mm4b2ZRyjy
	ZRvsEwygHu5X0XotCegK6HtlAKunVWeNotMkFt+wdwaFB67Tw2orOcd+NSIvXAlmG35Jxy8dpdqR3
	Zj46UgsmiaF9jr8qxc8eroNxVxwZjJJxJQcfBO3hz+WhgpRQPS5TSBP4hhHbAqSVRjMXGa3VqhzGz
	OnTZ+HkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaVy-0000000FXNB-2A91;
	Fri, 20 Jun 2025 12:06:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaHj-0000000FVSG-3Bzz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 11:51:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE34CA4FE4F;
	Fri, 20 Jun 2025 11:51:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B14BC4CEE3;
	Fri, 20 Jun 2025 11:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750420314;
	bh=OpaRy6f5lV+HSoFPNPnqy/zc1+kY/2E7JDK8AUK1DJ4=;
	h=From:To:Cc:Subject:Date:From;
	b=XrtCc/v8dMuE04TYZw1YGGg1thbNCP8HJNEPDmkkKWdK1GcQzOizJwjviPUc8Uax9
	 81F7xgs0eBMN/FeesttDLCDJzpDNKofWgOjVLau7IuIAEdj3zutt2SEfeI5uU0JIBy
	 bwc5j97TxFtjvNxwMtTwSRN0uVxg4Rcf0XX67drJK39oD9v4qO+3dgIDenMYZBopVD
	 O6dWw0W8cd8Rq5+HSu9PF+OZ7X8AlLnmRDGOZ0m5AEfHRw91TShoEfaslKTkKQx8S5
	 uyuAJkhauye50uOH3EpnQaVUUEDW0/kUPY6TJQbm53ofchkTRyGZjVjeHJNcDltV+n
	 txIZ/Gd5xQUqg==
From: Arnd Bergmann <arnd@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] perf/arm-cmn: reduce stack usage in arm_cmn_probe()
Date: Fri, 20 Jun 2025 13:51:42 +0200
Message-Id: <20250620115149.132845-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_045155_870196_EB5A4E51 
X-CRM114-Status: GOOD (  14.60  )
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

From: Arnd Bergmann <arnd@arndb.de>

This function has a rather large stack usage, which triggers the
warning limit with clang if I reduce the default to 1280 bytes:

drivers/perf/arm-cmn.c:2541:12: error: stack frame size (1312) exceeds limit (1280) in 'arm_cmn_probe' [-Werror,-Wframe-larger-than]

This is a combination of two problems:

 - The arm_cmn_discover() function has some large local variables and
   gets inlined here by clang (but not gcc)

 - The (struct pmu) assignment adds an extra copy of the pmu structure
   on the stack and does a memcpy() from that

Address the first one here by marking arm_cmn_discover() as noinline_for_stack,
making clang behave more like gcc here. This gets it under the warning
limit, though the total stack usage does not actually get reduced.

It would be nice to also change the way struct pmu is initialized, but I
see that this is done consistently for all pmu drivers. Ideally the function
pointers should be moved into a 'static const' structure per driver as this
is done in most other subsystems.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/perf/arm-cmn.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 031d45d0fe3d..430c89760391 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -2243,7 +2243,8 @@ static enum cmn_node_type arm_cmn_subtype(enum cmn_node_type type)
 	}
 }
 
-static int arm_cmn_discover(struct arm_cmn *cmn, unsigned int rgn_offset)
+static noinline_for_stack int arm_cmn_discover(struct arm_cmn *cmn,
+					       unsigned int rgn_offset)
 {
 	void __iomem *cfg_region;
 	struct arm_cmn_node cfg, *dn;
-- 
2.39.5


