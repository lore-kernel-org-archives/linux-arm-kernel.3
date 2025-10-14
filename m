Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE76ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 10:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ylioGV4x22LWW0v0GrsPNRcMf4GuteE1FmTzYxd/cq4=; b=Cxr6T7DUfLWX2OozbNcJ4+eIkh
	ff4u6SipLwOPG5+IW93vufPE8pPyyQtNSNDA24zuynWRSX2IliyVtqdFy8JMusdpomIzEx/42PqCH
	g37+4UHuOpJjK8FcA7MUUxLjcQ0FVf2tOIdQoYjw5pJjmHcR00Tid/aCH1QzMw56d/0pbdY4dFKDj
	CaM8wOs/eAGHS5LMpysfx+xV6GKVXPXz72AK5IFxurwKz886WvlRS7W44KPeMYX23nSuxErVELo00
	CSqnlj6PH0FM9i6c+U69llL1jbjF9onObRfPUyfn/7dHX0vVFvJm/k/eo8UHUKoEbneDCyGN91sqU
	/ESBCSDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c9f-0000000Fuc2-1SzI;
	Tue, 14 Oct 2025 10:21:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8c9d-0000000Fubh-28cI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 10:21:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A37C41A9A;
	Tue, 14 Oct 2025 03:21:08 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D452E3F6A8;
	Tue, 14 Oct 2025 03:21:14 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	shuah@kernel.org
Cc: Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH 0/3] set_id_regs cleanup
Date: Tue, 14 Oct 2025 11:21:05 +0100
Message-ID: <20251014102108.2442391-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_032117_603194_31316E6B 
X-CRM114-Status: UNSURE (   5.97  )
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

Tidies up a few small things in set_id_regs. The removal of
ARM64_FEATURE_FIELD_BITS touches other code only so much as it removes
the define but set_id_regs.c is the only place its used.

Based on v6.18-rc1

Ben Horgan (3):
  KVM: arm64: selftests: Count test_guest_reg_read() as a test
  KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last
    user
  KVM: arm64: selftests: Consider all 7 possible levels of cache

 arch/arm64/include/asm/sysreg.h                 |  2 --
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 14 ++++++++++----
 2 files changed, 10 insertions(+), 6 deletions(-)

-- 
2.43.0


