Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904EDCC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 12:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xKAMx1/J0ET+14k35r6g7EwTp/37IjhIqtMhZZYVj5k=; b=dy7QrIriES2jtwp/w6Lvxg4A+O
	gMxRbh9rFMi+zHRB4NWzer6mdA4kPhf9hii+WagDT/AIK2Pd9GFCwr+cNy88L7epStd/i/mzpLM8G
	A5RbcLPK4GmvvkquFuqIbWqmF9r5dTgxVw9y9MYDLncTOgjwQm8+06L9ewrJtCC8etDfH1+RTO/SD
	utnlr23LMthgT4vMojFjqMXgwXJ7+YnMIaxm7V+ZZP9th8dRAXRHS3Edz9mACmQbhr7R6lXuOzNPV
	2knsIdsIGiUzzhEApB3+SO/5HLAOnt59jbi9Tjb9VOr74EFMtnISx8+8hGG+TS6cTTxWN+9rZPH2l
	0rlrJLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyVt-0000000FVY9-3UNs;
	Wed, 14 Oct 2026 12:55:21 +0000
Received: from out-239.mta0.migadu.com ([2001:41d0:1004:224b::ef] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGyVp-0000000FVWB-1BsA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 12:55:20 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=pJBToGHsJMC6/kg5jWs+Mtib+z5TjGaiaQJZnJjpmkk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791982513; v=1; x=1792587313;
 b=WPaBA/HwgY+tZeMAg6kf+GOwzWUpq9ktnmYc9UmzX87qeVgLYJgJ4j8HMnDwqh5iRAqLuOXN
 WUPG9uFRz2OdgMsZ5MiKFu7xaTGj/GmqAsZMXOS9Ixv2sKKXjwqrSz7PeKfCu4qS2t3Kd6sRChp
 s6RoZ+duXicG38/1/q5bU1gY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8a582e26eeccef1c;
	Wed, 14 Oct 2026 12:55:10 +0000
X-Mizu-Trace-ID: 8a582e26eeccef1c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] KVM: arm64: Per-vCPU TLB and I-cache flush in pKVM
Date: Wed, 14 Oct 2026 13:55:08 +0100
Message-Id: <20261014125510.2928306-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_055517_696526_66166CFE 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

Hi folks,

Since 6.14, protected and non-protected pKVM guests run on the
hypervisor's VMID. The host no longer flushes a CPU's TLBs and I-cache
when a different vCPU of the same VM is loaded there, so vCPUs of one
guest can hit each other's entries. This series adds the flush at EL2.

An earlier version of these patches was in Will's pKVM base series in
2022 [1], but didn't make it into its later versions.

This series is based on kvmarm/next because the hyp VM is allocated with
hyp_alloc() there, and the per-CPU array it adds is allocated the same
way.

Based on kvmarm/next (dd0bc00e3e920).

Cheers,
/fuad

[1] https://lore.kernel.org/all/20220519134204.5379-1-will@kernel.org/

Fuad Tabba (2):
  KVM: arm64: Track physical CPU number at EL2
  KVM: arm64: Ensure TLBs and I-cache are private to each vCPU in pKVM

 arch/arm64/include/asm/kvm_hyp.h       |  3 +++
 arch/arm64/kvm/arm.c                   |  3 +++
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  3 +++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  8 ++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-smp.c      |  2 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 21 ++++++++++++++++++---
 6 files changed, 37 insertions(+), 3 deletions(-)


base-commit: dd0bc00e3e9201fd49b62ff9cc07890c89003afe
-- 
2.39.5


