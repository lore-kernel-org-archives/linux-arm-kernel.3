Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25997CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SO9hd5b+FbsgvfRJA9bEqFwoXMIxby3A9uFM+TJl7N8=; b=zXzc7xuWqU0cEDn32f0GwJhVU+
	C6lU3irIzwIby16UsOtK0lehwC1Z3fIk3F1mjIJVWGrwUsvXJpc2IhgEhADIjTYf6q7QWXYqgolue
	sz/R9/0GLhlPJqUmZRR9gREcWiG/WTz244gInkSSzKEIHm/TpGFplBrBn/3lH62iVWd33K6BvLePi
	OfL9/griu+kbfnRr2hhdehqC+2C4jnJI4XsFE0vdcPjhYA0MusYxv6bxAv4ktL0ck00yOIf+z+gmC
	BRL8Oyd96WcPUXeuGcZ8ZFgAft9ASqW56UnJXYkTqjsw7wW8TepUFtiFOTMOkS4w0hFKLwNcik198
	fZFQm9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNZ-00000005Iid-3d3q;
	Thu, 16 Oct 2025 15:59:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNQ-00000005IY5-3B5X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:54 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so169767566b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630331; x=1761235131; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SO9hd5b+FbsgvfRJA9bEqFwoXMIxby3A9uFM+TJl7N8=;
        b=KnURh2rxsoWDfL7ucAnRxo3pYSb7UDXbwNjolFommgcF5dZmgkM60YavRrTcaqeRDA
         2Tp2uZw1SO2GFa/hRHH1bUDBf4Hh5dP9oHmHwXvt6Qq2xxfaT/ksHCBbV1yWJBdHHoc/
         Hb7nZrXgDxNnIRd/Nk+FoGM3vLgl3b/N+piBks6dtr3WrdnelrEeePBqzAi6xVBtnwnz
         PnYRanO1II4wNlqmz5bqMJA02pmj9QJU2J/ORALWgarnpemE9PDryzP2hMJVvarql0xe
         m8gGySO1349uidqNebJduvGtzNpgb5GrPYlTVfwuW1nwIv2jzZ7dlhovQ8i2I+tn7skf
         ubHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630331; x=1761235131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SO9hd5b+FbsgvfRJA9bEqFwoXMIxby3A9uFM+TJl7N8=;
        b=rXvbqA18NnFjh20y0wedd1MAG9m/otjiCrLInmMIAZ28KRCZMw+D4zg0OylzDAnrUW
         lDP4F5B3EkAkfCXReRQ6ClPhtKBrcpaQT9G4UPPUK8znc+hCVaXal89tjXyQQGvsFBnU
         Ms9ZN9yQsHZc3OLgFLHKzPk+qaXYdt+WmvCTS+guPRVjZOh+La+w/l1LdbLRj84NPfqF
         gsfzzXtQvkX3AfSvnY1pn9T7Ow2uE5IS0vz41XkG6B+CRn0XR2r8Bu++aidpkH2GSOTh
         9TMAzapYlRSC+vrwHWIepFF166FlYZVwF0BUxWbkS4hCB7alvEN2b4cKJ+RqTRnlkgRl
         KlOA==
X-Forwarded-Encrypted: i=1; AJvYcCU7JDdNvrXJqtJNVy5VQjvwXMdafuGXInGISUmIPcxjeuCthHGu7pPZtQg6DFQ5hq4R6HHH/9JFFdqyQx+ja9ug@lists.infradead.org
X-Gm-Message-State: AOJu0YzrjYs85ArBBkpUEWcv+sPfEOEP1X6Kw7CQUAJxcOxumbvy+p0H
	vjlJhr8eHYXixP2P/OQKSQ6yEgSVqLqxcWPv8RM+41Sr9QE8BDthd1SudX5BjkQ1Nvo=
X-Gm-Gg: ASbGncvCDUaH49nPRTwwhIHOc1K4Y7yyY9mU4I3XAz9D+jB3nWRORp8ufTKUtu0IBgv
	KUOBhRNCQVoboVDZQ7cBhbUSMzhrRub4sq8omLZ/jwldmUiDH6z/pUeBNQq/hDFXmFvGpWw/S6Z
	IRPNWqqu/lU6B1D5sJWglkE+6tjFT0Rkafeee8oNbH9ijGvKLsCXeUhFs7WZHr/gsi5Hyu6ljgc
	wXJc7cirOEsikHwYWJgptqy2kXKGUDvFGSPs8X8HZCELpeQzt8LyUfuFAgSsYdJWvS2DSZpyWI9
	58k9A4TnLIOj5T2e7Ym+v4tWq8XucXpuNBWXr5MBcamoXwCOK67ozqAoAqL0Ds6o6o7FCuT0Tv3
	BYanzTPyqR717PmdWm3xE74zO7DnPE0L2dP8PmOL22q938VWW6JDE+2NxsXrVl4s94UAnpQw+Xa
	34DW/YnlMZFBKmmJO+h1rguF1++YVtU2vbTguvt2gxYgWyebpcaEz2mzGLUKLue47JyQ/qPJA=
X-Google-Smtp-Source: AGHT+IGGU0OBvZX4eAhyBVw2Khouiv3ywhe0gW6+PNakLUoYmT3fXoe3XDWiMcszKrB34lkr9GEbsA==
X-Received: by 2002:a17:907:971e:b0:b3f:e1e9:22c7 with SMTP id a640c23a62f3a-b64769cd22fmr44681066b.65.1760630330714;
        Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:41 +0100
Subject: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced
 sync_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
In-Reply-To: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085852_826209_7C5CAF37 
X-CRM114-Status: GOOD (  16.30  )
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

Unconditionally calling of_genpd_sync_state() causes issues on
platforms with child domains as the parent domain will be turned off
before the child domain was even registered during boot.

This in particular is an issue for the upcoming Google gs101 support -
all operations on child domains registered after the parent domain
misbehave.

Add a flag to the probe data to be able to sync_state conditionally
only, and enable that flag on the two platforms currently supported by
this driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* use bool for need_early_sync_state (Krzysztof)
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335eb681600d9415369fefd 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -20,6 +20,7 @@
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
+	bool need_early_sync_state;
 };
 
 /*
@@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
 
 static const struct exynos_pm_domain_config exynos4210_cfg = {
 	.local_pwr_cfg		= 0x7,
+	.need_early_sync_state	= true,
 };
 
 static const struct exynos_pm_domain_config exynos5433_cfg = {
 	.local_pwr_cfg		= 0xf,
+	.need_early_sync_state	= true,
 };
 
 static const struct of_device_id exynos_pm_domain_of_match[] = {
@@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	 * reset during boot. As a temporary hack to manage this, let's enforce
 	 * a sync_state.
 	 */
-	if (!ret)
+	if (pm_domain_cfg->need_early_sync_state && !ret)
 		of_genpd_sync_state(np);
 
 	pm_runtime_enable(dev);

-- 
2.51.0.788.g6d19910ace-goog


