Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59000CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/1/8oovwXsAv5LJCHXYAg1gF9tOSXyOhotyAm6lDms=; b=VyvrS3fhdGoQYXsEg9oGoJUjbg
	HpZoQmlcicew3Q44zd/gy1t/NiuslKkp51+aPgNfQlOa1H4EIHLfXs8C0Wt09aIijY87yxH4B+3Xt
	9cZHvXG5pYA/AsTfw6GI7+6v0ZtFHd327Rl/hCa5mDzzZUKOKnCXHaNIH1BC6gL57Jj3+sO6IEtOL
	jZocs/1u3H0FOMkYBJbBYa20X1D/EVUGJ90razqN/ggQEpDSFvX3lZbqS4rOwyST1cm16NRdfjRw6
	TFjNnlBGa91jvEBYq3Vjk8WkfhZ7iDiKlhsh2x+LghHElAK0eVXxWvliNRm+xweamvu3/GEl3iw/D
	fFghA/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sW8-00000006U5G-0oBv;
	Thu, 09 Oct 2025 15:25:20 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVz-00000006Tud-2lRu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:12 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-63a0375d7b6so1258589a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023510; x=1760628310; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/1/8oovwXsAv5LJCHXYAg1gF9tOSXyOhotyAm6lDms=;
        b=l5/A+sezmlY604VfHFNnYXyPn3COsPvA4jEG+GYq9vECOapWeVUqweJw4txIsXzWIu
         iVM//jvnYB+HPJTfJCt57yVviKk0Fw2IbyE+bR9e2ErZQ5OEFgcrkmmjLetKh7diWFOk
         yojoIRPxtb8zexosUwWd9h4HrjOHpXMg98es3i2AeJVP7EAuF1u1UGmmszc0oRcGNjRP
         hRCjsjb7Sd0DbkgqTRSbdeXN1UJorQfdmIQ3Or1WFaYaLK9SfIco5YzucbtmI8yq2t6/
         SlJU1nHFPWhCtOe8T4NW8dmwjHBr0sEwyohWdVE5UNqxKcXyn85b7kZ8MW12jg9t9mIc
         dORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023510; x=1760628310;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/1/8oovwXsAv5LJCHXYAg1gF9tOSXyOhotyAm6lDms=;
        b=jblvYxciR96JiyTYxAkonMiu59uRgPB8kDeLjn5etubR1EX3f/uPTaT1mIzRWpF6vi
         chmuW62fETm8aOYksmf0P4f7u6elFju7Ui8+NzB5Phb3DCx4KDJyZd3mO5c6YdlpdK1L
         G0TIke3WIwYdo11FMjsH88/DMu1x0TXlEe7Nxf6sG8Ay6Omh68dd6v67/WYYjHabKZYp
         0U1eLRvEaa0Ph8wgpXVfV09q1k1f/H0Gc382q+m9Q6Mx+RNSvf8WAeJU4RylzUcggt33
         oJsQshVgyN88sdLnNo5sqgdNMNqf9BO38tST/oxdIFG2uhhDLeLPC+T9P1/Yvu1s3PBk
         rGSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIFrsoYGwWc09ozxD2dgY8gRNxN2d06d+WEmaRjbsw4PGW7d1SUjix1AfN6q2iHcmeIurSFcu+wYn8NKRDB6xQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7tMeNTnXx4pMGApoTW7aQ42fh7jD642ErRa0rX5T15JUWCOV+
	5N/LQcZ1GfUD9N+97quBh8iY686VMQ2ToCS2qqTZYR11/OhJq8jWjOtxElZ4Gpy34xs=
X-Gm-Gg: ASbGnctsA90QkbSH1jp/gvG5L4jX/Nnnl/LOV4TqPNXRSeRWHBZMY4EkyaRxMPgpD4u
	02inuQfnbvcoGiIG0q6jj4OxQ8iCo6wStoaxN6DfUrsK1Ety+wn6grAiDACx4F7cp4oI4RfH1E3
	lyklZXKbkMd7jYTd5SVdOPXLq8NwXLui6oOBhp81hAJOzP75F9MmA5p0xr+SsOWA4mRuX/QOwMz
	FaXlXER7MO4vGxso0fWniy8cNRSxSde4LuGg2msMNPo/h71nr+CiDYsNgZiQbRmzpf9DJRaSycd
	GQ4rMtNLBcpcKgqJll0YjQx6iGy44vHyrtirI4kTelqaiDXIGngY6GnpEO56TkohW3g4OIuN5+b
	fo4yOAD0IqGxWIB0sS5SLjXAHcScSZaCaf4ubREi1XyOZYGhHvBgp+juM6Wf2nepGoKCpaLDoTK
	Uf81wu3Z2P6ljQO6JvUJ3h9dravNWdRY1Y2NSy/LDx
X-Google-Smtp-Source: AGHT+IGaGkcuokARZTfmmbCwfalPWL2pX6NDBn0pheQXnCrw092W78kTYfWHrm/WqInuH6GM9reI/w==
X-Received: by 2002:a17:906:c149:b0:b41:2209:d35d with SMTP id a640c23a62f3a-b50a9d701b3mr803859766b.1.1760023509699;
        Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:10 +0100
Subject: [PATCH v2 08/10] pmdomain: samsung: selectively handle enforced
 sync_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-8-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
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
X-CRM114-CacheID: sfid-20251009_082511_715993_225152B8 
X-CRM114-Status: GOOD (  16.62  )
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
2.51.0.710.ga91ca5db03-goog


