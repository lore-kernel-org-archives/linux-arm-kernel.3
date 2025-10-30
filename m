Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CDFCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 15:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBl3v8jq/T+RnO1izry6TbzUenL89g1K3cEfYUOrk2E=; b=usiqFo6p/2/dpcehi8d55U/Lyv
	tn48paI48pficMIVp7+ltkF8ZVGZUiT4M1pHMmX0hjiBDucmyHsZMRGzlxypW9VbnglAi1liKUc/v
	84lqtkCzScEh9+FNhiM+X8cDMe1WPHFQ7ZpmiRrIVkgvQXLkdm4TKCog50KB2bNOSKjdC50hWLA/l
	bumzblgPq3HdSMq1XJMqu+tcGMFGz+ugUl5SA804yO7cRa0pZbBjiswLxnIp1sdJSpigaAJ2uVIyX
	3+dk301XL/MA998QQdPI6yKZFS8Qal42sp4+geyXwf+8iIaVpCg0OpLXHpCqnnjmxUMJ1k0ZOFL5a
	7+NMsUxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUsB-00000004PPH-1BJZ;
	Thu, 30 Oct 2025 15:47:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEUs4-00000004PNR-2nq5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 15:47:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A5A748221;
	Thu, 30 Oct 2025 15:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE71AC4CEFF;
	Thu, 30 Oct 2025 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761839248;
	bh=NZCHWtWgDq5zz30CCAR3ifMlNJpsHOdaSLoln4mIKFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FFvIALRbAweVCw2UoxmIuKV8ciopyH/0U0RPhAY6EFh+wONWJWJG+paNTnnWtK+mv
	 itTIuVHb/sK7nVeUQSiWAvSIY5l6QIerAxUvsxSTCg0cwOmfr6OSS09tVxn+2mrigC
	 t/fAmJOfIDPfpU2LjAkqUMsFOuzAHdLDrQL+oJ5iLvDDKiV6f567WMFtBsFMYNFBZ/
	 DbyH0ZH6+STkyfdfsUgObz6blaPGNiH1IZB407FTa6NL+dIopu/Zb1YP52nth2F+NM
	 IdG8qsWfP11gL4NEFgJnHpvoO1JqFe/3Fox3ES+rvzQ2PBsHP14yU1ZY7+z3uTjN+V
	 w74/54Prjl4vg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 30 Oct 2025 15:42:48 +0000
Subject: [PATCH 2/3] KVM: selftests: arm64: Report register reset tests
 individually
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-kvm-arm64-set-id-regs-aarch64-v1-2-96fe0d2b178e@kernel.org>
References: <20251030-kvm-arm64-set-id-regs-aarch64-v1-0-96fe0d2b178e@kernel.org>
In-Reply-To: <20251030-kvm-arm64-set-id-regs-aarch64-v1-0-96fe0d2b178e@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-88d78
X-Developer-Signature: v=1; a=openpgp-sha256; l=2202; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NZCHWtWgDq5zz30CCAR3ifMlNJpsHOdaSLoln4mIKFs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpA4iGyvPLC38rdS2RIy+FJ+eOECrgfTa4QqA8i
 pePN12GnbCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaQOIhgAKCRAk1otyXVSH
 0EMVB/9sVxjcnfn5VzQgHVPjt2KP3qIKdpSoNTV6oWRIyMcs56td9lA4MRkrfXW8dkGbbZMd8gH
 Xz9rdLGvnb2/gHZnT1+z2HA5WEt06Od6luR+XPAEFMZ64ibXEHdXx8OhdemAspmT+Tk9eyy7ijc
 Gx+efN/IGXq1EeuEmVo75d8c6pk+IZ/Kpi6qHKBfNJcYdE0pAgjBtZumqiEnC5dVFWitMzzp8bY
 pcmTw4W5Z8Tvzs+raAD1H/FSktJihHS5kn/6u7QDaDQOG3g+C71dRh5kgz9JvcD92hEZq2KWcqM
 eh5JqP5bcc42u5QeIo7ZKML3+inb4wQrpaFrGQ5ZBZwRxYGI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_084728_762610_933E904B 
X-CRM114-Status: GOOD (  11.65  )
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

set_id_regs tests that registers have their values preserved over reset.
Currently it reports all registers in a single test with an instantly fatal
assert which isn't great for diagnostics, it's hard to tell which register
failed or if it's just one register. Change this to report each register as
a separate test so that it's clear from the program output which registers
have problems.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index 7a759e976c2c..1a53f3a4be8d 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -775,11 +775,18 @@ static void test_assert_id_reg_unchanged(struct kvm_vcpu *vcpu, uint32_t encodin
 {
 	size_t idx = encoding_to_range_idx(encoding);
 	uint64_t observed;
+	bool pass;
 
 	observed = vcpu_get_reg(vcpu, KVM_ARM64_SYS_REG(encoding));
-	TEST_ASSERT_EQ(test_reg_vals[idx], observed);
+	pass = test_reg_vals[idx] == observed;
+	if (!pass)
+		ksft_print_msg("%lx != %lx\n", test_reg_vals[idx], observed);
+	ksft_test_result(pass, "%s unchanged by reset\n",
+			 get_reg_name(encoding));
 }
 
+#define ID_REG_RESET_UNCHANGED_TEST (ARRAY_SIZE(test_regs) + 6)
+
 static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 {
 	/*
@@ -797,8 +804,6 @@ static void test_reset_preserves_id_regs(struct kvm_vcpu *vcpu)
 	test_assert_id_reg_unchanged(vcpu, SYS_MIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_REVIDR_EL1);
 	test_assert_id_reg_unchanged(vcpu, SYS_AIDR_EL1);
-
-	ksft_test_result_pass("%s\n", __func__);
 }
 
 int main(void)
@@ -826,7 +831,8 @@ int main(void)
 
 	ksft_print_header();
 
-	test_cnt = 3 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST;
+	test_cnt = 2 + MPAM_IDREG_TEST + MTE_IDREG_TEST + GUEST_READ_TEST +
+		ID_REG_RESET_UNCHANGED_TEST;
 	for (i = 0; i < ARRAY_SIZE(test_regs); i++)
 		for (j = 0; test_regs[i].ftr_bits[j].type != FTR_END; j++)
 			test_cnt++;

-- 
2.47.2


