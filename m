Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25A3CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fsw3nGMrSykhH7OS6v0fNa6J+UTT3lDdTIT4s5cDl2M=; b=Sj36KAJBWqHzYJI2xbRrUXsogK
	hb0T0jRoJ5TxpdkuQwEGTchBv05/lf28U6aP8JoppVlcBxpoAOHtMw9miKoI51CdhxnfQFne5/U9Z
	NshL81rfVngoNoX1wtXidXfuQ5HCew75OyaqSCkSTWcRXFnDb/P3wRolRwP1GAL/Pjm6x1WpTKCHV
	8HXRpp9ALoEApMXJUEKObDmsxcNAThHpYsrgIYH8adqh3bBXELJ23Fe4PEuUuvYMnr/ZDcJlMdT/Q
	d5D+/YtZizZqwwsxxrNAY96/mMywChcmjhOKnDG3XheGQEx+YIwk5rI7bWmZUPYLfrUEN/rerU78M
	85AGYM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNR-00000005IZl-2AFx;
	Thu, 16 Oct 2025 15:58:53 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9QNL-00000005IU2-0ax9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:58:48 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b07d4d24d09so147496266b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760630325; x=1761235125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsw3nGMrSykhH7OS6v0fNa6J+UTT3lDdTIT4s5cDl2M=;
        b=jCgalA8Lin6T2/Rv74n7/5v/Yb9FpN6U/kBL71AvVHjZk3PZraL2CsUMeIE8+Pjiyo
         pFYw1rKPA8dVu/i4A7EOI41xtNcs18GqG9o8QKe6XJ4tVyo3fKbWu9phZnbls3eTOrOg
         VwhoSvDwWb65QaWBV9/1Z+74oA20vTxMeGiZJpTWLez6LfAJdOYcbEyXFIs9fPLYSp1s
         4zjlTmrQ/vzn4ZFeoPxBY3PRew1kgkBNK6G3N7jd6t/mrVxMeTYA9dUwktmypZQ8LmYb
         vXgkRBSkyGHyXB55xRDTFH7PlaIeV/tmkwFAeX17nQZ1Nq3VCK+hXFiK1iNqlpOG6p+a
         IHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760630325; x=1761235125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsw3nGMrSykhH7OS6v0fNa6J+UTT3lDdTIT4s5cDl2M=;
        b=QRpGt/5YH7loZdA7ObFiCH3yf8T+DJxZdK7Xys4DWzSb5kTp9/1F/cwlyIMe1ibmp4
         lUot2O8nowYR7Eq2SYi0oc5H4pIAyv59s3gXcWhviHFh9XHxeCs5t1BwRASzZiiTSSId
         mGZGtpeOz9wNnrh6BrPa4xVqQHOIsRejn0YLVXytFu2ghKBclQAR1klizLHsY69GAva/
         hysH/5H8JgAzfs2uM4anFw4LW10VM3IcupXMYjHz4B2QmG1q6kP+iapKXWmDXwb8BpO1
         wrHEfPVpKajHvBezP6IvoYdkrZ/+CkbZICGKMenLmT8wwVEwIDZggpD86m/TZiGV/zcd
         UFBg==
X-Forwarded-Encrypted: i=1; AJvYcCWQzDartqCrOuPI0GjjwNGjUUS9Qt+HCZQ0cEkfAdjEhNZ2kfm6vRy4H7Ldf1G7zCWOzZcDBcrpgtFYenPsjSrf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbzjfa089jJbZBZkWxo+/vRA6URCkO/BU2sL+/Vkt/uQsaiJrX
	50PHikpjviyueI9fbCG63DSd9bG+izVpHclYffrg/fsLH03CvnFZBp7vWXvAXg7Ry/2a6EVv14W
	1vGln07Q9i/it
