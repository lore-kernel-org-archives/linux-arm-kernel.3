Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8B7D64064
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6yJX8Iwu0L2hfyZPqV+acAMRiO/bDd0HBbxnUnT33Xg=; b=27B4II4LUe5OdcYi44bFXTx+l0
	Ssijt650FE6Lix5cxUED7YmWg88iMOCn0W69KgrcKwg/URPm8eerwOTEImg2W9c+XjON9WsnqvP7t
	Usb2QQ4RumhCgOSX+e1Y0LS+9xSkNsbdxXghu1ixkNH/Dg9C4uZvhuvgt/W6YajFHMKaf66jd9Oys
	hsQG1lSISIfonKxIAI5CjWajmjd07kx8KXiwPpdRmWvnTt93+SROAu4tx0ocWs3kohR1HrsiijJxA
	vyt6IppUzmFE9QMppUOTLQRwZWRtaQVaEepMcs6KfeutUx3I6uDdd3gm04W2P0n8/Df1GsiBhqHJ7
	Okx/vVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtm-0000000BDGV-3ejV;
	Fri, 08 Nov 2024 16:31:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Qod-0000000B0fc-25a3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:22:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3EF7E5C5B7C;
	Fri,  8 Nov 2024 15:21:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B975C4CECF;
	Fri,  8 Nov 2024 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731079346;
	bh=9MmFQC6J2fkpekXm5iWYwsyMilxxoBeL/WcxpybUov4=;
	h=From:Date:Subject:To:Cc:From;
	b=triUdN6vkvHdywvVxNXLrYvEeFlYEHBRIZ/tKEH47DJNYeBPeeOjixkBD4d36qyzH
	 kEKvTDVmwdijOoMY13OV3xpSEABzm5vOfuHE42JrriSKBHBz1EOCcvyGas0p+68ZK7
	 XvJx6hdUCLqr8hgRW2d+YGJ+nuX1XaGhwAniedxqxXtIxcnSgHGTgUkwjVGoJnjzJe
	 dchB3JhCXprzY/bSRUXYa+gQtD6tiMXG57rkezV+DbDcHvfFox9Cu4XtPdWc2ESaIq
	 6RIbMGASdT5gvbThPufafY85hOC1KF5RonfUF/z0ZgnArT9VcphBn/iQA5kMFoRqxW
	 lkokMX5H42PCw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 08 Nov 2024 15:20:46 +0000
Subject: [PATCH] kselftest/arm64: Fix build with stricter assemblers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-arm64-selftest-asm-error-v1-1-7ce27b42a677@kernel.org>
X-B4-Tracking: v=1; b=H4sIAE0sLmcC/x3MywqDMBBG4VeRWTuQqKniq4iLWP+0A/XCjJSC+
 O6GLr/FOScZVGDUFycpvmKyrRm+LOj5jusLLHM2Va5qvHcdR10eDRs+6YAdHG1hqG7Kc9uF1iG
 4qZ4o57siye+/HsbrugE4X0FnagAAAA==
X-Change-ID: 20241108-arm64-selftest-asm-error-d78570e50b3b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9MmFQC6J2fkpekXm5iWYwsyMilxxoBeL/WcxpybUov4=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhnQ9nQ1lLpar7slFR1WUXHNSeZ+0XW3V+quWdxckBHjKJpQ2
 pxh2MhqzMDByMciKKbKsfZaxKj1cYuv8R/NfwQxiZQKZwsDFKQAT0f7J/lc4dOHBddzHebKc7P8cFf
 KUn6KyoL7GlL1L5f0tkSpx3Rf/rFTXcjn8T3T4MKnih4Bs12c3hSWnpPoLnGxcuiIXt+4KsfbRVp3y
 4Wy9bdrlCOV/azqkpjxnXpn+18/lP1+rvPusa3HqQd+f371aqROiHpOv3Gq10eh6rvqr7GMnFFxzSn
 fKua5X7j7AxRGZaHhqw2vtmcwX/nVo7UqsX6Gy6lmA+IFXd6UW2rz/u+Xfj1ML1237nBXB8YwjSGq7
 d+62sy+Mrvil9y64X5eW5JMUt4qrmo0lnFF2ystTX6d27Z5r+4AjY5vunnkexskmOxRnW/SrWs8qz4
 0rXMt9Na2vaO7X+Ei3LoMPPkxHAQ==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_072227_667196_6D9C3443 
X-CRM114-Status: GOOD (  11.52  )
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

While some assemblers (including the LLVM assembler I mostly use) will
happily accept SMSTART as an instruction by default others, specifically
gas, require that any architecture extensions be explicitly enabled.
The assembler SME test programs use manually encoded helpers for the new
instructions but no SMSTART helper is defined, only SM and ZA specific
variants.  Unfortunately the irritators that were just added use plain
SMSTART so on stricter assemblers these fail to build:

za-test.S:160: Error: selected processor does not support `smstart'

Switch to using SMSTART ZA via the manually encoded smstart_za macro we
already have defined.

Fixes: d65f27d240bb ("kselftest/arm64: Implement irritators for ZA and ZT")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/za-test.S | 2 +-
 tools/testing/selftests/arm64/fp/zt-test.S | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 95fdc1c1f228221bc812087a528e4b7c99767bba..9c33e13e9dc4a6f084649fe7d0fb838d9171e3aa 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -157,7 +157,7 @@ function irritator_handler
 
 	// This will reset ZA to all bits 0
 	smstop
-	smstart
+	smstart_za
 
 	ret
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index a90712802801efb97dc6bf8027fb9ceac8f0a895..38080f3c328042af6b3e2d7c3300162ea6efa4ea 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -126,7 +126,7 @@ function irritator_handler
 
 	// This will reset ZT to all bits 0
 	smstop
-	smstart
+	smstart_za
 
 	ret
 endfunction

---
base-commit: 95ad089d464da2a4cd4511fb077f25994104c8f1
change-id: 20241108-arm64-selftest-asm-error-d78570e50b3b

Best regards,
-- 
Mark Brown <broonie@kernel.org>


