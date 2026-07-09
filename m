Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B82C44506
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGtUrkx/TpXSV9KyMxarboRJ5bR8WEDJ79N5wF/Lel0=; b=xLtX1u5dEpOY+JeE2RUps4kOGD
	bo2uPo0FkwefodzDG5ae0akdUEZpa3fol6pBOGQReUX2qGFlmT+AZ0NueqIdS5pnTJomDe9GNQCTt
	nvoZGvqgKaV4fQbDFfyTeeMxrKrpdqMHU4U2U7rKB4IZEk7rln5uiO+kEXFv5YLIwDFK1PQo982ZQ
	TPZO2GPmaWSMquT+CP7Vf/E/UHxO4MCwoX2x5l/MKoAJf3iaqZqVIod0WmHPoq2IRhplrG3yX6+tM
	OesX0sswvrpvjmZLD0rJyFTfUsvYfMLSut3cuiHAViTbdwiw/KBs69cIGIhm7Af0K94qQ43eLzebl
	c2/K7VyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnp-000000028Vr-2ftO;
	Thu, 09 Jul 2026 11:20:25 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmnm-000000028Tf-0Saz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:20:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so13521235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 04:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783596020; x=1784200820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGtUrkx/TpXSV9KyMxarboRJ5bR8WEDJ79N5wF/Lel0=;
        b=g+qrwHrVMpGILJ+WCODQ9IiPskKSiLebi53QTZlf+TOI/2HyzmToyyQ7AtgUrSuvG3
         POA+tTBUR/zpbkACZNtwqcO23ZoV6zz3a7gsMF2OcIlzg7LB9nOWWtPKUji/eU+fTsXY
         7t/omzk949G0BARUItXqRqURIiu/MVwB3vYXwBq21MyNnYFE5qTHqu6lstmiXK0tkBzo
         +95KZMf08IFuSRSftq3QICfNM+2M4vpUREBuq4ZWqKgsX6VWkedMO9pMB8FAF9FMH8C8
         VgwRWW1fJvKL61vXsDs0yXrBrKIusc6bdBb3UhSfBezzhJy542Q83B/ODJgFKIFSu0a4
         vb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596020; x=1784200820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGtUrkx/TpXSV9KyMxarboRJ5bR8WEDJ79N5wF/Lel0=;
        b=C+PWeRh6OUHCDeWm7GNmnzio27vGkzaZH1oury1bGhbCCuDyH5i3cP0qheGMftFZae
         6DJt2SfkKpNd9U6PQDc/k+p3fE3zCPoHw1cews5KCGc25muS/szi4rHP3PqiWVNqIOHO
         hQVAwgVQ0M9X2WWBcnNn8BIu2Iunwk63JEjZkvwg6PnPqiDgXVzsHNQRHNBoJ2HKtQa7
         9UfEvG/dnoqaMlT+c48sW33Bc9I0bkW5ldGWub/aAz1RTNYmtPu9N1FbHUPsbVzXDa3M
         KsgjZtXA00gK/kQaXHXXGY/eDRI96CSNfGQIqnYEPrns25K3yA/RaBLCdoCaYmjmHGCD
         cpVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpn/PNx9JRfEVSFkQ0WoLd0oU5FGw5vQtgsYCujKUyEAGH9G8TYcEsKKhukPfP9K/JqizxD/whV9Z94Lk4JB1YX@lists.infradead.org
X-Gm-Message-State: AOJu0YzH2aDS7bfGQ7WxvtZluyRfQlhLrXd6aHGWn/J4/+AtjhVRFd1i
	rLDjqagMYkHLHrmCMSHnzLSilC8Q/Lu5moNdfQQ4bPc2tTgzeHKchgmeATlS9npcKso=
X-Gm-Gg: AfdE7cntckjhWXBz4B5ijZEPmbSfPCs4Y/F5Io6m84rgJvE/GsC7+tW7qFRqrp81Sg4
	FKkfIWFyfuZlV9WCDywkNfWmF164HoX46tSDPWzxQ0SHi61E3OIe0HfFi2KCB8kalFY0m195f1x
	ficNAPd37+WGm3iGhDVumvT0vNm9NAWnqy6ATxcYwPEr11eC2RgOuuxExhWbaRCoqd1Bk/af6MT
	vrlMOycPuumyBv1qkJVi4wF6JQbxnUQPFdFN59qb83tcWtMwxAIMVICP8yvDLdVO3fNcoEHQAFA
	MyuXKJ8n/Kik+EXaYoQ3p8rSwbIzb24E9L++/sSP6y5T4ZlOk6VoCVWDVZJ1mPfmQufn4CjuOK/
	JW/R1ILSuI8YfQsnCrbvtLaCQJJiOAxOWfGegaAtwb4OBKJJdp/pKfhy6/0VJqoVh+++NSGnWuk
	hcMaPRWef7seHDcdht41uTBk98MZ0DxUkeZnmChDg9+KWVwxZKdEuZPeW98i6xdo8QzDMHCjEH2
	YYXf06pJZJmTHULmsX19b3aLfla5u+ZVHVfIxZBKW8=
X-Received: by 2002:a05:600c:34d3:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493e68c699bmr69231815e9.16.1783596020048;
        Thu, 09 Jul 2026 04:20:20 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm53910475e9.1.2026.07.09.04.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 04:20:18 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	tudor.ambarus@linaro.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 2/5] spi: atmel-quadspi: add controller init callback
Date: Thu,  9 Jul 2026 13:19:08 +0200
Message-ID: <20260709112006.390742-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709112006.390742-1-robert.marko@sartura.hr>
References: <20260709112006.390742-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042022_158148_9DB83B0A 
X-CRM114-Status: GOOD (  11.80  )
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

Allow controller variants to provide a custom initialization callback
through their capability data.

This prepares the driver for variants which require a different hardware
initialization sequence without adding SoC checks to the common path.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/atmel-quadspi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index aaf7f4c46b22..62ea84d234d0 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -256,8 +256,11 @@ static const struct atmel_qspi_pcal pcal[ATMEL_QSPI_PCAL_ARRAY_SIZE] = {
 	{200000000, 7},
 };
 
+struct atmel_qspi;
+
 struct atmel_qspi_caps {
 	u32 max_speed_hz;
+	int (*init)(struct atmel_qspi *aq);
 	bool has_qspick;
 	bool has_gclk;
 	bool has_ricr;
@@ -1156,6 +1159,9 @@ static int atmel_qspi_sama7g5_setup(struct spi_device *spi)
 	/* The controller can communicate with a single peripheral device (target). */
 	aq->target_max_speed_hz = spi->max_speed_hz;
 
+	if (aq->caps->init)
+		return aq->caps->init(aq);
+
 	return atmel_qspi_sama7g5_init(aq);
 }
 
@@ -1570,6 +1576,9 @@ static int __maybe_unused atmel_qspi_resume(struct device *dev)
 		return ret;
 	}
 
+	if (aq->caps->init)
+		return aq->caps->init(aq);
+
 	if (aq->caps->has_gclk)
 		return atmel_qspi_sama7g5_init(aq);
 
-- 
2.55.0


