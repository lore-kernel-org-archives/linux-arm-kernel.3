Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0DFCD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 18:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6DFAB7G1itCWZw/Vj7LMdF5D1S7CykR/gddopXwvBU8=; b=GWPj7lY8oBUF0pcsqXb3JkoVyh
	ZqtEePwc7HW9hNH0WKjyLisfMtBz8U9B58xshUIJP5qZMGx9VsBIeWQmPxNX6Gcbbo98owJgHKGVE
	BKx5ikcgYsqG+wBhGpgepeDzB1ykfkIv5Q0SNNo5fh8DbQDwwEF1kbDsQF8DsfO+uLhM154Cg0Yn/
	ucKNS6/qMTYgBywKFd9KKu/wwKcz9H8E0ufbkF/kmqdHvpFjjjLX5yVBspjJqilD8YgJceKqz8OIy
	FPBFsHauP0aCqxgc6M/bs3windhFxY8J9NBojdyzW09HsdkOI16tSUVWWJRrxwVjR+hTFSNbwmz9j
	b47FqshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0ue-00000006AhC-2upB;
	Tue, 09 Jun 2026 18:10:56 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX0uY-00000006AeN-2JgV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 18:10:53 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id AE44B20B7167;
	Tue,  9 Jun 2026 11:10:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AE44B20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1781028630;
	bh=6DFAB7G1itCWZw/Vj7LMdF5D1S7CykR/gddopXwvBU8=;
	h=From:To:Cc:Subject:Date:From;
	b=M7tlh53UoCFVDin1XTimLOl0D51t5JlWfrI5m/sGTXeFI+iFH4qF8h5JrLIffywFt
	 Vt6wUuwAyaOHP2O9LhZC0h+3LU/UcSOQCvhmzusdBkDkVArSIssc+0Wf7V8OUMm4FJ
	 iLILTRQBihGwoYWBYl6RxHc98PR5FjNZNSw9wNZ8=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	arnd@arndb.de,
	thuth@redhat.com,
	linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	mhklinux@outlook.com
Subject: [RFC PATCH 0/6] arm64: hyperv: Add Realm support for Hyper-V
Date: Tue,  9 Jun 2026 11:10:24 -0700
Message-ID: <20260609181030.2378391-1-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_111050_739777_2286E863 
X-CRM114-Status: GOOD (  10.47  )
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

From: Kameron Carr <kameroncarr@microsoft.com>

Realms (CoCo VMs on ARM) require host calls to be routed through the RMM
(Realm Management Monitor) via the RSI (Realm Service Interface). This
series implements most of the necessary changes to support Realms on
Hyper-V.

One required change is not included in this series. The two buffers
allocated via vzalloc() in netvsc_init_buf() cannot be decrypted in
vmbus_establish_gpadl(). Currently only linearly mapped memory can be
decrypted. See my RFC patch [1]. I will implement the accompanying netvsc
changes based on the feedback I receive on that patch.

This patch series was tested by booting a Realm on Cobalt 200 running
Windows. I decreased the buffer size and used kzalloc() in
netvsc_init_buf() in my testing as a workaround for the issue mentioned
above.

[1] https://lore.kernel.org/all/20260521205834.1012925-1-kameroncarr@linux.microsoft.com/

Kameron Carr (6):
  arm64: rsi: Add RSI host call structure and helper function
  firmware: smccc: Detect hypervisor via RSI host call in CCA Realms
  arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
  Drivers: hv: Mark shared memory as decrypted for CCA Realms
  arm64: hyperv: Route hypercalls through RSI host call in CCA Realms
  arm64: hyperv: Implement hv_is_isolation_supported() for CCA Realms

 arch/arm64/hyperv/hv_core.c       | 175 ++++++++++++++++++++++++------
 arch/arm64/hyperv/mshyperv.c      |  88 ++++++++++++++-
 arch/arm64/include/asm/mshyperv.h |   3 +
 arch/arm64/include/asm/rsi_cmds.h |   9 ++
 arch/arm64/include/asm/rsi_smc.h  |   6 +
 drivers/firmware/smccc/smccc.c    |  41 ++++++-
 drivers/hv/hv_common.c            |   9 +-
 include/asm-generic/mshyperv.h    |   1 +
 8 files changed, 294 insertions(+), 38 deletions(-)


base-commit: 7a035678fc2bdee81881170764ef08a91a076147
-- 
2.45.4


