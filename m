Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D66D10F34
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 12:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=; b=IYF+ta+ZXQ3f1+nvj3dcLs+hVp
	o94BllcEShaDsEoUCvqIyUvrb6UunmgvSAHqS23WtPv07bLe0jUkiqpQQrfb3+Z/rzy2KXM/Zpw+8
	nyJNFIw1FK5728FBvXKi6WxbE49eKIXBUJ6KZ8frqVl5m3zwzrZn/2KqAWr7KmU1t2GqLOuPIribi
	s4EhAXO+qWRL9pMEfZ7HJUaoSwi6mDnxE+/M6ZUxxk+o+7HpQp7g660ygCwb/OZRjS8nyPODcVvLA
	bYZCfU7BR2H0GlTo3qBRQTSGHlGX8UFHGEWsyV1dKJdX67qk9A2MQoczJ+fMwAKgKaDfcb7nv6B4n
	KFh1V5ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErX-0000000Ezl5-2R2e;
	Wed, 26 Nov 2025 12:43:12 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOErQ-0000000Ezic-341Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 12:43:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b728a43e410so1163428466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 04:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764160983; x=1764765783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=;
        b=T/blQHKXIXNwLGjTGn1ffefpqAozNbafKquBucpAMpGaQ4CWwcAwuTYhRQOvUNvsv4
         0FoB8JcZpRNZfbL0uLQarRRIS6zGWNyhbx70D1xLfzGBChtLsMLGOcVFVbPi3vYLjJs6
         sxySqf1AWEAu9i9h61AEV//Tahu8yF2Bz/B3b7ceSDOpxdXo5J+zuGgGPxBG3cuYzBg/
         zWOQKclgZPfFDNqrFnelQOu2bL8z4OKFf6QK5qQtGs1Cpgz8qD4r2Uakl1YE5G7IbYe2
         QbCK8mTYPq+AhB1A3iERtNEyAexzdc2sBe+bQinHU6Lqzh3rd8jzwLBVyTKL/0xe9Ro0
         VKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764160983; x=1764765783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=;
        b=GhkM+d65h37kaw4pQ3O4e15KSZu67zNbnRIxUfE2TKmNt0fc+KTOWJyalFIYIhzdW/
         woNxDZtcSDPBBsAyt8swRsVJDgYVzA0BbSdBnYqyxdiPRa1MkrDC/SHGN6MIPRRoi3u6
         /V/s+NUMdAOHy78CKArNs618ued7PAGuFVtps07ggtIVRePOnfT5hczmLvyDfuBG50Rl
         y6gMt1/QCFPqNZPG5GurkHgCHFJPbVjvN7FUDc+08u1bMKSU+Dhudc38RPQkk4MRY7c0
         uswwRQBvG6Otzd7kNUH8hevyFIS2H2RyshYiPQqgO+f//SbTAECasWF+7WDk94NwUKPf
         ueBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUER0z71Vlhdj76rzyuH7yqYyVB+q+3j1E2jvaFeejHb0U3oneRaskz9ZcVPJZ82AicNZI5TvHXyeP9T3QWkBWS@lists.infradead.org
X-Gm-Message-State: AOJu0YxvPYYOt6G6ShzjfFOxDQcg5S69/QX344MSH+yip5OpFac2iHgH
	ShiwctwtgKFyRsOq6ketNFXGyUMVT8yhtIgqdulKIyjfH5XAqIA/pkpE
X-Gm-Gg: ASbGnctxYIU07wKZSRnZBMBMAWJNFcFpxig4KGlNvEQzn4Q+omIjaRJemW8vi4wdZok
	CfrB4btcr8tSrJQu6ZL/k/hulN8vGX7hka46TjQC13bQWQGctc+8W3RcGDdS5Oje4henxRbGsSV
	6CQD/7pY60+R3gQ7CXGJj4la2BMsXCru8jZxsUBqay891ExHhGTIciLz2bFAVmDXKH/c5tGB5WI
	q+xdDieG468il7Gu+vL6PCYM8j6hMzF01AhE/bkn/laQ09lncCfvYx+dDXo3ysVxbxd2ApkY+eC
	B1vW8+7N4RpT6AKxTI9WjVfwQh2bC4iaz+sb0TYxOTQUdnCzKtPqbgB0n8H5fa3QUytg5mHxuP8
	no0OxJa1k877GLCL36byD6H3PArqCjzRbzBsXA/UOOH9w3mSDwAtO908kBN52vGzuyyViwmdXMZ
	5Fyfuj62jadnRlgkyktpTAeQzhIIGgGcG1ad1C3aiJSTwktwY=
X-Google-Smtp-Source: AGHT+IFZ3jJn6ZtuPHP8d1zHAviRf2Hf5JxHWcSBJlcuwsyLTvUvL+Ag9uQmMJeg0bd+BjS0LWB2ew==
X-Received: by 2002:a17:907:a893:b0:b76:3548:cdef with SMTP id a640c23a62f3a-b76715af3bbmr2271548866b.25.1764160982366;
        Wed, 26 Nov 2025 04:43:02 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536459d92sm17654824a12.31.2025.11.26.04.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 04:43:02 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v6 1/5] reset: imx8mp-audiomix: Drop unneeded macros
Date: Wed, 26 Nov 2025 04:42:14 -0800
Message-ID: <20251126124218.803-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
References: <20251126124218.803-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_044304_888387_D27C032F 
X-CRM114-Status: GOOD (  15.32  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The macros defining the mask values for the EARC, EARC PHY resets,
and the DSP RUN_STALL signal can be dropped as they are not and will
not be used anywhere else except to set the value of the "mask" field
from "struct imx8mp_reset_map". In this particular case, based on the
name of the "mask" field, you can already deduce what these values are
for, which is why defining macros for them doesn't offer any new
information, nor does it help with the code readability.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index eceb37ff5dc5..acfa92b15329 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -6,6 +6,7 @@
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -14,11 +15,7 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
-
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
-#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
 
 struct imx8mp_reset_map {
 	unsigned int offset;
@@ -29,17 +26,17 @@ struct imx8mp_reset_map {
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_EARC_RESET_MASK,
+		.mask = BIT(0),
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK,
+		.mask = BIT(1),
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
 		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
-		.mask	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK,
+		.mask = BIT(5),
 		.active_low = false,
 	},
 };
-- 
2.43.0


