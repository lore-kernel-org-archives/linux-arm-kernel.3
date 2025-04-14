Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BB5C369B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 12:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rm84iICJa/iwCuQG+A5PWWUm1CawJWiG/Ieu3PkXHnc=; b=mExJ5DJjFUM2AHplQqZ8I/0vMQ
	S2JtxeZxh0NYb2BwjtKr9QctQMQ1T9Evr3w67NPzyg2QFF9almpNf0v/h3gmAKqcjHEkNY9PuJ3gL
	nXMTtO79WBJH6PtcaRZoQtWNq8BOydR4da7HXlwlJkuAmQ2p1Y82NFuRdEua67AiHchfLycFXlBVT
	oWecPzKzDBN9GW3hl4uuvS9qlV0o2Qt3js4iL75jr/V3eQr1c+zyE4LY6pW5MTjzwSRT8gpeX/6NQ
	dk+Tw06891srkboG0VXEMkcwLGEMwDHp/y1OFeb1fJpeh456nK1ShVU7Ei20yO6e47z8gEsSunqbN
	TUxx6/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JGd-000000020g7-33PT;
	Mon, 14 Apr 2025 12:50:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J7x-00000001zNL-0CwG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 12:41:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EB091007;
	Mon, 14 Apr 2025 05:41:25 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 91BAA3F59E;
	Mon, 14 Apr 2025 05:41:24 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Cc: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	shuah@kernel.org,
	Ben Horgan <ben.horgan@arm.com>
Subject: [RFC PATCH 0/3] KVM: arm64: Don't claim MTE_ASYNC if not supported
Date: Mon, 14 Apr 2025 13:40:56 +0100
Message-ID: <20250414124059.1938303-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_054129_135334_93BC9F2C 
X-CRM114-Status: UNSURE (   7.91  )
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

The ID_AA64PFR1_EL1.MTE_frac field is currently hidden from KVM.
However, when ID_AA64PFR1_EL1.MTE==2, ID_AA64PFR1_EL1.MTE_frac==0
indicates that MTE_ASYNC is supported. On a host with
ID_AA64PFR1_EL1.MTE==2 but without MTE_ASYNC support a guest with the
MTE capability enabled will incorrectly see MTE_ASYNC advertised as
supported. This series fixes that.

This was found by inspection and the current behaviour is not known to
break anything. Linux doesn't check MTE_frac, and wrongly, assumes
MTE async faults can be generated whenever MTE is supported. This is
a separate problem and not addressed here.

I am looking for feedback on whether this change is valuable or
otherwise.

Ben Horgan (3):
  arm64/sysreg: Expose MTE_frac so that it is visible to KVM
  KVM: arm64: Make MTE_frac masking conditional on MTE capability
  KVM: selftests: Confirm exposing MTE_frac does not break migration

 arch/arm64/kernel/cpufeature.c                |  1 +
 arch/arm64/kvm/sys_regs.c                     | 26 ++++++-
 .../testing/selftests/kvm/arm64/set_id_regs.c | 77 ++++++++++++++++++-
 3 files changed, 101 insertions(+), 3 deletions(-)


base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
-- 
2.43.0


