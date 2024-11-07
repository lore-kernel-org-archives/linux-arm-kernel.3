Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AB0D29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vVUvyFHwngXeMXOSKmwCbEQ/z9rYXT2x8MXOeUDBn4=; b=oSLUNMviKJ/YNh9DvzCdNaoXqN
	CVxzNu2sxEdnW4KFJN+qFlsrWLuLnIgFnvx48pzHiChii8ucz1ka+b9vv5ITv/GTu1dpwh1CNQpez
	Z/L5IA4aYTcTmKwwjhPT/dhXWXahDJ2XJT5FfEDCOFkaEu0uDLcJZK0oJ8C0eDg1GPAwo0Jb0ng5U
	r7x/db4vimk7IXYmPdKZo1SCr1PAffEPaKGq4l588+jCK1FzPDx7M1NvENrTRaZemu9V473zVhWZz
	HskFiHRHHEIJEecc3MJZR40UqTuBvvXTrrRfX4MylDChsRDWtYZuNQ9aVRnyCtn5esnuSi6JKh8M4
	QO5ZY8xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rn5-00000005Mln-2gei;
	Thu, 07 Nov 2024 01:58:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rYx-00000005KDW-10Jo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E348A5C54CA;
	Thu,  7 Nov 2024 01:43:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2980C4CEC6;
	Thu,  7 Nov 2024 01:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943834;
	bh=pztdj+ZQ+nZ7pOduVmqycF1CMI4X4Tvlwsap3wvNFRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Oc+QEMKHU7cbG/RYFDdqKaWXES/WEKu10yV5Iul6hLPPPTLWiRslUB2L06v3iq7zr
	 HoVNs9Y8/UOuZPRSUaiT2/xD47sfdKaR/z1M9VMCLK8fCx+ILNlmguP+EGRxQyz9ak
	 0UN5NYv2qPruR9YSVUSHMKJ2wW26eMMnocEGe9M6Lw2alYRRMdGMHMeirfEh07vdS8
	 5ON1GmoXGhVxvvvPMwHfkc9xtoQfyoDfQE2WMY8vok59QuulrrR1DkQGLZUHmSIoic
	 14hhGFXKT914pLGwPGNmj9d5dRq/YUdshqPZK8uGcdWCQ3nnBX+8Xb7nwERJgTw4NS
	 /QNo02PWQrOEg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 Nov 2024 01:39:21 +0000
Subject: [PATCH v2 2/6] kselftest/arm64: Remove unused ADRs from irritator
 handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-arm64-fp-stress-irritator-v2-2-c4b9622e36ee@kernel.org>
References: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
In-Reply-To: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2653; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pztdj+ZQ+nZ7pOduVmqycF1CMI4X4Tvlwsap3wvNFRg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnLBtQXEOcLYz6Ymz/L4TdCASUU/sNqoWsRJpykR6Z
 kTRk5l+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZywbUAAKCRAk1otyXVSH0PYwB/
 4l4i+l+21+Q7gIu9w2FF+H8asSmEscEiVklMw1AHhwNlzuWQ8cF1nEfeIf5vYFpbEakZsgDeEZWQeR
 AxAiY+xOXYg1HFw113F3OHX46sgc5qf+Lnmbi1oO7kUy76Bu7F/WwDvF/gGX72ItO9BTQkj1n95vCt
 12T/S2MKUiqaEOF/rXX07ehlOs9+cj/dBqXyvrv2Z1xRauxMpIwANsDYhJUtYEApfosvOdprj0Ayxr
 dqx5ouw13YOwbhMyCN1Y+RGsZlbeAfPA46AWnGjg0zvF322CJttDB3PGXeB53GBVYvggpdLeTPxHVL
 PDWXh9J01KcLIG+nP9N4WoD4HaJlWT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174355_532544_0C68D373 
X-CRM114-Status: UNSURE (   8.29  )
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

The irritator handlers for the fp-stress test programs all use ADR to load
an address into x0 which is then not referenced. Remove these ADRs as they
just cause confusion.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fpsimd-test.S | 1 -
 tools/testing/selftests/arm64/fp/sve-test.S    | 1 -
 tools/testing/selftests/arm64/fp/za-test.S     | 1 -
 tools/testing/selftests/arm64/fp/zt-test.S     | 1 -
 4 files changed, 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index bdfb7cf2e4ec175fda62c1c2f38c6ebb1a1c48bf..9977ffdd758a51a7af67cd607d019a6c54d3a6c6 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -142,7 +142,6 @@ function irritator_handler
 	str	x0, [x2, #ucontext_regs + 8 * 23]
 
 	// Corrupt some random V-regs
-	adr	x0, .text + (irritator_handler - .text) / 16 * 16
 	movi	v0.8b, #7
 	movi	v9.16b, #9
 	movi	v31.8b, #31
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index e3c0d585684df29723a49265f3df6d23817498c7..f1fb9745c681786f686f1fafcb7e1154f3c8e1a3 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -299,7 +299,6 @@ function irritator_handler
 	str	x0, [x2, #ucontext_regs + 8 * 23]
 
 	// Corrupt some random Z-regs
-	adr	x0, .text + (irritator_handler - .text) / 16 * 16
 	movi	v0.8b, #1
 	movi	v9.16b, #2
 	movi	v31.8b, #3
diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 095b45531640966e685408057c08ada67e68998b..1ee0ec36766d2bef92aff50a002813e76e22963c 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -158,7 +158,6 @@ function irritator_handler
 
 	// Corrupt some random ZA data
 #if 0
-	adr	x0, .text + (irritator_handler - .text) / 16 * 16
 	movi	v0.8b, #1
 	movi	v9.16b, #2
 	movi	v31.8b, #3
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index b5c81e81a37946c1bffe810568855939e9ceb08e..ade9c98abcdafc2755ef4796670566d99e919e5c 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -127,7 +127,6 @@ function irritator_handler
 
 	// Corrupt some random ZT data
 #if 0
-	adr	x0, .text + (irritator_handler - .text) / 16 * 16
 	movi	v0.8b, #1
 	movi	v9.16b, #2
 	movi	v31.8b, #3

-- 
2.39.2


