Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F67D19501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=; b=p2Y2vskRu0a2bNgWUK6QdsroZ2
	2DyBKX4wyiT2eOoGRofVbu/rVVz2GrIBWta1y7Zbb72lnnX/aFJEqIXF3FSc0CUYGW0Lbr0oiG1kt
	I3J5a8Q3p/JBsOlhW9hpyrxp2+JOjrP/6zLhPBYtry1jYMFUuOgIhYxnkkb1cvkrO0CfzL6/okLn3
	anPecvyt+/+8Kfz0q4vVWwJd6KE2j/I6ayC7sWH4IbZ2BZr1I4jENxXtMF7K+l5d3Z5SoVXdu8cpE
	HYZo36iNVUuwu44iTueE1D50q0nGnS5gG5mQhBGwx2aMBfO1a8M0srNlmDcdPL1H6pBx2OdGTk6fk
	Wb0WvP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPM2-0000000Cr3s-3ZEl;
	Mon, 26 Jan 2026 16:22:18 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkPLx-0000000Cr1p-25v3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 16:22:14 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so35680795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 08:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769444532; x=1770049332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=;
        b=LKILSwJzj63XcPMNNxJ+M9wQkxpxhGXsnLRm9gnxona5VXBTX1NInTUgAl7zFibmUJ
         9j6tu+VXB/KKX3Wuf0ggBZwXhAeCf6qpq4rXYQMaJSOtoM6mmRV7Y8x73gX3cjU4zZzo
         pTyPZ7XvzrFsCiWeCFVHlodNON37wtAX8ocIMsW+rebI6WCbTQtEnTHnOSixvg85xClx
         yEeTRNmEV0OKkY27MsfHzPvQ0sRs+IIQ1ssTa5CQqeHJ2edfPnfVFRuSPfTHvCYFYs1e
         z830e5SxySFJWdbm6xhkCrFPYSJHp9Ah4cR4rvbakkPp705AKL6JwroKB4UjjLEf78zo
         cwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769444532; x=1770049332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URd/ONh2/S9cNJVZREq3Fly7rFEXScu5qM+CsEx4Im0=;
        b=KV4QQxpKSvlgzaWZmuBSFGowSQ+IIyQMWQcpr5hoXzy0QLrP2FuXh7Uwnyz9i+1YOB
         vrftyITKur0SgWXV8wU2pv3JftNd3K5Ksh3+tt5fxhXUnmgdVyKBzStkigXdtFDxffPS
         bP8aq41bbDpqYtUz+80sFxagTHVSIBCIwtpwxIjPMUcE6iepT2Fpk+C8nUxzGsSrfvBe
         7HRwepYRMQ19r2LUOu9ko0OZ3dBbuqJrjYb9j3dkcYMCgaRQ70r7w+Clc0b0qhr4i26c
         QehtvB0VPWaEOaJTavT0mSxxOIs1+6mTBy0xREr67rlBR29gkWXcO1Jvtv8VxdEae4bt
         h+0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgODmafkFzd2MtcGBJxgb/muWdpxQVZ57oYEJEbjky/Ng1PXZhHE6smAM9C+5b/oEfVcByiXqZsqkWm1N2J6qP@lists.infradead.org
X-Gm-Message-State: AOJu0Yw02JG5FjEe55eeZHrVa/J5hOLlvhB/KyiFDy+7AQ76N5orTQIA
	CiNNNXaNZL74bCXpAC0hub5kvD6QJRpKkVtN1P5YNpV7pKT2HbzzUaac
X-Gm-Gg: AZuq6aLLLSAGpJnr2xwN0qp4aodVpgRBPNCGsPFSTl4u5l4fTphDuA4RldsDIDvDAUX
	Yjo2Tv8efO2F0Se/dUbQq/8FTo4DhclQc+o0G0HumeKOuTWWUHHtjW0KwxB1f5m9421OaPqFn+y
	3w+2UOA4J/lljX5wKuGOdPwFvU/y9QvmKBkSMFV7XfsDgXpfsDTcoFaCgXQ+E1bdyzRBbhPyj5t
	DO/TuZ0b/saqtI5tylF6iRWiAeD1yh6IedyoZkR1sjPIZ1XiP5fs9Rpda5gsW3+sZcYtJ918fQH
	MtcX84neQMWVXNP7iC8Td0EMB38+T87pnDGeCTGpy793x0dIt4jV3vqpBwtnxnQC6oeuevr9kjB
	/5XxZ3b2lYAjU2xpU/+v7m8fTDeKFoRMwISIpCl2i827tX70jQbUn0dgq0dxNcbc2tYr2CqMeP6
	K6w3Vc1Jc0xC43oML1Icj1D5f/lUSLGkXH1W65GQ==
X-Received: by 2002:a05:600c:35c2:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4805cf66771mr88446235e9.23.1769444531205;
        Mon, 26 Jan 2026 08:22:11 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480470cf1acsm370371035e9.14.2026.01.26.08.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 08:22:10 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v7 1/4] reset: imx8mp-audiomix: Drop unneeded macros
Date: Mon, 26 Jan 2026 08:22:00 -0800
Message-ID: <20260126162203.708-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
References: <20260126162203.708-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_082213_577390_CF16ABBC 
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


