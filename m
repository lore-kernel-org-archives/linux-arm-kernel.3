Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UUV8G5l+8y4VKTIs3LKjPdf1ZbZ+/55y0GSb0c64wC0=; b=MZndge3sCw2F8N4oCos5PbCeim
	73qJ+sFUGBvrtSSVYFImzMxBTIfEz7UegXv2YSRDalm4K5jq3pAS4Adu+UMMIU5q/s0bt7xJ5Y0NC
	/MgSWNVMbnTwH+R3rEXYbyYDoghS2YSU+SvLqO5LMDr23sALsQsYkTfj1t4niqYaIEnF058sd2Y//
	JKk+O5VVZ48t78y0+cPLWh5nTYKUhzq9U0XKwjyKJoRVLOL1fkRhG+jHZXSVqUbCY6ycp/6+yoOUY
	puVZaHbFdi5R+ttpegWq+ZBkM7sjHwpYBUKY5sgB9sR2OFrw1tUfpVkukWnyXdLJMg9Mcgn2bvOkN
	bbt9a8mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggby-0000000CDut-2KpB;
	Mon, 06 Jul 2026 10:31:38 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggbw-0000000CDtf-1zzU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:31:38 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783333893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UUV8G5l+8y4VKTIs3LKjPdf1ZbZ+/55y0GSb0c64wC0=;
	b=tgfxylSgq1mxGv3YhjrLl+pFCjKU4T+ERAUdE5N5foYO9rMA/IF+gR8jvB+botICUQdrZv
	iwDtl5MxnL7jVUaa6CclQoSkJvJREbo3SVqxklz2sp4jtssn+7fd2Tkn27kBSBySbJfZNF
	KT7LG7pBns2aH92snAv91lW9r56Z0lM=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Keir Fraser <keirf@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] KVM: arm64: Tidy up is_created
Date: Mon,  6 Jul 2026 11:31:26 +0100
Message-Id: <20260706103129.706974-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_033136_767176_69F36CAA 
X-CRM114-Status: UNSURE (   8.13  )
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

Changes since v1 [1]:
- Carried Keir's Reviewed-by. No code changes.

This small series tidies up the host-side kvm->arch.pkvm.is_created flag,
which tracks whether the hypervisor-side (EL2) VM has been instantiated.

It comes out of the ongoing pKVM (protected KVM) upstreaming work and runs
in parallel with it. The changes only remove dead or redundant code around
the flag, not any of the functional paths that work touches, so there is no
dependency in either direction and the two can be applied in any order.

is_created stays: the pKVM handle is reserved early (so host MMU-notifier
TLB invalidations have a valid handle before the first vCPU run), so a
non-zero handle no longer implies the EL2 VM exists. is_created is what
distinguishes "reserved" from "created", and the teardown path relies on it.
Only the cruft around it goes.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260618090128.3913688-1-tabba@google.com/

Fuad Tabba (3):
  KVM: arm64: Drop the unused EL2-side is_created write
  KVM: arm64: Remove unreachable early checks in pkvm_init_host_vm()
  KVM: arm64: Drop redundant READ_ONCE() in pkvm_hyp_vm_is_created()

 arch/arm64/kvm/hyp/nvhe/pkvm.c |  1 -
 arch/arm64/kvm/pkvm.c          | 13 +++++--------
 2 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.39.5


