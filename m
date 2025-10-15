Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE532CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jbqMKZ1UqmRu9AOkndVBKY+83bjZGIhAPtyAxESApoI=; b=p4eq8B15w6+H3RkTVfhXAm+7d7
	gzADv7OsOuU++WAchdfBiD7AnNGOCH0UoVTVs8fppUv0EH3WPaqjtevuiRKP9I8WKxgcTXqPAWZS2
	TXwWnFbCsYBV1HpILdIZ3uiIOxxCQS6dcRB1qH0U0EjsAaIPz5+b0zA/BFwjNv2Dtck3n/7h6xd15
	4jbMye2MoEBZFmg+4rPBWsLo0b1/OYU+b/e3FR3QnVEoUA2t1Bst5IOH8tkt95yqKf9utV59T41iK
	hzn8yQxUlP2+TDOzTMSOo4EoSoC1hjtbejwrmvruyxFy7bYXIkLtY3Kblyo/la0wRiXBMQUrxtsta
	MBkCWxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96KN-00000002cgG-0fbh;
	Wed, 15 Oct 2025 18:34:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96KM-00000002cfl-2oJR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Oct 2025 18:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jbqMKZ1UqmRu9AOkndVBKY+83bjZGIhAPtyAxESApoI=; b=anE/m6oL9A/RHYU/lK5wo8PeX2
	H1Bmwpk5eOnuJ9TPVmMTfc04NEaXsCICm6guKS7rAursdYAO9x0uI2g8aCLmMjvurck2TI3eoe6Rw
	kN9Y5pOw5/Rx0wDHNM6H6nSLTiHF1JD3PXNSHDba7zudvS0nDyndf3I3aTWdtAci1JCLBxaOfAEdF
	ATFLOwrksnqd3zw/r2LTMkq4AF0F9WeH0Olq0nmBAIwRRqe7YFPfQx//QUrHmKbR4dN5wMZ3KfibU
	81wBkwDlRw97pXxyKZGOosAeqZIwew06ueH8mHKdVLrZ0ZAvitnKgXEz76lN7AACvwtvQs8xOBVnm
	U+VHS5wg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96KE-000000068I1-3ruZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09FEE447F9;
	Wed, 15 Oct 2025 18:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C68C4CEF8;
	Wed, 15 Oct 2025 18:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760553249;
	bh=UYiRQSvgs+jqwo1HIyxcSuFqSwz8wIVukPHpImMwyIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JOEDk1TKOjy+sC4x4jD08sMX/9cOzdUAu2Drq6EqtlqtkOXstKVfDB3o1we/whMWc
	 NYuCMn5I5HwyzfBwDCkpx+eAR7TCllmtTVbSGyeBTvghTNqiIb35VmH/iFlaOkHxnw
	 /o14sS8HvwFWWx6aE1cB/SqXmMJAjhPotn2E3o9Qd8iCctD9xNtcMnw25OqLesbHdf
	 bFE+KISodttgwOsCT4rEK0o38x06cmfw7n0NfaqvQCUo2UOYqm2lWjAL9jVWLPkZMf
	 8Ha1ZwQ7XsYExqR+70kRUYkoGFBx+9A79cE9ZZ8aRJy5qZeENg+MGhD+l3iAgZlogf
	 RIA24f459PU9A==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 15 Oct 2025 18:56:38 +0100
Subject: [PATCH v2 3/3] kselftest/arm64: Cover disabling streaming mode
 without SVE in fp-ptrace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm64-sme-ptrace-sme-only-v2-3-33c7b2f27cbf@kernel.org>
References: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
In-Reply-To: <20251015-arm64-sme-ptrace-sme-only-v2-0-33c7b2f27cbf@kernel.org>
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
X-Mailer: b4 0.15-dev-2a268
X-Developer-Signature: v=1; a=openpgp-sha256; l=1409; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UYiRQSvgs+jqwo1HIyxcSuFqSwz8wIVukPHpImMwyIA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBo7+kUW7mFnAgXj0oaG5JSKhdvIsEUwyyPyt8j1
 wi+2EsZtxCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaO/pFAAKCRAk1otyXVSH
 0DQbB/976gT7Mug2JIPAZ1WwQXFgHP1WlsQ7C2JzCVbO6aQakwbYHMPhSyqLJm9LVSIr3iTdhu9
 O/xfa/bTdYTIXC3Cadu/kSL4Gd/eM5q9Sf5qyxIIv9T9ox4hq/XunynZMyX+8JbvopLCor1qaQX
 yCWVTuIzBf8esBtIy8tObX/pKuU9T1YxJy8LMtGmA1QSDtF5OzrWIcb6TLzwu4XJxS3L96bTYo3
 Gsj5FhAnm5gA12AH2E3ekO5mpyBgquSV3/XTHKiXiV9ewXGtEsvqCKoTTegojjICtY0JGkZVybZ
 DtksaYcL99KTtZ9Ht+3IElE4WC2qeczhQ9cX+pwXIIbAmv4Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_193417_427825_6F9F2C5E 
X-CRM114-Status: GOOD (  12.43  )
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
index a85c19e9524e..0114108ab25f 100644
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
2.47.2


