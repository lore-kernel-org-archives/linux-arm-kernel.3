Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2487DCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 19:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6zXVgZPyPkQRAj1pWWzvdRd1dHDZMTxOtu3L4LbOPk=; b=ZkEHF4DDUxiORLAH4Qac47ayHQ
	Nb77yPda7fVY3UADBjjCAGR+Y7YI5F8m5gjU/QA8fhY/27CTlLJBMz0vsh5q0yFcvzpr0vEDU4/d6
	ltMAMfz7Fduc6Qk8tCvH7ijAXz80ufxJOt5QnWbwDFJ23i8qgj74bKKNQAYJ+Li6RkgtXxX78R0ak
	I7uzIqdVoqreBPyc/bTX/AKCEotYRfzeFVfS+0CXG8O5YU9QoobzaXcMP0RmhOISXqkDmWUUNK+BG
	Kw+XMwc5PudoS+Q6txYfz0xpzJaMVQwYhXpZQwAOpikyTrWH6e+mW4g+7cNfuM9qNiXd2VnSi+tr+
	xLN9jFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03j4-00000005qUF-3R9m;
	Sat, 20 Sep 2025 19:58:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v03iz-00000005qQv-36F4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 19:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD58F601B2;
	Sat, 20 Sep 2025 19:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 707AEC4CEF0;
	Sat, 20 Sep 2025 19:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398304;
	bh=/PGuPzUPjL3A+P9KZEgqSNbC4HFlPgCGBNUXeYVZjK8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CslDXXYXuTB9Eq5YwbxWKZ8CSsFsmO6kQaDa37/KASlu98PSgBFB5QMFWl8i4zSgt
	 f8jgz9AJWe76SYrzxjdQ6fKnaP1TKra9ID6lD1lvY2VevmEorWNNekFILptbQgs4SL
	 Hct83s/3S94u/Bn+FeMLsUW/WjcY/I7KaErkcme2v7K/OnMfAcKHqu5B821Re4WH10
	 QNEUchqYxX3Du70yTlNEcAAiVKrrLzyqQG2/S+3VEcLk2prF2QzzBMxOgiL6V+7dk/
	 VKMYqQYEVN7oPdeSaZinTYsiDOjKld5DDV9yClU5j1wcwKvR15tLdBEfOz3KU75gp5
	 AublQ1vm8HDTg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 20 Sep 2025 20:51:59 +0100
Subject: [PATCH 1/2] KVM: arm64: selftests: Remove a duplicate register
 listing in set_id_regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250920-kvm-arm64-id-aa64isar3-el1-v1-1-1764c1c1c96d@kernel.org>
References: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
In-Reply-To: <20250920-kvm-arm64-id-aa64isar3-el1-v1-0-1764c1c1c96d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-56183
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/PGuPzUPjL3A+P9KZEgqSNbC4HFlPgCGBNUXeYVZjK8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBozwdauQ6uUrBMCoPa4Nf0CnLyOqrS6iJbILFgo
 eNy9Y8VhFGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaM8HWgAKCRAk1otyXVSH
 0DrOB/4seDJw2IoI/2DuQs0EWGFEjPs/mkTg6Q3hIla8YNEM/PAhkfyxfa/k12oG131sa14o9Q3
 2OaZgYXZjeYN6id/cK6LYuZxcFKGytrwsgbFYYTxvCnWKTFBTYps8wspfMsx8ET9At+dlt1xbq5
 826QdoYqA/eKgB0OoVYItjHw9kigvKkrHmlPsDlFmvy6WTLRSCGcr3/sDFa6aoC4ckdp5gUKYoz
 wwUqEIoDw7tnq5TbwAM4LgQeqdLTCEgsRbXkJ4u1VswoJABpA/q1CAv9i1BoqQeDT6YhFwcUJiR
 S836wRFSFD/ShHmowSHJrYQTskjp/mCJ7Ha7n+fOtveV2wWE
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Currently we list the main set of registers with bits we test three
times, once in the test_regs array which is used at runtime, once in the
guest code and once in a list of ARRAY_SIZE() operations we use to tell
kselftest how many tests we plan to execute. This is needlessly fiddly,
when adding new registers as the test_cnt calculation is formatted with
two registers per line. Instead count the number of bitfields in the
register arrays at runtime.

The existing code subtracts ARRAY_SIZE(test_regs) from the number of
tests to account for the terminating FTR_REG_END entries in the per
register arrays, the new code accounts for this when enumerating.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index d3bf9204409c..bfb70926272d 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -763,7 +763,7 @@ int main(void)
 	struct kvm_vm *vm;
 	bool aarch64_only;
 	uint64_t val, el0;
-	int test_cnt;
+	int test_cnt, i, j;
 
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES));
 	TEST_REQUIRE(kvm_has_cap(KVM_CAP_ARM_WRITABLE_IMP_ID_REGS));
@@ -779,13 +779,10 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = ARRAY_SIZE(ftr_id_aa64dfr0_el1) + ARRAY_SIZE(ftr_id_dfr0_el1) +
-		   ARRAY_SIZE(ftr_id_aa64isar0_el1) + ARRAY_SIZE(ftr_id_aa64isar1_el1) +
-		   ARRAY_SIZE(ftr_id_aa64isar2_el1) + ARRAY_SIZE(ftr_id_aa64pfr0_el1) +
-		   ARRAY_SIZE(ftr_id_aa64pfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr0_el1) +
-		   ARRAY_SIZE(ftr_id_aa64mmfr1_el1) + ARRAY_SIZE(ftr_id_aa64mmfr2_el1) +
-		   ARRAY_SIZE(ftr_id_aa64mmfr3_el1) + ARRAY_SIZE(ftr_id_aa64zfr0_el1) -
-		   ARRAY_SIZE(test_regs) + 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
+	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST;
+	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
+		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
+			test_cnt++;
 
 	ksft_set_plan(test_cnt);
 

-- 
2.47.2


