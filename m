Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E837CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jp3aBA3u4fWo7xiq7xdD0SMcDBXI+jskP2t4r2Vw08s=; b=nhiAVg+hVrRJ/42d5sCmW48MGS
	+yxB5bRwTuMLQ7ynZ0/RubsmGW9XGdtNjJgfJx8byburUJI1ifxBUuZ/mZKNHn7pLkwnZwbWL46AH
	ioA0VEeniNjJucVi2BfshxfSuU3S0eSuoLKcvbgo3Flf0aKh5wdvHLzFSk7Tedzn4kUGytU9Xs/Mw
	/+NSHxp117z/1C/5xSwzTjAwAuKzyT8SYz0J8JR5aEpsUcoDbSOYbt3TKhAk1Zhw3vWflTtCxUSlM
	bfHgV/l7BznAKW3ef/pFubDwIity8VC9fRK2GPNicOdHPV6UylMdQIoE3/N0PXqqvT07bkryIE15g
	+ZFqNvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7o-00000003YnN-1Avj;
	Sat, 08 Nov 2025 23:13:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7i-00000003Yeg-41v7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:36 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-64080ccf749so2955795a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 15:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643613; x=1763248413; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp3aBA3u4fWo7xiq7xdD0SMcDBXI+jskP2t4r2Vw08s=;
        b=dHmkxpTM3ESsnDkMjMdmNNcojyzhAZI2kOk2Ccw0WDx0a7WBGWB7IGLVLRLiaH+qyX
         LQkwYY0qz7rUnQ7D+mgQkYgt8KhZ/5QKodm3CqTdIvj3Avb1EHzoa5S0rtVljrVJG76T
         yQeaMvzmzyilwmKD31N/ggisVQ+zRbOQAUwsAsi8LXBNAF9Tc0o/0Au0UhJbPWNuXM5O
         BiSTgcsWmOmDXiXtSYzAJb15Zv3I41yVPZUbOZbsAxhQjqkbVbZAnznGAYw8sMYbBK/E
         Qq0IwK2+7U8CgxGWV3X8Et7nW2u9zVDsnNqkLwh8MyAZgtPiPhkgntAJwli4PkfsdZhL
         do0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643613; x=1763248413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jp3aBA3u4fWo7xiq7xdD0SMcDBXI+jskP2t4r2Vw08s=;
        b=EXSN5mM8dpWvWRqJkzhskYYLnySus7hGBOV8WheFvPpflppTmA7VKnCOeUB8GqOMRO
         9RDxPNF54AsV4fRfBDS3XPHOz4ncZ6m4pbPYXt1n54j4wtcDk9ngooDwwVF0/DcHNR9x
         tP2jmco5HSOpiSuLrsX6lfdps/Ek8QwAh5GccHhPCfBBo8DgBZy8qwiqB5PrSe1V09ew
         ThhVxvoFppwsTEAvatZwwj6nrfuoWiLcHSzp+iMKytAPhI4xmU0W2Pv5/0kma2cCKQo3
         0z4s76IhgOCltsKZ9jeQzUWDJ9u9v3kl0GZ9cxzwJhWpJV+BIbqw2DuToT4CywsYrPEp
         YN6A==
X-Gm-Message-State: AOJu0YzUWPVQi7oLTY6UA/0wgz8K6k7DgMEmP1RIuQoeUBbApUSDvwf5
	0EZfMUrP0bWf57Z6cu6MdwblKBlQFHDZ56cYQaFiNltqwnDnp3macSwL
