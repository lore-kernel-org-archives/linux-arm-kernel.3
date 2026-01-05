Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C58C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZDEZfxXGKUHqnD6uzu3JESKT0vdq+bi9ssWL2yPlp2w=; b=l9KzviZMFkkKba8PFtCAIc4aJc
	Yo76JAUotnLDpwAx22Bhf0o1OkbLyBA9nnPT0NHIq90E/IyAMAn3JBM3kcPdSJ/tSv69KdwTuXOfc
	CMcc9Bumq4ibq3uGK+DSi9DgE0y/ZBZKsgAbfOm7IneDvDSqIWS6fhMRIunvSUb3DpAYUkQXJ+f2U
	GLe+G42v+WBAwIyaaFPDvD10MkEz1uUoas6QznQhjccPG37zIjjZ7fMpsXs/Uyte/5dUkUEVdTsz/
	6ayRasoZGbklAWjDG8wLhtqEzps5G4OqS3iD4B1RHpol27tlV/q0eRRruKYADlQnrAF7o5BzeepZU
	yxYgYwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcheu-0000000B61r-3ohd;
	Mon, 05 Jan 2026 10:17:56 +0000
Received: from mail-pg1-x563.google.com ([2607:f8b0:4864:20::563])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcher-0000000B61U-3JUh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:17:55 +0000
Received: by mail-pg1-x563.google.com with SMTP id 41be03b00d2f7-c1e7cdf0905so10401267a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 02:17:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608272; x=1768213072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZDEZfxXGKUHqnD6uzu3JESKT0vdq+bi9ssWL2yPlp2w=;
        b=LzlgzFHOYljvYEPjwiD1Ola0YHfEsfmWRrGDtpCMVCGiI+ZB+vI4anFvTgjzpQ3F+e
         njOk2Gi7xLD4HrTPkslMgvWjkmwkKjEIAkCrfEJXFigLeBwAEag3bOH49n+z8cs+SUkw
         /sEzFMYJKhuHWXJE1N3WBup3dmt7XHtWXyXNjo6yMofP3DXZ/OYZlamur1HBOA1ig/k0
         o3LuWlnqEgy0uymqQfPRAGdBq4wYC0U9PR8FMAJNoQZQDEaxakv/J0cBX188mZ1u2xrG
         2kP+788tP2M59aClsW1dWTPkKUHRi8BgGTwbo8oAvDb2bHtkd63XHX2nnWCFQOu6DjBs
         /ESw==
X-Forwarded-Encrypted: i=1; AJvYcCV9X61bci90FqIjAcnia5QVEbUJbOc0UKf7o4ZYCZFufg5o+VjDAjo/bqCkt+tea3eyiwNg42d7RLH4MlqlmKdD@lists.infradead.org
X-Gm-Message-State: AOJu0YzDAUfYuGbCQjgJyjlp0o42UfgYa8NcNsefhvN/A+glhAYk1TkG
	2elCf0HGavo5HaMJyfb5Q4I1dI+d6X6ecWHs3/BRWCtb+AuMwREcWw4aHw13nNrIzrxgaY2Tb8t
	AZfa+jZauyfoW+4N0G9nWAJbd7SGwsb1rrvwGAb75U8o+Haj3aJaMVNlv6P1GUgT2hA+r28B5og
	V4/j9ZbEZsf4ZWKRN+em7yWagfK0tcMJqvM9gGcosWLaG3B+hf6GZZHIMRvZ8nVHoCP7JjN25Ek
	tPHnNSkIwZTzs2eb+x43uxNGoGrfcn8UT0Q
X-Gm-Gg: AY/fxX5N4QQphAflKEMTg11S/VY+QGgYBAJP+sUHXDJX5mLAXBKZt2Bw/ZmzYDvbIa8
	CUuLffxVHfSO3D4GYzfgo+sWpwXf7yN+ftSJqjMon3X/3btrgVW/vxpf6lcAc1V56SGAKvYtWk3
	iUYrwSvI4Syo86bNo5VErn1hP6akyLg599zqFA1bpjUchRqS7yCQiK41lN/ZDnrNDJsp86FpE/g
	0XSWvil91qDOm5BQnAW4cgLiTXFBg32SMQznpkssD/Gr7iC0DgHFbaqwgXQ9ErMxrijX/aJ77Et
	lbeZpae7lWa4RinvRA5XsXQBMU3I7+oK2YoPr14jtiWUh4sNj1u4rx0AEGmbr692PBrwO/LoYNM
	kHVnfAKsEJVaQtL5n2S9mKnuRb/cojBHIOMMv48JhTFdaSqFLVp2kvkqgZ4quyHPxathUJp1F/F
	0CD0KhWl4a7ndCU73JyNmcolCAcPXQUwRuPOsiEYOpLL5V6Dk65Y8=
