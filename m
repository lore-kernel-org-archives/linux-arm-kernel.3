Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0020BCE7B0E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 13:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSTuk6bpUxNwcbGpcQuPugEknybGUY3HH6kETf+pWJA=; b=Rj5ckW0HkVTU0oNAOdxotPqR/r
	R5UtnrP+mu4YBMiDhMvQat3KLoeMXPZaB1a0rfP5l64S3cUS8cgB6V2lYcaMLBNpxM/jwgEF75pLy
	0/oJ5yjUkd2Rfu405rR+hfzU5oGcIEGLQgyO79hhLg5skR4P0Xvn6IcZmYtLTYdVbBwTYyaxUEttH
	RyocLY+JsEy5BLTIrP5Gg/TZ6n+YGltoGuARC2gH0os095ejZOczf6UjuUwSeL0p8o5QNkyekPJ5r
	LOMk9PaIi5u9GzCRpYYEfFocLaIPmNDHfjH01O+XCIKVi9fBAzsLqyHUBnn7sWLZnfmNG1/dLd1Mf
	gCLAq2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0M-0000000CH6I-44wo;
	Fri, 14 Nov 2025 13:38:22 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJu0K-0000000CH4x-1dku
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 13:38:21 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b70bee93dc4so274001566b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 05:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127499; x=1763732299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSTuk6bpUxNwcbGpcQuPugEknybGUY3HH6kETf+pWJA=;
        b=ZVLkegbcjNpTFfPKXtyQ8X9AHvf3O/ZZIn71Fo12PZppHEOVQ0/wUeuDyHSCxB5Uja
         llC4eWruugWBSVMBJDAV+jd4qIo3cKnifqXOwR5p6KCph7oE2RvQK+i67sPgUNsD4KxQ
         CcV2/803KJ63W0YecFJkfvNHr+ZW0rIZk0iH7SJAoKPJI+NeHSu2g3DHZhglglovk+zn
         Dl8wESBIXq5rxRmL3awjZjxR2UszfFJiuPc2/I3TrT6eayMKP9O1MTuvovGAgaalndxt
         UfnZCUx45G3EL8wCEUsZE+KiA+8EA9v776FiMuywsBGCnEFcHeyNhkwrNMQHE7spUy7h
         4rWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127499; x=1763732299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSTuk6bpUxNwcbGpcQuPugEknybGUY3HH6kETf+pWJA=;
        b=WwzcSTmKBrcwEJl6Zj6SCgOVJFbWX1jgYF17Pnr8j2gbhfuadMYArZfxN6IkWN6zEc
         onqVQid0BF4ezGl7NwgAvalPldw6cSH2F/JBtJw1xuBMzfhOhMoam27eEZdRb51YMbkD
         TOTexJqCnd5aPQYTSnjb9m1kTczSzZ0v277zZsR9O9G3KE2SF0fdlfPuOwu5jK4w347C
         9c9Ojlb3zHO/5V6cdIBXh6w7v3WVlHgVSR2MGn9YcuvNkD/u34cIjsIicvdrK4yufo3Y
         zAguYwYTTuMAbvUTya5mvtaZQGCwftNFZIf59PKQ3pdZfN/TO6JqCM+wkzLZ+tpS69rr
         +xBA==
X-Forwarded-Encrypted: i=1; AJvYcCXISIHJdPyjDd3B3dLu9l0ovcZfXbIj/s+dfbXGTel41yS+9nxxU0rJF6LExN2eU6qRzJY1NAhyO4E0/2TBrAjq@lists.infradead.org
X-Gm-Message-State: AOJu0YzdRnninTiv+sSh2iLcxDNjqXReGIuO8v1DoEsA5rJoPzvwK8qU
	CiD/NA/uOeH1fEA5xFpogPBbhSE1GzwwH/C3RLOXz9tZ1CllPeyCJxnfCAlqXHir1nI=
X-Gm-Gg: ASbGnctFoDFDC/Izs2cOgCty7tqm5k7JZWqlMEuv+fmFsZH4yDtQE/MXosaLXujCS4Y
	vUvxPwYaLSRhcOXaW5CxE6/r0254Lbuv1VIxMEPriDCiT90y7cRbl/6svETtSfjqMGdPps8gqaL
	sP6KLNbckQObWsYt5BjbLjkCmPNi6EH3npSI+T8GF+b0U6XyxL/i9DsFt3CDLw0XbqfehEqPA1g
	q7+dACA79Kq/6MmK7C97ZiU4ZCxMgeY7ZqLe/1ZTPgVpKwPu3qq7xa98aByLAE+3y4OVPFHs7+G
	zfkZOhc7On5iyzdMq6vO8NooPyjZdmahIW0vJO1+oU6ZjZbunbzDh4i0v6NmZfEkX9+YRNGSmFD
	LOf6SSeel8/guVb9nGN1rZI+5Lw60kWDqGFr7dhmGJyH/OgG6TUxegFn/T2+jzny0OrzfO6/+SG
	7cvrQrw/31lJy024ZpY7ZqcwMGz4o=
X-Google-Smtp-Source: AGHT+IFvKA1+gNZSHXPhDg9R10UrD3Zf0H4eUhPkX/HS+B9nFWrGe5Hu0zKQ0XEyBpiDpJBP1vknUg==
X-Received: by 2002:a17:906:fe05:b0:b72:de4f:cea6 with SMTP id a640c23a62f3a-b736793de61mr322529466b.48.1763127498389;
        Fri, 14 Nov 2025 05:38:18 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:18 -0800 (PST)
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
Subject: [PATCH v5 1/6] reset: imx8mp-audiomix: Drop unneeded macros
Date: Fri, 14 Nov 2025 05:37:33 -0800
Message-ID: <20251114133738.1762-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_053820_461534_E0FDEEE6 
X-CRM114-Status: GOOD (  14.82  )
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


