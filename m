Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D8C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qLbIGk/M;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=C2NnhdMq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Hq3qHGQR7nv/3NC9Br2iwzyPeeGRgGD2fYTnbPgW0qA=; b=qLbIGk/MMXK7gsps7B5cReVhCG
	unXXNsKnLp5XSswgT5OXHe2dHlC02c0RAlcvp6LMPR+AmFItaxw4pVK74FY4rHVBoAUycz5rSnq5m
	KN897Gtpacgz6eIC5xqFB1ok16rMyg+QBWoASN/7rTUM194H14ySfCSQjsjSkBExo1xmgaSSKzRJZ
	jS0bJ7AN8c69guolwycorYcYsT4iON/jY8ZdIt8iNV/0IPFCMxqczpIkne5yvffpfsYXxKN/Tgj5p
	b3qedUzemu+sNYNsZXK0Q+E3xHAstTQ7wZQK11PVSZNEQajzerULM6BAawseG1kBW8/3UP4Bz2psW
	pzlX8SJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwk6-0000000Clel-23EJ;
	Sat, 31 Oct 2026 00:14:42 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwk3-0000000ClcR-2pTz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:14:40 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id A7DBB20B7166;
	Fri, 30 Oct 2026 17:14:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A7DBB20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793405664;
	bh=Hq3qHGQR7nv/3NC9Br2iwzyPeeGRgGD2fYTnbPgW0qA=;
	h=From:To:Cc:Subject:Date:From;
	b=C2NnhdMqxNXKrhhx7bh6/zGSQFCn3+/nXNbYbSrYButfurlnwkMWud2lCo4z8xymU
	 qPmhm7y/OIZzFYRjW7k1GW6xKJ8+f2IulBwlX4qXf4n9umohAyHjrjIzMsKVGzkr7e
	 CFz5R50xGAeDo374L0bYFcQIEniU4NIYWYj+6jmo=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: decui@microsoft.com,
	haiyangz@microsoft.com,
	mhklinux@outlook.com,
	wei.liu@kernel.org
Cc: arnd@arndb.de,
	catalin.marinas@arm.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	sudeep.holla@kernel.org,
	thuth@redhat.com,
	will@kernel.org
Subject: [PATCH v6 0/6] arm64: hyperv: Add Realm support for Hyper-V
Date: Fri, 30 Oct 2026 17:14:06 -0700
Message-ID: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_171439_773183_70CA8C1B 
X-CRM114-Status: GOOD (  13.35  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

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
             arithmetic.~ (reverted in v3)
  Patch 5: Add a helper function to reduce repetition
           Check for NULL before indexing into host call array

Changes since v2 [3]:
  Patch 3: Remove hv_hostcall_free() and inline the logic for simplicity
           Reorder edits to keep #include line at the end of the file
  Patch 4: Remove kasan_reset_tag()

Changes since v3 [4]:
  Rebased onto arm64 for-next/smccc-bus which includes moving RSI header
  files out of arch/arm64 [5]

Changes since v4 [6]:
  Patch 1, 2, 4: Fix commit message to reflect the new header file names
  Patch 5: Remove extra blank line

Changes since v5 [7]:
  Patch 2: Move Realm hypervisor detection out of the generic
           arm_smccc_hypervisor_has_uuid() into hyperv_detect_via_smccc()
           so other SMCCC users are unaffected
  Patch 3: Drop the <linux/arm-rsi-cmds.h> include, now added in patch 2

[1] https://lore.kernel.org/all/20260721195633.1438361-1-kameroncarr@linux.microsoft.com/
[2] https://lore.kernel.org/all/20260609181030.2378391-1-kameroncarr@linux.microsoft.com/
[3] https://lore.kernel.org/all/20260625173500.1995481-1-kameroncarr@linux.microsoft.com/
[4] https://lore.kernel.org/all/20260721201148.1441143-1-kameroncarr@linux.microsoft.com/
[5] https://lore.kernel.org/all/20260923140405.1111554-4-aneesh.kumar@kernel.org/
[6] https://lore.kernel.org/all/20261001220552.1793471-1-kameroncarr@linux.microsoft.com/
[7] https://lore.kernel.org/all/20261002215725.2015959-1-kameroncarr@linux.microsoft.com/

Kameron Carr (6):
  arm64: rsi: Add RSI host call structure and helper function
  arm64: hyperv: Detect Hyper-V via RSI host call in CCA Realms
  arm64: hyperv: Add per-CPU RSI host call infrastructure for CCA Realms
  Drivers: hv: Mark shared memory as decrypted for CCA Realms
  arm64: hyperv: Route hypercalls through RSI host call in CCA Realms
  arm64: hyperv: Implement hv_is_isolation_supported() for CCA Realms

 arch/arm64/hyperv/hv_core.c       | 155 +++++++++++++++++++++++-------
 arch/arm64/hyperv/mshyperv.c      |  62 +++++++++++-
 arch/arm64/include/asm/mshyperv.h |   4 +
 drivers/hv/hv_common.c            |  17 +++-
 include/asm-generic/mshyperv.h    |   1 +
 include/linux/arm-rsi-cmds.h      |  22 +++++
 include/linux/arm-smccc-rsi.h     |   7 ++
 7 files changed, 228 insertions(+), 40 deletions(-)


base-commit: bce57945f5e7207960b2bd567a6e880f90258ffb
-- 
2.45.4


