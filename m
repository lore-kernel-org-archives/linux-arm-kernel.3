Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20597D72A14
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 21:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWcTt0QyywJEnmelUX56TGxhJ57XJn7m3eW+giuWIfY=; b=SgwwSVTAhUwFyN2ITlrML6lRZ1
	Ntza19FlcxDGfICeg0WQuyQNEmmsPCTjfec7aFXl1YKVG7K6BVASvqrZQvcQKDw33hX3yoYmX5uR7
	srEIY8mU0VTHNZyMeUeD+CmyR/ilf1KeFPLIeEUrp0hY0TWETNMPQVaIESebf5B8DTk/ghDruaJKK
	ftyQ5JdA15AHeW89Dpb57rtp0N2Fh9j49UWjZzz0CnuowvCUmR8Bqx1H0WToX7W2leX27MuAsImLq
	oI9rjfyxMkHsx5OekZAomF8sNFVOHZULU10UvUzYIiRQDYAV5KKv0D+HtpQL4q2U7zMymHD0lWNt4
	P30Ygg1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tH8CB-00000000xV1-1jcI;
	Fri, 29 Nov 2024 21:06:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tH8BB-00000000xPw-28JC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 21:05:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D1075C5CAD;
	Fri, 29 Nov 2024 21:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15A28C4CECF;
	Fri, 29 Nov 2024 21:05:30 +0000 (UTC)
Date: Fri, 29 Nov 2024 21:05:28 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 fixes for 6.13-rc1
Message-ID: <Z0osmEaBnjdHS3Q0@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_130533_589678_027B55D4 
X-CRM114-Status: GOOD (  11.30  )
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

Hi Linus,

Please pull the three fixes below that turned up during the merging
window. They are on top of the arm64-upstream tag I sent last week.
There will be at least a couple more next week but I'm waiting for -rc1
because of some dependencies. Thanks.

The following changes since commit 83ef4a378e563d085ddd7214c2a393116b5f3435:

  Merge branch 'for-next/pkey-signal' into for-next/core (2024-11-14 12:07:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-fixes

for you to fetch changes up to dfdf714fed559c09021df1d2a4bb64c0ad5f53bc:

  perf/arm-cmn: Ensure port and device id bits are set properly (2024-11-25 18:53:05 +0000)

----------------------------------------------------------------
arm64 fixes for 6.13-rc1:

- Deselect ARCH_CORRECT_STACKTRACE_ON_KRETPROBE so that tests depending
  on it don't run (and fail) on arm64

- Fix lockdep assert in the Arm SMMUv3 PMU driver

- Fix the port and device ID bits setting in the Arm CMN perf driver

----------------------------------------------------------------
Chun-Tse Shao (1):
      perf/arm-smmuv3: Fix lockdep assert in ->event_init()

Mark Rutland (1):
      arm64: disable ARCH_CORRECT_STACKTRACE_ON_KRETPROBE tests

Namhyung Kim (1):
      perf/arm-cmn: Ensure port and device id bits are set properly

 arch/arm64/Kconfig            |  1 -
 drivers/perf/arm-cmn.c        |  4 ++--
 drivers/perf/arm_smmuv3_pmu.c | 19 +++++++++++--------
 3 files changed, 13 insertions(+), 11 deletions(-)

-- 
Catalin

