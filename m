Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727C4C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=; b=Z4hVNJr/lxg1FCsT/sDVTZCPr6
	KmzvHThIkqW76ag6a2HElmrzoUaJnZovJ4ueEp267CA9g9L1wgPVYnY9jzkyeExnesVGcTYEHYCyu
	GMQ285nT8o1eKP5PseoTOMLQL89FaXfrE4xf0a3y0F6zPo7/I9PlaTfRjyEXUkDYj3fxY3Q3EMbxC
	CjhSIpfHwYVOga+zePLPyZsQiu7UCtRuWDOkz8zs3+NrGcphMhC+sI9eatBo+NLGmcnUFbWY/JqXB
	QT+THTKUDf5pQX5+0T6SOLsQdBbbi4vTY3hkFg1l8swbVtXg9FNUIEGReklletyeDJfKQEs0HwAzE
	ENFJGtgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hFn-0000000AoGm-1P5o;
	Thu, 24 Sep 2026 11:04:39 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hFl-0000000AoG0-25Jx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:04:38 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-396cccbba91so983477a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247876; x=1790852676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=;
        b=o4i8hUW/RMrVaIglsZD05CMEtll5SVaZ506PT/HfN4l9ZFGbYSkzHtdSLuoR+Mcr3v
         Tj3nXdZrkYPqf/WUBHulP8eMERGOyvLoZ4mRWEVW26q41b5JRTgQkMAdTmjmO39oY4Em
         wAOpEQNayRvJdxAFh/t1KstOD8GS6GYXMBCdRlN9RD6jyb4obwpGpQEqsQvqOM/DDO/G
         +JQ1UR9DKUJs1nmROkKrt1UUgpQbWw1xImVKqPZzVCuoNVrvWbRn+T0tPZpnIUJLGCOe
         Vk9NbZgNbYU0lgw1Ox38NKZuZhnkF0+9bgE1vmj7MNTLq0nsHzO4UC2KtMb5tHxAgQQB
         lvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247876; x=1790852676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQaBTh1+PqRhhhrSlt9lMnh9oT4JHlghqyyhXL51U2o=;
        b=v7K0yjdWpcygrhpyUKqojML3T1RPR8rj9hNxBWEOxkMPu+ubtkWXj7NvjKu+DVaR0v
         bOEu8kL0DNC5Fer6h9vycJ8fwO5mk6CxsXM5TfreHphUKIUjdyMH16x0YxdAqGja4wWE
         oeR6B3B/S7MDUTf6AuU3KIGwD/rBRD410OUQyg2AN3JZbl8VagUUUBR2jEivIti+GYew
         SaVwIhQayabpCEGQQMfHnywSwOiqb2UGA+4xrMGMho6o6BRtyi3FB9+pBXr+jXXjGH3p
         tPWqlDe5J3zNoAYQvsSGMZMDOQj8JZvH3V6140/BeaW37JAqFqU025gMrZoXyUOa2Nmj
         g9Gg==
X-Forwarded-Encrypted: i=1; AKwUvBxDhnNMakfwzYSnsLbLEDbSLvjdSnviSyPar38eTGbqjPwUJ9qU0bBOcoc/LKR3Nspuz/B4YC14TUefbaZHTS/U@lists.infradead.org
X-Gm-Message-State: AFuF++kCnkEgUZOeJ2/JB2ViDxQ2hKeIHcbSkX67+mxoJrwYR1t4xNvt
	zvBFJo0eCFzf1FB9sl75OTV3ggB/x70RaekDhwgZ/1lPS1QKvGTEWl2d
X-Gm-Gg: AYBFou32dqLDeSLuLBxEVWuQ4YNMOxBKzA/oP9DMzt2Il4NcQJDVQv2yJiZZD6MiZ4A
	LVxeafNhr7bvsD0RK2iwo2x7mA0mNA+VHXXWhDtVTsxKWA5Vzw/1a+p9WQkw4IMudrI0JxWrRPm
	srNFNra0vxU5kKblXFzGH56DBUMr83D8z5tklp0lAloOF5TiwWY6rKjcpEHa9vMF7wDUmsy1dUy
	3cCcSFbc8P9uuvx2YVPgjyidyqF6NoK5ZUBDXD5b4UJhqs6p3VEdVXMi3LbRywq7I3SsxzCrOcg
	LV4xYq2fCWjM1JQo4Jt3J6TSTd5DYVKbhh2Le/MFVlgIf6FdcfbEhBlmv3IumGlOo9OZm9uKkoL
	naal8uYaIzN1rYPcjIw0m1cnihlG4sMpew7KGfVw2+XtC/A5DCMiqjsM1viM0R1ZhsZBUOi2YRi
	SkvGwPSSRQerESQqgpZtu74DFaWsC+FUtCfxZCF/VHvt7wMfH1CcbgWRE=
X-Received: by 2002:a17:90a:cf84:b0:3a0:9eb1:7300 with SMTP id 98e67ed59e1d1-3a09eb175a7mr737462a91.49.1790247876472;
        Thu, 24 Sep 2026 04:04:36 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5dfsm4356860a91.3.2026.09.24.04.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:04:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	felipe.balbi@linux.intel.com,
	lgs201920130244@gmail.com
Subject: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Date: Thu, 24 Sep 2026 19:04:29 +0800
Message-ID: <20260924110429.1557653-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_040437_542782_65503447 
X-CRM114-Status: GOOD (  10.64  )
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

dwc3_meson_g12a_probe() enables priv->vbus when the optional regulator is
present, but dwc3_meson_g12a_remove() does not perform the matching
regulator_disable(). The probe error path already disables the regulator
before rearming the reset control.

Disable priv->vbus in the remove path before reset_control_rearm() to
match the cleanup performed by the probe error path.

Fixes: c99993376f72 ("usb: dwc3: Add Amlogic G12A DWC3 glue")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/dwc3/dwc3-meson-g12a.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
index 4d611c08e8a4..7ca6fb89027f 100644
--- a/drivers/usb/dwc3/dwc3-meson-g12a.c
+++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
@@ -851,6 +851,9 @@ static void dwc3_meson_g12a_remove(struct platform_device *pdev)
 	pm_runtime_put_noidle(dev);
 	pm_runtime_set_suspended(dev);
 
+	if (priv->vbus)
+		regulator_disable(priv->vbus);
+
 	reset_control_rearm(priv->reset);
 
 	clk_bulk_disable_unprepare(priv->drvdata->num_clks,

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0


