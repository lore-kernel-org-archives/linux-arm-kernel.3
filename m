Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA2FE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=; b=FM+Q4UYmo/8YKsjnwxgiN32Oai
	HrjqbtZ4R5IryhNz3APXwxXKNyCWd6qujHSGbFxI0vD2VCTIQiL9MzL/83+bA1fNb33KoRYltD9O/
	wJZ1HrpRuRMkaW+fZFgSLNluSE3P4TG+o51Ry4OJXXWcSszq1gdO0KoDgso/agk7H4v8OdF8ZlPrM
	MhW0SGGPakD7M3obVrr061fKtVNxY4GCwRYyAa+NihBTv7jfr8tRwTvtnxvVeB529bW4RCg3L5VF4
	YvOWu2c3RBqA9VnUYs2q1l4ZLzaa+Pcb1iUl6szKma+KDvtFuFy91e8wuWS1dj86zOe/FxqtTHhKe
	iZ28J/vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyta-0000000HSTH-2zIu;
	Wed, 18 Dec 2024 18:35:42 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNynL-0000000HRK2-1b6h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:29:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21644aca3a0so82122175ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 10:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546555; x=1735151355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=czEwNkgQFstA9+g43JOVMca6JT4KCHnXYtuymQiMRBK6pjWH7FLwmpFWqHUVISdLfV
         wslXkNMiFztb8KXml/WsV9NYBBoNJyjK9ugofWf8eKmwnNkelJ5uvqGZC8qd5sLpKKw0
         BTkkZ/KhHuQR7rXBrcPBSWApKOeZiP/ErShzaqAUhy/FGNXF9b12cCSLrQWPK0Ir2W6q
         nE3pw60MQ2Z0cKkY5lHy50jwXLc3TTkcHKsrZyQFu9M9ct/OClR3m4zAtYN7b66FCNg8
         tYpxl1UjbZL/rjIkbX0bC992oRIzKHrHAdJZOo93RAzpExZgOZ3Atp+Oahy3m4JApFZd
         jZyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546555; x=1735151355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=j3f+k9alv5byIir43HLOdgI4i5hbdizBQsWWmq+1AJ/Xhzfi7eMI4s9FOgQZzyrnKK
         pYGKPL8pFmC3Wr/xyP4BiAM1TRLYz2D1RO0gdYeIazHsnKvgB8HO4VP3T9IH0qBTOfXw
         aEhpJkyUwOKoCVkNVpsN/fqkdAjR1BMuMzRTs23dCkQ9gdmhqtADGmkXXsMOjxuscomk
         tKlMfWDB95OLcuIk+8t8XFJXUT00cNFgkUTVahr4FitS4tfr+CqyR93fWvUM2frhgQ8z
         COAskYag4eARMpcuOh0amVXEYrfCE+bVbXGJ7lUfsTpHqazAYkHNrG95BygzILT3lqZV
         J9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCX+3QHvAkMfOEhvZMTpaDRHvdNA4F3GDH4IOUfO7uosfKHEHpPB1amN4YHlwm2GkTVpFB1Z8g3nDENJRlgtd1aj@lists.infradead.org
X-Gm-Message-State: AOJu0YwkQZxVP9nchLkkh0TfdDFbDkg/vH2Mizi2OAd1FpN4x/LsqUBQ
	57p/9WatjQbbitHMcXz6xPI2EqP/63AmhyLdlvjI2RcXqshWynZo
X-Gm-Gg: ASbGnctc54gwJlVfp6WPBUgghaQBBpmCTpK3PmhYl8VEP59lum6avgfJEK6cdMpBegj
	+1MIaUfGgLTFFIME498ENUbSeC+Y/+zc0+U0FlyLephNye3H3ahM48U3Af3e9hTPTCuv4ZhJBy8
	yz2SuCQY2hehlhAazcwaPhY3QRwO2Qf77Fmc89yom9jalKAyos6jUzi6vi7a7lRvcOXDxcQyyBk
	5FsvIAnrXj+xTREbKAXm3BA2Yz4Nx2wKYofrdgTNGESG42ziXkZ8DSuTQ==
X-Google-Smtp-Source: AGHT+IGGkzD5I1MEo0iKpf3ViMZnzuOuLHWt5lenYWuouWbqfIDA4yXHbjCexInJBE+6e0MeVf9ggQ==
X-Received: by 2002:a17:902:c410:b0:216:56c7:98a7 with SMTP id d9443c01a7336-219d97f7eb5mr9892435ad.53.1734546554836;
        Wed, 18 Dec 2024 10:29:14 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 5/7] cpufreq: apple-soc: Increase cluster switch timeout to 400us
Date: Thu, 19 Dec 2024 02:25:07 +0800
Message-ID: <20241218182834.22334-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102915_529255_4C92FAF0 
X-CRM114-Status: GOOD (  11.81  )
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

Apple A11 SoC takes a long time to switch. Maximum switch time
observed is 345us, so increase the cluster switch timeout to 400us
to be safe.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index b27d261fe5a6..94e57f055a5f 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -53,7 +53,7 @@
 #define APPLE_DVFS_PLL_FACTOR_MULT	GENMASK(31, 16)
 #define APPLE_DVFS_PLL_FACTOR_DIV	GENMASK(15, 0)
 
-#define APPLE_DVFS_TRANSITION_TIMEOUT 100
+#define APPLE_DVFS_TRANSITION_TIMEOUT 400
 
 struct apple_soc_cpufreq_info {
 	bool has_ps2;
-- 
2.47.1


