Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FAF0C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOoCE0j0+Nf7/A2FNrnJbBGarUG82qfn+WjoD3EiQd8=; b=AbmJeLS20jte58eixeIqE9xicB
	2rGlWlejzuI8hgXNCH4AGbYft+BNlkuTin0AoPd/vQCCeHIxXN9OHwkifX2snUNARsOPCGyJNGe2Y
	ekbFc++GM7ySxWhICJ7xPRXy2QXusHSAtlPiT4vcDZe2U/SkAAVw+lDDiSeby0Ai/vBZ05n6cPETY
	JAevRbtADAuh+3SBMF49Dthiv0U3dSOHEIzH3AToMdyVXuOXTJLTToW8xJ+NmUV1j5+4NplZl7FMW
	kJoSD/FX1YfmFz9KhTDopzMDbMPlwh7oCY0xmGuuq0t+kDJHYNfZ/KBRCSUWUBPkhe6mtTWLVAiXx
	VHBgHYZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbV-00000004670-3975;
	Fri, 23 May 2025 14:42:33 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISe8-00000003zQA-3Jpj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:13 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-550edba125bso7883576e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007671; x=1748612471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOoCE0j0+Nf7/A2FNrnJbBGarUG82qfn+WjoD3EiQd8=;
        b=rQB4hv25UQvqoEJa4QOqfl/tvyAqVy7nAiToh+LH70f46D0r3t9b1eeKpdX8CKBC57
         j3JQ0A6pLkRO9cU+ctz0aAkUT4kU047XgYLJX++4ZqbUkjF6AroMy9vNF08i6/yBsA2t
         VzeIKev6CulwHkTH6/ytIiilOkwF87SUrXDAaiQ2vOKFB1xFEEOk7NVDiL0+4nH4HFYX
         xkTpTU32Dij+e7NGpx1NpdtZxI1rJ4AO36C8UwiQ60Av2Ko8bu+W+q3qfiX1eJmafqk7
         L5ACbVq8+FnfKFadjW++0ydj4HO/wM1VgI38CBvC5KZM4RvKqSC1FGzjX34ZR7NM0FL+
         PwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007671; x=1748612471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOoCE0j0+Nf7/A2FNrnJbBGarUG82qfn+WjoD3EiQd8=;
        b=ebaxHxuu+rJzVvMu8sE0G0y21l9+DUSVx9V/qMIVYcWSKbudorliAUQRH1XnGD2NT8
         Cgx6cwhwIoTO+Ul7RNXjEPYI1NmLkr8OrSekWt5gTREtUW0STjYUisKnWw1bLdYe3E9M
         fZwH9lt8T+cOzoZSNeUTTrtYM8mLC7xo6KU0taEbHp/ZVqi80NYz2HLdZk9D69p3irUI
         4AdmGrrUxf8Oawuginidxz/DSjPocU9PYf3qppN7I9x2NzmiG/xl0/TjEHgnjS6zePCw
         sOMQfWN7vNtwjQi/UW0ZpoYCLGsey3eiDJxvUcVF2yABc0t5M+IfCa5HBWDCGA6BdIye
         Ro6g==
X-Forwarded-Encrypted: i=1; AJvYcCX76ydY2nP7iHGjHQcTdx1WEPH1lHZ7PsU8+muP2FlckrVL5mZ2CRchIXx2qrtROSP2K22+hDyV9muaFx6vnNQc@lists.infradead.org
X-Gm-Message-State: AOJu0YwEtOGN+7FH7xDsKdPdbzqCyEVyX73SKuDsVeYZ6vCoCbj596rN
	wjcgPuqM6G3dmhTg8xs+Q1kC4PWffwyU5N3aCbywfdVkjTg/23HIKqD3Bec+26X2fnk=
X-Gm-Gg: ASbGncuaMBRrTzeJRlDAQKPu+amoG0CbhbI118VHysV1k6zVIjbA45YBgpPNBdlwQaR
	h7wfSTtAOIZ0XBcDda1GuBf6N9SHJKo5i0E8jbMJr0Gm0d/ebx+tSu/rz+yEsWGljvqF/ihsciJ
	UKS7UXJo+S6wud/hVKauSJeRmIDMSeoZv6CHjal+6hlvnYxenTm84v3kQa8aI3uesmgAnMGcEDf
	Y6XVTz6Z1Ku/zBu58oEFQ+SW9LcBKZLD6thriWDhsV0ozMPPaZnR8j3JP3W8gS8yp7+P2u65Y82
	aYUXmxch2vVQjViA4euzSoaqlVCYhlBIImcZna8T0hp7E/lAQHywj644BEllh4bS2bnZ10UsGBR
	J2bXm5vzMqX3pxo60vnmk3ohsNA==
X-Google-Smtp-Source: AGHT+IEVVVIanD+SM8PaeTS5BPNrUZEt3qImxQaWobI9SebxfHyiMxLEusYRHx51DE+mAPmIootadg==
X-Received: by 2002:a05:6512:438c:b0:54e:a23f:82d9 with SMTP id 2adb3069b0e04-550e71d1472mr7232899e87.25.1748007671215;
        Fri, 23 May 2025 06:41:11 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:10 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 20/21] cpuidle: psci: Drop redundant sync_state support
Date: Fri, 23 May 2025 15:40:17 +0200
Message-ID: <20250523134025.75130-21-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064112_853682_2FFDA7CB 
X-CRM114-Status: GOOD (  17.22  )
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


