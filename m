Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D00CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 16:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TxwnlAP3n5M7cyJiouK6nx2qCN8Hw+Sbnl76f2YXigk=; b=Je5aqFk4hiHiIgbVXP5LkZDPmU
	nKfF4aUkyC3g5aMIYoCs/4BzJ6crYNVqBLjQctn6I+jPae5XRMEVTrOSRzOdq+x7OMIbaYuqzW54p
	XGddJgtpcDaG6y/AxLaPI08WcOjRRwWMUzFz7lpYG4xOwt2Y4T/sxY9KN2Wkv9tmMbpHNmX/Ah4WF
	LkXLbKagN4u9RaYcehFeE4SYKusOujOIbRjNZkDbVf03zz9fZjdfiKRdIC1tTwVqMze5HUpUJp7X4
	0bjqvTz7zTeEMCbRoC0DuclbjdzcqkVYpp6S/Fcc9OH63Zs3hNJhCyEkjX9RGt2n3uCKGcwTSx8xL
	B1F8oYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJF-00000000QWq-385F;
	Mon, 06 Oct 2025 16:43:37 +0000
Received: from mail-ej1-f42.google.com ([209.85.218.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oJB-00000000QSb-2DAY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 16:43:34 +0000
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so755330566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759769011; x=1760373811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxwnlAP3n5M7cyJiouK6nx2qCN8Hw+Sbnl76f2YXigk=;
        b=k0idbThpqQE44GCsF8R3p8IO0IOety33TZEa0alWKcHdLTf++o0V9SJwlL/lspWPAr
         IiKMhWGKWQ4rU7kfRoqvZs2F23aJmWRjVWWrndg9zF53yJEzxDgC2UgbQH0/CTTvNACV
         ssIeGRsOBJ35bsqHTtb3CIfHcyGCgCwPYryk5jMqkJfrlJfpuF/Zd2to1H+cdI2FxrUZ
         OQuMIoO000rr9NcHvfILIRIfi1UwUShgTmY5sRUiVbMdkWRngMNjoguTF6Gki5UUkmXL
         9AwUP8YK4aUFWD0jpzScs/bQxQcPNIGUjDu23STzwEld+y5h92BR0wPaGcUn4L/CtTcY
         3BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769011; x=1760373811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxwnlAP3n5M7cyJiouK6nx2qCN8Hw+Sbnl76f2YXigk=;
        b=gIvi9YA+swp/hfNntWAgcgbu2VJJhzT3Nk9ZpFrMkgxugwgrT7yIdMLRCIDMRKLNsC
         YIzZSnWZ46iAA4GHIAZdeGOObW+Wki8+4/Djlo0aEFnPy07VAboR2XbjNCPoNQ1TFA3b
         vERoRvHn/lOOQ8SwRh0CRLY4uShDjOPebHkdlJZ2ZiCdZYQwVWzO95QVR3RWaM9cJrYC
         ttlcE6Y66UWXGqgH/yWxfdQCmWHGDJK47MpcQGdG1VHKoHCMhu3Son2SSztgsxaVebVu
         z2YXR12NV0o+HJMdMdBmzNQtKbLqzj0JvmVxVjOqUCOdMT+wSaFz+Bznnldzm01JKDom
         nlgA==
X-Forwarded-Encrypted: i=1; AJvYcCWcfqpsOgrmWuglAP4CMHOV1f+OKDxfkB6Juhu0W7Nbz3Ry8RTc5PZMEb3PeMEkckm9diwgJckW260JTXp6e48Q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkyl0fpnSnAoVl2X3qrz+Fell65oROqVpHKtCooqhqYHdqiFIF
	cnfyUZ3KIVXJMHrh3VRelw2AL5I44bt8nGSDbg3cjijWx839n/gCFcRh3+3RMGTaLFo=
X-Gm-Gg: ASbGncsfRdBMSaNMG4H4x3ILd2KllTvNEMyy7NrSXcxgtA9RdcZv6RHE0hB3C0mYx/E
	wH0RhWefUI3uwi1E0QpRpG52mXlfNyceJZ0NsEhP4XDAgekrEqaCMWeoSDQbZOYGCIKTBULvsCM
	hCv9odkzLYDU4T/IXhT9cLDFX75rB0ZZUE/HowEJIwoTse895/LW2c5SjTeiHIQ6uK8rzsFi7tU
	2X03uCmqEFHWMOORBbT037sQ4DZoBfP8JihJM7ZKnNuitZIKoTDZlF8n9VP8KilU15b6Es+uus1
	d7Gd6B8GV59VUzpBS8JGT/zGl5oKL7E/NkHz93QccD7TmbXAQ7bJpCzqcg5USzEmIj3n2BY0ifL
	UBe43OHK2ZBqNg4rObqTPBEN44WcjmLBIdqeHMF4w4EflE2UI7QuRn6FSfn8CypYItg1eBpNl2I
	uCXKziFH5AuQEaO3TKwMDFEJ7wXaMUka+4T6hgg8Nb
X-Google-Smtp-Source: AGHT+IE6Qi3Ngqwo98RrZzSI9Sk/ybN3uGg/1PQQF+EI33WkQU1ToLbh1rIvJ4g1vAv9PRSJV5XHUQ==
X-Received: by 2002:a17:906:c108:b0:b45:66f6:6a17 with SMTP id a640c23a62f3a-b49c429cf5emr1502411466b.45.1759769011299;
        Mon, 06 Oct 2025 09:43:31 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa01esm1193841866b.2.2025.10.06.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:43:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 06 Oct 2025 17:43:32 +0100
Subject: [PATCH 06/10] pmdomain: samsung: don't hardcode offset for
 registers to 0 and 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251006-gs101-pd-v1-6-f0cb0c01ea7b@linaro.org>
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
X-CRM114-CacheID: sfid-20251006_094333_576473_93644075 
X-CRM114-Status: GOOD (  14.81  )
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

On platforms such as Google gs101, direct mmio register access to the
PMU registers doesn't necessarily work and access must happen via a
(syscon) regmap created by the PMU driver instead.

When such a regmap is used it will cover the complete PMU memory region
rather than individual power domains. This means the register offsets
for the configuration and status registers will have to take the power
domain offsets into account, rather than unconditionally hardcoding 0
and 4 respectively.

Update the code to allow that.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 431548ad9a7e40c0a77ac6672081b600c90ddd4e..638d286b57f716140b2401092415644a6805870e 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -29,6 +29,8 @@ struct exynos_pm_domain {
 	struct regmap *regmap;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
+	u32 configuration_reg;
+	u32 status_reg;
 };
 
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
@@ -41,11 +43,11 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	pd = container_of(domain, struct exynos_pm_domain, pd);
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	err = regmap_write(pd->regmap, 0, pwr);
+	err = regmap_write(pd->regmap, pd->configuration_reg, pwr);
 	if (err)
 		return err;
 
-	err = regmap_read_poll_timeout(pd->regmap, 0x4, val,
+	err = regmap_read_poll_timeout(pd->regmap, pd->status_reg, val,
 				       (val & pd->local_pwr_cfg) == pwr,
 				       100, 1 * USEC_PER_MSEC);
 	if (err)
@@ -146,8 +148,10 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
+	pd->configuration_reg += 0;
+	pd->status_reg += 4;
 
-	ret = regmap_read(pd->regmap, 0x4, &val);
+	ret = regmap_read(pd->regmap, pd->status_reg, &val);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to read status");
 

-- 
2.51.0.618.g983fd99d29-goog


