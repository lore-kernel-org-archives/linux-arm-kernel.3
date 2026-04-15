Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA370F419A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgiajh9ZFC2IgUfICjc3cGv7OXm2lzFWtpGDZIIxGOc=; b=etg1DWEpfSv9AJOS6yWKzbVkbw
	nYEHMQGnEPTJFyAq82XGtJOngUZEj+1fiV/rtwRCkRM0fojeFFdtdTGKl4pTSWIKLBYNl1KE9Vx8o
	0Fgj9BNckTCdoz4vSBaQt3ttr7x1KHn+aCcQj1L5g7QSjbKSMRvTRHyoh2i+FahtIeS5QsXGxRIGx
	Drd5nK4w/dNP8vThxMHlZWGIB5KKPoJloVJRG3tGd9ip7jlKbZUU6BgrpkXb1a+5qoOcuwFY3LQXd
	YGhyjIUdkiELeLNKfcfghEKyaBHbYYtRo3E4YoXNDGqNm5OOvKJYS3FcHktqsL+CT8a1bscfh1FB7
	wKVCTFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD00w-00000001AYx-3gst;
	Wed, 15 Apr 2026 13:10:42 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD00u-00000001AYA-3wP1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 13:10:42 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ad4d639db3so35209965ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776258640; x=1776863440; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cgiajh9ZFC2IgUfICjc3cGv7OXm2lzFWtpGDZIIxGOc=;
        b=AnKFsImPXOGdWjKTOcPtrc6BC0/637cRe9lNZdkSYhwzpRh1y/NMfAU4oE3y8GrLvo
         AEILKCV98YrcN10cP4ptfco/Y5H7HcL6nE0W0xh83Yi82t85AVzddA/UpkIIBKent1Lg
         i4sSyiHx+0QZMsgABxlH2ovmZo1F+2wb+6D7JwiGLzHoltz/DOHErrREJ2kRY0PvGcgb
         g1QdKC+QqEU/uJml3c9sMU2l9/nyi4Ac2SAgXbtX+CxQ0UPGThW9sgSDFlz4twUT+XnL
         uPVslcGuFvW+Ys7uq/3xURKZvGfuENOIvWayTGuTEHWduFxRj4Y2Aa64rb/+Po1/4aJd
         W6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258640; x=1776863440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cgiajh9ZFC2IgUfICjc3cGv7OXm2lzFWtpGDZIIxGOc=;
        b=hJhqLk1lCYtqlS+qiwxJcfetlB2a9gOVCMlNuOM0vl1HgA6MmDzlt7cPmDhPT5Ixmu
         bbo4Pj2XdBdVTJxHYAbo+1ImpeujAYhBrjtaj6kj2tZxqb4p2V01q2/81F8md3guSmxX
         wVAcH9dpX2boerR3zSmXbEwsVjpXHRxoD9YndclfsiYk+FOw6s7Yn9GWCYw1IuZt7Ubx
         Tdgvqm6lzsvpz2R+E20/F6Wf4lhVYo//bna3nD/Kg1Yvi5ldJA/GKCSwgWtQ86KQKth+
         bke34+HJ5KSiN5qUmbTA4cWHioKQmU4u5JVV/hBKcX6O98TaswtRdX2G+/HuuBthyAdn
         /b9w==
X-Forwarded-Encrypted: i=1; AFNElJ/ONbxOFD4iIvn/tY/CxPg/5a2tvhSdVvMD+VT71KWmmJA5EYHGTq93b47KTTUo7r4yD6A9XFkFQqbVjphGMqms@lists.infradead.org
X-Gm-Message-State: AOJu0YwlYCdKzraLKXln2DpiFr9mv3OikmCN6LhmevKxlNK7+96lJzad
	dhkn+SctAJi+MKXuM5wWti6EE4FXSiQRXTTWTN4It1MIbyNmSFx/+z6k
