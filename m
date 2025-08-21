Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F49CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=da/8blPdc7an+kGARCdQES/DHgSzQkfS6RaqdB41Veg=; b=aprYRQ5zDdrRTsJXpJzsGZdFZI
	F4BICHanJ6U91nhfPzJAnJwKooW8oyl9xvbNGDU7Be7q/24og9qcbZJlM2NcSniLxVSVH4mVhR5Zu
	bV5Vh5Qhc9wAfVOHdmwZfxdXSust+86afxVtFPrYUJOUabDgdUWZKGi10HtFulHSrwAlSz+f4lee1
	rG9qiJnhutO9kEaAJzra1pCUg6SuDdoyr3a33ACVYVQRsqRGLo5qxetNegU0ZiwpNaUCrn5LScL7M
	fiGKV7PbdSW5SZgZAhsxyBB3Md3atX33cvyIB4X+RfMcGJe9T5KfRlgX1yUPfWcyuXgjBUw47fUmz
	5vIb6JMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAxQ-00000000J7j-2MID;
	Thu, 21 Aug 2025 19:28:20 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6yV-0000000HJwY-14Xa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1755789186;
	bh=6EpRJ0Xfy+QCs9ctVXp6cVbyBNBAtx5211b7njYkhrs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RmuQ0Fx8PSY+jFpL9QaWEv+rmRSQFMwzxujYPwDofuO7aO4a0NGmy6IP9y3EHo3tE
	 bZFRGIzus5kUT4WITHxwPbVxf7OA6g2tg4vW2Tv78goo8B5SI5jSCUamkTU484slwU
	 fKwYAKLz1AvEUyy70SfybLakPNRkhz14Z9Jwr7DU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 21 Aug 2025 17:13:02 +0200
Subject: [PATCH 1/2] kselftest/arm64/gcs: Correctly check return value when
 disabling GCS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250821-nolibc-gcs-fixes-v1-1-88519836c915@weissschuh.net>
References: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
In-Reply-To: <20250821-nolibc-gcs-fixes-v1-0-88519836c915@weissschuh.net>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755789186; l=984;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6EpRJ0Xfy+QCs9ctVXp6cVbyBNBAtx5211b7njYkhrs=;
 b=11Pm092QniwA1C7akmN/woe12MP6+ssB98JgfCEkl6lfy9QfgApnV3kEZCvBBgBbKkm0rjuW0
 AXoNaBLBMTfAWs8kkzmX7fq7gdjKCw5Is5MNRGwyWB8EFR51dmT8Ph6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_081311_441112_C8AD58FC 
X-CRM114-Status: GOOD (  10.49  )
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

The return value was not assigned to 'ret', so the check afterwards
does not do anything.

Fixes: 3d37d4307e0f ("kselftest/arm64: Add very basic GCS test program")
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/gcs/basic-gcs.c b/tools/testing/selftests/arm64/gcs/basic-gcs.c
index 54f9c888249d74451e1432280a395156ce72e56c..100d2a983155f7347a19b2b8b88f9494dc6a51d5 100644
--- a/tools/testing/selftests/arm64/gcs/basic-gcs.c
+++ b/tools/testing/selftests/arm64/gcs/basic-gcs.c
@@ -410,7 +410,7 @@ int main(void)
 	}
 
 	/* One last test: disable GCS, we can do this one time */
-	my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, 0, 0, 0, 0);
+	ret = my_syscall5(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, 0, 0, 0, 0);
 	if (ret != 0)
 		ksft_print_msg("Failed to disable GCS: %d\n", ret);
 

-- 
2.50.1


