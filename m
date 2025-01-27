Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EC0C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oUDNS0fcrx4OaYIBd5riS15Hnp2550FLQmcgRsJgyA=; b=ZVsbFd+doTvAxVLUz4jQcU/s4M
	AjV6i1jjLZjtMde2Q2f4Y//bjtAF6MLrYWYTBebODbbvjHYhPrj8sB8M/sBvp3fwELDq2dwHzlrzB
	skGreXc0l7Eri8y3WLFd06VoSDN0Fdpq2Q65BjRT5+RFPUengGIMZ+iDgA5RtPH5M/eukaAkK42hI
	K7aMVARh+S+4XJHG4RGNdpyKNGRMdgQA2FhsgB8m3dXeuGs9yXUApx//6kQm5MXK+20Nr1lSPOMeb
	wc9gusvOvzNEKumo6poLn15XW0lFrW4iL6wPtUL8/CE2hswnF4ppm+bVfGUsIYGlBfbc7RCrUDvsF
	kkDOrtEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOhg-00000002KKO-3wfV;
	Mon, 27 Jan 2025 12:59:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVq-00000002IIv-3IRA;
	Mon, 27 Jan 2025 12:46:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361f796586so47707575e9.3;
        Mon, 27 Jan 2025 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982005; x=1738586805; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8oUDNS0fcrx4OaYIBd5riS15Hnp2550FLQmcgRsJgyA=;
        b=bqK3UsxuPMzntRVhNT+kZMUOhWV/nq+CUlce1sbAhhDUbyK6LBcf3nhwONWZ+fi17j
         aKFPjdpo4fATDRKBnMxIISc1KkM51pgUoA6h3Xf3OOlz0AlxnP2pCjqp04K+VdAYiEc+
         yqM2MXIgvnBtPpPT9EvAJj1CSqua9RnA4OAY47KiECEpaleW/QJTCf5OnpFCOtJwHtWv
         jVYeQq72Z/q5btz3Q9BssNVm/6hoeO3XtId+QCEWBB8S8NWpOvnqx3WaSpRifkMPWofO
         Kogk0KnwSDhE+Rn06xAtG1imyfnDGbW58dh2T8WGZ9VQACMxQOK9nBDulSjc08ON2kdR
         vWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982005; x=1738586805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8oUDNS0fcrx4OaYIBd5riS15Hnp2550FLQmcgRsJgyA=;
        b=FH+tq6LF5iGDJO39HL/d5VQGbUAGWp3DxG3Q0psOS2W2EW2esmvdMtXTCkq2i3LG/T
         p8jS5pVQo0HQCygFd8nJ7d4pi5JGWI01z/TLXij915UYIHAEO/Eh49DUD2HaB3AA9/Zj
         9IZUA3tauh6hVrvJ44xrTBpbda53cGiYUCTPjd9oQXJEFRszS3PLndJLoxUTpTAfVIzj
         Maa+PBLrzY4PptOGmNmKmj2tZQMwqvvO9MiyMaUoJE7DAu1912fYNaxJPWJvT4DFRVE+
         OU2XNl+cQxnuQwZqRKVeIzR319XGAtxkGD4Y8XfonFLDPQgyhCpWrubHbV5KfKdCwZH/
         qMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Vout+YlTsF8YcHPv7iu7ap2O2OhKt18h3Hm1H4eqABVNStkb0xMdHW/uJIPACTbewJIpQF4gTRycSIrCbB/O@lists.infradead.org, AJvYcCXuRBaNFv2oFnaRvmjNKDy9OuN3kFAsNNODG0Z2F63a+TsITFM6SAMPDjrwgJ4rCGYgu9kBUkBJaryVvfwfvWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYaCVOtq14laQXgpfjNON0ywgxu/4cFRQQjg/pP4aPJuVrQIin
	cnpZqxKQSJ3OnOUT+6w925l/UAUjNIEuUhJTKpYuftWnIix8/k8G
X-Gm-Gg: ASbGncvqyPgTCr9loljn1wk5cLPim/4kQLaIQdVSu/cDetITp1agtY7wBIyYHLD4UuF
	aX+Z0NG91HubJDnBsL3G41jnsOe0UZHEuYNycbU+QAHwP3to5p6XYpsNL/YaOwXhDmXBBJV8s9O
	k2Gzq0QPOZLJn0O3cmX1VXB++QxCMTxM8qCMKioZo4nT1UusuLVdpS0e35PX9aSOFMMs+9m5qcI
	/08wnMSm7cQlYFSpBR/pg8KYsK16sV+ZM4j1tU+L3ZF5gH18gTPSzuShSqZrHkgiwCOtXDcN1Sn
	ORV/
