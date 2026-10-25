Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C0606A334
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 07:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xqHftd08;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TJzimjCe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=z5DPNgnct5lFOm6/GJKN1n5GxtnVi3Rdus7r1K5LOpU=; b=xqHftd08IeRKrHFxAgCj6gZxZ1
	GfGS+U431ZkgwXyLerMJXrRVd9Bl50663h1OkQiw7tK0PBVwTbJJ5H++uejK+UxUOpyC4q5l67VCw
	YjwL36t3tkxOOYybW4MAYfqlNy9UiIlpIwXd3hg7YSYpKOuGg3sirVSSqt9wJ7tm0P8wsemBo3iWS
	0vyv546KKW4LyaDMeHd1xFhPY+Ep/nOKOAYc0mv5UYsDr/m9gHTpJDHFOGXgvPRkZouAu65kG9Fn9
	gTgAhtCyIi6/xfmRfVn2JQimHm1wePWpLCLFvpLZey+sTCESKKN44kc40Nh7er8/6hS+kTik0qVaE
	iTjZpEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1D-00000000qs3-3fSn;
	Sun, 25 Oct 2026 07:51:51 +0000
Received: from out-54.mta0.migadu.com ([2001:41d0:1004:224b::36] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKt1A-00000000qrO-2BDX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 07:51:50 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+igOoHTp4OV4TccBEgdDYfC02hrHe22jCQcAB41Vkjg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792914703; v=1; x=1793519503;
 b=TJzimjCeGdQEUvey4qs+W7p0N+ceRemf1VF9TTaXxN3mbmHBOhvVeZcQWRc+RwMhSeZ2fnGH
 XM6w9YFsgPaiBi53N/cVIfNcYNo7bSyCPqfMKt2Lt8GZNACVKbCte18mJ8EG5HXX5Txl6nl3VPs
 vSWv3uQkTnD+rponDLQSjW0k=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 21872143caefef64;
	Sun, 25 Oct 2026 07:51:43 +0000
X-Mizu-Trace-ID: 21872143caefef64
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] KVM: arm64: Support FEAT_LS64_ACCDATA in guests
Date: Sun, 25 Oct 2026 07:51:33 +0000
Message-ID: <20261025075138.2919734-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_005148_852718_A7DD05F4 
X-CRM114-Status: GOOD (  13.29  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi folks,

Changes since v1 [1]:
  - Support FEAT_LS64_ACCDATA in guests instead of capping
    ID_AA64ISAR1_EL1.LS64 at LS64_V. A saved VM keeps its level, so
    restore no longer has to accept older kernels' levels, and v1's
    set_id_regs patch goes. (Marc)
  - Add an arm64.nols64 option. (Marc)
  - Retitled the series to match.

On a host with FEAT_LS64_ACCDATA, KVM advertises ST64BV0 and ACCDATA_EL1
to guests but doesn't support either. A guest's ST64BV0 hits the WARN in
handle_other(), and every guest on a CPU shares ACCDATA_EL1.

Patches 2 and 3 are Marc's from 2024 [2], rebased. I changed patch 3
to switch ACCDATA_EL1 for guests only, and only when the new
ARM64_HAS_LS64_ACCDATA capability is set, for the reasons in its note.
Patch 4 sets HCRX_EL2.EnAS0. Patch 1 adds arm64.nols64 to disable LS64
on a host whose firmware leaves SCR_EL3.ADEn clear. It comes
first so that the option exists in every commit that switches
ACCDATA_EL1. All five carry Cc: stable. The get-reg-list patch carries
it because the test fails on a host with the feature once patch 2 is
in.

Tested on the FVP with arm_v8_7_accelerator_support_level at 3
(LS64_ACCDATA) in VHE, nVHE and protected mode, and at 4 (LS64WB) in
VHE, with cpuidle.off=1 so that idle doesn't reset ACCDATA_EL1 between
VMs. In my reproducer, one VM writes ACCDATA_EL1 and the next VM on the
same CPU reads it. Unpatched, it reads the first VM's value and ST64BV0
hits the WARN. Patched, the second VM reads 0 and ST64BV0 doesn't trap.

Based on Linux 7.3-rc3 (fd73f4a665989).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20261023070110.1833446-1-fuad.tabba@linux.dev/
[2] https://lore.kernel.org/all/20240815125959.2097734-1-maz@kernel.org/

Fuad Tabba (3):
  arm64: Add override for ID_AA64ISAR1_EL1.LS64
  KVM: arm64: Enable ST64BV0 for guests with FEAT_LS64_ACCDATA
  KVM: arm64: selftests: Add ACCDATA_EL1 to get-reg-list

Marc Zyngier (2):
  KVM: arm64: Add ACCDATA_EL1 to the sysreg array
  KVM: arm64: Add context-switch of ACCDATA_EL1

 .../admin-guide/kernel-parameters.txt         |  3 +++
 arch/arm64/include/asm/kvm_emulate.h          |  3 +++
 arch/arm64/include/asm/kvm_host.h             |  3 +++
 arch/arm64/kernel/cpufeature.c                |  7 ++++++
 arch/arm64/kernel/pi/idreg-override.c         |  2 ++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h    | 23 +++++++++++++++++++
 arch/arm64/kvm/sys_regs.c                     | 12 +++++++++-
 arch/arm64/tools/cpucaps                      |  1 +
 .../selftests/kvm/arm64/get-reg-list.c        |  2 ++
 9 files changed, 55 insertions(+), 1 deletion(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3


