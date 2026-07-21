Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8972CC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KvELOKnXweNAABsGu85MvPOUP6ZAsKveNW1hQG8kwQ4=; b=vDdK45F0DCIj8cQ2mwAvhkgS1H
	me6c/HLFRN4iTP71fnC5ib7FU20pW2WSXun5ZYIGGm5H8+x0vwqBpQSUfwfjruHOJC3bqbwdo0Sh/
	uzP6Att1mlk+ptkP7jDXUOyR9lpZAFfv39vTv0Qn0GvvT7HL454K6wJMiwTw5warORXuTgzN46gn5
	rMvVKt89ya1Xyw4nY4M1ov8GMckjgguiVoVtQ8mH1K0m5lnNm/R4JF2o/J9vEo3LIdNDQd2BHr4T2
	gr41OKymluYzuWCe55i24q/ORQQkaVDk+Hsd7zldcaJ8txfp35r3BtNTgwQALjIH44lQQgxivqFMh
	bOZCJ70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGou-0000000ALbb-0k6Q;
	Tue, 21 Jul 2026 20:12:04 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmGos-0000000ALZR-0Ijx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:12:03 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 630B420B7167;
	Tue, 21 Jul 2026 13:11:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 630B420B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784664708;
	bh=KvELOKnXweNAABsGu85MvPOUP6ZAsKveNW1hQG8kwQ4=;
	h=From:To:Cc:Subject:Date:From;
	b=THw6yirloThwygFAOBUVRn0KR+4/+r6OHOZBOFbETFfvSd4XcPJTTKk0OsA+tjgv0
	 dKoCrTOV2FwHp/xtqpdwZV64gT0Q8fQYjeFKwx3JrDNTyBFrs4J9KTqSmrxPkt6Upv
	 BhgGrhCfo4Sx456SG7kTMwEZOfxvnvgc7jOVsqUs=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: kys@microsoft.com,
	haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	longli@microsoft.com,
	mhklinux@outlook.com
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
	linux-arch@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: hyperv: Add Realm support for Hyper-V
Date: Tue, 21 Jul 2026 13:11:42 -0700
Message-ID: <20260721201148.1441143-1-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_131202_139467_5C483D57 
X-CRM114-Status: GOOD (  13.11  )
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

Realms (CoCo VMs on ARM) require host calls to be routed through the RMM
(Realm Management Monitor) via the RSI (Realm Service Interface). This
series implements most of the necessary changes to support Realms on
Hyper-V.

One required change is not included in this series. The two buffers
allocated via vzalloc() in netvsc_init_buf() cannot be decrypted in
vmbus_establish_gpadl(). Currently only linearly mapped memory can be
decrypted.

This patch series was tested by booting a Realm on Cobalt 200 running
Windows. I tested 4KB and 64KB page size. I replaced vzalloc() in
netvsc_init_buf() with alloc_pages_node() -> set_memory_decrypted() ->
vmap() in my testing as a workaround for the issue mentioned above [1].

Changes since v1 [2]:
  Patch 1: Add explicit padding to the RSI host call structure
  Patch 3: Change from a per-cpu pointer lazily allocated to an array
             of host call structs indexed by cpu id
  Patch 4: Align input_page + output_page allocation to PAGE_SIZE since
             that is the smallest unit of memory that can be decrypted
           ~Remove KASAN tags before passing address to
             set_memory_decrypted() since __is_lm_address() does pointer
             arithmetic.~
  Patch 5: Add a helper function to reduce repetition
           Check for NULL before indexing into host call array

Changes since v2 [3]:
  Patch 3: Remove hv_hostcall_free() and inline the logic for simplicity
           Reorder edits to keep #include line at the end of the file
  Patch 4: Remove kasan_reset_tag()

[1] https://lore.kernel.org/all/20260721195633.1438361-1-kameroncarr@linux.microsoft.com/
[2] https://lore.kernel.org/all/20260609181030.2378391-1-kameroncarr@linux.microsoft.com/
[3] https://lore.kernel.org/all/20260625173500.1995481-1-kameroncarr@linux.microsoft.com/

Kameron Carr (6):
  arm64: rsi: Add RSI host call structure and helper function
  firmware: smccc: Detect hypervisor via RSI host call in CCA Realms
  arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
  Drivers: hv: Mark shared memory as decrypted for CCA Realms
  arm64: hyperv: Route hypercalls through RSI host call in CCA Realms
  arm64: hyperv: Implement hv_is_isolation_supported() for CCA Realms

 arch/arm64/hyperv/hv_core.c       | 155 +++++++++++++++++++++++-------
 arch/arm64/hyperv/mshyperv.c      |  38 +++++++-
 arch/arm64/include/asm/mshyperv.h |   4 +
 arch/arm64/include/asm/rsi_cmds.h |  22 +++++
 arch/arm64/include/asm/rsi_smc.h  |   7 ++
 drivers/firmware/smccc/smccc.c    |  41 +++++++-
 drivers/hv/hv_common.c            |  17 +++-
 include/asm-generic/mshyperv.h    |   1 +
 8 files changed, 244 insertions(+), 41 deletions(-)


base-commit: a4ffc59238be84dd1c26bf1c001543e832674fc6
-- 
2.45.4


