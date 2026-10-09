Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2747ACA6018
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 00:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kd9f6IzxLdOe+YXs15sHvBb+DnWpHr6FxR7UwEMv3EU=; b=n4+MDpKHcV6NcLjhJOWTEvF0Cd
	FuvTLZrlA2K73LuG/cs2boK/+yEi88s8vf0dLHJbseH5G+3NwBsakk9rDbxxvSysSzCxdlx735k4I
	EqIFUOM9eYzD65ULGTMFH7gKod0Q4lAe1g//jYfqqWlb9zF4ijWF2r7NpXnjBaDKiKYfbaL9Rh2DX
	XzMGnkVPrdzewLpS9kZTxwfuCnL7PyWnGff7dNDKEg6B3loRyq+r751v8mE8k2qBXLgB5N6gQ3kRZ
	tNRuonfmNKPzy1pXzpGgdvAwwYrtEU7R1/oBDDH/kPsGuHg6B5HDHfkl7UlS6npKyCKYd4zdmQ7Ny
	8WbL/uQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyX5-00000005CS8-37zz;
	Fri, 09 Oct 2026 00:32:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyX3-00000005CRH-1hae
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 00:32:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so49395375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 17:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791505936; x=1792110736; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kd9f6IzxLdOe+YXs15sHvBb+DnWpHr6FxR7UwEMv3EU=;
        b=OidpD4CMrq0IDeZUJ04BfwxVGoKbeYrsSBvkf41/DMBBlFXkHgPYAaO3bhsc2EResH
         pmhhb6sRATtRGxG+934SXHJnF+myVm74rcWhkEWW76VZ2UWPeRJGm/RvJYB1G8ijfEZW
         eWuFayVdxzcZg4bC/4Z2zak7JCmGLyungBTvnZP7LnzM5VF1EANOGrTAw+6D4VDf9Zjj
         5E8X8Dngj4amYTXFHhDdJDiYL8xi2B2erQcKEV/ADPgsY2rZ10Vouc9JYR1w/fFJsjP6
         ByJXN+0N43MmIwJorlhdpWCQsSTFiKQhM1JcGnIJcJrqBs5zZ7IhiWc95UoeHNzTcVAg
         s0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791505936; x=1792110736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kd9f6IzxLdOe+YXs15sHvBb+DnWpHr6FxR7UwEMv3EU=;
        b=EF5HqkhUXcvaQ0pL4P6pHbQOrPjoj0B95ScOuyxrpBEdaFI5T9exCp4frqFlPEvyeN
         oO2CPw3JjiyEVvKH38Rbtg6n8boyijVjX997LD1oorrIAlQHIfceTxorOW2k7iDF0IXx
         b2cuD8X/pzZW2bZ2n1OV6iicFee/CgmEAV0Qj6+uFvgBjpukv2GF5OHjqSp7wLOj9AHo
         SfXpZlB+kr2b41kPx6Xm/itscqQiFzum+2gXXatfmr/2gRwHBZ5AbINBVZji2P4rXilg
         TX/HZL8vBbBWN2f1XKPhq0lpANmSEFiOubHCDPxFUxUk1lcYHkUhKsir0ZgXW+0MAoZI
         9oJA==
X-Forwarded-Encrypted: i=1; AKwUvBzS0ZZsswABW7MN90nAndlOn7iscjinJiLANcia9YGduXlwVY8oUrlk3FqJvH3zzK2WmgQCGzC9sRLLMiCxXAqB@lists.infradead.org
X-Gm-Message-State: AFuF++lQK9FX1uSwDE/yJBLoUD6HxsjChe4exabjwL4ARc1vCg71C/Z0
	vONH7rj0JiHH57V1oTcjzwaDfYx1NhUvG6nh4h4hdia+eQRQCK/hWEbD
