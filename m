Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A914F606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=msgCA7YF;
	dkim=pass (2048-bit key, unprotected) header.d=daylightlinux.ch header.i=@daylightlinux.ch header.a=rsa-sha256 header.s=20261016 header.b=T9+o+s5G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=6PMjq7ex/yWI/NXHSYuD993yLEotdzOfMLRKmeshfQw=; b=msgCA7YFPOWiCfosQ/qsbS/ltW
	cD9XtUXbTq/M0+1YWyFkBAaBgeDU6Q8m4/YRyAZvkApwm9jECYU02tCtEC9lT/IRPTJimM4bHv9qj
	M1h6KcvwSFLYvtkgSVB90D6LbdWgnh/FT1BeyCRmNpZ5hkRMnQLKB0w5sn9cB7CiMnRhMFQp+VUYi
	CQ56sLsBi+32gvIjoG+BhlkleSgeOGKfS4PsxzpOWvZlPSpo+kdzVRWmHvVHMtB5dMTL+uVuqM0Ur
	pjB7pigLdQbfx0nKpEIEGo4RZM6EaPA+jOGEtA3WZNoR3i2W8KFrjrZSbp5J0+C9L9nte4JAd2xyX
	dKq3U8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOn5G-00000007YyA-0NTo;
	Thu, 05 Nov 2026 02:20:10 +0000
Received: from smtp-8fac.mail.infomaniak.ch ([83.166.143.172])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOn5C-00000007Yx0-01JT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 02:20:08 +0000
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVl48P7zjmF;
	Tue,  3 Nov 2026 17:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724127;
	bh=6PMjq7ex/yWI/NXHSYuD993yLEotdzOfMLRKmeshfQw=;
	h=From:To:Cc:Subject:Date:From;
	b=T9+o+s5GupakP1vchsjALwOqSxZRCPPRF/Xm757letEtm9FOe5P5UUEribu/1lGPF
	 A4KXS/tGAsW3191xWmhzmMBZG0U5T4Z2K6v2aBA9VhViKxe794B7C6lp1Xy02LhKVN
	 /9pckTtsoqIw1RcJJaT0TceDJkDIhJdo/VEXJEEovYW+sS8unH8swNWzGbMeSvgfrD
	 fbqPXrp/ZBfqVuq5fMAvCZtTkQXHprKVD26FNxg8GuHW0cqNiu8gQwNN/viRX1CToR
	 PrNVlZAb2p4/YfoGqy/OIPLY2XCgn+sHbyXTtsopXT1A7Eql0UIisfon4B+tRGO8Yn
	 tEQfyb2e2P0IA==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVk6yF0zqxS;
	Tue,  3 Nov 2026 17:42:06 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaI-00FDe5-1k;
	Tue, 03 Nov 2026 17:42:06 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sjg@chromium.org
Cc: hamdy.aea@protonmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: make_fit: propagate compressor failures
Date: Tue,  3 Nov 2026 17:42:06 +0100
Message-ID: <20261103164206.129723-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_182006_972888_9BB8B361 
X-CRM114-Status: GOOD (  10.24  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

compress_data() ignores the compressor exit status and marks the
operation successful even if the tool wrote only partial output.
build_fit() can then place that truncated data into a FIT image.

Use check_call() so compressor failures abort image generation.
FileNotFoundError still allows trying the next supported executable.

Tested a compressor that writes partial output and exits with status
23: compression raises CalledProcessError and the CLI creates no FIT.
Also generated uncompressed and gzip FIT images with a real DTB and
ramdisk, and verified their payloads through libfdt and gzip.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 7a23b027ec17 ("arm64: boot: Support Flat Image Tree")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/make_fit.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 9bd35aa7211..1a63364388c 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -214,7 +214,7 @@ def compress_data(inf, compress):
                     if tool in ('zstd', 'xz'):
                         cmd.extend(['-T0'])  # Use all available cores
                     cmd.append('-c')
-                    subprocess.call(cmd, stdin=inf, stdout=outf)
+                    subprocess.check_call(cmd, stdin=inf, stdout=outf)
                     done = True
                     break
                 except FileNotFoundError:

