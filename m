Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01065CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GaxAP6ysJuJBahsu75EBbPBsRu50PTWws4c1kr5c8Q=; b=09HApKSoLt1AYKNSbXvzJ09eoG
	0UhVlG78XNnsQOQSzgBlsDPr9LkPMZzhF4IWBpjsKqBjPnfWXzIm/fQBHOvN6g7rKOiec6XuPUEwO
	7eqIwRT+VE++xy52HK+YYjW8PPH5MyZebfhXZjDdBMzDlwjdi2ctUE3FrXpMx9x0wXAZml71xc2Br
	UJoClC4OQZFWCJw4MOHj7Giml7xjslbmZSqBxue9LPB6yCq8vD4uqNP6e1ir6R8Tmmscd/vSPNlBn
	tCGdTlZVH7RmerxVqwhAqUWOsLw8Cwi4qL3hFapasJkPMZ1RLKO7CQzP53yJiSUZNmH9F6VFmypaC
	h8eKvSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUW-00000006TGB-2m8Q;
	Fri, 08 May 2026 12:39:40 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUS-00000006TAF-2Nfo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:37 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3939d2bd739so18323351fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243974; x=1778848774; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GaxAP6ysJuJBahsu75EBbPBsRu50PTWws4c1kr5c8Q=;
        b=axbHoo+X3cLDy5GeL/uCefrT4XMFwyleAEGCT849m5GbP0RuyyKvvm0UbSP6tJhYgY
         VuhyFCHDZ2V0K6ed6r+4NDUVyA7Ei3Qaz2MmHhN+1sby1Pz9uCmPJNtSO7MA9so1D3tL
         IsjSXJ40/rHSymdDU83FDNWG+Tdrj13MM52/KzcVvZvKpUupVPSjZhTaXcn9dlIzXiIj
         8qqdn+a+RSGFKd3K3U6g+kbVdy8n33r6Zc8529UOVYN0r/+NSDhixgjWSBU7neNh4M6s
         Qe030EE+pg2+2mlaTDWBaIN5kzvD/9CsmI+nCnW54n7gdcmoF38oXUaONtsO27aUpgNM
         uZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243974; x=1778848774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GaxAP6ysJuJBahsu75EBbPBsRu50PTWws4c1kr5c8Q=;
        b=c6OB/cJm8CIh7FqE7x1tMbSQjBZiU4ULN+nOpLX3Mx86kwV9lwTF/W2DfN4FpoGj7I
         SxUAZmE8KTSr+VSlow5czpYZs5lPlCyZSTO3XpNmOIQFQA0HWL8wcgfqEWkTagtdKsoj
         hRiGH+Uk5LTFU4HMpA1PlO4B9G+7/OVhw/6f2vlrxEBSWRcGTM9na+4PIuUUYWyrxcH9
         2fSOBZE14pcKRHqiqkzJNj+dHCZwYwPDRuxAWYEjppI/5volt9rA8ZbCY/s4bTA/L0mO
         uCLUsDXHJVDrSAyghvfwbJshgq8rupi9p5RqFmUfC9H77Q1iSTqpf7hlEKFKxcrvielZ
         6PgA==
X-Forwarded-Encrypted: i=1; AFNElJ+3C2v5CpnMivUBsyDMluc+sKSd3KiIwGd/WsoCQ8+1x80bykbOhcAsHpCtgUS5LrfW7qvtYr8bLLwcTQ4CBmIb@lists.infradead.org
X-Gm-Message-State: AOJu0YyCnWNNZkGuaal55vtDtG2bW6ccYsAbNUDj670tWrg0Pp29nCLS
	ZVG4ChyceUKsmcPWL1TNod9LSLu1BuQGY+lhCxYD84JW3J/iJwuE8Ejv+jD6j6a6GuY=
X-Gm-Gg: Acq92OFx9uM68fpEIPKHLo6Mc99IXry3Axt4dVkz66ssPIeudnwm6ntIftJL9xvyT6I
	Re9TXec+UtO67IBtj8/TftF/TZ3+2z5Upz1Oj85Iuk5add/XiUnHXhbZp/23zAxMqmUV7rT4444
	xRVRHK9sKT/ogsiB556n31yCePZnptjsD7G4Lbw1rRWqFIj7oM2yHbMOOc1ew0iZIS9njZ7atBG
	qTlxOLkGAjC0NHGzzkAn1t8sQVjmKgpMeiSri+DsNZqCTKO+AuddbBAduq3T7H4xgTy/NphcbLX
	CDl/DXj2Fodp9wbsS/Va40czJYJdkvTuDoIp/hXTn4PRvZBPqwCcIp1N0fbiTsbdsmVxUsCZriW
	B9QAnn304PVpnMmfuDWAqX2BuHIQaW4TvjV68L5IJrqp3NjRI11ln8D0+fBnvU4gmne5nabidNd
	jW+HcxnQved+vsfE3yzHHwha/BNqcwBDIHsn7gozWDn3vvR3ZOQLs31RGaSXeISNLHBI0SkI/Re
	F50ruiFXGE=
X-Received: by 2002:a2e:9bd5:0:b0:393:bb14:9ae with SMTP id 38308e7fff4ca-393c40ce7a6mr36476961fa.3.1778243974261;
        Fri, 08 May 2026 05:39:34 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:33 -0700 (PDT)
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
Subject: [PATCH v3 13/13] pmdomain: core: Add a couple of debug prints for sync_state
Date: Fri,  8 May 2026 14:39:02 +0200
Message-ID: <20260508123910.114273-14-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053936_621392_9743E9B7 
X-CRM114-Status: GOOD (  12.34  )
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

To inform the developer of what is happening during sync_state transitions
in genpd, let's add a couple of debug prints for it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b5d90ddfd698..3d3e0f38815b 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2756,6 +2756,9 @@ static void genpd_parse_for_consumer(struct device_node *sup,
 			genpd_lock(genpd);
 			genpd->wait_for_consumer = true;
 			genpd_unlock(genpd);
+
+			pr_debug("%s: wait for consumer %pOF\n",
+				 dev_name(&genpd->dev), con);
 		}
 		mutex_unlock(&gpd_list_lock);
 
@@ -2772,6 +2775,9 @@ static void genpd_queue_sync_state(struct device_node *np)
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
 			if (genpd->stay_on && !genpd->wait_for_consumer) {
+				pr_debug("%s: queuing sync state\n",
+					 dev_name(&genpd->dev));
+
 				genpd->stay_on = false;
 				genpd_queue_power_off_work(genpd);
 			}
@@ -3637,6 +3643,9 @@ void of_genpd_sync_state(struct device_node *np)
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
 			if (genpd->stay_on) {
+				pr_debug("%s: sync state\n",
+					 dev_name(&genpd->dev));
+
 				genpd->stay_on = false;
 				genpd_power_off(genpd, false, 0);
 			}
@@ -3677,6 +3686,8 @@ static void genpd_provider_sync_state(struct device *dev)
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
 		if (genpd->stay_on) {
+			pr_debug("%s: sync state\n", dev_name(&genpd->dev));
+
 			genpd->stay_on = false;
 			genpd_power_off(genpd, false, 0);
 		}
-- 
2.43.0


