Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35779EC1438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/KXJvU/AAYNqQHp5ebH3wq5fKE6yFx6Fm3sAczFSPc=; b=3uWXCPb9CkxJocienxavSFDPvz
	1/j2VAPZ+xcs4ECLHajFCN3yloHXP1Pv9RIy+NKvoyXEogVcqf1A2xVJNJ6DjSNVAyt4eHaSUg8jU
	1iWxn8zNUC4nXCXeNrsQfeSKwQYtyGjsephHHwJ/PFHOrG9qnvRYt7R3phyMOfYJQq9XEUJv0whuc
	4sUIl39mibGA52rjrutrMStjFU6FUuHhWzYC9GYcl2nX9dV6Z2aGe/9PU5acz3KBRhnobEZw5gL55
	uJQqRuTmUiZXtMI6HYEpxom7mEmfMWMmPO1AauUdGEV026vud+XIviIbmrlRN7xPTaiColnBtAJZm
	2tezH/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPiv-0000000FDJm-41a0;
	Tue, 03 Mar 2026 13:23:41 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPis-0000000FDEn-0abs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:39 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-389fad34e2eso91965951fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544216; x=1773149016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/KXJvU/AAYNqQHp5ebH3wq5fKE6yFx6Fm3sAczFSPc=;
        b=RS8l/pVXuXOfkzjM7wC23DTbLcvzC+MgKeerfur3/8qtuYqCkyupRpGV/Jw1/FVkDi
         VXP11yx+GtzhKrcTkrkq9S4ook2n4V/c4gzmXGFbDQ17HPeOlT7m0dozqn6OH2ijXMmk
         w8f77HwlYaKK9z60SXjH1hO8m5J5rb5wUngFqQqukLEWwWB5F0BaUk9UE1fkdgv4HjRA
         P83oIY9lpwDaObzW+xgsjJpX6rAbIHfmPxYwP2RHuFd4Y3vUcWu95KFJDOuNoqMuJd/5
         xzIOsaFz39nL1FaIVtt0wTbOf6h0vITdxrlZkTQvEF2SY9d+LpS7GJ/uBdW1Ukwti259
         lGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544216; x=1773149016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P/KXJvU/AAYNqQHp5ebH3wq5fKE6yFx6Fm3sAczFSPc=;
        b=GEMS1UwubrQn4+/woBtaRTm4pvoUWyiSE9l+tIO8cDxQ3ybCb5+qm5iHtckPt5zJoC
         KxoHH9DjsX29F/hdFO1Lm1yDbWkn8wStvxnsOnWb/EPI2Aychj8fHyVh6dCUMhRCYxtY
         Ipz21OCN4KB1ryezKVvuZnrYow4rcsinSAuEQQmWqCO8KhWoCCRJ4zEniSBfdCujKQIc
         a50HTAzqCmGt45AkrouxxgnIbW+MAi95xfwVAn4AtSJHkP2PRHFmNv2Z3ksgmADJ0KUn
         YD5DK2QspJSrfXaPM1gktOzbA7/x5keQHnkF7vdoldI75vFvW1tI50SeqzCa26fh6sBs
         DNbw==
X-Forwarded-Encrypted: i=1; AJvYcCX4LvVz+6kBmwYTky6ZIo1EByVm533zNmjoLOOiZlgtseUOGGT6lvanGdXSmH/vfEK2AEQDtZH55VvosXDHLNW4@lists.infradead.org
X-Gm-Message-State: AOJu0YybWQU4BcHg5sn8g9PVqhbmFzHRloQ9X6DcL6Lmggv3dkoTLq6N
	znRgc8ZGXhoG7KmJ+nI9wYNmSi6uxbEFNa5uE4FbA0Bej5OnK0YCK7yP9qcthV74uwU=
X-Gm-Gg: ATEYQzx0USriQvsjARCHcYO2pM98RVYnMsiXbCPFcVZ6XeUXv777lbJBjhKwdIdStUD
	zUASFjX73yACwhRQ7Uk5Jt4nbn2/ZmSPChZ9cxdAFJKo2nTkmCbfvwpJ+4d0RHgAcoAxUXQCqi/
	fZXiO42MQCiZpHxtOnV2wiaxHqkF/7Mol81xZIAyvLgtG7Ovbak9BhUIPfpIwVXx11/Jqh/0fXY
	dmROjREeholyHUSUtPTC6fIMvhxXHo72DqQjJU3lzDTKWl7qT4QcDNncqzq1SNbS6JaBwKOPboD
	30LBElyuTEFOYbu1gp4TXAgcsANGAi3ZgvkssiALBYzkuwgtZbC+OSueMgNPznmdOdnc+qEq3LE
	aJIpM8QIRRqbrHoCzQucyu1BurRdXXBOGNl1vikhFl1v11e0VTBm3pfrYT7Ag/VSD+Mdxmqeq2M
	nltA+q4EryK/hPJvsmokTHy2tfxGw+R2Ibe3hdXALlzlAdr/fWPbGGUlBbEyvpSrJE/9DCFNvO
X-Received: by 2002:a2e:be8b:0:b0:387:197d:207a with SMTP id 38308e7fff4ca-389ff15e1c7mr126006401fa.26.1772544215824;
        Tue, 03 Mar 2026 05:23:35 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:35 -0800 (PST)
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
Subject: [PATCH 9/9] pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Tue,  3 Mar 2026 14:22:55 +0100
Message-ID: <20260303132305.438657-10-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052338_196592_3CAE992D 
X-CRM114-Status: GOOD (  11.43  )
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

Due to the new fine grained sync_state support for onecell genpd provider
drivers, we should no longer need use the legacy behaviour. Therefore,
let's drop GENPD_FLAG_NO_STAY_ON.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/renesas/rmobile-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain/renesas/rmobile-sysc.c
index 93103ff33d6e..e36f5d763c91 100644
--- a/drivers/pmdomain/renesas/rmobile-sysc.c
+++ b/drivers/pmdomain/renesas/rmobile-sysc.c
@@ -100,8 +100,7 @@ static void rmobile_init_pm_domain(struct rmobile_pm_domain *rmobile_pd)
 	struct generic_pm_domain *genpd = &rmobile_pd->genpd;
 	struct dev_power_governor *gov = rmobile_pd->gov;
 
-	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP |
-		GENPD_FLAG_NO_STAY_ON;
+	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
 	genpd->attach_dev = cpg_mstp_attach_dev;
 	genpd->detach_dev = cpg_mstp_detach_dev;
 
-- 
2.43.0