X-Google-Smtp-Source: AGHT+IG9m/u2TtfJb6Io9UYHjaInYXVESvRtcBZILrdJajL4Kl5x2jl+lXRfgSGL/8l6FpST4gp5SxDjAfvH
X-Received: by 2002:a05:7300:8289:b0:2a4:3593:9697 with SMTP id 5a478bee46e88-2b05ec30e85mr40229046eec.20.1767608271900;
        Mon, 05 Jan 2026 02:17:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2b140c614f7sm1340334eec.4.2026.01.05.02.17.51
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Jan 2026 02:17:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b90740249dso24664927b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 02:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767608270; x=1768213070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDEZfxXGKUHqnD6uzu3JESKT0vdq+bi9ssWL2yPlp2w=;
        b=PkEa9UvkQlUPklowzNx98fdm6Rl3G9INA8eZoJaZ8sr6gw06luq/hBcstws28hpSNE
         BRR37iPjlOxuSq37kDgqzRX2cUu+aKERKR8KpVn1l05NzzZzgUTJuyoIEqryjpP9xGCG
         /t/zHWTCl1DjkdthancI/mQSOR8risN/ifqpI=
X-Forwarded-Encrypted: i=1; AJvYcCW6u/eQLKPBbw+ffHV/gy8ONgIyt4xPDAIkkpeo4cID6d9sLdSz5/OkSz3VE/ps1bVX/81OwgoE24QlSzKBPDFz@lists.infradead.org
X-Received: by 2002:a05:7023:905:b0:11d:fd26:234e with SMTP id a92af1059eb24-121722b821amr43934355c88.16.1767608269929;
        Mon, 05 Jan 2026 02:17:49 -0800 (PST)
X-Received: by 2002:a05:7023:905:b0:11d:fd26:234e with SMTP id a92af1059eb24-121722b821amr43934337c88.16.1767608269346;
        Mon, 05 Jan 2026 02:17:49 -0800 (PST)
Received: from shivania.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254d369sm170077924c88.16.2026.01.05.02.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:17:49 -0800 (PST)
From: Shivani Agarwal <shivani.agarwal@broadcom.com>
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Henry Martin <bsdhenrymartin@gmail.com>,
	Sasha Levin <sashal@kernel.org>,
	Shivani Agarwal <shivani.agarwal@broadcom.com>
Subject: [PATCH v5.10] cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
Date: Mon,  5 Jan 2026 01:57:01 -0800
Message-Id: <20260105095701.659420-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_021753_985141_FDBAD8EB 
X-CRM114-Status: GOOD (  14.45  )
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

From: Henry Martin <bsdhenrymartin@gmail.com>

[ Upstream commit 484d3f15cc6cbaa52541d6259778e715b2c83c54 ]

cpufreq_cpu_get_raw() can return NULL when the target CPU is not present
in the policy->cpus mask. scmi_cpufreq_get_rate() does not check for
this case, which results in a NULL pointer dereference.

Add NULL check after cpufreq_cpu_get_raw() to prevent this issue.

Fixes: 99d6bdf33877 ("cpufreq: add support for CPU DVFS based on SCMI message protocol")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
[Shivani: Modified to apply on 5.10.y]
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index bb1389f27..6b65d537c 100644
--- a/drivers/cpufreq/scmi-cpufreq.c
+++ b/drivers/cpufreq/scmi-cpufreq.c
@@ -29,12 +29,18 @@ static const struct scmi_handle *handle;
 
 static unsigned int scmi_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
+	struct cpufreq_policy *policy;
+	struct scmi_data *priv;
 	const struct scmi_perf_ops *perf_ops = handle->perf_ops;
-	struct scmi_data *priv = policy->driver_data;
 	unsigned long rate;
 	int ret;
 
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (unlikely(!policy))
+		return 0;
+
+	priv = policy->driver_data;
+
 	ret = perf_ops->freq_get(handle, priv->domain_id, &rate, false);
 	if (ret)
 		return 0;
-- 
2.40.4


