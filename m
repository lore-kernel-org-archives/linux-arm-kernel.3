Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077F5CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 10:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdVdpQQI97U0WIuGQMTtkVHzkmSiQwUSqCdlCPbwfCk=; b=K6Hjxj9jzYnIWM1tFKkK+L/r81
	o7M+n2k5geOkFgfl82XEuYc9+iEYbFPbUZQHETz/s4EfqH2xOf4QIzoraT46IypxMKRWW4I5xEF7H
	SFKARymRCXIGD78b7za4brDiyCAOAXxrXp8CtjjKuAa5uRGFK6X21r/I7nSQXu30Tc4k3OaKqnCUW
	B270berLDbO/9I6Q1s0lF8IHlyeI1BfpeFH0Kue5TDUI0xo3Lfrzj71VXaYV0Ghm3htWi0hAp/n1o
	21qfHewcfF7cvNXNTai3yqM8vwLflKWLBF2QoUpKfUZVjREm6iXJz8LkG39dd4PiaoGLnBUD1Zofl
	OHLJs59Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPo6-00000003xxE-0GXd;
	Thu, 30 Oct 2025 10:23:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPny-00000003xuc-3mRv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 10:22:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFC0E2ECB;
	Thu, 30 Oct 2025 03:22:44 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 711D23F66E;
	Thu, 30 Oct 2025 03:22:50 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	perlarsen@google.com,
	ayrton@google.com,
	ben.horgan@arm.com,
	sudeep.holla@arm.com,
	stuart.yoder@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 1/2] KVM: arm64: fix FF-A call failure when ff-a driver is built-in
Date: Thu, 30 Oct 2025 10:22:44 +0000
Message-Id: <20251030102245.2313898-2-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030102245.2313898-1-yeoreum.yun@arm.com>
References: <20251030102245.2313898-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_032254_977182_F83E5305 
X-CRM114-Status: GOOD (  11.41  )
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

Until has_version_negotiated is set to true,
all FF-A function calls fail except FFA_VERSION.
The has_version_negotiated flag is set to true when
the first FFA_VERSION call is made after init_hyp_mode().

This works fine when the FF-A driver is built as a module,
since ffa_init() is invoked after kvm_arm_init(), allowing do_ffa_version()
to set has_version_negotiated to true.

However, when the FF-A driver is built-in (CONFIG_ARM_FFA_TRANSPORT=y),
all FF-A calls fail. This happens because ffa_init() runs before
kvm_arm_init() — the init level of ffa_init() is rootfs_initcall.
As a result, the hypervisor cannot set has_version_negotiated,
since the FFA_VERSION call made in ffa_init() does not trap to the hypervisor
(HCR_EL2.TSC is cleared before kvm_arm_init()).

Consequently, this causes failures when using EFI variable services
with secure partitions that rely on FFA_SEND_DIRECT_MSG.

To fix this, call hyp_ffa_post_init() and set has_version_negotiated
during hyp_ffa_init() when the FF-A driver is built-in (CONFIG_ARM_FFA_TRANSPORT=y).

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 4e16f9b96f63..0ae87ff61758 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -984,5 +984,17 @@ int hyp_ffa_init(void *pages)
 	};
 
 	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
+
+	if (IS_BUILTIN(CONFIG_ARM_FFA_TRANSPORT)) {
+		hyp_spin_lock(&version_lock);
+		if (hyp_ffa_post_init()) {
+			hyp_spin_unlock(&version_lock);
+			return -EOPNOTSUPP;
+		}
+
+		smp_store_release(&has_version_negotiated, true);
+		hyp_spin_unlock(&version_lock);
+	}
+
 	return 0;
 }
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


