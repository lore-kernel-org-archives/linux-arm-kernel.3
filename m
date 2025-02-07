Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A61C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 19:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xX+XVFZmDa0loQ6xNj16gwk+BuKlZVk5CTsEHisc09Q=; b=OXcvWlZd0L6fXCiNBWsbp492aU
	gR8UkYgrO0sm1BKcz66Q7UKrULpErml18gth0MOAaZwNmo8Wt42lxQ0fF0OCox262VTANHqoTtZP5
	aJh5cVkA7QFx0KU8XIpdk+b4yVx8dusRTbNG5JImj/y4oFD9YNfksXxmOZ8J+uIAOZCw78zYW4zR0
	k3xpFLqMunAnPbeNQVQfs07lD9n0BEgILw73XFHduEtDB1IJLaS8qXgWtyPNAuXUhmsaNVZHfSkv7
	KUg12bE30Z+M9kvm4OUvOtB6pp2kC7OFDgjf4PfDOBmF5+mfwyuwi3dIdbzdbzAXQKTWnUr8HKT76
	zcw2SV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTez-0000000AqIr-0Yg9;
	Fri, 07 Feb 2025 19:05:05 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTdb-0000000Apse-0BNY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 19:03:40 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 249502107305;
	Fri,  7 Feb 2025 11:03:37 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 249502107305
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1738955017;
	bh=xX+XVFZmDa0loQ6xNj16gwk+BuKlZVk5CTsEHisc09Q=;
	h=From:To:Cc:Subject:Date:From;
	b=sgtvWWA/hqIKpssFoNrKh1/hgsZgqNSTWihh0PLe3YUb92zm0ou8GkXK1Y/xwP8lo
	 59LKpGV01e7zseYnHKRZsw6aBlDlUwGc++m+Q+Co/AAbAtZxdgzLEsCYXVwiRFOPdX
	 VHWwaXqF5A0IfG7YL08bM9sKZknzolFsPXktCSuI=
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
To: linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	wei.liu@kernel.org,
	mhklinux@outlook.com
Cc: kys@microsoft.com,
	haiyangz@microsoft.com,
	decui@microsoft.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com,
	skinsburskii@linux.microsoft.com,
	mukeshrathor@microsoft.com
Subject: [PATCH v3 0/2] hyperv: Move some features to common code
Date: Fri,  7 Feb 2025 11:03:20 -0800
Message-Id: <1738955002-20821-1-git-send-email-nunodasneves@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_110339_099244_018797EA 
X-CRM114-Status: GOOD (  10.75  )
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

There are several bits of Hyper-V-related code that today live in
arch/x86 but are not really specific to x86_64 and will work on arm64
too.

Some of these will be needed in the upcoming mshv driver code (for
Linux as root partition on Hyper-V). So this is a good time to move
them to drivers/hv.

Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
---
Changes in v3:
* Just use percpu input page for the hypercall [Michael Kelley]
* Move the calls to hv_get_partition_id() back to arch code [Michael Kelley]
* Rename struct hv_get_partition_id to hv_output_get_partition_id
  [Michael Kelley]

Changes in v2:
* Fix dependence on percpu output page by using a stack variable for the
  hypercall output [Michael Kelley]
* Remove unnecessary WARN()s [Michael Kelley]
* Define hv_current_partition_id in hv_common.c [Michael Kelley]
* Move entire hv_proc.c to drivers/hv [Michael Kelley]

Nuno Das Neves (2):
  hyperv: Move hv_current_partition_id to arch-generic code
  hyperv: Move arch/x86/hyperv/hv_proc.c to drivers/hv

 arch/arm64/hyperv/mshyperv.c              |  3 +++
 arch/x86/hyperv/Makefile                  |  2 +-
 arch/x86/hyperv/hv_init.c                 | 25 +----------------------
 arch/x86/include/asm/mshyperv.h           |  6 ------
 drivers/hv/Makefile                       |  2 +-
 drivers/hv/hv_common.c                    | 22 ++++++++++++++++++++
 {arch/x86/hyperv => drivers/hv}/hv_proc.c |  4 ----
 include/asm-generic/mshyperv.h            |  6 ++++++
 include/hyperv/hvgdk_mini.h               |  2 +-
 9 files changed, 35 insertions(+), 37 deletions(-)
 rename {arch/x86/hyperv => drivers/hv}/hv_proc.c (98%)

-- 
2.34.1


