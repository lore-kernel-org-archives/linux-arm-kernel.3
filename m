Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D703CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jThOaufkY1GMl8CHVBUGH6gcnuocuuMSc1p6rCYHqx0=; b=bMlHNx3OGDTjW2Z/Aqoaz7iv2t
	iwf8EW3QzLR4Ppsx0bPytTU6vtgDbYO5aTud+GU3vR1jcEiaSR0N+5ReEn/iP18INDPRPR3yRKwjr
	bItbi1roGiIXSIiZapJA/3F3tQiKJwN2MvA289NtlToQdMmE6AjTVoSE7odEGpGhBR29qOqtIeKDj
	aZnemB6LHO6dnAg4f9k0yl8q5aEUK6X8D2E/gJh2uu4QulB1Lu2n6oBrYvWyXW+nSZR4i1saQ+jRR
	kxnYsP+RlFLutTVYRuqjCpVVoRxjF52l5tbCf50f0ulgBmQ4biJTmMYKJXZv3heQIlc2OsGRgvyj6
	ZXhWG+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBRN-00000000MgT-2khd;
	Thu, 21 Aug 2025 19:59:17 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7P6-0000000HQl8-0xK7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755790835;
	bh=Nytg3brGBX94RkJqufZjR2+fI2MqCelukAJyT2C5iuA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ehysW5Ti14GbYFhA26/1gVMOc2+KTHF/h4tN3ojF7izVXO2E6sUcmCrRHdTJhy9U2
	 Q+4khxVCHYmfxyNbWUEceTDgDIemdajFjc4rCJlxPt9LiN232sK9qvTcgxBHXYwIIv
	 aur07jnAWkia87y1UW1975zb7YLEvYv3XXofnsxg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:40:37 +0200
Subject: [PATCH 6/7] kselftest/arm64: tpidr2: Switch to waitpid() over
 wait4()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-enosys-v1-6-4b63f2caaa89@weissschuh.net>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
In-Reply-To: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755790835; l=1157;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Nytg3brGBX94RkJqufZjR2+fI2MqCelukAJyT2C5iuA=;
 b=VqLBwVGYCEIudHHlBaFHOBetWwInVKrleIrbKcGtAm22hGoGNMsD8h8JJQiG88d2h8qI7f1f7
 PR8nnUUDe10CiRbHV66a9YcSv/TqfRjhX2KHuXKXIFqXr0HyQtO8xf5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084040_446552_12C516C8 
X-CRM114-Status: UNSURE (   9.85  )
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

wait4() is deprecated, non-standard and about to be removed from nolibc.

Switch to the equivalent waitpid() call.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/arm64/abi/tpidr2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/arm64/abi/tpidr2.c b/tools/testing/selftests/arm64/abi/tpidr2.c
index f58a9f89b952c42c5393b93a2db4fefe3f335e5a..3b520b7efa49e0058616c04fcdc0222bd8b03d8a 100644
--- a/tools/testing/selftests/arm64/abi/tpidr2.c
+++ b/tools/testing/selftests/arm64/abi/tpidr2.c
@@ -182,16 +182,16 @@ static int write_clone_read(void)
 	}
 
 	for (;;) {
-		waiting = wait4(ret, &status, __WCLONE, NULL);
+		waiting = waitpid(ret, &status, __WCLONE);
 
 		if (waiting < 0) {
 			if (errno == EINTR)
 				continue;
-			ksft_print_msg("wait4() failed: %d\n", errno);
+			ksft_print_msg("waitpid() failed: %d\n", errno);
 			return 0;
 		}
 		if (waiting != ret) {
-			ksft_print_msg("wait4() returned wrong PID %d\n",
+			ksft_print_msg("waitpid() returned wrong PID %d\n",
 				       waiting);
 			return 0;
 		}

-- 
2.50.1


