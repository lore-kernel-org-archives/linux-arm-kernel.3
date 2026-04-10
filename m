Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A03EA3C5C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 10:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1UhYTbrB1qQtFiMVvjgMKHcw9lJtRkAWHlKZwVPZOCw=; b=Zysf63rbvjKrwIRuFwG4QSzJ6v
	8aGaJp3SEfNNtjjW57E50ZxObRRsJKlVwVqHVWyCYK3qpNyZcZ1l1WENlnelumEAz60Ykis2GhHqD
	OxSK3Dxbkn23oyDHM7ma+jiFMozArteeRKOeUXObB01XzyIUYWKDCdctAZn/vZBWDZpFHeRfXp39J
	LE3OyG6KKEl3j48Zejb7jDAWLvQ2VzI4UqWhJiptQfwWc6J5yCdWKojzIogbTTDg9kSThCT/IN08f
	OL3O33dKJHN5CVxkLqKH7lYw29Gmpak4toF0GiUBfVDG1SPSAvsI9eXsZIVmwFNYygc4eK66LbCnV
	S0xfh1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ig-0000000C1NK-1phH;
	Fri, 10 Apr 2026 10:41:22 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB9Ia-0000000C1Hf-1vRL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 10:41:17 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-38e387f3838so14647601fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 03:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775817675; x=1776422475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UhYTbrB1qQtFiMVvjgMKHcw9lJtRkAWHlKZwVPZOCw=;
        b=k94ll3agOrflyvoLK+tvt+uMLbWDoCR/y0Y6zDOt0PBkqA+6dgSot4YrYcQjbMMNvp
         NdkpBY+d2mAkt0n9tlZ0dbG75aaUgBnnPDM6pUOKdiF2W2IbRE16xlSS/Ut9riM8picr
         GiqvB+6eeWlH5x0J0bfx3kVrMr77twk/9p0zX/ca8bwPNktzVABQENM/OoDuZDqjLdLb
         yxkeQOIHGfMH+IVxEJMxv+wSNlefCSu/8qFge5Tftl05wKq8daqLVZnPOSGIRIo4q3fs
         WAOo3dNO1fDVjM81VQ2AwbALvMoZelBFvVFa2CofNh8Br2/NkD5GcKqcBl/kxWa2EKGQ
         ENpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817675; x=1776422475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1UhYTbrB1qQtFiMVvjgMKHcw9lJtRkAWHlKZwVPZOCw=;
        b=aZxCVaRWfOj5eH8AST35lLvVC71vBfM9FnaIjNvwIIYEa0nPU7PBbG7fHszb49wnK+
         ZsE9j99cPF72tZUCyBfLv7AHlPvuclSxAaR3VNBmVIYGBHJ5MeMmqwPY6uSQ3E2H+VtS
         Nk3kv1qjlTiK+xVlW9VdMir24re3R1RUahBQCT0Fu9Ts3haR7a3FxUp7MZ1qmuNNLwmp
         dPcsx74Q8bqLuN8u/3XTpt2mWYm7vhEtRJtMnobq1O8FMvTijAqEhHF7SMSJ4Corl2O/
         U+U1mvAcMDgGAtM0JOZQhHjqN0EeBe4SCvXZZRyuGUB0toknOhPtOFD5fzS09TTX2y6C
         99VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVolgUNURAn+755JaEArQiqsiS8M02+DGtBPPPlvleajwaDhW70YWfsxvC6aPHvVmnEwdKa050M1DIwSlXBfgX0@lists.infradead.org
X-Gm-Message-State: AOJu0YzxnfeI0m41QYzLHNqnewoyEU4Mplq1TeuHyHHUkj1VcS/sWbLh
	1XVsyPvqVquPyeIIXFWWS/Y8fIDWamicTiP4usy75IblhofDumZy1v+mZF1Gfgk4Z+0=
X-Gm-Gg: AeBDieuydwbtAsZONct0ZSrro7krXEINwjensbL7B89ULbKlWCP0ZvzMKm4Vckj9KwZ
	8QdBDYVnWz0egsH2OaFjpHphLPiGArhn35Vrtfx1KUZ9ED7DGbRPKTaEr1XLmF8ofAOQ77agd1c
	6WD6r95oZOM7gE417n/OaSIY/BVWODSj1zabsziK+NsJtynozMzqtSQjdYfYrMI5TynFk12+/pH
	Y0j4icghhLPdjgiBqZB53bvNfUfvWZHieLzXv+mPrGhr9/BS+sRvigRgpemHKLYdpSnMHhjYQss
	sHbkBFH719jPE3yo/dlGBw3Y91vcLWYq2cijVXAEKutjqh/jpHxXByjkbgM5M+CyaWmm2xxjJ5o
	1cqok94DZkFdQBNCjGndZnam1PvM+rIKkhRatZuEgiHJ8NsKBnp4IVt4eL5hr/HTNDg7R/tXmfS
	BY6APT5LxlhvaBM9+Ls8NoAmVPMdDl47ZiduVtGbbW21zMvd7UdbmDrOcumHHHu3Gjd3xb8QCg
X-Received: by 2002:a05:651c:4390:10b0:38b:d004:3f27 with SMTP id 38308e7fff4ca-38e4bf6e48dmr6460551fa.21.1775817674483;
        Fri, 10 Apr 2026 03:41:14 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495455acsm5588331fa.23.2026.04.10.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:41:14 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 6/9] pmdomain: core: Export a common function for ->queue_sync_state()
Date: Fri, 10 Apr 2026 12:40:49 +0200
Message-ID: <20260410104058.83748-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410104058.83748-1-ulf.hansson@linaro.org>
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_034116_529276_7A2ACCE3 
X-CRM114-Status: GOOD (  13.69  )
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

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 14 +++++++++-----
 include/linux/pm_domain.h |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index f11dc2110737..49e60cb67b3e 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2764,7 +2764,7 @@ static void genpd_parse_for_consumer(struct device_node *sup,
 	}
 }
 
-static void _genpd_queue_sync_state(struct device_node *np)
+static void genpd_queue_sync_state(struct device_node *np)
 {
 	struct generic_pm_domain *genpd;
 
@@ -2782,11 +2782,14 @@ static void _genpd_queue_sync_state(struct device_node *np)
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
 
@@ -2810,8 +2813,9 @@ static void genpd_queue_sync_state(struct device *dev)
 		genpd_parse_for_consumer(np, consumer->of_node);
 	}
 
-	_genpd_queue_sync_state(np);
+	genpd_queue_sync_state(np);
 }
+EXPORT_SYMBOL_GPL(of_genpd_queue_sync_state);
 
 static void genpd_sync_state(struct device *dev)
 {
@@ -2922,7 +2926,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		sync_state = true;
 	} else if (!dev_has_sync_state(dev)) {
 		dev_set_drv_sync_state(dev, genpd_sync_state);
-		dev_set_drv_queue_sync_state(dev, genpd_queue_sync_state);
+		dev_set_drv_queue_sync_state(dev, of_genpd_queue_sync_state);
 	}
 
 	put_device(dev);
@@ -3654,7 +3658,7 @@ static void genpd_provider_queue_sync_state(struct device *dev)
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


