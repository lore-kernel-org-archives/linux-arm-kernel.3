Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB00C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vsN9L4BT0CMVDu5hTBbGBz375ana+ZapC0dsxckFtS8=; b=vxxnSlQc49t4YhsK0vgU5GsOi/
	FWUQHr4CtBf8lZ+pa2b5fxYN9nAwFt4S7eBfdRkLdwl7Mmv5GzuBDMjndnH6opH1/eC7VpcyNiif3
	9FYxaDtuL5C9U0i3EBHnX05DtZVSUQTcsOEsWW39NQvHVP9ZKbjl5Ld+2QGoZn6jU+GKm/Rp1X0JS
	V6vMDakX+epYFdv+FzgTTPKBPgENKlfTn77DP3KYNyscoruXtnxTfxHlt+UzZpH7X9InCPGkjZU8f
	6Q0pQiweA+m8Jttf3f+9hxeQJqr0TT/vOEJeG4qfIuJng3mVop4rGti0H2xp/c1RvzgIZgy75k9Q6
	i12JfhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ2O-0000000DWQx-1nQZ;
	Fri, 21 Aug 2026 14:16:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ2L-0000000DWPy-3XeW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 14:16:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F643153B;
	Fri, 21 Aug 2026 07:15:57 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 024683F85F;
	Fri, 21 Aug 2026 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787321761; bh=+pFmLDKVHJtPYfEbsWpxCGIG9ybjUqOMcP0D8NbikrQ=;
	h=From:To:Cc:Subject:Date:From;
	b=MmRdPhP2qgnfJqVLfSdnX3MZd4HgMEv3NiENacNI1n8PClWuMJlL2Lv7iplzcGqi5
	 87M//L1u32iGqho0O1JscPzPcw/BenPdzi1MbikWc+ZCi0X0BXcwz4cp2KgPuCScpx
	 JdtONEn+rUU05OTmXDLL/wzBNFdYQvZwuCL67Rjc=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v2 0/5] selftest/arm64: Fix MTE test setup and TAP reporting
Date: Fri, 21 Aug 2026 15:15:48 +0100
Message-ID: <20260821141556.4065894-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_071602_552494_02814377 
X-CRM114-Status: UNSURE (   8.80  )
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

Running the mainline arm64 MTE selftests on a Pixel 8 exposed three
independent reporting problems. Fix each issue independently, then
add an arm64 Kconfig fragment covering the facilities used by the MTE
tests.

Testing was performed on a Pixel 8 with an Android 6.1 kernel built with
the new configuration. All nine static MTE binaries returned success.

Changes since v1:
- Add missing MTE TAP headers as an output-only cleanup and clarify why
  line buffering prevents duplicate GCR_EL1 plan output.
- Validate KSM privileges and optional sysfs access before setup.
- Move and expand the arm64 config fragment, and standardize subjects on
  the selftests/arm64 prefix.

Muhammad Usama Anjum (5):
  selftests/arm64: Print TAP header
  selftests/arm64: Print missing MTE TAP headers
  selftests/arm64: Treat KSM merge_across_nodes as optional
  selftests/arm64: Fix MTE prctl TAP plan
  selftests/arm64: Add MTE test config fragment

 tools/testing/selftests/arm64/config          | 17 ++++++++++
 .../selftests/arm64/mte/check_buffer_fill.c   |  2 ++
 .../selftests/arm64/mte/check_child_memory.c  |  2 ++
 .../arm64/mte/check_gcr_el1_cswitch.c         |  1 +
 .../arm64/mte/check_hugetlb_options.c         |  2 ++
 .../selftests/arm64/mte/check_ksm_options.c   | 31 +++++++++++++++++--
 .../selftests/arm64/mte/check_mmap_options.c  |  2 ++
 .../testing/selftests/arm64/mte/check_prctl.c |  2 +-
 .../arm64/mte/check_tags_inclusion.c          |  2 ++
 .../selftests/arm64/mte/check_user_mem.c      |  2 ++
 10 files changed, 59 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/config

-- 
2.47.3


