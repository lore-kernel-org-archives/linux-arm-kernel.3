Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5FEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 19:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wPx9GXOH1zUBC9Z/a9ioEUGinGiGd/oMBZ9QGqZ8l5E=; b=PMhrx/rKhyOTXNfQwCrbEvv9iy
	s9mWVbbQCkBIhvwbdWZdlFswqpGayvN+2uubh5NFtSk7v/7tK6q36OLFnhKeQcFfxe1ggNOg8pGft
	At0cbqJGcJAQQelWy1u2wOQs5XuHrS0rgOSjvgsfn3RBVOke7gCMB64IPFz2wu2sKVetWvY2Y3PAO
	ShUQAq/TC2Pqr7u8ZIPSWbQlzLD5rny4/azUqA8D8ietMsF349h/Y3w2yTC00ZjZ99jyY4sQ5wLnZ
	JunhTe0rwXbMQ+X0JOFBr5Afe/K5gbYvtGwTcXFgohKL9cCaZ8pk7npKLOjERN7hxPQxtxZNiVcc4
	iKlQqk0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGnx-0000000B72P-1ija;
	Mon, 16 Dec 2024 19:30:57 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNGmq-0000000B6lo-3Wap
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 19:29:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A84DA41A04;
	Mon, 16 Dec 2024 19:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C88EC4CED0;
	Mon, 16 Dec 2024 19:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734377387;
	bh=zob8cBbXpNsaY9MTVMiTWopsdDQ7UbvHJyGMOED+hro=;
	h=From:Date:Subject:To:Cc:From;
	b=RceAWJ5Q2b4cYp49HafjaGkvIF9zm69/z/2HLKc3IS9jz5zzn38GD+oTZSnh2IbYc
	 jr+FOGAmx09yngJSQoX/EYvhpQNh9STzPtn0RqhJ/PSyAPPXLtlmHYXc7KdNDDUhAJ
	 tcBc1lJv/sytueVF9aHmsvhJC06GcDzdMSuPfzI7yHeQQLR9nLWrKQto8qFTJhhAiF
	 VQwcTGXNvF7V2nZOyYp+r1YhWaoAYRiJvOaOvGB92CEOa9edLORlo1EAslUr9y/KCC
	 DCIw9DDaSLGIseq2rxT1fqdK9+Gsz1Ov0gw8UN1e9QvGgV7eqS2Ofxbxy08XEY0gm0
	 T3kdVHQTcTJPw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 16 Dec 2024 19:28:24 +0000
Subject: [PATCH] KVM: arm64: Fix set_id_regs selftest for ASIDBITS becoming
 unwritable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-kvm-arm64-fix-set-id-asidbits-v1-1-8b105b888fc3@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFd/YGcC/x3MSQqAMAxA0atI1gZsndCriIvWRg3iQCMiiHc3u
 Pzw+A8IRSaBNnkg0sXC+6Zh0gSG2W0TIQdtsJktjDUVLteKLq5VgSPfKHQqQCccPJ+CjadAtvS
 1Czno44ik7P93/ft+dELguG8AAAA=
X-Change-ID: 20241216-kvm-arm64-fix-set-id-asidbits-9bede25b7ad3
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2077; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zob8cBbXpNsaY9MTVMiTWopsdDQ7UbvHJyGMOED+hro=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnYH+o8aXSlFkq0JGBg1lM1VwGO+DbhuBYGgA0lSnu
 em750Y2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2B/qAAKCRAk1otyXVSH0HySB/
 9KXCZ0JRJ0FegaopfpAL6MwAVzZ47XDi1i0B4ODxl5pBgFCnLOSZOzxG1WNdAKaNxymgQOG9TyZNq+
 7ReuXTGTiZspw2CqVdH3ypZNWzIgfkRzNg8hYx+nli6lddmcubxQE94D75DmMTJAAz+jZVraqxmSSs
 vlZxm1WG8s1gN5WfYEwkrsnxQkCsjDoRTlVKg4oVOs6X7Kc3ePbuvIwk1exGMWGZ8uHUaTab9+r5sl
 ej+WQt7MSuXLY2ymYH6oaITPjt+FJM0kDNg6k1J962MLyfQEMkpS3m2z36sGgVFlsspasqbgMStuif
 qk7g0Ba+4gaA/8CXKp9bQ91TfgI9K/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_112949_017053_C8EBF9E7 
X-CRM114-Status: UNSURE (   9.47  )
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

In commit 03c7527e97f7 ("KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits
to be overridden") we made that bitfield in the ID registers unwritable
however the change neglected to make the corresponding update to set_id_regs
resulting in it failing:

# ok 56 ID_AA64MMFR0_EL1_BIGEND
# ==== Test Assertion Failure ====
#   aarch64/set_id_regs.c:434: masks[idx] & ftr_bits[j].mask == ftr_bits[j].mask
#   pid=5566 tid=5566 errno=22 - Invalid argument
#      1	0x00000000004034a7: test_vm_ftr_id_regs at set_id_regs.c:434
#      2	0x0000000000401b53: main at set_id_regs.c:684
#      3	0x0000ffff8e6b7543: ?? ??:0
#      4	0x0000ffff8e6b7617: ?? ??:0
#      5	0x0000000000401e6f: _start at ??:?
#   0 != 0xf0 (masks[idx] & ftr_bits[j].mask != ftr_bits[j].mask)
not ok 8 selftests: kvm: set_id_regs # exit=254

Remove ID_AA64MMFR1_EL1.ASIDBITS from the set of bitfields we test for
writeability.

Fixes: 03c7527e97f7 ("KVM: arm64: Do not allow ID_AA64MMFR0_EL1.ASIDbits to be overridden")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/aarch64/set_id_regs.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/aarch64/set_id_regs.c b/tools/testing/selftests/kvm/aarch64/set_id_regs.c
index a79b7f18452d2ec336ae623b8aa5c9cf329b6b4e..3a97c160b5fec990aaf8dfaf100a907b913f057c 100644
--- a/tools/testing/selftests/kvm/aarch64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/aarch64/set_id_regs.c
@@ -152,7 +152,6 @@ static const struct reg_ftr_bits ftr_id_aa64mmfr0_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, BIGENDEL0, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, SNSMEM, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, BIGEND, 0),
-	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, ASIDBITS, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR0_EL1, PARANGE, 0),
 	REG_FTR_END,
 };

---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241216-kvm-arm64-fix-set-id-asidbits-9bede25b7ad3

Best regards,
-- 
Mark Brown <broonie@kernel.org>


