Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7543C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 07:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xRp5CBhPMxzufEjk9azD6SyDttl6LU7ag5HNsBe1+xA=; b=uFadHxOxRpMc/8ujalwmWI7X1u
	HNCENK+EY+Q7nDXoekurXToAXagyT1/+Mg7ptPwoHD1NPLnm+KxHCrbXrZ/RuIydpELbxKR1ENOfw
	9kGk8NpXNGrXtfMVckVaEhFpbRB1WxfsCdMWnNrO0IvB7F388XLhlb3OoaUmFWz+vylHntLQvZ1Af
	sZxeL9oA4tJokuE8n5rnqBGcenJxRB6Kh8e8FkQBvWcQcCBqaN1FbcKqlYFvG+krQE125xjQjVUDU
	54nWkyQPXSh33yLApSi75ZZJfBwqlw6U7xLm73WLQ9TPSkD8qACSJ2JF8/tVyH6yfKRlVQuhpFseI
	vXAEpLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tas4m-0000000BvCB-39w1;
	Thu, 23 Jan 2025 07:56:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tas3T-0000000Bv3L-2MWq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 07:55:12 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso942798a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 23:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737618910; x=1738223710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xRp5CBhPMxzufEjk9azD6SyDttl6LU7ag5HNsBe1+xA=;
        b=ZqSgFb7FdSnNx+v3PVkbfEazy5EyAUFYIRol/P03rwHvNEHlw/IokfQqDPkXsdvsR4
         isxqsSYRQiSvKkFmhYVig5WCFPTJIqpqls8FLMDaFCNwVLyNxP2x+2FpUcFrBpG5tER0
         scvl8SGo/0udz3B7YxLY3SolXEp5zNxs3NdwsE/WuPKzC9b/McOcoxxx1Vi8z3gPFS3u
         B4w9i6Pde6gYMs3r/DmVIJTsgS1Tjmi8G9TV9huvfM+VJentN9h969EVEJPvS2ZjYQbJ
         WPjNO0LD8nJYwAgHlVVEdb9ZAlkBe4JQxJhUCUf/ORIjY/p30EKMimZsH/Ck+9Y/UFmU
         wzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737618910; x=1738223710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRp5CBhPMxzufEjk9azD6SyDttl6LU7ag5HNsBe1+xA=;
        b=XKbC+N06A4d2mvekAtKCDJzX5RHm6wm7qpKIP7MVyAfu0KnYapHwvCHL5g98IHwbVe
         JeybJfrMRHAOkDEI6QIDynGAvPWudMpH5mV+dvVv4mIquQTiok5ZdRAx7541EQTcBuua
         qTUtaM1TrWkEBAaqYqwsf4UqrgnFlIHKd+TIJS6FwAfCEMCkpP3BciNMr20+PtZ9mp6v
         0mW3GBKVCGRO9HxkNEKHAahrbIuM984Q27DlwA4tQ6+9Li6Q6Rfz+NwxIZa/EPamjgEq
         6gaH1SdeSO2GbqAsnd4vA8IcbE3P1poo/ROxODf1AONIxek0lhnjIPFS3v529T17SdRf
         KAuw==
X-Forwarded-Encrypted: i=1; AJvYcCW7t9z8qXqTLrBMoo2aBNxmzKqwy0E0prYpMUttQfp0eVWbuNs9tWLZHWbnpr+Vxt0xFQU9h7LxLpahoiTWO4Lu@lists.infradead.org
X-Gm-Message-State: AOJu0YxJS77pdmFNSZSWRIgqS8VYkn9g0C1qOmjRDN04pZYOkj85rg+X
	QecIyVL99pdjZbP3PlsbDZWKzR+nv9sC3grjyi39FTTddZH3T5ylakV86YKn0nA=
X-Gm-Gg: ASbGncscslewzCt2pTf1mpyw7/s4fj5pXf9S1GzuDMazkNKk4JXa2PxliiJbJPiTcUK
	mBWM1SfVRJ5JWoHZEeLOL+4cf7mz0jqEv5LMlP/MebGX3a32ZaVgTV9CM1E0p/xznhi8SP274jU
	oFxXkqjiUo33egL5jzz5/pglznh9m/bxGwE2ZDQ52NRmaw+N3S+qKD9325s4oR9kB1iGYFieCU6
	YKf1KZ+rbnDC1/GUN/dDBX7cnlt9X9L2vL6gxseDtcHEuFIUgWJ7p7YklmAbgiQvDTt9nJBAveM
	xvbZYUsAcw8=
X-Google-Smtp-Source: AGHT+IH5a1uZ6R8BHzUEUJWuugPyK5QOM/E7bx4Ds/bwSkjYLPzhV2WX09cBDNQfEL1Ldq9Nlt+d+w==
X-Received: by 2002:a05:6a00:3006:b0:728:e1f9:b680 with SMTP id d2e1a72fcca58-72daf9df7e2mr34655239b3a.6.1737618910201;
        Wed, 22 Jan 2025 23:55:10 -0800 (PST)
Received: from phytium-Ubuntu.. ([218.76.62.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab848321sm12477217b3a.76.2025.01.22.23.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 23:55:09 -0800 (PST)
From: zuoqian <zuoqian113@gmail.com>
To: sudeep.holla@arm.com,
	rafael@kernel.org,
	viresh.kumar@linaro.org
Cc: cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	zuoqian <zuoqian113@gmail.com>
Subject: [PATCH] cpufreq: scpi: compare against frequency instead of rate
Date: Thu, 23 Jan 2025 07:53:20 +0000
Message-ID: <20250123075321.4442-1-zuoqian113@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_235511_625348_95C718D4 
X-CRM114-Status: GOOD (  12.04  )
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

The CPU rate from clk_get_rate() may not be divisible by 1000
(e.g., 133333333). But the rate calculated from frequency is always
divisible by 1000 (e.g., 133333000).
Comparing the rate causes a warning during CPU scaling:
"cpufreq: __target_index: Failed to change cpu frequency: -5".
When we choose to compare frequency here, the issue does not occur.

Signed-off-by: zuoqian <zuoqian113@gmail.com>
---
 drivers/cpufreq/scpi-cpufreq.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/scpi-cpufreq.c b/drivers/cpufreq/scpi-cpufreq.c
index cd89c1b9832c..3bff4bb5ab4a 100644
--- a/drivers/cpufreq/scpi-cpufreq.c
+++ b/drivers/cpufreq/scpi-cpufreq.c
@@ -39,8 +39,9 @@ static unsigned int scpi_cpufreq_get_rate(unsigned int cpu)
 static int
 scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
 {
-	u64 rate = policy->freq_table[index].frequency * 1000;
+	unsigned long freq = policy->freq_table[index].frequency;
 	struct scpi_data *priv = policy->driver_data;
+	u64 rate = freq * 1000;
 	int ret;
 
 	ret = clk_set_rate(priv->clk, rate);
@@ -48,7 +49,7 @@ scpi_cpufreq_set_target(struct cpufreq_policy *policy, unsigned int index)
 	if (ret)
 		return ret;
 
-	if (clk_get_rate(priv->clk) != rate)
+	if (clk_get_rate(priv->clk) / 1000 != freq)
 		return -EIO;
 
 	return 0;
-- 
2.43.0


