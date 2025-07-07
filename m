Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF0BC83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nR7QgFUkw7RoWN72KVKLvsWt9CALHQJ4apvzKDpFkZI=; b=PpuyFpdaqPN/XHpshjzACldw4Q
	SYbdjKCxRQxjcEBI6I1e5TGw5zlqnkEq6DbZA6BRWzA+W3PCKNBHAPUL2v7TCNrbQpYQnKXi9SeEC
	OUCygFWFdw1wv40dkX9N4SN91CU4uUJjUKfVFogPNcm7ZvLEZaTOp7oQmdpb89W2x75Ow6+PR3uoQ
	U9lRjcNBiK3cphvpB7pUAEF1sCoGu7tL6c3bGkY56e9bMJlo2nPgOsoWFm3n0TmUM5bQSXva9U8BY
	JEZI9hi+qAJ3DqNF02hnSB3T+y2kWNSX1pM35HF6engyvq3XwggAX5BPvUmF5aqjNtMm2sX2kjd2/
	3OmA1cjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYveb-00000003oUt-1A58;
	Mon, 07 Jul 2025 23:53:45 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvXn-00000003ngx-3uTS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 23:46:45 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo6125929a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751932002; x=1752536802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR7QgFUkw7RoWN72KVKLvsWt9CALHQJ4apvzKDpFkZI=;
        b=eCMy5or0XCA3zeLQZU6EQcGrK5RP82PYSJ09TG/tXp9F7dTewbI0wY5J65+ZUS9KeM
         ZJFCoQN2eUP43OdF/gwHhp8Vl/u2scqF+oVUjlbxsmOXSP79hm8Pxoc/qedfcCpH9eWm
         vhFgX3kHUqVs6gHgg95WUbzreUTE0cQLAkHytSDBXVY897sP6gs2mVsVlGiPBrunRld5
         O4gd5xpsBJV6MeBsIsJkIxv3HztQ77GIBO7aaBts6xpjNYUUkx1On2P74eb6Gnv98knj
         CvI5u2wXWnus13ubNvpFV5I5mDqh8ZSClbECMIOver7FTx3kupLCu87LWFHjTAc0iZz+
         MRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751932002; x=1752536802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR7QgFUkw7RoWN72KVKLvsWt9CALHQJ4apvzKDpFkZI=;
        b=jSTtY7DGBeYOWcrQ8y/O25oy0rb/GZp8KwUPbFRP5Kx9zY+YW1KVRnRb9fMM6wgKhJ
         xkZbodsavY/ZAfkTC8e/fz+U241+XegpWjiiOEjEFZbZmsI5pJ9shahraV1j9zRlItbk
         LykZXCnP48m5n3DaKLNJO4H4zulNi9hT1lB5QHka4TQcqFbyA7KojGeTqMbCgr0I0Uyu
         AN751QXIjod7/UFLzmvzXONpyH4cWldF8artbxw+hRF6FXCrRaxfReIX+IcBqSp7YoEp
         3Z4lymG1MlzpB530SSee2WgVwTswpe4RE8G36KHoJLXlaBRaF1e1Q+fbTbObV9BH7tOl
         GdbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUcG08YsHwSK4OMfmt5WRKRKV3gDdYqpsLkmT+MeHEIGZgZnaM2uBUyHjx9/v+8YL0/v0gbwyqzCE+ZSu8/0CL@lists.infradead.org
X-Gm-Message-State: AOJu0YwD9RESdj+TktKqHUJ+73UpY6SdKUQ5bpqkGUA2oxSM8kv/W0Kf
	Pu1/VWILfTnDM2tITdZbEGsxxx9M9Nyo/Kv/ZDr2E5ictY2ylEX6DkBs
