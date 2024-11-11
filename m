Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE4AD3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGc1pft4Ar71ZhgAuzepMl15BMs3pYY/Nia2QXPyTMY=; b=KU1alkeoWd9AZRHee8MAY4u07e
	E3SBKfW0iHHObQNPeWtQcZoe10ubH1UrZz3I4uY1a/hb7zEaSIGhWVGchMRWxNQzP1IGeF2XGUo8J
	cTvQrUup1urQX3Ipf9+Yxvj81yi5G7l5KB2Z6+zpI2A55ErkhtAsLrIewu0H8F06i8VReY3R9iM0S
	QNTu+MZ0maiw+AQs38erTjMuRsKaj9eTKTiHkyhS8s5MmVxYO9rJNU/XSapZtGo2Aj6ijNuYYlWQd
	Ff1c//Q6ZwNmQw8WvlpADcJiN8Ttk+tgkzTdHOhH/yyAgh7QUYhtpJpyFeQHB92UdlZmlHzna95Hh
	ukt/PEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXEp-00000000ZSp-3Dks;
	Mon, 11 Nov 2024 16:26:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAX8F-00000000YcP-3zAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 16:19:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E048EA417AB;
	Mon, 11 Nov 2024 16:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447E2C4CECF;
	Mon, 11 Nov 2024 16:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731341954;
	bh=9cyh4O1U5G+quhH4mm627kHtyNUEPP2A3/N1m265/l0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tpSfi6szIGQ1/P2NbGmmPURdONHXrmQaS9FJkjZMRxZ7vbHzW9P9Hh92+qyymxFRU
	 1Zlq6opK8+hZXuSV6JjAtF3CHplmd0/unNlCDiMJxl5+tkDIEu2RI0gnBNzJ1N0Goz
	 Hw6kjk+Es6SBhrqjTbt8vPCpXMA/AWxPzOZLXi86rQK/ZsZiba9Hlr+dteUU4kJ06V
	 q7CqD6O1l/tTWzxA9HWWsas65z9EXcsJbEJI4lYrew0+276563iAO6JA43dH8yIEmx
	 mf347ya6V6+XeJYu9wuBJeVaXDCN/FhaFNbi5Cv7q6VCpijvRBC5204OkVHLZZWiGJ
	 UWh4W7syExE1w==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 Nov 2024 16:18:56 +0000
Subject: [PATCH 2/2] kselftest/arm64: Try harder to generate different keys
 during PAC tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241111-arm64-pac-test-collisions-v1-2-171875f37e44@kernel.org>
References: <20241111-arm64-pac-test-collisions-v1-0-171875f37e44@kernel.org>
In-Reply-To: <20241111-arm64-pac-test-collisions-v1-0-171875f37e44@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1708; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9cyh4O1U5G+quhH4mm627kHtyNUEPP2A3/N1m265/l0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnMi58jgwmS4v3ef00rmDIKXGflINOqMihqygBt
 HmqWBC0ANOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZzIufAAKCRAk1otyXVSH
 0MxSB/9AzHa5kOicOsY4cAV412rEHAWT2qZEK1xKi3h/eENhxz0LC++OwfzN3D+SFWY8xxbmRdP
 FNiPlPn/9sD7F2XmUNIlczNn48rMwO5c/JIpIY48bPUklBJl/3rwFR8B33Pnsg5mkUQK1v5pljM
 D7tMSYDtUIPq49oH6kzc6lcqEFCHdfP9hR4prgpansGchCYkGcP43WBAz4DY71UcwFn5tX0/x6C
 ll3N5dAgB/OZaiuuSdB1PUnGCy9szdE1N0cg5fDSXq5m8ReqyHAxlPdMFtChsnMJMY/rr3Tw7Do
 91GDxAt+g9NgTmRnXykAjANxDYmOTTHxBzVVuuoZGnT+zdrM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_081916_163187_B8899C05 
X-CRM114-Status: GOOD (  14.49  )
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

We very intermittently see failures in the single_thread_different_keys
PAC test. As noted in the comment in the test the PAC field can be quite
narrow so there is a chance of collisions even with different keys with a
chance of 5% for 7 bit keys, and the potential for narrower keys. The test
tries to avoid this by running repeatedly, but only tries 10 times which
even with a 5% chance of collisions isn't enough.

Increase the number of times we attempt to look for collisions by a factor
of 100, this also affects other tests which are following a similar pattern
with running the test repeatedly and either don't care like with
pac_instruction_not_nop or potentially have the same issue like
exec_sign_all.

The PAC tests are very fast, running in a second or two even in emulation,
so the 100x increased cost is mildly irritating but not a huge issue. The
bulk of the overhead is in the exec_sign_all test which does a fork() and
exec() per iteration.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/pauth/pac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
index 5a07b3958fbf292b09c9d6b11b8f9db2880beeed..6d21b2fc758d80d0cd7d0db2859de3b308522cb4 100644
--- a/tools/testing/selftests/arm64/pauth/pac.c
+++ b/tools/testing/selftests/arm64/pauth/pac.c
@@ -13,7 +13,7 @@
 #include "../../kselftest_harness.h"
 #include "helper.h"
 
-#define PAC_COLLISION_ATTEMPTS 10
+#define PAC_COLLISION_ATTEMPTS 1000
 /*
  * The kernel sets TBID by default. So bits 55 and above should remain
  * untouched no matter what.

-- 
2.39.5


