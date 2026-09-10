Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F3CC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 19:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6Ski5oShHi724kKberIu2tJzQT3gRoRlWMUMrxLHHQ=; b=rJpKn6VqUd+AjBsF+xgw0/wWD+
	iqMdGKz4VKmp/2+5QXop4BJ821gue52y5NoUEWEh14aKs8RmI8q9idRIXtToWAMOs/kS3OueaW1De
	R8Lt3wN9mBhTy2/bfC9/WZq0ILr5ZAH4HfbCbHtsoNP1xXaOU8NLEtjYPWKqFD4N4cj9DSdDuyDZb
	MMXkkB+cJ6nuglxD7Q4Jp5raJXTP7A3rrwQF3RJs8IvT7GI2IuletqmeWY32BskYTGCgJAHtuupLI
	6pnack4RU9j5ByVkd/y94QOiu4ZHv8h7VpGfWsCTyDgwxHnJ01FSaeUzDcik87zqEmVewm5knvwZu
	thK1kgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k2P-0000000FEAA-3MiA;
	Thu, 10 Sep 2026 19:02:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4k2P-0000000FE9W-0VOB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 19:02:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 72D2060AA4;
	Thu, 10 Sep 2026 19:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25421F000FF;
	Thu, 10 Sep 2026 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066940;
	bh=A6Ski5oShHi724kKberIu2tJzQT3gRoRlWMUMrxLHHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=awrv2Ar66ekaz9NOUsviWrU1A7CcXwXk+/6xozdaZaOAAcGiFhadkZnxhdDuoDM34
	 s+rCKLtCAQqZ6DOmpiN71wprjga3f48MSq6d5MdjdD3YoST5UH9miO0WAZ26C89gyh
	 fuCf4uwS8pSouq/FhOeg6dHcyIuJKpcxQgYxbRorN92fScEg8gWjyuDvWo9Ugm20/e
	 v7B59Gan7vClS8wLmsCi6DDij1hxg58UsYOoHKFfephK0cEvJSDYS6oLj43OmobNo3
	 PmiTsK7zmhCycrDBZZeIMORSLm0g6HJaD1dbzW+65dEgk88D3weDOhMajShoSQpTn+
	 KvDjbeok9ezhA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 10 Sep 2026 20:00:41 +0100
Subject: [PATCH 2/2] kselftest/arm64: Check for -EPERM not -EBUSY in the
 locking test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-arm64-gcs-lock-eperm-v1-2-d88e51855c9f@kernel.org>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qLblgPZW15ywU/QuTyo4vd/prNw7+Tn+C3xZYVdlpxs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqov60kFQTmlVbWbkGI5xS9oIPlfeF2zsG5e+Nb
 x8/8oaAuxyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqL+tAAKCRAk1otyXVSH
 0KFUB/9HtIQ8tQo/WvM6NKR7U1gCDJ5In9ka3Kf1i4j03qlOTRHXo8jJ0UxzqQtoCOUUt1q9BR7
 Tzei9xC7l3ZXnbes6SiH0fZz1jM4IgemcUX9VmVAG0lNwPMCmMo4ZyISALw4SL8YbSwnS4kpgyJ
 yi21AOTetMRwbyzN9XEEt0Zk6ZeZxvuqlc/7DSid1GeVbIv1p5G54d00UbY6mqhiUSbbtwNbD4I
 paplYyVttspYNHNnGx7knntDVsg0pyhqyhesKgNTxgLLhfwe1d6zTUqmqCIfxRMX1qVFYA6K4mZ
 ajBQ2XbefqVCOmxbi8Ki+enyxJpRarQpWQgEHOHwdJ0bXe2a
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

The API has been updated to return the more permissive -EPERM rather
than -EBUSY, update the selftest to reflect this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 1e6abb136ffd..f780f0c7b8dd 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -115,7 +115,7 @@ TEST_F(valid_modes, enable_lock_disable)
 	ASSERT_EQ(ret, 0);
 
 	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, 0);
-	ASSERT_EQ(ret, -EBUSY);
+	ASSERT_EQ(ret, -EPERM);
 
 	_exit(0);
 }
@@ -131,7 +131,7 @@ TEST_F(valid_modes, lock_enable)
 
 	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
 			  variant->mode);
-	ASSERT_EQ(ret, -EBUSY);
+	ASSERT_EQ(ret, -EPERM);
 
 	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &mode, 0, 0, 0);
 	ASSERT_EQ(ret, 0);

-- 
2.47.3


