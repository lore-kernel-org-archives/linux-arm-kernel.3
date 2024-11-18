Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2309CD43FE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 07:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGBxrzkqv227oRKatiTK1hbdP+UN67VHPWxn7DyvmWc=; b=mke16KyP9943kpVkmVr8cXcBuF
	4v/Flq5qMU9s7+txre0pfZ51YdhEsv4xz2xyTJqk+CU7aNzz+Xolcf2DyIk8K2w2wWtGExXgY88gI
	in+86Iaaq4JJWKWn7CpPaQKhlBV7ACc62FN2i4NEGmoLTscIoZhI/+W2D5x+6ukYc0vRVKfcXqmO2
	QrJsDoq3FJoowAcPNqAkxyhCEYC3Ia/998LQ5UMyXyyGzeRJNdfE4dDtwCEit3lyole7f+2q3kzi1
	YAIhZEgt7lksDYHAQ2EVodFhVhykiUGlNGkeN9kmX1985eI1OFX7P4sEUo0Uc/9w7CljY1I2izB0p
	RpCBjXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwDj-00000008eKc-0Xr1;
	Mon, 18 Nov 2024 07:30:51 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCwCm-00000008e3z-2vtc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 07:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tGBxrzkqv227oRKatiTK1hbdP+UN67VHPWxn7DyvmWc=; b=G+gAL0
	pb0dqUV9tF43gdvBkJmhhOpluwo5w6M5oYgedT720Ciuk4c9AJ6MNf8SiKQlactI
	0e7cidwmb3i7uafLWeD3JDe2EIIpafWSm9EnY7s17sB1ltss0tM7iPdFR4Y8SjKS
	Z9+CJxxUkUEwA0506d8zFqQaOpM+wDG1GKf1YFgGFzaVs4QiAun/VYTFzZLH62gD
	Zb+lKSZUBTC6Rh2vhZBTgzlGvE4xz0mwkzBIbt9RoUmn87IgkPyNN0GMunYg1Xri
	ysr+NkHzGbJKSjU8j2p6BfIHnL7yhZHGyRJsMlbXXUywYX+ATMUnQz+FEm5qFTly
	rlkOg/YnsCyMZiWQ==
Received: (qmail 112383 invoked from network); 18 Nov 2024 08:29:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2024 08:29:37 +0100
X-UD-Smtp-Session: l3s3148p1@y4MB4Son1NUujntT
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/15] coresight: etm4x: don't include 'pm_wakeup.h' directly
Date: Mon, 18 Nov 2024 08:29:03 +0100
Message-Id: <20241118072917.3853-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
References: <20241118072917.3853-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241117_232953_007381_8EE148AD 
X-CRM114-Status: UNSURE (   9.05  )
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

The header clearly states that it does not want to be included directly,
only via 'device.h'. 'platform_device.h' works equally well. Remove the
direct inclusion.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 66d44a404ad0..559972a00fdf 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -23,7 +23,6 @@
 #include <linux/cpu_pm.h>
 #include <linux/coresight.h>
 #include <linux/coresight-pmu.h>
-#include <linux/pm_wakeup.h>
 #include <linux/amba/bus.h>
 #include <linux/seq_file.h>
 #include <linux/uaccess.h>
-- 
2.39.2


