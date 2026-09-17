Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E44FC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 00:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9mocQYsw8Xorg/wDW8dD4RlTLvBIRGFfneCIsy9mwcU=; b=G0qK2D/3zBaNSB88in3b5SrwaO
	obceLSWqbNXnx8lClvCQRv6ncjmR4sdimUed8hwfC4LMMdrEpydU0UZeAui3G+zC7EpgVYvYYvAZ7
	F7DHRQfZ2hMQI4o3vrBnQb93Q/K+rXxZz9BSf5ccT9NhPAMocthdPsQZEejQExyk+yDnXGMn6J2uO
	ZbeEuibwud9gpEv4SZ4ZrlT/NYfgTrXh9O+/gTi//eL10j3Juzo8tJhP17zmT6hNWk0GJax/FV+Kw
	FPLsuoPbn27vXcdssJTODeXN48lGYk3XqXtaTfwZGpnYS44IV01/jRvI/H+QaUNKIEMOvDV/6uLY8
	mKYwF7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zZq-0000000AIfT-1IVm;
	Thu, 17 Sep 2026 00:02:10 +0000
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.34.181.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zZn-0000000AIdx-1boq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 00:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1789603327; x=1821139327;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9mocQYsw8Xorg/wDW8dD4RlTLvBIRGFfneCIsy9mwcU=;
  b=tcX2Vq4YbObOZYapws7ANfJxQ0PVMsQb2XL9l4yDlH78EsUvtIQVz6hO
   2m34UC6cTIsMCK27AuyabWucVtw1B7HiIER2modsj7ncqVGxtQHm91UJL
   mYb7WzB9qdHfR9x8Dz4HEjOk+7LehMKYc3QFQ1a5zv5SkwLkwGcYOhTmi
   hfF6QstPdWwVP0ov8tRhgfiOcY3oIBXzbU6N3Sv8AfEJh7HNSTmtwqPHX
   ZJWHe/1v7grXKPlIpTnFsnNoPrQBGcMWQyEjGg28XVnNCCnWjBULUY8wv
   eQjJYWFVZwqlRYru1JRxOsbbEejpQK6+VlLrpAV/M0PEcvVVHJbCgtfbL
   w==;
X-CSE-ConnectionGUID: 5TrwQichSUiGFISsrTr/bg==
X-CSE-MsgGUID: 9JHjirDYTeOTFob3ujTtGw==
X-IronPort-AV: E=Sophos;i="6.27,103,1787011200"; 
   d="scan'208";a="28869506"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 00:02:02 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:28052]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.23.40:2525] with esmtp (Farcaster)
 id 6799baba-8ba3-4c1c-91fa-c8645b74d55a; Thu, 17 Sep 2026 00:02:02 +0000 (UTC)
X-Farcaster-Flow-ID: 6799baba-8ba3-4c1c-91fa-c8645b74d55a
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 00:02:01 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Thu, 17 Sep 2026 00:02:01 +0000
From: Jay Wang <wanjay@amazon.com>
To: <bpf@vger.kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>
CC: <yonghong.song@linux.dev>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<x86@kernel.org>, <dave.hansen@linux.intel.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <abuehaze@amazon.com>, <doebel@amazon.de>,
	<jay.wang.upstream@gmail.com>
Subject: [PATCH bpf-next 0/1] bpf: btf: make vmlinux BTF disposable at boot to save ~5 MiB
Date: Thu, 17 Sep 2026 00:02:00 +0000
Message-ID: <20260917000201.25581-1-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.198.4]
X-ClientProxiedBy: EX19D040UWB002.ant.amazon.com (10.13.138.89) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_170207_480958_1984E885 
X-CRM114-Status: GOOD (  11.64  )
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

Based on and tested against mainline commit 9b87fdc9af2f ("Merge tag
'sched_ext-for-7.3-rc3-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext").

This patch adds a "btf=off" boot parameter that disables the vmlinux BTF
and frees the pages backing it, recovering ~5 MiB.  The reasons for making
it a boot-time choice are below.

A distribution ships one kernel binary to every user, so each CONFIG_*
choice applies to all of them.  CONFIG_DEBUG_INFO_BTF is one where that
hurts: the vmlinux .BTF section stays in rodata for the whole boot,
5.2 MiB on x86-64 and 5.3 MiB on arm64 with a distribution config.  On a
1 GiB VM, a common cloud instance size, that is a visible part of total
memory.  Off takes BTF away from the users who need it; on charges the
users who never touch it.

Letting the user decide at boot follows the existing
CONFIG_SECURITY_SELINUX_BOOTPARAM, which does the same for selinux=0.
With btf=off the kernel behaves as if CONFIG_DEBUG_INFO_BTF were not set,
so nothing can reach the section and its pages are freed.  BPF features
needing kernel type information then fail program load cleanly, exactly as
on a config-off kernel.  By default the parameter is not set and nothing
changes.

The freeing implementation is architecture-specific, and btf=off is
currently supported on x86-64 and arm64.

Testing: x86-64 and arm64 boot with and without btf=off.  With btf=off,
/sys/kernel/btf is absent and ~5 MiB is returned to the page allocator.

Jay Wang (1):
  bpf: btf: add btf=off boot parameter to disable and free vmlinux BTF

 .../admin-guide/kernel-parameters.txt         |  14 +++
 arch/arm64/mm/mmu.c                           | 108 +++++++++++++++++-
 arch/x86/mm/init_64.c                         |  30 +++++
 arch/x86/mm/pat/set_memory.c                  |  28 ++++-
 include/linux/btf.h                           |   9 ++
 kernel/bpf/btf.c                              |  51 ++++++++-
 kernel/bpf/sysfs_btf.c                        |   7 ++
 kernel/bpf/verifier.c                         |   2 +-
 8 files changed, 241 insertions(+), 8 deletions(-)


base-commit: 9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
-- 
2.47.3


