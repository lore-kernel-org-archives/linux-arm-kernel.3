Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D834AC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkdY5QoUikW/hUKBv7iWovzBUjrfRCs9UqHmvb30Ogw=; b=LKXozH4S5sBXMWK/K8KhicUgpb
	Slz9y3uGq2tCIn/Z7jyj9V/R05EDU2l0NkpfYq1Oy43GwOWoF10XGW/McAe0bQVcojkLw1gmJijFm
	tO6/qpN7+l/UE/Dwr9Z9CGhqP3Z/iVF9ZA9lrP1dAAKPAqmIYN/8Fx5fmZSOq396FlyNlLxEHr+XL
	8MwkvgPlorLr1e6aZPgn62F3pXSK76vmS/t4ypuSWdkkJtrNS5Ecxz/MHLRhl7YRiq+otJr+roldT
	nPhe6OtVWHC6sQPoX/yg7oGDIjqDjH6R3g5BwNxI3PSEw48ARNB3nRjOrxtDWRTlB9w0f9n/jt1Ak
	eBMUiNWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Kx-00000005ebx-2zba;
	Tue, 22 Sep 2026 14:19:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Kp-00000005eXa-25G5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:19:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4318E40B25;
	Tue, 22 Sep 2026 14:19:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFAAD1F000FF;
	Tue, 22 Sep 2026 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790086743;
	bh=bkdY5QoUikW/hUKBv7iWovzBUjrfRCs9UqHmvb30Ogw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GyCN7jqN/CoIWJFvNoFAxgIBny2D+4pinx0yeYCXlJ0qgkTiWNdHmcfSnABRL27t5
	 AdKsMarz7IAili5OC/C/c/cpaa1kn+04VIFOlwkG0ssy70FgVpxGxKRLPkePuomdOP
	 ycZLUgkkIW0WxfelkPC9BQcTN+oE0wsKZxERH4gn733eTpjGd07RdNbeDzWM9j/B2x
	 IctnTTN779RapU4x/BNVT/m4QLXwtYZTK9ffUeA81HXM3+8v7t/iwdU8uEiwvya2fZ
	 KORWTYTbAm87j9JgxdDfL+eJYvxa11DYH4wtynt11F6zyE1todu2/6nILg9Lk6sUNQ
	 VMXtfE3FWcJ3Q==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Tue, 22 Sep 2026 15:18:02 +0100
Subject: [PATCH v3 08/14] KVM: arm64: Propagate EHWPOISON in
 kvm_s2_fault_pin_pfn()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-kvm-arm-prefault-v3-8-787bd3bc7e3f@kernel.org>
References: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
In-Reply-To: <20260922-kvm-arm-prefault-v3-0-787bd3bc7e3f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
 Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <fuad.tabba@linux.dev>, Randy Dunlap <rdunlap@infradead.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982; i=ljs@kernel.org;
 h=from:subject:message-id; bh=Wox9mL75hsFbcgIdf6d99gH1zw8jSQZBJjzuXgfg9vQ=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI29UneLW3mulbBneA24fAuw6orzls0shrmCLupdR6Xc
 GK7flO1o5SFQYyLQVZMkeX5F/H9QSJh8zov+LvBzGFlAhnCwMUpABM5qMjIsG2D+GFX5XeTu6RX
 fz3DV9nu9Veh/tgWcyb/S46S0fXmexkZLubp7+2RFfnFU64b+YS5/cNMT4bL4vcUV82d+FWNYZY
 MGwA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14
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

Currently kvm_s2_fault_pin_pfn() handles a poisoned page directly by
sending a SIGBUS signal itself.

This is an odd place to do it, the caller should decide what to do with
errors, so move the handling to the sole caller, user_mem_abort().

This lays the foundation for stage 2 pre-faulting which, arising from a
synthetic fault, should not send a signal.

In order to do so, check to see if user_mem_abort()'s caller has set result
- i.e. whether it wants to be informed about the outcome of the fault
handling.

If it does, then it is implied that it should handle the -EHWPOISON error
itself. This is the case for pre-faulting.

Otherwise this is real hardware, so send the signal.

No functional change intended.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 arch/arm64/kvm/mmu.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 221ea069f9bb..2576b967d20e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2016,10 +2016,8 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
 				      kvm_s2_fault_is_write(s2fd) ? FOLL_WRITE : 0,
 				      &s2vi->map_writable, &s2vi->page);
 	if (unlikely(is_error_noslot_pfn(s2vi->pfn))) {
-		if (s2vi->pfn == KVM_PFN_ERR_HWPOISON) {
-			kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi->vma_pagesize));
-			return 0;
-		}
+		if (s2vi->pfn == KVM_PFN_ERR_HWPOISON)
+			return -EHWPOISON;
 		return -EFAULT;
 	}
 
@@ -2261,6 +2259,13 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
 	 * get block mapping for device MMIO region.
 	 */
 	ret = kvm_s2_fault_pin_pfn(s2fd, &s2vi);
+	if (ret == -EHWPOISON) {
+		/* If result is specified, let the caller handle this. */
+		if (result)
+			return -EHWPOISON;
+		kvm_send_hwpoison_signal(s2fd->hva, __ffs(s2vi.vma_pagesize));
+		return 0;
+	}
 	if (ret != 1)
 		return ret;
 

-- 
2.55.0


