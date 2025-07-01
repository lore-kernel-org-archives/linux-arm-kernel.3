Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD44C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSVn2mrG7zN+yugOBdym77+gEsZFQXOddpv10aEY7jo=; b=Mj/6jsSsufg06XMJoZVuDvuop7
	mCxDbbF8CTK0448niR5T0uRptMkbdAF5HghFMg8ZvDluvr6Ib90y2XgoJc/LX99o5pofo8YaiBfQT
	eGGjvoBK4Ilx4cHyqAEyk0gaPj9xZ+4iuja1a1YFeITvN49cFvqtYRLYneuXvMLcysSWldYwwmMrr
	894lU6IH2SZrJoNN+ct8q6kGSog5YXKMjvsJovHP4l0yX1bRCUCb8dzu/ZDwVQ3HeOT+Hu6/anM33
	6D26LlwtbbzasgTwEZEbBWHUPzdUGPX6B84qA7v6cFUM83f3YNV+nSN2w09XGI/d7WW48pEX3kJrn
	R3f7S1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaQr-00000005NXh-3Xau;
	Tue, 01 Jul 2025 12:49:53 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZTG-00000004uue-2YH8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:19 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5535652f42cso6651456e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370497; x=1751975297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSVn2mrG7zN+yugOBdym77+gEsZFQXOddpv10aEY7jo=;
        b=WwswF8BJwnulRBY36tF/5dtcaY63AIcD9RkliRf0TNqKJJdL648EvkKMnvWQvUKBYc
         p9j1jZ4SRnlRzrR1WXQhomPA1KwdjgUg9hUBHt3L1bkzElnxiBK7ZiX4fYzEoGel9IeA
         NNRN6AbXCOcIP+4BLXcHTgqvEEsdK0c00PY3Zr6rgANx/mZW3wAlY9RiU1CntaD9gW+C
         f2DXFv7mQjVJQxl9xVAKPqJ6Rz/QzBNakpjBbZfv+qimiyO3xoJ0zxLiD+bvTA1o5lYs
         KCg5lKoELXusnCJgdg1ehkMlFvhZXMU5/0dGIBe0zAcTql7hNt9EnspjUOK4HKVy2Vs8
         mhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370497; x=1751975297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KSVn2mrG7zN+yugOBdym77+gEsZFQXOddpv10aEY7jo=;
        b=aD8k0F4+/vcS5mRJx9FQOxDMf2X9CzI69kyWyBVeSnruKCyjrBYYY3fsHqtTNKu3bL
         hNMzK1v2EAB2WCU6mqeP+GvuYw865vthFt/aENDrDhhjx0ZiO7xl/2SwFeaj2uVlkwda
         n4uXgkKlNHyF4txA4EA76jxBsQUDfxQvmtfWOMqPp2eH8BuAiiosZ9vSwSr6Fs0EbNZj
         Zff9V9Cbe8CXbnb7EVTyNYmrxOZoHC4i3aytc2JhMMHXUWNPteysnQqHQEF4Nt/4KX1B
         VM+pBsG7huJYO19ofU5C3Upt7Yv0eYsFWHuPse1vZLNokPpO92L0Uyv6RQeBMGkPV256
         P0LA==
X-Forwarded-Encrypted: i=1; AJvYcCWJvcvGcEP9ZQn9ikNqZPnFl3A6baRlscJ3tHiBfwZmJeE0ugqQ+fKTeoEozT3MaSRrMwpJyMCv76VV8grojuv3@lists.infradead.org
X-Gm-Message-State: AOJu0YyTrd4zScUxa2f+7uI1C8KDRgAoWAHZHpNPZqxkL4h3hTJvW1/J
	dpX0EoS0aYIea5xsHPgdzMrDlsHKa5JGzd6w3beowTVTHIYDETA9TkP9+x0lGorilH4=
