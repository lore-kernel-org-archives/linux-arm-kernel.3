Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC182C54F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71f6dv8Oj3Q5ky21qEIlnyYawuoQhOrGkPFVRB1RoRk=; b=sx5OuXmhRcuNnu3lOlag0bed+1
	IurR6R2GTL/7Fa1WXhKY847PNeHhFSEnZuOjxoK2faxlUnO8TKUKQqZOBOOreqx303Nve9Lmzx0Bi
	xeqgArBOBBXdQpK50AGyvb9aQrqOgmuJNyxh+hmCnocn7QyFZft2ckTTMzDrEfGPo6LJugI6POmpl
	GzfjS941GYgvBZwOU66P13A7Sk6cTBYJe+6biWIo3N6DMZhruyMPTP9xFvM1IUFutTWOy6MALzVjt
	m71uLkGLqgjZGtJTvV8uC3sxPWwQvntjtfFOH+Wa3VXRBcQdGc4s6dOE0VrOLSBxPabk4S7lFnLCG
	YVCVD0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uITba-000000046Ey-1y7w;
	Fri, 23 May 2025 14:42:38 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uISeF-00000003zSs-1vVc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 13:41:20 +0000
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso92646775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007677; x=1748612477; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71f6dv8Oj3Q5ky21qEIlnyYawuoQhOrGkPFVRB1RoRk=;
        b=sCuIrklWkrWbTI9Pv3EwAGAUk6BgBGMfBbpj3p8OLKJ0DmEWCtuO0UltQRAu1uEC+t
         DsZwalSgIPwUU08auFSddjgZkinldnNi0rJdN1pi7uLCuSIC7cwwhf4qsXpagOAxhgQ2
         mA+DfG0sDThlW0stl/ADj9Z/wLN048i9ApbWYgMfX54UwAOvf4wxFCOi3P2DEAYvIXbs
         pVmx57wzt7BxTnB8dC1dFklq4cEjAoEbZPcEvEBVWWWVaMxKMTPvuTjPvR5ZTNkAdWS8
         m3fYxMQWL2PKOslnFxEFljZVkuwU4rdjePgfHesuMgHXJoAYZ7RUcVlV1B+XrvM9iuan
         uNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007677; x=1748612477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71f6dv8Oj3Q5ky21qEIlnyYawuoQhOrGkPFVRB1RoRk=;
        b=JL3Io3dmlwm50xNMfLwQRT1NVoK051PsuZj4t82wxj49wXeIC5TS1/QBRMwggo+tX8
         vfCCICBQ0U4qYWDlYhD1msHkqsgQ3CxSIfdEolr8qJn8oVQD/U5K+MXQGPMpDrxJPlS5
         uC+S12ZpB+0v9EqmUTmZuZRVonTW3l92LGZ990WuezIBHMZI54nnIOlp1mgI8ah8qGN/
         c1StEF1CVO3fY1xngzuSOS0mkQYDFXG6E41I3PW0392UgvXIGet2UIfL+mYaXN2vtoti
         e1AuqwJIJe5agmC/QZeU1E0Ep5fVo3fL2UVgmR7n9BzJ4ufW6ZXWOsbAU/RGq6lRvGBf
         ZSRg==
X-Forwarded-Encrypted: i=1; AJvYcCW7UjE6+xuadLGjAbcipAhTH1FJ4vg6l5sNEA9yU6RRiHNY1Hv8PEvda5KXCxKsSzt3ys5v+m6dtucv/DdlT5f7@lists.infradead.org
X-Gm-Message-State: AOJu0YyoNqk7JTzi3nv1cMT+t1po6msAS/q6RpX8VfzaW71Rd4SMR9f7
	Gfcw/6zP6oo5QYn94BdhviaEtWXxtwpThwwRWhSPzsitLH08jQSpQL16sWq3jvTJdLrBySOTrkl
	QtcY3hfA=
X-Gm-Gg: ASbGnctlz0wT/ZBBhKnR2zj4E4xJ7ghVTW5FS8ttVIfamHoQWrplM8GaBXGL/ORMRgW
	kxbDEAxyklPc1mrhnflJq/Q9QL07hnx5s+ROKCInPlMjIg2iHJjLBEOELo+3Ud//63yX1XC1r6y
	ANv1TZarlklajzMojyR8JAdsD6l3Gq5GspND+BewKspXlznw4ndO6SdLkcgtURxdEVebQTBWanj
	ntcBgnD98kWHa5XgfslgqYfTwuwz76BA8yeCmJZ50Uxx55a2Fr4Q0Gclnb/z+tTDWSDiJjPnLME
	nxWEcmuqN3saBKSVCO26WY3tD1PRRUFyK8tkkcnOJ0OIUiZBk6lE3HpXNXJjJFs5kAQHKFhewIX
	4XnFyt0+FrZNdlRKoD+wphEpE7Q==
X-Google-Smtp-Source: AGHT+IGFndHOIFZSsgQfYdZw+/8HGCKSecirkmKfEr0kpQ5LrWHxETwwaD5/Fwd9r/MLkzRBHLqG+Q==
X-Received: by 2002:a05:6512:b9d:b0:54a:d68f:6ecc with SMTP id 2adb3069b0e04-55216df94b9mr843157e87.2.1748007667241;
        Fri, 23 May 2025 06:41:07 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:06 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 17/21] pmdomain: core: Default to use of_genpd_sync_state() for genpd providers
Date: Fri, 23 May 2025 15:40:14 +0200
Message-ID: <20250523134025.75130-18-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_064119_494973_78FAEF3D 
X-CRM114-Status: GOOD (  12.14  )
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

Unless the typical platform driver that act as genpd provider, has its own
->sync_state() callback implemented let's default to use
of_genpd_sync_state().

More precisely, while adding a genpd OF provider let's assign the
->sync_state() callback, in case the fwnode has a device and its driver
doesn't have the ->sync_state() set already. In this way the typical
platform driver doesn't need to assign ->sync_state(), unless it has some
additional things to manage beyond genpds.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index c094ccbba151..b39d06d3ad26 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2621,6 +2621,11 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 	return ret;
 }
 
+static void genpd_sync_state(struct device *dev)
+{
+	return of_genpd_sync_state(dev->of_node);
+}
+
 /**
  * of_genpd_add_provider_simple() - Register a simple PM domain provider
  * @np: Device node pointer associated with the PM domain provider.
@@ -2646,6 +2651,8 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (!dev && !genpd_is_no_sync_state(genpd)) {
 		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
 		device_set_node(&genpd->dev, fwnode);
+	} else {
+		dev_set_drv_sync_state(dev, genpd_sync_state);
 	}
 
 	put_device(dev);
@@ -2715,6 +2722,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	dev = get_dev_from_fwnode(fwnode);
 	if (!dev)
 		sync_state = true;
+	else
+		dev_set_drv_sync_state(dev, genpd_sync_state);
 
 	put_device(dev);
 
-- 
2.43.0


