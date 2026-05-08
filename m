Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C397CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/3tOYCHKLkB93CvHpDrXeQBRydo0wK6XTWaKDAjWlE=; b=fozx36PI16Ysza4+NWOqJmm6kJ
	uDsyJs8NvXYrp9Zm/Ye4PFYIdfBW446OEWnobqZe5S5L2T7tRXtDstd7Ici5J1fPwoPpMfTTilFfp
	sohFhvjkxaRqI+3pwEuk9f73CBDfq2g4AhpkqRoZ8dct54uLbYpRgmUnwaBFRW81YQQ6iBQHhnt42
	YboFEyiqPQxicmxBADK+IubG17oISDBtGrBYgRVEtMbnR88IURwqw1AiT1iTczCeqtzBllxHJuWKU
	iNzykFhSY7fKNWFsR96tr4MMS1sTvhNrdenxD6AgqAgnU44XIIbcTdEEmu0DwnTkEMHXj5jcmpOu2
	mxJ2VOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUO-00000006T66-1Ha9;
	Fri, 08 May 2026 12:39:32 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUL-00000006T1y-3FB1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:30 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-38be5e86918so24421681fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243968; x=1778848768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/3tOYCHKLkB93CvHpDrXeQBRydo0wK6XTWaKDAjWlE=;
        b=aAcDeCaLpFZ8kqqJBKlbqiJA1ZUVrcs7ncsHTlErtQ4EPkCuTctKV3I/2s+Bt8jt5V
         OTMike0l29AupelhdPrWV+1EJCtPj654PdlJxsBq+mD9rAR8GHjaCNC1iHZykyN6c+7Q
         6MIv8hmdkWsaf6CPaFzFagWqoIjxLZE61Veu3u7PAUNEpXyNVpzkFO3jCY/OkaPiubWo
         88ljzGkHaoH/bCzjFhC5EH3hPGXauDysjgxVPXSwQV2qtYJOi0PFQWX0XumkSz7zCyeM
         1Zlqg11VgJ0p0L2vkszRiiLH2e5m2yltRSjvPHtJZGjnJFJzE4aWFh9I9mDudhrm2lM9
         EcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243968; x=1778848768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/3tOYCHKLkB93CvHpDrXeQBRydo0wK6XTWaKDAjWlE=;
        b=Ib7l1tLaDvHxojfeVzmhiBJg4U6/fJ6SO6Ztf/eGyir/N64TjHcpRf6U0pSGCVX64y
         +ER9+azyvACD++BE/lU6SzRRnPTanbMa9ujcNLUY0i74WeT1jlnset1OkCjlZ/p/Ixz6
         f/14OWVkXPehIryDGMPRzJy9+W1kIaH7Kqleshrs3yWmYROZkoGEqULEAvlP8JSQtRgB
         17j7m69JAqMIgQJYgW+fm8qSNK9C14WyyQLERtQJqPwmj4m52sLR91etBrfNFYlRQmHu
         kgHu+4WOIYJ7v4KlgvuYmnzPvNQpLqLO/r9TZH3e07pY99r4nJ+rdfq+YtbSMXH/Spvz
         IoFQ==
X-Forwarded-Encrypted: i=1; AFNElJ9n7HX1ZYL8wNFLgR6jeT8tc5zcizPpH3py0zCH90yDOqDBVOiWzMJQIT3jA5cKPj7Cpirb2gQKK5Z/eqX14k5w@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0lbLDJhPXAZbUEVbZgkV5eBaUhAYd6bA+aKrkVmFbKCN4G0To
	r+YQNpUgDgXKB/BAfMS3pPqhHcPWyiwbueuo4/GmKA8Cl9EOb8BiLaQQz1S8HeKqzqU=
