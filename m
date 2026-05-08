Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B7BCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFYMD9J9S/4UjhCI/3FhGblWRPgd4BSU/A4adAW4pr8=; b=eiky3XkV4prezwLZfRbKqsfj2f
	MtQcSk0gAbsIr8mxZiiijhZgCyOhSzW14RVdnPCSZ9hddCtiZkIVsqNXicqnL8SiMJXBrTI1AsDkl
	BOgXAwYLgOfczhApRB0fDiFYrhHhEfklHstZfciraHhpb3MeUw0qP2xGKPsLFtJN2Ww6uhzyLtwBe
	pZpU9HdLlCS8bs4eQ7sVoXvdJzBlzviPwcuysr7rmpK+NO/6kImwFTOfnhmSyyjXEiYtafDwrKD8K
	u+3zkjYch+Rz5zA5cG33OhkHnM7VCaH0M1uNgnL05y3LQQ0qSZlErA7X9oyIyCqLqLYYzNqsY1HSI
	CevcT61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUO-00000006T5a-0Xvd;
	Fri, 08 May 2026 12:39:32 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUK-00000006T0p-0NTc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:29 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso16961761fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243966; x=1778848766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFYMD9J9S/4UjhCI/3FhGblWRPgd4BSU/A4adAW4pr8=;
        b=zwn/7Xl4xzXrccJZYNZt9WOb24P/z0Iu6OsHlWqG0wRLnmChq3F162yNQRSvDYoZe6
         xXKWkVKxux5UktQ8LD6/dfq8sOf3BltM6pccYJGQkwsCH4+CejwOw0GEfI+Vs7Mt7TO+
         QuOHe1ODnf0ddOa+2evXZnfHDYDBvmz7tlWSmx9zyndsdydF9IMYB1WEcKHqlvS8eKat
         GP6qcr1mHlGmtpTz1vMlaOZhpAs2YWLCaX4hwZ8c1pn9MAkqLpZSMa6VTuUFCanutDOv
         3WACvcm7LlJKY3t7e/77FsaSG8rhMP366myU2k/05WfKBg4+enmmeJl61n8s4YA84dWn
         VKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243966; x=1778848766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFYMD9J9S/4UjhCI/3FhGblWRPgd4BSU/A4adAW4pr8=;
        b=qXPb7890RlJd4BcbYFm4KzToBVH9QFvdZ/iZOY49JGLlXPp7bzsKjuIrtPLUlg6WNl
         t5PIJymQmmQabb4wQghpFkUpqTbSZCwxj3GX9UMPoD4+KkWjckrDMhqMStRiGjoD4Zz3
         MD60OmrHK0vkfgZ5K6Pd24ZWaOeVSMbdcKcU6U11nW2c3LBBW+OLRc/1c8AiR6uu8Njc
         5SAKEWaObH0izyWsC/Acx1yKXDdz6qG4YTeppRY1ueV+knaK4xtASKKNcMruZ8XbqB+z
         BVmBzIorp3yI4HAuAmZkFbIp43kITOX7k66wpsvokK5S6/vbQHvK4hbax3+su0M0kdG7
         sipQ==
X-Forwarded-Encrypted: i=1; AFNElJ8XJt1hqy3jtt6iR/9Avmj7IMlDXrV3vZ+I7C9TtdeJqMGfCsrc2rv3daA+ZTFDbuB3P/V253RCu/OP6oNJAHq1@lists.infradead.org
X-Gm-Message-State: AOJu0YyNHxauHj+Rlb3vyhILNH1deKracK1IQeOxWEr4Oo3mcNo75g6y
	9XgxkF6PTvgMIcdL9TBPmrYxnzL2sstdNjDjRGpXDPUsavEHZ13P0GkQJ05+RmZ9gFA=
X-Gm-Gg: Acq92OEZCXX5Bb+LcY+wbC/utkkDiCaChbCdJCHAmza//O/Tq78Zo8QDdCNBQL/VBFH
	SUNZ7+iKIAhgYjFMRAw5bol6s1FkFEZ5M94XFStxuPLYYUpR7HwgIpm5iD7v6cxaFWEe/L5/8gd
	6shmfrLVPTU58DJKebXrTlV6axbsGyIFvyd1MhyChi86M8Q9XUZXL5zgIJQNWmqYy4VWsSWNfAn
	44Ff8fK+5NY0AFGyS9DLz8bkd+QTcHgQmCjFwOpWfCDRhO365GD6bSkaIENQJo1zvI7ettekiR5
	Co8zeChbTbOzwlw2OvqSVmADmRXO6OeWpkqLoLAvZTYAKQulCI+CeLqj2ErtRdyqfTBNSoT2jHa
	4fUN1VROebcfdZOkws6aYqpTUjGyY22B7zok+1t/67k372D2IHYEh9yJg2il1sXnaUMdbY8jf10
	RPTdvmUOEwHkNhEfawo4vqWnVY3ze+ih/WKyPSxw2wLS7OR/wyf7FGqB02109r0ze7yZ1z9rgl
X-Received: by 2002:a2e:b1c4:0:b0:391:a48:a4a2 with SMTP id 38308e7fff4ca-393c41368a5mr39654801fa.10.1778243966200;
        Fri, 08 May 2026 05:39:26 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:25 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/13] pmdomain: core: Extend fine grained sync_state to more onecell providers
Date: Fri,  8 May 2026 14:38:56 +0200
Message-ID: <20260508123910.114273-8-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053928_150641_5BD9B17A 
X-CRM114-Status: GOOD (  12.76  )
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

A onecell power domain provider driver that we can assign a common
->sync_state() callback for, should be able to benefit from the improved
fine grained sync_state support in genpd. Therefore, let's also assign the
->queue_sync_state() callback for these types of provider drivers.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index c01a9a96e5c2..b2b5cc30c7fc 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2917,10 +2917,12 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 	fwnode = of_fwnode_handle(np);
 	dev = get_dev_from_fwnode(fwnode);
-	if (!dev)
+	if (!dev) {
 		sync_state = true;
-	else
+	} else if (!dev_has_sync_state(dev)) {
 		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_set_drv_queue_sync_state(dev, genpd_queue_sync_state);
+	}
 
 	put_device(dev);
 
-- 
2.43.0


