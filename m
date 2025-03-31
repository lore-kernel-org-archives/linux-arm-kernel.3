Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DB3C36014
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3NfO9+pY9cs0BW67YxaxqVd9q7A2yI+B8v2845V3Bb0=; b=b7XJaGRYk0q6CchbuHhFAlubWi
	e4QGS+sGhnW/olSaBXs5hEjnoFWl9TTeZQRMqrGbKVg8s+cUKnAywRH8i4dLftZZ8d1yevfhOwFts
	vC7WAvNPbGk7qqGRLbCIixy1+GKJHyB09JxuxqQmirMOz2CmHYRDQVwGeMAALVO2vyFj/S/5xplJ7
	zt0N0isAAFYV/z1xfCl3ZGHR813v5n6SvtphzhjZ3ZrnJvUVdnR8HpXI5jTHSiuO6S+E9eA67Nuef
	r9Axx2x4kwLdduvaKvrSx7VCT7aW3k/MHCQcGZm9fhGx6/Ejv9zrcUMJgBHaLwsUtZtUrTUhp8EmT
	5PEbFNoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC0H-0000000Hb5t-1vDS;
	Mon, 31 Mar 2025 10:04:25 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBfo-0000000HXqa-37Fv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 09:43:20 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4ZR5h54JLJzHrMh;
	Mon, 31 Mar 2025 17:39:49 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 0DB091800E2;
	Mon, 31 Mar 2025 17:43:09 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 31 Mar 2025 17:43:08 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>,
	<tangchengchang@huawei.com>
Subject: [PATCH v2 0/6] Add support for FEAT_{LS64, LS64_V} and related tests
Date: Mon, 31 Mar 2025 17:43:14 +0800
Message-ID: <20250331094320.35226-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_024317_090016_11C6EEDF 
X-CRM114-Status: GOOD (  11.68  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Armv8.7 introduces single-copy atomic 64-byte loads and stores
instructions and its variants named under FEAT_{LS64, LS64_V}.
Add support for Armv8.7 FEAT_{LS64, LS64_V}:
- Add identifying and enabling in the cpufeature list
- Expose the support of these features to userspace through HWCAP3
  and cpuinfo
- Add related hwcap test
- Handle the trap of unsupported memory (normal/uncacheable) access in a VM

A real scenario for this feature is that the userspace driver can make use of
this to implement direct WQE (workqueue entry) - a mechanism to fill WQE
directly into the hardware.

This patchset also complement with Marc's patchset v2[1] for handling LS64*
trapped if not advertised for a VM.

[1] https://lore.kernel.org/linux-arm-kernel/20250310122505.2857610-1-maz@kernel.org/

Tested with updated hwcap test:
On host:
root@localhost:/tmp# dmesg | grep "All CPU(s) started"
[    0.504846] CPU: All CPU(s) started at EL2
root@localhost:/tmp# ./hwcap
[...]
# LS64 present
ok 217 cpuinfo_match_LS64
ok 218 sigill_LS64
ok 219 # SKIP sigbus_LS64
# LS64_V present
ok 220 cpuinfo_match_LS64_V
ok 221 sigill_LS64_V
ok 222 # SKIP sigbus_LS64_V
# 115 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:107 fail:0 xfail:0 xpass:0 skip:115 error:0

On guest:
root@localhost:/# dmesg | grep "All CPU(s) started"
[    0.205580] CPU: All CPU(s) started at EL1
root@localhost:/mnt# ./hwcap
[...]
# LS64 present
ok 217 cpuinfo_match_LS64
ok 218 sigill_LS64
ok 219 # SKIP sigbus_LS64
# LS64_V present
ok 220 cpuinfo_match_LS64_V
ok 221 sigill_LS64_V
ok 222 # SKIP sigbus_LS64_V
# 115 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Totals: pass:107 fail:0 xfail:0 xpass:0 skip:115 error:0

Change since v1:
- Drop the suppport for LS64_ACCDATA
- handle the DABT of unsupported memory type after checking the memory attributes
Link: https://lore.kernel.org/linux-arm-kernel/20241202135504.14252-1-yangyicong@huawei.com/

Yicong Yang (6):
  arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V} usage at EL0/1
  arm64: Add support for FEAT_{LS64, LS64_V}
  KVM: arm64: Enable FEAT_{LS64, LS64_V} in the supported guest
  kselftest/arm64: Add HWCAP test for FEAT_{LS64, LS64_V}
  arm64: Add ESR.DFSC definition of unsupported exclusive or atomic
    access
  KVM: arm64: Handle DABT caused by LS64* instructions on unsupported
    memory

 Documentation/arch/arm64/booting.rst      | 12 +++
 Documentation/arch/arm64/elf_hwcaps.rst   |  6 ++
 arch/arm64/include/asm/el2_setup.h        | 12 ++-
 arch/arm64/include/asm/esr.h              |  8 ++
 arch/arm64/include/asm/hwcap.h            |  2 +
 arch/arm64/include/asm/kvm_emulate.h      |  7 ++
 arch/arm64/include/uapi/asm/hwcap.h       |  2 +
 arch/arm64/kernel/cpufeature.c            | 51 +++++++++++++
 arch/arm64/kernel/cpuinfo.c               |  2 +
 arch/arm64/kvm/inject_fault.c             | 35 +++++++++
 arch/arm64/kvm/mmu.c                      | 37 +++++++++-
 arch/arm64/tools/cpucaps                  |  2 +
 tools/testing/selftests/arm64/abi/hwcap.c | 90 +++++++++++++++++++++++
 13 files changed, 264 insertions(+), 2 deletions(-)

-- 
2.24.0


