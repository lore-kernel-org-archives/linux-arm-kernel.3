Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9FFCD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=idl7rdt9rNoZBcJ3l7gMyeZax06cbfsHplpvz1CXTeY=; b=BCGJNvE2de/W8FBcQFy2jxkpBa
	EGzt26xiyZiSmlj03cL6K/Gj9wt95odmVwQFIeeIV8ITADfBuni8zLpr5ql/9i1aKaRP+2yNx7vWN
	rsNJWCsqrg13KF2Qg+5b28WlyOrcowzNyC9f6CpSfcKNOwhGP0U7ZKhTpipgctAYhzOzytGfoOkAD
	jWvEzojVS+Q98o/td3gJ9sgxEJtDF1OTFKldwzX5Y4J8zY4g/OTP1VO+uXYo6cKDTb6Ql88+EkC49
	7Wn9R/SbRfOiPuNmxMBEGDdM8fSN4IiFGavWeah0LhcYoMUzZzcHcWN4K9WyZ++DnlRcV/KiDFajL
	RxfMjPXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0r-00000001W3B-2KZG;
	Thu, 18 Jun 2026 15:50:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0p-00000001W1j-0OV4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:50:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DCAB48FF;
	Thu, 18 Jun 2026 08:50:30 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E04273F62B;
	Thu, 18 Jun 2026 08:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781797835; bh=bic77GReQxo7E8WOqH1A1QlKgiA3xgkp3/JZUNBdvt4=;
	h=From:To:Subject:Date:From;
	b=D6QgHgmflPf/2IE+9MJn435CWxfs5XvlbKZuH6kIWNk0/4ovz1pG871jJ+rWBYam/
	 kNIOKrpO4793CBV1QSHnjbv321Yd1fCaKOYg+/A3ekvcISxRU4FHcSeunERpFI/hTB
	 J3au9AIiErjt7l1hHpQv2VAu9KPxV4aZtsjkH7SA=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oupton@kernel.org,
	jean-philippe.brucker@arm.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool v2 0/7] x86 compilation fixes and arm64 PMU improvements
Date: Thu, 18 Jun 2026 16:49:54 +0100
Message-ID: <20260618155001.226266-1-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085039_166918_48171B99 
X-CRM114-Status: GOOD (  12.92  )
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

v1 here [1].

v1 was sent to fix this compilation error:

disk/core.c: In function ‘disk_img_name_parser’:
disk/core.c:27:21: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
   27 |                 sep = strstr(arg, ":");
      |                     ^

fixed in patches #2 and #3.

Working on v2 found another one:

x86/include/kvm/bios.h:91:43: error: ‘regparm’ attribute ignored [-Werror=attributes]
   91 | extern bioscall void int10_handler(struct biosregs *regs);
      |                                           ^~~~~~~~

which is fixed in patch #1.

The remaining of the patches are there to improve PMU initialisation and
error reporting.

Tested on arm64, with and without hugetlbfs, with and without a PMU. Also
tested on arm64 using scsi-virtio (got it working in v2, I couldn't get
scsi-virtio working for v1, most likely user error).

Tested on x86_64 by booting a VM. Don't have an x86_32 machine to do the
same, but I did cross-compile for x86_32.

Changes in v2:

- Patch #1 ("x86: Define bioscall only in 32-bit mode") is new. The bug
  that it fixes was probably triggered when I updated the gcc compiler.

- pmu__init() is now called from gic__init_gic() (Will).

- die_perror() prints the original errno is vsnprintf() fails (Will).

[1] https://lore.kernel.org/kvm/20260323150221.49256-1-alexandru.elisei@arm.com/

Alexandru Elisei (7):
  x86: Define bioscall only in 32-bit mode
  virtio: Do not modify const strings in virtio_9p_rootdir_parser()
  disk/core: Do not modify const strings in disk_img_name_parser()
  arm64: Initialise the PMU after the GIC
  util: Set exit status to errno in die_perror()
  util: Allow die_perror() to take a variable list of argument
  arm64: Improve KVM_ARM_VCPU_PMU_V3_CTRL diagnostics

 arm64/gic.c              |  9 +++++-
 arm64/include/asm/pmu.h  |  3 ++
 arm64/pmu.c              | 59 ++++++++++++++++++++++++++++------------
 disk/core.c              | 44 ++++++++++++++++++++----------
 include/kvm/disk-image.h |  6 ++--
 include/kvm/util.h       |  2 +-
 util/util.c              | 21 ++++++++++++--
 virtio/9p.c              | 21 +++++++++-----
 x86/include/kvm/bios.h   |  4 +++
 9 files changed, 123 insertions(+), 46 deletions(-)


base-commit: 6c2de8d9531c7e9aad7ac6701e848bedb3f1d3a4
-- 
2.54.0


