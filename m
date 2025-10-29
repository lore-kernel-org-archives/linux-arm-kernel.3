Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4FBCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=424Af6Pbv8SbwK0/36n/ieiQLcjf42UYg5pYhDqtE64=; b=NwRmwVlZim0hYJgvevMjXvuYNL
	tcFhR3/wMYttWI2L3wEDweO2Qx/+I8ptEOrBMHdd8KzeoOVxfTDq+bhy69RD6CLeV+zonojG0Dfzt
	KDxcZQGuZejop0AvCxAzE7aK1ZbDPKo0CrWxQE8m2C4NcF/w+S16HLS53GIsJBhP65/50j/abmoO1
	QBCIKyH68MS7I8IAFLeNcRWva0fA6168aHfkopAKC1Mtl0AaEoRIaU300sNBq+6K/fJRyjScZidMF
	whMb1PrPu1pctdfhWFUTDEC/BKjfk0jgog70ZAqHe2Pl/V1udgd/nHHZRCjDNZw5uSu1UGKyBKpXT
	WvgNqGtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6f2-00000001SrR-2jLO;
	Wed, 29 Oct 2025 13:56:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE6ez-00000001Snc-222w
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 13:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=424Af6Pbv8SbwK0/36n/ieiQLcjf42UYg5pYhDqtE64=; b=CbZt40h9hSxjmb4pSBwq12iQzg
	TwLOUXAlrEqBVLHUaepM6mUHjZ71XhbNh9Yj8GCZ0PNNrNKt8u31LMitvvPEOaFed77oEki7co0o2
	5EAA97aC0QHxK8i8Blmr+7KBtDeO30C0D3e4CGPXTlj3vXwkNZG9hjWQo95T67bzeRWvjJJw3iMCu
	eTs8y//JlPCkys4CJFvOV0EfsgnHMP5FGmKeS2ZGgh4HnSPUfoi4R+LwMYXyklGw7R3ww76rXAVXi
	5QVT/xD0N7aS57t4ilzWFPsLzUn5OG98gjbh4zWK8kIH9TrsqmOzfTUdbknN4t6aZw4mBJvC4B5YR
	hyzKe8bA==;
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE5nD-00000006uXG-1BU6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 13:00:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b6d78062424so57345966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 06:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746176; x=1762350976; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=424Af6Pbv8SbwK0/36n/ieiQLcjf42UYg5pYhDqtE64=;
        b=ZCPcbCU0dpPeD+JVqt4igNH89Ex909H/IlDeoTqFIDwwMuuds/pKi+8EdyRGxuoaEI
         b99wsuxqTMZ7mcr8ZYGa9RsRz1hsrJ4oS0fyV22uxNko9YzL7NiZgRYQQDiBPidpynAy
         n9QsSRFO6lT8Aq8XqcvXNyzlysX2HSi6hTRvrBZDXTDQHGaIjocYrzfAoGfuE5vS2MtE
         5DO0dM1SvRdQpHBa/bypkO7KLurgkEZgPpk9mQnw2mVXEoKJhgKJ7fOPsWi3HxjQONm+
         5VDIXQRq0ytkptA7novfHGsDsK5QnNdXasKVKXHB0Rxif/6ZDkFfmAXN4hy8oR3DxoaP
         vRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746176; x=1762350976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=424Af6Pbv8SbwK0/36n/ieiQLcjf42UYg5pYhDqtE64=;
        b=U5JU5dNaA/acrRkGsKGH9L3uk22T+2raYeUVGZNgZrexLfdLuKGEXY14a45pKixOBZ
         oQ32PZ+8KQVObo8HyBcbiPiV3DGcYYU+vGWUFQkhWxqsl2Emp4/MrJn93EQso/eMmdRi
         AmHzR4H2O1jxkb3O8bOKHh9D8kM5j27mEoTZaBX6cuk4qgJRPmXsQElJR8DsZsIB2uZl
         m+SiXYPLp5wrWbInIESO2TcLWuvDEkr2wjcbRi/usWlyDUI1feCpw48wdJ5lNx2cLY1F
         e+GTggBp2wojhJaWEgMH9d8aYAIGpI/mcebdfCKjkumUmlkHJ9pmurkMypAZ+Wa3oAQl
         kt2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU60jzhbvH/jpq9bBNYCTP+VTe7WnbyoBiyGAYRiUXdsO/zfjSQBeY3KEv1k33fmpcZ8ywDTDcablD6shIdEzY4@lists.infradead.org
