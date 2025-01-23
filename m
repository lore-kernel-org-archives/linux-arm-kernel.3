Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9AEC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kw2sM+GGGQCvi7C9fRiq4muvzn9J9eRfRdcwd5c9mE=; b=GgqZEyC7KTsNb9C45Bn42dkXSy
	nSnvC+vjDJ51RXiWiizj7+P7zani1ixkEE63IXcZHGI5iYYWEc0jbXQfvaz7bTJOVU+hdIFyjLRtF
	1kHtM1TUprZ521qjFmowGtCpiUrbASs27ON7JrzJIPYfGUwV644kuV7TsqeCi4UczE+4i+fXy4xOK
	6jRwOhx+YAQKrpfbZhFvgzq1J90ipusqjgaEuDfSzi+nw3Ola7fl7ZY+SK+VgvZkS1qjNvO1fXi1z
	i+EPY4URoHFQ+nFQwJ1c84BaaDdivG/GXFoYwMYkHfS7Q5uw4u5+YLHYNhcgvuMEYDFvBXwEGFG0g
	SYkAAm4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavZg-0000000CMKt-3LWi;
	Thu, 23 Jan 2025 11:40:40 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavXK-0000000CLmG-2Pl8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:38:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ee8aa26415so1507111a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632294; x=1738237094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kw2sM+GGGQCvi7C9fRiq4muvzn9J9eRfRdcwd5c9mE=;
        b=YPmjivc2y69Z/iySLElDP7nxWFnQWybPgFaSFCfL4fqR9FMqn6xM7pBIwJOKYX+I0W
         C7uTkM5X+CUZ5mh00SQfGYRcXxh5EsVXT+hJ6e+F7Y3tblhy2uN1FZE4cPjLVf8SLF3E
         qJiFmIrpL/ASxM2mRbpFNHNemr5GES57GVbVlIACSnQR/wHv+PZNfSmMYjjcUQ7UpnSh
         y2VDq5vsgJxxeRFWmnqSxUcT/3bUoZ9qswhfTIcToXIzggYE7vbdVVpiGVQ0zsYEgBIA
         4ufCQfkZ0B9q1pOxsYALPuqra+5Eo8DY/Ut/ykNd+9otNSsorSeNXSmkoUfEEMyNUD/y
         vwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632294; x=1738237094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0kw2sM+GGGQCvi7C9fRiq4muvzn9J9eRfRdcwd5c9mE=;
        b=IZzI763ZMqXOULDhg174F1WfHQTDn9IVnIexnXZxAHPSIO+LVYtXL9AIBsGUvPkfoL
         2eLqyLcEMPEQ492d6wClxl8/pwTUT+p7sxphP5+y09dLQtPlkIqnF7nJygy5/7oy9NGw
         bZ71NKOHZ1mscOziu6hUf4raRpaxDz/auKffcEtDX0rs9soiwII8SgLSOUbQKA3U6K57
         WFNou+7ByMaibxPnMU3c2Cz6pyyq4KTnpdGlPl/zxgqOvvWUycg2478LKt/8kTGQ9L6J
         LaFT+j7wbvjwPMUaXvHtISY0uhxVDPllCL2xN1VA9s8lG5E8JiXkZ393nT/BytxL/LGw
         kf5w==
X-Forwarded-Encrypted: i=1; AJvYcCX8Mz9KyWLPjgUnxVoa9TDx/TYwjOq9X1Bjdiacdj0ybw+Zt/RkgBHm4ZayaDZFjANAsRT2QjD/+4Zm2S1fykpU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqdpj3DAevNYu1P+E61hYkUnCI5k43H5OPx9caYSPhGpggrrT5
	4yfdnYnBcqcUA473/xJkhkKgKVEF4MfY/D29hLmHs6SNR515aLw8BvrKOnzxGbk=
X-Gm-Gg: ASbGncvShxli6BE8ETaSdyH7gU+zk6vTguHI8InRuLb0LZYH3hdggc2bNe6Wloef+79
	TCGXP4og4RSKUym+mt3fc1wdUH1LLrhcF7VGq0aRvqj+nN7UxaewwsPxkB+8Z1EgVs7IPVnC/R/
	ATY5Qhp0N91As8yYVLeJ18wwI35deIH2tgU5t7peYjZTm8MWiAik2mu3caX0M5o7gbgJX2sNp7/
	PnCOODQJ1ag4q53UgkMPezvGqX+9W3fMWOWmFwnRgs7iAGDb7QdkiPW46RhNEDio7Zf00CMSnQ0
	YLFWIIA=
X-Google-Smtp-Source: AGHT+IHWLM3diQyfBwkugU/sw/GmrdkJCg0OZDXV8IndopAoO/pn5U57ZDPYAMTatmutRubStW8Kvw==
X-Received: by 2002:a05:6a00:10d4:b0:72d:8fa2:9999 with SMTP id d2e1a72fcca58-72dafa03124mr36163356b3a.11.1737632293795;
        Thu, 23 Jan 2025 03:38:13 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f06c3sm12714223b3a.20.2025.01.23.03.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:13 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/33] cpufreq: apple: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:40 +0530
Message-Id: <17e7f171a63d9104a0688d223539d36feead8790.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033814_634948_F00BEBF9 
X-CRM114-Status: GOOD (  10.64  )
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
 drivers/cpufreq/apple-soc-cpufreq.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 269b18c62d04..6ff604a0fe79 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -229,12 +229,6 @@ static int apple_soc_cpufreq_find_cluster(struct cpufreq_policy *policy,
 	return 0;
 }
 
-static struct freq_attr *apple_soc_cpufreq_hw_attr[] = {
-	&cpufreq_freq_attr_scaling_available_freqs,
-	NULL, /* Filled in below if boost is enabled */
-	NULL,
-};
-
 static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 {
 	int ret, i;
@@ -321,7 +315,6 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 		if (ret) {
 			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
 		} else {
-			apple_soc_cpufreq_hw_attr[1] = &cpufreq_freq_attr_scaling_boost_freqs;
 			apple_soc_cpufreq_driver.boost_enabled = true;
 		}
 	}
@@ -360,7 +353,6 @@ static struct cpufreq_driver apple_soc_cpufreq_driver = {
 	.target_index	= apple_soc_cpufreq_set_target,
 	.fast_switch	= apple_soc_cpufreq_fast_switch,
 	.register_em	= cpufreq_register_em_with_opp,
-	.attr		= apple_soc_cpufreq_hw_attr,
 	.suspend	= cpufreq_generic_suspend,
 };
 
-- 
2.31.1.272.g89b43f80a514


