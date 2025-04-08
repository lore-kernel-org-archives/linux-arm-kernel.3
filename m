Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67519C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nojCoF+V4HIbKW8c++yPFqWUGF41mxnhAevsaFUXc3o=; b=k+nrlYCAkerOj1nqONTA4qA8+W
	HcRMB/u35nDyf8rYiEVGxPLws269UIYteJ4RhxxfFvsqd7ZNB+z5+y4AvgtU78AVbomryhlSEx4Gc
	c+RRGR+XkZeKHYqyyAphqpFwL431ZPUcn+Ck8p7f/aSPXseXwe6K4WvmKzy78tGtwxuc5jsjehYxD
	+SYsmX38M4FfTEe/io9B+Rl3J3sbFFzn2SVK4QkqoOdEwolkB94ewDWzYQepIMeytZhwtAVbL5aYb
	utMe5z2GP3PiFpaei/6maK96KqhxhFmtiPBp3SCaB+PLw9GCDUNAVfqma17bOAfmVYpMWbBYacDEu
	I3qoJF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AYr-00000004VwQ-1uLc;
	Tue, 08 Apr 2025 15:08:25 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2AUp-00000004VHv-2nvn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:04:16 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-7398d65476eso4472467b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744124655; x=1744729455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nojCoF+V4HIbKW8c++yPFqWUGF41mxnhAevsaFUXc3o=;
        b=k6zpcpq0NTvoZ+hJd3uwAVI5Vkarr5a5p852MJZOy36sZcGSGfPVpKhVrgq1bPpY8h
         LvpAfyOfbTVbhph5vSBLUdS/fDUlNeyKRJD3nZXHnH5exWcnjLWYhm3WNmNcYc+qW5/U
         eZwKhmIA5fT+wSnJCunWCfa8bsYSediVUg16iY6mDRQQQx0JfWqdd4xNjIENFmekzL9T
         in8GigrVaNGn2pf9/AViZxel6X4Zb223hQuhaJG5n9BB0k3a+3UZiT3OKF8wBjlMEjf+
         wG17XRTInxtzZlwbOBY6zHqVbcWG2+hNO6t/i+Xz5eVOuyB9h2iz4Bmz5GT9xU2AlkMD
         HLYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744124655; x=1744729455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nojCoF+V4HIbKW8c++yPFqWUGF41mxnhAevsaFUXc3o=;
        b=O5VGrcNHC1s8PuK8jSz+3AiCnsSpc/05bRXpo0qeBl5EENe1xy1K1CaZDfr16v3Urq
         xL2dHLKfDC1UEJVRFasaEsa92jI7+1DVK3KnrTvK+xWZo4WmkUoBbBzgPr4tl36wBMFH
         q3b6DMk7uMUi84CB92guptOhP93+vwpJseDRQUygHQj19iyFI+yqAkEJlFjRPQT2BDyI
         kkD0emFyR9yQI58QWkRdsDsvRCzS7zz/CdHaAyGzKS/KJznNTzNaX7lEV+Oyis4gJzEV
         DbTImRpwiEI7n6oFSpAYmLkRSezGxWLrXcZ5L18sueGMT+LWK+jtb1ycpMUbnC/d0gA7
         4ZpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpBUmd5ukNLA9Ta2lHDd34lvBwlbk4G3jENCl2HpBnr5M8Eta0g7yyg+/163MBC9bKY5nidlOfFB7Y6UUYWSTX@lists.infradead.org
X-Gm-Message-State: AOJu0YyYxbGRCA3KfwrNkEgKr417drPLu1qM8UjdLEbiw1+82Y+xGibC
	NsykRdMuYn245hSMpMsZffhnQrVNBXfPcHTaCnH/pc65fepSK7f3
X-Gm-Gg: ASbGncu2rbkENBmfU3qgNZYCpKiMmHGYTEvSjSqSpDGMwpNdQlvLa0rOSl2FkxgJuCM
	mXutX57fC7NrV3LjuQj5Uvd14Ww9ZQZq+y3yFA9fXSjIrLZtkth6it2GpbOgX1LRlJJ3ECjGoWw
	vEINBDX3k868riV1nQ/3aEg5xntxxE2QhS01kpQPkZtdri8DJb9wjmuHTyhaEq2WD1GP4xNPO+S
	oeHsDCM8BY5/cwQY0IHnNyhrA9vFkkNrvW3cMMEizTt9m17oU6NHiy2ZWrKvgW6SzqjDX3ZHJP7
	Z1wk2ig5PxkL4E91qvfdNowlITBMy0sEion6IRxts0nPhKuvyUaIkXzmD8XyPKJ9tCBZGxQ=
X-Google-Smtp-Source: AGHT+IG0+bqK8uWDDwg4kvTaDay13P59qHVKN2qH7CUeZ1LSC34EsRYNlmUz3zdEqAm6DQcIz3izpA==
X-Received: by 2002:a05:6a00:3984:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73b9d40bdf1mr6760256b3a.12.1744124654437;
        Tue, 08 Apr 2025 08:04:14 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea097asm11068474b3a.90.2025.04.08.08.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:04:13 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2 1/2] cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
Date: Tue,  8 Apr 2025 23:03:53 +0800
Message-Id: <20250408150354.104532-2-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
References: <20250408150354.104532-1-bsdhenrymartin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_080415_704448_829CAEFA 
X-CRM114-Status: GOOD (  14.41  )
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

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
this case, which results in a NULL pointer dereference.

Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.

Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V1 -> V2: Use `if (unlikely(!policy))` instead of `if (!policy)`

 drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index c310aeebc8f3..944e899eb1be 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -37,11 +37,17 @@ static struct cpufreq_driver scmi_cpufreq_driver;
 
 static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct scmi_data *priv = policy->driver_data;
+	struct cpufreq_policy *policy;
+	struct scmi_data *priv;
 	unsigned long rate;
 	int ret;
 
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+
 	ret = perf_ops->freq_get(ph, priv->domain_id, &rate, false);
 	if (ret)
 		return 0;
-- 
2.34.1


