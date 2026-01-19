Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33148CCF2F9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 12:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bPz6wr2lDg1POseRVKAcIEO7Khok69oBk6U6C5rfvA=; b=LCTKNYo5OBc+zHdXrPZBjOlzsJ
	1j6QYyzLE5UdwzDS5pTt8sdLNoP9UbJrBjLEX39NW4AbjM0vKrv7g6xhjflexn3qG5h9wzibZDZA8
	35/xc5ghA7jSnnAxw2ihNU7vJovueRvCMG1XAzA4d906fc2qF4/BCaWnzf71f6tti4yea81/RQsCZ
	YO+GE0B5XjNQ/dEBpd043kSX86F+LNxbfGghU2QYGo3XvfhXs52+8UtScBVxDsfW2YVcQ/jpOx/u1
	8fYl2jFVaUJGLE/KDJM2AeI02656fZ+zjLsWBaq0fS+KHlqZOMpv5qHJh6PCYuEZ0ZKG4iyw0zrKl
	+/Wp3MQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhof1-0000000237c-3mED;
	Mon, 19 Jan 2026 12:47:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoez-0000000236B-2koQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 12:47:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5B7860155;
	Mon, 19 Jan 2026 12:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADE0C2BC87;
	Mon, 19 Jan 2026 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768826828;
	bh=ilZyBr/0UC+YHcdnNiHjYBCPLVUAoDM/YjJevxwCSLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=urV5s74X02f5AftapIIiz8YtQH6vJMrOr44HiLy45D9q4TWtQbMp31L4atPFOmAB8
	 UGt5He0/Ekap1yGSA/kyht74lYv4AZpkdSkA5AAvuymO2NEePcWVjHS+dI7r+u5pWp
	 H5stgc6/np8rOOJqCUuAs/5LdvTAnMJyfb3nidy15tMhU0prfK5Lyzu4Hr/F5hNOYf
	 mWpXU5Ir8leO3kuRqxUoy7aJlDHRo6m8OGYXzK4bqSmHXDoatKcKd/JOYMDrokFGRD
	 Fy5433DHejJQvBlaxOaq6YUnTnhE4bdHm37lC10f41+vjYWzWvVXp3pTGMBfZ2yIDW
	 6u5Tt4X1AOVPA==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 05/35] KVM: arm64: Don't advertise unsupported features for protected guests
Date: Mon, 19 Jan 2026 12:45:58 +0000
Message-ID: <20260119124629.2563-6-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
References: <20260119124629.2563-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Both SVE and PMUv3 are treated as "restricted" features for protected
guests and attempts to access their corresponding architectural state
from a protected guest result in an undefined exception being injected
by the hypervisor.

Since these exceptions are unexpected and typically fatal for the guest,
don't advertise these features for protected guests.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_pkvm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 0aecd4ac5f45..5a71d25febca 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -37,8 +37,6 @@ static inline bool kvm_pvm_ext_allowed(long ext)
 	case KVM_CAP_MAX_VCPU_ID:
 	case KVM_CAP_MSI_DEVID:
 	case KVM_CAP_ARM_VM_IPA_SIZE:
-	case KVM_CAP_ARM_PMU_V3:
-	case KVM_CAP_ARM_SVE:
 	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
 	case KVM_CAP_ARM_PTRAUTH_GENERIC:
 		return true;
-- 
2.52.0.457.g6b5491de43-goog


