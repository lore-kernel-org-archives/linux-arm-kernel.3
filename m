Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F1EC54ED0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUC/L//rK2/TTSf1Dzin38jZuZ6dxi7JPqJ0cw7AoiA=; b=W+n6aK2cAyxaD4Lj9fj5q7h89v
	dDRyYqifEiVOD8cJipUjRnYdrxSCUEg3pvf4gfHAi7RF4HLxAahC0cVZt86bUhn5xOtfTTbu8YG27
	9Uv1b2RJqcw1oYu421DrjYOBuDqg6k/D/HTIgOdXO4FTyf3LdpAaosd0dcdGveD87ZFwTxxcQZb28
	cvrp8e1TxYvn5xyLI4rOvxPA5++X7BQT8qogoDwCHHF1H38byjD/0S7/bgTMRK9O9aVRezWTLfjhT
	7N4v3wtc+2wNq8tLQ5+QNFuYq3N76uqKAs93F1XfZjZy8kUUqJQ9mvyNAAkHjIbEY/RPWJA88fcwp
	S+CUF7OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbL-000000045o6-0w97;
	Fri, 23 May 2025 14:42:23 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISe1-00000003zMi-14m3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:06 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ad52d9be53cso1194356266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007663; x=1748612463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUC/L//rK2/TTSf1Dzin38jZuZ6dxi7JPqJ0cw7AoiA=;
        b=r2KaPC1nb4idGQqgtnlJiA0sfPC5i/Mi5b5/IUntoxx+XT2Wt9syWTrSRgeJto9O8d
         dBKwWt2PgWUKCZ4EJU3Tq5ow1pDfzpdOBInR899+br0IlYwUIkKaegrMS+eMup225RAQ
         +82lSHPna9zDQdeCso3+O1VYMuJbt+I4p4IFGnHB6yCCUDGX5jg0jWM3ebFiXOUMZiCx
         JXLXTFNHGadFTCZZgaaonbpmBWvck5CvYqATBLkzSJwE9pXTJwEXvwDBHs8AdJSu8C+l
         1HPJ34oYdAAKdmjcS3nhlS5Hm+eYTy06ScfQGGWyo/XHlSY44/iWSVkxwK0iS7+oIiif
         eJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007663; x=1748612463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUC/L//rK2/TTSf1Dzin38jZuZ6dxi7JPqJ0cw7AoiA=;
        b=FKdef/BYs2wB46J9EPgKjnKv0K3wNz6ipj+UQRcCrQ2hwxPM9qJW4+zX76P+qdDFkA
         4NHwSuAarMoiEimSxevSC63AwIi+5k6PG7UgA/6bL8WcKulAvl89Npkip8WJJ2f7pWgt
         Bk9fembt27t+v+pf8nOs+w99lTXloFJAAJTlju7o3YIiPIYLdGW0ygF46/9BGkfo1N/w
         upNJjhC/k0vEdjk8d2zN6AhxCvJEEuQEecQkXUUDyAAMZ/+BhEF8Oh2n4IeFecFG3SIe
         jE2oY2FJT4vcp5ftmHNRIDvPLQOrPCW5exGyqMhbLqXnnSZLCWxGpn7+wYzuEmTvUMR8
         tfMw==
X-Forwarded-Encrypted: i=1; AJvYcCV9zJvz/rsmyzHFiT4lfCmBF4cKfMjHxZLiBu0BEE22nvqkZd6gs+pNfZ4m92Qjkpa+KXGyNapSbMr7o79Rz3io@lists.infradead.org
X-Gm-Message-State: AOJu0YyyKiYj6HTb5+pddevo/IsZTFDrX8olx0XRrGs3v6cC+DTycE7+
	yrMjPtBiuS2bcZg6ICKUmqPHOTscT5ml8oQJV5t9XmyjYKaDoaD61LyyTImnwO9vTKrpp3sfwlk
	eo9qOLUM=
X-Gm-Gg: ASbGncs3z4u8zocsd9tJydKZnu+J6+SO6uwtT4Ii9EbideKeXKrYbM72h5EsppV1OVJ
	Aiw+ZkOkcrJIgNuRqYQ3pwpXEdYBYVhr0FptSXd0qCfy+RR8jWhmPDzb0bWxET/s8oTpZEY+Bc+
	o/Uh5sToXXSZxY9ve0Vs5n25jl2k+EkyejKzh9kSqLFz11oLVEIo1m6BKf2vn9ZSAPKO2uMONAa
	dWKjH8S6VNdIBlJJSvnBVdFJSuE9t7w5msuJOD+zSjnXW7DPJxudtmHFRx9Ux9Kn2E97aI+2mSW
	6pDhmVZO2mFTg3nVfsTZUom/aF2LlqM9Bj/RiyKyrIrumU71uOXuqIHNFxKrEXq66isUPVuGwO6
	5pyHvaO1LTH+3IDpvctaXkFuTJQ==
X-Google-Smtp-Source: AGHT+IEHCYkYuWzR0+7rN1lJlnWJY9YunsWGOeHigvX1kOvGZwTPmtXZLbWPxdIRTzInet0tBxzveg==
X-Received: by 2002:a05:6512:3d1d:b0:54e:90ce:3c34 with SMTP id 2adb3069b0e04-55216ebe5a0mr842172e87.55.1748007652469;
        Fri, 23 May 2025 06:40:52 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:51 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 08/21] cpuidle: riscv-sbi: Opt-out from genpd's common ->sync_state() support
Date: Fri, 23 May 2025 15:40:05 +0200
Message-ID: <20250523134025.75130-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064105_292594_B5703872 
X-CRM114-Status: GOOD (  13.63  )
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

The riscv-sbi-domain implements its own specific ->sync_state() callback.
Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.

Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
power off unused PM domains.

Cc: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 0fe1ece9fbdc..83d58d00872f 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -347,11 +347,16 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 
 static void sbi_cpuidle_domain_sync_state(struct device *dev)
 {
+	struct sbi_pd_provider *pd_provider;
+
 	/*
 	 * All devices have now been attached/probed to the PM domain
 	 * topology, hence it's fine to allow domain states to be picked.
 	 */
 	sbi_cpuidle_pd_allow_domain_state = true;
+
+	list_for_each_entry(pd_provider, &sbi_pd_providers, link)
+		of_genpd_sync_state(pd_provider->node);
 }
 
 #ifdef CONFIG_DT_IDLE_GENPD
@@ -396,7 +401,8 @@ static int sbi_pd_init(struct device_node *np)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
+		     GENPD_FLAG_NO_SYNC_STATE;
 
 	/* Allow power off when OSI is available. */
 	if (sbi_cpuidle_use_osi)
-- 
2.43.0


