Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 056F2C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 15:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpXlZR7pvjm05Xx5f5EcvCOyQaDabKZP0y/iVhUjTO8=; b=mjPzPy69y8xLj5xXVl5N3PnHPD
	6m3M5YOX58Am0yYuSZW9MZX7EOi0e9wvgvQwg6FcFPa/th0D/UwjOoqVQISubdaFpmkOCdrnxZhaA
	A8FAvktpNAT0I8Ttb1yT+LFGNWcqyuXzWpKoRRhav0uOasTNY4k2i1VvDKiT6lDo7m+x2Mx/RvAiX
	GfykS6kakgeu5JwpuVc7dnuRjnfuYPeXT5ANE8Rqs2+mlFQtAL+v9L6wpPZaBzzixvxxcES2SPNd6
	ZmjtfUdU2A4ZrN+fVOuB0L8HfRrrszE3YDw4uekaN+1A9tda8Aey6LWrqMt2CVMHply//V3og+K3j
	HMfiunTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4me-0000000BonH-2Gko;
	Thu, 20 Aug 2026 15:34:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4mZ-0000000Bojw-3GFB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 15:34:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 410CD1691;
	Thu, 20 Aug 2026 08:34:13 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 49D983F763;
	Thu, 20 Aug 2026 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787240057; bh=XiIMUAI3CQTSrJclmRgZXDewMHXUs7lMHRaU8Wfpa4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sqPysWCE6zOjewZ/05h1yx2wTxbz/AhF4/2AV7LXJZCyUHIZoMggpYHP0HIEmZByQ
	 LOBJJFFh1tfqbDGJlKaAOfH9AdLF9qo/WzeepKNsOikeIa5sNPA/Rd8sj5sBxh4Nl6
	 e2KKrOVKxclOHwikMlkQh/hxVKZ4Kv6csgogmFYU=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH 4/4] selftest/arm64: Add MTE test config fragment
Date: Thu, 20 Aug 2026 16:33:26 +0100
Message-ID: <20260820153331.2448875-5-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260820153331.2448875-1-usama.anjum@arm.com>
References: <20260820153331.2448875-1-usama.anjum@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_083419_854555_7AC5A77A 
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

The arm64 selftest collection has no Kconfig fragment, so kernels built
with the selftest requirements are not guaranteed to provide the support
used by the MTE tests.

Add a fragment covering the userspace MTE and tagged-address ABIs, KSM
and its sysfs interface, explicit HugeTLB mappings and their proc/sysctl
interfaces, and tmpfs-backed file mappings.

Do not request NUMA solely for the optional KSM merge_across_nodes.

Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
---
 tools/testing/selftests/arm64/mte/config | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 tools/testing/selftests/arm64/mte/config

diff --git a/tools/testing/selftests/arm64/mte/config b/tools/testing/selftests/arm64/mte/config
new file mode 100644
index 0000000000000..8587ce70c294a
--- /dev/null
+++ b/tools/testing/selftests/arm64/mte/config
@@ -0,0 +1,8 @@
+CONFIG_ARM64_MTE=y
+CONFIG_ARM64_TAGGED_ADDR_ABI=y
+CONFIG_HUGETLBFS=y
+CONFIG_KSM=y
+CONFIG_PROC_FS=y
+CONFIG_SYSCTL=y
+CONFIG_SYSFS=y
+CONFIG_TMPFS=y
-- 
2.47.3