X-Gm-Gg: ASbGnctAjkhloAz1Oy7+SQB/fjsm7MMwVhjKgUCBoEClQ2AtcEfbwMUyR/NmnkSb9JT
	bzRLzNzh85mN/H6cOhk3hc3jNo4vgf+Kfy+mWzrOi5REDS6ggUKf17lw+gW3RBUC9unYfrVUcUk
	dovouPEls+TBiro19mA9wrsl37fuYwDkjdEkCI6qRh8oplEDza4t6sFO6OXt3qzO70xCr39lfP0
	YPXZk0oNao1FqbWcnvcSzm75t2UaAwabg1+hvsIkz6W82OIvBU5/5105yk6O3H4y8mu8+nPJzU8
	i4GYyoq9KuYBKcWAvsT5yvRMhw9AtBpcEkFg50ycGLKsP5YajX1PHJDfssVsvuVJTq+kIB3bkC7
	p2fZE1UrW1iX+7x0P8Z0pgDY=
X-Google-Smtp-Source: AGHT+IFbP5MkFe5LRHOPeI/e7qFg5vW/o+B53HDzNs80P8WQiqFztlyxMrGhQsVTbOFiRGtjwCCOMQ==
X-Received: by 2002:a17:907:608e:b0:ae3:bd9e:589f with SMTP id a640c23a62f3a-ae3fe7b4b5dmr1450488566b.38.1751932002093;
        Mon, 07 Jul 2025 16:46:42 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm781539266b.7.2025.07.07.16.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:46:41 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 1/2] bus: imx-aipstz: allow creating pdevs for child buses
Date: Mon,  7 Jul 2025 19:46:27 -0400
Message-Id: <20250707234628.164151-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_164643_970988_20B34D29 
X-CRM114-Status: GOOD (  18.05  )
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

devm_of_platform_populate() passes a NULL as the bus OF match table
to the underlying of_platform_populate(), meaning child bus devices
of the AIPSTZ bridge will not have its children devices created. Since
some SoCs (e.g. i.MX8MP) use this particular setup (e.g. SPBA bus, which
is a child of AIPSTZ5 and has multiple child nodes), the driver needs to
support it.

Therefore, replace devm_of_platform_populate() with of_platform_populate()
and pass a reference to the bus OF match table to it. For now, the only
possible child buses are simple buses.

Since the usage of devres is dropped, the complementary operation of
of_platform_populate() needs to be called during the driver's removal.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Fixes: 796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge")
Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Closes: https://lore.kernel.org/lkml/5029548.31r3eYUQgx@steina-w/#t
---
 drivers/bus/imx-aipstz.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/imx-aipstz.c b/drivers/bus/imx-aipstz.c
index 6610251f41c7..5fdf377f5d06 100644
--- a/drivers/bus/imx-aipstz.c
+++ b/drivers/bus/imx-aipstz.c
@@ -26,6 +26,11 @@ static void imx_aipstz_apply_default(struct imx_aipstz_data *data)
 	writel(data->default_cfg->mpr0, data->base + IMX_AIPSTZ_MPR0);
 }
 
+static const struct of_device_id imx_aipstz_match_table[] = {
+	{ .compatible = "simple-bus", },
+	{ }
+};
+
 static int imx_aipstz_probe(struct platform_device *pdev)
 {
 	struct imx_aipstz_data *data;
@@ -49,7 +54,13 @@ static int imx_aipstz_probe(struct platform_device *pdev)
 	pm_runtime_set_active(&pdev->dev);
 	devm_pm_runtime_enable(&pdev->dev);
 
-	return devm_of_platform_populate(&pdev->dev);
+	return of_platform_populate(pdev->dev.of_node, imx_aipstz_match_table,
+				    NULL, &pdev->dev);
+}
+
+static void imx_aipstz_remove(struct platform_device *pdev)
+{
+	of_platform_depopulate(&pdev->dev);
 }
 
 static int imx_aipstz_runtime_resume(struct device *dev)
@@ -83,6 +94,7 @@ MODULE_DEVICE_TABLE(of, imx_aipstz_of_ids);
 
 static struct platform_driver imx_aipstz_of_driver = {
 	.probe = imx_aipstz_probe,
+	.remove = imx_aipstz_remove,
 	.driver = {
 		.name = "imx-aipstz",
 		.of_match_table = imx_aipstz_of_ids,
-- 
2.34.1


