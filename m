Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DDE5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Apr 2025 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8WYvbjpcGb7KJNUByfcTCd3jRL1lDvJbZkLr6wZ/FRg=; b=R31BfFBnajZFIYI+Emzc72ryar
	bIvtXgUN/JbYPD8Ku1iwyKVUqUB3Nd91svETEH30Nl/0sM26LZflnH35Q1qPwmz5iCvykK+6O0Mp9
	FdCrYDKQchbVKldB4rF8P0T46/YM89NplIM3t6aW3RWg0TtPvClMMyI12opYjk4PxJsg6ATmrdp9w
	rxZunsz00G+++VvnvSNj7BC6gEepBNmCpSj1NV8q3LECVtS75i6RrgMg+ArmTDy8rug8Cwea4vnwe
	MlFv6mgjRXeSN4swN0wrBXuh/LFk4/eoVJzzmw8w0xTQSGXkEnRKwt4rbG9Oxbev4p3NwO6XYD5mO
	tiaOO3lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3fLj-0000000GFmx-04Ql;
	Sat, 12 Apr 2025 18:13:03 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3fHW-0000000GFM3-3HmG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Apr 2025 18:08:43 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6f0eb824f51so571816d6.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Apr 2025 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744481321; x=1745086121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8WYvbjpcGb7KJNUByfcTCd3jRL1lDvJbZkLr6wZ/FRg=;
        b=bQuW9wk/rGTz4HcJf+pByy3hnNsW0rzvFKJG7BQwsw9TXRnc9U9Jhaew7wLHdODJ4m
         VUrf+W9O/ni1ljDavCI4fDz3O4Y/RwEPnbmBU8RckA8RVqjPtNR76XPb7dNP+9/JfSx7
         0TrTkTIqr7z/lp3RHE8OAPchvREXmMN2ibB3swXmEEGWLdXUzxq+cWQCLMqDCDEgJvCo
         jhhMF4bnHyA5dG5RLfk2PXdWSwWsz5e0T7v7xby8lmleG1jq/AQHbFgi3ACNMGT/w/p1
         NUrwGCQjy/ABxLyPnWjzlHxHByWbmLs863hl87Ca/KRhwvJ/hSLh4AZX8PRgDpQUfxX1
         /hCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744481321; x=1745086121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8WYvbjpcGb7KJNUByfcTCd3jRL1lDvJbZkLr6wZ/FRg=;
        b=wYJSDv4BScdEj6F4lHCZWIAy1ZZeQj+IwDIHvPEB6GFjLdxUeYTAFe2JPadPQ4bWtV
         yAaufDzdUkN0qYx+s+W1N5jUzBKyPH2NtKQTpvsP/NjJKPigItbDSMCHpVWGPNtqaIg+
         KRIeCa5g33RUnjjfiqlcsL/0hrN16/UB5qiszt/13+cTsmO/HcVlwVcOtn5TsbTU2gHQ
         tsN17Vg1NCKqKg9IZE2r3913WULmM4vrx5SFFRoLaGD6X0lHiF5jiU/eByh2zAmsK9Rp
         O223u59vIVBeTByApyKG5ybbWy88SoLwo6CV8+0Kg8S3+JqsRBCFtnz/rLVyZSKvlRaZ
         1AvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHBZsFL1C6Z5dlOdwYb6f//oBaH1txPM6RtZgVo5GC/qE5BvR/vWSApCsOqx9bt0nZroj+s1xp+JdfanUGzG+o@lists.infradead.org
X-Gm-Message-State: AOJu0Yzap2jX1W7R7Z7TGxGoAdUTXELyuBRLVSCubQRjdia3ua3S6B5Q
	Ex/DCY++5JCjH0zTMBOsLhHTzT7v6NPcbPu0zlY2l7wOBZRlPdlZmHk8Lmw=
X-Gm-Gg: ASbGncsVCY8L+sNFnJukbzj324GBr2qVejSxtdedAtmINbSab6QgFJSDslr99xt2q2i
	PbNVe9s6SecyZsrnTvEAh7bxs8kJ85bQzyatwnpU5AybSlfJ6bSnNXm6neD8ynt9/RrBS9Xind1
	kRnOpYqsvEM5v3lE4jQ6RFdJ8Ws/HIvR5rID0x47a9U1cs6thsyqBT30i6xBxWUuR4i8B2nBXdL
	gUhRZH8lDQ4U0B7BlIO5YyMaL7jdpjml+YrgGrJI8UjGKc4fBCOZgac/Tv3J+rgO/rxJvzthSRF
	DpoeMbL4fyW/0XCjShmt1jWJXkIxjtKet2gfwQ==
X-Google-Smtp-Source: AGHT+IGuWwiwV2pI1FQDLCaq7IMqD3KTq9cCIX3peuLBaw7mxQTWHmOu3rz0clb0aOslnkPCVExtNg==
X-Received: by 2002:a05:6214:19e5:b0:6e8:fcd2:360e with SMTP id 6a1803df08f44-6f23f15d812mr34251246d6.8.1744481321507;
        Sat, 12 Apr 2025 11:08:41 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0de95f801sm54141916d6.5.2025.04.12.11.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 11:08:41 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] cpufreq: scmi: Fix possible null pointer dereference
Date: Sat, 12 Apr 2025 13:08:31 -0500
Message-Id: <20250412180831.3252963-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_110842_820421_149B4AE8 
X-CRM114-Status: GOOD (  12.89  )
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
Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
---
 drivers/cpufreq/scmi-cpufreq.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index c310aeebc8f3..ee916ce9b897 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -38,10 +38,14 @@ static struct cpufreq_driver scmi_cpufreq_driver;
 static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
 {
 	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct scmi_data *priv = policy->driver_data;
+	struct scmi_data *priv;
 	unsigned long rate;
 	int ret;
 
+	if (!policy)
+		return 0;
+	priv = policy->driver_data;
+
 	ret = perf_ops->freq_get(ph, priv->domain_id, &rate, false);
 	if (ret)
 		return 0;
-- 
2.34.1


