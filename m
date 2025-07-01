Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2B2C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 12:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ok/7cX9BgYxhpHX9QUiDoGepvZnSRp4y0xFThE2KYY=; b=evusECDOx5aZoIboBYJH6p8AEM
	4gBJ5jDMEgOhPUziKN1nJOI53ms33WcR9rv9LEmaYhxpD2UMSvGf4Y0OVUn8Vn25fCCFHczYpkoY/
	F6lOiffj3Gk1O7VrPuXDkaN94NBmYCRg4LDXQU0cyvR6aY6/K3AR3fjkigY5G3iAcERUyuzy6sL0J
	yNAoDjxQMkQ8PUgrBGqYOlPs1ry4gGgSwiTS8JOBCYvBBbly+lrf9s3NA24Ge6eJCDQw6ywcq9O4n
	vwZ5h4FkgAxZNe/XbKr8am+icPo7gBTDhxH+sUtRfEwNk/Y8dwmViX39Lsoq7SZTvh9piPAW2HByl
	xV0l9gGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWa99-00000005Jyw-3bAi;
	Tue, 01 Jul 2025 12:31:35 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZSx-00000004uhS-211A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:48:00 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-555024588a8so3327927e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370478; x=1751975278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ok/7cX9BgYxhpHX9QUiDoGepvZnSRp4y0xFThE2KYY=;
        b=MHsZ1B7gHBF7RQ8YhkGYG3fiF8m34SjVCxHJ6r8T/vMHSrV8YyyqJyBLHLnUT01g8T
         FvSHr3EvRMgh+0J9R8kKA8urClT46DEw25OMNKRxDRfK8LXitxtqIAbnWt82Y3wXv4rm
         PeaK1ktpQrG6nsCzVBajVTnEcFjCWJHNdQp4NWuGoWREUTiyLRFvVQvTKMECIarOMi9Z
         +F0sEPPmUEQl7bh75WovCf6ARIIusFs364MXCbyHvR3Hz2bm5DdxIvDvtYYN2s+t9T/C
         TuBVTBNPO8mgCfiVictNVeJeIvkqygveOTYR407Oa0hkmpwqMoYiuT0DAClIqedwWxs3
         0cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370478; x=1751975278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ok/7cX9BgYxhpHX9QUiDoGepvZnSRp4y0xFThE2KYY=;
        b=rs0xdWDo2Th2EICPc0d85Oqo5wJIG+mcv45h1ZNFBLzMip0yHnfqKVHWBtb6M+9oDg
         DU8NhThDszlhjT8j1Fo0BpbXgIzSK0mbrFrNTRABbRutDmoV68rWfKb0TvboCGWfmt+u
         8NefN8RtpZHV8zQeiF0n+c/x1Qo6WjEgbD3eFk4qfPOISPSruDZ3WFwcA9HAnapB4/30
         B02LKZGx+TnkY/2m1siJ0F0HL0fgX8rbZ3dJx5WTkGvkrxDDHUOgIrYaLf4a95aesRvL
         /xGwI8/e9WG7D+NXMfpG3G3AMvzvt2CtrOocDzz1eIYYtrEbQEzRPMNwCCsg8S2Wev/c
         bABA==
X-Forwarded-Encrypted: i=1; AJvYcCUIViBV+cgtDUkvTmbzw//EzmHJ2l4UXeR6jH8JzGZihE4QoM4H0M/5E0NDeLiKKICt+wWIE1WRJz3wPib9ppyN@lists.infradead.org
X-Gm-Message-State: AOJu0YzVCSYfBgoCjwSzSPxd9+dDCcllSCpOa6SGGt5huyKcVAEFHGvT
	c2u1Hx7tfXKw/I4p4ejliPPXTRDnzc/3y4Qg8T1KLZrWTHgQRLUNwnFC5Ah0DeDIg3o=
X-Gm-Gg: ASbGncsVG/CoCx02sQPA8MgG+6+h7E6l1QT0eT5WINbLSXjCcvtRPvltkzO5e3qSO6M
	AScbNTgokZsmLMhSHdHuEgUscud69slp4wDuVdcU2PSPivS2AeK4Z9YDK5FWmPuUUwWO3K+PKul
	pjKBxLoDU+v7hihSeqR9UCB7V7oUncFT7SUi6nAlQwhJBE5XZJnbz43kimPKamRKSR2mQL9kTo1
	x2L8kL6UlcXzcK2X8oQVYLMrBkU90XVThtbHIJ3Aj+pnmz5U6XpZ1alOobaSQUg5F8sCYQv6bH/
	KISvcCEeqvbU9Ur3DzNcT288fXwx3otXVJ0i/6qh/i7smG61Lsd+vOUTNgjY/uoa+VLwJyeAmDu
	Qt+Zu7tHA1I03Rjkksdmo2nt9bXxZNddIRy47DqK7Gw3aCVQ=
X-Google-Smtp-Source: AGHT+IES0g6TR1bgUHY5vOOeAdnd+P5lreUzwvc4ftLy4qnq0OkpDCoD7RW1WzZ31pUM09XK2xu3aA==
X-Received: by 2002:a05:6512:3ba2:b0:553:3407:eee0 with SMTP id 2adb3069b0e04-5550b860e0dmr6025448e87.4.1751370477847;
        Tue, 01 Jul 2025 04:47:57 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:57 -0700 (PDT)
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
Subject: [PATCH v3 10/24] cpuidle: psci: Opt-out from genpd's common ->sync_state() support
Date: Tue,  1 Jul 2025 13:47:12 +0200
Message-ID: <20250701114733.636510-11-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_044759_529895_A2B5E716 
X-CRM114-Status: GOOD (  14.76  )
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

The cpuidle-psci-domain implements its own specific ->sync_state()
callback. Let's set the GENPD_FLAG_NO_SYNC_STATE to inform genpd about it.

Moreover, let's call of_genpd_sync_state() to make sure genpd tries to
power off unused PM domains.

Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 2041f59116ce..b880ce2df8b5 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -63,7 +63,8 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	if (!pd_provider)
 		goto free_pd;
 
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
+		     GENPD_FLAG_NO_SYNC_STATE;
 
 	/*
 	 * Allow power off when OSI has been successfully enabled.
@@ -128,11 +129,16 @@ static void psci_pd_remove(void)
 
 static void psci_cpuidle_domain_sync_state(struct device *dev)
 {
+	struct psci_pd_provider *pd_provider;
+
 	/*
 	 * All devices have now been attached/probed to the PM domain topology,
 	 * hence it's fine to allow domain states to be picked.
 	 */
 	psci_pd_allow_domain_state = true;
+
+	list_for_each_entry(pd_provider, &psci_pd_providers, link)
+		of_genpd_sync_state(pd_provider->node);
 }
 
 static const struct of_device_id psci_of_match[] = {
-- 
2.43.0


