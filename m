Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBA7CA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=; b=EJAlDIdTOF59grFduQNmSf/KnK
	oQ+gEPG8jwWAVCP7c/FmNMZl9QioLlbr1a5yPNU9Q14c7b+tfHdOFy+4NJSZ0QbcxpOO8tXh0qgJI
	vBTVBY8iAAcJaucLX4dqArndt6ZbVKZV0zJMBD5rLFAEuuM6Sh4vOwuyPLvX0Z0+dEsTbgdZBPScO
	k2CJMyg9AzGrcCDz+tDtvjzZIzeNhQUvhX4RxsNuvF5aGLXetuICZZCZ7abuqHc2dZMqfXElgA3j6
	WiJxoV+WK3fz6Qj3Ki1Fe4jJMY63FeHw0E6idfiKnPFCAgu7KQfHPUw8DqauU8CdEoPEtNqQ4nL8G
	NiSSF9sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulP2j-00000007BY8-0e1P;
	Mon, 11 Aug 2025 09:42:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOtX-000000078iQ-15Hr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:32:44 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b7920354f9so3434322f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 02:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904762; x=1755509562; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=;
        b=cWcOdWoE6zrGi2VaIDqRnB+tlIWBBfKaS3ToRkSZ5xf3zZnJisK30QfL95JNgo/Zup
         WK0EobiiaHIC3eQQytIr81BKY7qQo9vwg2vbYGoj1AYhFHjlofXGLC90OnNjwPC/s/0W
         GUWObHwjsW3Ugett2t5bJ5XiEBWEYMdskyjitUEP6anzE+7Yq+1KKvvy4WrnTgoqCwPX
         osU/UxG+7chNAaeXmPWNjhoypErSypqlYQqgtx3kHzpJ1X70dRw8l5baWjDEOf/nWM8o
         Uf3VJswQ+dymf15mDY4Uiwxe0rAkvi9msSZl2WUXyMHecqeN94CgwXnBXaNpnOHEjrwP
         L8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904762; x=1755509562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdeJ4JSRd2ijrq8xQhXxaRgP6MLKlDNmproFaVga4Ac=;
        b=t8EJKWDuZVCXuUUSr+B9oSYppTigYGNB2WcWnebuOe7Fbyo4hyDJS/rOS+393mxP5Y
         qV+B+VurPVxRbke4YZPhy7TVoWdtWhcb39xs7cm0lzEw5c+DrTU+T59nFImidEmr8w8q
         eW3OVvEKl0UNNNF3lkYCpWdCME2HvH0CVJ7RQpYm1mxJXBEFXUKW3+kwlKYpwgHTHGZf
         tNsdk3buWtjxULATAmerepStiBagJVu+qLfVH41QFMx/JOiXqfWckeDtPRZzFIDAFJ2m
         hqoI5IlNbaBuqcwW3TmYTuEO7IohWPsuvoXt/hnLwqg/47S3xoCPiEZWcO6tzheSAPzO
         gAQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAJ6gGcWjQJRW0d5Il2+pKVdL5E57DLdbNwoDtMSGacWlE+6vVI9xuPX+v81YlnejsV+p9kouVfHvJ19oL9mAi@lists.infradead.org
X-Gm-Message-State: AOJu0YwOl7zgSQqohqKZv0KDd4boRSt09xiaDupiSCGA0Z3x5tSGmO24
	5oZwGKY8mjcUtJAkSm0Yf+SCWQwmlWfDJHoZH2lYLlurz5bqQ9xUUgbFXWWq7GKis78=
X-Gm-Gg: ASbGncsVzYTYnb/VSg7DTUgZSfQir1Hy/4aQeprfyx9fN19I2YvJEMtlsszgaAxOvGt
	aZDBa2PCPe3GMV9NYppAKfRNUW8mlQXhuSXTRaSsWo8SisKQ+YjrFipAYBMobbYMAZ4uATbnNhW
	WlDGAhB6srareU0Fez5SOYU0l/1rZJho7Q5S1jqmFLR7LXNGO8mpXX4sciphAPROG1k4vD9MLXp
	t50RdQhZYF1DIjoNO3HYcWJtWyssTGwRkdyx7n2tgztJLIIWyBnpbJuOKKRfjNPPS/gSrn8fBXO
	g5MRzeon/w1ZKLy4ls1CzZ3ioq/WMEtU+zGh/Vcnt/EwxDcztm2snEEefxdSBrjj7RtfhmA4BYK
	D2ZMs6zyZHww/hRZMT+R9PCvhQhGA3Jo=
X-Google-Smtp-Source: AGHT+IF4rGypTA6LAa8xSMn4qKFuOrcs8J0oYr3jFggkDuO4RAE4D4QxeRDmMlz2n46JWmeJ8gWF6w==
X-Received: by 2002:a05:6000:290a:b0:3b7:9c79:3293 with SMTP id ffacd0b85a97d-3b900b8bf31mr8716728f8f.58.1754904761700;
        Mon, 11 Aug 2025 02:32:41 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:41 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:07 +0100
Subject: [PATCH 2/6] coresight: Fix holes in struct etmv4_config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-2-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_023243_302580_6EFB486A 
X-CRM114-Status: UNSURE (   9.96  )
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

Lots of u8s are mixed with u64s and u32s so repack it to save a bit
of space because there's one of these for each ETM.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 746627476bd3..a355a1e9606d 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -832,28 +832,33 @@ struct etmv4_config {
 	u32				vipcssctlr;
 	u8				seq_idx;
 	u8				syncfreq;
+	u8				cntr_idx;
+	u8				res_idx;
+	u8				ss_idx;
+	u8				addr_idx;
+	u8				addr_type[ETM_MAX_SINGLE_ADDR_CMP];
+	u8				ctxid_idx;
+	u8				vmid_idx;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;
-	u8				cntr_idx;
+
 	u32				cntrldvr[ETMv4_MAX_CNTR];
 	u32				cntr_ctrl[ETMv4_MAX_CNTR];
 	u32				cntr_val[ETMv4_MAX_CNTR];
-	u8				res_idx;
+
 	u32				res_ctrl[ETM_MAX_RES_SEL];
-	u8				ss_idx;
+
 	u32				ss_ctrl[ETM_MAX_SS_CMP];
 	u32				ss_status[ETM_MAX_SS_CMP];
 	u32				ss_pe_cmp[ETM_MAX_SS_CMP];
-	u8				addr_idx;
+
 	u64				addr_val[ETM_MAX_SINGLE_ADDR_CMP];
 	u64				addr_acc[ETM_MAX_SINGLE_ADDR_CMP];
-	u8				addr_type[ETM_MAX_SINGLE_ADDR_CMP];
-	u8				ctxid_idx;
+
 	u64				ctxid_pid[ETMv4_MAX_CTXID_CMP];
 	u32				ctxid_mask0;
 	u32				ctxid_mask1;
-	u8				vmid_idx;
 	u64				vmid_val[ETM_MAX_VMID_CMP];
 	u32				vmid_mask0;
 	u32				vmid_mask1;

-- 
2.34.1


