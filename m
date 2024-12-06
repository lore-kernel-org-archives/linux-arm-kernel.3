Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4575EE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=; b=fFO5IbuXIJD7FYwdgmV/WX8Fgx
	wsFb/AWij0+0WZLeNbeLALD12n+J7RYSqeq3vZCWZNHAXp7El1xw7GENGEJuqbNQXNeKFXKPuSl/i
	ryuPYc+QzFVx8NVlFZzAlWVqpFbtRZIfDVNUez5XrB1q9Vus9jQiQ5tDqKR02SbLEMd2gAinZ/LOM
	KHA2AVUHyoCQQjhdQPLLObi9ZsPI8Y5oLp9P0vLKAfaZcIStL8bR5Sims/romCuyDv5IlrfeNrMCm
	n0Fm9DAVs3gtw4tdDKm6dkqdVs3HH2sHiey7/CH+jEw5m8yPtubGgb9aGTWqC0E6M7eXyRiGAGfZc
	V9nHfzHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbJR-00000002BnP-1gbC;
	Fri, 06 Dec 2024 16:36:17 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbEP-00000002AEI-3Wb2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:31:08 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-434a736518eso25985435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 08:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733502664; x=1734107464; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=KhcHPotYrU6XRRnuI3kkqTobLkcadO8v33TKusIJzxpX3G9ULAwUb898dRxx3R+4ta
         cJuuFmDalBnG+PLkyCU5WZQID01YyWKLM9IfPAPjVGxy/JU0akiPeP8/ZCE4byiPZ/J3
         9tpD0S6WIqSkwHy6TEtEEVh+2LYgz+rE3lKg+0nta96pcQ8CmIKKRGRthsqA8weDec5V
         qM6/hmhk5Z8lo663a/GWLXEN2zoBs8Km3uRucH1Vq2b/m/OHDGuTLUk1tKYJkKneECtt
         AwUcxgl8Ujv9JdlTBxrNFcwV4hIRuNITyjLt/6vXoUQnEdgUIM+IVO5pA6NQReEjgq2f
         v6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733502664; x=1734107464;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XyAJZWh204Jg961AaAOy2+aPUgd1uUQOUoQ33ic9q34=;
        b=X6sCGm4/mwJkpyqEvjSzpCwerQCFnpF5hCpsXmQebPhbtPv54Cy9WRYBtgv18zh/jG
         dk78n4ZchfZjMI4yIeHXdPNutPVC2TPm7SuqQiG0NHG84U6+blC3LX+HAZ0GR1tel2s4
         K50idztkld/3Ep1B7kHW5LB7/3Qwe2O7zcrPXxW80F9UX3RYfNNJgEbjQTU/lnjvXYHE
         tYx077Y+aFXBtjms1xJOeBY/B1+8QS9aubBGWOeaB0X+i/hxwb38e91zOm1Tmp5m9lZl
         aLATvniApxcqd21XMX+fGgN6zG09cnrvIpRsGBChjERSExZmAit3l4vZs0gErpI3apmt
         FjhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOOJ4fv/kX1WC8YJ71M2cfpWX80w9O2SmTnR69YnLLrxCRvYQdSCzn5WoiM7onQIWNuDPMv+vvsAMkjoORG0ax@lists.infradead.org
X-Gm-Message-State: AOJu0YzvUXk2+OIGD4tuPOjl7E9G0d0KnMxwqilADRlNzCjqG6IzXZFB
	BJH2lbDu7NT0AU3kutdZ7zZEZhTkwaLF4P6WjMGnbzi0moMS+ECv0qOWnHnZJ90=
X-Gm-Gg: ASbGncskpvX8cAjX+10/4pB6Xvsf+wwOky9dyDXUomzDET5ZOivSVO9AzlYwxCj4Iot
	XOz5CyDw+PgPrWMnvuuRGDhuz/rH7utcMYr9xijL/849Rfk61VgUYmlvj4c9/axpBCqkPGTKpkP
	UUn3E+aVRcjLVGof9ghRT3CGpiQF33tbbttSOrdcbMgJ9y/h+b+4nGAqJRcHoV3PLmWJEfYjmNa
	0SCAWYAQ8h/MGZYpPUDFu8IWfEsgeq5Wd1oifA/nJ0SciXgfvEtnAuVIwzURlkFOI4iwoBjtmvj
	Xv9i4SvuFqofzru5YRYR7tU+Z20gsuvofA==
X-Google-Smtp-Source: AGHT+IG1rlIGyO/nnPLuP1Na7RwgQmQmvS86new+NKYuNxLnewiatbb2kxtQ1hikVy0uIxEBRnzdMw==
X-Received: by 2002:a05:6000:1865:b0:385:ed1e:20fe with SMTP id ffacd0b85a97d-3862b3e649amr3139459f8f.59.1733502663773;
        Fri, 06 Dec 2024 08:31:03 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e8af8sm257710266b.191.2024.12.06.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 08:31:03 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Dec 2024 16:31:04 +0000
Subject: [PATCH v4 4/7] phy: exynos5-usbdrd: fix EDS distribution tuning
 (gs101)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241206-gs101-phy-lanes-orientation-phy-v4-4-f5961268b149@linaro.org>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_083105_886841_D3A778B6 
X-CRM114-Status: GOOD (  13.83  )
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

This code's intention is to configure lane0 and lane2 tunings, but for
lane2 there is a typo and it ends up tuning something else.

Fix the typo, as it doesn't appear to make sense to apply different
tunings for lane0 vs lane2.

The same typo appears to exist in the bootloader, hence we restore the
original value in the typo'd registers as well. This can be removed
once / if the bootloader is updated.

Note that this is incorrect in the downstream driver as well - the
values had been copied from there.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Tested-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
* collect tags
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index ceae4b47cece..2a724d362c2d 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -1510,8 +1510,11 @@ static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_preinit[] = {
 	PHY_TUNING_ENTRY_PMA(0x09e0, -1, 0x00),
 	PHY_TUNING_ENTRY_PMA(0x09e4, -1, 0x36),
 	PHY_TUNING_ENTRY_PMA(0x1e7c, -1, 0x06),
-	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x00),
-	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x36),
+	PHY_TUNING_ENTRY_PMA(0x19e0, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x19e4, -1, 0x36),
+	/* fix bootloader bug */
+	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x02),
+	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x0b),
 	/* improve LVCC */
 	PHY_TUNING_ENTRY_PMA(0x08f0, -1, 0x30),
 	PHY_TUNING_ENTRY_PMA(0x18f0, -1, 0x30),

-- 
2.47.0.338.g60cca15819-goog


