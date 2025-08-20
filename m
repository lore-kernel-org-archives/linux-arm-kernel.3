Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D917CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h0piiRfHyjJziVElC67OOVzjpJN/73QOP8SdYJaYoXE=; b=OL15WXJ6tcwoB65AxK6csOcose
	TrMdHAc5sbb3GF9ofc/uv66rgUFi9LkljTJB2ZgAURGboM7leF5VfwSnR0bi7ovJ+8Ul9frekuPec
	bIed9iCbizrRB9WmC9QjSoZk/oIWDbkoS7KqtrmWILwi25rDtITQ2wFsb0dgdta0og38Ltg01/9M/
	NTgw3Mo/fkDFLV20X2YRsBHcQ+gRCarBeuyO+HHsSyP9iOcyLv/NeE/LOpU98us53OVW/zDJs6/uQ
	UrrJVwZxDP70PCKvCSEiml/TKP70GNMJTgehcZDM1Cu6FjyOBFmjPDvzoxlbLs7PViHrWGJ0w2VRo
	vDjz3o2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uol7K-0000000EJIO-29Vp;
	Wed, 20 Aug 2025 15:52:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojbK-0000000DzI6-083Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 74CB7601D7;
	Wed, 20 Aug 2025 14:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55887C113CF;
	Wed, 20 Aug 2025 14:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699341;
	bh=wPIUPLpFKWSmMu1QEu+vJJQNc+kUEEHQOoRK1NZ2vDM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kmZG5J1qK2IASLSC9mmUOZ03asyugO1XYS9QXbUYj7hzWDAftRxSWzgXb7rspMogX
	 OR6YFX3iiB03FFpMQC8UVHqnM//31MFpHx84cI/CA7CJ8ErLGhKOO9Pk8zrdc8b2G/
	 nQmnM6xGxK+xMk4f/nQjvDSf2xnn4uCO2T7GIqczwWcvNgwJw9THh9Dtq4iwx+6WOC
	 W23dtailrymU0UkjCsep8wnmn4eEOP+Z67BzabSfviRn23bOCztChy6Ar0cEkZoz2E
	 WUqYhs+tt5K40GuNrOHyTEO97gyeNEsP0K0Xqs2JdzguSFZNOgx3+DAGmbPPi7broO
	 VN6uJ87kqIM5Q==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 15:14:46 +0100
Subject: [PATCH v15 6/6] KVM: selftests: arm64: Add GCS registers to
 get-reg-list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-gcs-v15-6-5e334da18b84@kernel.org>
References: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
In-Reply-To: <20250820-arm64-gcs-v15-0-5e334da18b84@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wPIUPLpFKWSmMu1QEu+vJJQNc+kUEEHQOoRK1NZ2vDM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBopdhyDAaZhoeX2SX98ztHnen6rpOaISQ1qMMre
 6NxPNHBo6eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKXYcgAKCRAk1otyXVSH
 0AftB/46SR8tYmd+0v3pKWE2DpZHe/5YMDZVHA8BTogrK9IHwuJVIkSjUEBRHmqPttGu8KIbZo4
 lrHgSwjBt1UK8VOvAgX/9esEE8/B59viGamL3g6J9vVJo9s2HLRyQuai7Ybo6ZOjlkAKht+yaAb
 G1jn8n2CizjWCoc4yHry7YebxDZzUapJtaFhCNVmQtOhL9Nb121y0pCNIabpVANuzhOd0MPWSJy
 OyRxiiPSMcuu16IlXl2sNUwtRAVoR5w6nTGwFgevJe3NlnI73YZ2oAVmakF6w1dDKbw9HSbFPzN
 UTi2C7fk83+lN+i//BCOUl+tbey0qi4f7gAgJAD/Sa1oG3dj
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

GCS adds new registers GCSCR_EL1, GCSCRE0_EL1, GCSPR_EL1 and GCSPR_EL0. Add
these to those validated by get-reg-list.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/get-reg-list.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/get-reg-list.c b/tools/testing/selftests/kvm/arm64/get-reg-list.c
index 011fad95dd02..9bf33064377b 100644
--- a/tools/testing/selftests/kvm/arm64/get-reg-list.c
+++ b/tools/testing/selftests/kvm/arm64/get-reg-list.c
@@ -42,6 +42,12 @@ struct feature_id_reg {
 static struct feature_id_reg feat_id_regs[] = {
 	REG_FEAT(TCR2_EL1,	ID_AA64MMFR3_EL1, TCRX, IMP),
 	REG_FEAT(TCR2_EL2,	ID_AA64MMFR3_EL1, TCRX, IMP),
+	REG_FEAT(GCSPR_EL0,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSPR_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSPR_EL2,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSCRE0_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSCR_EL1,	ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FEAT(GCSCR_EL2,	ID_AA64PFR1_EL1, GCS, IMP),
 	REG_FEAT(PIRE0_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
 	REG_FEAT(PIRE0_EL2,	ID_AA64MMFR3_EL1, S1PIE, IMP),
 	REG_FEAT(PIR_EL1,	ID_AA64MMFR3_EL1, S1PIE, IMP),
@@ -486,6 +492,9 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 2, 0, 1),	/* TTBR1_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 2),	/* TCR_EL1 */
 	ARM64_SYS_REG(3, 0, 2, 0, 3),	/* TCR2_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 0),	/* GCSCR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 1),	/* GCSPR_EL1 */
+	ARM64_SYS_REG(3, 0, 2, 5, 2),	/* GCSCRE0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 0),	/* AFSR0_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 1, 1),	/* AFSR1_EL1 */
 	ARM64_SYS_REG(3, 0, 5, 2, 0),	/* ESR_EL1 */
@@ -502,6 +511,7 @@ static __u64 base_regs[] = {
 	ARM64_SYS_REG(3, 0, 13, 0, 4),	/* TPIDR_EL1 */
 	ARM64_SYS_REG(3, 0, 14, 1, 0),	/* CNTKCTL_EL1 */
 	ARM64_SYS_REG(3, 2, 0, 0, 0),	/* CSSELR_EL1 */
+	ARM64_SYS_REG(3, 3, 2, 5, 1),	/* GCSPR_EL0 */
 	ARM64_SYS_REG(3, 3, 10, 2, 4),	/* POR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 2),	/* TPIDR_EL0 */
 	ARM64_SYS_REG(3, 3, 13, 0, 3),	/* TPIDRRO_EL0 */
@@ -740,6 +750,8 @@ static __u64 el2_regs[] = {
 	SYS_REG(PIRE0_EL2),
 	SYS_REG(PIR_EL2),
 	SYS_REG(POR_EL2),
+	SYS_REG(GCSPR_EL2),
+	SYS_REG(GCSCR_EL2),
 	SYS_REG(AMAIR_EL2),
 	SYS_REG(VBAR_EL2),
 	SYS_REG(CONTEXTIDR_EL2),

-- 
2.39.5


