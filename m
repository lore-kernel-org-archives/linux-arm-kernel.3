Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCAC1FD3779
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdQT2vpoiDSisab0IRJ3JiNt86FNe7zWZY8TG/Rk8ck=; b=1zqXUZX4lrEpiZJWBt76wSDJak
	iJ+r4DeoeDRFYl6qWHJLRJxk0Ix12o2e443KqSbgpjP61iaK5tL3ULBwloQRskSoS2ekBum4Sx1uh
	rFxJHyJB5Tbwe0P7S0fjgwgGDSE16SbHNmmq/F6K/hldvLO1XsPV+TrS9+TWKHuRSGojmuuk0QQ3J
	4I2YdFpjEZ9qU/5nUckuR2+fyWDGjuyaw4J5DFGE5D90rgLJfhPwFw1L8PZmNeX99+jYrqys4SMU3
	YtHt/ohS8Sx5LRxYaQHqJUBAhgp84FUTxYgGvaDR6OGfqPppqLl9Y3MNRLB35cw8tfc++QOLPKwy7
	hs8YOgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInk-00000004fQu-0f7d;
	Wed, 25 Feb 2026 17:35:56 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInh-00000004fPZ-0VUa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:35:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772040950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VdQT2vpoiDSisab0IRJ3JiNt86FNe7zWZY8TG/Rk8ck=;
	b=SqdKUoSu4/OSRX9Yqdh+ua06wG8G+zR9/XxQNlsYiq+hbs3Ngp6R3EgJzqMldqReO4dGn7
	A2tp0zh/C3nhlsAJ8GyDVLBg9p3zfzjDi9SwSomrEB6zn1wC5kZlhNxlX1d5yvw2c8lmiT
	7BsiTHXeTk3+I+qQSk2ypxcxUW7EMSg=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH 3/3] KVM: arm64: nv: Inject a SEA if failed to read the descriptor
Date: Thu, 26 Feb 2026 01:35:15 +0800
Message-ID: <20260225173515.20490-4-zenghui.yu@linux.dev>
In-Reply-To: <20260225173515.20490-1-zenghui.yu@linux.dev>
References: <20260225173515.20490-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_093553_311391_E061CD29 
X-CRM114-Status: GOOD (  10.27  )
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

Failure to read the descriptor (because it is outside of a memslot) should
result in a SEA being injected in the guest.

Suggested-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/86ms1m9lp3.wl-maz@kernel.org
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 arch/arm64/kvm/nested.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index a957542ae3c2..79e6091b738f 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -296,8 +296,10 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 
 		paddr = base_addr | index;
 		ret = read_guest_s2_desc(vcpu, paddr, &desc, wi);
-		if (ret < 0)
+		if (ret < 0) {
+			out->esr = ESR_ELx_FSC_SEA_TTW(level);
 			return ret;
+		}
 
 		new_desc = desc;
 
-- 
2.53.0


