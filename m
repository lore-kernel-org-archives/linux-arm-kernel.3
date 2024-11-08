Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9840AD5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cuFrMJu+LsieM27dPYqubxOPlmV8SnXsQzO1A/Bv1PE=; b=QAjkwy0HXO0P8V12tDH8uwxn4K
	TNI+aUKsiupm+gws/UMAvVjku5lCCQIjKVEsSAaOGDbVuMg9X0tyHmBlGsEDnc6hQ8e5FclP2ejyt
	JoGj0r0QCuRcCqvicOZKk5cU71BZzKAZRl1JQxJRfj/bTipD2Xl+L5cE6R/bjRDDWqj5SUXECPARx
	vrr1s4f4DAApZjlu4p6ILNXueBVvk0asbixNno0s7BnHozk6qTn5KnI5W7FiRiz00RLqFDKF6HDXM
	3dmTahnk23+IKX3JOWRbAtdvJypTgj5cWT7pojYxVIOYoLw5w15G8SplogIyKz9OHANe4GC6RN9oA
	tJmjrnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9POQ-0000000Akvn-2NzS;
	Fri, 08 Nov 2024 13:51:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PMa-0000000AkN0-3AuB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98BDE5C5B92;
	Fri,  8 Nov 2024 13:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA956C4CECD;
	Fri,  8 Nov 2024 13:49:22 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 0/4] kselftest/arm64: Fix compilation warnings/errors in the arm64 tests
Date: Fri,  8 Nov 2024 13:49:16 +0000
Message-Id: <20241108134920.1233992-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054924_859523_EC9BFFFC 
X-CRM114-Status: UNSURE (   9.45  )
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

It looks like people started ignoring the compiler warnings (or even
errors) when building the arm64-specific kselftests. The first three
patches are printf() arguments adjustment. The last one adds
".arch_extension sme", otherwise they fail to build (with my toolchain
versions at least).

Note for future kselftest contributors - try to keep them warning-free.

Catalin Marinas (4):
  kselftest/arm64: Fix printf() compiler warnings in the arm64 fp tests
  kselftest/arm64: Fix printf() warning in the arm64 MTE prctl() test
  kselftest/arm64: Fix printf() compiler warnings in the arm64
    syscall-abi.c tests
  kselftest/arm64: Fix compilation of SME instructions in the arm64 fp
    tests

 tools/testing/selftests/arm64/abi/syscall-abi.c |  8 ++++----
 tools/testing/selftests/arm64/fp/sve-ptrace.c   | 16 +++++++++-------
 tools/testing/selftests/arm64/fp/za-ptrace.c    |  8 +++++---
 tools/testing/selftests/arm64/fp/za-test.S      |  1 +
 tools/testing/selftests/arm64/fp/zt-ptrace.c    |  8 +++++---
 tools/testing/selftests/arm64/fp/zt-test.S      |  1 +
 tools/testing/selftests/arm64/mte/check_prctl.c |  2 +-
 7 files changed, 26 insertions(+), 18 deletions(-)


