Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4986EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 17:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AWh+bEdmaln1RHEtqWQnLlstPm6MXFAUrd2fn3zP8yg=; b=I40v3/ACb4e5KaSIUfGfvnPkfR
	naYJtQxs3MOFD5+Q2Dfjx8XbZtRAnja4x8McqCCsEN5CQ4+ponYmfnBk4ybRfU8eKAxQOtYCNlj+N
	b2R3aiWUHcTqq6Gi0Ipft2Gnds9Kzx1s0By17QkEEuFIu9Hk8r96GfWMAC0kQIjdJfseqJehIdl1r
	RfhYR0dnpXfVPGhPQPEeBAyB9Z7IZdSh+pD0A74Q0KiE/ElUu9F9JIcAUlZU1P7BGzx/70uz9TPHG
	D5WezFvBilrbuFk+pMSD1kfgbroMk388iIf7hoVDRJjDkdGczE396QYq2FgPr+/S+xYDDl9sX/+ok
	FfAeGc8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0OgX-00000009UpC-2K2C;
	Thu, 03 Apr 2025 17:49:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Oei-00000009Uak-3ulV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 17:47:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87AB7106F;
	Thu,  3 Apr 2025 10:47:10 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2BA1A3F63F;
	Thu,  3 Apr 2025 10:47:04 -0700 (PDT)
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
Subject: [PATCH v2 0/4] support FEAT_MTE_STORE_ONLY feature
Date: Thu,  3 Apr 2025 18:46:57 +0100
Message-Id: <20250403174701.74312-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_104709_014211_0AA1AE83 
X-CRM114-Status: UNSURE (   7.33  )
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

The FEAT_MTE_STORE_ONLY feature provides support for
tag check for store operation only. read operation is considered
as unchecked operation so it doesn't raise tag check fault.

NOTE:
  This patches based on https://lore.kernel.org/linux-arm-kernel/20250403172758.67106-1-yeoreum.yun@arm.com/

Since v1:
  - add doc to elf_hwcaps.rst
  - add MTE_STORE_ONLY hwcap test

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


