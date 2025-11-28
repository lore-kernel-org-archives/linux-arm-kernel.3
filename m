Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA21CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wCJgo3IXF+czdlE1yAyP50F+5uZ4Il24rpMbUbAKIo=; b=SipqfC0ByZnIR4JApFgEHOSwF2
	rkB5CfpRLNF3dbDcsJXbcZnFS2komcypPKbuZzB7d/ifDQKvEeBqyiy3+W7S7FS3RgUcRdBh+2RT2
	GQWJB0UnChQwuaGn9TMvzND0vaB26H4zsUbXtEVzU3se6LhanjWQLSv7ir/lSufFkzX+mnxQu0dBc
	Xfb3l5wNznEZmVhI5ZjFCieunaQ8CWQCBk56rVGL4xNsSgyTWwFT8vJl/SjiFfgqAvaTz0Jv/BaGm
	w/Hc+ugJOsVTPwT/If/sLnF046z2Q/xUnh80t0X8woFv/BA9u4fng4Q1uyCPoDnNXKyAZgsXRZrdB
	g0rX1GlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx53-00000000NnO-0CjK;
	Fri, 28 Nov 2025 11:56:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4q-00000000Ng2-3bxf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:55:54 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so11951715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330951; x=1764935751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wCJgo3IXF+czdlE1yAyP50F+5uZ4Il24rpMbUbAKIo=;
        b=x3mwJrNUu5GRHvUF74Betw2CDN1hv1V15sq5TgU8mVH+s7680On8qT9F2I2Nu6CRHm
         R8DqQS59gytl9XiP4r7M0gEHKLTk3EJdf/0tKn2VVTkafo2iH5qHU/+VINkNgBx7efVY
         6mREyGeky3SUGEP2LTMpuHQip1+vT9c6iqgoutBwu5plG/Rebud7di/Swb/s//jaicjv
         JgDdBzBxKDmrdSUsdnmvAW67N7HROe+KiuYmW73/huXfOeNg+yXGYDkkKae1w4WeDXvE
         ZJhGj2a0lDUkMITnEKnHm12TUS2y9bTCePOXTcI71GUY+3e/jNq3TrgXuQL8BmI/fHPI
         Y2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330951; x=1764935751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9wCJgo3IXF+czdlE1yAyP50F+5uZ4Il24rpMbUbAKIo=;
        b=PZOaz+aa/4ICNAe1Xp5hTHUOFDfpfjHyZEyca4JLTbUPI5KnDal2OaHUBKlpE0GbnO
         eXA3NCu8umG4vB++Kcku2/HJbIsU2uQayxh/Zc8dE2nahQ5VY3ufDHl54YwNFRn+EmF8
         dZUifCARxSxcWysJVLtBhJwJXTB7xdxmuTsBmBsnHGDu24P6wKqiYH2yUeqHbpp9iMN5
         YaDMJ7Wxp6M1jKk6yy+ssoV9c5dLXKXPx1DKCftFpPfbfxq60TxgMqudJW4lXyRU5E/K
         Bvzz4e4iRTgmSV5gMlhwRcDtbKn3JIW1iof1kp2BYUzXXQkbUG/t3CTBY7SEpkfLDleE
         dtfg==
X-Forwarded-Encrypted: i=1; AJvYcCW18+hAqdAFjfhnGgcBjm0sbE+fCMCZEXGpPz7mMYPdDNCv1UtrOeRkN7HtS/oF7TisustKpA1F+gbzLTR6xGi2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/LmRXHr+awe7jMJDniy8GQGHrM52oiEAR6XlbvfPZG/k5ovID
	eB0JM49GkVwiCAIsUkNlP2cUVd01kriuyDwoHRswvbmYHRtcEOhCfHQgbbfledswI/s=
X-Gm-Gg: ASbGnctB2Xr8hyXViaGb822hG5qrTbjkvDF93Lwfrdnz5k4T7BpoUftTe0RCtqzj1h0
	LY45MbMJe/Yqw8WJYqgbykUmh4rI4a1vrb6lkf1Thwz4ABoBvplHJaWHkhmSzy5Obsl5mdpW5/s
	4foMMN8koDftaN+kKZrMOLm9tR8XMIGogNjzvPmdddcxhEczIkSLcB3hsMMvPIbNfnxFeReKwrE
	/vQslbkYfqVDmhYKcSt90IfUzyXPvIrOXZDcBtwpH0zceqBuGBr4h1rjsuDNgj3wWhNgrdA6BMJ
	c8UYffcaVWXGnRr+IuBDJqcN/fuA48SEzI+rlODDFhfyX9Wrqq3nC1eyvr2+Oxxouo8yeEY7GyS
	2GaP9DERNsl2bp0FisyYtUSWeJ3MTyWq5lXLmFF45TzhMQjC8/6Y/lQ16fqHgM2VZwwnMMYz5Fk
	jklFazhg8gK1mXUA3Xt1BK
X-Google-Smtp-Source: AGHT+IEH8XnMSqyzoApKmDX6AhUNUWYgJvQSSyuWnCcuBiDNsTGdng3bIhKQ/1hTLmU66JQfBqnS7g==
X-Received: by 2002:a05:600c:3588:b0:477:bcb:24cd with SMTP id 5b1f17b1804b1-477c11179ffmr299285985e9.22.1764330951004;
        Fri, 28 Nov 2025 03:55:51 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:50 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:14 +0000
Subject: [PATCH v8 02/13] coresight: Repack struct etmv4_drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-2-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035553_307263_0390E4D0 
X-CRM114-Status: UNSURE (   9.43  )
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

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Tested-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index 0287d19ce12e..d178d79d9827 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1016,27 +1016,27 @@ struct etmv4_drvdata {
 	u8				ns_ex_level;
 	u8				q_support;
 	u8				os_lock_model;
-	bool				sticky_enable;
-	bool				boot_enable;
-	bool				os_unlock;
-	bool				instrp0;
-	bool				q_filt;
-	bool				trcbb;
-	bool				trccond;
-	bool				retstack;
-	bool				trccci;
-	bool				trc_error;
-	bool				syncpr;
-	bool				stallctl;
-	bool				sysstall;
-	bool				nooverflow;
-	bool				atbtrig;
-	bool				lpoverride;
+	bool				sticky_enable : 1;
+	bool				boot_enable : 1;
+	bool				os_unlock : 1;
+	bool				instrp0 : 1;
+	bool				q_filt : 1;
+	bool				trcbb : 1;
+	bool				trccond : 1;
+	bool				retstack : 1;
+	bool				trccci : 1;
+	bool				trc_error : 1;
+	bool				syncpr : 1;
+	bool				stallctl : 1;
+	bool				sysstall : 1;
+	bool				nooverflow : 1;
+	bool				atbtrig : 1;
+	bool				lpoverride : 1;
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	struct etmv4_save_state		*save_state;
-	bool				skip_power_up;
-	bool				paused;
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1


