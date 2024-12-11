Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3702BE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=; b=Ii50drj5gJLlfmVCdE91xwrRzh
	xwGFhxM/A+nG73MlPkN4QGLcbbsiNv+Y9Hzvj757MagsPklLQHkQ+dJFpx7Bo3VW+2BRUowJK5owR
	K4UJOAobvELjsqHp104PILOoOIuv49rStAU0GSDU8c1l6OmFUy1gukGFBDJxzuT27YL7b5KVFdl7p
	r52jvuRpDvbj3p7zS+NjhANjuj8SqfEX/gTjJ2o1wfo2mpngOKUjWL+vsAyyZjERIp6XY6kf0j0za
	OdGV/mbrvZlvz36fxOLRq+0D53p/PrpW5HYTeUfVTO7S56qlfVEWA5tXwvqLGM1UhG7Aod0U10wkz
	/pZWhg6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKuJ-0000000EhbX-29uB;
	Wed, 11 Dec 2024 11:29:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKoK-0000000EgIW-0HTX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:23:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-216426b0865so31074615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916199; x=1734520999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=fmvCD77lyxCr7hY7X00jSyZou615JdrqRYZ05YM3MWlQ3//Sm8U2AkWGKxIrrvb8nL
         rj82QdNc5O5HbynFp1w2pPkUkjbJBxGOgV3At/Gq29x4LQi5Y11Pfe+4HVupdhQj3KLv
         cuCrtAa7m3ZclfOBAjXn3SPFLSOIb1k363nzUjJX6fliC1XqcraQnTepgrjgThu5AhVW
         Bx0qHSJTHZi+2nDRF3Te+n6VhAcwGIt4OS2ccKCY8gnMxq9aQfg2LlXLknn4kVNNYw/m
         bTk5o4cRrTDA4M79/Inriq91S+e4QD18nPtb0qO0KlhFDXoRgRWWgTiYLP0ccqXnbVjD
         GqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916199; x=1734520999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=FUSRBxGrcqTV01fV8FGgAJbjIaxkaO+IcPDLaLM5U/IwBbq8c6GnQlEb4c9B4D4AgN
         hlegrdlycx/XeCbNWU9eEvHaTnRnN/+1/wmECTxv1I2eAh9ar/Gn7uBwqz9phAMH6mZI
         XxKfQhsPTlUPjxML5hanrgiKTOPya956iqcUt39QTNRqALee/VrDMpI1AmE3ZNIatOw9
         vvTSXX8cR3HAuSisajq7UBQWOcm0EQ1KQszNg0P+Qxb1vb4tZUQBLRsOiNGQLVLMza2i
         voMZrudbcW1xch3FmN9jHeknCDIw0nlZfXZFdQOcu8mJTuZWZSSlAYhLPWNBAIWZmky/
         AfdA==
X-Forwarded-Encrypted: i=1; AJvYcCX3eA5RZn6jicePx+ZwkVqvEfm5Z7LR0lCHDEb5ALIKqYvabGF4nXd7e8Yl6mcOo4zWG82i6vAnPTk3Djvdfd5N@lists.infradead.org
X-Gm-Message-State: AOJu0YyXi+MINHShsW4bv3LyKQoGNu9QkGb9JlKSQvL7HVgvvQaubuQc
	xJFZy1Qmn7G2nDMx4pfaYW9GYwDCOVUp3lPqdT4yoJE2Uws4ocDE
X-Gm-Gg: ASbGncuz3wnxJNESvJq5fcX32pQ/4He7ZmkfN0me2SnGZh9MWB2r4gdjerBUMNiCe1X
	Sq2WZvJHFhHsl1ETYLxcDeXdNux+LGLUR5UN+inOnj500cHn+pMUtGllUOK78XnhEYZOw/rUVcU
	DmWbf9jacAObAxNNujRMNyKCyCvSiYMhrzPRM+cehL3eTHQQw38+xKtu8cmWkXFQt5h5dKYR5m/
	9EaFPS7i0Q0cK0ZL5rZXThFUZs9NUEgJh6hMK8213/rwv6+5YGyQbkSPFy6RpeCiqgyUw==
X-Google-Smtp-Source: AGHT+IHo+Kzzu1G9jRKGQEFBse9aRUgQJuEW2pdF7vw9TKlIsPyr1dSWpP9Ey4Q+GR2YFuS1mJUrIg==
X-Received: by 2002:a17:902:c946:b0:215:3849:9275 with SMTP id d9443c01a7336-21778562d49mr36068865ad.49.1733916199490;
        Wed, 11 Dec 2024 03:23:19 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:19 -0800 (PST)
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
Subject: [PATCH 5/7] cpufreq: apple-soc: Increase cluster switch timeout to 400us
Date: Wed, 11 Dec 2024 19:19:32 +0800
Message-ID: <20241211112244.18393-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032320_100857_5734BC8C 
X-CRM114-Status: GOOD (  11.53  )
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


