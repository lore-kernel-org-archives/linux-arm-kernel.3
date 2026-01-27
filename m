Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAFED34097
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11oHFSku11ggrKUGZhujtCdUsyOdS39krM4vi+tgCfE=; b=C+o6PqZEDSDa7mbK5bSRFY4wMC
	743+dUOSsOgLoxVZeW8XwwgfJ5QTxN8RiJvGB1XbUEU246ciipdEWIXDlljaAKkEixyjnqwPMNOOI
	bH/CErKYwA/H3gj8vUx87h3iXypstLrZVejPue8qKXmRPWNmyu9rvR0FXoQoFNKQmAyCde8n5Mh9P
	YqnbD3u6qPyVTTXYiKX4j0Z23gEniXQFli9gZmOoLNf+anUL9a+cz4jSBRqRs86zof/bUzXEVUUD3
	b0aw5UQDtDU0XSiq8up9k8fbUArA8w4TlXeqxMqVZXXDHkT7z1i2bmPOzx/MJ0PtF7AaxFfatcjrp
	Bwida2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklmj-0000000Ee2h-3v4m;
	Tue, 27 Jan 2026 16:19:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklmN-0000000Edsr-2zz8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 16:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F71F44450;
	Tue, 27 Jan 2026 16:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AEBC116C6;
	Tue, 27 Jan 2026 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530739;
	bh=wCJEdNxOGcIpHHzzvDaU+OqZu7c9QbMKEKo1H+o03eA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZRVqmceyZPtdcwqMVZAitdDYAiYep11cF8d9oa1pyfZyFA8DL1fQhg0y5bE2K8Iwf
	 5/7rKTvc8mmP749G6r5anMYPUsamLwf0jzPailhe69gDsy3AJfF/dNQacSKHNEELYe
	 mNhZEjsyahs893IdSn6GmryiNCcyjrjvtmheLYnYyNnDuvg8xHQwOOW8TFhongB0fl
	 klBg1CywNIGn7SguzfhftQ80tPSOLw8lBWvGaih09liHpzA/w8bbGACDfu19Aeu5tR
	 DF5XTgVk4uaoe5GyeFwu7WE6GfySEitz/wToJbw68fHIQ4PKPcmn700P49TjjdXTfg
	 HJrANEdaoU8cQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Jan 2026 16:16:15 +0000
Subject: [PATCH 2/2] kselftest/arm64: Raise default number of loops in
 fp-pidbench
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-2-3c78eda0d58b@kernel.org>
References: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
In-Reply-To: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wCJEdNxOGcIpHHzzvDaU+OqZu7c9QbMKEKo1H+o03eA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpeOVtgt8ST5SZyebzCzzIreMCj9N7OwYTqgiAm
 nqqIRy+RWeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaXjlbQAKCRAk1otyXVSH
 0O5RB/4hrJHcagYmATJYg5v8gbWxTMdG0VIP2G/T8zoxaBoQLHVYm2HyA3DZSzhs4mOoK+NPZNV
 VYXlBhWLpJx/AVLWiKBAJtMRAzcYJBezmLXzEBWYvUIeQ3GZvyp9RGxqdz4f47CW1+0I8xpyAmW
 kREXw0oW5zpsRPV9qiwX9YrmdyVsu6FhjUnKXn4ms5tDYn0eLmhqn1v1S+PDzpWzHUXi+vjQY0v
 asbzBu35HvcCDrZYjNoO0xBGs/uqyg4D9u1FseNakmm6dSrBx8tFnU6CuC4rR9AQ3QTBSHNehMY
 jju0aiGJRonsN6VZhISot1eynvierKLRWAPz4oWnQNsTR7GU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_081859_895437_C2A46012 
X-CRM114-Status: GOOD (  13.70  )
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

When fp-pidbench was originally written SVE hardware was not widely
available so it was useful to run it in emulation and the default number
of loops was set very low, running for less than a second on actual
hardware. Now that SVE hardware is reasonably available it is very much
less interesting to use emulation, bump the default number of loops up to
even out a bit of the noise on real systems. On the machine I have to hand
this now takes about 15s which is still a toy microbenchmark but perhaps a
bit more useful.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-pidbench.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-pidbench.S b/tools/testing/selftests/arm64/fp/fp-pidbench.S
index aeeadc7873dc..881dfa3b342e 100644
--- a/tools/testing/selftests/arm64/fp/fp-pidbench.S
+++ b/tools/testing/selftests/arm64/fp/fp-pidbench.S
@@ -33,7 +33,7 @@
 function _start
 	puts	"Iterations per test: "
 	mov	x20, #10000
-	lsl	x20, x20, #8
+	lsl	x20, x20, #12
 	mov	x0, x20
 	bl	putdec
 	puts	"\n"

-- 
2.47.3


