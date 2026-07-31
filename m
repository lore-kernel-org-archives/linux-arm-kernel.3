Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EB0C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 20:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MBI+DxucX7uN1fwo7HqSW/JtnIQy5htPAaDCcSSW7Vw=; b=iRnJJgFg8BPM4mNvTcdzf/34PC
	r94SZmSdCAOMSoBFQ0Q1lX6UTyBDD3wOXCmrs4289xWB1u4uGVyyHomoWoi5PMZm9spG/LHg052GE
	/IcxQ+XwJ5Yr1wscM9w9rGiEGPiW7glXBZs7v66ne12+NGKjjdc7OwBGyXW8vRxLEoIwQ79Y76DER
	RqvwrTXr+teFeXuCKivDtraIVm46vnYuangytP3DJ3SQCGZ3NO1vflzP7VK8OHs0ogKMciI1sOFnv
	r9GbGzIyVswlN8CBR3rQf3A2OAcAw0nWeXeh0NdpkJDQp6fQabB7nP7O9KbvblDod9Qk4ET25Wcyj
	GxQxf4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuCz-0000000DZol-1YeK;
	Fri, 31 Jul 2026 20:51:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpuCx-0000000DZoa-3FQJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 20:51:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 328B4418CD;
	Fri, 31 Jul 2026 20:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C70B1F00AC4;
	Fri, 31 Jul 2026 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785531115;
	bh=MBI+DxucX7uN1fwo7HqSW/JtnIQy5htPAaDCcSSW7Vw=;
	h=From:Date:Subject:To:Cc;
	b=EXdyf0hss9aPzJ/i4db3jAzDgBxtdTxeow2HG5hN/IvQdlkLz/vWEyzORxxFphV1l
	 s+dYGQeQAH7+DQHzi6XP+arKsqfNQx8SkaIDjmHRadMj1fe/tp48HBSragg4uDUZqc
	 46rQLfJVpgD2PWvAIT5qWVruziRvg3bAYDpNa8UdqPHs4E7+tXozF9O1w9/vd2qLav
	 kh9fv216jztT7MJkApuaVUu7zSODOA36UKti5uKd4ELAeuVKw41aStz5792/qGHCcr
	 OGaop1ezSS4v+Q6KFGvbV8/bMKc17I9Gf0gHT9FQfOVScyynYgY83KIx5JcauSniiM
	 33L/LZGiKevHw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 21:50:52 +0100
Subject: [PATCH] kselftest/arm64: Don't write to P0 in irritator on SME
 only systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-sve-test-sme-only-v1-1-eb559009dce8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKsKbWoC/yXMQQrCMBBG4auUWTuQ1hDRq4iLmP7REZtKJhZL6
 d0bdfkt3ltIkQVKp2ahjElUxlTR7hoKd59uYOmrqTOdM4d9yz4PzrJO4AItrAN4TM+ZrbOw5ti
 HGD3V+pUR5fM7ny9/6/v6QCjfHa3rBu0kex97AAAA
X-Change-ID: 20260731-arm64-sve-test-sme-only-464e409dcffa
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GJ5LmgPC4TEjYq3Z1NrIggZZfJeakFkQR4490y54zBE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbQroWQFZFzuMZ5bOpnu6Yh4Qh7/o/9MFxgpIr
 uBHWDg1W+mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCam0K6AAKCRAk1otyXVSH
 0M8kB/sEm5oMNxHsgcp5vf8BiN9HkeZiuzvNcdvl/YJmB8C/sEYwRwd+bf5Jrx06BnwOlc+ZgXC
 IsVfXJT8NkUapMMiu1f5QxH0ccop31qu39HG8yaPF7KvzhS0wB08/Ea8vLpLlhR/fFO4Sz2+cpl
 KVHC2ZQtkLEwb2+I0UlEloNyTqQ9L194ytGj3SkdzufS8WHqURSJYjts/529IujGO7mKycjHolq
 8Ju+wBVHWCzS0/XJf70kjAoQZJWzEKb3+3f0rfwJFtDq4KgPrG6DTeQkBiiuVr4S40A6APGHvh6
 9Np3TyvAf1Inqng9TjwdZMplFJI58paTiKdSjFgS0Nn3bQTs
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

Commit 3e360ef0c0a1f ("kselftest/arm64: Corrupt P0 in the irritator when
testing SSVE") added corruption of P0 to the sve-test case in order to
ensure that the predicate registers were covered as part of the
corruption.  On SME only systems this results in an illegal instruction
since signal handlers are run out of streaming mode and the predicate
registers do not exist out of streaming mode without SVE.  Switch to
entering and exiting streaming mode in the irritator, this will reset
all relevant registers to 0 if they somehow weren't already by the
signal entry.

Fixes: 3e360ef0c0a1f ("kselftest/arm64: Corrupt P0 in the irritator when testing SSVE")
Reported-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 80e072f221cd..7ef7835389e7 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -298,15 +298,20 @@ function irritator_handler
 	add	x0, x0, #1
 	str	x0, [x2, #ucontext_regs + 8 * 23]
 
+#ifndef SSVE
 	// Corrupt some random Z-regs
 	movi	v0.8b, #1
 	movi	v9.16b, #2
 	movi	v31.8b, #3
 	// And P0
 	ptrue	p0.d
-#ifndef SSVE
 	// And FFR
 	wrffr	p15.b
+#else
+	// Enter and exit streaming mode, will reset all of the V, Z, P
+	// and FFR registers that the system has.
+	smstart_sm
+	smstop
 #endif
 
 	ret

---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260731-arm64-sve-test-sme-only-464e409dcffa

Best regards,
--  
Mark Brown <broonie@kernel.org>


