Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFE7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 05:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ELXP8BnMg0kJvaDE3S2jRkd/Etcxd1UmTQ1mFWYQwxU=; b=fjjG0Uek4xwNcS6zyDu5eq8b3z
	uRXEw5ewjJEHK6Gwn3OiB1C8s1A3eTnGpBywVRLcRVOttkL8AMSVo5pnQN9rZE6nA5m0zk9YJvFXg
	oS0LI2rHmHmXVMvQYv38xTHj6JG0RIYKh57XJ0dKBoOpq8MiBoSKTSaOEOWy3dzTZ3xVl38ildbL2
	1bsk85WWdBdBS6d7mlIE4QGX7CEp34SMMjUh3K7lIgJqnY2OR8DUoFMJaGr7sORbI4jPGbpuFuGgg
	F2qaQHfm4ElOjKemgmuOLehCSqLrkcvi2uZw7veuZmJR1SQdgcZKO60zk8zjShODIXGW3Hwsf2UMb
	V7hp8QYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0wWM-0000000DXO6-3SKE;
	Sat, 05 Apr 2025 05:56:46 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0wUd-0000000DXDN-0b60
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 05:55:00 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-736b98acaadso2699033b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 22:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743832498; x=1744437298; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ELXP8BnMg0kJvaDE3S2jRkd/Etcxd1UmTQ1mFWYQwxU=;
        b=AxWtv0ugTPNl5r/x9NRgmv7VyRSxhzEKF41iiUrQr+8cfMzezPXsOfaBR5mEUTzf00
         KGtnWAS6dVfqdvRMkPIaXwiu9Kj1PRexbyPC+8qkIQ7G0ZsxFgjs+F30DmqGyjlJB4GL
         A5vrBxc35ml/Y9HHSkbMH86FNG7YjRRCdiEvE7TENfg3uERnsMbuaHxm/3iycvEDNxO/
         n5jEbMJLOjd7/HfEFdj4On0vK2LCVVvoM++GFN6hSCve1W2l9EaEc2oBpfhYoq5qUQMb
         qbcAQMOUy3yB8+Jr4WvB7os0pfXqtooSrO9ULDNqOfcchxld8oDet4/bR8IhQ8p5hqGM
         TLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743832498; x=1744437298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ELXP8BnMg0kJvaDE3S2jRkd/Etcxd1UmTQ1mFWYQwxU=;
        b=SHugGOQTVPF/jIdLLBKZfjcSI1GccFFMAsHOUMHaP9iFGNaT9SHcigMW9xcnlIUbIz
         1TityplnQyemMWM66jU7Wx2nQEHJK8WYXcHFdQ0jgfkYyYUvY2pIQAArQpak0c/pNHLJ
         qHYE2DcJlqc1xx4nEZX6uRnVR8CB9PPpLVa0qR/2uKuLqU63N9z/c9HkQUJefIwR7axd
         HhNGwq5ng3ceSIZyVeMgZiI/4Tpmap0rH5D/nEMuA9a6mlKxMkSjRS9QhiYYBZWbDyru
         uuXwbtK4lMakZM/h/xYU7fyfo+MepmXvatAx9BAflwpT/lKiM3hQV/LcEcRq8UFej2Th
         ufuw==
X-Forwarded-Encrypted: i=1; AJvYcCXKNnJEqB8lm/WHJOMs7+TYA4TBrI6ZU9NJBAhk6Fk1hRsCphAfsIvbb8IC6Fzi6HVRRow7l6xsWT22kP4WpsPb@lists.infradead.org
X-Gm-Message-State: AOJu0YwCehoLiQnkdFPE2POF2hfyDHCvBt30UWgYBc3xdagbWfCRjlw3
	O8QoUUW3tYFxSrPI1RVHOOJtuTGFdfbgB+D/IEPAGVj4FMVpy3mY
X-Gm-Gg: ASbGncuxeeB6GsSKkcGq5M9Il9dWEktXjxCb+W0bP3FSYomLrUtinPbxanBSi6LiRER
	qpQc05tdOtSSndhWdQpfg7w9VBLUs501Vv7fUn+HpKTT8hERGGX6RfNNAucrE2R1z8dFv4amovg
	DHkyL1k2iM7kiytv4E0FM2/qi5MkroDa6zkQV11WrH/uvDmkmsQ+tnQMffaSFWrMfLp+z/VD0v5
	eKw2KMH9a7Qz4X/G6b8oZUtLMyq1Xs9JY0IfJtKrgGXqoB4p2+0dQ5aufsEo0zszrRXMCHzxxfw
	vOtDrRWIXY4AWo9UgFFzCnsTH9fOyMBMk1hYjLwsIkPzCmTxzNqB7ofm1G0IK6swqev7Vg==
X-Google-Smtp-Source: AGHT+IFYqOzn0CbqAzO6U16/vv3yxNPBs7vBAGPe7v1D1GRNSbbegU+qDr2xpouLjVmiFE9cnTiGcg==
X-Received: by 2002:a17:90a:fc44:b0:2ee:aed2:c15c with SMTP id 98e67ed59e1d1-306af788c23mr2724148a91.28.1743832497475;
        Fri, 04 Apr 2025 22:54:57 -0700 (PDT)
Received: from henry.localdomain ([223.72.104.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561ca5da3sm5555489a91.0.2025.04.04.22.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 22:54:56 -0700 (PDT)
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
Subject: [PATCH v1] cpufreq: scmi: Fix null-ptr-deref in scmi_cpufreq_get_rate()
Date: Sat,  5 Apr 2025 13:54:47 +0800
Message-Id: <20250405055447.73925-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_225459_180144_94029821 
X-CRM114-Status: GOOD (  13.18  )
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
 drivers/cpufreq/scmi-cpufreq.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
index c310aeebc8f3..c735f39245bf 100644
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
+	if (!policy)
+		return 0;
+
+	priv = policy->driver_data;
+
 	ret = perf_ops->freq_get(ph, priv->domain_id, &rate, false);
 	if (ret)
 		return 0;
-- 
2.34.1


