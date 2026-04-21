Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86230F8FA84
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jXOJj43XNvReEhPqobGOzfoG8lAaHh300jknQ2IgJNw=; b=pLUk+MPsKuoVokm0D5v7FxsLK6
	3bwCCEgnGRYSEgFuxD1Y0h04g9SjyETvy8sMOiGddev0zMb5JhTP/f48J45WF5Vau4Yk40JZUEBmZ
	HX+chodQUJSEd9+rIJksBV7lYLthGKaZ/TqyknLJ50vsly/tqC/GJWvuCUMS9r0kbvxGQYMZ2fSI1
	ZXCwytU8GWDR50xtVIeEWjlJDBh0FWg/8Hu2UPdTo77MjlJhqf4tDJ88QHCkgq4sN1J16enZnlI6k
	M8QqPTgjjtn0pRG7yG1WssGNgJevl86hLXXqJGp4LQwGytm0R6aNXkxxvNhMeshrk6Y1HdxYJGha6
	QhYCjIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCJu-00000008krj-1kdc;
	Tue, 21 Apr 2026 14:43:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCJr-00000008kqs-3yWj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 14:43:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8A3125DE;
	Tue, 21 Apr 2026 07:43:11 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D58753FAF5;
	Tue, 21 Apr 2026 07:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776782597; bh=ErZqLqG4z1mz022InKJE68dLicLEokhYYUkZnoSROZI=;
	h=From:To:Cc:Subject:Date:From;
	b=BCUzE2dsRxMqokii6HC3etc90tBjGaI6CFX54qlaUIXVnAxCNPreYUNHFr3aHbglU
	 n6PoRpqzce4soGEVJhAtwlZCViT+qSdaBK443FB99MXkHX237vlSx3B1LP5y2Ma1jn
	 qhwfxt/Msa3qnlTODYEf9k0ybHDrpd6vbYXNQV2Q=
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/4] POE sigreturn fix and extra tests
Date: Tue, 21 Apr 2026 15:42:48 +0100
Message-ID: <20260421144252.1440365-1-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_074320_048086_46680E93 
X-CRM114-Status: GOOD (  11.94  )
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

Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
avoid uaccess failures") introduced special handling for EL0 registers
that impact uaccess. This did not however handle the case where a signal
handler removes the relevant record (poe_context for POE) from the
signal frame; this is clearly not typical behaviour but it is legal.
That commit resulted in arbitrary data from the kernel stack being
written to POR_EL0 in that case.

Patch 1 fixes this by tracking which fields in struct user_access_state
are actually valid. This restores the original behaviour, where POR_EL0
is left untouched if poe_context is removed.

The remaining patches add new tests to the arm64 signal kselftests to
check that POR_EL0 is reset and restored (or preserved) as expected.
---
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Joey Gouly <joey.gouly@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kselftest@vger.kernel.org
---
Kevin Brodsky (4):
  arm64: signal: Preserve POR_EL0 if poe_context is missing
  kselftest/arm64: Add POE as a feature in the signal tests
  kselftest/arm64: Add POE helpers to test_signals_utils.h
  kselftest/arm64: Add tests for POR_EL0 save/reset/restore

 arch/arm64/kernel/signal.c                    | 19 +++--
 .../selftests/arm64/signal/test_signals.h     |  2 +
 .../arm64/signal/test_signals_utils.c         |  3 +
 .../arm64/signal/test_signals_utils.h         | 16 ++++
 .../testcases/poe_missing_poe_context.c       | 73 +++++++++++++++++++
 .../arm64/signal/testcases/poe_restore.c      | 64 ++++++++++++++++
 .../arm64/signal/testcases/poe_siginfo.c      | 15 ----
 7 files changed, 172 insertions(+), 20 deletions(-)
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_restore.c


base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.51.2


