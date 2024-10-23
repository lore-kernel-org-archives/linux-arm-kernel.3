Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E6BCFA472
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KU4FPru2ydTSPv8IP91kbGwnel2cLg7nTaLFgrHS0os=; b=izakq3aU8kbNtdT0P4ubSFaI86
	yZnW0bNd8/I67wPxi7rFdQIEVS5ioW2OjtgCCr3i3Y4nKRZXaN7Bu+E7+a/f34d0ePfiJOVeCdaKQ
	fVz1EOZ2tvaNOEkHV40VC1UFo98xmVjm6xiEzQUEOMNDZWEZ+r4lFnKp2yPRJI8UB98QTbrYnz30W
	z548lWlxcnLmkTJSv8VDUYo74kw/EQYnKvs3pxi9n7yQ0cPw8tPMeeZfE10TomMQqGv60v1M8DCro
	IItn4nIkdb0A8iNnPHWX/WmChB1yxH8Ldh+0VAlvoFT1VqDGBVm2np9qJIKKic5TWpT3iHB0A9gTS
	i6ChuK/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iC0-0000000FsMd-3TWK;
	Wed, 23 Oct 2024 20:42:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i8t-0000000FrUd-3Z9L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:39:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80C715C5ECE;
	Wed, 23 Oct 2024 20:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451BEC4CECD;
	Wed, 23 Oct 2024 20:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729715982;
	bh=/bHrhesLCeIwKS6Tm5OOpULv9OOeXujD+y0vb5AVloM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HEBz9J2SYayNbbRkBwd2iwxoESLTRpgf1SxBFOntvWwBVNUv28S3mZIaSuhRmvayR
	 jQ2lwTFB5OV24DDouzZMEsU9VYK8Mpf+ft/Vcva8GApuEThPqQwXFmrF8APwzG3czW
	 2Chi4MNYNRA3IpODaKSuCt8oW3b4sxHbCVA7M3MdxuwYIozafqU2TxQpRe5NLo2otu
	 xmqM9O2HWAj7ptDz3y6DAPQV+ts2l/oD/fx5RJ37NdPFDBBNMNhgIu9OBumBnYq0P+
	 rH3RqA/nOa4AR0HraXZ5lqUo7qilZEhp8SaHhoa4NmvdEIW6zIky2/CEkuN44alSQR
	 mS33JnbX5cPdQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Oct 2024 21:38:29 +0100
Subject: [PATCH 1/6] kselftest/arm64: Correct misleading comments on
 fp-stress irritators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-arm64-fp-stress-irritator-v1-1-a51af298d449@kernel.org>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/bHrhesLCeIwKS6Tm5OOpULv9OOeXujD+y0vb5AVloM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnGV8Gc55M2w82ehj/LpjjHUBt4adVvVgcz0prD+dS
 XvsOxI2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZxlfBgAKCRAk1otyXVSH0CA5B/
 0c7+WD7+iS6lYyf0bnJuH8r+L60B8ehcqJrpsjYxePuktHethpL14YIdnlm0MeLaomjRQqDl26a7h0
 7QEyHO8j9AwYw6KYE0gIZfQLbawPVnu5cl4Hwo9nODuwfvRo8286EF8lBzbpPPvFRaHO1VYuYhCNeA
 lNfN16OdFKjhP6YpxNxYKuJHChn2L4BZeqy7kMcBiqISG6+MbUlD6YgzxsvpbwRzxKAHodXlNfaMHp
 sJpVOv3LW4gibvdMHqDEEghYc5SkuWcvfjRWYhsObwwrNev33WFLOeIKNlzU3bSLZmbLXYGb2Bgtsr
 3lUfYaJb55y0v/wJGedDx53K8xYUam
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_133944_017143_893B748B 
X-CRM114-Status: GOOD (  12.33  )
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

The comments in the handlers for the irritator signal in the test threads
for fp-stress suggest that the irritator will corrupt the register state
observed by the main thread but this is not the case, instead the FPSIMD
and SVE irritators (which are the only ones that are implemented) modify
the current register state which is expected to be overwritten on return
from the handler by the saved register state. Update the comment to reflect
what the handler is actually doing.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fpsimd-test.S | 3 +--
 tools/testing/selftests/arm64/fp/sve-test.S    | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fpsimd-test.S b/tools/testing/selftests/arm64/fp/fpsimd-test.S
index 8b960d01ed2e0ef516893b68794078ddf8c01e1f..bdfb7cf2e4ec175fda62c1c2f38c6ebb1a1c48bf 100644
--- a/tools/testing/selftests/arm64/fp/fpsimd-test.S
+++ b/tools/testing/selftests/arm64/fp/fpsimd-test.S
@@ -134,8 +134,7 @@ function check_vreg
 	b	memcmp
 endfunction
 
-// Any SVE register modified here can cause corruption in the main
-// thread -- but *only* the registers modified here.
+// Modify live register state, the signal return will undo our changes
 function irritator_handler
 	// Increment the irritation signal count (x23):
 	ldr	x0, [x2, #ucontext_regs + 8 * 23]
diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index fff60e2a25addfd4850ef71aa3cf6535ac880ffd..e3c0d585684df29723a49265f3df6d23817498c7 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -291,8 +291,7 @@ function check_ffr
 #endif
 endfunction
 
-// Any SVE register modified here can cause corruption in the main
-// thread -- but *only* the registers modified here.
+// Modify live register state, the signal return will undo our changes
 function irritator_handler
 	// Increment the irritation signal count (x23):
 	ldr	x0, [x2, #ucontext_regs + 8 * 23]

-- 
2.39.2


