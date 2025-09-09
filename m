Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A2FCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7s4ue+vxLshDaVNog/qaeHRfYjor1s3xeCpGVICPA0U=; b=POwlp8F3hiQKgYQ8lCNLf8gBwB
	EMaJk5DkyLRpT28AuF1e1KLT2sF3OcIIPaiWbKBAxq8X0gh8xl3tE1/Nq9uDxF6FXZ5Bv5KbiYCex
	q+alNwZkUzX0+IH2muZzsXDbnJxXarWeEDNuEa/S86FDOLmzGh7fCnVC63999CwLp4PKKsVnOea8/
	Gq44PF1glN0UajHoQv0irhps851NC7nK+zgtbTj5XE2QFvWSebAgwP65pI7+pTHtu1hJKLt46wKZp
	ZLj3cWonahiqoroyFXnjgFz63HcVSgX1olek9Yd5sA0diHwQcq8p5s3F/plBfUG/452zwd2ugBF+A
	wB6WS1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vz-00000008nvE-310F;
	Tue, 09 Sep 2025 17:15:11 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGE-00000006d87-06UJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:11:43 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso6235590e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757416300; x=1758021100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7s4ue+vxLshDaVNog/qaeHRfYjor1s3xeCpGVICPA0U=;
        b=KqQZ9N3M0H6t1kYxoHDXiYsr5T8nyDIqa37XCnrljCcey226R7yTTErX07WA47wj2W
         +Z1uIEkEPiRCt+V+CXus6VmGT89pHfsFD1SGwFvIaTYWujFwfVTTN2cppSehVcJInbDz
         ARzhFs2PV8/TH/fnBTjk+5FbdbTkJE0biGIp35CMykfSXwCpxkq0nKyzDuUpdOKBXP6S
         3JUsOzQPW1df7Hs+6ND0zjBWsszKtte0KpUcJecDTaGK8OrHwOQxzcWSNExUX0/OGrNt
         oOEROjlSWEz9PVm2HcGwdCq/Z8tKUPe1kHqGd7Qu7AnMal4SiApkzzSBaxjE29qtkZR5
         0Ncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416300; x=1758021100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7s4ue+vxLshDaVNog/qaeHRfYjor1s3xeCpGVICPA0U=;
        b=ds9WSqA8HJNMhYmTqnZpMTatwocLW/JyGh40aBdhr2FKwJPROfut2E/a51kQ4bI9rP
         nci3mBrHUaRmQbOEQp9levcj+iXJESE7YTiSCioDvqSOMwasXYE6P6uK3mnS0AwfOBbJ
         YirfLlsZruNaOb/zD9GGE1UyLS/SCHm8D0Eke9xFq+rDXUt8Mg8MKuBHHzTLLBh+flKY
         K89RnDnzHAu3g5G055T/Y3AHZUmpu+lEE/i0Wlj51JK+xxyk3vz9QHI7QSzRpCwlJHug
         R43uuXEtKuIQBdNx0ldI6jnvHAz5yFDzg8glOm2VYzlxlTFPCrX0VbI6lmJe2xV0Xana
         4oGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVATKcFSsRnKhrnr5djYH9VOvmjkxi2ZnROkd68v/4mtz++Y2DlCTWAdP5LSqr6WYitLMERanY1eO185bMcV/pH@lists.infradead.org
X-Gm-Message-State: AOJu0YxfeWVAgkbM7FrkYa7Xl/iBAe+yoV+vaicdWNSy1IW2A9KtgfeF
	Rm9Y16Tl1h5fLTNZsWfFkry70U4DdAIDoniSLrgpxW/+XLQda6QX8GMIVKqolpkZcKI=
X-Gm-Gg: ASbGncvrocmKtMT9VEDl2Qoio+6bxqcrgf/iaQvIW3OqVOBbNKn6/SxzG0G18yvfUo3
	hnCMRbpIH3nOq6W4RQH50OWVsc+P5I4xM4av6eNp+LYRkXeXkQSDMLs7bT8DYFksTry/OgUgZ71
	F9UifAMVTgKFmUgNwV6yJmIyBBED3sqaaPOvpLu8OaMxbrjxRhgLYRDa+BnudBuZSmDw0yTtvrc
	bXq9V5ciMSQolV53ieYVIhDbcBqJWw/PgzWtjTviIBphSlHF0JyZOcpnKpeCyPlfb7oSU9mcsK9
	ABZwKj0ET2rvfh1JHhXAU3DNhBTYbfv+NludBlMx/ZN9r1SbHn9Dw6a8Yxinixo/DhsrmSaLFfT
	5tGaedoBzg0wS9HfH3KykLZEdNr61mNXx4do5TMOTdye9JQ/kWLoKcUEu514lM6p04DOWG0HTyn
	qKkPz9joU=
X-Google-Smtp-Source: AGHT+IH3If1E1wmdYnnMVHOIWDwlC5uh1BOrgxWYASzxhPPmZmGZqHrDzK8CUhRE0KdKbGrCF4Hbhg==
X-Received: by 2002:a05:6512:10ca:b0:55f:5942:43ca with SMTP id 2adb3069b0e04-56260f37a43mr3913159e87.20.1757416300440;
        Tue, 09 Sep 2025 04:11:40 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568190f8040sm445440e87.148.2025.09.09.04.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:11:40 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-pm@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Diederik de Haas <didi.debian@cknow.org>,
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
Subject: [PATCH 5/5] pmdomain: renesas: rmobile-sysc: Don't keep unused PM domains powered-on
Date: Tue,  9 Sep 2025 13:11:24 +0200
Message-ID: <20250909111130.132976-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250909111130.132976-1-ulf.hansson@linaro.org>
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_041142_066468_8EEC3BEC 
X-CRM114-Status: GOOD (  14.17  )
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

The recent changes to genpd makes a genpd OF provider that is powered-on at
initialization to stay powered-on, until the ->sync_state() callback is
invoked for it.

This may not happen at all, if we wait for a consumer device to be probed,
leading to wasting energy. There are ways to enforce the ->sync_state()
callback to be invoked, through sysfs or via the probe-defer-timeout, but
none of them in its current form are a good fit for rmobile-sysc PM
domains.

Let's therefore opt-out from this behaviour of genpd for now, by using the
GENPD_FLAG_NO_STAY_ON.

Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/renesas/rmobile-sysc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain/renesas/rmobile-sysc.c
index 8eedc9a1d825..a6bf7295e909 100644
--- a/drivers/pmdomain/renesas/rmobile-sysc.c
+++ b/drivers/pmdomain/renesas/rmobile-sysc.c
@@ -100,7 +100,8 @@ static void rmobile_init_pm_domain(struct rmobile_pm_domain *rmobile_pd)
 	struct generic_pm_domain *genpd = &rmobile_pd->genpd;
 	struct dev_power_governor *gov = rmobile_pd->gov;
 
-	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
+	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP |
+		GENPD_FLAG_NO_STAY_ON;
 	genpd->attach_dev = cpg_mstp_attach_dev;
 	genpd->detach_dev = cpg_mstp_detach_dev;
 
-- 
2.43.0