X-Gm-Message-State: AOJu0YzDc9Gg05S3YwB1oX00OXUJUll9hGwGcNh5OAoJN8VesKkS5PCL
	vFQBERmUCm1QooXYPuvZKfXkR/beZmgWlZc+la/Giee8s4vsIOio2IZX
X-Gm-Gg: ASbGncu1uvvulwGhJ12/W6C0+k3AcjT/riRVLrXgJtZHsKBcobeqOefgwwoynLvRSJ/
	CZRkA3chzjyQVda1LVx3rC6ctiUEPUbkCqII56ccVfziAXgcFFWmGqgmTePLf+atGoEub8Q6V7b
	NbvKyZR8aHLhY2xlx8hMSwyaJpxa0sg6/2LLsI/aMvhPWsEx331Tg0qu+kee1rvORl+3AH/60l0
	GGSVRPmwsWnoDLiCfPsNrYaclhvDlXx5WU8hzKfSf9UFdQkwkInUBP68Foxk9QZ7LeOb5xphuGr
	Y5DGzUk1ds3bLRALbcAYzxf0QCz7wisz5JKNX34NLPAcJblTAaelZ5+jb64lz191YIaKiUAYlGH
	mtoO+2wGRu2H1NQOsLAuKS3s1u5xtby5s/jLu9egjoen2EiWUXMH7blHxbcfCAOELHY5hTNPjy2
	4EvcYCDrmlauiB819mOT4Ue29vTA==
X-Google-Smtp-Source: AGHT+IGW71s06HOeamIvGEWwmfCKA0lO2ind9hiNyNeFinhDdkAcMBYKLqyvdDoCQ0vzL31+LZ8kKg==
X-Received: by 2002:a17:907:1b22:b0:b6d:6c11:e9fe with SMTP id a640c23a62f3a-b703d5b0deemr281105666b.64.1761746176434;
        Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:16 -0700 (PDT)
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
Subject: [PATCH v3 7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
Date: Wed, 29 Oct 2025 06:52:28 -0700
Message-ID: <20251029135229.890-8-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_130047_402648_83596A94 
X-CRM114-Status: GOOD (  13.28  )
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

Support i.MX8ULP's SIM LPAV by adding its reset map definition.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 45 +++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 5ee5a32c6950..4e420c6b8fdc 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -3,6 +3,7 @@
  * Copyright 2024 NXP
  */
 
+#include <dt-bindings/reset/fsl,imx8ulp-sim-lpav.h>
 #include <dt-bindings/reset/imx8mp-reset-audiomix.h>
 
 #include <linux/auxiliary_bus.h>
@@ -17,6 +18,8 @@
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 
+#define IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET	0x8
+
 struct imx8mp_reset_map {
 	unsigned int offset;
 	unsigned int mask;
@@ -51,6 +54,44 @@ static const struct imx8mp_reset_info imx8mp_reset_info = {
 	.num_lines = ARRAY_SIZE(imx8mp_reset_map),
 };
 
+static const struct imx8mp_reset_map imx8ulp_reset_map[] = {
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_DBG_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(25),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_RST] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(16),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_HIFI4_DSP_STALL] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(13),
+		.active_low = false,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_BYTE_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(5),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_ESC_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(4),
+		.active_low = true,
+	},
+	[IMX8ULP_SIM_LPAV_DSI_RST_DPI_N] = {
+		.offset = IMX8ULP_SIM_LPAV_SYSCTRL0_OFFSET,
+		.mask = BIT(3),
+		.active_low = true,
+	},
+};
+
+static const struct imx8mp_reset_info imx8ulp_reset_info = {
+	.map = imx8ulp_reset_map,
+	.num_lines = ARRAY_SIZE(imx8ulp_reset_map),
+};
+
 struct imx8mp_audiomix_reset {
 	struct reset_controller_dev rcdev;
 	void __iomem *base;
@@ -179,6 +220,10 @@ static const struct auxiliary_device_id imx8mp_audiomix_reset_ids[] = {
 		.name = "clk_imx8mp_audiomix.reset",
 		.driver_data = (kernel_ulong_t)&imx8mp_reset_info,
 	},
+	{
+		.name = "clk_imx8ulp_sim_lpav.reset",
+		.driver_data = (kernel_ulong_t)&imx8ulp_reset_info,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, imx8mp_audiomix_reset_ids);
-- 
2.43.0


