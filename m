Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43986C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 11:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVXKrB+O1fh/6+48GtXPh7iohUuDCptQ4J19ggAdm2o=; b=VvnCfYtrhDHB4TFETm/wlpIjoR
	vdPkcQe+AwGKo6sMO7Q9c58kVATPL2AXo62+1l2DOonzQBzIQYnF0luJ0iBu7qtrpPFRFHK+SI5mu
	fUaZaM6c/KYucxvN0UczWC5ORdVfzQR1iLpnNIm0gsoVhcuyymS7JyqssZUKJP6G2iD14GTWlkqZv
	IYWIASYOCwoG9k9qKn0jEhoccYGeOFbYQrkfcJckbYkVVHBXCHeUci8O0nrmYg7j4lbmcLi+tredO
	gcXtnzT2a5BthA38L3LI09s7cqXhjuoavVJfAXLzwOJ0RKvz7UvfV8H/hRpnxewPbD8tq3b7qKOyT
	+pTPPMDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHhz-0000000EYNx-1mZg;
	Fri, 24 Jan 2025 11:18:43 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbHgb-0000000EYD7-1uEm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 11:17:18 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1079105f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 03:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1737717435; x=1738322235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVXKrB+O1fh/6+48GtXPh7iohUuDCptQ4J19ggAdm2o=;
        b=c81RvcdThfHOSvdwsTjJkYC0gbInsCWl1sKpFvfr9rpjKBGyQnyrsGT0foekoETDmA
         hNeJkIbhUVyoNGbOzgYVAj3HDnFCm12haQ0d80sJzm4qQDsJpBKtG6imf28fiScrg2MB
         7CQBnfV9XBRzYVHxd2627kM+CX2nxhyrHcJoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717435; x=1738322235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cVXKrB+O1fh/6+48GtXPh7iohUuDCptQ4J19ggAdm2o=;
        b=C3nqCYDcAOQtsyfRfp81rCVKeA5/qpVws8OTAK0nuAm4a67YMiLv9QwE7G74WqILEw
         doeD6fyVNdbrjfoQJooyW4dLyDQwK8PxQEMaBC5NcO89SMTfUqvuROm8OI8miEmBTzqu
         fYVfH/9mN1m5bBplAsKKqNMLM8IsjiPqtvGLSgqZCJ40ME4OQM4BvwNWNz9+nGTyh+Dv
         BtYwDIJBHXPrbDtncCNvJ3/Lgkx3PrHWYDHVRTdLBVxPPAzeasNzsm5O6MsxWP2ooR3F
         djVUSwEJhK/IMjLfHQGzXF/NudjzWxlQ+7TDztSGjgQa8Tcjoxg+r1+ZYFWq1k+Qcx68
         Mibw==
X-Forwarded-Encrypted: i=1; AJvYcCVXnJvJo4P+MR3UzkCWbkMocV03kNMBRJ2uJdKuvQZt3Vfys5dShbU49W7jo2yE/RYThmRlcvUWj9glExEbehWc@lists.infradead.org
X-Gm-Message-State: AOJu0YyllOpU3WheCC9EMUr7ByrILYNLJksEXAzcDX8j84md1V9TE3Nl
	T5ahJGE57w/LrnP0HFgiFhu8HREmAZvJSuSfYrk8uOiV1VZvojhsw19dPBjY1fI=
X-Gm-Gg: ASbGnct0OYpmjhciUiprhjIAMxbDqKNSNfJH+ic4yIiVDTP+Ho4aTfrxyOG2vdB9x2x
	iLeeuKglAI1RaYLd+KvRfV+pbCSwAQQdgRkKT04gWPmjgO6e811tuhGm5/digl5RC9HNg5x+I5c
	/AVjPyWmsGg1wdbhbD0LfWlkBn+z2rOEW1PLM2iHJee7rpBzwDfzbIYuijlOUP7QTcOHPnL4kpC
	J9oU5k6TmCh2QekRNWSYurZblppKFeccHDfXHZRTBtj6lZmew8SN4Id2GNAppNhELlElF5U4FIJ
	0EsQUqVsA+xoqq+/weT3Qsl3eOn3UCsrYgmgcldhKg==
X-Google-Smtp-Source: AGHT+IF7P9coZufZpIyRLi78wcbOmVrALszhypBmaNuECTkf3A9PTixnF+7VqbmWI7lij1JXG+mT6Q==
X-Received: by 2002:a05:6000:1a8c:b0:38a:888c:6786 with SMTP id ffacd0b85a97d-38bf57c063fmr27161921f8f.52.1737717435139;
        Fri, 24 Jan 2025 03:17:15 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:a445:7786:b555:5259])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188bf5sm2431547f8f.50.2025.01.24.03.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:17:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] clk: stm32f4: fix an uninitialized variable
Date: Fri, 24 Jan 2025 12:16:54 +0100
Message-ID: <20250124111711.1051436-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_031717_500587_5B454209 
X-CRM114-Status: GOOD (  12.40  )
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

The variable s, used by pr_debug() to print the mnemonic of the modulation
depth in use, was not initialized. Fix the output by addressing the correct
mnemonic.

Fixes: 65b3516dbe50 ("clk: stm32f4: support spread spectrum clock generation")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 drivers/clk/clk-stm32f4.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-stm32f4.c b/drivers/clk/clk-stm32f4.c
index f476883bc93b..85e23961ec34 100644
--- a/drivers/clk/clk-stm32f4.c
+++ b/drivers/clk/clk-stm32f4.c
@@ -888,7 +888,6 @@ static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
 					   struct stm32f4_pll_ssc *conf)
 {
 	int ret;
-	const char *s;
 
 	if (!conf)
 		return -EINVAL;
@@ -916,7 +915,8 @@ static int __init stm32f4_pll_ssc_parse_dt(struct device_node *np,
 	conf->mod_type = ret;
 
 	pr_debug("%pOF: SSCG settings: mod_freq: %d, mod_depth: %d mod_method: %s [%d]\n",
-		 np, conf->mod_freq, conf->mod_depth, s, conf->mod_type);
+		 np, conf->mod_freq, conf->mod_depth,
+		 stm32f4_ssc_mod_methods[ret], conf->mod_type);
 
 	return 0;
 }
-- 
2.43.0


