Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E76E668AB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkBmtuBSH9BvnPmmOZ9GYZL8CdWojTswGqQr2sK4c1s=; b=kVtcyJpB+UG9JWqSMQ+szugybl
	Rm/esEbQR9jMIxp2CfXhQZy/3Q081zP5XpoNuK44v3Vrmn0Ym0Q7eTEcpatAs+4ZxKODOpOGXcwDu
	PSjNtJwxurFxNOLKVmuqFUrdcqL1Xeg/OYoTu+f17UbmzNkknVYdsj0TULtA//BZLnDTERBBNq1X7
	xAEe5KEzVsdxVEtKiIxYeyeY9Vq6nfpqqoyjK8pzWJWykd3hj2hRu2GlfFsR3yepYUYVXO0zfukOj
	q1fETcUvLrvx+yWY47p5XJFPusaGvxFMuA+SBOUWuqwpkDIXV7Po9DPBAd2uVJQKwC5IAHpybnGOI
	7SBC3znA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC42-00000005mUn-1TSZ;
	Sun, 24 Nov 2024 12:50:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBvq-00000005k7d-1P3Q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42EEC5C48C6;
	Sun, 24 Nov 2024 12:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F906C4CECC;
	Sun, 24 Nov 2024 12:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452101;
	bh=dStXZbOZ68pcA4OHVXBepn0T/jxDTGEotO0Yx2wAYpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HwN0E9DEmZCKeREnvGXJsZWRyV3xbZ0F1jMyJFHWjLxFmdHOXpkDhH93uVFmSwOPt
	 aq05rowdwa7MJSAuDqcuNS4r3logfcF+cP9cGH5iEB28zHxsoZSDVLU/OvsR8qSvgT
	 PnpA3bZRPyXnCGpguAms7Kb0V+TBOqyNEljxUBQpDGEUSlnm36JlHEdWvNxSoZgo6Z
	 IsfUxsFHUUY4IV7tbGiViiL0/P5Uuk4JDrETWRB1ukqxDH4U/JKtv/oyrScHQ/fVOl
	 Aj5n3ShN/4L8ZGnteuJ7wAjSUlSTx6nIRi+U93gFvBoTE5FR/k0q0nFCyfB86bl+n0
	 LK7nsPiO8U5Ag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sasha Levin <sashal@kernel.org>,
	will@kernel.org,
	shuah@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 7/7] kselftest/arm64: Don't leak pipe fds in pac.exec_sign_all()
Date: Sun, 24 Nov 2024 07:41:18 -0500
Message-ID: <20241124124126.3336691-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124126.3336691-1-sashal@kernel.org>
References: <20241124124126.3336691-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.119
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_044142_407249_B0088542 
X-CRM114-Status: UNSURE (   9.81  )
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

[ Upstream commit 27141b690547da5650a420f26ec369ba142a9ebb ]

The PAC exec_sign_all() test spawns some child processes, creating pipes
to be stdin and stdout for the child. It cleans up most of the file
descriptors that are created as part of this but neglects to clean up the
parent end of the child stdin and stdout. Add the missing close() calls.

Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20241111-arm64-pac-test-collisions-v1-1-171875f37e44@kernel.org
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/arm64/pauth/pac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
index b743daa772f55..5a07b3958fbf2 100644
--- a/tools/testing/selftests/arm64/pauth/pac.c
+++ b/tools/testing/selftests/arm64/pauth/pac.c
@@ -182,6 +182,9 @@ int exec_sign_all(struct signatures *signed_vals, size_t val)
 		return -1;
 	}
 
+	close(new_stdin[1]);
+	close(new_stdout[0]);
+
 	return 0;
 }
 
-- 
2.43.0


