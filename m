Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29252C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYbiAMRoMV0hiAkufuN0q0TYEj4Lvw0IVcfL3LWIkWk=; b=cY1z1+/0psndpeeC074I93NkMi
	TojI/hU9WMsfta/jFxy2uZmmdJY0zlHkObwTRGCGS9Tl33huuSV8NNAAGTKf2XzsLzaP7Lksf823R
	7WjrcoQD5EWemY6EjS4i/J4Icxl72zhJF6J3Q9c0cb3VRQA3tFPdpColnGUIDhtFwadTm4tXiqKeG
	DIPoDiKDQlZcrfI5Lp1QvMXISazmNI9YM2HIsMsCUEm7Aj2i4xPws3ZjKvzBP8vyz3MlOKLDBIoMZ
	YvdbMQEORWP44RbYDRo5cCqLeGTuWqERvBkgNIo5Bd9O9T5OuZ/mYks8ZiQ+RdinVP7Pc+0g/bTs5
	8REjWGMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavcE-0000000CMw1-0tlm;
	Thu, 23 Jan 2025 11:43:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavXf-0000000CLqg-1l92
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 11:38:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-215770613dbso8682385ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 03:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632314; x=1738237114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYbiAMRoMV0hiAkufuN0q0TYEj4Lvw0IVcfL3LWIkWk=;
        b=cPesnfwF9LMi4kIxF6smbSVhJNR3wvg94s4vk76XrQXL0JsM+6io0DB6AaAjVkISSJ
         DiVbYH0Q2HhQbsi2Q6vlO3j+SXbhKJPY0jzKFOjEo1Xk1XAkXSWdcgnL9vOILly7D6AY
         ir9ak+J8D3gTZc7C7g8X/KLzoSmedm/N3p4gwhzUyNoiPhw6s+OvxRB7VX47Xlw5T+uK
         4BpwY64ZJwJ+aaCLZ2ZOf4ahOdYlSBWM53Dgzff62WRCqtyt3gYQqee3lcV033IzaS7i
         VwYqnzLELAcdNCsO1jNF+I9zMq+0L9h1xxCqBAAH5OZL8PK6Q8koFliYZ5dW3duHBM02
         xWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632314; x=1738237114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sYbiAMRoMV0hiAkufuN0q0TYEj4Lvw0IVcfL3LWIkWk=;
        b=PCF8Kq+P7nlSgNqJGuUeu8sggl0JbIy0rvpHZ6MqsBVy+iDmDPmPgOPd58jFFMd2TQ
         dIy/AQ7pKe3boW/mE1Lb9lvGMkO00OAV/hgvVyZ91u558GZ9pgL6yjq8Vd4vpsYMYVGw
         DoP45fd6ssRpUDXW6xU48/Qjm0X62RN4mZKRBa6QsDokO9Vp+eDgDwayuq2mVh/5f0lS
         fz7uJ1Q+yTaZ1VjSZ+zrNllR79Sq5Q2ebL9hR5P6IG12Cd3vxWWfpUYgdeDTztfnFllm
         DtGKoCYPycKYJXvC9Dg/+O/87ISBhwm4kDBlx0mYbl9WRgNfedMd0Ra+TAgULP6QNIO6
         ctbw==
X-Forwarded-Encrypted: i=1; AJvYcCUGRJIfhCG3MxiFVpKsbHCmfr8w9KpFvLYACPjuOny1hhI0GW4aPi5yPTnfESudCOWWNRiYW2tRrjV6SMXrhj82@lists.infradead.org
X-Gm-Message-State: AOJu0YwXDn8YCB/m6Kti8GGIJ+d5UdfufGF1dWUmsCTYncqwcyIjmjtj
	LtjD6EBP7TF4kw3EfgyZV6zsGmy+h2jUFuNF1S9vMKg1NK6GU+Y3vywdBETRdpg=
X-Gm-Gg: ASbGncuPe99a2kYtMqJY5kqq5fH4GkLt/ep4lMnvexAMk8yWtge8nRFutRxyyS6BkWO
	UIKy6kLmPHYg3AuqPfrPtWOV57lekeVGuJQPt4kKq2eEO2cGoP+/4Z3m7XxmPmBoFr4Z/Kj9ieU
	bThsabhjD3+db5oQcjki4H4xt2zI/yRtb7yWGOwwlKYmsVDfJqEtfqxobQlME1GP/1TnYldx1xX
	WZSdqSkz3C+Io/mQK9E0mgBuGTmLGyB4LxuGO6++eNboNDqjPIoDTGdhLnyi4KoeJ2rzpEu5s1J
	bXkrwOo=
X-Google-Smtp-Source: AGHT+IEWmtbirwXj+IQSwqe5xIcegzpevjEjqaadAFbmkiVSRl3S49VNOuJSbdJ9u4+HbITo37I9Vg==
X-Received: by 2002:a17:902:d2c9:b0:21a:8ce5:10e7 with SMTP id d9443c01a7336-21c35530380mr379810615ad.23.1737632314631;
        Thu, 23 Jan 2025 03:38:34 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ce9e938sm112035515ad.44.2025.01.23.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:34 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/33] cpufreq: imx6q: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:46 +0530
Message-Id: <5d3f8c59063edeffb48671025685f0189b052654.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033835_454125_3CEA0E45 
X-CRM114-Status: GOOD (  10.46  )
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
 drivers/cpufreq/imx6q-cpufreq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/imx6q-cpufreq.c b/drivers/cpufreq/imx6q-cpufreq.c
index f3c99f378ad6..db1c88e9d3f9 100644
--- a/drivers/cpufreq/imx6q-cpufreq.c
+++ b/drivers/cpufreq/imx6q-cpufreq.c
@@ -207,7 +207,6 @@ static struct cpufreq_driver imx6q_cpufreq_driver = {
 	.init = imx6q_cpufreq_init,
 	.register_em = cpufreq_register_em_with_opp,
 	.name = "imx6q-cpufreq",
-	.attr = cpufreq_generic_attr,
 	.suspend = cpufreq_generic_suspend,
 };
 
-- 
2.31.1.272.g89b43f80a514


