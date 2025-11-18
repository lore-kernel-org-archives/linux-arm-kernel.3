Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151F6CEE33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=; b=qJ7aBTeeeqj3WPviEcbErIt1yb
	ncBBD/RdyysB9GxeOogHKQrnnOee/aU0AT9hIwV/aMntjR98M3r3TuvQ1LETwNslHt7zsj0GiG5Uh
	CaOIst6bVDkYVyn8e1vFIqOyj5dUZ1HUi/xih7sKE/Qt8t2SJyw4XhDj/KmHLmjWYlKi9bL+dDiAk
	aoBI5sIqpyDUxgY73unVfE7mG8n+QOA+GcMmL3UUE6RABrUiBkYxKcMGdeSmYIDU3vDcw6aWxg0Wr
	0qC5VLE586jRb2HFeSr5WmNsO+ZtgRz2kqHhm6b563zhtUXSvFJ4Qpcv1/iNvHpeovnJK4jQQSph3
	8KOmgeYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ7-00000000jVY-46rl;
	Tue, 18 Nov 2025 16:28:25 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ2-00000000jPp-2JXr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43164105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483298; x=1764088098; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=;
        b=CkBWQa7QxZyVcEb4R/XrUraCSn1XPSTUP8CU0DQ9bAitsEwxYRSOLekL550Ak8249R
         7i+KcDiR79noh5mrVYQpdsO8Uv7KAoGrMXlbdrxBZkjba3ALU8bhFr7h3ho6sTJM+bqO
         by//znJ3VmBrrx82yBOUWNrhH+P/ItEE1fI+uinCugjn/oQNnDXcJr5MKlQPm3n9vA3A
         bYqREtu2W8x6vKCok2I5wy8X3Hl7390+Im8rCZvS/iJxa615M7tvpvdGKqo7b3OPl4dX
         0jdpc+Y8t4fGGYixVuMvhc5W0N7nP5FTaGorIADoK6w7sCOjS14l4247KWYRrH9dYDPp
         DLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483298; x=1764088098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mAj6+rTtj7ATosP9M3WMDyWCja/Ic0j8s2EkvfB39Kc=;
        b=T0npvpXLoDgQl0KCNxZtvyAdC346HHDTsQTw044Hz581h8t+36DKerp+T24zkW54qC
         dFXfD7I6J0+V+96ykeIuHRQBSsNX+GiL1O0zV1BPSueDq6ZDdbWt+T6xAqj2HF4OWTy7
         mxuPthWYNdb5NeKS/O+0/pAcLX0s9JDXaz0sLDipNjdKhclcLijt0F3/5xHt/TrSLgPP
         dQjCsnuBvznqUJwWXrPigf8J3XTQMMv5e8YRZaGK+J9yueSoMJ9VwWIe9i6xpvqzTDZ5
         hfswUKRBWi0OCmPMP4wSJAEkpcbUDwbLg7cFaRCQ0HgxezPYrCqv5COsRwNQ3H/qw4Me
         rFEw==
X-Forwarded-Encrypted: i=1; AJvYcCXWVLTsgzflp3XHamn4NBb1P6JQAlr9drlyM35E6sIQp/eJVMQgLbdCjCU+QNTL9JKJFBWk49YqFxuZ1+R7IRTh@lists.infradead.org
X-Gm-Message-State: AOJu0Ywflnpe8p0J4dSRPcan/Ofpg1xwqSgKcFSVU+nTOr+oySOxrGxU
	CfAWhWYe/BB3SQjEm9VW//SRPI6oZLCg6qjE9S52ckEbtM5elmFW9/3cHF+t0RfiRd99dkjM2L4
	UVlbrj74=