X-Gm-Gg: ASbGncv0jZDC9ggk8wUtpExIYZ/AVbqN3S+EQ83A0AQwsIIuL+8T2skz/aapsR5IyzW
	Eryq03b88zJ/dY1kw1AFDTDRe2sJ+j9o0fX0TkAmTk0PAdKMSUjEPeEHV+qjQ/+Mq1Le1kDlsUq
	ZQJZWi+8GI5t8QUBGmDvHCfXXVb+AzK0BzXb75hRuKlWzF0wf+r8eR0EM/YUIdAwchD706nrZ5k
	6pWu41zhmFQ/XwSuG3c8gR7QpBao94Mx6T+cOmHzVKNoPBOWxhOo0ZXr9XAM1EkRzZiHZ81uueY
	UU4pA1G15NjRZjNtXEx0A5L8R9S4ve/TqnlKbtJxBiwMiF9uGHos9OdGbMP6/DYlssEvvWVlAT5
	y8h42FlNqCzU/xScPrQR4fJ3np0Ng9M21nD37iCZrXWJBP2A7NBlyLx9uqAJ4125y+mlCDPhLFL
	yjza+JEZt7otg0RXUaEPUcMrIRq24XExifrsQjazF4IAIYBBHrgbKm3P1GRsnXkjVHiCTMaNU=
X-Google-Smtp-Source: AGHT+IGMnDfjfOzAoSs5yqEhzRvyTEgvB4V8vlEt+WcTbrwh6jjeesT23Hol4E5oowOHUJe3KnWaFA==
X-Received: by 2002:a17:907:1b21:b0:b3f:c562:fae9 with SMTP id a640c23a62f3a-b6475703a96mr48316366b.53.1760630325277;
        Thu, 16 Oct 2025 08:58:45 -0700 (PDT)
Received: from puffmais2.c.googlers.com (254.48.34.34.bc.googleusercontent.com. [34.34.48.254])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb4811sm549021666b.56.2025.10.16.08.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:58:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 16 Oct 2025 16:58:37 +0100
Subject: [PATCH v3 04/10] pmdomain: samsung: plug potential memleak during
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-gs101-pd-v3-4-7b30797396e7@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_085847_222418_2633222B 
X-CRM114-Status: GOOD (  13.08  )
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

of_genpd_add_provider_simple() could fail, in which case this code
leaks the domain name, pd->pd.name.

Use devm_kstrdup_const() to plug this leak. As a side-effect, we can
simplify existing error handling.

Fixes: c09a3e6c97f0 ("soc: samsung: pm_domains: Convert to regular platform driver")
Cc: stable@vger.kernel.org
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
v2:
mark as fix, as this isn't a pure simplification
---
 drivers/pmdomain/samsung/exynos-pm-domains.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
index 5d478bb37ad68afc7aed7c6ae19b5fefc94a9035..f53e1bd2479807988f969774b4b7b4c5739c1aba 100644
--- a/drivers/pmdomain/samsung/exynos-pm-domains.c
+++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
@@ -92,13 +92,14 @@ static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{ },
 };
 
-static const char *exynos_get_domain_name(struct device_node *node)
+static const char *exynos_get_domain_name(struct device *dev,
+					  struct device_node *node)
 {
 	const char *name;
 
 	if (of_property_read_string(node, "label", &name) < 0)
 		name = kbasename(node->full_name);
-	return kstrdup_const(name, GFP_KERNEL);
+	return devm_kstrdup_const(dev, name, GFP_KERNEL);
 }
 
 static int exynos_pd_probe(struct platform_device *pdev)
@@ -115,15 +116,13 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	if (!pd)
 		return -ENOMEM;
 
-	pd->pd.name = exynos_get_domain_name(np);
+	pd->pd.name = exynos_get_domain_name(dev, np);
 	if (!pd->pd.name)
 		return -ENOMEM;
 
 	pd->base = of_iomap(np, 0);
-	if (!pd->base) {
-		kfree_const(pd->pd.name);
+	if (!pd->base)
 		return -ENODEV;
-	}
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;

-- 
2.51.0.788.g6d19910ace-goog


