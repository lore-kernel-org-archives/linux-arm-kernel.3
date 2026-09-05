Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3676AC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9qSf28+gMU1cPc/sgLS/ZHLrlXSMGyx8oSsqQzyWeBs=; b=LQdVahJQkygZApGSezY7Tvn03l
	O5BeRB9roJ8fc/fYx3YHwWMQLcmwZYLQsMgsBVma30CnN+drGc1nByMcnid8OmlhHEaq8uZvN8mPJ
	9bhj1fJ/VJOB04xVsx6IRcWLQdE9owc1lKHn6uHZGc9B2WIgzrYXdBSooG4840a6SLsEG6+O737VR
	sSHQD2s63f+qZWesCx+MuEDkDIAroWc6x555PSCCb8j0OHP2a4RALL+gGJwfvEn9PKPVzNG72eSAI
	lPCLKE7Hr8RG/bS2/nXpZhfvTFgUm6OKTEQnkU2nonHpGXuW9jtLjz2K1jBqCkXy00wlRkEOlT4Mw
	R+w0n+IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mq7-00000003uvo-4ByJ;
	Sat, 05 Sep 2026 09:37:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mq6-00000003uuz-0Znl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:37:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d9004f39d3so22962545ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601053; x=1789205853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9qSf28+gMU1cPc/sgLS/ZHLrlXSMGyx8oSsqQzyWeBs=;
        b=lOC2IkTcOPRPwqPSoREDIengzhbwazXVkpUyc+XU6+eoOViwrlV+FS6x+z8b1q12qO
         BOPqQGqGJkRDfXBKPotlK0dQ/DJtJ/9OugINhn+134nBcXrse5wh0p5DrKxAJ6T+w4pS
         I4sQlMEWk7iY9juCAyBikawnTu+6kct4IwrxN0iWUHpKJ9qtlAWevMOkONnGztYA0juM
         wgMXQfRw6YFuu0ivWL2JBMxao6gl1fxTSOzb2005n2ahjipk5tJCP21yEhnmuy/eNFXu
         XHod8fnL+d2PVk+8q4bT5qKjlJ1jfslhOUFF5LnztNXFZhQS/lF2Ud6ktOQg6QIL6iLP
         +j3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601053; x=1789205853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9qSf28+gMU1cPc/sgLS/ZHLrlXSMGyx8oSsqQzyWeBs=;
        b=NsVNmvkTxBJs990CiPHderE90BXcqOI1m326XcIShFEbVI3Qd7q1We+Tm07VOKrt//
         zOapBiKEPQpRqt3K0LlbpYNZQLhc1Mx2V7z4tLcTXKxapJWUMn1K0Wrsysx83VqSOy56
         6pch61GUiczfg1VT3Smn3yS6smhEuFZwI2jpXYFx9+vC01UTBmfqvWjDJTGDJaMaC+O6
         OB+VpDqcvRKcyhoywqzth6ngxPbHJcbVp4dnuFd2ZKk4CxYn3o+uEhN8KBNXvYzIxaZt
         RLhFy0Hn+/yp8EVuZmIDM8MJRwhwiWUjQIM0K7VxSGdCyvtV3Iby0ZaIT/IgbHgbJbTO
         bIhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBkOQis28ByirFuKDaXGlR04bou6N5/rrT6+GKG1kKqwrVTKsGx8EYNkeOsWe0KTyh7kZLDDzKlV1Jn2BNTl9x@lists.infradead.org
X-Gm-Message-State: AFuF++kERcDrlwte/tNcC7fsqXr/X/rPwsadVosLenujw74aUlytau2R
	Pt0oSKB0L1FF4b8Nhs2tDDHp7JcpJ98o2p6MdYvplF6GpVZhpDXimaGK
X-Gm-Gg: AYBFou3eoZmY9CSeZHzLg75CKjoqlgnqdyfy49iC3pT4+oO77Gv2/zHqdd0vSQo3XEh
	PfsmZvM3cGsj9BIIhqGhLRwj1DuzcBt0FCQqCMq9vZIX7i8y26VKWPpNiwN1gqr6deZ7BBR36u3
	xDTv6pgAaaNcKG1ZGywkTxE9Kmv6Uk6xrmgSPN7WeeHbTzMl3Ix6T8PpSZPyK7l1eKkIhSjp5nL
	m9V+UPHVh+12QA7tCTjmuEUU6TN83DlKJWMvKaejYl1raUBGdtcsoCIXlX1eYVCmqXJRJTifZrm
	au0GqmfdTfG2OKwDkrSQtOOh8um+7Oca2Y59wqOwLA9DBan4coSqLDerPES0vgFoFwG7mt0zwlk
	mF+uVH0VxKriEqa6ec8dppSvPmKCENok5yEuz1RlEacLMJWjsguU2fBa1J83uDxdyhirAAILHm9
	MU2WQbMQMA3J1vzSZYCGLDk9YaGFtcaLn1PSia71rcwXL1TO1EiFEjT4/Aiw==
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr16362724a91.1.1788601053217;
        Sat, 05 Sep 2026 02:37:33 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:5b5:60e7:9f67:1689])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d086adsm15763353a91.15.2026.09.05.02.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 02:37:32 -0700 (PDT)
From: mdshahid03@gmail.com
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH v3 2/6] iio: adc: bcm_iproc_adc: fix include dependencies
Date: Sat,  5 Sep 2026 15:06:27 +0530
Message-ID: <20260905093631.48667-3-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905093631.48667-1-mdshahid03@gmail.com>
References: <20260905093631.48667-1-mdshahid03@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_023734_177108_3F003140 
X-CRM114-Status: GOOD (  10.68  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Add the headers required directly by the driver for the APIs and
types it uses.

Remove the unused linux/io.h header now that register access is
handled through regmap APIs.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/iio/adc/bcm_iproc_adc.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/bcm_iproc_adc.c b/drivers/iio/adc/bcm_iproc_adc.c
index e46e3761993a..e54f613d266a 100644
--- a/drivers/iio/adc/bcm_iproc_adc.c
+++ b/drivers/iio/adc/bcm_iproc_adc.c
@@ -2,15 +2,18 @@
 /*
  * Copyright 2016 Broadcom
  */
-
+#include <linux/array_size.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
-#include <linux/io.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 
-- 
2.43.0


