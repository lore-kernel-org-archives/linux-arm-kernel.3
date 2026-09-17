Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31C9C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5MKnFWN9qx9mGZRE5WM7kRDAqIAlnqtk7MFAHNTkMdg=; b=h+WmXv3pwZTaabo+RbpIqSjxcZ
	I9Vs0UvNhkuOIeaNbCwcM6Wud+jNJq77XAgIfcOkYeQMLypKu5nlY6btJK33i4tSh71V9tTM2vyl9
	vJmWv6INi5wTqS4Li28IY0jRQUhA82viS046Pf9A9SFTpjsNx3kh5xN48qMcoo3ZwCSlSXYopZFsE
	k2/XHYjfLf4y6zLPbNt9Y14oiO22HOaa8d2vuH3tApJJtU8sgsTFqRZxHZH6mrpwuCoEhdyLU+P8i
	i/O3lGl12HPY45J83tv9PesYC0mDjFYhVSH0VkOfb207DJvQWbvv6svaSKGxWqnRVD8rwoRQy1Wqu
	wS5C5Njg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7C4L-0000000BOII-0d7E;
	Thu, 17 Sep 2026 13:22:29 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7C4I-0000000BOHs-2ny4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 13:22:28 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so4664565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789651344; x=1790256144; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5MKnFWN9qx9mGZRE5WM7kRDAqIAlnqtk7MFAHNTkMdg=;
        b=E/lYIPhnjQtfsiYwzV7hgrkrLtCtblm0FgObWetitTYbdYms43RDGpNgUnS9qzgtYL
         tM+nd56G05J/3i83J99SKSlEVF2fc9Tt+hCTMpcpBMExHnQ6oxqgAJvFb5qMylhlPGpR
         ptXFsiO3BWy9GGrQ6ClxYsTz/QNECghywxaGrekLsMJoullso0I/y6PSmAwrvJJ04fdb
         8DTWXBGGLZP4xQgv26fhM4EBfR0uv6PAcnO1eBjydqP7sosHVFg8IvkMV8TEkYfShdn/
         XNJ5rIf2HDfjTWkoiQmiSdJbSIityE7TzxZDAFvpz/50VOJ0Do3dkXPKdhzWdhdZGcX0
         XqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651344; x=1790256144;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5MKnFWN9qx9mGZRE5WM7kRDAqIAlnqtk7MFAHNTkMdg=;
        b=TZ9dB4guDWUboL+Wmy4EF/tlcl6A/oOp+ncK8HtGFmF5AnvZaD2hB8UhHYGCZDKymD
         RoaCDYlSAXAcgR0b4dJp6Wo91RwumQ9DPm6VWE+VS+aFWe80tVbsJqMj815zENwoXRIq
         qDvlCOQI8WFRiC220NJ739ecDfPpEZ3uKjRZkDWTaNR+Mhf9NUfLX5l4rJfVMeZTHjeH
         71SRnM78ldZGTlnjGJY+bFpC0565uppPbbpBVyCDP8fu2c1QjoFQ3N+4E4mATXsmDebq
         7aQAHWiaxla+SBU8zrF0ON9m7LLdxPGW4WYHYkRsRERBd/el2UdtsRrO8myrDUGEGlwx
         x63g==
X-Forwarded-Encrypted: i=1; AKwUvBxbB7FGKE1jJjh5ZQdCI1McIWldoiqSKKOejAz7Mq2iIEaipYz3oEuAOwgXFLY2WzA5oTkFEuzr6/0SrWXR5Cfo@lists.infradead.org
X-Gm-Message-State: AFuF++l3LI7Z5vKIDJkS9rqTjYhLoQUuMsXIQTmdxWk5VGxJohGzX/Jt
	WEEisaeFmBaiHKwdDox0VI6uswT7Ae8KvRUs1f9p1YSC7+Ix5s8Ibp4SvM8i0cV9wi4=
