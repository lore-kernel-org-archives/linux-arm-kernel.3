Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223ECE668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTAbC21C0hZn5mJI2I7elIAfHXVW8qFWbu9FlPsBvqo=; b=D2TR9QwoBEcTJcxvdT0URi0OTq
	2y1WzPFXLHop7aylUIJsWF9LyuHQIJhaGvJzGm7BmMFHrHERMT4B5BF3lBR7CQftIzCmv641UkWm6
	OG2z5yrfQRBd2bO0BZN2nweL/BmbGLE7IILBVeAJxq83D8Yn2IIHnCIYigOo6fYbBpWaJK1NqSXIR
	/USiaPfGUX9s3dM71CXuTRAMFg69Ni3AvgcRtU1Gyu2y4ppdkS18e+9nxbsmnG0N6BR/u1r85ltn2
	k0YQxS+eZgyiUtcFFN/sYLz/vqSN/9g1BBD0W/Fo0nvborOUN4qgLQiFkP7BAS0Z/WVSWdFqbbKic
	VthQuN5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC4y-00000005mq3-1svY;
	Sun, 24 Nov 2024 12:51:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBwA-00000005kDn-13Pr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2CD7F5C415E;
	Sun, 24 Nov 2024 12:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBFAC4CECC;
	Sun, 24 Nov 2024 12:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452121;
	bh=sf64Z8/K2JmDjSHufuyPNPpzb2t6/Com4h0XELkBt2E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=caoositVIPi/DlBvtIyXSN7VUM5x51dLwmLQgkiHEP72gJVoGzyPjTyP5AYZsKisQ
	 nXs4Frza7WYh0yBbaKF0vvXh5Y9FuHs1zHitWkhe+q/VP+Vt7uyr9nipdmo6MHLF9M
	 cBPZqOmXmxZvt0MyHjK9dHmZwFjuvow1ULXClOoU/7j4eoR/RQJl2ykgy9oH3QymR8
	 +oFxmGUOKDu0E2LZ0O1Rf6X/jpKi27TW2TiEPKlFTfFALag/PH6I2csLgjkOwPjUMf
	 wvNB5QLuq+p28/g5lYXRpYBU/xJuwBmby2rAqlIoZbu/ProyiCpB9xQOv5p9XFaZrG
	 faoFzawfRHsbQ==
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
Subject: [PATCH AUTOSEL 5.15 5/6] kselftest/arm64: Corrupt P0 in the irritator when testing SSVE
Date: Sun, 24 Nov 2024 07:41:41 -0500
Message-ID: <20241124124149.3336868-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124149.3336868-1-sashal@kernel.org>
References: <20241124124149.3336868-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_044202_331857_8B28E49A 
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
index e3e08d9c7020e..f631d17c899d2 100644
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


