Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575B4C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sXKa9zQ64/xHhUpBTjUDJlNTYpVgNwswUHtmGjVC1bs=; b=sXdROt80hVQLdJz5j/aGQaHYWB
	t9zS0UXSVyqJQ4/gYU03g14pzfewIXgrS72d3sHZkKO7/bayb7QM8fgxyXuzIi1hMaXlyBl1OfEkM
	m25KjaY02oXugSR+Zlv/op9wO3cVS7jE8butlaGxTHOmRkk0NDkUNwqCjVztaxTUwaiVuZilOAvKk
	qMVyhetHLPPIftK7UQX1AUmViu7sfb5qee5c8BsK1uWMJABfeqD+L1yeDHyH8VDaVprpcV7+O1SLK
	731qp6ffZlao0dLmhgxVuoU5yOvFUJZeejlLAzw0PGmct4ljGRpW0EoZXlcg72KoBw8GMtctnMWN0
	AnMtE4Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4mU-0000000BogZ-3pAs;
	Thu, 20 Aug 2026 15:34:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4mS-0000000Bof0-1eNu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:34:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB4F0153B;
	Thu, 20 Aug 2026 08:34:04 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DD4C73F763;
	Thu, 20 Aug 2026 08:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240048; bh=XuCHpFD2l7XFa7GMDBXKP2ptFWqTS5hZSmxYFeMwnWw=;
	h=From:To:Cc:Subject:Date:From;
	b=O5yfQ65r3WbDLdo4AWTy/15UkNT7END7W3vLqQ7GXBSyK2ZVAWPN/UM8B57jahXFR
	 BGKt+6AEDdvgZg6BWe2DINX9aGlO6pGeJBJ4pWDOlhY3y8YkhK93g+MKRkdMQWanBl
	 hj8EZxzczr+8Kr6Hztbb4tn/rPI0H8AkLIFF+vc4=
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
Subject: [PATCH 0/4] selftest/arm64: Fix MTE test setup and TAP reporting
Date: Thu, 20 Aug 2026 16:33:22 +0100
Message-ID: <20260820153331.2448875-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_083412_470507_03DFD232 
X-CRM114-Status: UNSURE (   9.25  )
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

Muhammad Usama Anjum (4):
  selftest/arm64: Print TAP header
  selftest/arm64: Treat KSM merge_across_nodes as optional
  selftest/arm64: Fix MTE prctl TAP plan
  selftest/arm64: Add MTE test config fragment

 .../selftests/arm64/mte/check_gcr_el1_cswitch.c      |  1 +
 .../testing/selftests/arm64/mte/check_ksm_options.c  | 12 +++++++++---
 tools/testing/selftests/arm64/mte/check_prctl.c      |  2 +-
 tools/testing/selftests/arm64/mte/config             |  8 ++++++++
 4 files changed, 19 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/mte/config

-- 
2.47.3


