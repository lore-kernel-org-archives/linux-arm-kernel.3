Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D270C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Jun 2026 03:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Date:Cc:
	Content-Type:To:References:Subject:Content-Transfer-Encoding:Mime-Version:
	Message-Id:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaDRtHNksBp8HzdSWMeH/ZqouUwL9AyNRTvyVWjch9k=; b=CaltJyH4A7X+ekemzJ1XEV/Vnr
	bQ/AFWq8hfDmnBj798RaDZIYPSCBFZu2vW2xWpRtWthvA0Pw8WcIUS87kXc68zdvQFEENB+LGFqA8
	J4awKuvdUcFh+OFwXM2cfPSHj0eWcmaWA9Gu3vrYI/C+OB4dnDEvWPq/pageoQ3UOIoEWHUzuTnVK
	4cotzrPif9O049t4jm4nTKBLyKDfbbUmqFTAmud7ju/j3sb54+y6mOhiVbIp0++311vmeV7lbaz+e
	J5dEGpJ5m1DMVf6Oq2X/IhFwKGQSX2ohg/XS+EsuZC3aaj4mZ4hMiXuTF1Thlu2riwc/5zmTFMAyZ
	V+03JZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdJdW-0000000C6KU-3n7v;
	Sat, 27 Jun 2026 03:23:18 +0000
Received: from va-1-115.ptr.blmpb.com ([209.127.230.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdJdS-0000000C6K7-20G6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Jun 2026 03:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1782530584; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=JaDRtHNksBp8HzdSWMeH/ZqouUwL9AyNRTvyVWjch9k=;
 b=a7l1dtQFFIdUJGTYAu0dWZ8R7wwFtJZLDqXJlzQJhnqoCLuBQ9X6S4bqjNXFeqB8ywvlRT
 IQEX9IfeDpRCJMVTYn35ZzuNCq4AQfW+wFB3wUetRkmZ/lvtJsu1td/SXgFrA7oVeQpKst
 mnhDTUN3e5yBQGyAIDAMFs2ZIXqooWyi4UzAnMmsdthx/T7DKx4K+T7i7FIqvhuVS9YFup
 N5RxpRVsZY8jRormmRDRUNX/flfAiN3uR/Lmiek14w61yiWuX+2s0grbPuQhs4ttrSjGf3
 E3xD2piuQIJFDkj9JVfkuY3deIvuAHw9km22Va5Vf8EvzPgsBjjcTphnNJM+GA==
From: "Yijia Wang" <wangyijia.yeah@bytedance.com>
Message-Id: <20260627032259.2086191-1-wangyijia.yeah@bytedance.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [PATCH v2 5.15.y] kselftest/arm64: signal: Skip SVE signal test if not enough VLs supported
References: <stable-reply-item017-arm64-sve-resend-20260626@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Original-From: Yijia Wang <wangyijia.yeah@bytedance.com>
To: <stable@vger.kernel.org>, <sashal@kernel.org>, 
	<gregkh@linuxfoundation.org>
X-Lms-Return-Path: <lba+26a3f4216+5a443e+lists.infradead.org+wangyijia.yeah@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Cc: <andre.przywara@arm.com>, <linux-kernel@vger.kernel.org>, 
	<cristian.marussi@arm.com>, <will@kernel.org>, <catalin.marinas@arm.com>, 
	<broonie@kernel.org>, <shuah@kernel.org>, 
	<linux-arm-kernel@lists.infradead.org>, 
	<linux-kselftest@vger.kernel.org>, 
	"Yijia Wang" <wangyijia.yeah@bytedance.com>
Date: Sat, 27 Jun 2026 11:22:59 +0800
In-Reply-To: <stable-reply-item017-arm64-sve-resend-20260626@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_202314_763664_5B3A0BB1 
X-CRM114-Status: UNSURE (   9.58  )
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

[ Upstream commit 78c09c0f4df89fabdcfb3e5e53d3196cf67f64ef ]

On platform where SVE is supported but there are less than 2 VLs available
the signal SVE change test should be skipped instead of failing.

Reported-by: Andre Przywara <andre.przywara@arm.com>
Tested-by: Andre Przywara <andre.przywara@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20220524103149.2802-1-cristian.marussi@arm.com
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Yijia Wang <wangyijia.yeah@bytedance.com>
---
Changes in v2:
- Keep the commit message aligned with the upstream commit, as requested by
  Sasha.
- Link to v1:
  https://lore.kernel.org/r/20260626-b4-arm64-515-preview-clean-v1-1-ad19e286e322@bytedance.com

 .../arm64/signal/testcases/fake_sigreturn_sve_change_vl.c       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
index bb50b5adb..915821375 100644
--- a/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
+++ b/tools/testing/selftests/arm64/signal/testcases/fake_sigreturn_sve_change_vl.c
@@ -6,6 +6,7 @@
  * supported and is expected to segfault.
  */
 
+#include <kselftest.h>
 #include <signal.h>
 #include <ucontext.h>
 #include <sys/prctl.h>
@@ -40,6 +41,7 @@ static bool sve_get_vls(struct tdescr *td)
 	/* We need at least two VLs */
 	if (nvls < 2) {
 		fprintf(stderr, "Only %d VL supported\n", nvls);
+		td->result = KSFT_SKIP;
 		return false;
 	}
 
-- 
2.43.0

