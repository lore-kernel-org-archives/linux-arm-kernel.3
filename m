Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A00D58CDC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ymKLyHDUS1Lu6tStQ0lnD46LWrM7guBhCULfBOM2RqI=; b=bXip/0zjLqCfeeXuhCEReGA6Ls
	HwwScLt99zaUU6DlOI7TQ6iUhOHmJxQsDiaAggKGyHvCV8Ve2Rh2rd+p+hDoIZ9dBfc3DP4dNncRY
	ZMEjJa0DEjQeLbTkDWtgrZnk7C3vO7I5zemmjSERvQBEIgjCDFkv22cLNvEcjo9glPvei+jGVmFEc
	G2SU2Qffd3lwL+E0JZKTi1p+odhPH+mMTl2t2NGG/CbJZDoIXDeG71rl2USnkToiPJcxyNPwKfxyb
	93DrUsqsCfKoWnAxkugJXUg4F0BYyKNODfAHjV+3a0+hlOVRs9JQLPll4j8HGlokScTWfEPD29aL6
	yQdSIdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZIl-0000000G9ip-03W5;
	Mon, 23 Mar 2026 07:02:15 +0000
Received: from 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ZIi-0000000G9ib-15sM;
	Mon, 23 Mar 2026 07:02:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: fix architecture-specific compat_ftruncate64 implementations
Date: Mon, 23 Mar 2026 08:01:43 +0100
Message-ID: <20260323070205.2939118-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
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

Hi all,

this series fixes a really old bug found by code inspection, where the
architecture-specific 32-bit compat ftruncate64 implementations enforce
the non-LFS file size limit unless opened with O_LARGEFILE.

Diffstat:
 arch/arm64/kernel/sys32.c       |    2 +-
 arch/mips/kernel/linux32.c      |    2 +-
 arch/parisc/kernel/sys_parisc.c |    4 ++--
 arch/powerpc/kernel/sys_ppc32.c |    2 +-
 arch/sparc/kernel/sys_sparc32.c |    2 +-
 arch/x86/kernel/sys_ia32.c      |    3 ++-
 fs/internal.h                   |    3 +--
 fs/open.c                       |   40 +++++++++++++++++++---------------------
 include/linux/syscalls.h        |   16 +++-------------
 io_uring/truncate.c             |    2 +-
 10 files changed, 32 insertions(+), 44 deletions(-)

