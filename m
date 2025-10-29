Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BFDCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DWLsbyIMgrO4Anjvx4doEaIEZAGpDh1hvTWQGxqxKac=; b=1MHTk3qJGhC74j4wTzGPgbHkap
	w55xuIdwvZEfCjrdILiWaZikrbqqCouWLw2+GYNkN21Zrb1zs5/zDYN7LV3sY5iprHICMmjdIkUnz
	w9oH/N5w/wGYw1fyDDauSKT/ZfZTCpEMhByyy3gFt2nZdDD9sUY2krJNpoyRjmI7VgQxq1NnxBX6z
	H2D3YhiK4b8Z9ErLR+3vsO58rQwru53c0W75+Fjbl7YUoXUvlaLSaI12+/rAUnsbWr3KX7Uzo46GK
	lO5CaQxAOychRJlSstk9yHgZSnzH5+6X9Etj6cON7/qF9hGzkio/Son2hDQB/9Y7ysAjQ7B+VOtvN
	+DGAx2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6f1-00000001Som-066q;
	Wed, 29 Oct 2025 13:56:23 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6eq-00000001SiS-1OeK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:56:13 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b626a4cd9d6so1507595866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746170; x=1762350970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWLsbyIMgrO4Anjvx4doEaIEZAGpDh1hvTWQGxqxKac=;
        b=EahnmY44hFsrKTEncR9lbzQFkvQJu1uhvrLzG9ThtBh7THxrD1M90VTWuZVPS5ais8
         U8pqmDF8rMWt4PNt5HTVct8GI6i91s9CxJfqL/r39u+o0q1/9jGsr5nMQiiqhGrK2cS5
         OuR139EULk31bhjOOKX89febmFcQHMorrTL8Um681CT6NhsDXep/FHqaQBQM33bCxz24
         AdzE6+nUj41yKldD4QVhdkOFUFKV1SIct2xCnkrdukwMbR6jH6/7kT2uf4/v4WuSL1Tp
         QQBc5zpVpO3ASWWG3b5U4AXepbqFZuPnzOgY8DGdctrSowFvSLer532SzmuDStUwruDi
         IOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746170; x=1762350970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWLsbyIMgrO4Anjvx4doEaIEZAGpDh1hvTWQGxqxKac=;
        b=lIDgrr8pH7/COoED5OuwLLJ1UtBCShV1ImsUfjyBU6tmUond5sVlmIUAoYoPAqJjhe
         c1oBHTcxgUv1Vi41OoHrBLB2zRcTWD24+/gQ2FT6k6lM05KqAxlceu2Uopv8gxqHjp0+
         YJpBaraRdD7S+mUyi9h/u8+JTnmZ8/x4E/5MINfj7B957/iVKiUP/r5DBE9mRacWHeoZ
         Nz9kOk8oSFePQvEO14xJqoYLqyOa9+4p2NEsRH+DTzAZrpfQ+1A9xouaN9g8uT8Erbd+
         SX7k460ujqYyZ7H3VD2S6nmxH9GEn4QpmTCJPiM4fBL5k2GmRxJIjzrEUUlyr55kwW8B
         2N3w==
X-Forwarded-Encrypted: i=1; AJvYcCXIBwdakDwEEQrVb/MrVzens/nEayd7RkJ9FB8P+K7CZvp9KDgRdfgobXOEm0HA1vmbnG46NLNpY5Ji5+ECkdNK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9wvqfVrpFacuFq8Ja7xAG9C+prFQZlwn+Q+p8eZ53zRmkndIb
	BMDcMCOz8iW+7nsy+yYFPcYO5e4JMHt6h6nwRLYEJnXLGYdTxezpUjx+
X-Gm-Gg: ASbGnctafYAgWsly2ERhPTwTtP0PbIYLwvkyAAfpvy88lf6wQO7p6JMQ5LcLRiT5UoC
	esttAlYMfYhtad/G+ondo4IFCdBiudgp/YrkKZLnHh/ily6zx//anJWbe41qeZYtk44bwNfknNf
	UUnTwn7Ddx9XNv9gYWGxNjV7aC92HIK72/FsAIkmtrxzA5CuYr9W3u/EsbT4fj73JLymAl3JhxZ
	LINtK6Ts35NuQ2zN2cj7cjYFk2mCXvtcT/WIDXz1V69DtQrDqWs6v3FLCqsreCWV4JhRALMPfCf
	EYg/QEjUVxuLatMOjEp5LZl38faDvLi/5R5oqxxFqrr1EFdRPX7Ft0pKX2gRP21zxqs2McZm24A
	4yqBYuYDdXfcf3BfuBhnXcYRTADukGtW8PEHt43gPOIXBaPAzylr/4zKOWk4tFAnStkAhLX4ta7
	PZZbZgCBuSRRtjsNjHCYSNtMAimQ==
X-Google-Smtp-Source: AGHT+IHsIhczBnvh9jDdmQP7dI7sF9RIy0mdsWyOBSP3lJT3RdO+FroC0QNH4bBEw0VRWYxAQ/wuNg==
X-Received: by 2002:a17:907:1c93:b0:b55:e023:5e79 with SMTP id a640c23a62f3a-b703d55cd84mr342463066b.51.1761746170153;
        Wed, 29 Oct 2025 06:56:10 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:09 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 4/8] reset: imx8mp-audiomix: Drop unneeded macros
Date: Wed, 29 Oct 2025 06:52:25 -0700
Message-ID: <20251029135229.890-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_065612_492961_2859BA52 
X-CRM114-Status: GOOD (  15.65  )
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
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index eceb37ff5dc5..e9643365a62c 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,11 +14,7 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
-
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
-#define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
 
 struct imx8mp_reset_map {
 	unsigned int offset;
@@ -29,17 +25,17 @@ struct imx8mp_reset_map {
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


