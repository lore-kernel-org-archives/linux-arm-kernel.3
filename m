Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6D0C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoAOp3woacgQpHd2g/asCHp5UTA4pERK/Ity2Wb8N/Q=; b=2ytVgiDtnKCQ1bANAG/nPlwP3R
	sk3BFXFnXuPetuI7cYHKM7KeUgjo6i8fDwwByAhKAp8z9sGWNYC9ATJq8S1L4pVK5Lv9LG7JQUS9Z
	YVpuHhFNgDdjTkkoczDrZmSJj5AkTrLP4I8rXTfeOPEuoKpnReOz66yXs7XIT+vTV6l9cnPdkoQVj
	QC2ltYA7wpBJ1nyvJOLTjMtMySdxH5rzhlSqMQYUw0LTKEQ9Wf+yUGlpMIUcBGzxKCPUCa5SqF12o
	ue/xT0LCBX/0TgCTdK+vByU7azcNim+ynSJ6gzdPDFzpbZnFFXsVUUDPbxFNThgeUw+6qBwwHQJqk
	UR5Gyj0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOpa-00000002L4e-3rtu;
	Mon, 27 Jan 2025 13:07:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVw-00000002INr-2nJf;
	Mon, 27 Jan 2025 12:46:53 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so50733795e9.0;
        Mon, 27 Jan 2025 04:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982011; x=1738586811; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoAOp3woacgQpHd2g/asCHp5UTA4pERK/Ity2Wb8N/Q=;
        b=Y5JE2HAbUYDOgT3MVQotzHC3NAfYycVUfptxIXLzJi4ls/gv/ysrC5P4nc+WSJsyGF
         tSGeEuGXZvVoFPAeAbfkQEC4a5+zWdlQ9OVN3GsfGSCw22xuBRAQRneWiEzJ0mS0sMIw
         dwenvPnlvt90nvBfTb5AYzh6KcwiDnwdtdQY573exr/31qdxkjAjUsjGZF3AvVdQgD2l
         GzHDwOcqGHyB4ZNuPSSsYWtz6B1kRDINgfetZFtEJgGhIlwcWdL6apyi+l6UuhyL8w5S
         RK21VOiKPhfkO1zygj2GyrFLgKnmc7mKozG+zYsJ2j9+FP6TEcCIopkHUL9ZBZ7kdYWc
         1oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982011; x=1738586811;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoAOp3woacgQpHd2g/asCHp5UTA4pERK/Ity2Wb8N/Q=;
        b=WQ4DB3TMLYmXiFbqmE93I0GrTFiu7xof2iC7G1UBHJEWCdb4U4dMSsjzIa2P16zYA/
         oFUCcB/OPzHH7iNcfi8Wv+BfcMTnQnrwPDO7JVLz05JAwbU2xmDxKq7LAF0/Ns0FIHEe
         AEbLzkm/DKIcjF7AhveR52V8Slek6Z9UhO4NRX2gNHdP7wCme+FkPIVqgiD59avBc7YY
         roQ6kbZeso0xMsQ8oCy4Bky/vSFwjirDHB+IZ+m7aBPcncEkyQ2eP4DGzZL/KMhWyyLq
         f3vyQeTsuOSE3zyfh0fInY/+XY4mrwTALfAV/jKZqAizGfn4EfVG42lYretzc30gBYq4
         XJRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9SaSxQJIROUvL5itn2oIppG986Zj/yctXunRh5tRM8PNK8lr4S/OErxS+z5WGdwlLBYQhDwruK4guR1zwdgA=@lists.infradead.org, AJvYcCXRA5b26v3QYnkwJgTTZ9mjta8nGdpg+/LoKE1ps6w/Hz++V58NvF0+1aNHieNCYOwSPc01VTpgopK7n6VU9Rcf@lists.infradead.org
X-Gm-Message-State: AOJu0YyPW0oImhxSast2erXn0XusUAiuGukOEOa5pROLjKMiZ56bD/e0
	8yXFZaDjDlr07odCKSksnI8yS/GSVqdo3RwvfyUgtNAbTo3fdRJj
