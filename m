Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320AEFD875E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9oQqV+RX8x9mTT15DeOPQvLmrB9KGgQzFv8SO038oUc=; b=mwtvFRa1WDtEUB6o65nRnzGpV3
	C/4zjDVYaXBMZ69mI1L+2C+uDeNNbB6uDS5TLMIme3fC0rOsCS5+oUoXTTc2JqG3K/VuwZ+TNTh2V
	fGftcQlszLdLDArH0XoNfQsEogxG1oVefD18Ps1c9dlkej+zQCxI69EQsGICSh/LtGzCQ7tV7QioB
	CsINiE/CT2amQ7Brva+loIkBlQXoyK6IXOl02uOBIcgicDPlSslif3yLmbBOBGdWDQ26+ggKBjfwJ
	QnMtJId4CzyoVRBqOuHp2u1YjTfBvGLuctKhbz6pFo0GgENbjhoBHy2WCAj5Um13J6xIZjSR6IwjQ
	aX4qo7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UHa-00000006Ove-1VRV;
	Tue, 17 Mar 2026 13:16:26 +0000
Received: from out-185.mta0.migadu.com ([2001:41d0:1004:224b::b9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2UHX-00000006Our-3XNB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 13:16:25 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773753380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9oQqV+RX8x9mTT15DeOPQvLmrB9KGgQzFv8SO038oUc=;
	b=vmq4KMb4KSzFmj/OfzyizXiwqJq2DLV0RQJwJ/B/p2gFvajS76MJbamDhUTWIut9Wso1b/
	J0W2633uPICOl+Nx+imbwysMvlLot9bQS7bZO37W2koMM3P8+CUvKcywmeKhsEgfK36//5
	9sGRcnSHtHi7z9NXPasv8MmDdSTM3U4=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH] KVM: arm64: selftests: Avoid testing the IMPDEF behavior
Date: Tue, 17 Mar 2026 21:15:58 +0800
Message-ID: <20260317131558.52751-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_061624_091700_8B169C21 
X-CRM114-Status: UNSURE (   9.54  )
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

It turned out that we can't really force KVM to use the "slow" path when
emulating AT instructions [1]. We should therefore avoid testing the IMPDEF
behavior (i.e., TEST_ACCESS_FLAG - address translation instructions are
permitted to update AF but not required).

Remove it and improve the comment a bit.

[1] https://lore.kernel.org/r/b951dcfb-0ad1-4d7b-b6ce-d54b272dd9be@linux.dev

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/kvm/arm64/at.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/at.c b/tools/testing/selftests/kvm/arm64/at.c
index c8ee6f520734..ce5d312ef6ba 100644
--- a/tools/testing/selftests/kvm/arm64/at.c
+++ b/tools/testing/selftests/kvm/arm64/at.c
@@ -13,7 +13,6 @@
 
 enum {
 	CLEAR_ACCESS_FLAG,
-	TEST_ACCESS_FLAG,
 };
 
 static u64 *ptep_hva;
@@ -49,7 +48,6 @@ do {											\
 		GUEST_ASSERT_EQ(FIELD_GET(SYS_PAR_EL1_ATTR, par), MAIR_ATTR_NORMAL);	\
 		GUEST_ASSERT_EQ(FIELD_GET(SYS_PAR_EL1_SH, par), PTE_SHARED >> 8);	\
 		GUEST_ASSERT_EQ(par & SYS_PAR_EL1_PA, TEST_ADDR);			\
-		GUEST_SYNC(TEST_ACCESS_FLAG);						\
 	}										\
 } while (0)
 
@@ -85,10 +83,6 @@ static void guest_code(void)
 	if (!SYS_FIELD_GET(ID_AA64MMFR1_EL1, HAFDBS, read_sysreg(id_aa64mmfr1_el1)))
 		GUEST_DONE();
 
-	/*
-	 * KVM's software PTW makes the implementation choice that the AT
-	 * instruction sets the access flag.
-	 */
 	sysreg_clear_set(tcr_el1, 0, TCR_HA);
 	isb();
 	test_at(false);
@@ -102,8 +96,8 @@ static void handle_sync(struct kvm_vcpu *vcpu, struct ucall *uc)
 	case CLEAR_ACCESS_FLAG:
 		/*
 		 * Delete + reinstall the memslot to invalidate stage-2
-		 * mappings of the stage-1 page tables, forcing KVM to
-		 * use the 'slow' AT emulation path.
+		 * mappings of the stage-1 page tables, allowing KVM to
+		 * potentially use the 'slow' AT emulation path.
 		 *
 		 * This and clearing the access flag from host userspace
 		 * ensures that the access flag cannot be set speculatively
@@ -112,10 +106,6 @@ static void handle_sync(struct kvm_vcpu *vcpu, struct ucall *uc)
 		clear_bit(__ffs(PTE_AF), ptep_hva);
 		vm_mem_region_reload(vcpu->vm, vcpu->vm->memslots[MEM_REGION_PT]);
 		break;
-	case TEST_ACCESS_FLAG:
-		TEST_ASSERT(test_bit(__ffs(PTE_AF), ptep_hva),
-			    "Expected access flag to be set (desc: %lu)", *ptep_hva);
-		break;
 	default:
 		TEST_FAIL("Unexpected SYNC arg: %lu", uc->args[1]);
 	}
-- 
2.53.0


