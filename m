Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7928C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhgdoK3MpeYw+rOuxZhcYLfRQHzQPd8VTaoRAeP4HH8=; b=oqCQesa85y/9ai7zw1IP+FEFiG
	qkqqyepS8J+WeMZz25+4BBpCFmtU5WWZQRwFJv+rdR7WVNWqWde9WCP9MJQ8+pOTxurwCg0T8iePf
	vudODDORm8sksgew0f9mDoH6taCGq4Hpjf9z6CSYIsHBfjieu3y0GSudBhR7Y70ISYItNJw2usv1Q
	KkC5OImOFafUmGNvg/f89s/VU2c9PVzqNpontZ0B+3HYB6zJVHSQYt6DTmJuwzbn1Z+KaI5o9LolU
	9OEFRIaksfajrTiUU0unErWrYTQkv9tUGI7DEPZ9BEHiwaedi9YdSu5n9BtylADUj6aUaYxFcb0YS
	ymRJyBFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITbG-000000045gw-0lOp;
	Fri, 23 May 2025 14:42:18 +0000
Received: from mail-lf1-f52.google.com ([209.85.167.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISdo-00000003zJW-3wwJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:40:54 +0000
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551f0072119so1144658e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007651; x=1748612451; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhgdoK3MpeYw+rOuxZhcYLfRQHzQPd8VTaoRAeP4HH8=;
        b=JkY1bwhE6pYIZN6Y8xqfbq846MbN3Lehdyg5elSjzt6zuZ/8crGrenYUFfY+sPA43t
         7wzSkvbqVtQCgK9suMcwi3V5EU4LYlzQpBLf7kTt5S7cchHjVqr444HlaIAPT61/hMvl
         NZY3+ZCvOzBIKOVe8ze9imoVAHehZr9zpQVVwVrAA8oHf7WpnSDUhe6l+E4ONv44ZwOP
         pWYB09J3PL4KomzD2PeJom7MjZMY21arOJybUK33TmFZqwBsn4slrlUVQnzBPdT7tS23
         tB9ThAZReu4jfc8JXAwTAd/rnMJC66sRoKXkL8nK/nynKqbCXcnF0Vcf/kkt+wcKrQWM
         keQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007651; x=1748612451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhgdoK3MpeYw+rOuxZhcYLfRQHzQPd8VTaoRAeP4HH8=;
        b=jZKkJuXu/peFPaLAwvwVj7xCxxn2gM2fIKyi5CsuRAri8ptgFhDGmWixz40MLK/DHP
         E1HjOkLDVpGafqEJR+j33z4iJuJTNrZZdXqrGkAm37X/6/eoh2QcPkfsutjGWrHmqJlj
         7g73rWL2Jh6iiozKsOncWc+y9RSi6h0oMiw0YDfm9UetdBDtZjsihCo65Io5OL5qHoNI
         Jyn/tkI9JaRf21LAF9xS2xkzISRW3whSpp4B+haEia6okUMdhKIJUrNYGAv/cT2cw+ph
         WxbgyGdt5vw217bikY7agHyxN5VAHQBHyJCTiBShc7xZn5Bnbl13InJLb8YZTxHLfMfq
         KN5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWT7RSVCZ4kVYln7UHmqGpyJFz5vbdrKSGFd8hpuswgcbgmbzrxD6ylUbLOWYBuRbDMp0n8Lh9+JYKtnBKUT0Sx@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8JbWjYwRfmdhPzky5XR/ArRPtoqHj6Htz6854YwNyHExNJBSS
	8Ny6TGeQfJ6UghLQpMqOEuNnDJ/b5ACzSrABXgizsEDKKhc05+PPVFvB91DWAVzleQM=
X-Gm-Gg: ASbGncsLw5wfuAwCfy4SvQvXmmrlY8qrUybOYd1CAzu1ynsTTpnhf7Nr4hMIASVR2Wk
	wVbkVj6TwXmfdw4zCyWbHMQM7T+xILWUbs8ILyz+OqrPCZe57k+nOZYRiVgJJbH0kxlUlv1URz3
	WDnXJffgja6PfM1v4I+ehieeioL6b6bQ65KNnyDsaTmgsXSbZjqe8QpgdOhZLj5DQnlifWX/UOn
	cVjr7BRCm6z4C96xuj2yDiom73eVMH8cur5auLOYetJxoS32hm/H5cEujwazZSGSpSqbtMorUkj
	H9B2UIvwJB0P05mvoGfGmospDAalU/ufNtS3AggWhLVOXahypTWl4y8RtwA8jaiCGuJSghWkDSL
	SlaOfR/xwQ0e0dwYcp23tbkxUWg==
X-Google-Smtp-Source: AGHT+IGxKZRIYcmGHvMkuMsGKvsKXAq1cHpyxb57jcrvbj7O4xdTx/mj+TIt0JjLrEZhlxZqFEhQ/g==
X-Received: by 2002:a05:6512:3b8c:b0:545:a70:74c5 with SMTP id 2adb3069b0e04-552156b0fa0mr1317620e87.13.1748007650658;
        Fri, 23 May 2025 06:40:50 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:49 -0700 (PDT)
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
Subject: [PATCH v2 07/21] cpuidle: psci: Opt-out from genpd's common ->sync_state() support
Date: Fri, 23 May 2025 15:40:04 +0200
Message-ID: <20250523134025.75130-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064052_977609_46A542DF 
X-CRM114-Status: GOOD (  14.13  )
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


