Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34260C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 09:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wugxhQvHKc30SDsT4EaI/HEENSsFdBpwWD0zIT6tInY=; b=sj4aqri4E4O+rRVC2aAsEYrdWo
	PuMyaBXJsIpko4gqm/m1xDmSAGcrEdlYd4Ss5bZkGUWLTaCugKLWW0XevM+ynjAdsms9tdG9Y/xPo
	Qye04tRhoPxU12AD2SXfgYto7l8fnOo4fPbrtPJToXhh3FXE+c5JqSts/EQK6q102GE+F01GRJ5T7
	yJDnbVydaPVUEOhfZUJPOe3hy5GesnYbLOYLb1SvpsqS0GxdGiK3SOJE7DnFFv4Rzfv2aRqEDGzsO
	JuVRJffMn4NMwYFBRJ3ctsKLLbnTvcEfxRWKdvFVkviXpgYAqyWJGX0BbWyUvoE0FbkUE0tnC1b7g
	Vr+XOW3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zm9-0000000DlRU-3eik;
	Sat, 05 Apr 2025 09:25:17 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0zkP-0000000DlIH-2nwZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 09:23:30 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so52552a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Apr 2025 02:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743845009; x=1744449809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wugxhQvHKc30SDsT4EaI/HEENSsFdBpwWD0zIT6tInY=;
        b=lG38SI30IQGgzdmesRwDMyKYo0htbMZwJpNigDNVB2JAqQo1w4H4g9gk98kU0j7h+F
         RMRU5zjSKJwfRnUfXU5gfete4sb/vF8HIX9o/ryNtjmqrSTsH9txWKXAsk67yOv9mIRm
         zTE0R0hkmV5sG1r48EUMOouiE9OCfGoYq8/pr5ohtS/W0bSuuuRTgbvTOc1XqvMyn1qy
         FWZcRbRWHpDE23z+m2i+qweUaDxgOesac2rDY1LggciimQNmByQLOmyc7ei+Nehqaksg
         g6RE5x8L+4ZlBOmc99n/0PTR4fMiGq/FN04rtLkhqR9GYvbn6iIhUO+Zdy1Ezp8jyRPJ
         SVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845009; x=1744449809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wugxhQvHKc30SDsT4EaI/HEENSsFdBpwWD0zIT6tInY=;
        b=qV/Obdu+4i9X9QfJlZ43FYqZ+MyX0ltavxdpgLkyzjq5DDXJLYHe3vuxCOsrwpmWGh
         r/76ojdBxCnoBajS+YBg2PqU7Xfd8mCTLWnUrVoPUqKZp6ZBL9d8ksJ/0bi1HORveJFG
         mz0gAFCw3Z4jNwHW3atw2Nb8MLLEzN/uIH1RWBTg8eop2egBRgLCZqeCJFAjlqDG4O7k
         ZS+dczUK6cgp2QSGWeB6SrEhINjtVH+JiXUt5i4VfcymWJGfcSgKfM6LnWVlCuUSjTAA
         53R0J6pcSfDsh3BBmAhm2CZKKeez5bPtt9Nf2vzhixgB7ye6OC+kn+TpizeF0NzFzL3B
         bXug==
X-Forwarded-Encrypted: i=1; AJvYcCVfvs9VfN88ytZL+TamgVPM6C5EWZ8RopZGVGVwyHgdNVL1j0dgTNw68u+LVHp0k7UGUOolylxA5mEonHyN34wN@lists.infradead.org
X-Gm-Message-State: AOJu0YxnCqmKBsYpB5nV7zCz9d8ne4t2fh6x1pXOkCPY+izwHVz3JQHI
	W7pSq5qeDqjQeWzxsYgaBdlmfSLGo3qrrHj9blzTRZZPw9OM3rUp
X-Gm-Gg: ASbGncuFi8ISCBYY/3ttgLPYRLbV7RZfA4zXQe+UhXM3TTcqd+tRaKc11Xjyy9n5YfO
	Bnw4D8XcC3W40EsTyk2g4QbokPhihHWX2C2omznlgGJqVj91+O02geP9uBC4BWTgARET/YYVUbg
	Lgcd6qnrsTIGkt/IZ7BNNiayJ3HDK8BEqL9zkKV50oHuVurXnSlLSmEcZuBwHAX6GHupSxNjPCB
	bUn7CTk1qTg45x3Nj/Lvr97eGvyys1S4GX9DZQgaIbvYyiO0zJYFsMemBHqJ+z6yETkxI+Z9M6g
	vf8KwUVFF6gP5XNlQ7NY1y5LPHx2Mjj30/FgphvQzLnlQ2bF0hg5E6LQueqZhQ+F90DW
X-Google-Smtp-Source: AGHT+IHkhHsjr2gLT8Ve1Sx3IQ03TqNe2hZ/KEE0KQj7rKla0oR9QG4GMVxeSmrYPKbVJrqgOXLaQg==
X-Received: by 2002:a17:90b:50c4:b0:2ff:6a5f:9b39 with SMTP id 98e67ed59e1d1-306a47f2ca5mr10316513a91.18.1743845008573;
        Sat, 05 Apr 2025 02:23:28 -0700 (PDT)
Received: from henry.localdomain ([223.72.104.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb91b9esm5139782a91.45.2025.04.05.02.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:23:28 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: sudeep.holla@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] cpufreq: scpi: Fix null-ptr-deref in scpi_cpufreq_get_rate()
Date: Sat,  5 Apr 2025 17:23:14 +0800
Message-Id: <20250405092314.76297-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250405_022329_708432_518B66D1 
X-CRM114-Status: GOOD (  12.16  )
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
in the policy->cpus mask. scpi_cpufreq_get_rate() does not check for
this case, which results in a NULL pointer dereference.

Fixes: 343a8d17fa8d ("cpufreq: scpi: remove arm_big_little dependency")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/cpufreq/scpi-cpufreq.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index 17cda84f00df..8f0da2a86e4b 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -29,9 +29,16 @@ static struct scpi_ops *scpi_ops;
 
 static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
 {
-	struct cpufreq_policy *policy = cpufreq_cpu_get_raw(cpu);
-	struct scpi_data *priv = policy->driver_data;
-	unsigned long rate = clk_get_rate(priv->clk);
+	struct cpufreq_policy *policy;
+	struct scpi_data *priv;
+	unsigned long rate;
+
+	policy = cpufreq_cpu_get_raw(cpu);
+	if (!policy)
+		return 0;
+
+	priv = policy->driver_data;
+	rate = clk_get_rate(priv->clk);
 
 	return rate / 1000;
 }
-- 
2.34.1