X-Google-Smtp-Source: AGHT+IGGlOON38G2cwVHy7HWLqeoiprbbsYzb+R2lpZBxzMcoaBGttOdxBgPJKnbhKhubtPPASJM/w==
X-Received: by 2002:a05:600c:4ed4:b0:434:f586:7520 with SMTP id 5b1f17b1804b1-438913c5d53mr370329335e9.6.1737982005060;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4212sm10639980f8f.87.2025.01.27.04.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:03 +0100
Subject: [PATCH RFC 08/14] ahci: qoriq: Switch from CONFIG_PM_SLEEP guards
 to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-8-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1535; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=BVe5T/T+KyUbuPkxpZh30Ji3hdJ098Bkd+OSL6K5mXQ=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4Ar/8OCYLq0jyRBQ+Yjy7zx+LAyAdn2J69PD
 7OGj9QKt02JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tVr7EACtsjKfesgoSAqC8UkGk7ueOpe82d7ckBOhdbGJnRi70fcUJQSY/kkf2Hl4t5wHe/cVsw/
 vS6zV6opL0l5hPIDzCGMq3iWUg/vFwAvE/v8B1UR/yGTY2Bw++rPjRHqaGM324LXK4iroJNLFED
 6uknhnXagzGruwoKVaNdHR2pDsajddGRtyos06fe2FDnaD9SEajOqAyL42qE+SiXTjK5zKoGXYC
 +BDknQG7waEhlDM1cQbUOIS+C1hfS3mD6tfgYBVfg3GZ7sWUxMX36hAKZr8bpChDQf/OPg/oziK
 GvkrPLOT9nGptYxN1bVPuy+RkXFAIEKb6MAC69msd6BhCy8SWKuLiYs8o1VLqYMXVOtsR4hOHY1
 Ijzl8dBxc7zrV6+WoWyRYJX16A59r2Tvn+jxdIh+/ZKtPJ1MIY9o51uahQXNsF2j1aZT4hQzXzj
 0p2crfx2gWw2Bpv+qSu9O6aEqupWvQPhwYT4sgNwrAfrAXo67VlhsIH4JJnSZ8LBUjEyJmqfcSN
 dPV+nN0tafh4c9lsamiWYfZcYj8FwEDttEUyJ0FLlVUwQ7RQcCe+ucPKcOWlT/aB/GcMUDHHo/x
 hTUM5LB+5EnSwNbvi4q3t0QvP77e4p8gjbIlgmjgEvpgcu7yOkvMWVxVeFrfSuVUmnQa+cvQ/Od
 MEUGJsxlPSjYVCg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044646_829992_10D77151 
X-CRM114-Status: GOOD (  13.65  )
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
 drivers/ata/ahci_qoriq.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_qoriq.c b/drivers/ata/ahci_qoriq.c
index 30e39885b64edf9cbb1eeca853659582f5296361..5f64bb8cd2e9c8d34403f76e5789fa435dce94ca 100644
--- a/drivers/ata/ahci_qoriq.c
+++ b/drivers/ata/ahci_qoriq.c
@@ -319,7 +319,6 @@ static int ahci_qoriq_probe(struct platform_device *pdev)
 	return rc;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ahci_qoriq_resume(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -350,10 +349,10 @@ static int ahci_qoriq_resume(struct device *dev)
 
 	return rc;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(ahci_qoriq_pm_ops, ahci_platform_suspend,
-			 ahci_qoriq_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_qoriq_pm_ops,
+				ahci_platform_suspend,
+				ahci_qoriq_resume);
 
 static struct platform_driver ahci_qoriq_driver = {
 	.probe = ahci_qoriq_probe,
@@ -362,7 +361,7 @@ static struct platform_driver ahci_qoriq_driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_qoriq_of_match,
 		.acpi_match_table = ahci_qoriq_acpi_match,
-		.pm = &ahci_qoriq_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_qoriq_pm_ops),
 	},
 };
 module_platform_driver(ahci_qoriq_driver);

-- 
2.48.0


