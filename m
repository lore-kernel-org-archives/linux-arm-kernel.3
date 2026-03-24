Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82009FEC0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 18:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=; b=yjHcqApij/79s0uoR4aflNvA9O
	kBxEKai0zL6hXyHpfKamWbyqnUIIfYHyND9Hgc/DV6gGDRXTvfOeDg+TYS/sf9arIT55aSYs2wUBk
	FnrWwT9HgKvSIk0EttcD6GrCb7L93vHtFaeRrhnn7ZLWFrOOHoqOOMxXM29/dMB77qDgDL8fnBveG
	FHA8ngJdBEn6ZiOpTULPpgigGtJijZRTu9aZrN5b1kv4h5QB4SAOm/WlPWwNaWcrSYRoFN7Z+sp5U
	vxywd60ezg4GiswhBg7kspxYRKpg/zg75ot1spCgKFJ7yXUCDMvAvHYQeDW6c+qbjiw9m9CuCEenb
	V2w1C89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Uk-000000024hx-2hCb;
	Tue, 24 Mar 2026 18:28:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w56Ui-000000024gP-1Dkt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 18:28:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso2429499a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 11:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376927; x=1774981727; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=;
        b=ow3vaL/zcbRie4y5xJBAtY9P4bBvNYR8NS7v9ZxvozB9PfFKeDZwG75ng3FEy8+vZX
         mq7F14le9AOvcycnRkE0+x2jZ6TXliPwVHN9aNdRkw7FS8pgd39RQ1vsexunsqg77+bR
         +S1ycdPhfNkWFWIiF6Eg+3V2U7rjtdoSJqzHAP7f95LnkeWfR9+s/6xWgJOGR/mmU6s3
         wViFUkXAJ8IgN7O79Zz5MIgwt612dqjqkG+LDYph/i6rsfw/AvePXo24Q3sSpelxexxx
         dYKnAdqsNgw/SVVrY2DucEcrQ9K1tb6vyegs55e1QIuBAqh/sbcs1luG/lrrj1kqwwYa
         5swg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376927; x=1774981727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TNhN09MjB5vo7WQrY09vfIIZoGUP1LY8sfZbk/6EDLE=;
        b=Gfb9VX07P07FMjWNS+FG7YFFGVqVt4/RD/Opz8ZJgPi/EQe5DqUPRMunUxGtdlnvEQ
         wXs3HpP9E5PRdIXPy+3qBMEeGSOGJBKvX1VXkzEXaaPq8XwrKdlAWY0HyuKTqiy3gQVa
         xWgO/bj/JrLAv7X+UFRgThtAafGMJWfqxXftJSoz8bNHIG+6DYrtlyOrXfucXXKuMter
         E3oXRktqecU1fE/mRkpyoPvn2EjgGf/O3zt9YOg0wLvJ7vX7A7a/Kp6D1SMNDriqqCSg
         awO19fkd+GIYjOFaUpASri7Se3mVdAP2OeeqxChk50gFiDL0ibvx6gInKXLZaVSI2hni
         keFg==
X-Forwarded-Encrypted: i=1; AJvYcCWwFpKicGRlSKlSRqX7hXBh+ZVL3jvXInEDd2Jd7rtfJ/eQ2kNE+g7HFcEtxjsyNfILaU3BwEqQEwa29dnVmFAx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+TkCklegMxVJXW7TKLkfDETari1+DWGJGX3R9kCGmFiCAz9rB
	MvOeux25oQes2Rsm/GG3xvG6cwSbefNYi43rNqW6stptWD1T9S49cY/s
X-Gm-Gg: ATEYQzx7IsLifun0gedt1cuNihrbGs6xa+w+XFM3oT9MNLTcVYSGwlM5nguM7iePWGd
	xWwkNTKZSi4CxvkRngIaJ1xJ/OfvOVR3Vx+g5nb5d8RuHNAIEA5eModuqCwg9CnsXjBA8+ItdoN
	kYNiQcjBGPZQTDIbFSUH/PJNDyzj/kukKdJEUZ3Ug7ATIlantzyVSqs8BVcVZaS0h/bCZGygXq4
	BxY7ibxxcixFI5rsyeexdH+RC+worWtw7OuNjiZrzwEmhIZfJ5l+Of6ZWYmfzfEcJNAgBrswS+E
	z3dwMbmX+Y9JGGxG0fP5MSNVOHKcgf5HIQgsXGdXrTaCfFLPpqOZBazyPiEp8RTCA8AcAjZijm7
	pn3KXSlXYCvKrKJHrYIiyqwLgAVSCZqNGL36TnxcU7mDbGU79TImQAqSO4R/yHlUoblwUlEh9ke
	EkkmMlmEpL38M85I8626I8fPPX4AAb7YHphX20
X-Received: by 2002:a17:90b:1d8a:b0:35b:e5ba:c0c8 with SMTP id 98e67ed59e1d1-35c0ddd9ed9mr320446a91.28.1774376927304;
        Tue, 24 Mar 2026 11:28:47 -0700 (PDT)
