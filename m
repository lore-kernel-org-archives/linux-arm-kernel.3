Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ADAE668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zkmTcurhnEkj1BAmoxf5q+gxzZeLUjuoteDpg+48I+I=; b=AUHdWiMWLQMAND/dMIgq+QbaJ8
	t1q9HiROAv9mjDaOESTENI83ESFwGbfRUCrC+9lD2M5H9D9gHSUuFS9+mDYA88s0eYgZs1MSNlZP4
	+19wLnGfLjt74TZOE/s1YznTcw/qdgnysJ+PvNSKS6D9xcFWxVhzJcE+m03gIEGLiZxtC5y0UZKst
	KilnJ72SOdAFppGAbziqXVLrhFUYFZXpoP+W0Po6BU27Jf9Tg9l/9WBzRmpkJVf29DjwSKBvffOxS
	BtiUg0bRb6IpS9Odn4d/FshZiJ/NBQ7jAHrO4IHUMqDBiGP/YX6vK9oCEmSwt0z4+zOPerYZTRHt9
	VrHOFoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC6p-00000005nOX-2nkP;
	Sun, 24 Nov 2024 12:53:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBwR-00000005kHZ-2CIh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:42:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B088CA409F8;
	Sun, 24 Nov 2024 12:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510F1C4CECC;
	Sun, 24 Nov 2024 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452138;
	bh=6pfOqibsCE2HGXSmSvgOSWW28Hn3vo3smyAJ7UMWNP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fy4y6FxOmiyK6hF+ttlhQ/j26840A+x8p26SHZT9PIx6JmGaSzi+24t3lXLkudIgO
	 Y0ZZq35AL6uo8ZHtegVoEVrx6i6XBPoPScUZNjpnjyFNR/gP0r5ApL/+7iTCUtMoWp
	 A3Y7NQ0APloWF1RLSTAf+8fgmxJlnhi2dYQ8gHDqC3qGljreORHE8746iOA0Urd+pX
	 w30+YZcMFoPldp5hYnTvTLlvahJHwWyrXwUQ497qpprt67EiKL2S/L3q/YCoHn3yjr
	 R+gDiXE34+9cdlV9Cvng9VSHzOTfVW55ySzKCxoGXRtXUQIKHYsRjNrcp8mXXy3xgN
	 HjJYDbT0wZSgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	shuah@kernel.org,
	mark.rutland@arm.com,
	thiago.bauermann@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 4/5] kselftest/arm64: Corrupt P0 in the irritator when testing SSVE
Date: Sun, 24 Nov 2024 07:42:03 -0500
Message-ID: <20241124124210.3337020-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124210.3337020-1-sashal@kernel.org>
References: <20241124124210.3337020-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_044219_625359_83527D2A 
X-CRM114-Status: UNSURE (   9.53  )
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

From: Mark Brown <broonie@kernel.org>

[ Upstream commit 3e360ef0c0a1fb6ce9a302e40b8057c41ba8a9d2 ]

When building for streaming SVE the irritator for SVE skips updates of both
P0 and FFR. While FFR is skipped since it might not be present there is no
reason to skip corrupting P0 so switch to an instruction valid in streaming
mode and move the ifdef.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20241107-arm64-fp-stress-irritator-v2-3-c4b9622e36ee@kernel.org
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/fp/sve-test.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/sve-test.S b/tools/testing/selftests/arm64/fp/sve-test.S
index 07f14e279a904..7784c684a865b 100644
--- a/tools/testing/selftests/arm64/fp/sve-test.S
+++ b/tools/testing/selftests/arm64/fp/sve-test.S
@@ -459,7 +459,8 @@ function irritator_handler
 	movi	v9.16b, #2
 	movi	v31.8b, #3
 	// And P0
-	rdffr	p0.b
+	ptrue	p0.d
+#ifndef SSVE
 	// And FFR
 	wrffr	p15.b
 
-- 
2.43.0


