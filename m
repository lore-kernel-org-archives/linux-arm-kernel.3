Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C95E606AC39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I++rxUiX;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WaW7JSgj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=A0dv3I3LgauzsxhnnoQrRe1KXsYEPPAsnmbINkJOsD0=; b=I++rxUiXtRE75OenqkxW1SJdwq
	cycIhQ9WluWTD6x5y32wncHjIDT8pPZE+wSGU6otT+Giy5l58yP4h+f9xzjTDYVXhZXNrJFRBNl6k
	Uxsdvw+XzaHt51g3lPaTUcF8v2Krxnh9IVQO4CCUDScAR2AgvAbVcUuNvonzShsSydT2U0GDZjNDE
	cMjpbAq81CjNDNN+nBhrrJKL5pbViFRUyBGllzhvb5+XWMHpEGVwVvZnlHZRbKdN3ZbQJm63wl2RI
	jg5orjiaNiZCnaAaIYwKohNO9Dp+UNgat8cB0U/AxKXH+m0+qJe5ijvI2uG43XEWtAWtoauuPtVYw
	LVox4w8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkD3-0000000BSLX-3rOw;
	Fri, 30 Oct 2026 10:51:45 +0000
Received: from out-104.mta1.migadu.com ([95.215.58.104] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkD1-0000000BSKP-0N2k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:51:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=1TcNP8eN2SDjaN1bgFoh1AhCvsMUSR+eK5knTA7zNYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793357500; v=1; x=1793962300;
 b=WaW7JSgjXWApB6refU7TiKFy0lROwj3+RfWnq20yuV2N98nGHhAB6ziOqqeP9BpIOPXQqMUU
 ElrZJIq8g/+aCsrrc+TY/96zGGojdAqmTHiSFfwRDYjDQQiAj7CdxoGBrpz5sG21DjkMhqry/QS
 3gDeuAleuuo4FQQ+2Ewf+St0=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7a928a9d3355d0ef;
	Fri, 30 Oct 2026 10:51:40 +0000
X-Mizu-Trace-ID: 7a928a9d3355d0ef
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH] KVM: arm64: nv: Size nested stage-2 MMUs by the NV PARange cap
Date: Fri, 30 Oct 2026 10:51:39 +0000
Message-ID: <20261030105139.3543230-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_035143_589034_84755CB3 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

init_nested_s2_mmu()'s comment says nested stage-2 MMUs use the PARange
exposed to the guest, but it sizes them with kvm_get_pa_bits(), which
returns the host's IPA limit rather than the 48 bits limit_nv_id_reg()
caps an NV guest at.

On a 52-bit host, every TLBI ALLE1IS from the guest hypervisor then has
KVM unmap each valid nested stage-2 across a range 16 times the one the
guest can use. Under QEMU, the KVM init of an E2H0 guest hypervisor
doesn't complete within 20 minutes.

Make kvm_get_pa_bits() return the 48-bit cap for an NV VM. That also
bounds the nested walker's limits, the emulated TLBI ranges and AT's
address size checks.

Fixes: 4f128f8e1aaac ("KVM: arm64: nv: Support multiple nested Stage-2 mmu structures")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
The 48 is written here and in limit_nv_id_reg(). I couldn't derive it
from the VM's ID_AA64MMFR0_EL1, since the nested MMUs are created in
kvm_setup_vcpu(), before kvm_reset_vcpu() initialises the VM's ID
registers. Userspace can also lower PARange afterwards.

 arch/arm64/kvm/reset.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 10eb7249aa9e8..1918837757682 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -220,6 +220,10 @@ void kvm_reset_vcpu(struct kvm_vcpu *vcpu)
 
 u32 kvm_get_pa_bits(struct kvm *kvm)
 {
+	/* An NV guest's PARange is capped by limit_nv_id_reg() */
+	if (test_bit(KVM_ARM_VCPU_HAS_EL2, kvm->arch.vcpu_features))
+		return min(kvm_ipa_limit, 48U);
+
 	/* Fixed limit until we can configure ID_AA64MMFR0.PARange */
 	return kvm_ipa_limit;
 }
-- 
2.47.3


