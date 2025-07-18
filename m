Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8017CC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 22:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhkMgj17kN9u6XhA8o1myNPi4+Bbplb2WpMUlClg/Zg=; b=2T0kYvdjWkd9vaF3l7cPMJGRaU
	F5pe8YAcztwQWVpmxNLuvqDXB+yzi4v9IIitfeW/lhbwSzjDQ1W9V8EtPfCfLCgj/FETDGmni/qgP
	IL3/MHZGLpOf/Vu3q6zAC+MNCCvflRIPUb7EDNpQrS8xHbnbc/4gB0DjYu35+2c3KcUCGepg74aek
	nMr0AInK0Qmg+pfJmmxI5Z3XrpiTCpyk52cfLpWgnyNYgnm6a9mh/jfdJCEj5cfB3NhAA/c0h7G1B
	n+0kE/7EmyM5+P8oQA+/88h62Ic7CL6425dULD9YKLdnJqk3dlB1EJ4OmsZRv9v/B6MNywZ2v6HgG
	a5Arnx6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctV6-0000000DXex-2AeB;
	Fri, 18 Jul 2025 22:24:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uctO0-0000000DX5S-04rP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 22:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68A97601FE;
	Fri, 18 Jul 2025 22:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3548C4CEF4;
	Fri, 18 Jul 2025 22:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752877019;
	bh=sH6Ii1yok4Xx0txtePIyhU6/M/Q4z40Fm8HNPEuf03w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A3aY5+68E2faKqP/mfbNzVQ8oD7wGRuAB94ovQRusAFVFZTMPZnLHrSJJScEyHmPV
	 laHU///OLU9vJMoHUc1byS+FskzRH2CBjx/aPYX6xF7I+9ps1XxCtZzpbJX8yfGFTv
	 FBxg9kdJWOM3nHTJeoSB33o5GJzswj5gO9W5fi1gKKtXXBAI/yJQYL9NC+P12xDhrQ
	 ONOaSs39ETFmaWIxDdxeyAOihO0LeebPlvvJmih+Uhz6wghXVXKNKrzNcKIne7O1yC
	 EqnJ6vWNv1F2Rj6/WTK5lvbgv2E83qkLOzN+veonXr1X2P2cRJd0DObLOOThDq75GS
	 3ZAbFhV3K86hA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 18 Jul 2025 23:14:50 +0100
Subject: [PATCH 1/3] kselftest/arm64: Test SME on SME only systems in
 fp-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-arm64-fp-ptrace-sme-only-v1-1-3b96dd19a503@kernel.org>
References: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
In-Reply-To: <20250718-arm64-fp-ptrace-sme-only-v1-0-3b96dd19a503@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=967; i=broonie@kernel.org;
 h=from:subject:message-id; bh=sH6Ii1yok4Xx0txtePIyhU6/M/Q4z40Fm8HNPEuf03w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoesfV47we0+i69DcpVnKwyR0AbIPC7B+e1wPit
 /M1crAyL5yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaHrH1QAKCRAk1otyXVSH
 0GqrB/4srXY64OmGEkdaiWelmOGt+Frzf74cTcB+ycaQkWJ8yl0qXjNes29yADLKtIPaLMj9DMr
 RlMpD9uDVphtmHPLDFovqRucLcS2s5M1X+5e89FFrlyIeQaOZqvTKJLgMn9w9GeoJOM+C7kpOZo
 qdI1KG/T08L9rz9UWELYpR3m8grTFXwMdZRq8clSsb4Oj6NwDlOmU5LL1AZo7+guXXBjJWbSoKA
 fbtbXjKR2Wn7ldaolHTOzuO/QPvhq6ne2Bim4AWVo+TNUk1VNRdNzHrxzUgDlVlUdL2wGjPvC5q
 ojOu2+f/JqCo0w4ZbFRVKSFgO6nuHvs+1FYFiRqWRa6HL+8v
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

When checking that the vector extensions are supported fp-ptrace
currently only checks for SVE being supported which means that we get
into a confused half configured state for SME only systems. Check for
SME as well.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index 191c47ca0ed8..d953e9b0ebe5 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1607,7 +1607,7 @@ int main(void)
 	 * Run the test set if there is no SVE or SME, with those we
 	 * have to pick a VL for each run.
 	 */
-	if (!sve_supported()) {
+	if (!sve_supported() && !sme_supported()) {
 		test_config.sve_vl_in = 0;
 		test_config.sve_vl_expected = 0;
 		test_config.sme_vl_in = 0;

-- 
2.39.5


