Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19138CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 15:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIw3ZRoJ0YagiRcre3dFoDCd6NovRgT+4dVvR5vYdoA=; b=xN6p8SZgMovhx9CxyfdWgvOuyo
	OiLrvQTNnq4glAbFWodGETIl418ulWt8zuMhHRcSQRZxDNoxLs097zH4EoM/Ve9Zodze8Vd7a0k7z
	pqGXh4dENZZtZ3tL0m63MmEe5vfFpBQyNhohOubS9mPa/Gh56PR9Onc+URsFMxAe+PBFAyMlGyUKn
	SMiOe0e8T+WUgbMs0IQyKC6KwgzGAFRYLeH/6UTlQNIigKHzGc+4YuAxaPq7BdEYpqn/b4kGW6gI9
	lWONCRTWIpVohrOLzive0BfwSSN+uk00HDm/QaVr1gHmXUU9yUp4R3FU4pEXYTAIZ9MhpX2FMEW2V
	M7zTw46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEL-00000000tM4-3VdU;
	Mon, 28 Sep 2026 15:25:25 +0000
Received: from out-45.mta1.migadu.com ([2001:41d0:203:375::2d] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDEC-00000000tJI-0ogU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 15:25:17 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=r5HnM/f7PTKF6og9shC2Jz8ilToiTnP5/ASxGy5XQl4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790609114; v=1; x=1791213914;
 b=L0QjN2NW/hnTiHV+/qUOvo0c8fE1vbZZSZPUCkWl/kSBY1mSoWmQlMjwWwL0nybqGIYWkZIv
 SnenD5YXVN9DEF5+2Syv6YzGRePKPswOIZZhbNRXCiF9CPIYIcGgrSMcudmhOXA8C368901pB3q
 XuKCY1o9SDkIKmOGx0K9oXns=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 63cb18f08da356ba;
	Mon, 28 Sep 2026 15:25:12 +0000
X-Mizu-Trace-ID: 63cb18f08da356ba
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jing Zhang <jingzhangos@google.com>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/10] KVM: arm64: Don't WARN on SMCCC filter reserved range allocation failure
Date: Mon, 28 Sep 2026 16:24:58 +0100
Message-Id: <20260928152507.2116110-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260928152507.2116110-1-fuad.tabba@linux.dev>
References: <20260928152507.2116110-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_082516_374846_CF47A8BE 
X-CRM114-Status: GOOD (  13.99  )
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

The first time userspace sets an SMCCC filter, kvm_smccc_set_filter()
inserts the reserved architecture ranges into the maple tree and WARNs
if that fails. The tree is empty and config_lock is held, so the only
way it can fail is -ENOMEM. The allocation is GFP_KERNEL_ACCOUNT, so a
memory cgroup limit is enough to hit the WARN from userspace.

The WARN goes back to when the ranges were inserted at VM creation and
the error was dropped. Since commit d34b76489ea0c ("KVM: arm64: Only
insert reserved ranges when SMCCC filter is used") the tree is emptied
on failure and the error reaches userspace. Drop the WARN.

Fixes: d34b76489ea0c ("KVM: arm64: Only insert reserved ranges when SMCCC filter is used")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260829055809.29AD31F000E9@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hypercalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
index b11b8821c9fbc..210a496733d0e 100644
--- a/arch/arm64/kvm/hypercalls.c
+++ b/arch/arm64/kvm/hypercalls.c
@@ -197,7 +197,7 @@ static int kvm_smccc_set_filter(struct kvm *kvm, struct kvm_smccc_filter __user
 
 	if (!kvm_smccc_filter_configured(kvm)) {
 		r = kvm_smccc_filter_insert_reserved(kvm);
-		if (WARN_ON_ONCE(r))
+		if (r)
 			goto out_unlock;
 	}
 
-- 
2.39.5


