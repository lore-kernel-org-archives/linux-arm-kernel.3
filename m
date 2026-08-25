Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E642DC61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ibl2m+E6RIUV47/sptfcbJKHLF+HZsBcrOPs0HuvzGQ=; b=KnDt6LwU1+Av4IAAbBwf5/UmIQ
	DJeWcw+gp92OBB+xjtnOEoF/zJZEZkY3KTYKfCVlFoUsBnpShc+1nsYuXozMEjNd4BCSMzOh32WIv
	6MEtuZ10nQNrjwe73sy17H4GgCjfWNroSOwKtDxxNhXyJriPngUUIfyN29z49CDKti+aJ8vEklGtg
	bD1pxKy2dgaeNHmDlYjqhKMOx3sPXFuqh6kncZ0aX5YqLUHwdlcs1mQbda1zd8s3C2bG+of+rOotC
	/chqn3azkpCYKAzLnkNeeKRh3t8B69L57sgjPnoG3JIm6SJ/IofhOP8lNMAU5NySmXVfd9ETMSy8N
	UaDC8Jmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0n-00000000RRC-3PGa;
	Tue, 25 Aug 2026 09:00:05 +0000
Received: from out-115.mta0.migadu.com ([2001:41d0:1004:224b::73] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyn0d-00000000ROF-10ex
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 08:59:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2E7hO/OQUbvmwGv3PtNaGFCsE2W2xbF14FNeWSPRc1g=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787648393; v=1; x=1788253193;
 b=IkSVNXkoCnzZIkAmrHcMgOsjNeSXwo0DverNIoajUdF6WxXP3997nHcXAgbNBSm5f1qBO707
 sVUlssNyMpvrKJLqmPW00NpWE3ikzNoeZpEL7jAw/btAoP9zcumA/IKzprGxG6aSWg5JvSE2l0M
 0NqH+W35XJvxOOcjph0eZArc=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: from claudy.local (2a01:4b00:ad36:1d00:3a05:25ff:fe33:35a9)
	by smtp.migadu.com with ESMTPS id 0b983d3b0ddc8a86;
	Tue, 25 Aug 2026 08:59:53 +0000
X-Mizu-Trace-ID: 0b983d3b0ddc8a86
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
	Quentin Perret <qperret@google.com>,
	Stefan Teodorescu <fane@google.com>,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] KVM: arm64: pKVM SVE vCPU init fixes
Date: Tue, 25 Aug 2026 09:59:44 +0100
Message-Id: <20260825085948.1674721-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_015956_082553_F4D90A58 
X-CRM114-Status: GOOD (  11.06  )
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

If it's not the GIC, it's SVE. I found these while preparing the
follow-up to the pKVM core series [1].

Patch 1 was posted on its own [2] and carries Marc's Reviewed-by. It is
unchanged and included here because it has not been picked up yet and
the rest of the series does not apply without it.

Patches 2 and 4 are two ways to reach the same broken state, a vCPU
whose sve_state is NULL while vcpu_has_sve() is true, so the world
switch loads the guest's SVE state from it. EL2 keeps two answers to
"does this guest have SVE": KVM_ARCH_FLAG_GUEST_HAS_SVE, which the
world switch reads, and KVM_ARM_VCPU_SVE, which pkvm_vcpu_init_sve()
reads. Patch 2 stops EL2 desynchronising them itself on an init
failure. Patch 4 stops the host handing them over already
desynchronised. Patch 3 keys the unpin on the state it unpins rather
than on the feature bit, which agree for any vCPU that completed init.

All of it needs a host that misreports its own vCPU state, so none of
it is reachable from host userspace.

Based on Linux 7.2, and applies cleanly to kvmarm/next.

Cheers,
/fuad

[1] https://lore.kernel.org/all/178552142335.30097.18179093757678605679.b4-ty@kernel.org/
[2] https://lore.kernel.org/all/20260818093117.2379344-1-fuad.tabba@linux.dev/

Fuad Tabba (4):
  KVM: arm64: Validate the SVE vector length in pkvm_vcpu_init_sve()
  KVM: arm64: Do not clear VM-wide SVE feature on vCPU init failure
  KVM: arm64: Key unpin_host_sve_state() on the state it unpins
  KVM: arm64: Derive GUEST_HAS_SVE from the SVE feature bit at EL2

 arch/arm64/kvm/hyp/nvhe/pkvm.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

-- 
2.39.5


