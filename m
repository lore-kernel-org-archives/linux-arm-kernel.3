Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264C9C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=; b=F5XAVgZ+QmwGF5ShSDKPbKBkcJ
	LEa1P2a9JxPg29JPdxO0kOVfhYDAKl//uwfT6QWBOUHglVR0QOFJl+H6OobiFCLwo14ipIspVwhwv
	jrrJ5SMh+rKGuKvhphfHcW4k24cF/BaRRbQ/gVt4wgGEPzmQn3YSB5fo5jmUErGpJL9s1xlS1jKdh
	BS0tZ67iDN2O6jp1xYOteMbPMoj94yrLPbIMzIoBb6i0FqTvNShAXLa3BpCYQkzwZ0C5l7fhijMlq
	//tJPK87NqRNQz9rqSj9n8yzRmSqOy34ANOreW7fxcW6cPPpovUJ8YF2/CwW+b8++0sV/2/yyQlmX
	FSZQsAUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2UdD-00000002L9G-2U5P;
	Fri, 04 Sep 2026 14:11:03 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Ud9-00000002L7G-0fv1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:11:02 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-39faa67fab8so9235981fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531057; x=1789135857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=;
        b=VmEK0tZN/GY5no9O/GJmOJgEfjH493hMLJh5JThg8IAUmH8yd+5tmna4ym9WgDif9x
         eYOflMoZilEbto9ECXR6KWiBFFaVl9q0TY9keK7Tjkjp/Lg+RV2YHiZhxrfJc1iyL8yT
         NirpgbU1Bb0LJpd9rcUVi1fRlAc0H/+qUvn7mqZat8ppoiH8D09ynCtcETd8gbo0xNlI
         /qrcRCMep2owWzl3U8aAFGxh03diBh+Tip4uCva9x8oB05Vakpb+n+U2GNGXiyrscCK+
         ri0is+kO9dd97SfDfOGu1l14iECZlEuuNBY+RlomALAqvav9UbAZ68wp6PeomkDcJ5EW
         +fVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531057; x=1789135857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=;
        b=sQJV1DwbP3hgQ3fG6BUVRKWbRs7jQUH73I3L3wvRvL00Pzkk3jLo0yby7s/dVHWqM5
         MsbreuCqbl0wN2boFl6fzBKcNqqZNkTHy4SXWNHVc86Z0N5kOyRuhUjeCNlAGmxiuL7s
         07/rtxMDcutEBIFhGTlT6zzZgPhP6PQsFzJoNbWKTFoq5oPsGynBHAKLTdHx5e25beXJ
         FnEDgQPLlyUPrhjpxJhfaOrI6nYO3sA9QYoHkMoPdwdrBotsmyOWdwHhmedo4oBIsZia
         1kloA5ZyWNQIA55n5fBGnO5I0vo2G2jXuGQaJMjHtuiwSvmHWmJuGoWTS5DJys+NrnAW
         p/ww==
X-Forwarded-Encrypted: i=1; AKwUvBzuJklKJ7FT2HpSU74s+OXDGNWfgY55KZu8hbclNsiHNH7Ddt0gQaF2e+xKZB/MEo2bPwyw7qqnryQsyB+ifxkk@lists.infradead.org
X-Gm-Message-State: AFuF++nF741h9FGFMIn76wL+M70MT7YZ6DzKvIVTcK5mX1fscFaP0sq9
	EizrhEQq/NBrWnZ8Z1BTu7OSXnbUWLP4ahXfVP5KOhcYoik+T2ChEe1PYGYpJET8JWfcUlL/Vux
	orL2D
X-Gm-Gg: AYBFou00ApQHFh4FBrjakgnR6SnJefgQQeqMnIDclEfXPQtWLeQMO2RZPpje7/d/uBs
	bzS/PwJlThrAx9l0eZ6/bcbFdnzr+uqZ8tRagcSxhGXDazSGnpOMXPp8g4QNueN2/fG6bCfXzEJ
	ORhyoxx8UiAaFY8wpyV6Mw01lesHLlHNiwhL7sQ7oPmrvRmFOAowiWvaJBzADdoj8PeOMKutrIN
	AnIlAXTc7jgGXqwXN5LXQ030++adxrnmv/8Gr9UOCwd4hIajeqrFrOkq3mZGiWbkXwM+D0SnA27
	5F4nIbL/Qf7LWi/sny/ZzJdWue8g1/NxT1/TH5iqAtjM2H58SK0uFnnV5ZDTlxO/8mAl5uezUa3
	rL1WN7/wGpWH4tQbwMj0aHdCdGVdnWH30iBZPAZBMr4wykGKcgULmabDx8ZfZwyfQWxXLSsd9mX
	uaJCAmJ7O4Eh0191kro3J7kalbmBPTVdQ8Ol3znuXRtizh68u783Oi2ePKx2sVNMRGB7JrY+Qmv
	cCTDRdSLTmHw63e
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr123193155e9.10.1788531046019;
        Fri, 04 Sep 2026 07:10:46 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:45 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:40 +0100
Subject: [PATCH 1/4] dma: dw: use designated initializers for
 acpi_device_id
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-1-0fcc63d65d4b@thegoodpenguin.co.uk>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1528;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=aQFEA3y1X11okBv1IVhRwHPokxBF08MtJtdbM64IarA=;
 b=tyyOQHQxn3xZTIwpXhIMj6SJta67xRTd+ISo1iTYGpKgjWvUuVu1brMOnuUK8WgtSIWS8O4K8
 lKUl70Fitp4BMp1y7eYgsmIfq9Ht+bjFbiM1Jh4heAF8v9mXQ/WDsNm
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_071059_220595_7BDBAEBC 
X-CRM114-Status: GOOD (  11.95  )
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

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/dma/dw/platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index c63fa52036d7f..5c1c97eb28a4a 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -141,14 +141,14 @@ MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_dma_acpi_id_table[] = {
-	{ "INTL9C60", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "80862286", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "808622C0", (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "INTL9C60", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "80862286", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "808622C0", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
-	{ "80864BB4", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB5", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB6", (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB4", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB5", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB6", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
 
 	{ }
 };

-- 
2.43.0


