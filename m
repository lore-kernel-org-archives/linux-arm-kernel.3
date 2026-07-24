Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9996C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+YzYUD9jK4JAl97BY+CMv/AKu9VR+yeVSg4U/mAUNxU=; b=f8AukS0Of0ZGe2domv7PvDg4kG
	6f81PvYWlqR4TIWE6YFfzpLIxHpE9i3vVipmI+wRSfQQ3ismZ6PJ5nwGT/s9uwOPbsDL8uCiPtw3c
	Xhq7nIFBo32N50+pDCPPrq0Ws1TQMu5k8NXCwbmOGvQlaDf6OHe7SRuMb/BXmUXdv2Zkp2vmhRqhg
	TIZ7NOEDX2JtDAQf3Gx5LYhMHKUqdF1+feRVIjeYEoM4rzRocP1rYdUS2cY+2yLER0O3XdCOrjpGH
	dZzL8CiAcoujK1NkukemwfzxqKqouBQjUK6mgvqc4ATyNkx2nosqP89V8hysg2jvEpfw+SAMVdGql
	++XOjejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCPX-0000000FzKt-46tq;
	Fri, 24 Jul 2026 09:41:43 +0000
Received: from esa2.hc1455-7.c3s2.iphmx.com ([207.54.90.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnCPU-0000000FzJj-0RNl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 09:41:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784886100; x=1816422100;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f5CcZqphHBrvD7a007cTCKmcn7WQevg0a7HgyWWOquQ=;
  b=N4XRScr6HQK+Y68xqFSjAe24Os6exXjUjWEsJx75WzciKFp7JmuhLy18
   FP4mPgfKHPa1AeV5D4F96CuUy9VWBV36hcodMH/SC/Uz89rCpAG/FRUfF
   b1BSwRgLrTSFTgAYG3eXX1APwjpHHo+spVivNphs/Q4i16j/D6cUmI/SU
   932cN3faAuvOPYZ+i00/FYVuU+D3W9WGudsTqWnetUJtMBBDvRMEwVZMu
   B4wQ07iDXCVJMAXFaNg1Weo/yEVdMbKJBVw2yxzKhvr1Dmvctx6nXJ1de
   zCHhv2w64P636OrpzXKzCT0XgCUVR+Nb8WXbCYBYuiQYRQirqn+BRbeIy
   A==;
X-CSE-ConnectionGUID: 37uLCs3qQ8yfngPwCCPHNg==
X-CSE-MsgGUID: /tVfyzkbQuSmM+A4tKtFZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="248489763"
X-IronPort-AV: E=Sophos;i="6.25,182,1779116400"; 
   d="scan'208";a="248489763"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 18:41:36 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5AB631002802
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:41:36 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 0FD0C82679A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:41:36 +0000 (UTC)
Received: from sm-arm-grace07.ssoft.mng.com (unknown [10.124.178.20])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 53FB7405A97;
	Fri, 24 Jul 2026 09:41:30 +0000 (UTC)
From: Kohei Enju <enju.kohei@fujitsu.com>
To: linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	cgroups@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Steven Price <steven.price@arm.com>,
	Kohei Enju <enju.kohei@fujitsu.com>
Subject: [RFC PATCH v1 0/2] KVM: arm64: CCA: Add MEC policy support for CCA Realms
Date: Fri, 24 Jul 2026 18:40:54 +0900
Message-ID: <20260724094120.166536-1-enju.kohei@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_024140_845848_8FA83AEF 
X-CRM114-Status: GOOD (  12.51  )
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

This series adds basic support for configuring the Memory Encryption
Context (MEC) policy for Arm CCA Realms.

Patch 1 introduces a new Realm VM ioctl, KVM_ARM_RMI_CONFIG, and uses it
to let userspace select the shared or private MEC policy before the
Realm is created. The default remains the shared MEC policy.

Patch 2 adds a misc cgroup resource for CCA MECIDs and charges one unit
for each Realm using the private MEC policy.

Feedback on the proposed KVM ABI and on using misc cgroup for MECID
accounting would be appreciated.

This series is based on Steven Price's CCA host series [0] [1]. I am
sending it as an RFC while the CCA host series is not yet upstreamed,
and plan to update it as needed to track future revisions of the host
series. Once the host series is merged, I plan to post a non-RFC
version.

[0] https://lore.kernel.org/all/20260715142841.80544-1-steven.price@arm.com/ 
[1] https://gitlab.arm.com/linux-arm/linux-cca  cca-host/v15

Kohei Enju (2):
  KVM: arm64: CCA: Add support for configuring the Realm MEC policy
  cgroup/misc: Add support for Arm CCA MECIDs

 Documentation/virt/kvm/api.rst   | 29 +++++++++++++
 arch/arm64/include/asm/kvm_rmi.h |  6 +++
 arch/arm64/kvm/arm.c             |  9 ++++
 arch/arm64/kvm/rmi.c             | 73 +++++++++++++++++++++++++++++++-
 drivers/firmware/arm_rmm/rmi.c   | 12 +++++-
 include/linux/arm-rmi-cmds.h     |  1 +
 include/linux/misc_cgroup.h      |  4 ++
 include/uapi/linux/kvm.h         | 17 ++++++++
 kernel/cgroup/misc.c             |  4 ++
 9 files changed, 152 insertions(+), 3 deletions(-)

-- 
2.43.0


