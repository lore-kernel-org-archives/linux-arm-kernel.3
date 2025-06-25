Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884F0C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 16:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QISmFyzBGtwdC4qBbw8EaH3ARP6S4Dx8iEEmYy6dPM=; b=hdkUmPgfUVTj/ACpmXCQgyJ/Wv
	ttb4Tn6yrwEXugfPEmskw1Y92UQAc2gu7X2myAUXDv+pr1ft9cC1xmMYmm868GVthc476xznKQCeo
	w8afuJiHTb/p+6WYyZjqo7cX4qwRwdniIOVrkONFsJ8A6bajFa6x+fgZHEm6BA1+IMzPMFNVCxf8t
	c4RwTdgJxM866lDZZ/I5vZMFoPX7tXWlMNTAiUb1l4WouIEJJfBPo7Bt6I4t8e/FBwxfRkQy2/y6K
	54lCwpWhzYJp9pqHKVCa/wiKA23UF0J41ffR94v6APlWmsdd3ttYivDnlbdZNvwU8tDgo1ffDt0Wc
	iS6KDfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSf2-00000009DzB-0WEg;
	Wed, 25 Jun 2025 16:07:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUOGo-00000008T3A-43ZB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:26:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B27E61784;
	Wed, 25 Jun 2025 11:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDD2FC4CEEA;
	Wed, 25 Jun 2025 11:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750850786;
	bh=8wKbF7ujl1hlDs76hV4PzHiP9Uo97M2NjFijaiGNkbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CjmAbHl+bPNg8RlC8ZCfaqwwPd4NQ+EShcFjK33qIo3ksxA/dnMU+CE3jQ24ik899
	 YWnRA/WGf1zBFIVMdCKnE7P6FVNVIST7MOSYxOLW/a6WBK9MXSq/maWeSY3mKOr2mj
	 Qgcm7OXgDeSY9bAHR3yYJDW6HNGwYNXegmcteCLDKNaDMWmaFpKqdVOUrGL2EL97EA
	 W87DH7E98NsKnZxteere4ZjPy7DsaVtSM2y1IIUoEaQl4b6CAyiTkqg1rQ81P+rWuN
	 VqoHvI1zgB9cOanaOB03joBfdFYwqFsgKR2V0LGQyU6XvNqfwLx9tYt3RYyF7Re8eq
	 VRZCH3WmJ5DVg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Jun 2025 11:48:18 +0100
Subject: [PATCH v6 27/28] KVM: arm64: selftests: Add SME system registers
 to get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-kvm-arm64-sme-v6-27-114cff4ffe04@kernel.org>
References: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
In-Reply-To: <20250625-kvm-arm64-sme-v6-0-114cff4ffe04@kernel.org>
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
X-Mailer: b4 0.15-dev-08c49
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8wKbF7ujl1hlDs76hV4PzHiP9Uo97M2NjFijaiGNkbY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoW9x6jP9Kbaqa1gjraF/WFiCP4Z0JheFJ8M16d
 OY99NwBbDCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaFvcegAKCRAk1otyXVSH
 0AyDB/9GynBfXm9+yas6Ol1uzb4YLnaWl8KeuXK1eHNlqwJ0WNkCFv2l+OJcWl9IPZPaVqnegKu
 tnmssq6PGaBdn4uXKhW9UZR01maR1tnfdo/l8uHc0dGt86lgzOK6upw6dMjSqREQyeb6qgIudDB
 pEQwOuCrcQuDODOYmL9LuLqbx0wVwozh9kU05f9Mpj6hiU4sX68iGhoVf66QyhBao+nDJ7REjuJ
 Tqfq7eGVNHAKDPWwNxojIepthauKSX5slcikAGp+Dper/jN7ZFhxbPR3LHjQeqaKLVEGnoaGEjP
 DvdA0Su08HOinXbrJI9TLNdrOV7IvQ0oqPpWjkX9N6yx3lI4
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

SME adds a number of new system registers, update get-reg-list to check for
them based on the visibility of SME.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 32 +++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index d01798b6b3b4..920784aa2838 100644
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