X-Gm-Gg: AYBFou35oDRghCbbZktIaNXZKfI6An+BppUJaWfEo9D2TNX+v7mwhm6nsiwvMZCxvqd
	YwMChcGpWz92xXlvvUdJ1zoUW8xEOSVkd+opRrcE++VHMX0GmiBESn5Hl7T+rYJdFs+PguVc9Qh
	u0H/kFX03OPyOY69tEe3+x74al4goB9+vVHV2k5Z0O33ELQvAsTG9d5kvs8vvbeqUhQhCKHXMmm
	Vj1H0l2x8b6pu7eN6x2wp/t7RHoahXVFHIu4PSR2pDKZAF0YayXADAxkHZkWZK60JZQDWVIlE+4
	kUz2cZ74i6Jasbp1fogd3+I+6Zlq6sr+OB6hAu8OWCs+WhFSsKPvZqu8qlis2k46vwE57NH/LAQ
	qJ2Re59Kp0/wk/rRZluVNf1E1+A0BCkg8qe3iQyu2IlwarmqibNWopWQiS7vVmf+h23OC99m6KO
	6S+cXghTJUB9SrraJkxlMRazUC88T21/pDLNwPtLD3oEZN4SdL2/c/8GAUE8ymx3hJKC4sNXL9T
	paI2FfGT3o0F9Uvxa2ok2znXvM5fQDGQONuvrIo8Ezn3GM1the9izDU7b5Tq0gB7vklZDwyjy9G
	3SmIjQaf+xgtxpXjJ5ktpkTfuQLaBloJyKSQxpkp0qbKqJZ6DGXKyA/PKBvxe1uMODtBsqtRPpm
	EE24jD20=
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr2753135e9.21.1791505935518;
        Thu, 08 Oct 2026 17:32:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e33d2sm1133434f8f.9.2026.10.08.17.32.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:32:14 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: sdhci-brcmstb: don't log an error for missing BOOT registers
Date: Fri,  9 Oct 2026 02:32:01 +0200
Message-Id: <20261009003201.68288-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_173217_461760_DA0A3249 
X-CRM114-Status: GOOD (  18.44  )
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

The BOOT register range is optional: the probe function ignores a
failure to map it and the suspend/resume code checks for NULL. It is
mapped with devm_platform_get_and_ioremap_resource(), though, which
calls dev_err_probe() when the resource does not exist. Every
non-removable host without a third reg entry therefore logs an error
at probe time and then works normally.

The binding only describes the "host" and "cfg" ranges, so this is the
case for the in-tree users. On the Raspberry Pi 5 family (BCM2712),
where the SDIO host of the Wi-Fi module is non-removable, each boot
prints:

  sdhci-brcmstb 1001100000.mmc: error -EINVAL: invalid resource (null)

Look the resource up with platform_get_resource() first and map it only
when it is present. Hosts that do have the range are mapped by the same
two calls as before.

Fixes: b7e614802e3f ("mmc: sdhci-brcmstb: save and restore registers during PM")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on a Raspberry Pi 500+ with v7.3-rc4: the message is gone, the
SDIO card is detected as before and Wi-Fi works. Suspend/resume, the
only user of these registers, was not tested.

 drivers/mmc/host/sdhci-brcmstb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index 1de2f05..7c17a3c 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -491,6 +491,7 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 	struct sdhci_brcmstb_priv *priv;
 	u32 actual_clock_mhz;
 	struct sdhci_host *host;
+	struct resource *boot_res;
 	struct clk *clk;
 	struct clk *base_clk = NULL;
 	int res;
@@ -534,9 +535,13 @@ static int sdhci_brcmstb_probe(struct platform_device *pdev)
 
 	/* map non-standard BOOT registers if present */
 	if (host->mmc->caps & MMC_CAP_NONREMOVABLE) {
-		priv->boot_regs = devm_platform_get_and_ioremap_resource(pdev, 2, NULL);
-		if (IS_ERR(priv->boot_regs))
-			priv->boot_regs = NULL;
+		boot_res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+		if (boot_res) {
+			priv->boot_regs = devm_ioremap_resource(&pdev->dev,
+								boot_res);
+			if (IS_ERR(priv->boot_regs))
+				priv->boot_regs = NULL;
+		}
 	}
 
 	/*

base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898

