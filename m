Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B71D5C0C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 13:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bfzpvzGKHBwxLdPcqBlzdmawqeUnehZjwrJUtog5h1E=; b=JuI9Y5BDAb2TRk4cdMWQz/SgFk
	ZY1QBzQO2kw4GRRiGynE8VY3noUyUZsExD3Uub6arGBZNkT5UpfAAYQPNpLyudM+mKH4cckTYLLGj
	a84dNG95vyJaoBN0RTgC7pi9kiyiYpr0m8W1T2H27ED3CN4AXcd7maOiacekhogCwyFqX/xrHuTQZ
	87Wrag6o9eqk/h/bt64+WMeFPThr69/brmZ0Yr9+q3mWZY8ESST/LrAA+LYwGrtlcQOYoW938uY4J
	6hturBF4tL0aBCqNRCSIW40bkNlBoyK1NtnveA4WRxyLMceNgNU3uCU4L1WtObsnpuD6INL0CEZ8E
	hT5vCMSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PRw-0000000Aloc-04Ro;
	Fri, 08 Nov 2024 13:54:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PMd-0000000AkNZ-3CA6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1DA15C407C;
	Fri,  8 Nov 2024 13:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC906C4CECD;
	Fri,  8 Nov 2024 13:49:25 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/4] kselftest/arm64: Fix printf() warning in the arm64 MTE prctl() test
Date: Fri,  8 Nov 2024 13:49:18 +0000
Message-Id: <20241108134920.1233992-3-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108134920.1233992-1-catalin.marinas@arm.com>
References: <20241108134920.1233992-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_054927_866688_E9686982 
X-CRM114-Status: GOOD (  11.14  )
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

While prctl() returns an 'int', the PR_MTE_TCF_MASK is defined as
unsigned long which results in the larger type following a bitwise 'and'
operation. Cast the printf() argument to 'int'.

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 tools/testing/selftests/arm64/mte/check_prctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/mte/check_prctl.c b/tools/testing/selftests/arm64/mte/check_prctl.c
index f139a33a43ef..51e3f41a54d1 100644
--- a/tools/testing/selftests/arm64/mte/check_prctl.c
+++ b/tools/testing/selftests/arm64/mte/check_prctl.c
@@ -85,7 +85,7 @@ void set_mode_test(const char *name, int hwcap2, int mask)
 		ksft_test_result_pass("%s\n", name);
 	} else {
 		ksft_print_msg("Got %x, expected %x\n",
-			       (ret & PR_MTE_TCF_MASK), mask);
+			       (int)(ret & PR_MTE_TCF_MASK), mask);
 		ksft_test_result_fail("%s\n", name);
 	}
 }

