Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C777D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvA8MNYHofPp6XXLABhPzCmRj6ePdkRSGVrEa8M8M3Q=; b=udArCBvSmLBsvYkkdx7k+urgyt
	zqFq7a7QlKvJptcbFP0rI3VZSz7INloqOD3DF+5bFaoQkQ7ea1PGeek+w1U/KzqUOwAXfqz5yEnjb
	+HCT9M30f8vk5m706YD1A1PI/kYqRRthSyLp30VgdnYj5DBhfvhC4ovswAUkgfYpADqWAqIoN5wa/
	x/VhY75hc1N6KB/yWB+lX7Aia1HD0thMEnoqss/doTmdjYE0latdJQm3NQtN9oEZ37ZKSoeqXvlJQ
	/9svmVhiPI/KufzCghnRZDADKru2y+YoJA+v+5CAZobiGKrQSrIXXxlqMM8EjxzlyephM+MGXo+p0
	pi8RNcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4t-00000000Nhy-35wH;
	Fri, 28 Nov 2025 11:55:55 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4p-00000000Nfk-3lv3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:55:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4779a637712so10595765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330950; x=1764935750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvA8MNYHofPp6XXLABhPzCmRj6ePdkRSGVrEa8M8M3Q=;
        b=xOYZqcnU1jBTMrkEK87FAGvcUAP+nzP9iBzmTR3JnXepnV0Txp7ZBp5/oJVulAFQP+
         Sonvl450fkGGsORUO6FWap1e3nJ/r4p0eGXGlIYTrdfy04Ml+KJ+7LkAgGYDXta7Oghj
         v5Voi/Ly7Im4+oBkndnR1mOVCzoN8O3GuJ083lPwYAMh1M18MSXTxwj9QHlsgy4yjcfd
         rEWdSnc8XOTlw3Xy42i6Jtg2LEaLz73D6FhmHuEmjNLqXelnkxFo0/uP9LFaecd8LA8S
         MyfXeFoIvP9naBOw+0KCe5yvOUbvxK530DeyCEVZFwK9Q3tyGTa3qyzS9bkuFjcL4wkI
         eoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330950; x=1764935750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YvA8MNYHofPp6XXLABhPzCmRj6ePdkRSGVrEa8M8M3Q=;
        b=HCT5t72BxfyG5GMRg7Bxf2LuS7ZI8YtDoWS/CQWSHb1hvdXaLF4nVdhJ6zL9w+ECSp
         SoefaDQ/YEdLPXW9NNrxtd2NkfQJk5xXnaZt/1l/vimvxHRwK7yGWZIWFgVc/yb6Uesg
         T/Z6KOcKFht7AODnYWi1CekYV7PpxVP896fmgLFQ9DwqirW0KauJyrGcv+d804+JcYxJ
         4nsoVdvrFrxiPAPv8z7cFRAdIncr9v6fEMcyeWGQZaMbzDj3V1MvW85wXRPQ5stuEo3y
         YFd5GC0/unNr2gc+ISsTn5vvhqsqVjrVSUiAT9f0jdfC+H3qh10le1UHqkppCiuCVkMA
         BejA==
X-Forwarded-Encrypted: i=1; AJvYcCW1caJVrmn0hLJH202J7Cl84p8zxwVT34pbzgFmHUejKUgwsXyePMpl6tn+Yizu9RfYOQLEmJO4Qu/EfLKeXJ05@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9BSzsHI0eN5IbHLOTgYpLvDN2LQdrm8dmhVs2N01Idl1xT1IV
	JfKxZhtKXoZbAtIK3a/F0IzjigRrjEChLO5lNNbpFDtOgev9kw0cD6j3PGCyVWgzVMY=
X-Gm-Gg: ASbGncv0NmG1fTkZnaZWbKeBT9qnbnXkX0z/SF/GTvNir9ohA9U/pXnVWvbiWL341um
	e7+hTjNy03Wp6z+pGyQFuhVUpVoRn4lGMMfwbEOo6em2j9qh47ULA2hYj7kHKvzJqInBZ84uq/y
	EtgMtl2lp+sA03iW1ejgknI5qoucERpwQHEv+YKDrV+hNY8kQXUkMV20roGIpgbfoTulpeElVui
	5AE9F5/SDwhZFTWDTCOxYZaSgFJKCnNLw+1XEIIooNWjymkYL9OPyeljmJAMYWgRF2MjSTcuMbZ
	BT263fdNcxEqquLH3iLE4KqJiN995TPWXmJ6G3j4PjerXCZ4c2klRAL7gk8HVylGZgF3GVsOalP
	g1xIiMsM5ebBRZr70YQ77YJjmc61Rt4EuWoiWBi+6Gks6R7GmJj2KoxnxpwDhIXMtp3RM67Ts3s
	hSGTRKhjK+8RuzTS47vCvg
X-Google-Smtp-Source: AGHT+IFHgNVxLUdCo2Jshe+DO7UYaUlnjeJ0Jmjfa9pCBwvoVJUKxBfVYSLZoxpQ0dDb0+0JspQmMw==
X-Received: by 2002:a05:600c:450b:b0:477:b642:9dc9 with SMTP id 5b1f17b1804b1-477c01d736dmr243431065e9.28.1764330950053;
        Fri, 28 Nov 2025 03:55:50 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:49 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:13 +0000
Subject: [PATCH v8 01/13] coresight: Change syncfreq to be a u8
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-1-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035551_956410_61C8A3FC 
X-CRM114-Status: GOOD (  11.98  )
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
Tested-by: Leo Yan <leo.yan@arm.com>
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


