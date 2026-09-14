Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7DDC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d44gE0/IL0gyA9lyN7r1jK3OuMoXRfrYJhQ+4wSHM8U=; b=0NFQAv0pZPassYZMzE/r2rCmcr
	EGDa4HIeC0WOVsLBJ/a669BrDZ6Bxy8Ga7ZVAmDZ4hOQN8isafkcwCG4aeARhWU8iwv2l7EaYndbR
	XAB8z1jo02yE+uN/8os+Q7pSF1rDqvioc/WxRzjLBuC+Wav2wtm1ebT6sW/2OMNHW/215lLc96Nyc
	4N/PdGLJugfiXKBI7AhoBRIcmK6sniiJs46rpN5NIBeYteL9gOasdldjLBFigV7F1Vna2jWKfbSfB
	qDxK8VB/MeeJ7TxX+075jYq94TnXOuCSgpCWhYjouYTfl/7+UefdvMuko6COFS6g+qBRTsMPJPOqk
	+F89CvIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65mJ-00000003Xjv-20pX;
	Mon, 14 Sep 2026 12:27:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65mH-00000003Xj3-3a7z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:27:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 99ED641343;
	Mon, 14 Sep 2026 12:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211091F00898;
	Mon, 14 Sep 2026 12:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789388837;
	bh=d44gE0/IL0gyA9lyN7r1jK3OuMoXRfrYJhQ+4wSHM8U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VbA1+Er/iWG/56cK3BppcKN06PLdqOGhz/rBvvOCk7lo05ELrzewdm7Kvn49pjlaK
	 I+fVuw7agdYbnPzfh+enQ+6/sm54EhVrTdXveTDzJmm3n4y8A8R0lNjNuaW2by2Gfr
	 4K0rZeeJ59RRQhk1MUtQ0Fwcwh9t5pzZV86l0BiWwWxKhGAQnBWnBcqkZdeyuG1g2+
	 0ge4jV+cSKVF17sako6EiAwrD4TeYvck5sZ0vWttdkN7Bl9gTVRPsDp97a77xhNAYL
	 jSJYykGEcy4wI2Ea2ww7EO0HtpqVzFaWOTmHEidBVBiU7wE0+w27KsCTHyff0jzvjt
	 5aHDTpHYT6GkA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 14 Sep 2026 13:26:18 +0100
Subject: [PATCH v2 07/13] KVM: arm64: Propagate EHWPOISON in
 kvm_s2_fault_pin_pfn()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-kvm-arm-prefault-v2-7-26fb47f74b73@kernel.org>
References: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
In-Reply-To: <20260914-kvm-arm-prefault-v2-0-26fb47f74b73@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jack Thomson <jackabt@amazon.com>, 
 Jack Thomson <jackabt.amazon@gmail.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Vincent Donnefort <vdonnefort@google.com>, 
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
 Sean Christopherson <seanjc@google.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, 
 Leo Soares Passos <Leo.Bras@arm.com>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1982; i=ljs@kernel.org;
 h=from:subject:message-id; bh=Hb4EU3ooaVPX0vORXtq1G56N+69ZYTRtU/gYDr/Xt9w=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLKWP/9qbKIWcyhaOuTB7wW/pmysejLhhOHH7Jh70y/wt
 lxav/HgiY5SFgYxLgZZMUWW51/E9weJhM3rvODvBjOHlQlkCAMXpwBMJO0+w//Q/x4Ma0RVQ334
 7rIXmNj/mKEeJuC4v35PmescCeWNKscZGaZWv5unp9nA0vN6bp3o1pvHdt8+rGDNwLv+XKpb5DV
 lVjYA
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
index 8c23fef4ecf8..eae085a622ff 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1946,10 +1946,8 @@ static int kvm_s2_fault_pin_pfn(const struct kvm_s2_fault_desc *s2fd,
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
 
@@ -2169,6 +2167,13 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd,
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


