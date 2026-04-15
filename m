Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619B9F419A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 13:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ij396v/ARQbEqIfPoR7kjIiJGCWUlYIBuo1ugDzDJG4=; b=ffORpai4+xr3li
	LanFtGjvzYH/mq9fTU1kR67a00INVPzBqqJUzjqG0MRVyZTplwzAgyj/jUHNH9c2KulP1zpV86Qwe
	dj+lhLzHE1i/G8J/bkAYaZ9xMXm8uAp0j9GD9adm1myD8Nk+5HPPzHGfPJfWiWAFpf4bZR04GUtqx
	kVtVOoF0Uww+RS0XZUxzTFAqC4mgMq94vE6Qo4N7peqMXh74cf6MuQcsjbbzkPHEOeB+1804rvSJj
	/rgF886N6uRWmtbHX1ChXFtsIiuqrJg5pUIPbf6n5QVDWvfd9+Fm5xLwgfvVH5FpZIVcdQbcynbzz
	fO6XYm3PqNNOZUGGFiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD00r-00000001AX9-3PCN;
	Wed, 15 Apr 2026 13:10:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD00p-00000001AWZ-1SGe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 13:10:36 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2aae146b604so48288255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776258633; x=1776863433; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij396v/ARQbEqIfPoR7kjIiJGCWUlYIBuo1ugDzDJG4=;
        b=NgmJ9Oz/fqYkZ8wNGHjNHZN6XRR6S0+ilAHsJ3exWH6mpTchys5IYjgQkUuvti+Xwt
         80YFwGPyKag4aR6TBm2hnf7OiMlScVWiU3A90tHlXuRrA1X6qVm1rNGM3jylsin3jfHB
         njOPTG+QvtLGrSRkj6xTlwaCRGDXHUR7p15xubJesoqpjZbhTNlaEFlMMQNWKnPX/q9q
         N8APHQIMbV0qeMZNHT/UJBiXsBBBkevge62jEMO0G0fKDtmOwxltIoyqBcOrmzkgSghH
         VlJMWC8AfBoL5Sx5O5gSVCxufmgKKmVYo4SsrYp+aakcX924oF15EhAQb1WmqL1XZiFA
         6s6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258633; x=1776863433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij396v/ARQbEqIfPoR7kjIiJGCWUlYIBuo1ugDzDJG4=;
        b=mBJRG5npcH9kB5/zJjTsqFC8zPIumsNQrsVuaaY1xhqVOWk+4DncC280YN/eCQ9jvf
         s2IEyZMQyDCLoaVYwOKNfMnzeVGeix2CC6WJWu9TqHidhs7cAgGDQn5RDT6iRiE9LHYM
         Xf4B7ukwyXiyMdxNe3RYWANw9p564lderKKbXn3Qms8vYF4p3/Z0XeW/4U3kDQuEfzgE
         8AUZPH3HqmJqDHZQHfjgwy8Xp2XKZTF91lGLodgpm9R/tba4+3lvN5xXBlOWgbY2BEXS
         WbyTVhxevDhiV7W4EMSmlXqWz2CyvwFoBel0qOKuJIB9e5TCi1KqYXpHshWDNhLZtMmf
         9AHw==
X-Forwarded-Encrypted: i=1; AFNElJ8vh7CmLkExu4OOsI/v1QpfAeQmcGMPwDK/ZRJTk3jvGLCR4011XmJcHX8aEp+EygzLkiu+A/Z9U7QJhtv5am3I@lists.infradead.org
X-Gm-Message-State: AOJu0YxrsL9cBItQUCVq25zWYJ/wTuRCBg/3QZ7ZAkmGa1/LYYzCh65A
	TYP62PSaQmU1OYi30IyUF2tTktD8OiCJuHsbSSGwh3ls/JjNQGyjboGS
X-Gm-Gg: AeBDieuKD8bJeUv3csTEV6QhuLuGuapq2OUZDRbBr+Ng5iV/RngcOt0UvenY8xi8ITd
	tkPmmuwc5olj2+AYWgMBeBMadUDCu+ApukAROeXZjAoDgVUR/FWRIJEYTgqgfmxEy8h/8GBpQLb
	WjbQMBfwWUCmrc4ahDN+0LPidA/K+5e21bVzBG2bvRpHRKuAQD19WNn8rmY4NwN88kbP+dPPLfj
	2ahgW3TlL0nX6aJRuouQHVvLHwsd1JAVvMk4ct1CysdOE6H3OL45KPHERjrxT0BKNpcFLX5ISax
	m0ftK9T3Yg9hlNUXaQirAGsTwDU15nNG5mtrjsVCklgEYimnLU7ogBUC7TdSm+Z2nWwbwa1dLUW
	OOXKJZ2q9cIIhI4tR5CJ2hxme321f4lYOBjvmtD//d+bt6HwDPmN5Kh4IDu4HSE9GEEvaTQ0i30
	1iT0NKwPVFDRE/njGzNqgD+5zbpSpUSZPsMUECKyW7SjxmxVuCXgA5dTeLwv+cy0eQHi5UmpsIv
	gWpE7k6ma7E/cTvEtxmycx1aZI58fg=
X-Received: by 2002:a17:902:bc86:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b2d5a5aa5bmr174065115ad.29.1776258632397;
        Wed, 15 Apr 2026 06:10:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478292053sm28062555ad.56.2026.04.15.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:10:32 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/2] thermal/drivers/imx: two fixes
Date: Wed, 15 Apr 2026 21:10:26 +0800
Message-Id: <20260415-imx-v2-0-aeacff9e72b2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEKO32kC/zWMQQ7CIBBFr9LMWgxDa7WuvIfpAujYTiLFgCE1D
 XcXSVy+n//eDpECU4Rrs0OgxJH9WkAdGrCLXmcSPBUGJVUvO0TBbhNGKnUekDSaAcrzFejBW63
 cx8ILx7cPnxpN+Fv/vqp+QiGFta3pTlPfXhBvs9P8PFrvYMw5fwGinG2rlgAAAA==
X-Change-ID: 20260411-imx-b022791ea1b9
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776258629; l=726;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=TKihPKu1wRQ8mI4Zio2465s/4R0zt/1D8Ib7m8Y/KFM=;
 b=CNdQWFIHFiTFWs0EFl3Cyentbx1WrOppKyZSwi6EDSUAdKVfXJN9zmQWrGvs8MCLKZnyaH8h5
 t9sOioC0Ul3AJOtUkP+wRYpj8HCr5PgWeahKcvILQyj3kbtcTmive2S
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_061035_422515_86BB5FFA 
X-CRM114-Status: UNSURE (   7.72  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Switch to use devm_thermal_of_zone_register() to fix Frank and Daniel's comment.
- Collect Frank's Reviewed-by tag for patch 2.
- Link to v1: https://lore.kernel.org/r/20260412-imx-v1-0-cc3b45d63811@gmail.com

---
Felix Gu (2):
      thermal/drivers/imx: Fix thermal zone leak on probe error path
      thermal/drivers/imxl:Fix runtime PM handling on early returns

 drivers/thermal/imx_thermal.c | 49 ++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 24 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260411-imx-b022791ea1b9

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


