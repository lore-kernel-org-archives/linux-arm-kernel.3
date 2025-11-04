Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944BCCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=; b=2C421fQ5riD06l1XPWtDfPwt91
	+XSUDT+pGiQSn1kC1DJQNN4sK9w9u6eN9n6wiWAoKCgzXiJhiVftb1Y/gbTJZ1ajuXIwH1CTaRdPj
	2Hb54xz+Yggy/buhMCPJZv2lJWArX9i0/Iliu/aHWrYic95JdL1WaaPltWMh5SqtZTL04oIA4CMzF
	zxGVUtP5e5g5LjSLABa6BZSfScYuElEmLD7dOG+G2DY7IIO1B/jK/h8M6/oSE/NbvZIpNAktFDu1y
	lFWNnqoWavaXyGzmYeHR4s34AhXbLKeN2eLpn959KtbyrDfCKGYZBhKALqRW9fMTd+yG8R0WBJSAx
	2XtRyA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlZ-0000000Bkq8-2n28;
	Tue, 04 Nov 2025 12:04:01 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGFlW-0000000Bkon-46L2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:04:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b70406feed3so1227286166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257837; x=1762862637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=EYS/SjyKCGvmkLcIqOttmK8e+3TMmW3YWzR5x54OOgQoZlsSsvkl1g+Y+qNCLVCFQT
         SNydg9mk4b0tk+r1r8gzjBpaTTAUdkoyZ0y7O2BhTARkId2klaHOGVYlQQJU8d7qXgIk
         b/oWaPUvfz8Ea4pwtCri4K791NB39YPYjx/htZpMQvR16OHv+RCqJT+p0bPc320egqiq
         bOOYCCKGoiHsTmoyof6JgkaMgC9BnPXxYi90N6Gt6EW0+8CjgcWSuZ9H6voZ+cUS6keP
         rH6HC++R6OHYSGqoV6ga6OolMvCd+DBtEwsmxoFMQrft/f7PVXlKSoyiEnRvnUOKR7cM
         2DuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257837; x=1762862637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=wj8PPqoXhs17Q6LVUjqNcnakyWaC7UCOxhecIeJJfSIbvtz8Mr8NFBPLY6Ba5FFxRD
         eDLIoGnu+vE1AJop1G98ussokMu79qHud4kxYuKJcTpAdx4eZikAehBbf/rkHBn1cTxr
         ONKpKEKQksjtoUJWijyOecDacfYdtqkkx2e0gn/o6t6JKP5xVP4TSj1P213S1d6TWfy3
         P7IScXCWvo1jvk5MhFNDwETJiiDsCAisdGWDXsLzaRWWB3QGIlg42XplwZEOcEVLutU2
         0LIIO5dh7iysDc8Gfov5wFj5/LUnifhQ1bUxz0IM7e5KhP3tJJF0dBuRwPcSo1OxlP98
         QtkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb8YpjjKAcGOeAlLgn1YBMFcNF0G4TRw3GM+554JkLKb6mayhtfd5zemwXg5sNoUhw5G8s+udlysSGnuYmRQus@lists.infradead.org
X-Gm-Message-State: AOJu0Yws9XDJmjIf8N1Lf17WzEkHu2feg2KLnUNJ4pVVHz75K9o/l+7K
	aL/kcrouz8mhEL0WsfvnmCrRkZxukCwp1y7VzdzJBHl9NHoIsHTpTcBQ
X-Gm-Gg: ASbGncu4Vt2xoYko+LgPLRmpOioGhKEyfzRUypQjz9BigEQl9avYebIw3GfIASsd+oF
	STgKxuLJQX3nMJltUUwbFEmY/5ODP7SBkead327HzRKQvNj3xYsBrzDagKbSeS9WOA/erWHKaM6
	bA1E9ArqdJ8DX9HpEFvaihxSv0e8NF+XmNDJqHIpVrs3t9uIh9ZB0SiQ3rUUd1CvJMCerCXVpNk
	NDJMkzV6FxfyPBnF9wAvq9hK7jYMIbUl3RuU+I+7iDFS9TYrOv96tfWZW1k3BS9j1ukr4YwrZBg
	Md1Ykvqi+ZJx7k79jCrx/sh2QBBmpd+N49uwbdhSsqOa3TGSUKzuqJvVWy0Ui2vFzErTIJjnC/t
	+3bzghgBx5+Ezh9lEmv5cNX8BJ82S52H4rvPAg1WzS3UvinXMs16pG8nr+3jAbY+2LhMeF6ZfU8
	Smti99nXanJG4nfwXZDrhP6og5kw==
X-Google-Smtp-Source: AGHT+IHt2fE/H6FCE9dPp9U8nFD+BbuQEZr0YcTeeDYKJn0Q0W8ZsDGbQTHbvxjqtH0OMOcDf7SSqw==
X-Received: by 2002:a17:907:9484:b0:b40:da21:bf38 with SMTP id a640c23a62f3a-b70704b654cmr1611290866b.36.1762257837013;
        Tue, 04 Nov 2025 04:03:57 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:03:56 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Tue,  4 Nov 2025 04:02:54 -0800
Message-ID: <20251104120301.913-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_040359_050938_3FD924B9 
X-CRM114-Status: GOOD (  13.67  )
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

As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
"memory map", the definition of the EARC control register shows that the
EARC controller software reset is controlled via bit 0, while the EARC PHY
software reset is controlled via bit 1.

This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
imply that the EARC controller software reset is controlled via bit 1 and
the EARC PHY software reset is controlled via bit 2. Fix them.

Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
Cc: stable@vger.kernel.org
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..eceb37ff5dc5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,8 +14,8 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
 
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
-- 
2.43.0


