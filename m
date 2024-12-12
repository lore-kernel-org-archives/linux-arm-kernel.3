Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8C7E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 07:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=; b=TzCCBUm71b/ipk3rlC8dGoEtz8
	CLFe/j6w4hu73Hxphkmsx1xhfC3rT4MZurnWLSAbnAipYhJWmXMjfnHt+tSl/JiR312qZoC7NZOvy
	oCy/UGmniT5Vi8Fvbn/uZQGCb9FXjBYbPrFQFFR1vsMgjBcq0dgfO18lvsYUrLXaANUN29QVXWQL2
	CWh6QP+FmF3MEMJY9sqhUKeKGJY/DDjXgUsYnn8g9iXrK5BGvOIy+pqu5PbeScTH4Rs4fzWtgasRb
	sbYd3PeXficbQkFM5h78RELQKJ0eDQrn8LRg4uhBm8yNOTZ5BmN/HFV+k8/aFRpJw2BhGJj7/1ykk
	W0Sbm4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdLn-0000000H7oD-1J19;
	Thu, 12 Dec 2024 07:11:07 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdFo-0000000H6WO-47Ae
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 07:04:58 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-725ce7b82cbso320365b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 23:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987096; x=1734591896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=lPcfx/qelxX7IPr9kmvZr5ZjqU4h8Xl8z9HjNFEYaDjWgFeIjTyQEStkRv39EZhib9
         JWd3FXyjVwYhNfkbJARVCintaDDZssPo3zjI/nYLdl8FZlbmp6/V9RnyMGBPxXr2KCjW
         dJkERiuzq59uPlPDnVKlTkwhm1RGCHNASrf8HpxE+VaPLbvs/ZDlxgGV2jh5lhKxLZ77
         E+6cD8dl3n+RLvHoaiQ0NMxn8Ed5fpLpblzX6AHINSR2uv8KFP2aIWGHG4hOkXyk2DqQ
         MX5gyOm0zK52uSSeacSQK6g4oAn+GPaTxn/pUBsqOg6KIIzFTk+AWOAMdREv9XQfj/lm
         PFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987096; x=1734591896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=HCOAPsh0PWYXti0ucRMl43oi/EgDugpGpOkvnaqlUT8qi0g28ltlu80Z6BsoL911mu
         AuOKjvw/S4OE26OAuEHpDoAD7AUS9pC9JIzzadK7UkF8Y+11aA2tMg9QgWfgG3yL3deg
         N7x7k7biM8I/ka429rwyVJqFOHYmi/Etl54zAuopuldtqVvrlIgCYM1Tgz39SuLAgOmc
         JIJ5o3NIIC6i0IXPQHAjIAR20ePD24xFNYhcqEs3mtNgNucxuZWTLabMf7RwVXLbEzuS
         V4OjU/whvfgY5n01RlRSJooSN8BiXK45znqzPxPvQKkkZESxQSXk30BvMX7R86Rv8MZ0
         kBSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVCpC6D8/7ZMEwl3FBkXOZ46IdTpS0bHURkYoz9KsxsW8dE6e19mwSMs1R9Z2kM1nz/LblW66fbo+UefrwnXPd@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ/sphbH/3MQGEN+9rUkperwarZyW9JXrx8vKE1BrGXOODLYKA
	KHluhl0zsqrJD/hooVjJ7veTmt9G7aPo76fCmhePt8+4PHJcei95
X-Gm-Gg: ASbGncu3Gj9XaN2SLYla6E21ygc4c0+B2quTF4WPGo1bXF3oOnaex13HaxJnr7IDlV4
	bIjajgWfFcXnN+HsJcZGVC4LUUyiTgpaUzC53SltNkdi37+Cufj5Edj/E2VOlvpr+d8Y/i8zsEd
	2dBKdmdmIUG/GViL39cjJW64vSVUZBHn/82u9t3WBd5SzH45zvB8AvnqFfIoOldNLbsH+JB8pmg
	kSPnbtLNnTMUNpdxVa6NSeWcaYOeEisJfPDJkPh0qayhwpJoEio/SXm4c8Z6qjgVw9zwbPN
X-Google-Smtp-Source: AGHT+IHKPAp1Y9VHLYOP5k5Lmr6P41gM42/smjErSsBmXsfXGl8fcB/4q3SDqlWrJH5E2MTneTUBEw==
X-Received: by 2002:a05:6a00:230a:b0:725:eacf:cfdb with SMTP id d2e1a72fcca58-728faad3a55mr3591696b3a.24.1733987096031;
        Wed, 11 Dec 2024 23:04:56 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:55 -0800 (PST)
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
Subject: [PATCH v2 5/7] cpufreq: apple-soc: Increase cluster switch timeout to 400us
Date: Thu, 12 Dec 2024 15:03:04 +0800
Message-ID: <20241212070344.3858-6-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_230457_010233_9B3A073C 
X-CRM114-Status: GOOD (  12.10  )
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


