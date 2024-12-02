Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CF8D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nw6W5xqc3Z9VG3T3EDlgZ5f+kVQwTfch4lywz5rVM2k=; b=XVvrmZwjqbM0/J0cZHISKn6KJ6
	kiBPxLo3eM8aB90C6WxWtKmKIseQ1GzfsIjhfoBVsuH2PZhPte+rLcqf5GHKsPNBNe+TF5fw1Vnes
	yCN6gUR9/RZjRBSt1BA7yR+FT117yJ128uG+GSL1UHBWtxUW7va9OTNZIIJNlfUEblljT9HSwSxuG
	NM7nQvv31pWoTaxMu30w256cCgfuQ75vj6PuK6OAReBAzvauXtrAFY84xeu2r7OeAiBE1DSqsPmOQ
	aHMfD0HG1lXdp+jlCXcSWBHKO65CzAd9r+6zhfTFCSUrTZ9QoCZqI2iQsfdOvX74HaIiBMe9s7CET
	0pxZqfGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6ye-00000006KQi-0vgm;
	Mon, 02 Dec 2024 14:00:40 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI6uA-00000006JZU-3Dkb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 13:56:08 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Y24yh36hqz21mLK;
	Mon,  2 Dec 2024 21:54:20 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id ADF711A0188;
	Mon,  2 Dec 2024 21:55:55 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 21:55:54 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <corbet@lwn.net>,
	<linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <joey.gouly@arm.com>, <suzuki.poulose@arm.com>, <yuzenghui@huawei.com>,
	<shuah@kernel.org>, <jonathan.cameron@huawei.com>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 0/5] Add support for FEAT_{LS64, LS64_V, LS64_ACCDATA} and related tests
Date: Mon, 2 Dec 2024 21:54:59 +0800
Message-ID: <20241202135504.14252-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_055603_212847_58C04692 
X-CRM114-Status: GOOD (  11.02  )
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
instructions and its variants named under FEAT_{LS64, LS64_V,
LS64_ACCDATA}. Add support for Armv8.7 FEAT_{LS64, LS64_V, LS64_ACCDATA}:
- Add identifying and enabling in the cpufeature list
- Expose the support of these features to userspace through HWCAP3
  and cpuinfo
- Add related hwcap test
- Handle the trap of unsupported memory (normal/uncacheable) access in a VM

A real scenario for this feature is that the userspace driver can make use of
this to implement direct WQE (workqueue entry) - a mechanism to fill WQE
directly into the hardware.

This patchset also depends on Marc's patchset[1] for enabling related
features in a VM, HCRX trap handling, etc.

[1] https://lore.kernel.org/linux-arm-kernel/20240815125959.2097734-1-maz@kernel.org/

Tested with updated hwcap test:
On host:
root@localhost:/# dmesg | grep "All CPU(s) started"
[    1.600263] CPU: All CPU(s) started at EL2
root@localhost:/# ./hwcap
[snip...]
# LS64 present          
ok 169 cpuinfo_match_LS64
ok 170 sigill_LS64
ok 171 # SKIP sigbus_LS64
# LS64_V present
ok 172 cpuinfo_match_LS64_V
ok 173 sigill_LS64_V
ok 174 # SKIP sigbus_LS64_V
# LS64_ACCDATA present
ok 175 cpuinfo_match_LS64_ACCDATA
ok 176 sigill_LS64_ACCDATA
ok 177 # SKIP sigbus_LS64_ACCDATA
# Totals: pass:92 fail:0 xfail:0 xpass:0 skip:85 error:0

On guest:
root@localhost:/# dmesg | grep "All CPU(s) started"
[    1.375272] CPU: All CPU(s) started at EL1 
root@localhost:/# ./hwcap
[snip...]
# LS64 present
ok 169 cpuinfo_match_LS64
ok 170 sigill_LS64
ok 171 # SKIP sigbus_LS64
# LS64_V present
ok 172 cpuinfo_match_LS64_V
ok 173 sigill_LS64_V
ok 174 # SKIP sigbus_LS64_V
# LS64_ACCDATA present
ok 175 cpuinfo_match_LS64_ACCDATA
ok 176 sigill_LS64_ACCDATA
ok 177 # SKIP sigbus_LS64_ACCDATA
# Totals: pass:92 fail:0 xfail:0 xpass:0 skip:85 error:0

Yicong Yang (5):
  arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V, LS64_ACCDATA}
    usage at EL0/1
  arm64: Add support for FEAT_{LS64, LS64_V, LS64_ACCDATA}
  kselftest/arm64: Add HWCAP test for FEAT_{LS64, LS64_V, LS64_ACCDATA}
  arm64: Add ESR.DFSC definition of unsupported exclusive or atomic
    access
  KVM: arm64: Handle DABT caused by LS64* instructions on unsupported
    memory

 Documentation/arch/arm64/booting.rst      |  28 +++++
 Documentation/arch/arm64/elf_hwcaps.rst   |   9 ++
 arch/arm64/include/asm/el2_setup.h        |  26 ++++-
 arch/arm64/include/asm/esr.h              |   8 ++
 arch/arm64/include/asm/hwcap.h            |   3 +
 arch/arm64/include/uapi/asm/hwcap.h       |   3 +
 arch/arm64/kernel/cpufeature.c            |  70 +++++++++++-
 arch/arm64/kernel/cpuinfo.c               |   3 +
 arch/arm64/kvm/mmu.c                      |  14 +++
 arch/arm64/tools/cpucaps                  |   3 +
 tools/testing/selftests/arm64/abi/hwcap.c | 127 ++++++++++++++++++++++
 11 files changed, 291 insertions(+), 3 deletions(-)

-- 
2.24.0


