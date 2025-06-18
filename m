Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF45DC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 09:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcel7zkSitekoej7FIYC6iScKfv7iC+7n7G3sdHcN40=; b=p0+z9ZKw0JvPMGN7ZDPMeSgQjv
	SoI4YqXW+uPaECpGZk3F6ob2CjTHHjdgdnKJR1VnEtNXq52bPV+M0hjzZcWD3AZD2LD47px/TzLnK
	2FoSyU0pCoKreBq1+wGXHM2BGUG0i8nTsW6dDPXPEthTjDQ06XFoUrj91L3l90OQm4bAkZjjHUXQU
	6pZ4aMCIGZbLrM3oPc7G/xOdUj4D5SCFo/OCWqFc+j1Y3bDd1Fbw9s0/qkaOFEbAHn4olSwVleaSR
	TuhK4/zI2qOhJAqbvqAhvfgqllvDdOH7cb9Vg56EY0Ipqov5xxR6JxcB8Lrm73K7W+5IFE/GjAHHu
	f1aeRIEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRouB-00000009VcR-43Qk;
	Wed, 18 Jun 2025 09:16:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRoQN-00000009SMC-0n1x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 08:45:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE0331BC0;
	Wed, 18 Jun 2025 01:45:17 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 157823F66E;
	Wed, 18 Jun 2025 01:45:35 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	pcc@google.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	yury.khrustalev@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v9 08/10] kselftest/arm64/mte: add verification for address tag in signal handler
Date: Wed, 18 Jun 2025 09:45:11 +0100
Message-Id: <20250618084513.1761345-9-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250618084513.1761345-1-yeoreum.yun@arm.com>
References: <20250618084513.1761345-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_014539_335693_C409EDB3 
X-CRM114-Status: GOOD (  12.08  )
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

Add the address tag [63:60] verification when synchronous mte fault is happen.
when signal handler is registered with SA_EXPOSE_TAGBITS,
address includes not only memory tag [59:56] but also address tag.
Therefore, when verify fault address location, remove both tags

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 .../selftests/arm64/mte/mte_common_util.c     | 38 ++++++++++++++-----
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/arm64/mte/mte_common_util.c b/tools/testing/selftests/arm64/mte/mte_common_util.c
index d9702a542cb6..10dcbc37e379 100644
--- a/tools/testing/selftests/arm64/mte/mte_common_util.c
+++ b/tools/testing/selftests/arm64/mte/mte_common_util.c
@@ -33,12 +33,25 @@ static unsigned int mte_cur_pstate_tco;
 
 void mte_default_handler(int signum, siginfo_t *si, void *uc)
 {
+	struct sigaction sa;
 	unsigned long addr = (unsigned long)si->si_addr;
+	unsigned char si_tag, si_atag;
+
+	sigaction(signum, NULL, &sa);
+
+	if (sa.sa_flags & SA_EXPOSE_TAGBITS) {
+		si_tag = MT_FETCH_TAG(addr);
+		si_atag = MT_FETCH_ATAG(addr);
+		addr = MT_CLEAR_TAGS(addr);
+	} else {
+		si_tag = 0;
+		si_atag = 0;
+	}
 
 	if (signum == SIGSEGV) {
 #ifdef DEBUG
-		ksft_print_msg("INFO: SIGSEGV signal at pc=%lx, fault addr=%lx, si_code=%lx\n",
-				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code);
+		ksft_print_msg("INFO: SIGSEGV signal at pc=%lx, fault addr=%lx, si_code=%lx, si_tag=%x, si_atag=%x\n",
+				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code, si_tag, si_atag);
 #endif
 		if (si->si_code == SEGV_MTEAERR) {
 			if (cur_mte_cxt.trig_si_code == si->si_code)
@@ -51,13 +64,18 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 		}
 		/* Compare the context for precise error */
 		else if (si->si_code == SEGV_MTESERR) {
+			if ((!mtefar_support && si_atag) || (si_atag != MT_FETCH_ATAG(cur_mte_cxt.trig_addr))) {
+				ksft_print_msg("Invalid MTE synchronous exception caught for address tag! si_tag=%x, si_atag: %x\n", si_tag, si_atag);
+				exit(KSFT_FAIL);
+			}
+
 			if (cur_mte_cxt.trig_si_code == si->si_code &&
 			    ((cur_mte_cxt.trig_range >= 0 &&
-			      addr >= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-			      addr <= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
+			      addr >= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+			      addr <= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
 			     (cur_mte_cxt.trig_range < 0 &&
-			      addr <= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-			      addr >= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)))) {
+			      addr <= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+			      addr >= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)))) {
 				cur_mte_cxt.fault_valid = true;
 				/* Adjust the pc by 4 */
 				((ucontext_t *)uc)->uc_mcontext.pc += 4;
@@ -73,11 +91,11 @@ void mte_default_handler(int signum, siginfo_t *si, void *uc)
 		ksft_print_msg("INFO: SIGBUS signal at pc=%llx, fault addr=%lx, si_code=%x\n",
 				((ucontext_t *)uc)->uc_mcontext.pc, addr, si->si_code);
 		if ((cur_mte_cxt.trig_range >= 0 &&
-		     addr >= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-		     addr <= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
+		     addr >= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+		     addr <= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range)) ||
 		    (cur_mte_cxt.trig_range < 0 &&
-		     addr <= MT_CLEAR_TAG(cur_mte_cxt.trig_addr) &&
-		     addr >= (MT_CLEAR_TAG(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range))) {
+		     addr <= MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) &&
+		     addr >= (MT_CLEAR_TAGS(cur_mte_cxt.trig_addr) + cur_mte_cxt.trig_range))) {
 			cur_mte_cxt.fault_valid = true;
 			/* Adjust the pc by 4 */
 			((ucontext_t *)uc)->uc_mcontext.pc += 4;
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


