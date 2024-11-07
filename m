Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2574D29FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 02:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fr1aydG1CeWxI3Ir6yD5jRjXFZ0+WsHcDj2lCQ3QPI=; b=Ea565E0U0VA17LYbQAA0xce5QS
	LqQyhHyMCIjU37p5cYXT5/MdAZuU7ntl4/sAaMbCeYbCHXrNar9/NCx3hl9EFZOt2ljNXwRuRnIE6
	Ybe9gun0emp367a7Q1OcEbQ0L3flW2t7UwxFb1z78wk4DyYvV++vqx08byTrtG/BYykXVpRn296pB
	TM7KK2eebpnmluXJPPyE86Dvx6THwVQ2CUTbFffV2eaGq/UStPQkkavCKQH9tkwHg22hurrbfNHJS
	ZHBsj4DM/PeKuri8J/HF6BvS3gmHwxyuof81orMtdq5nhPUu4S12edXb3QMb5H4yZAFOPKSmejFdO
	o6KqR8Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rqv-00000005NvZ-2uWT;
	Thu, 07 Nov 2024 02:02:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rZ1-00000005KFd-0Axt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 01:44:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D800B5C54A8;
	Thu,  7 Nov 2024 01:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7C76C4CED3;
	Thu,  7 Nov 2024 01:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730943838;
	bh=UoJTq/4nL7BvDS6uY/r24/IvWcAW7qJlvfXTsku1iBE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JoGAVFaMtyTqLWfIgNr/IR1H96/1i3JXJuY1GBIIhGy/MSX8l0z2eMmOBuO+vEchH
	 XW3dC68fRE0dOb9WdFfGmPTbBPCyctuR1/2OiSz+9Ci9bKIVgivsauXlYRbYGvOQQU
	 t5hgPhXjvQtcFGBj6e+RuRYMSqa4/3Yb0Tj8mNQIyuYDUtu88A8/KWta9+IbHc7HcT
	 SNsjwZAmaG1xwVEih+yu/ebwYh+SwgiAlANhJ9mLnCP5IQZ4uSm2iCw1NzPcFssxcO
	 ccoYPDLBaX6GKL7xFL1HRRss4zU8P5K45fnIqAnLdBwBy8usY/7Hpaq3luJUcHieyU
	 tfemnMhet+hKA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 Nov 2024 01:39:23 +0000
Subject: [PATCH v2 4/6] kselftest/arm64: Implement irritators for ZA and ZT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-arm64-fp-stress-irritator-v2-4-c4b9622e36ee@kernel.org>
References: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
In-Reply-To: <20241107-arm64-fp-stress-irritator-v2-0-c4b9622e36ee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2558; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UoJTq/4nL7BvDS6uY/r24/IvWcAW7qJlvfXTsku1iBE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnLBtSwoIBhD3y9ti90AkhESfq9btN6AviJzAkJBpX
 JMLOoZCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZywbUgAKCRAk1otyXVSH0PY7B/
 4pynI9BeZ8ypvO8mQZDFKRkRl06pvwb0CZjNnHowWK4SQFeZQ69MZ1Bn2LD87oQiKDerIG6YmzQh6L
 tYGa+qzUGMOxhhVpXX1nEE2AA8/4cOVbjG1gjo0LnDtl53wdeI12qPSO7UOSc17WgfHJLVf7AA8S0q
 E8C7T6gnyfhtT/RPLB6k6+x7S76ra+U4yvVGGnuO9EjcByDdHdKrIz/7BEg8l7vmWbb+Hv0x8PXvke
 0S9JnXkgAeIrTH7X47McaV+BsgXHXI4PEhw40BJI6TKGhIB+gR8rpiLifeHX+mHuhL8dZiQ5YW9fzI
 V8CA8bt3/idVoZ+zcv6yZe6ckghDjl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_174359_235711_20A8448F 
X-CRM114-Status: GOOD (  11.02  )
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

Currently we don't use the irritator signal in our floating point stress
tests so when we added ZA and ZT stress tests we didn't actually bother
implementing any actual action in the handlers, we just counted the signal
deliveries. In preparation for using the irritators let's implement them,
just trivially SMSTOP and SMSTART to reset all bits in the register to 0.

Acked-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/za-test.S | 12 ++++--------
 tools/testing/selftests/arm64/fp/zt-test.S | 12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/za-test.S b/tools/testing/selftests/arm64/fp/za-test.S
index 1ee0ec36766d2bef92aff50a002813e76e22963c..f902e6ef9077bfa34fa7f85ce572ce3df4346789 100644
--- a/tools/testing/selftests/arm64/fp/za-test.S
+++ b/tools/testing/selftests/arm64/fp/za-test.S
@@ -148,20 +148,16 @@ function check_za
 	b	memcmp
 endfunction
 
-// Any SME register modified here can cause corruption in the main
-// thread -- but *only* the locations modified here.
+// Modify the live SME register state, signal return will undo our changes
 function irritator_handler
 	// Increment the irritation signal count (x23):
 	ldr	x0, [x2, #ucontext_regs + 8 * 23]
 	add	x0, x0, #1
 	str	x0, [x2, #ucontext_regs + 8 * 23]
 
-	// Corrupt some random ZA data
-#if 0
-	movi	v0.8b, #1
-	movi	v9.16b, #2
-	movi	v31.8b, #3
-#endif
+	// This will reset ZA to all bits 0
+	smstop
+	smstart
 
 	ret
 endfunction
diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index ade9c98abcdafc2755ef4796670566d99e919e5c..c96cb7c2ad4b406c54099fe3f73917259bd947e4 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -117,20 +117,16 @@ function check_zt
 	b	memcmp
 endfunction
 
-// Any SME register modified here can cause corruption in the main
-// thread -- but *only* the locations modified here.
+// Modify the live SME register state, signal return will undo our changes
 function irritator_handler
 	// Increment the irritation signal count (x23):
 	ldr	x0, [x2, #ucontext_regs + 8 * 23]
 	add	x0, x0, #1
 	str	x0, [x2, #ucontext_regs + 8 * 23]
 
-	// Corrupt some random ZT data
-#if 0
-	movi	v0.8b, #1
-	movi	v9.16b, #2
-	movi	v31.8b, #3
-#endif
+	// This will reset ZT to all bits 0
+	smstop
+	smstart
 
 	ret
 endfunction

-- 
2.39.2


