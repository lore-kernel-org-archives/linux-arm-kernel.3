Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F081BC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vt1kyyizP9VY8dmYd/NkcYQ7O3bbff4IlhNlXP/VIDI=; b=aSOvrjhdvDzrvOOzlIa/D/jt6r
	jk5y2/VMWvCGij261KPF4FKg0/uZ1q/SlrcX2k4wXM73Dfoq4KDNCTmIu1MHm39IeR4YAgZCvMYPM
	3SBaJSrv3moTH+FnLW98itQGjPRjSpqaMVlOdbai3z+i1jTH6RInQTTaPy7XRIcQyLvtmiPnHfuE4
	d9gk5U8HZpIEfjncn/T28W2eohzsepF95eSJO9rxhBoK2Xpawknr2InLXxf2fUjG5jUAdv1KlFLji
	vRHzp+ObSAPdlB/xfN8gUiFzOVfFSm1R03dE0V4wIfgWgtQe0+kVRFO7fbtLhgyi3X81czKZqrpLf
	O4O7tqdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavdV-0000000CNHv-0fxp;
	Thu, 23 Jan 2025 11:44:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavXt-0000000CLtH-0dtP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:38:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-218c8aca5f1so17061265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632328; x=1738237128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vt1kyyizP9VY8dmYd/NkcYQ7O3bbff4IlhNlXP/VIDI=;
        b=Nu8cHLx5meuN6zoek1hdMzrinkBHimL4XcZbmeqvJBPAy/9K5NydWV/uypjXKD68tT
         vSivvn0IEavMzmEycm2C/fvKMi4iL3cVfMg9stVU1Z9vkvOo7J6ONk/9jBV9U8KOBlBg
         GBeNgoWuHQBLHaJIlSa2JXziiB09J5Fg81A0lhF8gfnboqZr1BfpIsSaj4jXZ5JvzpEI
         wfl7PINRoAQzbpQRFCdatAN0YXA0n4wzgyUFSB8F38r5cVQ6ahk07CUGiajlaKvD0+Gl
         3liS9qT/E70SJfWlMpcpM9QZDNIitObDvQDVEUKoIv50CfmjOHwM9IYi5EkSL0bKVM3z
         /Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632328; x=1738237128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vt1kyyizP9VY8dmYd/NkcYQ7O3bbff4IlhNlXP/VIDI=;
        b=lupjIV6ohqGzsPB427lUJGUyYs24c2gx5XW6ilJv/ENR36X7lyQfZIvYTc3F4Btnc8
         23pVVdU0Dq5CV4K3ggoWlroL7KlAOQ6xV714UUqD1B3e+xnSD1pejK+14KL15DMPJJLm
         kPpEmgebXVVYD6i8+Fk6Oqru7y7QGk0yZb5ycLadSAiQwMJN9HCToF+Jz2KtDWd3/Izy
         cTi3w70j0Bur3WCJXQyDGisXlW6vD+OQqoTKAHUzZn3mIbHW+OmafF92pk6DCa+eGu4h
         6/rSnr/CCIsB1z/E55PdBqgHPl2X9PcIFjihbiSRNZZmizPNDiSDwFwc0gwVTUPM5J1A
         t4rg==
X-Forwarded-Encrypted: i=1; AJvYcCUJZkoGlLjmmcITmraG081mKEod1aqccpf69t0agiIAjLuNFCiL8O0qtLaDKXiMwhcK0Q+QNy+CFKbLUz3hc9L/@lists.infradead.org
X-Gm-Message-State: AOJu0YwZKMRmbNhmQ73qD30ce2eW3ODWWV9uLlrMnFOHuydq0e1L+LN/
	TgbhGYxMRZbpBwAGV0brJQ2nUponByIW6+dM86UwVDKS0E4KCwdXWGv9sZluYYs=
X-Gm-Gg: ASbGncvz14mE8mo8gcYKvuvT8K3J6wuszHUxpQ7CsW5SPXwE0zIPijgl7euXwKIs8lj
	FLqgdsICCjDLXEHlD2KyRV2vaZ9UaEqyjcdCjPiYkGSZ1a+E6BpzO+ynYxknHK+7Xc8JwMbdsoA
	7hRdh4eUhKL99bKQPCDLVoCUpJXXr3J4YStX5N2G4YeeNeL4ALuiR4KZZ3ZY5cVdHlIa0cMH/on
	1m2jsG1AiInDm0e43pIY+aTfuwpXeL34hYz5x1RMq+K8nSNj9exS5ignWtmNW6xrARMgAjIqkLT
	KlGnDQc=
X-Google-Smtp-Source: AGHT+IEDImNLEpDbeExd7a/CwLwEpkI62SjufT/nbplsqzlm5l6MTyrbVsJXoZ25z9KBxH8jSJvHqg==
X-Received: by 2002:a17:902:ea03:b0:219:d28a:ca23 with SMTP id d9443c01a7336-21c355eea74mr385862205ad.36.1737632328330;
        Thu, 23 Jan 2025 03:38:48 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3d7d98sm111571915ad.177.2025.01.23.03.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:47 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 14/33] cpufreq: mediatek: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:50 +0530
Message-Id: <4f57adcf5fa9f3c95d5f86c76a323f0c8bf1a0c9.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033849_186274_6D0E4C7D 
X-CRM114-Status: GOOD (  11.10  )
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

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 1 -
 drivers/cpufreq/mediatek-cpufreq.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 9252ebd60373..aa209f5527dc 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -293,7 +293,6 @@ static struct cpufreq_driver cpufreq_mtk_hw_driver = {
 	.register_em	= mtk_cpufreq_register_em,
 	.fast_switch	= mtk_cpufreq_hw_fast_switch,
 	.name		= "mtk-cpufreq-hw",
-	.attr		= cpufreq_generic_attr,
 };
 
 static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 663f61565cf7..2656b88db378 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -618,7 +618,6 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 	.exit = mtk_cpufreq_exit,
 	.register_em = cpufreq_register_em_with_opp,
 	.name = "mtk-cpufreq",
-	.attr = cpufreq_generic_attr,
 };
 
 static int mtk_cpufreq_probe(struct platform_device *pdev)
-- 
2.31.1.272.g89b43f80a514