X-Gm-Gg: ASbGnctsLTH/+1TzXR/GZta2+Tlsj76fWpF+9CazaPGDcIs9Hls7rWkaoKKvgHQXbNp
	k59krU9wKxbx7dscvtqCZnS8gkmt8BT3CRcB2BN5y5HrIjSjW8qAPdcLbidnxCxwtBjQ4BfZUuX
	lvn/2j+p0Gqf/8CK4HxZEjW0VcsEoJHmfNQCwxdrReDWdCM2RQCUlc2i7MbKZFJ5ShfyFnZURVc
	ayGCFcK9AuFPwaRVQVwqcjZ0HVGVkEBAkbBL5/uQmrajP7x1eBxiQeli84rpi9Ypr2WThuHWyFA
	Wz1VG5PgrwBmqbHG9e4nIz+oen6xNspnCQb//4ZI2O/a08cJvhw8UpjpRiG8asehTftJJxJ0GVB
	O9yhIlIKww0PTI4kzkh6vIM4PDOqEN/X97esDm8rdPSMsrxg=
X-Google-Smtp-Source: AGHT+IHDgDRPfHPY98/LHxFMoQy3YVLaarT1QmySpf801TGvHsjckA9nhAnZDzSK8mfVyqtwI0kzDA==
X-Received: by 2002:a05:6512:159a:b0:553:522f:61bb with SMTP id 2adb3069b0e04-5550b7e7b62mr4991989e87.12.1751370496991;
        Tue, 01 Jul 2025 04:48:16 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:16 -0700 (PDT)
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
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 24/24] cpuidle: riscv-sbi: Drop redundant sync_state support
Date: Tue,  1 Jul 2025 13:47:26 +0200
Message-ID: <20250701114733.636510-25-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044818_653958_58798DD3 
X-CRM114-Status: GOOD (  17.15  )
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

The recent updates to the genpd core, can entirely manage the sync_state
support for the cpuidle-riscv-sbi-domain. More precisely, genpd prevents
our ->power_off() callback from being invoked, until all of our consumers
are ready for it.

Let's therefore drop the sync_state support for the
cpuidle-riscv-sbi-domain as it has become redundant.

Cc: Anup Patel <anup@brainfault.org>
Cc: linux-riscv@lists.infradead.org
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 83d58d00872f..a360bc4d20b7 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -44,7 +44,6 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct sbi_cpuidle_data, sbi_cpuidle_data);
 static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
 static bool sbi_cpuidle_use_osi;
 static bool sbi_cpuidle_use_cpuhp;
-static bool sbi_cpuidle_pd_allow_domain_state;
 
 static inline void sbi_set_domain_state(u32 state)
 {
@@ -345,20 +344,6 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 	return ret;
 }
 
-static void sbi_cpuidle_domain_sync_state(struct device *dev)
-{
-	struct sbi_pd_provider *pd_provider;
-
-	/*
-	 * All devices have now been attached/probed to the PM domain
-	 * topology, hence it's fine to allow domain states to be picked.
-	 */
-	sbi_cpuidle_pd_allow_domain_state = true;
-
-	list_for_each_entry(pd_provider, &sbi_pd_providers, link)
-		of_genpd_sync_state(pd_provider->node);
-}
-
 #ifdef CONFIG_DT_IDLE_GENPD
 
 static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
@@ -369,9 +354,6 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 	if (!state->data)
 		return 0;
 
-	if (!sbi_cpuidle_pd_allow_domain_state)
-		return -EBUSY;
-
 	/* OSI mode is enabled, set the corresponding domain state. */
 	pd_state = state->data;
 	sbi_set_domain_state(*pd_state);
@@ -401,8 +383,7 @@ static int sbi_pd_init(struct device_node *np)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
-		     GENPD_FLAG_NO_SYNC_STATE;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
 
 	/* Allow power off when OSI is available. */
 	if (sbi_cpuidle_use_osi)
@@ -570,7 +551,6 @@ static struct platform_driver sbi_cpuidle_driver = {
 	.probe = sbi_cpuidle_probe,
 	.driver = {
 		.name = "sbi-cpuidle",
-		.sync_state = sbi_cpuidle_domain_sync_state,
 	},
 };
 
-- 
2.43.0


