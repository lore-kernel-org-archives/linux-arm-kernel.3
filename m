Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE17C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlgimeCT04wK/VVZmKrnlafua+eQjTo1OlyMX75Ktyg=; b=1+FNo2dR3SSVFewJ89mjClEA8I
	2bVYY3rXrF55lTqX63luI5TlG1/cvN2dInWejR9mctI1rIZMhE4drzb0cyv8H8R0+3Tir6EdfhFhQ
	igWbL/jt20ipNasTXTOAVrScq4OIZyrVaOaZQiAeD1ptDOT0Y/jFbUNMxlTCkskCaImYRhGJPTb+d
	vXKfc1uN6cGt8nJroH1sGkDRH+40gPmJCAbkLMY8rRx2C5ZDR6YQVNlxuEazd0hE1KKifcG7/1Khm
	oa65FSnPnfAEol1K/lf71MAIw6rgjYJdyb49lGr2NQJ0oyAdwRk/29U2FZkZGj8sKQxodPSoC4dHy
	b2wlnqyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lg5-00000001kOF-43Jx;
	Sun, 13 Sep 2026 14:59:33 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lg3-00000001kNG-18XQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:59:32 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso1156306a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311571; x=1789916371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlgimeCT04wK/VVZmKrnlafua+eQjTo1OlyMX75Ktyg=;
        b=oeY5TGa1wrtGgYpx0Gf92NTd2HXjOVFG2pWeMVcJkrCqcc0x+YNg/scM+yqIOip6wA
         TEvYbE2KBPKdfgMmN0qI6k0XgyQ0dCXeBBT8kY4w1FAIlDXCGHw3IdSnJqVyfXLa/144
         JbwQUZDu4MB67n2XGHuKag/fgCdwAw5v95rrVEOZoCvb1c5t8p5ZW9GA437sU+y9DbCs
         FHWeBuPKWIeQoiemvnyazdXhxlZrtAWcnhjRwmFwF/x0Kh163B8zEfaRsKWemi5ngQp0
         +Lrmw+dteZrrJYN9+pijNYE2Av1FmLOqbBkQGvdn8wL756/xIQcdo4wekgZYgA5n+b8t
         5Vog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311571; x=1789916371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlgimeCT04wK/VVZmKrnlafua+eQjTo1OlyMX75Ktyg=;
        b=Nffbdei+xQh5r/Jg2bN8NI/zT6cQQjRqSl60yuskwA4FVWMf1CvnHEib0JuOfkDLNE
         YKh/ee3c+UwXlbXaI/MM/UUCwVK/A3QezP8Y6UR2QAogooZXX0WJ3rGrtgS6xbmpUGZM
         WreFVw0JkRQRUZGlP9NxE83ivVPbSF3VOIXnsvhuIo+lL+48IwMBsAM5pMPGk4wI5eD8
         Fw8t+LBbsKBwfDz98GquKrX+rez6YNF6WCS+sfZn+/aHREb5rYbnQ6R9C0qS8kVsvY32
         BiahiEkd1d7sVMregMBq5HBHxO/BXOTdbZIymVTPIobWjj5nnv4QWmcCh41pDYkgTNzm
         Oa8g==
X-Forwarded-Encrypted: i=1; AKwUvBxo+GbTHogCWyyYKYaBoAUH2p89YSw+SIgDgaO50jon/ed80BTfU8/q/sXy6hbv1326Fk4hD80TTMyeRRQt8Rtq@lists.infradead.org
X-Gm-Message-State: AFuF++mqwHrAoi7xTgGwdSrDeBI4GDo/i6D7QYL2GMgwnYTdQIdJ8p+P
	DKcmtwIf++ISZgGisH4slS3lfojob58GUC6Jv7rCpQgMsJoqUXlw15rN
X-Gm-Gg: AYBFou1MxjGSWZLf+ovASUrKbBHoErAlDkRU1Wg7aHXWB7xlpwk8frMjCLXyj82SGMq
	bMRJpmI+LePyfn0ZA/w4Dw1mfDhOVAOhNuO7y7Q2QdUz6r2O20ir00MoAg3yjYrnunUWQoSSuHS
	QgSTsVdA8tYKiQXZ9HyOZsMoJN4akiNxRbEiy/NmS6Rvxd8Q5GG7PaRC2/fhqAULCUJ8GEwb6Lg
	mrzu6A4B+Hj2W7TVxwbZv3Kb6dBfCN4X0uzemRx8LQURnkFmX0CaiK93sUui2ysV18VjxHlPV9g
	Ww7RQ/NZ9HMLqCAUK5I7i3m9Iao9O34Fe+vfYoyB+zhY+mJJV58Yr0ESspPvjyFES3fYnZhWxo/
	GKKa3MTb2c4SXaBsS1t1/JtudgihM7qSjoUxMbAv/WD6XbIAc7hbMsNcj7RpFxRpsbJ5g2NR+tk
	qMnPocreAEiBCgOTuLuqQGyHYZufAFq30ZNLtzfabtFX6GK73MDC7utdDb5g9aGrjH6uImo/Y9
X-Received: by 2002:a17:90b:3c03:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39d9c1db154mr25881100a91.15.1789311570670;
        Sun, 13 Sep 2026 07:59:30 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:30 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v9 2/9] thermal/drivers/exynos: Drop invalid IRQF_SHARED flag from TMU interrupts
Date: Sun, 13 Sep 2026 20:28:30 +0530
Message-ID: <20260913145905.9404-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075931_323502_3F6B5F70 
X-CRM114-Status: GOOD (  14.88  )
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

Remove the IRQF_SHARED flag from devm_request_threaded_irq().

The driver requests a threaded interrupt with a NULL primary handler,
which requires IRQF_ONESHOT to keep the interrupt line masked until
the threaded handler completes.

The TMU interrupts are dedicated GIC SPIs in the Exynos device tree
configurations, so there is no need to request them as shared
interrupts.

Requesting the interrupt without IRQF_SHARED avoids unnecessary
interrupt sharing and matches the dedicated nature of the TMU
interrupt lines.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index e75040222ccf..825dbdef0b9a 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1078,8 +1078,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 
 	ret = devm_request_threaded_irq(dev, data->irq, NULL,
 					exynos_tmu_threaded_irq,
-					IRQF_TRIGGER_RISING
-						| IRQF_SHARED | IRQF_ONESHOT,
+					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
 					dev_name(dev), data);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to request irq\n");
-- 
2.55.0


