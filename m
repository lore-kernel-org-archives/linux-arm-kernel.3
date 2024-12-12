Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D1AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=; b=l72JpNz+CeaEqux2fSgKPVJf1a
	ZoenbX3TQ2mHWKLia9VRsQSvgSOIQpdFHWCnrbZrI+/E+uQtJ2d0SUe2i6VQWX1teYSo8jf+GZd6R
	90/n0ZRmyFTA0HLMGTHKAWZ4rLc/ZYv4mTrMSfXzfc0mtTCxr3mrDPQck07XG9sa2SZDs1YSF+WKo
	lu8IyY6lSMK8TkdKyQ2dGJ/cTlvP7tX9yqy2lLtWPMP5DSp/omd7x+VgZNvgeLuX6XhQvQOXlzXJp
	A+Iwaxa/rdMVRs5umWax8wCZspGuxg64Onui7DWRxa9TiQzepe2PUmJauSnbRtu44Wzt+f/iMVXy7
	ErJV6NzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdKk-0000000H7bk-2eRi;
	Thu, 12 Dec 2024 07:10:02 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdFl-0000000H6UZ-4AW0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:04:55 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-725ea1e19f0so226427b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987093; x=1734591893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=ki4dz7D4AcKiAuHBgK6Qjfg2jfAZYT6ir8nYIjUjzEdieVgJGRyPln3AMR5ezweblA
         adzfYi2Ds7TzK0PG5c2PVIZTQJsuMtKrPbyHiCtOVxIe4d7nA37L8+T/nL6n0lima2Kw
         NrEuKyELqr7ry6gQf3t9pUOYF/0rpSBFjg1JLGLdi3KFBeITueRGakjDKJzcckTpljpM
         e4m92H+fECAK27dKxGOGSKBowdEzqf4xwEXpg0CvajOe/IZbtzLl+PmZ/YPNC4tMf4gt
         xeMnaTwtP903HLAz7SYG8rYUtt/HA+XoweSzTc6q1ERNflkrhimZXf52LwDXaU9xQ+sC
         pPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987093; x=1734591893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=iEfqIIArwoOMIq0Lx4G/tG6OJJiZJUiU5fGkaiAKo/67UCr/o2HehrgGhxRuT1ZCni
         9tSEri47RLHMYXar7pLcgwsuygkxbZTqOsc1vZu7XFLN9mkwQQzwh07rBmlUu5rEXG6e
         v1SbnHusZXnM+34jhV5M7JKw4UIX1ZIYrtSIYS1rGeGByJW0QF591o9mXBx3ylruYfwr
         v+bUTypuZvOW2gRfx1t8/jdRdnvOR7un2nJqBGYYTdfQ+XV7yzGePy2u9Qd4UDV5TN6h
         Z2hgrosuFgiAdzJNYrrNCo1Ft2i9jHbNhsENVqMiwXoA7rRzkoTVQvPRP5sWaFBzZE74
         NybQ==
X-Forwarded-Encrypted: i=1; AJvYcCUorsaqArCEIPaB/Vci0cTReY32BeU/diY+3TOztRBF2eP3IlSrAseMgAzHk/NtGDo2f7fx9bGlVe67KcpfAMFj@lists.infradead.org
X-Gm-Message-State: AOJu0YwnDsJMFm8xpQBAR74OJ79nclGyTChYvVr2oKEHDoIpVqy+UPIa
	Fmxf6XZ+1A9RUUE0iYsn1dhXP9E5xMayx9mJArq7xSirDjkAKwtK
X-Gm-Gg: ASbGncuhvzJOx3WGyU0pnHhHJOFxr3iO4IDyp24+3Cf0ubGgl+BtySmQ/BfGMqd6KpP
	+LmDtd/8veemih2ZpbQXM15QF2qDbc6DVbIHQUM2Do97CQPfFim2i6lukgGG7gh9OQMyr8x21Bt
	GtqXnIOVpw9dV42yH8UB8xltHBg1jiITaqZU7+61kbetnknFNpwboLbD5hQM/sDF9rDTYZ6naxW
	9APPwp50YEyZYGaCnlmScevKCYHKRLNCsHID1i3s45v9pmWufYNVZ5XSXrnshBs7SQ9916P
X-Google-Smtp-Source: AGHT+IEmXq444oBwmD5u2gt6hQ4Y1b6qVPA6zh/gRHg0XG/Uu/LCdJJ6Nmc53XVFX072F+jsIRC8gw==
X-Received: by 2002:a05:6a00:3e09:b0:725:30f3:67d8 with SMTP id d2e1a72fcca58-728fa87787bmr2990369b3a.0.1733987093085;
        Wed, 11 Dec 2024 23:04:53 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:52 -0800 (PST)
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
Subject: [PATCH v2 4/7] cpufreq: apple-soc: Use 32-bit read for status register
Date: Thu, 12 Dec 2024 15:03:03 +0800
Message-ID: <20241212070344.3858-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230454_025540_448D01CA 
X-CRM114-Status: GOOD (  13.02  )
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


