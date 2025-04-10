Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA20C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kFQ8Tx4S88c2u8knyHRGjbBG+lh5RtFCJlIOP9nbbpY=; b=xrzX7wuChdkKYQ175+3EMEt3Qr
	eVzdV4eOxyNEff74YNwygRDQqx0CHenkm+DkGZyUTE0b+HzDsgoiVUfSVmUqK4566SxW/cBT5KrQ7
	GnZFTf85VAZOZuzpd7tWDPlk8PgUENYz9xRG8r/3VJdqe1rFkfPQGpjrxRgS4iMqZuyCOhdh6WAVG
	1OfsJ033DeZdz0l9/u3OFxhMXyuZKeVtwkn0glWsqAw/lcxJ4m6naQ/EZXkqac7Zim8eLyFbugL43
	WKsW0IfWfnb60qtfBTD5DNvzYj3gJ7xgyUpG4JcRzJkcPJfMjTjJP8ntHXGyFl+JmrKTFnP8I0uyJ
	DGHyrHAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nPX-00000009m3l-3NZ9;
	Thu, 10 Apr 2025 08:37:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mwc-00000009g7J-0SAk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 08:07:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EEC41007;
	Thu, 10 Apr 2025 01:07:29 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AC7493F694;
	Thu, 10 Apr 2025 01:07:25 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	anshuman.khandual@arm.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	frederic@kernel.org,
	james.morse@arm.com,
	hardevsinh.palaniya@siliconsignals.io,
	shameerali.kolothum.thodi@huawei.com,
	huangxiaojia2@huawei.com,
	mark.rutland@arm.com,
	samuel.holland@sifive.com,
	palmer@rivosinc.com,
	charlie@rivosinc.com,
	thiago.bauermann@linaro.org,
	bgray@linux.ibm.com,
	tglx@linutronix.de,
	puranjay@kernel.org,
	david@redhat.com,
	yang@os.amperecomputing.com,
	mbenes@suse.cz,
	joel.granados@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 0/4] support FEAT_MTE_STORE_ONLY feature
Date: Thu, 10 Apr 2025 09:07:19 +0100
Message-Id: <20250410080723.953525-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_010730_192675_58915895 
X-CRM114-Status: UNSURE (   9.84  )
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

ARMv8.5 based processors introduce the Memory Tagging Extension (MTE) feature.
MTE is built on top of the ARMv8.0 virtual address tagging TBI
(Top Byte Ignore) feature and allows software to access a 4-bit
allocation tag for each 16-byte granule in the physical address space.
A logical tag is derived from bits 59-56 of the virtual
address used for the memory access. A CPU with MTE enabled will compare
the logical tag against the allocation tag and potentially raise an
tag check fault on mismatch, subject to system registers configuration.

Since ARMv8.9, FEAT_MTE_STORE_ONLY can be used to restrict raise of tag
check fault on store operation only.
For this, application can use PR_MTE_STORE_ONLY flag
when it sets the MTE setting with prctl().

This feature omits tag check for fetch/read operation.
So it might be used not only debugging purpose but also be used
by application requiring strong memory safty in normal env.

Since v1:
  - add doc to elf_hwcaps.rst
  - add MTE_STORE_ONLY hwcap test

Since v2:
  - Rebase to 6.15.-rc1

NOTE:
  This patches based on https://lore.kernel.org/all/20250410074721.947380-1-yeoreum.yun@arm.com/

Yeoreum Yun (4):
  arm64/feature: add MTE_STORE_ONLY feature
  prtcl: introduce PR_MTE_STORE_ONLY
  arm64/kernel: support store-only mte tag check
  tools/kselftest: add MTE_STORE_ONLY feature hwcap test

 Documentation/arch/arm64/elf_hwcaps.rst   |  3 +++
 arch/arm64/include/asm/hwcap.h            |  1 +
 arch/arm64/include/asm/processor.h        |  2 ++
 arch/arm64/include/uapi/asm/hwcap.h       |  1 +
 arch/arm64/kernel/cpufeature.c            |  9 +++++++++
 arch/arm64/kernel/cpuinfo.c               |  1 +
 arch/arm64/kernel/mte.c                   | 11 ++++++++++-
 arch/arm64/kernel/process.c               |  6 +++++-
 arch/arm64/tools/cpucaps                  |  1 +
 include/uapi/linux/prctl.h                |  2 ++
 tools/testing/selftests/arm64/abi/hwcap.c |  6 ++++++
 11 files changed, 41 insertions(+), 2 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


