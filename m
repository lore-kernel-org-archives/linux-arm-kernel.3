Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F18C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 08:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H6vnXZPBZBPBLGBoC4F9BPf0LkExxgpUY6++1oeg4M8=; b=RuB06X6A6gthQq75XvVWP5hQL7
	rohcIvTMDR0r3JIwzr0iGSiDzM+sPvpooHmNCN1nCkT773YKs43DgaZ1ujh4zRLAzplMHIzCF1EOg
	bJyb4QP9nPjGJBpn7bF+/pcvgWdOqidB5fcT1EFiCnbYEaui7bKu1WVwuRtAx8ip9Vkx0PTyVhGct
	nPj1GfpfNY+2/AzLr/JbZm8dQfZ9+4F27wZFj0Jv/mURMtTFcdEOYzMv5e1ZA1Wdc8BuOPsjoyGxv
	a58zJ3kJgrobf6JNi/xs//I7H3ydDk4QeKjUPUq20464wePUg11j9Z27iQ2KtRs6ZMNUPiHQwyTUJ
	Hlbz5YLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Omg-00000005g1L-32KS;
	Tue, 15 Sep 2026 08:44:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Omf-00000005fzx-1OiF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 08:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=H6vnXZPBZBPBLGBoC4F9BPf0LkExxgpUY6++1oeg4M8=; b=lZbZd0UdbQGX2tOSN0uCjIHe5K
	ulj1CXJcao51mFkuLP75wMXle2u0rdxzAJHglMB73YSXh7W2ycsLXEvPZAOaQ2bsdm+mbPUBh26qu
	zQ7TTzHKpzqAnCJlnFU8dajUPYzI+zOVTsVZxLH3IEgCgM3mcsrwqlB8f0ivme3SJbTYOLZvgBvin
	mcpERC2r2vunfnidNEbv2mxMd9vN+mbuMQWD3C5DBv3ZcLJzpYkWTBWOM10irwUXCsjYgMTJI5Jq6
	Q7EIwl7/1Zrz78D/bbOTvndZi23C2qn8vNG23QSoclCzeGlD+NpdCoMIA/DrLYvkCd+gh3sYV2hMH
	LZyZt6YA==;
Received: from out-93.mta0.migadu.com ([2001:41d0:1004:224b::5d] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6Omc-00000006S0c-1xrW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 08:44:56 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+4rM/vb9bgnywxjBITcpXSRkVe9CVyh/SFm0f0Uf3bA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789461892; v=1; x=1790066692;
 b=UGCwd+ZjQJHmbHAhhb/dUJy+HvKCo+/LTTvnT6HZxGYBO/JvY31hKXEtgQDE+9ACWM9gbcCk
 rqmJJiDd5o5jJIXIPtP/0TiiCOGTO3XTMHteXLWJ9o29gV68r6nniisNizEUt5INJ2xMlFAhSZv
 6BxYO+5Qm9VjYB6w/HoM81pk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bf7d1fed5110460d;
	Tue, 15 Sep 2026 08:44:52 +0000
X-Mizu-Trace-ID: bf7d1fed5110460d
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] KVM: PPC: Book3S HV: Fix comment naming a non-existent KVM_VCPU_RUN ioctl
Date: Tue, 15 Sep 2026 09:44:41 +0100
Message-Id: <20260915084441.3846947-4-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260915084441.3846947-1-fuad.tabba@linux.dev>
References: <20260915084441.3846947-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_094454_737043_5B9D8451 
X-CRM114-Status: GOOD (  14.42  )
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

There is no KVM_VCPU_RUN ioctl. The one that enters the guest is
KVM_RUN, so refer to it by that name.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index dbac3573b2c89..db090f4c5e95b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -269,7 +269,7 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
  * stolen time for a vcore when it is inactive, or for a vcpu
  * when it is in state RUNNING or NOTREADY.  NOTREADY is a bit of
  * a misnomer; it means that the vcpu task is not executing in
- * the KVM_VCPU_RUN ioctl, i.e. it is in userspace or elsewhere in
+ * the KVM_RUN ioctl, i.e. it is in userspace or elsewhere in
  * the kernel.  We don't have any way of dividing up that time
  * between time that the vcpu is genuinely stopped, time that
  * the task is actively working on behalf of the vcpu, and time
-- 
2.39.5


