Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B3FC369AE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 16:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=18rNRUozuuywP1tNu8idsUvf4lnx4Kb0IvyRGbZ6T3M=; b=N3swEp8PGxb7PK4a2zRsoZjQFI
	1n322d6mSnM4+IbvIOLqz8zz1jvmMGoxuvoIfTbCi/8L8mZWzSMSYnlZzAcEvJLcgYd2JJiipk90P
	unRRg4SXV/9M3aZEmkHuD4BtDmOYKeh7hsOt2XB3TH7o37JlERwo6kFodxzPHgQ1Bcm5qsjwLIdge
	A1v9XxgrrePQGWbu/MCgWvBu7czBh80jbWziYymlX+sVCUo4Njcb392+lYmg07KOM6tCDSkUWA8nZ
	TE58zvATorpGMaSZsOk6NF75qeqI4n4GQemMCqV5ieQPApe+lYlgkXLQilOwrXhFnXuOipKkWHW/e
	qUYif+gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3dO1-0000000G7o5-19Wv;
	Sat, 12 Apr 2025 16:07:17 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3dMB-0000000G7da-0UzO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 16:05:24 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-479009c951cso5986591cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 09:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744473921; x=1745078721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=18rNRUozuuywP1tNu8idsUvf4lnx4Kb0IvyRGbZ6T3M=;
        b=i6wHptLQMw3OnVWoSJS2SytVmeVhmPTC4V3my8mM4rWFTO0X815VF+sE9k8LNBJ8Ch
         FNdhuXVsYpq68L7pTCCmCVHuJwwv4CYOF+N8LuCNWrJZV8MAYneDcjVJmFGjII5bRH9G
         H55VeiaIrsFTyXF+o0Qxl2DiIdAfBMqprKCEa7h8loxaZJ8bmx1jqjMcIiLIH1Qhq8Hm
         UsZy8CQi2SwxZRqnISSy/AqEIEUZc0HCj5NLvY39Z6uKcBN8WK4SUhZONA88huKAknG7
         iWkKM/AAySUQ5cWXhMQ7fyRy30vteDo0ukzuQoVT8AMez/K4IXhSkCGZOxY6HiaQw8mZ
         p0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744473921; x=1745078721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18rNRUozuuywP1tNu8idsUvf4lnx4Kb0IvyRGbZ6T3M=;
        b=sTPI2Ebgr22LS46zrzgPisWq27gwqD/8uAuwiGFe3XVA1vynjs2mENqoM/JOBcOp7U
         AeN4GKGckovRw8BEfVhj6xBXwTHPsih0bHiLA1VkyrDXs0iy/ZbmpgddZL4A6KQDyS2C
         E6cS6joKoTS3nof/ed2XtyTSJlIKYlaakJgFhqwTanppdTSn5UZAdBrVeYfxirMKrZsf
         1V4+VGN798pUZZYI3MHI06mdOjh9BB9R8iHG4AIXwQ0FEHaW1e47OyCQ6vVUj5euYTBq
         lu73wlzqHGrMYbbH1VxFfEURpbgy2hJqhzXfr5gKOrrsuYfSDWHacGS1ykAS8jF/sIX1
         cIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUev0YX5E33DT8vrhZeuQAa6NayTBYqPO/U4ftSiThJ6P4r1CEGgGgzx8QXXK4OaXCGalGbQpgw8lg7yyiAxKiJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwtnPZzQepIy5J9iDEr2sBfpXdM5IEUNSuuYJQ/hFUs9N1kw8KG
	0WAnKx8KsT1Ax4l9Yuy0eLhfsmiqwKiM/vw9vIyry+Xp1liyi9E=
X-Gm-Gg: ASbGncvNS1/Y0qSHuTPynz699hO50vHRRQZaKC6p5L3U4xHm7HA5Sc0OuqFCdDkGXL8
	fXxsqidxRTGHBwMH4YjJVlAD6dRspvOTmNl3vqTFwgqAjUnZ0clwLy6UjInox59v6NyuzGPQboD
	snZuMIlrUeQEmd5+z+mKtG/z+rHOU/wiTzL3XQe/iB26b0a2ua8+DrXXw+44N2MAkFtpZHHYqdb
	r9SgrF5nXMfvgYk2OdYCNbHFm/HFsEfqZVwgdn3LWSrNRkzHDHDROVwgtZcaBk+ClZxmnuTLxII
	ye2CYrohtLL7wP2HMxak6+tF6BzdTSaml6ppdw==
X-Google-Smtp-Source: AGHT+IFiHWb94k652mgAZ/ZDuGpTVK6w5j1J2J86j0VwdFWpYKq46BdH1rfkKZVmctjSl9dXg/cPAw==
X-Received: by 2002:a05:6214:e4a:b0:6ed:2289:6623 with SMTP id 6a1803df08f44-6f23f191ce8mr39928946d6.10.1744473921131;
        Sat, 12 Apr 2025 09:05:21 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea07f3esm51541616d6.76.2025.04.12.09.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 09:05:20 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: sven@svenpeter.dev,
	j@jannau.net,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	marcan@marcan.st,
	maz@kernel.org
Cc: asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] cpufreq: apple-soc: Fix possible null pointer dereference
Date: Sat, 12 Apr 2025 11:05:18 -0500
Message-Id: <20250412160518.1824538-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_090523_158858_D3BA324E 
X-CRM114-Status: GOOD (  13.10  )
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

Check if policy is NULL before dereferencing it.

This is similar to the commit cf7de25878a1
("cppc_cpufreq: Fix possible null pointer dereference").

This is found by our static analysis tool KNighter.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: 6286bbb40576 ("cpufreq: apple-soc: Add new driver to control Apple SoC CPU P-states")
---
 drivers/cpufreq/apple-soc-cpufreq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 4994c86feb57..3de9bb2b0f22 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -135,10 +135,14 @@ static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
 static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct apple_cpu_priv *priv = policy->driver_data;
+	struct apple_cpu_priv *priv;
 	struct cpufreq_frequency_table *p;
 	unsigned int pstate;
 
+	if (!policy)
+		return 0;
+	priv = policy->driver_data;
+
 	if (priv->info->cur_pstate_mask) {
 		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
-- 
2.34.1