X-Gm-Gg: Acq92OHT+CbitM2AbJ0lb7QHOXchDvxx/Zx3nuO1zSoa+erhnzzDqLbGjXgBVfRpMKS
	ajJ9Az1yemjsID8Jm6wnSLft/x0Xt8D1bY/lGJeakCTjjYiiDsbbjhdh6DyxktvbT5ZRdiS0yWS
	ci+AKemrENnjW3gmNqP6lf2rfXyKOhlz2ANxJk7uvuK2VSx0X5toHgi8RsLa99of8HQbUTd4Szk
	maXq5fR16dhWFSNE9VHY2Up2LYY3Ij6JZtJy9FGcKdtOozQ0GXGJ5f61p4uxSBtOrp6KWs3dwmP
	k5osrNkiiMvE8Cbn6edAPOIoHNknOnZfAuLQhPNHKU9VTsn+QCiCzHXEfS98Y6FGPVZOX/VPrpz
	j30f2DKi9X/FftD9eIqxPH8QXWqngHYjn3n6fJyAj4/pTsZTwA3oeGfkHsEkm4J5vixEjz15LS3
	OsPud/GrrCpN/v8WlF3LxrLVPFW0SxLz1rTeoTTWsBGHtl10W8ONZsIDt6AtXiFieJumfJgbpx
X-Received: by 2002:a2e:9b14:0:b0:38d:ed62:f1d5 with SMTP id 38308e7fff4ca-393c41c6f32mr39109701fa.17.1778243967432;
        Fri, 08 May 2026 05:39:27 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:27 -0700 (PDT)
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
Subject: [PATCH v3 08/13] pmdomain: core: Export a common function for ->queue_sync_state()
Date: Fri,  8 May 2026 14:38:57 +0200
Message-ID: <20260508123910.114273-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053929_841926_80C0362D 
X-CRM114-Status: GOOD (  14.48  )
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

Along with of_genpd_sync_state() that genpd provider drivers may use to
manage sync_state, let's add and export of_genpd_queue_sync_state() for
those that may need it. It's expected that the genpd provider driver
assigns it's own ->queue_sync_state() callback and invoke the new helper
from there.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/core.c   | 14 +++++++++-----
 include/linux/pm_domain.h |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b2b5cc30c7fc..b3ec3dec3f10 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2763,7 +2763,7 @@ static void genpd_parse_for_consumer(struct device_node *sup,
 	}
 }
 
-static void _genpd_queue_sync_state(struct device_node *np)
+static void genpd_queue_sync_state(struct device_node *np)
 {
 	struct generic_pm_domain *genpd;
 
@@ -2781,11 +2781,14 @@ static void _genpd_queue_sync_state(struct device_node *np)
 	mutex_unlock(&gpd_list_lock);
 }
 
-static void genpd_queue_sync_state(struct device *dev)
+void of_genpd_queue_sync_state(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct device_link *link;
 
+	if (!np)
+		return;
+
 	if (!genpd_should_wait_for_consumer(np))
 		return;
 
@@ -2809,8 +2812,9 @@ static void genpd_queue_sync_state(struct device *dev)
 		genpd_parse_for_consumer(np, consumer->of_node);
 	}
 
-	_genpd_queue_sync_state(np);
+	genpd_queue_sync_state(np);
 }
+EXPORT_SYMBOL_GPL(of_genpd_queue_sync_state);
 
 static void genpd_sync_state(struct device *dev)
 {
@@ -2921,7 +2925,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		sync_state = true;
 	} else if (!dev_has_sync_state(dev)) {
 		dev_set_drv_sync_state(dev, genpd_sync_state);
-		dev_set_drv_queue_sync_state(dev, genpd_queue_sync_state);
+		dev_set_drv_queue_sync_state(dev, of_genpd_queue_sync_state);
 	}
 
 	put_device(dev);
@@ -3653,7 +3657,7 @@ static void genpd_provider_queue_sync_state(struct device *dev)
 	if (genpd->sync_state != GENPD_SYNC_STATE_ONECELL)
 		return;
 
-	genpd_queue_sync_state(dev);
+	of_genpd_queue_sync_state(dev);
 }
 
 static void genpd_provider_sync_state(struct device *dev)
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 7aa49721cde5..d428dd805c46 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -467,6 +467,7 @@ int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
 struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
 int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
+void of_genpd_queue_sync_state(struct device *dev);
 void of_genpd_sync_state(struct device_node *np);
 
 int genpd_dev_pm_attach(struct device *dev);
@@ -513,6 +514,7 @@ static inline int of_genpd_parse_idle_states(struct device_node *dn,
 	return -ENODEV;
 }
 
+static inline void of_genpd_queue_sync_state(struct device *dev) {}
 static inline void of_genpd_sync_state(struct device_node *np) {}
 
 static inline int genpd_dev_pm_attach(struct device *dev)
-- 
2.43.0


