Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2D9CFA450
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 16:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tDuUDsojeq6tCXNsq1AfOoFFZhg8W/XG0dREoLqX3/Y=; b=oZuRV//so4jqqzPl9EE+MHkjGv
	8W8fx6OCKm3CG4WHFoVJ2yHww6zKM1qX+8t/L0FbFqMgYGzbFmBiqCMfWylwK0e6fsTRgIX3ZbJOP
	0WxPKnRnqhHQHPBbofIU2wqzwb2gjLTfVtWb9OdA+Voejd+909dnwCMNAk3KT//CRgIzpdNOqtOxd
	Nr9Gw6gfub/XqxaWDGenFq34PiUggIJKCRCWrvNrtQMgIAdPGsSc9A6AEH/2dTsw0ageTvukpc8tE
	iwmrxB0qXBIHpgBAMxw4Tr0wxd81PnsjBPxBEHvU45+AprWp58XKnoMPkL9YaQu18dESXlghaSP/9
	16I0z6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3egX-0000000FFQi-3vPU;
	Wed, 23 Oct 2024 16:58:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cvR-0000000EsZm-0vLS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 15:05:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64F6C339;
	Wed, 23 Oct 2024 08:05:56 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A79D63F528;
	Wed, 23 Oct 2024 08:05:24 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	dave.hansen@linux.intel.com,
	dave.martin@arm.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	pierre.langlois@arm.com,
	shuah@kernel.org,
	sroettger@google.com,
	will@kernel.org,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 0/5] Improve arm64 pkeys handling in signal delivery
Date: Wed, 23 Oct 2024 16:05:06 +0100
Message-ID: <20241023150511.3923558-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_080529_403151_6B5752C1 
X-CRM114-Status: GOOD (  15.41  )
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

This series is a follow-up to Joey's Permission Overlay Extension (POE)
series [1] that recently landed on mainline. The goal is to improve the
way we handle the register that governs which pkeys/POIndex are
accessible (POR_EL0) during signal delivery. As things stand, we may
unexpectedly fail to write the signal frame on the stack because POR_EL0
is not reset before the uaccess operations. See patch 3 for more details
and the main changes this series brings.

A similar series landed recently for x86/MPK [2]; the present series
aims at aligning arm64 with x86. Worth noting: once the signal frame is
written, POR_EL0 is still set to POR_EL0_INIT, granting access to pkey 0
only. This means that a program that sets up an alternate signal stack
with a non-zero pkey will need some assembly trampoline to set POR_EL0
before invoking the real signal handler, as discussed here [3]. This is
not ideal, but it makes experimentation with pkeys in signal handlers
possible while waiting for a potential interface to control the pkey
state when delivering a signal. See Pierre's reply [4] for more
information about use-cases and a potential interface.

The x86 series also added kselftests to ensure that no spurious SIGSEGV
occurs during signal delivery regardless of which pkey is accessible at
the point where the signal is delivered. This series adapts those
kselftests to allow running them on arm64 (patch 4-5).

Finally patch 2 is a clean-up following feedback on Joey's series [5].

I have tested this series on arm64 and x86_64 (booting and running the
protection_keys and pkey_sighandler_tests mm kselftests).

v1..v2:
* In setup_rt_frame(), ensured that POR_EL0 is reset to its original
  value if we fail to deliver the signal (addresses Catalin's concern [6]).
* Renamed *unpriv_access* to *user_access* in patch 3 (suggestion from
  Dave).
* Made what patch 1-2 do explicit in the commit message body (suggestion
  from Dave).

- Kevin

[1] https://lore.kernel.org/linux-arm-kernel/20240822151113.1479789-1-joey.gouly@arm.com/
[2] https://lore.kernel.org/lkml/20240802061318.2140081-1-aruna.ramakrishna@oracle.com/
[3] https://lore.kernel.org/lkml/CABi2SkWxNkP2O7ipkP67WKz0-LV33e5brReevTTtba6oKUfHRw@mail.gmail.com/
[4] https://lore.kernel.org/linux-arm-kernel/87plns8owh.fsf@arm.com/
[5] https://lore.kernel.org/linux-arm-kernel/20241015114116.GA19334@willie-the-truck/
[6] https://lore.kernel.org/linux-arm-kernel/Zw6D2waVyIwYE7wd@arm.com/

Cc: akpm@linux-foundation.org
Cc: anshuman.khandual@arm.com
Cc: aruna.ramakrishna@oracle.com
Cc: broonie@kernel.org
Cc: catalin.marinas@arm.com
Cc: dave.hansen@linux.intel.com
Cc: dave.martin@arm.com
Cc: jeffxu@chromium.org
Cc: joey.gouly@arm.com
Cc: pierre.langlois@arm.com
Cc: shuah@kernel.org
Cc: sroettger@google.com
Cc: will@kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: x86@kernel.org


Kevin Brodsky (5):
  arm64: signal: Remove unused macro
  arm64: signal: Remove unnecessary check when saving POE state
  arm64: signal: Improve POR_EL0 handling to avoid uaccess failures
  selftests/mm: Use generic pkey register manipulation
  selftests/mm: Enable pkey_sighandler_tests on arm64

 arch/arm64/kernel/signal.c                    |  95 +++++++++++++---
 tools/testing/selftests/mm/Makefile           |   8 +-
 tools/testing/selftests/mm/pkey-arm64.h       |   1 +
 tools/testing/selftests/mm/pkey-x86.h         |   2 +
 .../selftests/mm/pkey_sighandler_tests.c      | 101 +++++++++++++-----
 5 files changed, 162 insertions(+), 45 deletions(-)

-- 
2.43.0


