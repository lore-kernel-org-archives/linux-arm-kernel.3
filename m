Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27534E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 17:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VOk2x7xENmwEqdSaUTlpdBQVwEKSsAxgTnKrDsGxtIM=; b=ZNLgDN7rdy38UnfRoLL6qLIspk
	pE6fRwxGsBAl5jEDobKKkNOw/XZLcsDlPaLanJTJb3kEhRhxsi+kPL7Yp43/pxoGWYy4YXW5BZ8LR
	HomhyRE7FDehJlnNOwfQRC3nrHfQ6EXwRuuBpijuMsFUPYTRQP0aHZfYnsKuNNE7z38e+SK/4OXw+
	eYnZXZk6PgAXmuu+ZPV/HsxoI4sTtyzftivOj1ccjmyLZ82V0K/ZJ+ma9BTz6JAvaxoa2DcZop4Nk
	cmw45sDg/y0UlbBIfXCyhTdTL5QZwmkuVhFz6NmhmOOL0o8ZZH6rXbmMyyWi9ueJIwEb/CLpAvMMo
	zgaMGCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwl5-0000000CvGp-0xgf;
	Thu, 09 Jan 2025 17:55:51 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwjr-0000000Cv1i-0Hjy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 17:54:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43635796b48so8319795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 09:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736445273; x=1737050073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VOk2x7xENmwEqdSaUTlpdBQVwEKSsAxgTnKrDsGxtIM=;
        b=TiLMMC93haLvfHD8pPIsxy88Kc0ILNevxlCjzdCEtlAHzaLsKVtUWOJKpLxwt9gYuS
         UKkWuSoVWe16AUdpqA+8UFWiXK3AesTDVkn4DaPWjclwm8b/GcBsaDFyz4nel+o4pKEE
         UoWI6rk4aS+Ut9wwPIMYr1kgg7xOwXybBoa2OLUUiVtI5qL8IwigEr3ongbn7An4Z/G9
         IsYx1hR0d9kZ9xpa4hzOK2euppI2LHagrP2aBRkIioZO7y7rsVfjLArgaXNLxPz72TDb
         uTSKkfm5Ewbf4ar1SZ0aW/EzTkAZiMuYlgxuDYpZaCkKxXYe/I3nYqip3LiRrUq/7pcs
         QwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736445273; x=1737050073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOk2x7xENmwEqdSaUTlpdBQVwEKSsAxgTnKrDsGxtIM=;
        b=ehpP/cwCpIBKBmXlfOJXt6ldYTTrg6V5Tqy5Njr07xg02JdqLaDwBWHIX+vQKFCpir
         zYFalKLPkocNjK850nB52DzQdOg0GQFKu6zvGa1V+8GwiBKucmlrswWyF1uy94p/FZIS
         VNUGpbNeBzATGO95Z1Hv0RX+sEVF3u1KJSb/+PaZIldxlXzQrlZohSt971D7fa+MrFZR
         rCOV5RyKUJpNrKFMpMj9I4eEKLNpgEkwOfYc7sQZiVHGqtV6qJQ0jENynqjksOy2Q7vL
         +scKVZ9mTBp7niAS/Gj2LfZDReK0UmkL4v0PdNYxKxUpSp6Tmx9L0211aKetD7SNlu82
         fmhg==
X-Gm-Message-State: AOJu0Yws5hw4CNSdm6wT5aisFHMDkLg6C1N6eHlJktm+VWT2W4A43HNz
	0AE742nmx7gaPeNYYbXLsU9Yn9aaaagp/VLNgu+8DdqesnWGzUpNQREL9w==
X-Gm-Gg: ASbGncvVlwvAV3C9x6R6wSNCpElBFmrduTssIZGWxhmEyJ2ofxkWaIny5bKThz3YAqW
	dqcJkKuioKH2x7zNW35a4dQ49jLRIe+hMnKcMfFq6zG8JHatZfK4ogrZBSZETFN9k5Mtxc4bva1
	TS6kInwRE44YpTlug5OGwZesd5y0jna8hSWSfN7wUQxZ6UfKOdZxzb3AgEGS4w5ovH9//Kyq/ro
	uNutF9RMadbby4xX3NuYatPbLh4h9soale4IdHGaSOjVKVSvl6148GO
X-Google-Smtp-Source: AGHT+IHGie1IgFEsaAjE8vS5MyvybPqWWZA9f8slWVYYtG0WUXP2nwc2HIpa2oE3hX0LhSOeOIyEoA==
X-Received: by 2002:a7b:cd13:0:b0:436:51ff:25de with SMTP id 5b1f17b1804b1-436e8827fc8mr36979505e9.7.1736445273171;
        Thu, 09 Jan 2025 09:54:33 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da66fcsm62521375e9.6.2025.01.09.09.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 09:54:32 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ahci: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
Date: Thu,  9 Jan 2025 18:54:27 +0100
Message-ID: <20250109175427.64384-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_095435_109374_A1165A21 
X-CRM114-Status: GOOD (  14.44  )
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Changes in v2:
  - Split serie in single patches
  - Remove irrelevant 'Link:' from commit log
  - Link to v1: https://lore.kernel.org/r/20241229-update_pm_macro-v1-4-c7d4c4856336@gmail.com
---
 drivers/ata/ahci_st.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
index 6b9b4a1dfa15..4336c8a6e208 100644
--- a/drivers/ata/ahci_st.c
+++ b/drivers/ata/ahci_st.c
@@ -176,7 +176,6 @@ static int st_ahci_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int st_ahci_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -221,9 +220,8 @@ static int st_ahci_resume(struct device *dev)
 
 	return ahci_platform_resume_host(dev);
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(st_ahci_pm_ops, st_ahci_suspend, st_ahci_resume);
 
 static const struct of_device_id st_ahci_match[] = {
 	{ .compatible = "st,ahci", },
@@ -234,7 +232,7 @@ MODULE_DEVICE_TABLE(of, st_ahci_match);
 static struct platform_driver st_ahci_driver = {
 	.driver = {
 		.name = DRV_NAME,
-		.pm = &st_ahci_pm_ops,
+		.pm = pm_sleep_ptr(&st_ahci_pm_ops),
 		.of_match_table = st_ahci_match,
 	},
 	.probe = st_ahci_probe,
-- 
2.47.1


