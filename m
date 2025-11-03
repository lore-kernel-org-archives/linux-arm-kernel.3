Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F421CCFA08
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mwybVRTuh4xoEZP57KBsNjHeNeHsMnzDhZ42CuRn/ic=; b=AX8GRScweE0jSpq7+4cZVNcD5Q
	N4G8z+uVaQnWAIeU9uKixtmNN8SvzZaqLzCB44oFCNQSl4RqyKBCwF5gaKZ6JBU+5aIlLoZoF71Nz
	j5MLINEOqDFYFfI5ytZq+VosfJGiYgq4t/O5LFlu54KHKColgw7Y5VKCIr2chkGplfaMjSNE0B0w7
	ecMOarqziXa74502XUaHP/PbJxbclx+VhMAr06DO9SRwwbj9phqBbfX2bv7+rse4YJsUSEzyIMzAo
	B3/fjnOTaEpTiqw7S6g3ANf2+Q+WGwSJG1GWD3AJsyKBVstqKMHTmosmR+nb4WjG+272isaEYu/Yj
	6rQuJ/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFx2t-0000000ADd8-4B8R;
	Mon, 03 Nov 2025 16:04:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFx2r-0000000ADcC-0zy5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:04:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29C051D14;
	Mon,  3 Nov 2025 08:04:27 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 961063F694;
	Mon,  3 Nov 2025 08:04:33 -0800 (PST)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	linux-kselftest@vger.kernel.org,
	mark.rutland@arm.com,
	shuah@kernel.org,
	will@kernel.org
Subject: [PATCH] kselftest/arm64: Align zt-test register dumps
Date: Mon,  3 Nov 2025 16:04:17 +0000
Message-Id: <20251103160417.1023545-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_080437_318880_8E689EB6 
X-CRM114-Status: UNSURE (   9.91  )
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

The zt-test output is awkward to read, as the 'Expected' value isn't
dumped on its own line and isn't aligned with the 'Got' value beneath.
For example:

  Mismatch: PID=5281, iteration=3270249   Expected [00a1146901a1146902a1146903a1146904a1146905a1146906a1146907a1146908a1146909a114690aa114690ba114690ca114690da114690ea114690fa11469]
          Got      [00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000]
          SVCR: 2

Add a newline, matching the other FPSIMD/SVE/SME tests, so that we get
output that can be read more easily:

  Mismatch: PID=5281, iteration=3270249
          Expected [00a1146901a1146902a1146903a1146904a1146905a1146906a1146907a1146908a1146909a114690aa114690ba114690ca114690da114690ea114690fa11469]
          Got      [00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000]
          SVCR: 2

Admittedly this isn't all that important when the 'Got' value is all
zeroes, but otherwise this would be a major help for identifying which
portion of the 'Got' value is not as expected.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/arm64/fp/zt-test.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/zt-test.S b/tools/testing/selftests/arm64/fp/zt-test.S
index 38080f3c32804..a8df057716707 100644
--- a/tools/testing/selftests/arm64/fp/zt-test.S
+++ b/tools/testing/selftests/arm64/fp/zt-test.S
@@ -276,7 +276,7 @@ function barf
 	bl	putdec
 	puts	", iteration="
 	mov	x0, x22
-	bl	putdec
+	bl	putdecn
 	puts	"\tExpected ["
 	mov	x0, x10
 	mov	x1, x12
-- 
2.30.2


