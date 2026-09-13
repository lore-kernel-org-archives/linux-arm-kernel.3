Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0676C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 15:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UlzyvIo8nOadqp8jqeYyZiaPQY3f0wl+9I9FZEmerIU=; b=JfHLOTR1rvq0Y5KEpc3T4qrYit
	A/7PuRkp/nEXSrcmeMkUC+/VHSnhP/ye6WVxcuJ4AVCThh93nElExfOKMlqmuWS1O2K7KDPziij16
	senhcjG2IN/MqeBOoavPhImazHSlnSWVmgQJrlNPHSjc9zIvHKdC832bRyIYjA+R/QE5l9MkuCAO7
	Wmn3Pam1andosSP/YF4dY9+ADwlf+2G8WspplGdsyjFj5+Ee9Vo4abXro8EBHuoubks459ej0NE+i
	Z9IYQaRCOjtPK0UDITbi1bfFt9DtfQRNU5iz2Octr4Z0vf82tHZfyF76ji9izemToojriFI2Riar1
	TRvUCwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgy-00000001l2e-1RXT;
	Sun, 13 Sep 2026 15:00:28 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgv-00000001kyX-1RIy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 15:00:27 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1299791a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 08:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311624; x=1789916424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlzyvIo8nOadqp8jqeYyZiaPQY3f0wl+9I9FZEmerIU=;
        b=nHFAjhqek4ZlSjr65126IxNTVvs5TBaml/nnpq5bjg7M2ryXWjvAJzjVVgmZCnCe7S
         702Amit6kgmUOkwp7DmmrXCsY3FadqkcUYe2nuOFbTNj/2VVqCarxI4Q8ts+kw5+iXMD
         FAqrgwD/kFG7uRYBn2RNy2jaXq4fheZqqUtxwXn/l8k/bA2r6RHTD5nhEBPfPB+Yahmh
         sbJpi+xCNHH+D9MFhEj3ZjCvic8y6kS4lcUM1zZY6Fk/PwKxSDhA5I+PunlRdeM7arp7
         AwsSJX1E3w6hypXqVZjY+Rldg/EVKImoerRY5jFk/MF8p+m7VtFiROQ1MvAGs8WRl//s
         YEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311624; x=1789916424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UlzyvIo8nOadqp8jqeYyZiaPQY3f0wl+9I9FZEmerIU=;
        b=X4xufYNhxaU2NsTKcY+eJbzAJqFvJhBoZG5t7QKAQw7eBge2PoD6d7O3PDtbw0L/sl
         /szM0IFZOlBAw0vj2wdPammcl3FbrcZNK1GvVDK2GVmDIbn3wN2Qb0gdbjgQ+oFZQuAW
         yhoE1M1TY339w6agx1HziepV/u+hsbhqHor98jwtauKDN53Pq4kiS6WK/id1I4QnbepB
         Ep578M8qNDK2XlHJ5UnU4zX/KPDMBMwvFOWLE/eOf+8zMgBQ7DOYDZbaaEO9zclDetMN
         DTU53/LAvRACiRSNSezY5LPRke2FqtpRf2fszLt+LAvN9KbbMEdeZXUC7WfKrKEe1qMj
         glWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbiCZoH0hzbQ2Z3IAiWXFQ3TAr221ZECmSP63yl2C9vfuWoDdv0VggcmG4SVHRFSRuwO3DqqAu0QJN85njNp7L@lists.infradead.org
X-Gm-Message-State: AFuF++m9sHh+VODO+2a/1lHBeTO+78WjSgcW3XYKfF+i/Ta80YrZBU7a
	NxOvG1k1Zy8CBs/w/Jf9v1f4uyUQswKYPx5CLVzJo+P8ejJlSsTdBXTd
X-Gm-Gg: AYBFou14k0mJ0JGYUryhyk7Z5UKAyVocYGbRJL1UxNtK/zH02NUlnP6SN3AvygPMG0S
	Tp0ZIf5XsqO15Ga1CphPfgGywxK97pYkjeStJwQizulZyDWox043wLJkda5RO4FCAccqDnArOIz
	e+i90b/Y70BXeqZwbg+++mguD3ujcE+nu8o3tP3bQL8qMXORjbMrgSg4nUSERxp3CzLJQyfxoD1
	PvTN94IUeLManWYjXx/7S5fASi0/E6WxnXhS8Qhyw8u3wJr02ZRoS5dzrhWQWpBPymbuFRUBbiZ
	7peHRZZAZXRYvM03mfEQ/IXufASLioCsGPjLK3tGxkfu/sov1NFjeCBKL3NhZY9ikaImox7qckW
	QDU3pk75hg5Pl6pnQC6kQEP2K9oXTXhBSscgMjRSSN9jtP25r1Szy7NvRPolZJNgodobsbc5hXx
	ZciK7wCi9bSibDo2A02Juyb0ONQxQ+tasmhIAxKuso+T9o43RoBlAUwFQXIN06yKKhR+4XsQNUI
	zLmfdAm+hk=
X-Received: by 2002:a17:90b:580e:b0:396:40e6:f631 with SMTP id 98e67ed59e1d1-39d9bbe47a7mr25597954a91.3.1789311622706;
        Sun, 13 Sep 2026 08:00:22 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.08.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 08:00:21 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v9 9/9] thermal/drivers/exynos: Select thermal emulation support
Date: Sun, 13 Sep 2026 20:28:37 +0530
Message-ID: <20260913145905.9404-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_080025_397788_5C8E23CC 
X-CRM114-Status: GOOD (  12.64  )
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

Select THERMAL_EMULATION when EXYNOS_THERMAL is enabled, as the Exynos
TMU driver provides thermal emulation support.

This ensures the thermal emulation framework is enabled whenever the
Exynos TMU driver is built.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index e1e8035d24fb..7d5590f78185 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -4,6 +4,7 @@ config EXYNOS_THERMAL
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
 	default ARCH_EXYNOS
+	select THERMAL_EMULATION
 	help
 	  If you say yes here you get support for the TMU (Thermal Management
 	  Unit) driver for Samsung Exynos series of SoCs. This driver initialises
-- 
2.55.0


