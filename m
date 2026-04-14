Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDBAF531DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 00:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iZQGwEHwBQUY6iK+AfcutNF4R8Ig24CfmNfmXwDw7qg=; b=oTlBUoRVsnIyoVOiZNAxckZcCw
	YKneJLmxBKYxuySIDbGnzvvijtBnn3ZQvvn+XhSU8WruURvB5rLCmmZfDR5FTQQqyrjF+wC4B5NSw
	0hq44hYQGP4utIkSKVjgtz0Ngn2bab0nnyeQfhvs4lvrItKufM7Rjg5iz73zczE+p2OmHFDX0hej9
	iRhy82wtH3yv14gJJn0+T9wz0d8c4DhIDF9xA7Gz62UzZsSKSpQYO3UXMFB1mjz24Yjj/T9ceix2P
	1crWrACO2n74s+7umMnUATnZ4NuQVuDMEZcvA9KTXmItkTLCdnDQyCYoZ0yLosd+ixut3UPAIAi2B
	+uXu3f8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRGC-0000000GVK8-10Un;
	Tue, 14 Apr 2026 00:04:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCRG8-0000000GVIe-32A7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 00:04:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C0914E26;
	Mon, 13 Apr 2026 17:03:54 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10E4F3F7B4;
	Mon, 13 Apr 2026 17:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776125039; bh=m6x/63nnfpg6KYUYTu5KqOD4nFrzdvwE6G7muugTYuY=;
	h=From:To:Cc:Subject:Date:From;
	b=pC5yaf0E+ADbte4ZRHujJmQZlq1k4KKzSDIIeiUoSp4HCnfLajY7PUTBZHYw06Tzo
	 S37+n/p64em1CL0VSJnWZ2ux1ojw4vpypkOe3HrHQpaBQsRJKolUyXYuQjJ+stZui5
	 AVPOPMSJTdZfVDpZl1+Ci/ZgQR0S5EaWg7DcY8Rk=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v2 0/4] KVM: arm64: Handle unsupported guest translation granule sizes
Date: Tue, 14 Apr 2026 01:03:30 +0100
Message-ID: <20260414000334.3947257-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_170404_889839_42BC2F39 
X-CRM114-Status: UNSURE (   6.82  )
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

Hi,

This is v2 of fixing the granule size selection for software stage-1
and stage-2 walks. Thanks to Marc for the feedback on v1 ([1]).

* Changes from v1:

  - Take the entire (v)tcr value for TGx decode helpers.

  - Rename vtcr_to_walk_info() to setup_s2_walk() as preparation, also
    pass vcpu as the argument instead of kvm.

  - Use TCR_* instead of TCR_EL1_* definitions.

  - Return unsigned int instead of u64 when returning a granule shift.

  - Split unit changes in get_guest_mapping_ttl() and
    compute_tlb_inval_range() into its own patch.

Thanks!

[1]: https://lore.kernel.org/kvmarm/20260406164618.3312473-1-weilin.chang@arm.com/

Wei-Lin Chang (4):
  KVM: arm64: nv: Rename vtcr_to_walk_info() to setup_s2_walk()
  KVM: arm64: Factor out TG0/1 decoding of VTCR and TCR
  KVM: arm64: nv: Use literal granule size in TLBI range calculation
  KVM: arm64: Fallback to a supported value for unsupported guest TGx

 arch/arm64/kvm/at.c     | 125 ++++++++++++++++++++++++++--------
 arch/arm64/kvm/nested.c | 144 +++++++++++++++++++++++++++-------------
 2 files changed, 196 insertions(+), 73 deletions(-)

-- 
2.43.0


