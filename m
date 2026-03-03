Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A368EC1431
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGEFbwaqUhjNwCekhYMgDEG4xaWMEQ4ewEceL5SvVds=; b=Os/aCtaNFkwRGKZOQiDKXdpWwQ
	WMHnoyZCsxsxTBtuAnz0TpwmTLARdoDP0MnCTOPiDvMlBWFLZeeYYEv224VSnVpqzQlz8IW/pw+C0
	UswDww6+ckLejJd7uRdesPfwbaqA684uMKQY8Nbr2+2htNQawAmchD/fXJ+HTKT2ue5YBQ2wbes8H
	Hvy5NapAABrF0/f7K6a9nlTYSv2fQdXnzkvLMb1Kz/jbWYDVp3xcSaI4fy8HdRxm9AHJfAXjcmTKx
	WoxkqcWvRLQPX9h0Of0sfvMfzODFS8OetRz67px/qKDZW2E1ZjgBgAQZvUf3vRacXhE4b6xA45Ibc
	k08z8KGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPiq-0000000FDEX-27fm;
	Tue, 03 Mar 2026 13:23:36 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPio-0000000FDAn-1foV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:35 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-38a01c80c34so67277471fa.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544212; x=1773149012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGEFbwaqUhjNwCekhYMgDEG4xaWMEQ4ewEceL5SvVds=;
        b=dreWjPxFWpb/M+tiArbH1/SPoU2cEfL/NMeLtmPh0vFeusdlxp+6yqdUJhrXOJ7vEs
         dy4LihlzLVV/YG+S3JVSawBzD7w+G74Gu3aAi2/OobQ3Mf8qYQSY+eFMhbbf+w9mDQ0i
         29dYx3K66rx27jgoNhG2aiLCC4L3Wzq+42J+KtXHrTgkjlQX2j1M6Qhj+GgN9pST+T6q
         OPj+3r2cvH38DtRHPGCLjyRolxIqrVfuTl6KeGrJPqmkXZGvS3cepSwVeaw1Ss0JVoZs
         xOllEaXx9mX8/jU+aYakEbJgRZhlxHmN2bfHGW34J0FOE7IGYANt2COK2fr5VWwzloYs
         Jb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544212; x=1773149012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGEFbwaqUhjNwCekhYMgDEG4xaWMEQ4ewEceL5SvVds=;
        b=LH1WdfmA+e/N/A08OE5AjP4bvjkYGtk7pNeD+2SJ1DNW77kpN39wHuJpdSNyJGikX/
         urGjnvCTkBb0bxUxruB7kQqRdXuKINsv4iQCChzH5kyjsf9DBCE7oUio62fW4739VTLR
         wIg3tzMG67I4LkLTFYni0Eqh1QcFEhIic/fBgY2BoobV1Az0ueo4+I3IvKkO/hnmdSEV
         YJd/bzVl8Fx/9FxqHCBhqpckc87JYRm9t89z/SfiTC1iALub0N2i0T7mdt8RCJMJ++MY
         RbuCbvEhQSyh1r7dPBRiQ9AoMRmGNXZp4UABzMz4gfulIp+97HC2oVqQqWdkaXWzjNA0
         g39A==
X-Forwarded-Encrypted: i=1; AJvYcCV5z8t9KdZBjDgjZShq1+n3K3OIqcUC2b7WfI/ldrzE4FZXC86Y0LEIj6/kDuWuE/eMmmYBwhJkmYT7Rck5nyi3@lists.infradead.org
X-Gm-Message-State: AOJu0YzI6XjauEyiTjdw2D/OTbtNKKJusWKCRgzvnTMEkta8wkTCHwBl
	cQiUSb04O0Ijoq6C3958B3sYusnjx9tAWSOSUYNJJORz0AZQz6MIgpKoMV/a09A3cJM=
X-Gm-Gg: ATEYQzz83TZORWJdSKXIcpcxpKYJ4n0moRhxkqy2aCeh77Ek4v60kMDb68P+FXAP4nF
	64cPn0rCEitV3un0cFZpcqstpgBOAC3SSBq60/rBt4vRIO4Jpxxkgwdrq0zYqUX/Q0o5o2rK4BN
	UqgBpqrroJ+9IYuNfuDTT1rPcy+Ps7zSpEw82trlWhQ7wFG25Oa3Xi5vOcSaWgzXXOlEJuOUtQ7
	xZaIJ5W4z1Faw+bSxyX3IpYfCC5s/Owp4P39PxVUwMz5lao/AfSuCauRuNyMRzj2L4SMRNo0X0N
	UPU21ni1eVHz4LFjYNLZkN7riWKWqhNedyVl/MU5IxTCUM5GbW7V3enz/060OhHseZlQPkTiR7C
	QN74RcJE01NOxS6g/KTApFJguMLgrcrIuzem5zfPA7b/MkZA3+lnrpGhgFP0BgeBKotx1p43a54
	vElwEwPnOp0JhhsqMrZqVAFL9LrgfuN18lS8YdZVg/BUGUaISfBetKBSx2Gd6eLJkGQqGTZjobh
	eqc5mkTERs=
X-Received: by 2002:a2e:9a83:0:b0:383:18fb:fdf0 with SMTP id 38308e7fff4ca-389ff34fbe2mr88653161fa.22.1772544212105;
        Tue, 03 Mar 2026 05:23:32 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:31 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>,
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
Subject: [PATCH 6/9] pmdomain: core: Export a common function for ->queue_sync_state()
Date: Tue,  3 Mar 2026 14:22:52 +0100
Message-ID: <20260303132305.438657-7-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052334_467694_2687E44D 
X-CRM114-Status: GOOD (  13.81  )
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
 drivers/pmdomain/core.c   | 14 +++++++++-----
 include/linux/pm_domain.h |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index e0b9dd15a949..0b07b2d15969 100644
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
 
@@ -2813,8 +2816,9 @@ static void genpd_queue_sync_state(struct device *dev)
 		genpd_parse_for_consumer(np, consumer->of_node);
 	}
 
-	_genpd_queue_sync_state(np);
+	genpd_queue_sync_state(np);
 }
+EXPORT_SYMBOL_GPL(of_genpd_queue_sync_state);
 
 static void genpd_sync_state(struct device *dev)
 {
@@ -2925,7 +2929,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		sync_state = true;
 	} else if (!dev_has_sync_state(dev)) {
 		dev_set_drv_sync_state(dev, genpd_sync_state);
-		dev_set_drv_queue_sync_state(dev, genpd_queue_sync_state);
+		dev_set_drv_queue_sync_state(dev, of_genpd_queue_sync_state);
 	}
 
 	put_device(dev);
@@ -3657,7 +3661,7 @@ static void genpd_provider_queue_sync_state(struct device *dev)
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


