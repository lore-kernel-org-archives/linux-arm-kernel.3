Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A1AE77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=He/giAmEHqNfp9S7J2TVvzS3qQ0ix2iFGgVJ7ep2j4w=; b=PVH7cTvUCmxLmDBrhmnri2yk5I
	Z9zZb5/QhVtGxS22DDV7A/ydVOhPzssLL2KCjVkm8u2kUupFRx/qSpL0p8f+w4h/uxPUEXVhmy/yf
	AzAtEiEk4dchpekS0qD0gQ4sJ4isZG8Y5g67GvaGJVmrDLBOsebcr62fglnxHTBihpNcwOUJhVXbT
	q1EwjTnVmTroMBmX9nKYMLoVL+JV3afGVrg/UPub3+D7GPY91ijV4A73+F1wq75GbpOaXIiAhzrHP
	C6g+7ZxeuPMGsmFslP40nykW3z9IRcsKiafuVXjYprerRn1IDQkioegC+Ffx03NhfEkh0kdreUaAk
	/nYL93ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaNc-000000078gX-2C6h;
	Mon, 09 Dec 2024 09:48:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaMY-000000078N1-3CDv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:47:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15355113E;
	Mon,  9 Dec 2024 01:47:59 -0800 (PST)
Received: from udebian.localdomain (unknown [10.1.35.36])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91E573F720;
	Mon,  9 Dec 2024 01:47:28 -0800 (PST)
From: Yury Khrustalev <yury.khrustalev@arm.com>
To: linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Sandipan Das <sandipan@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	nd@arm.com,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: [RESEND v4 0/3] mm/pkey: Add PKEY_UNRESTRICTED macro
Date: Mon,  9 Dec 2024 09:47:16 +0000
Message-Id: <20241209094719.2431126-1-yury.khrustalev@arm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_014734_847927_8E1AF04E 
X-CRM114-Status: UNSURE (   9.11  )
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

Add PKEY_UNRESTRICTED macro to mman.h and use it in selftests.

For context, this change will also allow for more consistent update of the
Glibc manual which in turn will help with introducing memory protection
keys on AArch64 targets.

Applies to fac04efc5c79 (tag: v6.13-rc2).

Note that I couldn't build ppc tests so I would appreciate if someone
could check the 3rd patch. Thank you!

Signed-off-by: Yury Khrustalev <yury.khrustalev@arm.com>

---
Changes in v4:
 - Removed change to tools/include/uapi/asm-generic/mman-common.h as it is not
   necessary.

Link to v3: https://lore.kernel.org/all/20241028090715.509527-1-yury.khrustalev@arm.com/

Changes in v3:
 - Replaced previously missed 0-s tools/testing/selftests/mm/mseal_test.c
 - Replaced previously missed 0-s in tools/testing/selftests/mm/mseal_test.c

Link to v2: https://lore.kernel.org/linux-arch/20241027170006.464252-2-yury.khrustalev@arm.com/

Changes in v2:
 - Update tools/include/uapi/asm-generic/mman-common.h as well
 - Add usages of the new macro to selftests.

Link to v1: https://lore.kernel.org/linux-arch/20241022120128.359652-1-yury.khrustalev@arm.com/

---

Yury Khrustalev (3):
  mm/pkey: Add PKEY_UNRESTRICTED macro
  selftests/mm: Use PKEY_UNRESTRICTED macro
  selftests/powerpc: Use PKEY_UNRESTRICTED macro

 include/uapi/asm-generic/mman-common.h               | 1 +
 tools/testing/selftests/mm/mseal_test.c              | 6 +++---
 tools/testing/selftests/mm/pkey-helpers.h            | 3 ++-
 tools/testing/selftests/mm/pkey_sighandler_tests.c   | 4 ++--
 tools/testing/selftests/mm/protection_keys.c         | 2 +-
 tools/testing/selftests/powerpc/include/pkeys.h      | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_exec_prot.c  | 2 +-
 tools/testing/selftests/powerpc/mm/pkey_siginfo.c    | 2 +-
 tools/testing/selftests/powerpc/ptrace/core-pkey.c   | 6 +++---
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c | 6 +++---
 10 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.39.5


