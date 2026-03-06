Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B30BFC9EC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc8859toxeVSOntvH1T0G6+vVxE10uFum+hqYIujYxs=; b=WihSAkORVruS58hHDszgecLSF/
	HOsV5kdPEKkzoGRvNVc5lEKm2GlHPw0Y1gZVBhvtZSRS91qtYI2j4n53nE2LD6pgVQ/VcMUQDMtvi
	aFynzHSxLlIMG0kFgKE+A1HDdoz5wdV50keL4Xuyi9vUAlpIs+vfclicrS4KfZhQWiILI9RW6hJV4
	/SH5snfwA3KwOCo6EbMIoJHK95y8F6JQendFwnpIFQ0nSFdNhbZO81jcj0P5J9glJbZLrbf0E1gZC
	RRZ5YisMEtWwRFAeFzoLgRxVU+t7mSYRirkH4WkdsYvwPayrooLsqjeTYKmQZtmTpcydLNoByqCak
	7ju+E/Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyekj-00000004eog-3nyi;
	Fri, 06 Mar 2026 23:38:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyekc-00000004ejl-36Nk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 23:38:35 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso86210335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 15:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772840313; x=1773445113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc8859toxeVSOntvH1T0G6+vVxE10uFum+hqYIujYxs=;
        b=FPmBoSV+tVOk7OeKSG3Qzu0TSQUODokBFL4ldxc6LHJ/Y8zyA00oZB9SFDFHajihqK
         I96LHtCVapei6KWo40G17uepK7K43RVvYp2jMK3hJAe9tYN/S1JPYA6WYB/rIs80aUZq
         mAXUwLFi2QH4JL0HtIRcrgU6xivJNBQIiTkU5xyumHdsg70q70gXWVCyU8SqHL+zbEod
         jQ+6u0PSJzfBBfKkfn3TmGQxrTf3YF7eiKQB4E1iuj13vLDUCvo0OoNXNQJRfxpVqhCC
         Rzn8hv2u5JSP+KAAlQuUziR+NcHgRRPihGMV+rbJY9wNhOhM8Q896/mSTyAKCwkle6Mv
         3krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772840313; x=1773445113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uc8859toxeVSOntvH1T0G6+vVxE10uFum+hqYIujYxs=;
        b=EEPFNHm4tasstBphtres/VyCaCzpOX5BnzyEfKNYuvPFQQtBFOcobPl20L6Imrr1Iq
         GVhj+ACjoidXsXFDzh6im2kPpzSNEPlPzQvNGF4AXFsj6FXkw9zc5X0TuGWiBnxRzcZd
         PbyA3C2cLTlVphurZN6tpIOtnrM0hhly2RYa8GwtC7zdCTZhv3b/Idign0gMPPq2zixw
         rhOUTRxtC/DHD8tMbxQVdUNXyq9G14kYsUzRvs03zMAqY6czAkr5prpuhzi659elGgxG
         IbbOdJZq39/Xa1lLRt0ibUvGjDP/d9NWfjPirlaLrUjkpt1papSMzluiMqKrQAh+HnRo
         wUYA==
X-Forwarded-Encrypted: i=1; AJvYcCVyJkA1wXE1K9rM9RHdXUoxdEHdY1BqpPw6RmeGB8wZzfaTATFkIee/v1JpV3Xo7QWkdk11HxG4TCjt/FPWPzTH@lists.infradead.org
X-Gm-Message-State: AOJu0YyB5k+hj6/Y+ZD/6NZ6cTKOpTEIMIaJQlhl8SDpTnhmt3J+L/5l
	mi1qMvoJTBdY5XrpcnKZ5xpsdRyJxpdTm6NZtqvKEEwT7kW+uDWaoBGa0IY8jrIPvbI=
X-Gm-Gg: ATEYQzzSD9Vri4P8SdCq4Qrr5Ld2sph1ogbUIfy8dHQTRcS7O2yjLnsm+WFxF8+uJOr
	BVQpAqkN+OeIEeozC0EBdyBFpDK1ZscA2GhZqj5R5Q3tmoU7W9Hy2giQEbIPbR5uz0YYiAkgw2/
	VnKlrzy5Jn/8ylBkFnYHMAbrb65mQP/SxqtwHoSIRSJbVLQJJ5HeHiobbkYWWJlTC7LgzZ9hJpe
	odIWmg8Nk5kExV7u1sFkILgooJjaE3IO7saWfWk/3+pfLt+SCzKyZUjvS3LUmu+GWX4R9XSd0Lu
	iJGc/CJN+NHG1l/1e8SVOAhCa018YUEQ3VxEBdS3epxk1MyhlWhQuWIsi8I7qBlcE888rUT1psC
	1g7Xusb07MZ67TxPOwPsO9VhiBT94zBe1odt3ALT680BcuWjFEHqKIkmIAvw40YQbuODQEprS8x
	59UFBxtogF1399aZnmjA/be1tTyxeZFybnqRjuI1mAeoAmPXDDqGGu0vVBlbVfNTBsFQ==
X-Received: by 2002:a05:600c:6091:b0:483:348a:d3f3 with SMTP id 5b1f17b1804b1-48526951407mr65383935e9.18.1772840312739;
        Fri, 06 Mar 2026 15:38:32 -0800 (PST)
Received: from localhost (host-79-12-214-40.retail.telecomitalia.it. [79.12.214.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485256b1eacsm55652215e9.0.2026.03.06.15.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:38:32 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Lee Jones <lee@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Phil Elwell <phil@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH 2/2] mfd: bcm2835-pm: Add BCM2712 PM device support
Date: Sat,  7 Mar 2026 00:41:22 +0100
Message-ID: <c0b5793868f138bf5c928a12b2763d3e183e2e59.1772839224.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1772839224.git.andrea.porta@suse.com>
References: <cover.1772839224.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_153834_794306_C2DD6697 
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

From: Phil Elwell <phil@raspberrypi.com>

The BCM2712 SoC includes a power management block that serves as the
power domain for the V3D graphics block. Unlike other PM blocks in
the BCM2835 family, it does not feature an ASB register space.

Conditionally register the PM device depending on the SoC variant.

Signed-off-by: Phil Elwell <phil@raspberrypi.com>
Co-developed-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/mfd/bcm2835-pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/bcm2835-pm.c b/drivers/mfd/bcm2835-pm.c
index 2d5dc521b623d..9e8e3dcf4bceb 100644
--- a/drivers/mfd/bcm2835-pm.c
+++ b/drivers/mfd/bcm2835-pm.c
@@ -98,7 +98,7 @@ static int bcm2835_pm_probe(struct platform_device *pdev)
 	 * bcm2835-pm binding as the key for whether we can reference
 	 * the full PM register range and support power domains.
 	 */
-	if (pm->asb)
+	if (pm->asb || pm->soc == BCM2835_PM_SOC_BCM2712)
 		return devm_mfd_add_devices(dev, -1, bcm2835_power_devs,
 					    ARRAY_SIZE(bcm2835_power_devs),
 					    NULL, 0, NULL);
-- 
2.35.3


