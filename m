Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C016CC6B2E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dgx7fdVL3gslgVt9JDPuNjkPT/2OnyYQOFdGME5nfVM=; b=n85URuD/rgz/NFnCKRv/ga3uh5
	oOOLh8bJucQc6PwntOQBSfZ/kaDKZTRwTRZ1c/l62uvOGsBqdzYwbWXZDfNA/A4Zd58oHN6CTWmc0
	rNwH7jRjcDJGeTI7c1MrxnrLTYKftJ47MlmoLyX9rBHjQOwAue3KowbF00fJozkFnIGoVeHKifY8U
	+NpECtbag//yQ4gElojZjGGHekEnZ+v3KKldpDhFWpwIygtYpsQCyiZEna1Ws2ecFq6C5ICoL3dyy
	EDSjzAOL6an0lF8WHbNpmtot/LMSzaLk1DGn8FlaBoPiY9HiYv5QSD1Lm1lqCQEqMPznW/jYAuItB
	5BZcpnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5A9-0000000GEaN-2gCY;
	Wed, 14 Oct 2026 20:01:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH5A7-0000000GEZx-46bU;
	Wed, 14 Oct 2026 20:01:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A9AA43A9B;
	Wed, 14 Oct 2026 20:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AADC1F000C5;
	Wed, 14 Oct 2026 20:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792008079;
	bh=dgx7fdVL3gslgVt9JDPuNjkPT/2OnyYQOFdGME5nfVM=;
	h=From:To:Cc:Subject:Date;
	b=V6eL6YOFwWuYgmDoB3mIA4GJ3F4OZCBk9aFgeGrpcuwi4o03Vd8ovkLKlg4UChmYN
	 sVTjzdqjPsjT704Blk9YrdyohlOwJm6FDtk4Xq+Qr0MtI3sGGargh5Q0RpngXYtWuP
	 qWn+QZiUctW5JOGzpaKCvhxi+39imNKSXDfzb9VJm6wIFmM5UGhGiZhkmNUC89V9M5
	 0xnUQ1Zqpq1EyaEZBTxYDDU9DOwGjBsh4D0hSmr7MsiVRe9LcEeYXyBE9cBMPNycEj
	 cD30B5U6lNd2UZAVhcZwEio5JDcB1vuZcEO6kepMkEQVDY7ZFo0ImmBN5E6caFwgpv
	 yLzcvxBt8kORQ==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	sparclinux@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] selftests: report per-suite build results without failing the build
Date: Wed, 14 Oct 2026 16:01:08 -0400
Message-ID: <20261014200115.1363363-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Building the selftests succeeds as long as one target builds, so that a
single broken suite does not cost CI systems the coverage of all the
others. Commit cad6f32665cb ("selftests: Deescalate error reporting")
restored that policy after commit 7e47389142b8 ("selftests: Preserve
subtarget failures in all/install") had made any failure fatal. The
other side of the policy is that make cannot say which suites failed,
and CI systems fall back to guessing from the installed files, which
misses suites that installed their scripts but failed to compile and
flags suites that legitimately install nothing.

This series keeps the policy and adds an opt-in report instead:

 - Patch 1 fixes the exit status of the top-level loops, which wraps to
   success once eight or more targets fail.

 - Patch 2 adds KSFT_BUILD_REPORT. When it names an absolute file, the
   all and install rules append a "phase<TAB>target<TAB>status" record
   per target, without changing what is built or installed or the exit
   status of make.

 - Patches 3-7 apply the same policy to the suites that build their
   subdirectories in shell loops (futex, arm64, riscv, powerpc and
   sparc64). A failing subdirectory no longer hides behind the status
   of the last one, nor drops the whole suite from the installation,
   and each subdirectory is recorded as <suite>/<subdir>. FORCE_TARGETS
   keeps failing fast, now also inside these suites.

Patches 3-7 depend on patch 2 for the recording helper, so the series
is easiest to take as a whole; acks from the architecture and futex
maintainers would be appreciated.

Tested with mock suites for every converted loop and with native and
cross (arm64, riscv, powerpc) builds of the affected suites against the
base tree. A kselftest-install of 20 suites gives the same installation
and runlist as before, plus the report.

Sasha Levin (7):
  selftests: keep the build status from wrapping to success
  selftests: optionally record per-suite build and install results
  selftests/futex: report failures of the functional subdirectory
  kselftest/arm64: keep building and installing after a subdirectory
    fails
  selftests/riscv: keep building and installing after a subdirectory
    fails
  selftests/powerpc: report the outcome of each subdirectory
  selftests/sparc64: report failures of the drivers subdirectory

 Documentation/dev-tools/kselftest.rst        | 38 +++++++++++++++++
 tools/testing/selftests/Makefile             | 31 ++++++++++----
 tools/testing/selftests/arm64/Makefile       | 43 +++++++++++++-------
 tools/testing/selftests/build_report.mk      | 26 ++++++++++++
 tools/testing/selftests/futex/Makefile       | 32 ++++++++++-----
 tools/testing/selftests/powerpc/Makefile     | 20 ++++++---
 tools/testing/selftests/powerpc/pmu/Makefile | 20 ++++++---
 tools/testing/selftests/riscv/Makefile       | 39 +++++++++++++-----
 tools/testing/selftests/sparc64/Makefile     | 33 ++++++++++-----
 9 files changed, 218 insertions(+), 64 deletions(-)
 create mode 100644 tools/testing/selftests/build_report.mk


base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
-- 
2.53.0


