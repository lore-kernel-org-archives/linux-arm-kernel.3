Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C337D29FBC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 01:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ7B7W97ZbQz4BUZdGp7fg4qj3BBLPP4ihosl5lMMic=; b=EcIxdOXgyq3g7rJylayP/MRefP
	0fFhXDlpMIFYWIiyOXhTs2ICGmEWCJBfhLeHBph7IAUo6FCosEchIl4TW9F2HKtPIkvvMy2351IRo
	EqNLbTKV6tZnJK7OjouEk7X8vfrKnIAJGREFxk76+f3PVhBdTotT71utfhXSs7qAJ0+i6oc8uUVnI
	suAtsRkjgMji7I2wzaNSNEhnyWZi7gBAyJTS5fU3S85aOD8PcGD+U9Cx0DC0CbBqQoqHUw5YZ8iB+
	3jaDI8CmNYybolyJ8h2z3NVWcVJTZVlMy55hdlChaHmIQIpn71PrxxaDFy0WyTvHZTBvFVQT/ufKn
	O0AMIV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rlP-00000005MZD-2aZx;
	Thu, 07 Nov 2024 01:56:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rYv-00000005KBW-0sLD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC8F05C54A8;
	Thu,  7 Nov 2024 01:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8410C4CED6;
	Thu,  7 Nov 2024 01:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943832;
	bh=0bSqJfCBOTI4Jmz4xl8iWhEjG/ZUwMwS5LAsSpOElfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hUkKATgwOUiynyRaCLwhg28ZBXndF/nkmS5+NsBGFJ77E7tKRWc/xWWmBq9AWEU20
	 eg2Hp3nUIYojB8nOZ8XR4cc2XfMip+g6ql6M7kqgmNUcqFN+5fyI3qkR2GL9BeZL9h
	 lh5kXV3HvpngOLIxX8qHzWzCRT7Mtk8un0l5AbzHkvdzN4JxyFQP2CpvWDJMtXjU8i
	 Qx32HnMp3RRo1gRJHT2yEy4/KSqHRSFSYgr+YqFT+xyGbI3TlAzQPguEw1XcXiq4Kt
	 xsCzOIC7X1QZ+N9hhv926A1Q87jHK+ye6aJHB/tDVPJp9TZtBtCzuPcSxLmPmvh8g6
	 FD3EtRnT8uUAg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 Nov 2024 01:39:20 +0000
Subject: [PATCH v2 1/6] kselftest/arm64: Correct misleading comments on
 fp-stress irritators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-arm64-fp-stress-irritator-v2-1-c4b9622e36ee@kernel.org>
References: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
In-Reply-To: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2159; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0bSqJfCBOTI4Jmz4xl8iWhEjG/ZUwMwS5LAsSpOElfs=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhnQdaf+pybN0Nz+Uf9z3XOk/V30ft+Kz1H8Tmw408aVGujZr
 OizuZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAmoqTB/j/zXSXPHp5Q9wuqnNlTJ/
 dy394V1xd7XDPEomniW1H/wPiQuLtZr5umd9tWtG73vXfvHdfeLa+jnz5Q5QtfM0+6Z4r7T73gxzGS
 du+vftWfu7jsqljFFaWZ69/VPCzc02Dpy2nnEv7UrfmK14N7ETPjZBuvTvqgExTcX7BrAqObn2ntzb
 /8wso5LZ65i3NXv3R5zKhkrC+16v1Xx1umR2eItCXvuz1rVx3HrLwGO6/921vbCoWOF19u23xCVtTw
 6yq/lmAD5bdzZ8unqJ/gSFfu3Xh4tsU35/46hZxQQ7uM5ZtOZEb+/XXNPiw5oP5PjQSjCFPothdGgT
 9VT/CcDzwfr31v3vN4bp8Yb+aPAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174353_789481_1A87B9F7 
X-CRM114-Status: GOOD (  12.20  )
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

Acked-by: Mark Rutland <mark.rutland@arm.com>
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