X-Gm-Gg: ASbGncv+2Du0Pm4b8GrcvinjBaAjPSRnoLadqBnYCrKv4ybFhNVzcsrIf2rERtbUS3b
	5b/0v5Uz7jz6DvCR8XT2FO0gwo6t0yqsJFUzW/w/FT+utgtpXTi/Wvh7+euVmBXtiqtZrPRa+N3
	G7NlX3iEt5/EPcnwH/UIjmXRQUgDs62zaUeKw2Jdy+B/b5e6REpZCIxxpG5/eJ2Mt5j0f8NW0Qm
	DQ8/vZdG8TrVhf7I7T9uk83ObKmtjBSBa4Qfdjs6x0PMoSUNYJabZQgGzYGhkMkMpbS+iwUsBKh
	prF7
X-Google-Smtp-Source: AGHT+IHMBWcLxxWH/HrE9gnP2KJ4oU9wi9iDb4LPI99X2Tz841Sv8gPf5kRGSvwJqq3n4yWawHMSmQ==
X-Received: by 2002:adf:ea91:0:b0:38a:88b8:99af with SMTP id ffacd0b85a97d-38bf566b88amr27909330f8f.22.1737982010830;
        Mon, 27 Jan 2025 04:46:50 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1761ffsm10811380f8f.7.2025.01.27.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:50 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:09 +0100
Subject: [PATCH RFC 14/14] ahci: sata_rcar: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-14-f8f50c821a2a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=edhtWkME7JcFuoloymgagg+bCTbdLj8qaR8IOWv4eug=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AsTwch8wZKpCY6BlHXr882TR4ert8jNSnQ+
 OFz7uYVB+aJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eALAAKCRDnIYpo1BLC
 tdgXD/0R8DjMyNkTEOSEqNC8cK+UW/cs7ATY/dY56SPbehRA04bCvDyn0vB/5FxpJAoPlPCPRLR
 j5sG07A1fk+by7VohKEpDY25Y/FkgUnLB/x9N8GY+Xgbu0iJX/ZMUYik4PAZ8Y1u3SCXHuKoaug
 5N3sePlGeyyfOO1cfFahLHJCdpj4MkutMilDNOWthqBVb0G80muTn5+P7c6GIjlO4zWCmx/f0Ll
 Z2NreP3O6wPWEk04L+uvBX5CrWewgBzct3cBa6qQpwQaVZTsxWNCfePC/kcNWReNMSlID0lU7ah
 tYRc2Yr4dNCk1VZknaoKbvwHdVcoHu+cDD5hR15kXnHTlVwRb4+qmFavc2BJn5u7PyMkpI8pnMi
 UbPuV464EgJtVIWfitIWfc6nl5a/CzAsCAjxy4mCzQJ7V2LN0Ho6hNIvmcxmcaZN+r3ie0wY8qb
 o70dYTWrD1ly4Qqp6NjVaeJCqggwo65mZL2fsxEhEOBNt6bxe1K1YPab1qxwdb//noO4O6nG+Dt
 mpO/PmO0Z+S+3rcVdasfL9C0Wih46GMwv04m4pcRXFlAXM8JszH1FKnW7tn5ZKE9IbpCzzQSzMC
 zVSU7LzYibqOPwYbKCawuINy32MTTOUEdxvD431BU3xR4tALDoe0DBSGBE4QodaaX3XUrvWMqBV
 362NzhZEwhVJ2Lg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044652_755305_01421CAB 
X-CRM114-Status: GOOD (  13.71  )
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
 drivers/ata/sata_rcar.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
index 22820a02d7408033d698a98373e1e8e7ef47f908..4c5f5938c12efc7c8594df4092915011e83f910d 100644
--- a/drivers/ata/sata_rcar.c
+++ b/drivers/ata/sata_rcar.c
@@ -927,7 +927,6 @@ static void sata_rcar_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int sata_rcar_suspend(struct device *dev)
 {
 	struct ata_host *host = dev_get_drvdata(dev);
@@ -1005,7 +1004,6 @@ static const struct dev_pm_ops sata_rcar_pm_ops = {
 	.poweroff	= sata_rcar_suspend,
 	.restore	= sata_rcar_restore,
 };
-#endif
 
 static struct platform_driver sata_rcar_driver = {
 	.probe		= sata_rcar_probe,
@@ -1013,9 +1011,7 @@ static struct platform_driver sata_rcar_driver = {
 	.driver = {
 		.name		= DRV_NAME,
 		.of_match_table	= sata_rcar_match,
-#ifdef CONFIG_PM_SLEEP
-		.pm		= &sata_rcar_pm_ops,
-#endif
+		.pm		= pm_sleep_ptr(&sata_rcar_pm_ops),
 	},
 };
 

-- 
2.48.0


