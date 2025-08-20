Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B386CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 23:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9X6FraLzTDzRRP19DPHCowleIhVq+wRwX5ABt/V49E=; b=3lCNGLiZzBQUBMHFXtQlHydy4o
	ZXqx5ZsvfQU27sjOGAIJeAeNTYIEYgFFgGQ9cCdCD47krlTTeL9XfZIaTiiHgaAQk8N7ZNRzgBAgj
	fNGU1bGKZsNbwUMqgtb6M3Pk7DB+RFh8RNgZdyqlfuPiuzkc7pTfAylDbqCPLjV/gfXB5BbovX1cC
	+o7DsDH6HPEkLM4mNWGdgVJVHOOxlh/pEkL+FK9W0CslRwLfpJlSb42NhRA74r4pz118zpcHyw/Ia
	/fxF7mnicCsj+Fr9K4W36RUALZoCSDf5rIRKTDqUPDz1RMuPe/YsmndzAXpJXfLI5g/PWYKo6sgnr
	7Q4JuA5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uormg-0000000F8pr-0fj9;
	Wed, 20 Aug 2025 22:59:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonZ9-0000000EgX9-2wTW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E03ACA56E4B;
	Wed, 20 Aug 2025 18:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4BAC113D0;
	Wed, 20 Aug 2025 18:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755714582;
	bh=GwelV5LaIEzscbAlxJJsBp+tkWj6WmmOlhFzMPKmCGg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JaNraaPsML5Qc1tIxPjIpxw6r84mMnvT0ZzLb0ODANQe1pV+3xQ5+OX6hjtRvDBqg
	 8KxM206jloGSlTFdW/rsswOiJNDGlXYEQgpSsRaEn+gAuu9dptq5rPUJEkW8tRQRtl
	 pVlCASshs5zrD2h3+cu3Us/Y3+sUCMhiLJF7V8gQDRQCSjP51zBanQ6NTyffzcEiZz
	 dJB9Rl4jWWlelr6v7zukv3xpVcnW3isJgACzzVQHuZRvbPo3LSz1A+WyUrHkMVGACl
	 G5btUQF7m8wQzvfuziQAxeoJ8LBNGbK+gczvVoRciUtBySij+dnWhRkfKnp56fo7uZ
	 9eF5E511Bl9Jw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 20 Aug 2025 19:29:07 +0100
Subject: [PATCH 5/5] kselftest/arm64: Cover disabling streaming mode
 without SVE in fp-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-arm64-sme-ptrace-sme-only-v1-5-f7c22b2871f8@kernel.org>
References: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
In-Reply-To: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Oleg Nesterov <oleg@redhat.com>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 David Spickett <david.spickett@arm.com>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Luis Machado <luis.machado.foss@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GwelV5LaIEzscbAlxJJsBp+tkWj6WmmOlhFzMPKmCGg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBophQEmL7YR3MYjzO1vG3QUOVkCppXRHzu9l8if
 U0cm+pxwKeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKYUBAAKCRAk1otyXVSH
 0F0NB/94TAcfPdpxW7X2dovVYEJ/U4M+3O9CS2qasqzlNqOkJsMii/if3DdQmbDhBlMfOlEMa34
 F589eg9i23JU/mE+uvGkdY2Rmluye7U2EJStnb9Wj4KLCaNIjCZJjgg/YU0yCqAy4lxkH5O4X+X
 taFmvGpqZILHY8sTKiZWUkXyh0SxPgUdOs/Yul+CXbSejNoVVD+aD27dxrOREAedGiEwOB3CA+m
 0kSxJT8Ea1zNDiY2GfFmYjWkzLOkdPivi47EHBEq/fOSswzaTZcTV4M/TVW66i85SJ+9DiIEtkB
 fwuwtL54MhiiNJ92LsmOP/cjTgsok/SQMAxCyskWdK2wzX44
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_112943_869441_A5ECB7D2 
X-CRM114-Status: GOOD (  12.18  )
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

On a system which support SME but not SVE we can now disable streaming mode
via ptrace by writing FPSIMD formatted data through NT_ARM_SVE with a VL of
0. Extend fp-ptrace to cover rather than skip these cases, relax the check
for SVE writes of FPSIMD format data to not skip if SME is supported and
accept 0 as the VL when performing the ptrace write.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index cdd7a45c045d..3bb4bbff120f 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -1071,7 +1071,7 @@ static bool sve_write_supported(struct test_config *config)
 
 static bool sve_write_fpsimd_supported(struct test_config *config)
 {
-	if (!sve_supported())
+	if (!sve_supported() && !sme_supported())
 		return false;
 
 	if ((config->svcr_in & SVCR_ZA) != (config->svcr_expected & SVCR_ZA))
@@ -1231,9 +1231,6 @@ static void sve_write_fpsimd(pid_t child, struct test_config *config)
 	vl = vl_expected(config);
 	vq = __sve_vq_from_vl(vl);
 
-	if (!vl)
-		return;
-
 	iov.iov_len = SVE_PT_SIZE(vq, SVE_PT_REGS_FPSIMD);
 	iov.iov_base = malloc(iov.iov_len);
 	if (!iov.iov_base) {

-- 
2.39.5