X-Gm-Gg: AeBDieu0gYHx0ol44lWHJrB4l/bgj9x8iMkfV3PbXjkTcq6+PikSfOF8VlKa7khHigc
	ROj9cLapmJwWGKmH6B/puPnhD96OyVNkv5p42U2kht/Ls5uZJzMZJgoS9mvzvUG8Y/v4Z8DNsvn
	PN3PCl2LUxmRp8RrE1JgXWMvC2UrhZDVHLV9Ro9LYZi59Gg2WsDWw7MmRkdPMy/4D2LbzDNjT5z
	3Y3UY+rycvGd1VG4ikV0oUz/zPQxZIzb+kovfjXnrtZJTAmrZAsKtPfHX3XlLOH4ZYHwW4uR8AS
	EuqEFp6wsKdDvkvp3qaXocJgva3qqx2JojJKQkI/bdE0mnK7zm8CqznCYh+tEjUHEKn+5vok0TB
	xgB3yHmnP+VDw/OA8xI8z9/upSu4VzSRsx7qNh+yJh4AvFQZbFNiaYkinhCF1vS82xQFb5868lk
	7qqdTnHOiiOEKpgXFDeBrU0isjaPAZFiLLHj5bS50ZNQR9ona+ajgE/M8znVORk4uacfB9wtMJW
	SB9xt9PVxnuH8exS1w+/Jn4bDPprg8=
X-Received: by 2002:a17:903:1ab0:b0:2b2:67ca:5fff with SMTP id d9443c01a7336-2b2d5a5d952mr210669185ad.28.1776258639793;
        Wed, 15 Apr 2026 06:10:39 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478292053sm28062555ad.56.2026.04.15.06.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:10:39 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 15 Apr 2026 21:10:28 +0800
Subject: [PATCH v2 2/2] thermal/drivers/imxl:Fix runtime PM handling on
 early returns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-imx-v2-2-aeacff9e72b2@gmail.com>
References: <20260415-imx-v2-0-aeacff9e72b2@gmail.com>
In-Reply-To: <20260415-imx-v2-0-aeacff9e72b2@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776258629; l=1767;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=7PW1lPMswvgJuRQIYg5xAY53B74djXr4QMhYyX34Qa8=;
 b=zc9s8r8gJYEF99ja/bK8BCYwUX6qO8U83NdS+xZl54YsmqyvJBsRpZbIBaWc4Errs/PcTw9c/
 ylmRwbKMQeDBA6dJu4y5ZbMbRXZFFsIsADvFvXB22DRbNSttxxOPGeW
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_061040_988237_458302EB 
X-CRM114-Status: GOOD (  12.22  )
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

Use PM_RUNTIME_ACQUIRE() in imx_get_temp() and imx_set_trip_temp() so
runtime PM references are released correctly even when the functions
return early on errors.

Fixes: 4cf2ddf16e17 ("thermal/drivers/imx: Implement runtime PM support")
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/thermal/imx_thermal.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 3729c3eac748..057dbab70266 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -274,8 +274,9 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 	u32 val;
 	int ret;
 
-	ret = pm_runtime_resume_and_get(data->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE(data->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
 		return ret;
 
 	regmap_read(map, soc_data->temp_data, &val);
@@ -316,8 +317,6 @@ static int imx_get_temp(struct thermal_zone_device *tz, int *temp)
 		enable_irq(data->irq);
 	}
 
-	pm_runtime_put(data->dev);
-
 	return 0;
 }
 
@@ -351,8 +350,9 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
 	struct imx_thermal_data *data = thermal_zone_device_priv(tz);
 	int ret;
 
-	ret = pm_runtime_resume_and_get(data->dev);
-	if (ret < 0)
+	PM_RUNTIME_ACQUIRE(data->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
 		return ret;
 
 	/* do not allow passive to be set higher than critical */
@@ -362,8 +362,6 @@ static int imx_set_trip_temp(struct thermal_zone_device *tz,
 	imx_set_alarm_temp(data, temp);
 	trips[IMX_TRIP_PASSIVE].temperature = temp;
 
-	pm_runtime_put(data->dev);
-
 	return 0;
 }
 

-- 
2.43.0


