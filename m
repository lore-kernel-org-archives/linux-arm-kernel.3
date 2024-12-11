Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF79E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6l1I2ck309o9qdqJYu3bhIkW88QmjXQLLkvder5A/zo=; b=gI2fxf7pPo/vOljPvC6pQBdeDa
	mgMb4ha/xiW+2c4guxqlI4gKeDl+Dcj57oFEjirICrScGGaTyRSAPUbXf++x5eTD7n+6tSM7bicG3
	kKToHHXDL2kKIUFNAePkPir4+obizC/ABsgzGCIvAoqPG+vw1OUFxYxdljqOdn3/kSlPqvg8oVatE
	Wxwjzzcgf1cR5dJtUgt3OGgFPCJNoch5Lc/lo615ahtxuGV0iJhtXfyiQw87N73yONqa38qTxPXvY
	+mLuhOoLiHhXGJFieLuqja7wO19obbP0PVMOpkrS9B1HM7dRHRdGr8W0bGSiRWORxpX5osm220NZG
	q8RHX0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKvL-0000000Ehmr-0W5n;
	Wed, 11 Dec 2024 11:30:35 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKoN-0000000EgJX-1dAX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:23:24 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso414763a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 03:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916203; x=1734521003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6l1I2ck309o9qdqJYu3bhIkW88QmjXQLLkvder5A/zo=;
        b=e1bZAYHbzFB5RQf7M4HNg7vwMFTmNSleSXnJpla8XBuchbtZwM+78F6F3thc03aYAZ
         qjWkh/1qrAzlsSFQ9sj7U9hjwY59cPHyhlsPCdU7B/wyNFfjBWVyfSzqV+46sdu9CPU3
         MZJL2lpL+keboap3r4sX68231/YyEmI6jTUUr92Iol87vzQEXTj/Q0CccVJZ7VYDIWyt
         dTgxrNK7C7bLw6G95MMGd2Qy/OXTrATKn4O5yVW1vfZr6BC+zITgZKUtRz18GHsTKfNy
         WlViiOB0i9l0dmZ4Zf0e4QjRQ7xEWlFCVuYRWbdG/+te26p5q28T9wvOI3s9r4USPi6i
         McvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916203; x=1734521003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l1I2ck309o9qdqJYu3bhIkW88QmjXQLLkvder5A/zo=;
        b=JjeB+irnRcBJdgbn/6k+KntmtK6umziX3w6HEyzSJS3bIFNEQk7iIiLGBxmQ6bc8iR
         63eDChINcMY33An8PBALsVBHGQOzO4uQ3k4TWT4t3HPzN2mHFf0dgJNUEhyhXs73dsBy
         cxlF4DDtLDJXOIjNe/uOCEURVhMwsbXDwsUqGI1f14rgD3csBFWqu/89ffV+Yi9eSM8v
         4uLBd8+MkvrtmtLwi5jV8HPHF2DYKWucMLHFxF0fho8UXxM4QE3cZD6q/bGWCp9W8W2C
         EuuJ9Thd1h1vp+zYNz70iPkFZSehR64djg4v214C/oJGtNqd/7CakRcZ2EGd3qnuY+TC
         zPGw==
X-Forwarded-Encrypted: i=1; AJvYcCUTlL6UA/Kn5B5XhPrYtqQCoTp07XzRgmgfsVaIVj06RXEoeIsLWWmUsZ6sAa+SjoAXd+O3zDrv/nJ40yw7LtUe@lists.infradead.org
X-Gm-Message-State: AOJu0YzOATwlmJjEx+ruQLqnz52JQQaoa2YQVxeYFTQLcTpRf4y05DOR
	xOo1Ok/8zQjjC+ntYcOviL8svGF+nAoVqd1vPbjgLuLkILdWDxir
X-Gm-Gg: ASbGncvvpm11qlKZzGlVut7b5bFdSp04zGtMwXXlE+lGez/7pVuOON53HfFT97NxV9T
	f8mlflSEngUhHfKRVDpnv3rLDPOkkrzD4YMsy43lVTI1L4JGYWOL3080XFaLjvNk05+bpJwrgy1
	RluEKF6Cosk5pr7uIyaPDGhEUChWonyYcGNWfbfImUbeXpmchG3JgC+4pvzWEOBXq6OKiGkWhgo
	DwRQt3lrtXILop+o/OUHnTPt4igYGQx/OojyNQ8JWDF9Vq2LYNfQVIvORhJSCsEqUcw1Q==
X-Google-Smtp-Source: AGHT+IFZ/i4RQlCJ3AH9/61VkIUfCaOigGZYmLs5RHyiP6u8Y2aWFd6COWq3vEZzepN3j6B/3uPbDQ==
X-Received: by 2002:a17:902:e54a:b0:215:2d2c:dd0c with SMTP id d9443c01a7336-21779e47121mr34337095ad.14.1733916202695;
        Wed, 11 Dec 2024 03:23:22 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:22 -0800 (PST)
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
Subject: [PATCH 6/7] cpufreq: apple-soc: Set fallback transition latency to APPLE_DVFS_TRANSITION_TIMEOUT
Date: Wed, 11 Dec 2024 19:19:33 +0800
Message-ID: <20241211112244.18393-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032323_424300_DDE1921A 
X-CRM114-Status: GOOD (  13.17  )
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

The driver already assumes transitions will not take longer than
APPLE_DVFS_TRANSITION_TIMEOUT in apple_soc_cpufreq_set_target(), so it
makes little sense to set CPUFREQ_ETERNAL as the transition latency
when the transistion latency is not given by the opp-table.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 94e57f055a5f..0af36f911bea 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -291,7 +291,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 
 	transition_latency = dev_pm_opp_get_max_transition_latency(cpu_dev);
 	if (!transition_latency)
-		transition_latency = CPUFREQ_ETERNAL;
+		transition_latency = APPLE_DVFS_TRANSITION_TIMEOUT;
 
 	policy->cpuinfo.transition_latency = transition_latency;
 	policy->dvfs_possible_from_any_cpu = true;
-- 
2.47.1