Received: from [127.0.1.1] ([103.216.213.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0d6060b5sm350576a91.17.2026.03.24.11.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:28:46 -0700 (PDT)
From: Atharv Dubey <atharvd440@gmail.com>
Date: Tue, 24 Mar 2026 23:56:57 +0530
Subject: [PATCH 09/10] i2c: sis96x: Replace dev_err() with dev_err_probe()
 in probe function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-deverr-v1-9-7e591cce33a3@gmail.com>
References: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
In-Reply-To: <20260324-deverr-v1-0-7e591cce33a3@gmail.com>
To: Till Harbaum <till@harbaum.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jean Delvare <jdelvare@suse.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
 Enrico Zanda <e.zanda1@gmail.com>, Atharv Dubey <atharvd440@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774376818; l=2523;
 i=atharvd440@gmail.com; s=20260314; h=from:subject:message-id;
 bh=2gYAVvyUJk/qxHL4KJceROL4iNDzsuJ4eDXGcgjkpVk=;
 b=vB2gL2qhGY3YL/cIJqmvowLCaQEngaBk72sJRkrwCl3oRTHnnpcQvD7hzPfvDqHKUYnT4Wr6Y
 Zfn7Uu0NXm6B/rb6bM9jYBJr8GEREU1oPwc+1RRqWHn4xFjESwTrs7U
X-Developer-Key: i=atharvd440@gmail.com; a=ed25519;
 pk=T6i1xWOKT/RUSDYATSgyVG/4X7ac8jPjRSG1mMAcqVk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_112848_341727_6F4BFE2C 
X-CRM114-Status: GOOD (  11.97  )
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

From: Enrico Zanda <e.zanda1@gmail.com>

This simplifies the code while improving log.

Signed-off-by: Enrico Zanda <e.zanda1@gmail.com>
Signed-off-by: Atharv Dubey <atharvd440@gmail.com>
---
 drivers/i2c/busses/i2c-sis96x.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis96x.c b/drivers/i2c/busses/i2c-sis96x.c
index 77529dda6fcd..eee41dc9d706 100644
--- a/drivers/i2c/busses/i2c-sis96x.c
+++ b/drivers/i2c/busses/i2c-sis96x.c
@@ -245,23 +245,19 @@ static int sis96x_probe(struct pci_dev *dev,
 	u16 ww = 0;
 	int retval;
 
-	if (sis96x_smbus_base) {
-		dev_err(&dev->dev, "Only one device supported.\n");
-		return -EBUSY;
-	}
+	if (sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EBUSY, "Only one device supported.\n");
 
 	pci_read_config_word(dev, PCI_CLASS_DEVICE, &ww);
-	if (PCI_CLASS_SERIAL_SMBUS != ww) {
-		dev_err(&dev->dev, "Unsupported device class 0x%04x!\n", ww);
-		return -ENODEV;
-	}
+	if (ww != PCI_CLASS_SERIAL_SMBUS)
+		return dev_err_probe(&dev->dev, -ENODEV,
+				     "Unsupported device class 0x%04x!\n", ww);
 
 	sis96x_smbus_base = pci_resource_start(dev, SIS96x_BAR);
-	if (!sis96x_smbus_base) {
-		dev_err(&dev->dev, "SiS96x SMBus base address "
-			"not initialized!\n");
-		return -EINVAL;
-	}
+	if (!sis96x_smbus_base)
+		return dev_err_probe(&dev->dev, -EINVAL,
+				     "SiS96x SMBus base address not initialized!\n");
+
 	dev_info(&dev->dev, "SiS96x SMBus base address: 0x%04x\n",
 			sis96x_smbus_base);
 
@@ -272,9 +268,9 @@ static int sis96x_probe(struct pci_dev *dev,
 	/* Everything is happy, let's grab the memory and set things up. */
 	if (!request_region(sis96x_smbus_base, SMB_IOSIZE,
 			    sis96x_driver.name)) {
-		dev_err(&dev->dev, "SMBus registers 0x%04x-0x%04x "
-			"already in use!\n", sis96x_smbus_base,
-			sis96x_smbus_base + SMB_IOSIZE - 1);
+		dev_err_probe(&dev->dev, -EINVAL,
+			      "SMBus registers 0x%04x-0x%04x already in use!\n",
+			      sis96x_smbus_base, sis96x_smbus_base + SMB_IOSIZE - 1);
 
 		sis96x_smbus_base = 0;
 		return -EINVAL;
@@ -287,7 +283,7 @@ static int sis96x_probe(struct pci_dev *dev,
 		"SiS96x SMBus adapter at 0x%04x", sis96x_smbus_base);
 
 	if ((retval = i2c_add_adapter(&sis96x_adapter))) {
-		dev_err(&dev->dev, "Couldn't register adapter!\n");
+		dev_err_probe(&dev->dev, retval, "Couldn't register adapter!\n");
 		release_region(sis96x_smbus_base, SMB_IOSIZE);
 		sis96x_smbus_base = 0;
 	}

-- 
2.43.0


