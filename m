Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A51EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O2m2Aoo1Yj9SjRuX3tvCRBORIOzSUjs0HNbHFmUyy+E=; b=jZTaxXR7urh6mMnUlIzQqGUFos
	u0wDE9pUOD1S/UIRPS15hhovT7EFyqcUE80b+7Trqqmt+0DkrBmf58xgl00kzcFDDIRJCeRgNuac2
	cyvRsX4u2mzWnwhnq0YcInTxOtHWgpCCIIjoo42//lLFW8q9pdznuwE2aMZnxIOPoAOg/0I37m8Zn
	OtvJh1BQRU0OoNfSvradD3QeysNQENy9c3x45TzUjx0zvGgpncE5kXVQHcvJpnT22TgGa/rI9IB8E
	ScVvbZ7Q7cdUDoXLpH/PwWGl1mnECBVvkWBcjlzdZiTLL1p6uPoqJAOUC5bpuPh99xaK4gBkJM5P/
	pPokZS/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Ikj-0000000HDb1-3fP7;
	Fri, 25 Apr 2025 13:06:01 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HPI-0000000GzmG-048J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 11:39:49 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5499614d3d2so2223370e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 04:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745581186; x=1746185986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O2m2Aoo1Yj9SjRuX3tvCRBORIOzSUjs0HNbHFmUyy+E=;
        b=zItJ1Gcdb+9oG47mY67pydyYT7n78sGC4GTfrKB7uGnpls7vpB5b0nksiAh9OMiUCd
         MyXe4dBzvOQHwbWLJsyycXYXGQWu7pgamEsoE16Xz93Kl+ZFvXedtDJAhvwLGxRIDcr6
         iAFe6GStPSSuMHCQqgVjghC5lqTusltNd2DNyzn2bLHMx7QbtpPdnUnu74d8GohhaZdB
         HmX6v+FjsRW/9psOjAnVTruUccP/GTmd+MB50g7PCLjIvPKm8WZRXGitzlY7k7p086rZ
         IgUxCDW/hr4eJ6OHQrvQMSaCGEZvaKFPtGUKzJLn/wyD9j/ZR2PpXGzPqYv6Y1EoMS/K
         nJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581186; x=1746185986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O2m2Aoo1Yj9SjRuX3tvCRBORIOzSUjs0HNbHFmUyy+E=;
        b=ahIwksvwsOkH/eADcfPRrcQ2OX82ykRV3mDv4Eyb6cKqJbDeWtcofmJUEw4Bwb+ouj
         GPZskUq7yvitXD9YhMKYXwn0d/zo5n9Nfy1MRPvPJ6JO5KXmZ/xfUXBAqlcLQUHflCnq
         i9RRrnVXJ62xAi80HIf8wyMo4YlSkg+xgpXqqGybe+bez809TRadtQZza/k5UwxTGddZ
         wjcc0CHIf2Gh7Zec2b5WJjQnCFtiLvR1sxrm3YmeUqM2/lfjjq5eBjKRsmoxFOc/+l9m
         rsclempu9H8pjP2mfLkKPqgnEA1YEPoHxxiAuwvqEpXAdumGv9iMIx7GUzfsyizNgsV3
         CY8w==
X-Forwarded-Encrypted: i=1; AJvYcCXJfznfkX4EwJaXnNjYaDoFyu6wgaICXt+ovnYxQEFfqcVBq48LdEwZceWRU5PFi9lWtvcmOF0nnt9lCMhOg5K9@lists.infradead.org
X-Gm-Message-State: AOJu0YwClt88IyICswSXQx4PNJwJzjpEbRnM1+BkIQ8Y1MXhXnXP1K8u
	8kvy0WZJ3TDNjBw2Iki+5joSaaMOw3wrBHEOFHC8p3WJPBKmsFFNfizs4fOEe2Y=
X-Gm-Gg: ASbGncvYnzRQlwoWlORYpGs9E74seBSJX3SCDR+H+O6pg6MOh/vkW4yMP3UFRoVe+Vc
	/yLAydNqnI65upeJOgK8aupWAzr6Cxnp8EmXIqkPMNCPnLjIHByVnsjS26x6Dp8rsBtkGa1ayLu
	oawM8VeHsCfXFK3t4wehOM/kkeIif4p4kAammxYuNwALLMwGYe9fSgRAQjbWcYL6072MQJaFucb
	U5IFAQhIbhat4XdRtQJh+CnvSSlbaiJum5nHi688pfgSMKxKJUCpn6oEA0gELscK5pY5ZJGInxE
	XlgAfJtMmmQSopdbMeAEtmGKWUKbQb6qBxcFEmsrKR0coxQ48SioUWtG5cp28tRzowX7y8FmAje
	vXc89u6CYXDGYbNU=
X-Google-Smtp-Source: AGHT+IEy1Ze2Inm4YbRPTrLQmT+mPyOVbA8yhIPraVyHblYKgU+yLXCJwHaMdnfN0LS3s7iYdWCcBw==
X-Received: by 2002:a05:6512:3b95:b0:545:e2e:843a with SMTP id 2adb3069b0e04-54e8cc0b338mr599451e87.38.1745581186050;
        Fri, 25 Apr 2025 04:39:46 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca83c6sm560581e87.113.2025.04.25.04.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:39:45 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: core: Convert to device_awake_path()
Date: Fri, 25 Apr 2025 13:39:42 +0200
Message-ID: <20250425113942.134458-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_043948_060261_9CC19BFE 
X-CRM114-Status: GOOD (  11.73  )
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

As device_wakeup_path() is intended to be removed, let's switch to use the
device_awake_path() instead. No functional change.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 3523d0331cec..a16105b34201 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1508,7 +1508,7 @@ static int genpd_finish_suspend(struct device *dev,
 	if (ret)
 		return ret;
 
-	if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd))
+	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
 		return 0;
 
 	if (genpd->dev_ops.stop && genpd->dev_ops.start &&
@@ -1563,7 +1563,7 @@ static int genpd_finish_resume(struct device *dev,
 	if (IS_ERR(genpd))
 		return -EINVAL;
 
-	if (device_wakeup_path(dev) && genpd_is_active_wakeup(genpd))
+	if (device_awake_path(dev) && genpd_is_active_wakeup(genpd))
 		return resume_noirq(dev);
 
 	genpd_lock(genpd);
-- 
2.43.0


