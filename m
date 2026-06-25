Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB49CCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 09:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3I9Z8wqgofyuO3+w6/YgxBgJq5JW6cTK82PfLZ4BPc=; b=eUiUQ965gS8IJyjHr+SMM+P3Ky
	ni+aSwdVpr7M9e+IOiZl0sEUhjBvtR0cwiyvYmumGMQTifYFCxeKcUQZwJir0I9sFxLfdRR6btXEb
	ZtsAm7IcqxRiuC0RnZxLBymzWuXJvu5cIA0/dyd51ejlfFJYCQNAhNRN7Y+EGnofCnTONe8Uynvub
	GSb9BKDq7tE9xFTKuN25EHfBzhKPExYDqPlOHP6YKu5t18Ft8dXE+QUK8qnNhfuxn/DzyTNvx8PD0
	EFK4on4TV4I1Os0sWfMJ2WcKe4dE9YaEUugJWiBcTCdI9MMFBwnrZacSIcV3hDokiANu2TYoOaP6f
	7Rs/wOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcge3-00000008vpP-1ESI;
	Thu, 25 Jun 2026 09:45:15 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcge0-00000008vnN-0uMm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 09:45:13 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c7cfa17fedso15920745ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380711; x=1782985511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3I9Z8wqgofyuO3+w6/YgxBgJq5JW6cTK82PfLZ4BPc=;
        b=aqL6vFYs5ydceIIFoLNvvhtfeSybZKl0bx4/knRPJn5nEZNnwXJy0XX+RAXVm+/4Op
         nFZzNlevBXr9wzM3jnryTt0jQdX4geUHcucOGVoBScqTNTqZdr89R3gQEFBh1uFHfoRe
         rq0JZW/mSWlPJcT1ZfbKLZYvNdJFwOPdXGHHLjv1ziXPRAFsOYvstvoc8O6FVLT8+BmZ
         mDSgOyUy0M/xKhJZe2zje0fNAlrkRvHDK1oaq+64LOhq+964xproC3Ay7qaleoRYu0Ig
         SkXUs+Atz4BL4LeiBJj8cBTvODcKkSmpogOYnxsUX6JmxQWoIfaKbw3s3yXSidtXQDvu
         uKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380711; x=1782985511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z3I9Z8wqgofyuO3+w6/YgxBgJq5JW6cTK82PfLZ4BPc=;
        b=eXEdHch+9XFJkvWcIT/Vf4JsP1cuaEv9xqPK8XOKw0BzBFSGFceiHegcyfJ5/pfZYC
         1grRgPuDooND3yLBc3k68sHdqtiiOcKYFitLkOGO20eIZO/nwAUy6YujvMQio7CSNFRV
         +OB/340EZ+RGRZb9u0fpRJiH1AnhgUP7feMq2+RSiTxKYSuoBT5WjYdYCMhNHpNrRAHv
         ptWmOWtIJM1D+yrnQ5GBazxaBPpxauIPCGX1skUf+6QGmWZEaf7kSKAdIGmT3VLljWki
         l5GL0YG6hWSDzxmAuga8ty/k6XTqP5Qx8sUSuA4DUavwEHRlCF8ASNRrBmscykIcCQfn
         vI6A==
X-Forwarded-Encrypted: i=1; AHgh+RreTDJpxmSaDg7fFkP+7nIVG174VswwhAynepITEH+TrBeJ1PYKrVoWMIwX0gjZGVEsTeETKGKmQ8xGXnLY8K44@lists.infradead.org
X-Gm-Message-State: AOJu0YwdrK73EjPgxsxBPTkMiEvoshJ19Iad1ZmgoABLdIcPQ0Rud6u3
	UR33479Wtg7D6jkwusuNtg4QrFCOkma1nZtefvbu6uyCM19FgH4/qLiz
X-Gm-Gg: AfdE7cmrF9rB5g3ZlWwGj6mN5WkAD7wWrxSEkWAFdCB/zkmNoArQV2T+IraIBef90e2
	3UA1ApaMMMSrr6BgTeL3rKJcGunzpwy0/yRyR7fUot+vfzM9SJwX30hkdpXtZPPGKxHutYOJdLP
	iKskBrrNT9U0JZ9yFlgvo15QM3VVdzq8L4+fFjaJMe1xct+L9BJnxFG7P5CvrUMdjHcORFZyRXH
	PGa9T9JJEC/rDincrwnBecAmE+zg1NBEdGcYxjy+QUZZKR0z0ORhSSYCeiTEEPnkZB7isL0lMQS
	KZTdzjXVNwNrdR7uWlBVSgSY8DKJI0XdOnEPgWpHQTE6rqUxeywa3es+HXDLvGIUKktaesgAL2u
	d9uQ76R/iz2qJsUUCHVqqMIEooe8j6OVox3eeAxkFX1ohTkKxebvzMfxROuxIqsrCDnp009igug
	RAmICLZrZqFdHruhyizKU7ndfYD60+7rNFQVfm7Cess80auHcREz2T7zxXm7/qcLdMBfXw9eQGv
	Q==
X-Received: by 2002:a17:902:d4ce:b0:2c0:a746:7b16 with SMTP id d9443c01a7336-2c7fc73b753mr20074445ad.22.1782380711366;
        Thu, 25 Jun 2026 02:45:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:10 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 4/7] drm/verisilicon: make axi and ahb clocks optional
Date: Thu, 25 Jun 2026 17:44:46 +0800
Message-ID: <20260625094449.708386-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_024512_401697_15439424 
X-CRM114-Status: GOOD (  13.54  )
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

The Nuvoton MA35D1 SoC integrates a DCUltraLite display controller whose
AXI and AHB bus clocks share a single gate enable bit with the display
core clock, so the clock driver does not expose them separately. This
patch makes the axi and ahb clocks optional in the probe.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index 9729b693d360..fd1f5fe67a68 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->core_clk);
 	}
 
-	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
+	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
 	if (IS_ERR(dc->axi_clk)) {
 		dev_err(dev, "can't get axi clock\n");
 		return PTR_ERR(dc->axi_clk);
 	}
 
-	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
+	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
 	if (IS_ERR(dc->ahb_clk)) {
 		dev_err(dev, "can't get ahb clock\n");
 		return PTR_ERR(dc->ahb_clk);
-- 
2.43.0


