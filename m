Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7EEE77182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=; b=H3cEu2h9vVjgksbx9mlXHfhoZc
	DVCBANmiKp6FZg9Og9kplPqQ3KsF87nX4WyJ8IYQXLEPLFZiJSiXr2CZNBX8qv6s1yGDdLCgAUdvh
	NOpF10Z6RQs7qU60iOroMLGCXdMCWfXZqe1yxFQre2YjvYMejuHBQJsLdY55uGDCLAS/LjjnOTA6x
	rTTywjF6hXTbd1eIGD2dtOgQb295LtLRaVp2Ret4IjH6SUA3JFQ8udJBzuJJWh62mxpLz2j+xnvD7
	+ORG+UV8qpyK5fcfzLxwEEBYx8gFe4IAZij/2Cy7h0/brgQF3yweUxyKIB+V6EvcRvjLhYFw6OVba
	vuzKoc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKtG-0000000EhQi-3ZAk;
	Wed, 11 Dec 2024 11:28:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKoH-0000000EgHI-2AoW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:23:18 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2156e078563so49519885ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916196; x=1734520996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=Yu58ZCmC1o6LMEXUlEy+jwxzSVULPwdjNY7aC3bzE+k6WvTcSamkFfc7rN7rSkKS3w
         f6JkiFEZ9AqlrV/z/g2iq+IqslnQi/1NC//Wn87q4Wxgru1IK01Bh1D7CxOjDqhLTs4B
         Mta01CrFChm35S3rcyPYZcA0vaBc+gnM2eaK5AUbfwJmxUw5BZqsMuK2LoNPH+ZyjuDP
         dGD/txOWGo9yrvvgbw2vJ1OrOH8Q0nKMtx4VuEBnUSvXRYHo3Hn+GvHa1z117tA/LZUQ
         DxFQuWVaOZiBwSI4cgrz+EaIALvbkaFjmNBh9lu9BZ8jXjUfP8pdZuYx+UoJX870YBSB
         vu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916196; x=1734520996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=s2g4x46rhEinRomt5OWOImZKLpugZloK1Lenp3k5vbKO2yD277ofeNqJmtNtYchyS/
         zveHEx/Q9kxXotnN+nZ248hBxBStHyfRQR4Tpc5k88WXy/6iBSkfC1JDvuj8+Akqu09H
         h9bc3/BCfxube6fmHPGovsvg2mjS7POg2dq1/K+23V5hy9Syf0iTDnpHWlv3khmmZKPf
         xjGb4PfpYGe/penbq3Mz9eKJH7mbWQOSVD0GumX7WkNa0z2nk+Rq88J2ixF/70HMTJsb
         W74MMjU4VQizAZMStSdRMfU+ykHpHxRU79MNARTYHSa6ir75u3bNbZgNXW9no818t36/
         C10Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0aiQF5VdC03gW/UuykiOvPLha6xdJCGCEsRmOG6fDmS5z8UT/1nmxndKamTWdMawP7tnro2oGJ0kZFiyfldfW@lists.infradead.org
X-Gm-Message-State: AOJu0YwnLZsxw+A7HYQyVdDydJARuiX6gDddie9+dqDSP3md6IMnAqio
	b8UvKhaa/84DDtdTyntg8hJKgHPQplE7v9NhF1WEG5SJnVj6FgzwAZho2LzY
X-Gm-Gg: ASbGncvSyOvQ++5ZB+cUW6dTJo2BWUyJB9KQah4yoLUmhXf/pSWtfJYwvm+4Ff84iu0
	la4asJt1tGiMKsLd7Pj0d52lqFoj4tF+sjCfT1tC5OeBNlaxpxTywHDxqGIIpPIUNcbQbkoVhrx
	PEQ98WucdzymMRUb00ARsWiUBJZkFjeDU3p0RWgcXaLDajurGSsI0GyUSczXsDA3fBVVaa9gMji
	S942phtAzU0ZTEtrzhln9sZNWJW11r5cNUeqszsOxf5sUaobFhlQ4dr9yvCps1YihJZPQ==
X-Google-Smtp-Source: AGHT+IH1hLAgeQvAxnVwe+D4VMDsSZTriCt++kQ7emPExGGKhpzABy5H4MFcc6Iy+zePAn8dZNzF/Q==
X-Received: by 2002:a17:902:d503:b0:216:6c88:efd9 with SMTP id d9443c01a7336-2177851dec4mr41331435ad.15.1733916196279;
        Wed, 11 Dec 2024 03:23:16 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:15 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 4/7] cpufreq: apple-soc: Use 32-bit read for status register
Date: Wed, 11 Dec 2024 19:19:31 +0800
Message-ID: <20241211112244.18393-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032317_554695_0E99F6D2 
X-CRM114-Status: GOOD (  12.38  )
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

Apple A7-A9(X) SoCs requires 32-bit reads on the status register. Newer
SoCs accepts 32-bit reads on the status register as well.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 90e34105b50b..b27d261fe5a6 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -122,7 +122,7 @@ static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 	unsigned int pstate;
 
 	if (priv->info->cur_pstate_mask) {
-		u64 reg = readq_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
+		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
 		pstate = (reg & priv->info->cur_pstate_mask) >>  priv->info->cur_pstate_shift;
 	} else {
-- 
2.47.1


