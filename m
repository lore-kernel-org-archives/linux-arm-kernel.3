Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528F210F92E9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 18:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sWjwEy9m9KvnFnDU5TKVoimvwkRXdMUl6feyPSdFKhg=; b=lcQoQahmOle1k2io/aoiRiu660
	EOAx96Ep4DLXyphdJPcQ9xlRdVHTR1K6oYblxh2up5u1Dg1+h2vGYHOxMTx+HSsAKxWRZg34+zDoF
	ZG/5GHqgeQ49N6vpuDFmBAkORRv1ms54XaUvlma/MuuLRgTBasS8TM0L1majYnp+wk8OZE1zTmZIp
	HMvBSth5o2Txi7+CKODzo2r0etjUDhtrMNJjAc8UyHE/hdfMKbAexNbUMgmhocHEUovy4YKiZhzCW
	LllCFENGWDWQZEDGyJS0lbS+tuq1T1bjTsFBUbZYsCGVPuKxCdG4qsqUuEIsHsFVQVFZLQ2fJNcyE
	w8Rwg/fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dQN-0000000DOG9-0FiH;
	Tue, 31 Mar 2026 18:02:47 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dQK-0000000DOFg-3Fk2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 18:02:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2addb31945aso44474995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 11:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orb-net.20230601.gappssmtp.com; s=20230601; t=1774980163; x=1775584963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWjwEy9m9KvnFnDU5TKVoimvwkRXdMUl6feyPSdFKhg=;
        b=VWfF5hNkBymX0+s0C7Iyj8Sw2kuAstvJPlqGmB8OxJAqNiVN58sqgk4OZiBZRNC7yl
         9IUxElq9DTKU6ZTVkzoHdipFvztBMR4xjOSiQ2SJern19odg0kzsFIQn/wI5L3QQAipH
         4c1c58zNHbwT8EllKyYXFug49EUuNws8ar15n2Om7MlA2WV2JEuYJ9S5sKcPO2DiUU0M
         ltx/LHbC9wjgglWKwRw479do2T+RWF5ghE727YthDjofIdGjm2Pi90IKBT8VejpmkTYw
         LdiMrxr5cx97ybd1jYiwVan00bZI36Je9Mjbs+uFQ3X1SPbTTpjuSHbeudLtZ44oV+A1
         1QZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980163; x=1775584963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWjwEy9m9KvnFnDU5TKVoimvwkRXdMUl6feyPSdFKhg=;
        b=bxX5zEaCYGg/KN8r1J0jqquJSrBj0k3KXdOKztiE7HpTFpM6DmZ3fv1xgaYHLI702K
         YckKnaZzANVKLF6+HC5JXzXE6yOyI5AnHau7BALoYgbcRWUfzloj0VMBZ71+Bh+YJ1NN
         O6s/8tsI5JT+hWThE08gnttj93mrPI3pc/0yevqI8OHf+ABXDqUDDd8MOEXZZZ18ZMnq
         kTP/Ns1/J4nthReGagPzqtb2KAxRW8ApZaWwPZKKc7Xs7ZGdpKk2AZ7yFGyZrrVQHYPt
         9+QBb8TI8x9bq+mWQ7/+eruA8PpiwizNRGpMzVKDP9fvAKoIZJADF+/FyCuKeUNV395g
         atdg==
X-Forwarded-Encrypted: i=1; AJvYcCWRN/eyfZN0Ki8htdXOQZlsVPN/ZbsoJfiDzRhtx1/4a6AdRga2iIKU9KYbhIo1TjgshDtb53zuYqSAqWAssqot@lists.infradead.org
X-Gm-Message-State: AOJu0YwpZAqdludWMF/WY3ASbgO3dMqUJG6HswPwR5enseAVkatjSq25
	JU+txry4H+NZlsa6fBBaDcRsuKZM42nZJpNswlBRwkhJTIJRn9eAwnYKCffn3+I2GQs=
X-Gm-Gg: ATEYQzxJrQMC0zJK3x3l/Q/Ur/KlU4AE2brPqj18jdwRRMLB7hCmeXSRyQVrBv/A4vq
	jr4g4qPDo96Oj/jJ715q1H0oYidBOgkFHtrv+gSrX7GM2Kfzy4c1wFiUNQPpz6EXtRgpvk7/a7h
	bQD1CURgwm3l0eh4/TFDiKGw5KdlbyH3iFz7vq2DyYULNsO4Sj+ZzcZry8t9aHwJ8XnOVxQqiWc
	x9+B0YF/F8EZ9qgoxZ/nUBxqHH8f/nAxkYq6P2g7AC81Jv7ugC+bH6CZSztcngn1bHfF2QdfMDc
	vO7WFciqh5xefwRE5M7dMseP9JlHsOnSpkQ0jBbgPN4klrXIkqnWRYrm2rE5IXUzluYU7pOrv++
	eIiqPvOkmTEMezoHP0jBYI5EKFvBy0QWc8HyZveyNOm/kSupDh3BN46UXSuvgHqlD8bVd/d0z8E
	xZIEjqvm2V8kiz5jjKhwEvnvAOh3RmEU6KTewNB1UMqe1o8C8BnsjFsaT5PGQhm2cMVkpC1K2gy
	drpCg==
X-Received: by 2002:a17:903:a86:b0:2b0:571f:6f07 with SMTP id d9443c01a7336-2b269d05c7bmr1235555ad.39.1774980163386;
        Tue, 31 Mar 2026 11:02:43 -0700 (PDT)
Received: from claude-dev.lan ([50.125.94.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242680132sm125240315ad.32.2026.03.31.11.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:02:43 -0700 (PDT)
From: Daniel Bozeman <daniel@orb.net>
To: ulf.hansson@linaro.org,
	heiko@sntech.de
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Bozeman <daniel@orb.net>
Subject: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only domains
Date: Tue, 31 Mar 2026 18:02:22 +0000
Message-ID: <20260331180223.1682283-1-daniel@orb.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_110245_107894_EEA71AC7 
X-CRM114-Status: GOOD (  12.08  )
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

Idle-only power domains (pwr_mask == 0) cannot actually be powered
on or off. rockchip_do_pmu_set_power_domain() already returns early
for these domains, but rockchip_pd_power() still attempts QoS save
and idle requests before reaching that check.

On RK3528, the idle-only domains (PD_RKVENC, PD_VO, PD_VPU) have
QoS registers that may be inaccessible when the generic power domain
framework attempts to power them off, leading to synchronous external
aborts.

Return early from rockchip_pd_power() when pwr_mask is zero, matching
the existing guard in rockchip_do_pmu_set_power_domain().

Fixes: 1fe767a56c32 ("soc: rockchip: power-domain: allow domains only handling idle requests")
Signed-off-by: Daniel Bozeman <daniel@orb.net>
---
 drivers/pmdomain/rockchip/pm-domains.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index 490bbb1d1d..2eecae092a 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -640,6 +640,9 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 	if (rockchip_pmu_domain_is_on(pd) == power_on)
 		return 0;
 
+	if (pd->info->pwr_mask == 0)
+		return 0;
+
 	ret = clk_bulk_enable(pd->num_clks, pd->clks);
 	if (ret < 0) {
 		dev_err(pmu->dev, "failed to enable clocks\n");

base-commit: bc330699801d3b4f99110365512caed5adcfaca3
-- 
2.43.0


