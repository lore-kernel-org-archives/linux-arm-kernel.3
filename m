Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4726CFA46A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XOGDo4vGiv3O5RiGrxGxTNcGTfWFAmUJSUQ3OPPNIOI=; b=fE3YH3rl1wltu+nTAYjsym1C/W
	De+rCd60jInySj1Em//pCSpG7CmkKAr711y4lj92xUog6xh4gxp7e2CzXGX0oqlIabJg2dZpivvqm
	Zw6NzELWTqiQkeFw/tL4r3HqTV02exBA4U1WoIJJvDh+DahE9FSecrRNYrfc4gAzq+udEm0I9gHpi
	sxb0T9dnC06Y66WZRggEMAycat0+sOxlUvsUBemvgnzLRh1PQha3Sd7qoD5OCr2OeQkQXv2B+UZ56
	AiCBMCnJTRDe242mTK2Iv1MweuluJryMY1GTB9UxyhUnbtfL/hseL/sd76UWhbd91P5YXCs/BGCK/
	ghgRz3ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3iDX-0000000Fsjg-2h6s;
	Wed, 23 Oct 2024 20:44:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3i8w-0000000FrVt-0ihU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 20:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0AA12A406ED;
	Wed, 23 Oct 2024 20:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5059FC4CEC6;
	Wed, 23 Oct 2024 20:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729715984;
	bh=A0xCV0/PSvevUax4GW3txbWNtrgIm8u+5XUscwTPb/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GAwtJDupEyWOB3uuEGnaulVAgHAukMaigDlXwBOK/DK5UrHfJ04dEZpVvJHQru2Qy
	 JrS5jofMrUiccO3pL9n/A1HbMCNpFQZu7kJB7vTz9jFTDJeKrSMixnsZjGMv5K8F5j
	 8o0Cm+wWK3/vWiXr3Lk517Pj0ZnMxFKr8mqOqkBshm8KKT7FQ2R886EIxX2CUBNGWy
	 Af5kJM+fDzNbajd4GJBWYbPOH3FlHqUACAKwyzCzwopBR7RuwHlKwqfGMPnBnZ1awS
	 21nOuSbDKCG658SpD7ksW1KQgN6qI/rCUZ9/fOJvIrXZNNoMWebYdglt+RJDLFqYui
	 zZnGVTJPu+Tew==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 23 Oct 2024 21:38:30 +0100
Subject: [PATCH 2/6] kselftest/arm64: Remove unused ADRs from irritator
 handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-arm64-fp-stress-irritator-v1-2-a51af298d449@kernel.org>
References: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
In-Reply-To: <20241023-arm64-fp-stress-irritator-v1-0-a51af298d449@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A0xCV0/PSvevUax4GW3txbWNtrgIm8u+5XUscwTPb/o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnGV8HpM2/QKONGuDoJRvv7T//ECB/Hh6Fht25u/wh
 bXTfT0eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZxlfBwAKCRAk1otyXVSH0KM5B/
 0WNMHqxiKcGxbpdzPHNYqwJzUbmWOTTHmbNlhyehRneGnNCvkwuaW7HSPHCncZK3WuJu5ZxGujaDbw
 hSX3xomF3kvFN++b6sLJvowe3lgwXeadwd8NRAuKuFwZNRaJlrwqSRfpGeNZRvPd9zAnJBQE52CL5J
 1DKNnlI1y7uAhieuL2aGoWQBzrxvBLn7c5myKCEeQYuE9V9Ub3XhU04rUkoFjK05ZcQTDtf1lBtTLd
 qyFgwUAUizrgXECgz93ffnB7ED86olrhWBFQxWwR7YJAxQe6UnLhbfCZ0CEeQNDudd0Nba+KzNwiBu
 Oz6gHCXYVR5zI+JUGijriZuillOYAZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_133946_384724_EC263226 
X-CRM114-Status: UNSURE (   8.34  )
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


