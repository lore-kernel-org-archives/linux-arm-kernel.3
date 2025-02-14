Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F7FC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLRkVh3IUTez5Iq7b+BCeGH0UWlj8oMR6j8tRUGJfX8=; b=doZQjV6pYjJihRbuOvWec6g1Ro
	wTNMeOy7O5GLPVJC3k7C/mK28wvX3Qe0rudy8ApRiaQ3A23KKrdk1noWc7fCRuNk3LuKItx0mKKNH
	yUTxcX0hGqvwx7zbJkQhuGmKDV3SZcd8JUe9M9v5+1vv2IuUesuzxQKcI0/L9dfRvfZ7ZhSW62ygM
	C4d9Z+AU1191tO+7UNdnWuPwwZSBwGZiip2FcGl6R3OEGgG5WKEbvrhQKNXOGZ3UtZXPxNfLZm5FC
	3RRzFkah0KLiHumA3YCbedaLDhK/qH5079Tpj9DK+kLHwQCi4S1J7Vourn4sqVb0gf1Vc1Hb1cEDj
	rQtwZiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tilck-0000000DNOH-1yCr;
	Fri, 14 Feb 2025 02:40:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til2N-0000000DFiM-2Rnh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 883A0A42AB1;
	Fri, 14 Feb 2025 02:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292C4C4CEE6;
	Fri, 14 Feb 2025 02:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498558;
	bh=JUdjCdwWXgHJ0BQ7rRBLVqj2VAyzOivKMWGTdmvk78E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qeyoKeOq3LhP9SwJ3dlzye1hzKsOi9O59nDkQ9wR+K8pTgNjo+S/ZfmhCKISN0o4r
	 cEtI8SIDEZQPpU7w8M3criu1Z9OgUWVTpAt853sWEHAScHfT6wjI0uOXwFvYbUiuPT
	 BO71i/oA4DL40u/68lQ6RK9TlYWOFZjOsYnzX2yIwIE9dW8oiOoUywrUxkTxUXFVIe
	 M8lCCvf5jphj9aJ4JU/AGwFEs0SWedevBwRjv+UfIXa/kaOjN9HXh+lSELMQWNuXq+
	 HNONRWvJicOqEC3iy29sfsjkV8I+ximjbZYRol6KVy1Qs/UsOEokBqHt+k0KjlJ+hU
	 8KRAjGeSwAllw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:58:09 +0000
Subject: [PATCH v4 26/27] KVM: arm64: selftests: Add SME system registers
 to get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-26-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1692; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JUdjCdwWXgHJ0BQ7rRBLVqj2VAyzOivKMWGTdmvk78E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPUAbLtNqVxgMYtHdPngkRqF4iTgj4ko7UuAkVV
 T1f1iQeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66j1AAKCRAk1otyXVSH0J5UB/
 0UwzkUr/qEiXnlx6rIyePn8f5jckMB1M3RPf+amV4dwtmsAm8QQfyd8bs911zisZ9BL96M7+fcGmTa
 NGre1IjHeVBUQJJyDWU/Xl1Dw0C6JEJreVbo7bw6HsB75qGcfrAjol1ntLfOVz8LAkQkyZumOR/8Gp
 xS753HwM55AelORtYtH5kj85HxVajQdFtj8hKTPzMAkhWDvilnSF54j8Hg6kU56o1fEKyeY2Aduoav
 kCw/n5gHQRurY7t9RCpIqPKtgk21Jp1ruUDd+cOlUYInf6nS/sWIsS6oPaGZ4kSyzHlmEn3akF9Nsn
 cp/18KGhFYeOiNJz25LlNRsmD+oInv
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180239_758321_F07A2EE0 
X-CRM114-Status: GOOD (  11.12  )
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

SME adds a number of new system registers, update get-reg-list to check for
them based on the visibility of SME.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 32 +++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index d43fb3f49050ba3de950d19d56b45beefec9dbeb..3e9c19c4a0d658f349a7d476a90b877882815709 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -23,6 +23,18 @@ struct feature_id_reg {
 };
 
 static struct feature_id_reg feat_id_regs[] = {
+	{
+		ARM64_SYS_REG(3, 0, 1, 2, 4),	/* SMPRI_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 0, 1, 2, 6),	/* SMCR_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
 	{
 		ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
 		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
@@ -52,7 +64,25 @@ static struct feature_id_reg feat_id_regs[] = {
 		ARM64_SYS_REG(3, 0, 0, 7, 3),	/* ID_AA64MMFR3_EL1 */
 		16,
 		1
-	}
+	},
+	{
+		ARM64_SYS_REG(3, 1, 0, 0, 6),	/* SMIDR_EL1 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 3, 4, 2, 2),	/* SVCR */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
+	{
+		ARM64_SYS_REG(3, 3, 13, 0, 5),	/* TPIDR2_EL0 */
+		ARM64_SYS_REG(3, 0, 0, 4, 1),	/* ID_AA64PFR1_EL1 */
+		24,
+		1
+	},
 };
 
 bool filter_reg(__u64 reg)

-- 
2.39.5


