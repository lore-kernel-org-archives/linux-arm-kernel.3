Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534DDC54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D0aKf3r0veUqn1rT4el+1RxCAoZmF17+2VzJGANVxCI=; b=U/8py+soKqU7XdxuxOu5Rlhv9p
	FD833XyYG3XoJ0c45kpgHoNb8tAYF4H4oyPlEaO2PIJ+7/u/t0IU2BOXnyuRI718SDgLTGDkYYhzP
	tDaAiGvQURXy2bWYRnYSfYOtuh2XO57r42TzSsrgBITXkujsjarU8dM93/7N1/wrZ5ISBzOWw99E5
	h26icwRPO/o3YGd+j8Q5Z3wEcUdk8P0o3c2kdWILSruGw8mai9ptx0PAm1zNiMolYftsHMfHSDn52
	Au+EMRQ4bw0YGpfRvdtPyOtHEwQQv7H8ieqAqiVXDnLqxJRhU4si7D8X1YDJ0JjNbAEOjfqftucGx
	ssx6VQkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbS-0000000461S-2EWb;
	Fri, 23 May 2025 14:42:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISe7-00000003zPN-3oJJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:13 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54acc0cd458so11970331e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007670; x=1748612470; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0aKf3r0veUqn1rT4el+1RxCAoZmF17+2VzJGANVxCI=;
        b=IBMkwjeVwFyrL10H8DzfybSnrknfPYcZu0xAoP4O4w0rU/+6vO5K7D/Wq+59awweVf
         3oLm0HvMBykw9GkoLsjRcDpUNFu+ADf7aCegUlGecPkqdEwuLPG81GH/RvU64qKNFfJa
         tqRDIUyR4SUBjKZOWf7X21i6kIFH3aju0X8v8QXz67sG51Mtp1vdsVQ3F6XN/aUY0eES
         Ece4fZrsI918QsMTL9ceCZsnWXoQg2sm3cfZEIHVGTiIuNKZN4Qpzxlg0Ads31+AocRb
         GRytYCKZkn3/plVM/iNkis2/CU7sEKX+gFoX/uoOfqpIrxWuj8hkWngBjnD1ZEtLp7Op
         /UcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007670; x=1748612470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0aKf3r0veUqn1rT4el+1RxCAoZmF17+2VzJGANVxCI=;
        b=Uv+WIC/07cjMlrDvGaADmOzA8FeWxg8bTUOM3W0bSol9/MawAFJXxnpalYMnnw0oeY
         WEbNHNoPRZX2J0rX8inVcINhVoxYQHrg/ZNrMEvOG32U3DJkpzWMy0FKEja4AKyNB8xh
         ODPth3+neEMYpLujALY0VotTyosB+mfT+TDYAJ1ttJ6/Ks8kObPdq5raZTkCPSG4DO8a
         fQWgYqrbOi65aEw8B3seTmxVYjCd7f61SJiXrDJHBCDesuFVw0cnhQr3QsSF7OGCuLfq
         4pX+HdYp/DIBalDJj/a8l1UPszpul6LKa1sH8PDxefyhuFcekhY3drUzt16oF2spSWNA
         Bj7w==
X-Forwarded-Encrypted: i=1; AJvYcCWvxkmIIxRXziOADixF+yx1yee0u5q3yn27W1ih7Dme/YBS5VKbZRzkmDBL2I759YLsu9kPDQ9eKncFcTTMRxrH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3vdmD9EpM+J4t/Gt8ahjGW2AOcdqfZCGcatuGximffchsLybr
	Ho6S9Ik+HiGeufWfDtqw4hpsMX3JKKMop0JdWJ/caNEABxye/3e7aPv6K45kYPRqtBs=
X-Gm-Gg: ASbGncuUfrGF8CUOEoqC457JAYAoRliKvflWkRLw23ge0R68nh9rPMOPcHdPR966xel
	YGWXmtR8wkTdw7GSEEh3b6lC0nObpuuerRdZCYfSXUztML9bpdaEoC0aznebX+nOv9Tf5yhkVBe
	I4dlZ4UuMeyOf02zro4haRwA4/+bDWQWK2ZsLPrBiIde3Y41bRLkkqx45P6C4AdMTRUdt1bYaIc
	nh8E4ceznVfnAQ/8fbeSt+ujWF1qdBBN6gFkZrKye57/gEnMc0K1r/25EMFeFSfv5noCjj61MBO
	GaAGVpo5aCb3yYAbMtfXhs3NIzTGTvp+98t/c/1Tgjh+bt3LLCx15mD8T+c3nDgX9MgHAq4mft+
	Uw5BdtAMtZy15qKgp0S22+ICC+A==
X-Google-Smtp-Source: AGHT+IEajquH8YxvUkbDSaTSmZKiibO3mtnqJl45yxSX8n0PgKqQyv3ngd+5PXGwnfc30g1Js1BKCg==
X-Received: by 2002:a05:6512:3e04:b0:54b:f33:cc16 with SMTP id 2adb3069b0e04-550e71b2359mr11620509e87.16.1748007669877;
        Fri, 23 May 2025 06:41:09 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:09 -0700 (PDT)
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
Subject: [PATCH v2 19/21] pmdomain: core: Leave powered-on genpds on until sync_state
Date: Fri, 23 May 2025 15:40:16 +0200
Message-ID: <20250523134025.75130-20-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064111_953055_5E13170D 
X-CRM114-Status: GOOD (  14.49  )
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

Powering-off a genpd that was on during boot, before all of its consumer
devices have been probed, is certainly prone to problems.

For OF based platforms we can rely on using the sync_state mechanism that
the fw_devlink provides, to understand when all consumers for a genpd
provider have been probed. Let's therefore prevent these genpds from being
powered-off until the ->sync_state() callback gets called.

Note that, for non-OF based platform we will keep relying on the
late_initcall_sync, which seems to be the best we can do for now.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 5d2ed4edffd7..6da25e2c81d2 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1327,6 +1327,7 @@ static int genpd_runtime_resume(struct device *dev)
 	return ret;
 }
 
+#ifndef CONFIG_PM_GENERIC_DOMAINS_OF
 static bool pd_ignore_unused;
 static int __init pd_ignore_unused_setup(char *__unused)
 {
@@ -1362,6 +1363,7 @@ static int __init genpd_power_off_unused(void)
 	return 0;
 }
 late_initcall_sync(genpd_power_off_unused);
+#endif
 
 #ifdef CONFIG_PM_SLEEP
 
@@ -3471,6 +3473,7 @@ void of_genpd_sync_state(struct device_node *np)
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
+			genpd->stay_on = false;
 			genpd_power_off(genpd, false, 0);
 			genpd_unlock(genpd);
 		}
@@ -3502,6 +3505,7 @@ static void genpd_provider_sync_state(struct device *dev)
 
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
+		genpd->stay_on = false;
 		genpd_power_off(genpd, false, 0);
 		genpd_unlock(genpd);
 		break;
-- 
2.43.0