X-Gm-Gg: ASbGnctUlPOB73nwdCg6jpJuJfzGjfAef+yyRoYtOTWWNxak3AJi87f2kC/7pWbByPt
	ysxxIu73Hf/mnc7lA7CAdBat9vzgcIrEvBA0zwxJE84dfHcljW62zu6PrIJqkN3pYlTx0Z17It/
	/r+y5z1cJTwZZJtzL4rk4kotkwvB3bB+LI3ZsZGhoXB/dCg7taHjcka5DqQBAhDqflaz3fnZx9s
	WQ6RydgDmIdqpoczxs82g3K3nV++Xd0sgtn98ZRI2VGI5HcWLdDCodWRtmqE9Er8A2R0sFjBFAS
	tmhRCkvP1pX29xcGLlSabg7oR72ymVId/quX80z9/URm+LWjI7w1LH5dr1JIdyEIdxu1kYZdJgv
	20LuN4vwvD62RIi6TDtui/J9hijQ/ZgHFijI56Yxj2QiLbgwcgwyVzq/2rLzurK+qc+2PtaZdTN
	NHZAkOXyAhRyjyiajapmuRkOWAm6O5b3Ov7IR17bnX7CB8N21Qqfi61qxJc9Nc4j6hVY8gwdf2P
	RDNiKU1vVZq5yJjwbpgaTeEkGH2BbT4
X-Google-Smtp-Source: AGHT+IGemsR0OuxveqoCLuvT35vA4jAjT0f4VTJglt6MI1GNIHLfcz8g6Jk7qZLukmNg7JdbfDQkvg==
X-Received: by 2002:a05:6402:4415:b0:634:6d87:1d28 with SMTP id 4fb4d7f45d1cf-6415e856c10mr2612380a12.35.1762643612939;
        Sat, 08 Nov 2025 15:13:32 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:31 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 7/7] mmc: meson-mx-sdio: Ignore disabled "mmc-slot" child-nodes
Date: Sun,  9 Nov 2025 00:12:53 +0100
Message-ID: <20251108231253.1641927-8-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151335_032868_9C5765D3 
X-CRM114-Status: GOOD (  18.87  )
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

The meson-mx-sdio (and mmc core) only support one MMC/SD/SDIO slot
(device) per host. Thus having multiple mmc-slot nodes (one for the up
to three supported slots with one device each on the meson-mx-sdio
hardware) can be problematic.

Allow specifying all slots (with their respective device) connected to
the meson-mx-sdio hardware in device-tree, while making sure that only
the enabled one(s) are actually considered by the driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/mmc/host/meson-mx-sdio.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index e8b63dc45dd8..5921e2cb2180 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -493,23 +493,30 @@ static struct mmc_host_ops meson_mx_mmc_ops = {
 
 static struct platform_device *meson_mx_mmc_slot_pdev(struct device *parent)
 {
-	struct device_node *slot_node;
-	struct platform_device *pdev;
+	struct platform_device *pdev = NULL;
+
+	for_each_available_child_of_node_scoped(parent->of_node, slot_node) {
+		if (!of_device_is_compatible(slot_node, "mmc-slot"))
+			continue;
+
+		/*
+		 * TODO: the MMC core framework currently does not support
+		 * controllers with multiple slots properly. So we only
+		 * register the first slot for now.
+		 */
+		if (pdev) {
+			dev_warn(parent,
+				 "more than one 'mmc-slot' compatible child found - using the first one and ignoring all subsequent ones\n");
+			break;
+		}
 
-	/*
-	 * TODO: the MMC core framework currently does not support
-	 * controllers with multiple slots properly. So we only register
-	 * the first slot for now
-	 */
-	slot_node = of_get_compatible_child(parent->of_node, "mmc-slot");
-	if (!slot_node) {
-		dev_warn(parent, "no 'mmc-slot' sub-node found\n");
-		return ERR_PTR(-ENOENT);
+		pdev = of_platform_device_create(slot_node, NULL, parent);
+		if (!pdev)
+			dev_err(parent,
+				"Failed to create platform device for mmc-slot node '%pOF'\n",
+				slot_node);
 	}
 
-	pdev = of_platform_device_create(slot_node, NULL, parent);
-	of_node_put(slot_node);
-
 	return pdev;
 }
 
@@ -642,8 +649,6 @@ static int meson_mx_mmc_probe(struct platform_device *pdev)
 	slot_pdev = meson_mx_mmc_slot_pdev(&pdev->dev);
 	if (!slot_pdev)
 		return -ENODEV;
-	else if (IS_ERR(slot_pdev))
-		return PTR_ERR(slot_pdev);
 
 	mmc = devm_mmc_alloc_host(&slot_pdev->dev, sizeof(*host));
 	if (!mmc) {
-- 
2.51.2


