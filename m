Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0CCC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YUIHhtvm0/Mamo6SaAHfSISWc/5lM74W3X1NznWG2aU=; b=mRil+n5E74w9SB/lJ+B0nBYY3g
	y4KhoU6D6al337EGT9VuNbtRxRv0vgJvioMvPa5QY12c/XdxR0Pk5oIgUSlGE1qpcSEQav8KeAJR8
	AatDaCrkoShqbIhBxhZP05EXFZ7aYLhdCk6alZhf4d5fb9CvzZQQbfHqISuxFS56y38Uy+fAHUPtJ
	ZM1ccDxsa7qrwX1VmMgZcmtAtSQyvKyZgR3IP4PNJySZAbfq/5rL3z5cjCpuBgtONrWqnoz/djlA+
	GT6V4sWVSMx/APRiRfETHmj8NYyHehrAVp1F1EfE6l1yS8tl8jF8bX8ZYKjrQJJdm10fiSJiUUOgL
	EtBWdKGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQ96-000000059pK-2gIg;
	Fri, 21 Feb 2025 10:20:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPlv-000000052W4-07we
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:56:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F1C4168F;
	Fri, 21 Feb 2025 01:56:54 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 65E393F6A8;
	Fri, 21 Feb 2025 01:56:35 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-kernel@vger.kernel.org,
	Andrei Homescu <ahomescu@google.com>
Subject: [PATCH 1/2] firmware: arm_ffa: Explicitly cast return value from FFA_VERSION before comparison
Date: Fri, 21 Feb 2025 09:56:31 +0000
Message-Id: <20250221095633.506678-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_015639_116454_B1F1AAB4 
X-CRM114-Status: GOOD (  11.39  )
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

The return value ver.a0 is unsigned long type and FFA_RET_NOT_SUPPORTED
is a negative value.

Since the return value from the firmware can be just 32-bit even on
64-bit systems as FFA specification mentions it as int32 error code in
w0 register, explicitly casting to s32 ensures correct sign interpretation
when comparing against a signed error code FFA_RET_NOT_SUPPORTED.

Without casting, comparison between unsigned long and a negative
constant could lead to unintended results due to type promotions.

Fixes: 3bbfe9871005 ("firmware: arm_ffa: Add initial Arm FFA driver support")
Reported-by: Andrei Homescu <ahomescu@google.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_ffa/driver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/driver.c b/drivers/firmware/arm_ffa/driver.c
index 254aa57ddafd..a77bb205ff7d 100644
--- a/drivers/firmware/arm_ffa/driver.c
+++ b/drivers/firmware/arm_ffa/driver.c
@@ -144,7 +144,7 @@ static int ffa_version_check(u32 *version)
 		      .a0 = FFA_VERSION, .a1 = FFA_DRIVER_VERSION,
 		      }, &ver);
 
-	if (ver.a0 == FFA_RET_NOT_SUPPORTED) {
+	if ((s32)ver.a0 == FFA_RET_NOT_SUPPORTED) {
 		pr_info("FFA_VERSION returned not supported\n");
 		return -EOPNOTSUPP;
 	}
-- 
2.34.1


