Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63BBCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0ZdGtbeD0twmfxFXcR2wb4AL4tjk6OMYa00kx/YCo4=; b=4TARJzyqTHXu/5FSw32UWt2hNb
	nDv9LIq9iVKgPpMcsuiNvu4ywilS/GEMSD1ga6MrPJgaJR45VWHAzHqQnve7ULg3xnwOXYepFNv3B
	NSQJSUztM8LxDWCdOdczsMqKJsL+5f+wLRyrpiMgu1bU2G5Y0sLOHBLaMCoX3EfX1rooYRfcpcaAB
	APJF8BxIiojOBgJJGIjEijLaYvthNefJf66ez8ZhIPVn/FXhwybBP5mUef1F+JTWIlKsiC2T9OW2p
	4WR1m8vl71TKhT8Q2fdW23T7PxHcD7k0n+HOmHfDr/i7UI0UuUfWkVQnzmA0ee8dcFdHz4R3nS3Xw
	bLcBeWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJI-00000000QaJ-34l0;
	Mon, 06 Oct 2025 16:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJE-00000000QVD-3UPn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Oct 2025 16:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=I0ZdGtbeD0twmfxFXcR2wb4AL4tjk6OMYa00kx/YCo4=; b=fHYtL/UhLjVlliI9HWG1f0qnfe
	ZgDowSI+4q8OTZ5ZQNhBr6BSuI30N1kzLBtGo/Su2yTLmD4ES6bUkUdvlUOhIfFGOlXMYXRsHHGn0
	6ZOcl4JMMrTaQRLsV2eKdG29gi3STr/mZ0el5kEYgv75QrTNrPBBPBwaN6Af66VHCKbiuY1Tajgdy
	gVvXFaco0OwW8Yc74djB1pt0he1DySI3Qwka+lwz8BAbwLEgcyxXQn3iNALILk0eJWlCER0+mFtvx
	MVYK7YX7i/w41CfNoGDWwnjsjriJHhgpXB3qdQQvs9quY4XPQTvNDmKxRhYijb9sHBYKprCm2tG6f
	BZjY/rcA==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJB-0000000H3BW-1V1L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b00a9989633so671101166b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769012; x=1760373812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I0ZdGtbeD0twmfxFXcR2wb4AL4tjk6OMYa00kx/YCo4=;
        b=W/sr5wqHssZOGGk6sk5rbA6lHHTXW5NENAW2c0Y1I8bQWcyk+rX+e8Ocn+BS4Per9x
         QP9zXN7wBBZUYOJfODpFNael3ebWz4H/mQqhL1InJ6gYgSYMiSQ0cY5WRR8AOC+15a03
         KhWZTSB/7KV7hQ50YBLwefIY+v6SbepDfxdN/UOMGUPYn69EEo2Savc4U7amMSt4x/hK
         2hJZ9oLOH9Qz1fSBO7lPJAxocjlMtPzLQprpGMnvEa0HsAs2eck4vpE8p7VGk6EhZi0x
         gHg9F41iHn/dpkAMMVDPtwts0cToKKbYrn3MQtsAMv4nvGd+1G4joSoh3fViWQBvjJ15
         BaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769012; x=1760373812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0ZdGtbeD0twmfxFXcR2wb4AL4tjk6OMYa00kx/YCo4=;
        b=PFK+tqh3HnS/S7J9EtwihJZ5PUDBtFQCioCr4OJHmirAe4ZSy7cWoYJsiBO0IUSzLt
         mbZ3E6wAzegOfjWicGU/1eBHr01QPJwsn+Pk/rkzDhGJ7xqEGdLhFhIUHOmUddj6Zfh7
         NDd6xiGNCrwy8fTTHSX5aKcA+0om9VVIXBiArwBJwIKID8yZFMeBtl6VXjTbiEw12Kr/
         4gbcVA9WvxzpzqYlub2fHVitXsQXG4JOt0GddiHXUTUB1drVz8zjaXLlxlPUkAKOiQe7
         iR26+UtAhsUMwJ/1jSepHoublhRCo3aUGWri9/F76SM+i3TZUomGs3t+kwiegAi705Gp
         3BRg==
X-Forwarded-Encrypted: i=1; AJvYcCV3TQ2x5VoQ2R506tN+QWFseeIOVYayFUOgEROwOQCgc9vynQDgb2aXYxlXUIci8zvaJQ7dHkQWMkHJmT5YOEfX@lists.infradead.org
X-Gm-Message-State: AOJu0YxBSG/aCZPRGCTgEEKOv+27zkfqudJ3ie2FbKdIERB0PcsonKL7
	Uwvyc1wyVCQKeTnZP+dL25k8NZeWpdOvN55OyQXVGchvR84W9sHOEJMNfK9fbu4oYgg=
X-Gm-Gg: ASbGnctJaiZxJbghNyV9i8zFR7DbOndA/gduY+eIz3sdhRaRNnNmrY6KQSDfSCxbvYo
	ods5/h4M9LTfAf4vAEfQhVU7Iv/NgN1y/PkZw0pUg48lbKDeIJ7IjMulatzN9mvQh5AlSpfiNDU
	frodgKueccT3ZGIBKbwjJhd6xWlUlloF7S2JWOK8STvTKYPX5GdjACSn3czTsNaDg2h8425oP/j
	CGwJ+vI1HBNY9r1f787ZlyG7PIOh/PrT5rdpN15C0yQ6ztippJGw9cU6Kqb4tJnWk0wUUXGfeiG
	BjBmHWeGNXxb3YpKqcmmtDtnqByAzoOyxAX2Wvq3Y5mgfbUbb/36NOllHttybQEKQNyEKh3Cr1p
	EsjRmzWQ0i36h1QWm2aZ4ydN3nZMFRKdA5gFLu0y5IuUP9495OgmbVNWhhbgOd0isWl1dMoeqNK
	UAjz2KtEyWnIeyOL4wgxQe23xnCizeZRaX4EGpGk4xNvw8V1pEITA=
X-Google-Smtp-Source: AGHT+IEYfOZF1TQm9DGlW5kpM0S9/tKDSRvPCFa/7dsa/gaWYvJTuZDOfU68MoruhNwe6zCqc77lsg==
X-Received: by 2002:a17:907:a710:b0:b27:edf1:f638 with SMTP id a640c23a62f3a-b4f43106a07mr28397966b.23.1759769011758;
        Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:33 +0100
Subject: [PATCH 07/10] pmdomain: samsung: selectively handle enforced
 sync_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-7-f0cb0c01ea7b@linaro.org>
References: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
In-Reply-To: <20251006-gs101-pd-v1-0-f0cb0c01ea7b@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_174333_718930_C6B8043A 
X-CRM114-Status: GOOD (  16.11  )
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
 drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 638d286b57f716140b2401092415644a6805870e..5a87802cff394945cb0202d08f2cf6bcbbcc774d 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -20,6 +20,7 @@
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
+	unsigned int need_early_sync_state:1;
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
2.51.0.618.g983fd99d29-goog


