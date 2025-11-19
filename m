Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A16CF3955
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=; b=EKCEiyCinZhM9tL3ogSwf9+2Qd
	FPa9+/9MzQfu81ziOgSxzXwxbWRM+ypIjHSLb+LcuxZs+jMYzGYFJdPK9Za8N4KvRXpW15AyDRByO
	BSx+UMFq/Yv56ZQ+A80BQjx029WjCbYFlrG13n73klhvOU2VzYNNDgswWpyWXL80/vzdqwdvI4TOj
	OXd1nYDmvUI+mo0tfwcRAg1TfksV4X6OvmD6etN3eF3HdEwSIl3H11d8QKpfSzdeoVlcSsP212Hm6
	r/00cvjQNy/0RdMkCBkHD0nzSuJwOPhHrSAgiB+aZ2UwWPhCHBYL3sPOQbQ6vHQ23v8osNydb1OT7
	rBRQZ1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt2-00000003exd-2dp4;
	Wed, 19 Nov 2025 16:18:28 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLksv-00000003esT-3Mq6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:23 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4775ae77516so75641945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569100; x=1764173900; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=nfZycpR9v+kc3L/X/L+D68XmrbkfEKaFo4s/RCwSduxQeUa9r0W+TQIpsLBDUDCQs7
         hNgOWvStvsfsZNMRRCtKfg0GsAojHwE9BW/TKSU06Pw35VbOJXgi+o9A+5MMi+FP4BYj
         nRhPKM4h67Jb9QN9llj9x733aOszjjeZ8jg4C63ImsTSGXZhz0MeVX1SmfV3/osDH5WS
         jufGnPLEazeMa6hfJD+NHpTo0L8c+yGpZqwFbVq9Tk3QYn5Xv7vbE6mmb3ntyGy24fc+
         0yhxTgsYHEkWeLOL2kGoT90Ve6+XPAwAgC44G/1dGyer5UrgFM3/TCyAZ9MA1sD9Eu9T
         yFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569100; x=1764173900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tUoArGeF29Uq9ud9txzEkP+4OSzrCHQVStRpO2mMVQU=;
        b=IsfFds80v4BQtSgQg3nNiV7+OAf4phCusYBTOa5rC4FpGr8FC62NnfUkdEWOYLOwBt
         BzSjxdIZl+WasgAWlIcYG+lepmsdJKk46Dto6aIes1DyWfPpu9+6bmz4FYYne2AehdWn
         1+R6LDFjLdhhuJsKEf7PnCOqqvtGST0860eBSlVKjylfxw6I0hPrN9PJzf/+F0Gx0aqf
         4N1dMvylLaTFItX5FIDwE6omDa7CQoSNu2Hidi0RzP4za0yGG3GhQAENBsTpgDZrft8g
         TRXPICa4tMarvc1xWPZ4nWtOf/Gl1IS3WjFEsD9YUajp9njAiBoDsGx4aJbnuS8+Q9SB
         e7Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUx8m4hM40S5CF/kEFHBviDMiWqOrRQtKrL6T2GM9mCrqGO2OHHCA6ckM8FKi+nIsnBYglePeAWPpb760j40toG@lists.infradead.org
X-Gm-Message-State: AOJu0YyyzV4UaIE6aBxTUb1oO0Dpg21iYk2BpCOcY3CCFX2ZV4nGFK6g
	uWePi3nT4B7RvD0h6I0orbdhkcHveMCuC4eTkWx9R5gb28WscMdCdx/1T23IJ0hjByM=
X-Gm-Gg: ASbGncuOTzYWXh5z0NNZcKxxENXHgAxzG9TWX1g7SnW3UbqarBUaSQMGW0uffhqI4lg
	AqWuPni4OszgHVCabJ6AVmTxj6Is/49N228/wBl7rlNesWMRMLCQqnG2p8bhX6GQGE9aKRt3A1o
	JkZl81yu8+hVAzT3/UnMuLxQITxJ/Ek9A0pFmyGneRWUFnLpcObaSPiyDj5S2floAzdRCr9lru5
	o7uHKo1uoYKa9lrSuR/OmwFTF88eVf8T1XNUAVBGv8h0ZbS6jjpJy/nwm1BclalV9iFJXi5GLVf
	HpVoqls7xS+pbBWprI4XsiM1DP+TWW1ikKyasHPlq57wfcPKb3Rs67sXWc/tL1NiejDHV/9fefp
	a9ztvqXhydRD9PCTfKvzASCe48iKb0LGZjAFeIoySHPViHOUbaa6tk062wey4GN/vPCwHPpZkaF
	7nFAo8d2ljkWYlEY20ftITjBMkW1hLygg=
X-Google-Smtp-Source: AGHT+IG5zkbyvNDDF+/srY2VnksVzVbMRA7ZXXnfHsHEkkB6nqJQFj2bl5BZT9jLuHwXG4/EzZQ6RQ==
X-Received: by 2002:a05:600c:c4a2:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-4778fe9ac28mr192001055e9.21.1763569099997;
        Wed, 19 Nov 2025 08:18:19 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:19 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:17:57 +0000
Subject: [PATCH v6 01/13] coresight: Change syncfreq to be a u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-1-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081821_850512_556E3A31 
X-CRM114-Status: GOOD (  12.81  )
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

TRCSYNCPR.PERIOD is the only functional part of TRCSYNCPR and it only
has 5 valid bits so it can be stored in a u8.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 012c52fd1933..0287d19ce12e 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -825,7 +825,6 @@ struct etmv4_config {
 	u32				eventctrl1;
 	u32				stall_ctrl;
 	u32				ts_ctrl;
-	u32				syncfreq;
 	u32				ccctlr;
 	u32				bb_ctrl;
 	u32				vinst_ctrl;
@@ -833,6 +832,7 @@ struct etmv4_config {
 	u32				vissctlr;
 	u32				vipcssctlr;
 	u8				seq_idx;
+	u8				syncfreq;
 	u32				seq_ctrl[ETM_MAX_SEQ_STATES];
 	u32				seq_rst;
 	u32				seq_state;

-- 
2.34.1


