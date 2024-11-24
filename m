Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883ACE668AD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkBmtuBSH9BvnPmmOZ9GYZL8CdWojTswGqQr2sK4c1s=; b=QM7dWZzZ5fnvrCXfsiTNSg3Gcn
	5+dJh1lD2ZRc3ZYd9s7QGbFCKnmiKm5+21fEhPvK509TZUvbp3YlH4SH0UmkEv/4C09Prv5RYhjGA
	iBP1fiNOogX4YqABnjrrNQ53Kyw0HihdnTRze2vCC11mvuw3D8/PuguyCa7+4iuzV51+uewkeUUpB
	Mw0H33VJKUVFMkXWXn27t2gRgtXcPnWtNrXWTKRmcu7U42GJE9ta8Iwn9NU6eCH5PdTpKs7CgPpF8
	mTxbeIB3/WrSyM65YZONaibKIzkF3uwzy/gV6Hrf6V/h5zzZtDfgDkRJNRjYSowazUeQbuVrxt6OQ
	1fVVryFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFC7l-00000005ndu-1FRK;
	Sun, 24 Nov 2024 12:54:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFBwU-00000005kIE-0svc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 12:42:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6A87FA4094D;
	Sun, 24 Nov 2024 12:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37693C4CECC;
	Sun, 24 Nov 2024 12:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452141;
	bh=dStXZbOZ68pcA4OHVXBepn0T/jxDTGEotO0Yx2wAYpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bBayeVMtkjUiELPpvBOfDIG9iwsxIWqvX34DmIqw2KNGSht+uMdB9GySsdOqoHUsT
	 7xGopjCeK417X14P5jk6CC1tOoW9zyLN5k7vby4C8I8xsLsuchPe0OdZb/31aZyrJz
	 zaLHK09tBr2zzb8tuOBvIFVT1FW+6D6fcCsSXGtN8btgXL9oSTukcFV8qtLy70VFF+
	 jcfJKme/u5oPZPqYXRdrjkIZKgzEFvkVG8OapDORu/5rgxng9xUEWsXj+f+5K2bvOX
	 LVnaV8+I+rox3EQp3KTuYNlkJgvA1iHguvE9CwKxICOIP4c1oWdzkPUX69FvD/H89s
	 mToacOWdF+68w==
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
Subject: [PATCH AUTOSEL 5.10 5/5] kselftest/arm64: Don't leak pipe fds in pac.exec_sign_all()
Date: Sun, 24 Nov 2024 07:42:04 -0500
Message-ID: <20241124124210.3337020-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124210.3337020-1-sashal@kernel.org>
References: <20241124124210.3337020-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_044222_306581_CEF8D48F 
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


