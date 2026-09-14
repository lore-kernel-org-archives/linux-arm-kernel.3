Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E42C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G0+VOM7HOypqgbCJvnCsMEQG1ikquaCfJuOJzcUHxBM=; b=B1rkuXMBNAFE3+
	Sy43a/Hw8YzlS5ufWbEhDGj1+K1pk/h3DhTeaN7f8GdMEunN43KHRAUnPVakXRAXkplaFMIdWcagw
	cQ44pHa+APZxXYl1E9STfp8/nB6sCsPEU+O/DyVIDcla+UG3FuCkl9KZGENi5anwaQevqptKgXJBV
	u9LcPHQDr1MEnkc7KjFbPoaZTFBqAhNTmTJORBeB1W5lSGnoehVNKAN/vdIkk974USYGiTReCMtq6
	Udky39LVKDkZnEKZOGUxp2l5gNnpkfOKUehP/ZQ/JNrgal9DJDJP6GmFpVcBdiyal/wfT4uBf89rB
	7/W40MEr++ifUZISo4HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x619h-00000002Zp2-3yxp;
	Mon, 14 Sep 2026 07:31:09 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x619e-00000002ZnS-0F4q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789371067; x=1820907067;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=5/qH9WQH0xnxZiSwc57XSnnm6CjMDXhHBj4pLQbDsZk=;
  b=d0C7f+Szb7LJT3i/81EbFCyxqYHHksi7MULdLEdlzBdqM61XTCC/gWVw
   A4BHkc35/ZmSqIZFRQrwpFtbJLF8ywhELqAivKThOXZs60/TmmGzJpTXX
   HaV9mnoxvO0oS24dpVFpgrsmBJNXKShlNZSFEBseZy4PZ6JGlvue/dc9s
   7g/UF2q7N7dwrGWfM0ftCCJ6Gju7uPdrlCga+Onh2BQj6xg7iylVgQpJR
   B47fJa4JQ5GtvpZD195ZwTlg/4ovpeesAmvnYTxBJwVm/CNXrEotqngSz
   maQlKyDTcj++ntojFp23PVnqcnhrdRDVSWkDblfcwqCfFiixBcazickXZ
   w==;
X-CSE-ConnectionGUID: PDuqj9VKRDqIBouDffIQdg==
X-CSE-MsgGUID: ysZ4cQNnT3ueBfsIB0enqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="254977267"
X-IronPort-AV: E=Sophos;i="6.27,102,1786978800"; 
   d="scan'208";a="254977267"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 16:31:04 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8A26AC00367
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:31:03 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3E7CD14003FF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:31:03 +0000 (UTC)
Received: from [127.0.1.1] (unknown [10.124.178.20])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 65571180012C;
	Mon, 14 Sep 2026 07:30:57 +0000 (UTC)
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Subject: [PATCH v2 0/3] 52-bit VA guest mode ID support
Date: Mon, 14 Sep 2026 16:30:43 +0900
Message-Id: <20260914-arm64-52bit-va-v2-0-3911cb9d4ad4@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKOip2oC/12NQQ6CMBBFr0Jm7Zh2gAZdeQ/DAkorQwKYtjQaw
 t2lGDcuX/L++yt449h4uGYrOBPZ8zztQKcMdN9MD4Pc7QwkSImKSmzcqAosqeWAscGcrLSF7kQ
 pOthHT2csv47gvf6yX9rB6JAqyejZh9m9j8cok/eLq/94lChQFkZfKpIyV/nNLgMHv5z1PEK9b
 dsHgk4c3MAAAAA=
X-Change-ID: 20260825-arm64-52bit-va-32f1f4cd050d
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
 Takayuki Okamoto <tokamoto@fujitsu.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789371056; l=3154;
 i=itaru.kitayama@fujitsu.com; s=20260825; h=from:subject:message-id;
 bh=5/qH9WQH0xnxZiSwc57XSnnm6CjMDXhHBj4pLQbDsZk=;
 b=Vrji+rOz7LhmW6GdQCEDDXWddYrkAdBps2e04+1rLpswYZDXxv+ahTbGMs9yqV0gtrDVHhhwN
 LFHDUSJNmUnDuyYdXr8NBnwbrjHCUMRBlvptVI8wlBP+R+wwItjuMqR
X-Developer-Key: i=itaru.kitayama@fujitsu.com; a=ed25519;
 pk=g9bTnr9giRP7JwNSZHy+OMLQZBEUtSE9tUnXso0hH1Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_003106_613144_9999EC56 
X-CRM114-Status: GOOD (  14.03  )
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

This patch series extends the arm64 KVM selftest framework
to support 52-bit guest virtual address (VA) modes in addition to
the existing 52-bit physical address (PA) configurations.
The motivation is to enable validation of LPA2 guest memory-management
behaviour in configurations that use a 52-bit VA space.
While the selftest framework already supports testing 52-bit PA
configurations, it lacks the ability to exercise guests running with
52-bit virtual addresses, leaving part of the LPA2 functionality untested.
To address this, the series introduces new guest modes for 52-bit VA
operation, adds five-level page table support where required, and
performs runtime detection of host 52-bit VA capability so that
LPA2-enabled guest VA tests are executed only on supported systems.

Testing:

Built and ran lpa_test on QEMU with 52-bit VA support. 
The test verified shared mappings at low and high guest virtual addresses, 
then remapped the high VA to a different GPA and verified that 
the mappings remained independent.

Signed-off-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Reviewed-by: Takayuki Okamoto <tokamoto@fujitsu.com>
---
Changes in v2:
- Reorganize the series so that each patch builds independently.
- Move all P52V52 mode definitions and uses into the same patch.
- Use the standard "KVM: arm64: selftests:" subject prefix.
- Reuse one probe VM and vCPU for IPA and 64K VA capability detection.
- Make the VARange result explicitly specific to the 64K granule.
- Clarify that only the 4K P52V52 mode uses five page-table levels.
- Link to v1: https://patch.msgid.link/20260826-arm64-52bit-va-v1-0-14ec98211363@fujitsu.com

To: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oupton@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
To: Joey Gouly <joey.gouly@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Zenghui Yu <yuzenghui@huawei.com>
To: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>
To: Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: kvmarm@lists.linux.dev
Cc: kvm@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Itaru Kitayama (3):
      KVM: arm64: selftests: Support five-level stage-1 page tables
      KVM: arm64: selftests: Add 52-bit VA guest modes
      KVM: arm64: selftests: Test 52-bit guest virtual addresses

 tools/testing/selftests/kvm/Makefile.kvm           |   1 +
 tools/testing/selftests/kvm/arm64/lpa_test.c       | 124 +++++++++++++++++++++
 .../selftests/kvm/include/arm64/processor.h        |   3 +-
 tools/testing/selftests/kvm/include/kvm_util.h     |   3 +
 tools/testing/selftests/kvm/lib/arm64/processor.c  |  60 +++++++++-
 tools/testing/selftests/kvm/lib/guest_modes.c      |   7 +-
 tools/testing/selftests/kvm/lib/kvm_util.c         |  11 ++
 7 files changed, 200 insertions(+), 9 deletions(-)
---
base-commit: 28924df2a08f440c73991b83028032c901de2ae4
change-id: 20260825-arm64-52bit-va-32f1f4cd050d

Best regards,
--  
Itaru Kitayama <itaru.kitayama@fujitsu.com>


