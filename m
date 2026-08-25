Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB0DC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 11:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0+fHM4hkibe1kGJUo2fSK6BtEgDo4cli+uFOVHLaj+o=; b=xXTojLwqogAA9JC/6ZWRPkOBkD
	Xx1IHfo1XurWYUJVpYpDcSrbB/6AUpFYCI5bX7KzX2YqkvicKPudBE602vzpmDQc8LxV2rGWEmOur
	LkOgZcYY4ByeqNAbhFPxb9C8HOai2wkLZBZRCO9YWjWUvlgVVG6EioVCF8TPC1+JZcJY/61v7jqE3
	MUeD7oS+ZNUCxME8z9GIu4UGRqMwnkVAIIkVxfGYLJe93ybPP1pob43ojtzJUPG3zymSNOditaHKo
	I53Z1Z2bQmYlnMzHqadDDP/glWg12+TXMCUjAofm47btudabCyBdTzA2GKuSG3SxBTM/YMsBnbI7W
	DGpUhYZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypBn-00000000fry-1YTK;
	Tue, 25 Aug 2026 11:19:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wypBl-00000000frc-3Okl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 11:19:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD141153B;
	Tue, 25 Aug 2026 04:19:28 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02D7E3F66F;
	Tue, 25 Aug 2026 04:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787656772; bh=5Sq6kzMYi7a+GOQuK58QTIE83E5jPHwmaVWwekQkOmI=;
	h=From:To:Cc:Subject:Date:From;
	b=Wqc2PniiotncFDikIrhtbsivQZRK5tYaensA6HIQw/Foy+aLQT+m3jGRnkFiVPg9k
	 P6gzzDIuK1Z1GdCGUzU1ZGdlrZz+PZP+NWYZLUAh3BJhTmCXE+t0oiDBwVMGXA6T4y
	 wyVmOaJMN19U4yUezG7XYQO9DX4LW50zdKR3XxrM=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 0/4] selftests/arm64: Fix MTE test setup and TAP reporting
Date: Tue, 25 Aug 2026 12:18:33 +0100
Message-ID: <20260825111929.2882324-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_041933_970067_E9F9072A 
X-CRM114-Status: UNSURE (   9.34  )
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
independent reporting problems. Fix these reporting problems, then add
an arm64 Kconfig fragment covering the facilities used by the MTE tests.

Testing was performed on a Pixel 8 with an Android 6.1 kernel built with
the new configuration. All nine static MTE binaries returned success.

Changes since v2:
- Combine the MTE TAP header fixes into a single patch.
- Treat inaccessible KSM merge_across_nodes as a skipped prerequisite.

Changes since v1:
- Add missing MTE TAP headers as an output-only cleanup and clarify why
  line buffering prevents duplicate GCR_EL1 plan output.
- Validate KSM privileges and optional sysfs access before setup.
- Move and expand the arm64 config fragment, and standardize subjects on
  the selftests/arm64 prefix.

Muhammad Usama Anjum (4):
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


