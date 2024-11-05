Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC44D12672
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WEmqGAwUxwMp56H1nfaZYAXAr/CRdktuoWvkSCOnn84=; b=T9hAbD/Vn+Z1eTLjJFm6Eiw1Kc
	6N1oGF38SPGWBEFqJRi90TQGAhrSVyvslNsZw7P3lcllxnSXlfmPneagYjFtOi4i2SKkOoM4fa7wK
	L9QRxvib2ayax+4t/Xme9nSvna2namhI1mw2bNQfA4JUu93+Yc7pRRkc2ORES8KAmvAcgQ5CgpbPY
	oJHeRXCfH8UDiDCfPPc/aO39x+git2VnwuyMBymonoRZ/1XnPIHvq4+VtekZf54gji06awACtOzq9
	Cr6gC61w5SzVWnmJXFrd6Nmd1S7lFfHIYMCVnUyexdcO+Z4o+1Z1947TxDR1fUMeVBla2mmvyo5NC
	EqeFeTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8G2c-0000000GYB9-2XBo;
	Tue, 05 Nov 2024 09:40:02 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Fw3-0000000GWRt-1jCH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:33:19 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4XjNQW53RZzQsYC;
	Tue,  5 Nov 2024 17:32:03 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id AF49D1400CA;
	Tue,  5 Nov 2024 17:33:09 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 5 Nov 2024 17:33:08 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: [PATCH v8 0/4] Support SMT control on arm64
Date: Tue, 5 Nov 2024 17:32:33 +0800
Message-ID: <20241105093237.63565-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_013315_801557_4AF8FD76 
X-CRM114-Status: GOOD (  12.44  )
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

The core CPU control framework supports runtime SMT control which
is not yet supported on arm64. Besides the general vulnerabilities
concerns we want this runtime control on our arm64 server for:

- better single CPU performance in some cases
- saving overall power consumption

This patchset implements it in the following aspects:

- Provides a default topology_is_primary_thread()
- support retrieve SMT thread number on OF based system
- support retrieve SMT thread number on ACPI based system
- select HOTPLUG_SMT for arm64

Tests has been done on our real ACPI based arm64 server and on
ACPI/OF based QEMU VMs.

Change since v7:
Address the comments from Thomas:
- Add a newline between the glue define and function of topology_is_primary_thread
- Explicitly mention the sibling mask won't be empty in the comment
Link: https://lore.kernel.org/lkml/20241030125415.18994-1-yangyicong@huawei.com/

Change since v6:
- Fix unused variable if !CONFIG_ARM64 || !CONFIG_RISV found by lkp-test
- Fix max_smt_thread_num updating in OF path pointed by Pierre
- Drop unused variable and refine the comments/commit per Pierre
Link: https://lore.kernel.org/linux-arm-kernel/20241015021841.35713-1-yangyicong@huawei.com/

Change since v5:
- Drop the dependency on CONFIG_SMP since it's always on on arm64, per Pierre
- Avoid potential multiple calls of cpu_smt_set_num_threads() on asymmetric system, per Dietmar
- Detect heterogenous SMT topology and issue a warning for partly support, per Pierre
- Thanks Dietmar for testing, didn't pickup the tag due to code changes. Thanks testing by Pierre
Link: https://lore.kernel.org/linux-arm-kernel/20240806085320.63514-1-yangyicong@huawei.com/

Change since v4:
- Provide a default topology_is_primary_thread() in the framework, Per Will
Link: https://lore.kernel.org/linux-arm-kernel/20231121092602.47792-1-yangyicong@huawei.com/

Change since v3:
- Fix some build and kconfig error reported by kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/linux-arm-kernel/20231114040110.54590-1-yangyicong@huawei.com/

Change since v2:
- Detect SMT thread number at topology build from ACPI/DT, avoid looping CPUs
- Split patches into ACPI/OF/arch_topology path and enable the kconfig for arm64
Link: https://lore.kernel.org/linux-arm-kernel/20231010115335.13862-1-yangyicong@huawei.com/

Yicong Yang (4):
  cpu/SMT: Provide a default topology_is_primary_thread()
  arch_topology: Support SMT control for OF based system
  arm64: topology: Support SMT control on ACPI based system
  arm64: Kconfig: Enable HOTPLUG_SMT

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/kernel/topology.c        | 57 +++++++++++++++++++++++++++++
 arch/powerpc/include/asm/topology.h |  1 +
 arch/x86/include/asm/topology.h     |  2 +-
 drivers/base/arch_topology.c        | 24 ++++++++++++
 include/linux/topology.h            | 20 ++++++++++
 6 files changed, 104 insertions(+), 1 deletion(-)

-- 
2.24.0