X-Gm-Gg: AYBFou1P6+VkYBoNxAtKywdshZfUXOSIwELWVjoYA5SNXsppiw8F3lP0DRwO/lNfqWt
	Qn2qGfzO7SBAlhBkdS+rmcRbgO2Vm/OMqoZK518P832ZizivbxytIoYTRpN+WB3DEhFNJ1IxYFC
	njGwBS03PREX5Xj612/GckcrcWAKxLbhhCO+KzmiYDQuYjt67tiNNinspyHUgPM0+HSKnqsMXrO
	cnjuTDEgwj3GER0HChrBau7JkLpS2UP3cz4dK8rXeoGzcpZQgbcv7vptCGCNWOFtWW1Mz4ucq5+
	/yQDAZSVgy0ncrO44+mh9D20+GE9yTZxGqseDmSaSKDiAkwEDnhiVZw5+s0Df480mRLKWrblN9O
	D8fcMPHDJySit4kVLt+MO3dT287uMIY/rDgk87fSPzeJJgsN7/ypM7IqOlvRAg4pEhlkByNTiHA
	5Dd7SdY+7eet4EKR+LE2Bihd7VavTdPHBg8SCRoeLxvwyrFrmsgPZhBROFsHaeKur0X2aHjO2/m
	OjmGmcAeYAhvyuu89tKscohd0LGuOea5eATS2uvj1N8cXBnpoaD5F+nKI/gDQ==
X-Received: by 2002:a05:600c:1f96:b0:49e:69f8:e846 with SMTP id 5b1f17b1804b1-49eb72f24camr77387205e9.9.1789651344230;
        Thu, 17 Sep 2026 06:22:24 -0700 (PDT)
Received: from localhost (p200300f65f19a904f3e33dc315acd8c5.dip0.t-ipconnect.de. [2003:f6:5f19:a904:f3e3:3dc3:15ac:d8c5])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4870bf43511sm14694856f8f.33.2026.09.17.06.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:22:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: imx: ele: Fix build regression
Date: Thu, 17 Sep 2026 15:22:14 +0200
Message-ID: <20260917132214.730485-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Per1jZ1d1Lf3zgdYxdHohCYxufw3TO312eIQjnr6DnE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqq+mG46lHd7s4WQMlUWc+6papS+Jbf+ailCMHL 3GW5xO9x1aJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaqvphgAKCRCPgPtYfRL+ TqzrCACUxM1NzLVAQkHJXl8Aov7WYS6BVYFamDV+o6sCbfb8nngTfIoLs5W8MwdPRcISJ0ueu5i icIkxSIkjbIsWrSGJhlRX7CmRFtrfZJjIjhuNTx3zYS444vTZuocabhds0Hcp0oV4lQZSDUxRpn P1EZxp1DLTKfuV4MNiAz+d6w1KBF0zSC1M++Io9ckYWGcdda9+5Pk5M4OZPu1gVtL+cRSj8Hfda wo+ausyLYH3sMnmi9ujtJqk5oxYLRyENZGILHyk6RYSfj4cnEeu/Kd6RZasjPdqyt4+3ekfcYp8 4353PLUliT1YjyZLh7V0Bz4OxuCX7nHmRR9T0ljKpI9+1xs1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_062227_012187_F4E18B9D 
X-CRM114-Status: UNSURE (   9.88  )
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

At least on alpha, arc, m68k, powerpc, parisc and sh the header defining
kzalloc isn't transitively included in the driver yielding a build
failure on these architectures. Fix it by including <linux/slab.h>
explicitly.

Fixes: 7560ad03bbf4 ("firmware: imx: adds miscdev")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

the referenced commit currently lives in next only via
https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git for-next
. If that tree isn't stable, the Fixes: line might need adaption.

Best regards
Uwe

 drivers/firmware/imx/ele_fw_api.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
index 42cda7de66e2..a3a68234bcb1 100644
--- a/drivers/firmware/imx/ele_fw_api.c
+++ b/drivers/firmware/imx/ele_fw_api.c
@@ -3,6 +3,8 @@
  * Copyright 2026 NXP
  */
 
+#include <linux/slab.h>
+
 #include "se_ctrl.h"
 #include "ele_common.h"
 #include "ele_fw_api.h"

base-commit: 7560ad03bbf40f5b89e210bee2dadb4be20efc1f
-- 
2.47.3