X-Gm-Gg: ASbGncua6f1tKwrh99dMcai32mcQcj4j0Tq9q7Pda5W2XJFVr+JlmS/Ec3wuYpglNeY
	jtFjYfvsi1BVxFYJW6cMANqlxCL2IYnmB0HzsXPASra9ooosG6ixfMy19qjUEclzaJD5RoKIfms
	dxdUga6LptxyKyEgjsCGS3XF3XTOnDovvDEhIyH7p3tsF80xjDGHbnLs1Vy3fbEoqN+/trPTLLY
	1qJopR8kKRFtdoQ5rsIhGbDSbGUhjeLq/awfS3rjGddaoiiFL2mMwg42DcnHov0xPR0/rvXQboS
	VBxRmDDDqKE0rhPxanz1YQrue2Qe5SlelevfTaoDtJjUDd9MFMe68M/W8nOwRYfldH/FO1+axY2
	Q4zP3j0f1hIxWMz3bH6ihqMTC/NfSpUrFNEfeTRmNVNbMHHmthpBFq5nTr0cOv5CoNBLueinAlW
	3IpqeSKHHRrV3O404BFP07
X-Google-Smtp-Source: AGHT+IHdkgwTmwsezlOoVl1oKxZpwdtFrPVQJMsdiG4hR9IlMAHY8woJY2B8eC7OmFl51DiuSqqZBg==
X-Received: by 2002:a05:600c:c178:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-4778feb2401mr149231795e9.29.1763483298511;
        Tue, 18 Nov 2025 08:28:18 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:18 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:27:56 +0000
Subject: [PATCH v5 06/13] coresight: Interpret ETMv3 config with
 ATTR_CFG_GET_FLD()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-6-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_082820_614702_E2720D50 
X-CRM114-Status: GOOD (  18.21  )
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

Currently we're programming attr->config directly into ETMCR after some
validation. This obscures which fields are being used, and also makes it
impossible to move fields around or use other configN fields in the
future.

Improve it by only reading the fields that are valid and then setting
the appropriate ETMCR bits based on each one.

The ETMCR_CTXID_SIZE part can be removed as it was never a valid option
because it's not in ETM3X_SUPPORTED_OPTIONS.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm3x-core.c | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-core.c b/drivers/hwtracing/coresight/coresight-etm3x-core.c
index a5e809589d3e..4511fc2f8d72 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-core.c
@@ -28,6 +28,7 @@
 #include <linux/uaccess.h>
 #include <linux/clk.h>
 #include <linux/perf_event.h>
+#include <linux/perf/arm_pmu.h>
 #include <asm/sections.h>
 
 #include "coresight-etm.h"
@@ -339,21 +340,22 @@ static int etm_parse_event_config(struct etm_drvdata *drvdata,
 	if (attr->config & ~ETM3X_SUPPORTED_OPTIONS)
 		return -EINVAL;
 
-	config->ctrl = attr->config;
+	config->ctrl = 0;
 
-	/* Don't trace contextID when runs in non-root PID namespace */
-	if (!task_is_in_init_pid_ns(current))
-		config->ctrl &= ~ETMCR_CTXID_SIZE;
+	if (ATTR_CFG_GET_FLD(attr, cycacc))
+		config->ctrl |= ETMCR_CYC_ACC;
+
+	if (ATTR_CFG_GET_FLD(attr, timestamp))
+		config->ctrl |= ETMCR_TIMESTAMP_EN;
 
 	/*
-	 * Possible to have cores with PTM (supports ret stack) and ETM
-	 * (never has ret stack) on the same SoC. So if we have a request
-	 * for return stack that can't be honoured on this core then
-	 * clear the bit - trace will still continue normally
+	 * Possible to have cores with PTM (supports ret stack) and ETM (never
+	 * has ret stack) on the same SoC. So only enable when it can be honored
+	 * - trace will still continue normally otherwise.
 	 */
-	if ((config->ctrl & ETMCR_RETURN_STACK) &&
-	    !(drvdata->etmccer & ETMCCER_RETSTACK))
-		config->ctrl &= ~ETMCR_RETURN_STACK;
+	if (ATTR_CFG_GET_FLD(attr, retstack) &&
+	    (drvdata->etmccer & ETMCCER_RETSTACK))
+		config->ctrl |= ETMCR_RETURN_STACK;
 
 	return 0;
 }

-- 
2.34.1


