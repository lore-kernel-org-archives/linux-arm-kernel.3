Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BE1C61DB6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 09:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtwMAbostjHOa72J38z42M6Bewn9CJrZqCiOgzQefRo=; b=SwWGamJcmm6JlaWZPvDW/MDTcx
	m8JAbUJsQx3k4oZ3+f1Svms5HvIE685rTltwu4efXRjiXrD5Ur/9AZ5hsrZsSg9QEt3RHO4ONRlsC
	dZeyKraXAnqdIHYGfQJ7ERphWBisb4k+Q4UH7sQk4C8q2u7Q55MRFiq0VpOGNGQURXiAQqACsDThH
	Y0eEz1Mg6uNnraHGOW3nUGDukTDpKXMb7KxuS3wD5v9A/XYv3H9IApbDrKj2aXxCQyYV6KOWUeXxI
	Sr3hGpau1DI3P8AeJBccck1XK7+nL4rFegA/qGCPt60fAZeBi8B/qv7OUHoUsNRBGbsUJrvKfV4EN
	vlcve13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynCK-00000000SZK-3OlM;
	Tue, 25 Aug 2026 09:12:00 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wynCG-00000000SXW-081o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 09:11:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8520161fdb9so4329092b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 02:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787649115; x=1788253915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtwMAbostjHOa72J38z42M6Bewn9CJrZqCiOgzQefRo=;
        b=Q+BOgD2RLuCkBe1gJmEFDJtL9POoCwiiDGoUV10p301WsesalXBeDZ/T2xyBTRw+6U
         xcny+uOBNQM7VEHKGbfYAja2msgFGYqda9ygrR1RhMZWNm5SZZACsmk4iCtyb7YfNXF+
         XYs1lUWN4fLY8edLdv63bbpUO7He+lsGgEnZPIvWRELuA4JNbvq9XzP6qEW4OPqSDD/2
         xbC5uYObuh1kzwYh8SgwDo6r9EmfIc3i/rzOzZrEhnQfjBH5rep/Crjk8PUHtDl6WMjO
         mrKh59Rx80ByzK2M+jw5GdWK2SNOGxnoTRFH1tKgOkCDFfubJeCKTeO2n1VigQ9gg0ON
         pMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787649115; x=1788253915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtwMAbostjHOa72J38z42M6Bewn9CJrZqCiOgzQefRo=;
        b=DW2jMSqydkRDEQjOUr1Vd4bc4Ew+vxSMhONMJsZehTz31wMchOS28GpBV97ZFiCBoU
         LNJoNvuMBaECYrZUgiICTjJ0JDjUSU9tcbbcod6brqeLNlv7hnX1tYWmaTbzo3Tg/Z/c
         TriHctrIR82gm1WKwxJSNJHI/SkzDouX5BqfnU/z3Lv9wpt0GK+VGK3JP/f4ahOVm6Fi
         D32CwqibmxGAQPX5dXsQb4a3S/E1jzM0lQlobmvqMjIv+FCnpvMVIbv550deMgPOZpJ1
         bt+a2Vn4pGvAIHz9vXzWhguWW8Y3R+XVoB7iv3ayL08wkv7GndL9OpYocfoUoP9OYyow
         U4ng==
X-Forwarded-Encrypted: i=1; AHgh+Rokyz+euAE32Ggm86KfAXJLpltCb+X18+y0TToPqppS22SomzuojYsdWbd5Av1/KCok3NIq3zbIP0T5+RxGA9f8@lists.infradead.org
X-Gm-Message-State: AFuF++nIM6GYo8ykBAKbd4zDpU1CVmux+XjfhgdfWZxbRAQtdfNRvpXY
	3F096l8wrnvF6vdmS04KaS9xH8nxU8vwNpr5pIMzYLZ3b9Dim9lRHqg=
X-Gm-Gg: AR+sD1276sqzE3iJGQlsJmXiaaWp2f/3m8p1K37PDXhulAZvrJTEhbk7czsgWCa8usi
	HbCgcvgY1ZBxADXZuRx3dKFPlvAJxVR3LWvMYJLsQIr6+V2jwFRcBpkzuKfD06ewyQKSwpeHyRI
	5LwA1zdRmCWIFf/MilNM7i/3sdEm2j0GtkSbP7ztDX1E+Cd9mWTxXR/2zQ16uXuv/RsoRoZ3skt
	9BdFFtEUZr3nsiVcJu3wT9oTfec3AdPYv/BB5ofTUuVcTyydb2q+Ssrkvmmaw5luMA557/fODI0
	avO5M36RytFh/o3AuLJzDj0SCZZaIvbL4/iiWl0/eg8L4vLwUVN0kYuXLNsI9btVBL0JGQAMP9R
	s4KES3xDCaSkYrjAkuVwW+ytNplHn89VbAy01i+DQCMueTVGA18JQYtiIq9fSgm+ZM/bXl2Ah2+
	kZSd158P1dPjI3REFvU5OZ7JZk4GGrWURJW8nFjOV5r1tcvynrqOfny76LgZcsS9B9/ecrcRGfe
	XVIQolp05E=
X-Received: by 2002:a05:6a21:134b:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3cd910a2c53mr11302798637.5.1787649115021;
        Tue, 25 Aug 2026 02:11:55 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e4b125sm1703846a12.20.2026.08.25.02.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 02:11:54 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michal Simek <michal.simek@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH v2 2/2] memory: pl353: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Aug 2026 16:11:18 +0700
Message-ID: <20260825091118.271720-3-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
References: <20260825091118.271720-1-triet.hoang.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_021156_075409_D6972BE7 
X-CRM114-Status: GOOD (  13.79  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations from the suspend
and resume callbacks, also reduces kernel size in case CONFIG_PM
or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/memory/pl353-smc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/pl353-smc.c b/drivers/memory/pl353-smc.c
index 28a8cc56003c..047e42c8715a 100644
--- a/drivers/memory/pl353-smc.c
+++ b/drivers/memory/pl353-smc.c
@@ -25,7 +25,7 @@ struct pl353_smc_data {
 	struct clk		*aclk;
 };
 
-static int __maybe_unused pl353_smc_suspend(struct device *dev)
+static int pl353_smc_suspend(struct device *dev)
 {
 	struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
 
@@ -35,7 +35,7 @@ static int __maybe_unused pl353_smc_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pl353_smc_resume(struct device *dev)
+static int pl353_smc_resume(struct device *dev)
 {
 	struct pl353_smc_data *pl353_smc = dev_get_drvdata(dev);
 	int ret;
@@ -56,7 +56,7 @@ static int __maybe_unused pl353_smc_resume(struct device *dev)
 	return ret;
 }
 
-static SIMPLE_DEV_PM_OPS(pl353_smc_dev_pm_ops, pl353_smc_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(pl353_smc_dev_pm_ops, pl353_smc_suspend,
 			 pl353_smc_resume);
 
 static const struct of_device_id pl353_smc_supported_children[] = {
@@ -121,7 +121,7 @@ MODULE_DEVICE_TABLE(amba, pl353_ids);
 static struct amba_driver pl353_smc_driver = {
 	.drv = {
 		.name = "pl353-smc",
-		.pm = &pl353_smc_dev_pm_ops,
+		.pm = pm_sleep_ptr(&pl353_smc_dev_pm_ops),
 	},
 	.id_table = pl353_ids,
 	.probe = pl353_smc_probe,
-- 
2.53.0


