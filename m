Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C72EC83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xubz5AMnVL9fFI2MEMsk3gmMyUmqJIv+eASrf2W14mE=; b=umU3EeFyCfu2iQPF/aVtaDU1HH
	cxYXkAvdx24eOdTWal+v3rxvjO7ZpTo9SEJIUE07tQ339+Nf9cEb6I4Z24qN6q9OOTRkEhjEIpis5
	NDwbHJcE9/MGkTlYh89uwB3FKHIAqXyMzy2qD/OXWcCWg+fe+WF8BHTyDxlmK/E0yNc2bCmWFsetX
	q9Vm7rSRDj3FMYgMMesAugpFvNB4Gc8Rvp7KdOan3+tQpkIAjcvU7ywxMk3hxQkXsS4RdlDYEcG+1
	ksywFGRoAKG1O1vhe4ujTmq9nrsATuhUgNdICLLQG8jf31Eqk6LFmybWaz9m8p25582tq+K5EXBE7
	DivGbKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaOY-00000005NIk-3l41;
	Tue, 01 Jul 2025 12:47:30 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZTF-00000004uu2-1wa0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:18 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-32cdc9544ceso27155481fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370496; x=1751975296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xubz5AMnVL9fFI2MEMsk3gmMyUmqJIv+eASrf2W14mE=;
        b=WYlQHiQphqqfg36LG6cYWQTx1PXOifnwF51Z6ec9umqwmZ0umSk1DWKzJTpmO3EfJq
         UCGjlh90J1m3TWceEag6vjlWGlxzA79H3vWtqg3RwhPsaZv/LXFv4N7cmJCCzxRwW5+O
         +I5uEyi5lpmTAHEL/ezOm5K/43wBahBvD5ewMfwmF2sz1qkKyMqeuSsVZVO3sOrbQVCj
         Kp+8GeWEU1VVdxIv8Clg62qDBSgHRpLvQXjrhcoOd5HsbRIcIx34reQgI5pNeTAPpMJw
         9HmFTkeosLCEND3YN1rzMCp+fqhrzQ175bXkko6SK342dpMXSchIrKlHswCCcxL3LPJ3
         y2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370496; x=1751975296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xubz5AMnVL9fFI2MEMsk3gmMyUmqJIv+eASrf2W14mE=;
        b=X87XpGljvhBjA49APOdyNgPJcP1PwhNnZhuVScVAsaTRrNUORxEbL5vzXnbNpOGUdP
         F1Ea0/c8Z+0Vq8ohuqlxTWjXRgotADNWDDWkU5tY+RyCRRamnVqwS3pVrLKfltuAmR6h
         JIrYYkBVmDZaab71fMCZhopa9AGaMSwM9owZsEO+kNkzxXNOF/yN+9OsRgC1UDtt2XN0
         qdrh1WMV+57GxewhBR1lHoKLgES0K232OQllaje6u94OCKpzDjuAMTlOBAQkQDJE0HEY
         vDrAz8GG1f2U/AJJ84XJai9WQsGDS27wWvLQckBwOls4LBtIQDoLnzw23WH7rCcxPu++
         atOA==
X-Forwarded-Encrypted: i=1; AJvYcCXMTNI73LYFKy8x/qh64s5Zdq8XwJ5vo6ZRpv6DmDKwjcEo5YqU8w7E/dUnpjatR342em66xFHwaozimlgln5Sn@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/N5QcbCQ11lh+Z6Hin1dQ9MxAtKD/GuNy7XNlGlv7UjM5yO1h
	ti/TwKIXftgf0Q8XeH0wTO0YBlK7Xev5piVylcPmHZHwAf1daD1WcIXwCSt0Ei1Roqc=
X-Gm-Gg: ASbGncuH9zigeJhdH30m24XnkAHltTJE4KYD/FPpNfUhY3fhqUECbb5StdkaXUZHLNH
	RnCDSXmigg8e9RPMehfKWW0VKHV+iz04j2ZaFBLgrlRGjcM5xQEyVrCFMNgl3LvIb+OfhNBgA4o
	2qkDPzTqx9GOdQFLvDNrZ4N9KChm0UxOTm+ngp4XOFEfxc+Beqrmrk82MIY/+Sab7gAdJHz56hn
	PaiiIJDSXmk+w6Cg4g+NDsF0MW4uVVTSHHZJ7Upo48N+PPWIeUB5p0ax2HeMj1rLCXYnKqusNUR
	6toVSZMifvCDky1bduCJk59GdiAQEFqVPlpMlYkG6L+ww0V2ZMZGmmCcC9iaPcd1vTbHOw4A57r
	zX4RndrR8mBzvyDR98aZr+ZqbTf7vgqklr0npvW0F9G/gpXU=
X-Google-Smtp-Source: AGHT+IFbAm4sSy6xwNDq/uawFwMXkVuPJBi7CK4J/iQSlQCYGGILLP1j4D4YF3zjMC9RJVOr0YdTnw==
X-Received: by 2002:a05:6512:3083:b0:553:ad3f:1597 with SMTP id 2adb3069b0e04-5550ba1de10mr4896071e87.53.1751370495665;
        Tue, 01 Jul 2025 04:48:15 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:15 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/24] cpuidle: psci: Drop redundant sync_state support
Date: Tue,  1 Jul 2025 13:47:25 +0200
Message-ID: <20250701114733.636510-24-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044817_504077_BBCF7730 
X-CRM114-Status: GOOD (  18.25  )
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
support for the cpuidle-psci-domain. More precisely, genpd prevents our
->power_off() callback from being invoked, until all of our consumers are
ready for it.

Let's therefore drop the sync_state support for the cpuidle-psci-domain as
it has become redundant.

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index b880ce2df8b5..37c41209eaf9 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -28,7 +28,6 @@ struct psci_pd_provider {
 };
 
 static LIST_HEAD(psci_pd_providers);
-static bool psci_pd_allow_domain_state;
 
 static int psci_pd_power_off(struct generic_pm_domain *pd)
 {
@@ -38,9 +37,6 @@ static int psci_pd_power_off(struct generic_pm_domain *pd)
 	if (!state->data)
 		return 0;
 
-	if (!psci_pd_allow_domain_state)
-		return -EBUSY;
-
 	/* OSI mode is enabled, set the corresponding domain state. */
 	pd_state = state->data;
 	psci_set_domain_state(pd, pd->state_idx, *pd_state);
@@ -63,8 +59,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
-		     GENPD_FLAG_NO_SYNC_STATE;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
 
 	/*
 	 * Allow power off when OSI has been successfully enabled.
@@ -127,20 +122,6 @@ static void psci_pd_remove(void)
 	}
 }
 
-static void psci_cpuidle_domain_sync_state(struct device *dev)
-{
-	struct psci_pd_provider *pd_provider;
-
-	/*
-	 * All devices have now been attached/probed to the PM domain topology,
-	 * hence it's fine to allow domain states to be picked.
-	 */
-	psci_pd_allow_domain_state = true;
-
-	list_for_each_entry(pd_provider, &psci_pd_providers, link)
-		of_genpd_sync_state(pd_provider->node);
-}
-
 static const struct of_device_id psci_of_match[] = {
 	{ .compatible = "arm,psci-1.0" },
 	{}
@@ -201,7 +182,6 @@ static struct platform_driver psci_cpuidle_domain_driver = {
 	.driver = {
 		.name = "psci-cpuidle-domain",
 		.of_match_table = psci_of_match,
-		.sync_state = psci_cpuidle_domain_sync_state,
 	},
 };
 
-- 
2.43.0


