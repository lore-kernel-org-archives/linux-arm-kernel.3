Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A76C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=53EiXuxI0mlL6ZI2oIDEsgOzSnHjLE/XcYS5NnF6yh8=; b=SJwOi15agSiF1AVd8VH8C8Xbo9
	tfRIg6z+KFUqoRhcyRUBLn2KtRitKdgPfrMeLm+6Rd9VxZZQ9VKeJLmlp+nsVnpEhbIdaX1p6DcQQ
	zPgHyDimqaHYJQFilG7bfPf9riWB+BozFOz3HXcngtjnJ9PlyiVt5GJE+0dQh2uEORGfzo0C6OCAA
	oXKG+cwVe1AX9cil7gmCW07+ut+bhI2MI4tJxbTmvIcDHWJyQX+D84Mz5QPekdh4F0nhBjkACl3uI
	TP5hfEBd2qNOTLaY3gtUAM4lwQEV3gLcO5Mb2/oxrRK1L6pKsmixOujQ7k1A+lyVDfp0UFzyhXFlz
	XKkttccQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YV9-00000007v6M-3cJC;
	Wed, 09 Apr 2025 16:42:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2YTM-00000007ury-0Cx3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:40:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92C0215A1;
	Wed,  9 Apr 2025 09:40:17 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DFCD33F59E;
	Wed,  9 Apr 2025 09:40:15 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: ardb@kernel.org,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	will@kernel.org
Subject: [PATCH v2 00/13] arm64: Preparatory FPSIMD/SVE/SME fixes
Date: Wed,  9 Apr 2025 17:39:57 +0100
Message-Id: <20250409164010.3480271-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_094020_137125_DC0057F7 
X-CRM114-Status: UNSURE (   9.27  )
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

Hi,

These patches fix a number of problems in the FPSIMD/SVE/SME code, as a
step towards re-enabling SME support. Additional fixes/changes will be
necessary before we can re-enable SME support. I intend to follow up
with more patches in the near future.

I'm hoping these patches as-is are largely uncontroversial, though I'm
afraid they've only seen light/targeted testing so far, so any testing
would be much appreciated.

The series is based on v6.15-rc1, and I've pushed the series to the
'arm64-fpsimd-fixes-20250409' branch of my kernel.org git repo:

  git://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/

Since v1 [1]:
* Drop removal of redundant TIF_SVE clearing; this requires more preparatory work.
* Remove leftover prototype for fpsimd_force_sync_to_sve().
* Clarify commit message for opportunistic freeing of sve_state.
* Add Mark Brown's Reviewed-by tags.
  
[1] https://lore.kernel.org/linux-arm-kernel/20250404174435.3288106-1-mark.rutland@arm.com/

Mark.

Mark Brown (2):
  arm64/fpsimd: Discard stale CPU state when handling SME traps
  arm64/fpsimd: Don't corrupt FPMR when streaming mode changes

Mark Rutland (11):
  arm64/fpsimd: Avoid RES0 bits in the SME trap handler
  arm64/fpsimd: Remove unused fpsimd_force_sync_to_sve()
  arm64/fpsimd: Remove redundant SVE trap manipulation
  arm64/fpsimd: Remove opportunistic freeing of SME state
  arm64/fpsimd: Avoid clobbering kernel FPSIMD state with SMSTOP
  arm64/fpsimd: Reset FPMR upon exec()
  arm64/fpsimd: Fix merging of FPSIMD state during signal return
  arm64/fpsimd: Add fpsimd_save_and_flush_current_state()
  arm64/fpsimd: signal32: Always save+flush state early
  arm64/fpsimd: signal: Always save+flush state early
  arm64/fpsimd: signal: Simplify preserve_tpidr2_context()

 arch/arm64/include/asm/esr.h    | 14 ++---
 arch/arm64/include/asm/fpsimd.h |  3 +-
 arch/arm64/kernel/fpsimd.c      | 95 ++++++++++-----------------------
 arch/arm64/kernel/signal.c      | 71 +++++-------------------
 arch/arm64/kernel/signal32.c    | 11 ++--
 5 files changed, 59 insertions(+), 135 deletions(-)

-- 
2.30.2


