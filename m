Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3AF606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bsYVVBnB;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ml0t4fx0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ZaMLjnp9n8JarfzU5Qv1z7FhWJG54NnnFsIG7nhnlMk=; b=bsYVVBnBrXZIYU2eA42ZZ3o1BO
	cLnxhWXapXpzXdxtSBFtD7NysqUcLrVz2mLENBtmuVk2QbsnboTHJ8ORzKQUghuxhbM+mlugIlyzE
	viV0ccFANRSujSXO1EXpY4hznv6zevj6Dk1aWfSz07j9lwDtmeNymEf1HkRdRfE9n96hpotFiQNUy
	5j3CT4qWzgXtFqWzTunF+i1153yEo00+y0DGWaYHCUhQTdJkiv+tgqzfZYg0D1IDAzoCXEvZi5QSk
	FZ5PJNbbowr28ZAo3b0LLXMd1ea4c82gcRcgoJSiu9OnudY4nbWPFZw2lLBX5Mdp3ZKaDyelU+hLl
	ziiOEnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HF-0000000Ffoi-2qJH;
	Fri, 23 Oct 2026 07:01:21 +0000
Received: from out-58.mta1.migadu.com ([2001:41d0:203:375::3a] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9HA-0000000Ffn3-2hRv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:01:18 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gXiFoqCU+mSVzPqh7WXxvdn726uaIR10TpfwEXtrPEk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792738872; v=1; x=1793343672;
 b=Ml0t4fx0EOmjEyn747M6bRSiKuepLQMvLWPd33LA1eO1ftU0oJGhd5nREZfpobsl6DEH/qZj
 lKec6wcJzax1hBxC83N43vCnHwpFkSYeWQrd7on8GJGXCbdRVsdV8nwgXxKTx7gEgP9sLxDXeMt
 71ChShlbKbZ1exksSkOs1xug=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 399763199c770a61;
	Fri, 23 Oct 2026 07:01:12 +0000
X-Mizu-Trace-ID: 399763199c770a61
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: Stop advertising FEAT_LS64_ACCDATA to guests
Date: Fri, 23 Oct 2026 08:01:08 +0100
Message-ID: <20261023070110.1833446-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000116_838929_3C97F876 
X-CRM114-Status: GOOD (  13.66  )
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

On a host with FEAT_LS64_ACCDATA, KVM advertises ST64BV0 and ACCDATA_EL1
to guests but supports neither. The first patch caps
ID_AA64ISAR1_EL1.LS64 at LS64_V. A VM saved on an older kernel can carry
any level up to the host's, so the patch still accepts those levels from
the VMM, capped at LS64_V, and the VM restores. The second patch moves
LS64 out of set_id_regs' generic table into a test of its own, since the
table's invalid value is now one of those levels. It carries Cc: stable
as well, because a stable tree that takes the first patch alone fails
the set_id_regs selftest on an LS64_ACCDATA host.

Tested on the FVP AEM with arm_v8_7_accelerator_support_level set to 3
(LS64_ACCDATA) and 4 (LS64WB). Unpatched, on a VHE host, a guest's
ST64BV0 hits the WARN in handle_other(). A second VM also reads the
ACCDATA_EL1 value the first one wrote, once cpuidle.off=1 stops the
FVP's idle states from powering the CPU down. Patched, on VHE, nVHE and
protected-mode hosts, ST64BV0 and the ACCDATA_EL1 accesses UNDEF, and
set_id_regs passes.

The cap alone would fix the bug, but a VM saved on an older kernel
would then fail to restore on a patched kernel. 6685f5d572c2 ("KVM:
arm64: Disable MPAM visibility by default and ignore VMM writes")
solved the same problem for MPAM: it hid the field from guests, but
kept accepting the value older kernels exposed.

Based on Linux 7.3-rc3 (fd73f4a665989). Patch 2 conflicts with
00e309933879c, now in kvmarm/fixes and kvmarm/next, on the test count.
The resolution is:

  -	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
  +	test_cnt = 4 + MPAM_IDREG_TEST + MTE_IDREG_TEST + LS64_IDREG_TEST;

Cheers,
/fuad

Fuad Tabba (2):
  KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
  KVM: arm64: selftests: Test ID_AA64ISAR1_EL1.LS64 on its own

 arch/arm64/kvm/sys_regs.c                     | 28 +++++++++--
 .../testing/selftests/kvm/arm64/set_id_regs.c | 49 ++++++++++++++++++-
 2 files changed, 71 insertions(+), 6 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.47.3


