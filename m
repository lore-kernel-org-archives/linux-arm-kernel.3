Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA3ACA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dja7mprWhK5ownaxRjalZcPpHt0Z020C9XYEeoHjdeY=; b=YpI4fg3qhPTAwa
	w67heLKq+hV/Fdalab4IcGXIuPKfX0hmbQY1H56eF+IoArVd0lGs17x+dOulDMD0YA6/VklB/owiv
	KVIPAYsYA4Uj9Nyh5kPDa0PgeD8m/Wub7afefyHhi3brDSJSaKCFvVLK2XpvDHIP1SEbBVaq4Wvw5
	xqdQo8y/6uuriFVxXkMKUd0GXvkRlUMetjI4W8SOECAXcmzx+zev9YHQFlqt0+5M2hZTfLUuqJPrH
	1E+/cK2Z7BltcOMFbYOFcKEGk1Y1f1LqRpMuThoAdZU365dG6gpF05BMqemlY3vsTZMZ8BPx0m/94
	wXclD125EfvhTl8oy2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorXI-0000000F7Jh-1IUJ;
	Wed, 20 Aug 2025 22:44:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonYu-0000000EgQP-46pi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 327105C6984;
	Wed, 20 Aug 2025 18:29:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4560EC113CF;
	Wed, 20 Aug 2025 18:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755714567;
	bh=0SzMeuxfOcNRRFI3htotgO4HznADUizoh4BxITQXZOk=;
	h=From:Subject:Date:To:Cc:From;
	b=HLcZNj6Xx1YnNkL7/pmzTjPZLtq7r0D4LDQY6xconSMbLOgivCj75OKolau7e4REA
	 bnUKL52WlM4nwx13xRELTbxCXC2L6t8m2vZnPuh8al/NsXRc0qJKI3FoecooLrR+Tl
	 3bn4dWdH7BxPD0EXItX7Q8rOPQIuWbcWQKdc+2q3V4d9xth5+BFV9BIX6Pb1JwWkqO
	 4bviGi+1eYSf8BQRI5DkWPc4Ay7vScetR8CwefUTokTRcjlSdW9XIb6XVw18nCFqps
	 D+CIRZFVdBMB0Zgql050NCJlSlq69VLxXfUFmm7wMrl2CIcrURIQ6ZNmXbwhZOKMZ8
	 gKMbNJ2xTy/oQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/5] arm64/sme: Support disabling streaming mode via ptrace
 on SME only systems
Date: Wed, 20 Aug 2025 19:29:02 +0100
Message-Id: <20250820-arm64-sme-ptrace-sme-only-v1-0-f7c22b2871f8@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO8TpmgC/02NwQ6CMBBEf6XZs2u2VbDhVwyHUhZtIhS3SDSEf
 7cBD97mTTLzFkgsgRNUagHhOaQQhwz6oMDf3XBjDG1mMGQKuugLOunLM6aecZzEed5iHB4f1F1
 jCyqJ2BHk/Sjchff2fa13Fn6+smLaS2hcYvSxD1Ol5vKY38Ub+FdXahNbsj9xN+Ku7Z2XiGS4Z
 bKn1hUa6nX9AsHKlt/QAAAA
X-Change-ID: 20250717-arm64-sme-ptrace-sme-only-1fb850600ea0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0SzMeuxfOcNRRFI3htotgO4HznADUizoh4BxITQXZOk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBophQAKGsvgPWYjakzBehyIWbniPGNVwMRy7IMp
 jdIOYBYrriJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKYUAAAKCRAk1otyXVSH
 0FfpB/4gF/goxVk8COhAg47IRT39tjP26tJuUhi0mMHRnEDvhOuV8V+5vaQPbO+Xjfw8uHwDEuw
 AytR+JXZJv9UotF4ySgcaTMJ9lAN3VkoESEmjNHN/PrPIY8Ft2h6FykhQQkTl6sTUmgZLkf5p2a
 lmU78YM6rXOhB6s+g6Hw7CgUHNbH+2hTJYnVw87P+QiH7vR+njPZ13RFp4bd2hmzuszifcUywQ4
 XPBtfXAUqiiQQtj5UtEhAwkFuKFHtg1e3SbHORXOIhavM2ymwS0hMMbpcloDqDAFtJF8pT8H1Nq
 AZ61yit7STjWoeFvVjYeSLdXFpvSSoVtFP880qhy7P5a3sdO
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_112929_106731_823405E5 
X-CRM114-Status: GOOD (  17.33  )
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

Currently it is not possible to disable streaming mode via ptrace on SME
only systems, the interface for doing this is to write via NT_ARM_SVE but
such writes will be rejected on a system without SVE support. Enable this
functionality by allowing userspace to write SVE_PT_REGS_FPSIMD format data
via NT_ARM_SVE with the vector length set to 0 on SME only systems. Such
writes currently error since we require that a vector length is specified
which should minimise the risk that existing software is relying on current
behaviour.

Reads are not supported since I am not aware of any use case for this and
there is some risk that an existing userspace application may be confused if
it reads NT_ARM_SVE on a system without SVE. Existing kernels will return
FPSIMD formatted register state from NT_ARM_SVE if full SVE state is not
stored, for example if the task has not used SVE. Returning a vector length
of 0 would create a risk that software could try to do things like allocate
space for register state with zero sizes, while returning a vector length of
128 bits would look like SVE is supported. It seems safer to just not make
the changes to add read support.

It remains possible for userspace to detect a SME only system via the ptrace
interface only since reads of NT_ARM_SSVE and NT_ARM_ZA will suceed while
reads of NT_ARM_SVE will fail. Read/write access to the FPSIMD registers in
non-streaming mode is available via REGSET_FPR.

The aim is is to make a minimally invasive change, no operation that would
previously have succeeded will be affected, and we use a previously defined
interface in new circumstances rather than define completely new ABI.

The series starts with some enhancements to sve-ptrace to cover some
further corners of existing behaviours in order to reduce the risk of
inadvertent changes, implements the proposed new ABI, then extends both
sve-ptrace and fp-ptrace to exercise it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (5):
      kselftest/arm64: Verify that we reject out of bounds VLs in sve-ptrace
      kselftest/arm64: Check that unsupported regsets fail in sve-ptrace
      arm64/sme: Support disabling streaming mode via ptrace on SME only systems
      kselftst/arm64: Test NT_ARM_SVE FPSIMD format writes on non-SVE systems
      kselftest/arm64: Cover disabling streaming mode without SVE in fp-ptrace

 Documentation/arch/arm64/sve.rst              |   5 +
 arch/arm64/kernel/ptrace.c                    |  40 ++++++--
 tools/testing/selftests/arm64/fp/fp-ptrace.c  |   5 +-
 tools/testing/selftests/arm64/fp/sve-ptrace.c | 139 +++++++++++++++++++++++++-
 4 files changed, 177 insertions(+), 12 deletions(-)
---
base-commit: 768361ab16ce943ef3577cea204dc81aa4a47517
change-id: 20250717-arm64-sme-ptrace-sme-only-1fb850600ea0
prerequisite-change-id: 20250808-arm64-fp-trace-macro-02ede083da51

Best regards,
--  
Mark Brown <broonie@kernel.org>


