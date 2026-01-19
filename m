Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E37CCF2D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=19Tlxmtj1wgd7c/Wqw3aq86mSes++ziMKVUPZDLOdm4=; b=xxFoQzI9ivSZsO
	XXVEHnn6qvRdZyQlHr7ecT8ruGKC0D2CzDNH9G8OmEhYQt+uzWfcQ1gGAUrRWJyU/M0acKHFbtfEf
	vo2agQrTZt8uuSM3jUic3z6QEoPogZokH4V8pdNYo3MkBRRZ9+sQHBWF9Slad1rvY63b/U8wXorfh
	8CpwCyXD4KIb7jpwLkO7rWSjSP+dykaU+iU8G9iX+5beTHSptoZ7m1a/gE4rY5x5/0hGzuMsQdFvY
	Yxp4srZiQyGuguQ1I2PrHGcN/reqLg4A2nSqCnHL81n1ljO45JH3ayTo6SLQzVGMZEh7Rt+rIL0pl
	WeKxbtCxboW8ZuYeKWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmCF-00000001ikq-48DD;
	Mon, 19 Jan 2026 10:09:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmCE-00000001ijn-0MzF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 10:09:19 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42fbc3056afso2472514f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 02:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768817356; x=1769422156; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=19Tlxmtj1wgd7c/Wqw3aq86mSes++ziMKVUPZDLOdm4=;
        b=MoEU/VKm9E5ePjjCpzDx63Dsb2LgcQoSJKYaYKtPdNCATIPhUgZRzjsAasma1LLeDG
         ResSLYu8htKwnmaoAaF2Q6PmZrOfOa7JLuQW+ojqXhWeP93pcwlMQs3PgcIeO12Eu20r
         BAxUNERYCghC0teKijPd5ZhALYZyQcCw1t4JXPtSsG0EJLnpAajgT2O64HKhXwr4ghvD
         svbX/fyf27qa3IbBIf7eEf7eiiho6HQx7682jdlkh6VBL15iHQJv285OfLtCwIptc9X1
         dXAZ5WzE04e4aqgPPejoRLtvtUzDZv5NH/iTCpkdw+Vkh8t0QEYlq5nkPg6NlrYCN7Ym
         Gveg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817356; x=1769422156;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19Tlxmtj1wgd7c/Wqw3aq86mSes++ziMKVUPZDLOdm4=;
        b=i47ptTX2Pd175hfJ9cUwpqJUKnrcII31SkauwPqZvLBOnMaFs1fQ3r4A6/q7WHmX9G
         nUhYMhfOeUeoFmDydnT5j15i2WJFKcG2/faQHzficP1iYNxZ7yq1dW31OqOQIrLImaNN
         +jSetVtGTl8nqbZx1w81fB3k7Lnf2p+kh9egr4m92DKwwY7Dd03J0G1H+XfZ28tpeoa8
         QdwoUznU67hDL802aVduS9l4213WtYWOE422ZlQTpS90bD7MTzxGlOECe9BA/8mdfboG
         0IckA/1X+yJlIoFDIsodthVMKkq9CXjTwFWRyuA1WsPaRPKdNByNLbWTYC6ebTHsg4q7
         oyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9gA2yDfgK2sZq85Q9nh+YTurfFuFH0x8OVh7L6YvvYb3kIe93fxBAcwvW51ja5sNEtqLHYlqC0W/Ju7uOyaFq@lists.infradead.org
X-Gm-Message-State: AOJu0YzM13PuoRkSLCYrCACywRGCnF8YNEO8Fhqhf40ICX3TXrIjN+Kh
	vicsCWt35q+SMUK4G38AzoQO5s7s+ko3o2zAbpcwtTPo0yfJwgtp8ov0y0FpK2yGvzk=
X-Gm-Gg: AZuq6aL2jWFYcl//MYUFx2MP6RFutwz2jLMISu6d7lJ8ul+3dqQQ/yb2EHjMgZFMgvc
	rOPGGfFvOGXRqw2zqruHZKnIkNhPMV9pooC56j/toK+EMOgO0SyOC9yqvY22KsyNJ9rQ6PPVwct
	KyBQZO6Kjzk8THSgu6pYvNLl3tdE8I6Yk9A7jvs2RI7g6WnJfGCSKlEchar6yMp7X5fFqcZaxC8
	dzE7BBqGqmFjnKMRNpFhXZcPKiVdfwsBtP+Netb7vESxFtD2AImMm5gExLwNZPXXueA06twh5zK
	wPA7CCuc+AEfqJJILpKpmtG4HAj3nZBDlsgiJT6/pTz3wPTw78Q87Hj9zbhqMFWCVXqwP0wvNGw
	mQumXinCwVzyhgjTh2eRM5pqFocEQlULhILo402yrfu9MBu0cTqaSUtouYT/sGDTLO1ueAP/RCp
	ZIpPin+/+kVuYJnj8r6hC2
X-Received: by 2002:a05:6000:25c7:b0:432:dfa8:e1b6 with SMTP id ffacd0b85a97d-4356a053748mr14605338f8f.39.1768817355664;
        Mon, 19 Jan 2026 02:09:15 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6cdsm23234802f8f.31.2026.01.19.02.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:09:15 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 0/2] (no cover subject)
Date: Mon, 19 Jan 2026 10:08:15 +0000
Message-Id: <20260119-james-perf-coresight-cpu-map-segfault-v1-0-a9cfd67653ae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI8CbmkC/x3NwQqDMAyA4VeRnBdoC51jrzJ2CF1aM6aWRGUgv
 rvF43f5/x2MVdjg2e2gvInJPDX4WwdpoKkwyqcZggt3533EL41sWFkzplnZpAwLprriSBWNS6b
 1tyCH6ChHor5/QGtV5Sz/6/N6H8cJgYXI4HcAAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
 Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Thomas Falcon <thomas.falcon@intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_020918_141448_A277E3E8 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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


---
James Clark (2):
      perf cs-etm: Fix decoding for sparse CPU maps
      perf cs-etm: Test sparse CPU maps

 tools/perf/tests/shell/test_arm_coresight.sh | 54 ++++++++++++++++++++++++++++
 tools/perf/util/cs-etm.c                     |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
---
base-commit: 571d29baa07e83e637075239f379f91353c24ec9
change-id: 20260115-james-perf-coresight-cpu-map-segfault-e250af5aa778

Best regards,
-- 
James Clark <james.clark@linaro.org>


