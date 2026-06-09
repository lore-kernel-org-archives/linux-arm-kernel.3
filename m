Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AA6CD8CAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 05:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PsT1Zt8eX96C5Vy0ysyPoJWLG8nBvHsoCwEXo1y0+xg=; b=U/ioKhWdYLWkmcr0e9UgCNsfs6
	NBpkaRmQ5n7X0ThdayLJPPddEHR00IOuL2WZT6UOpVD67xEalDjI+d0OIHcrAtMiZKC+kT3LQl7/t
	sBCYAQVWiT/i8RLwhHzo3IammvXGoC9CiMRpL232jRhjIMghCBQ14/ckLKigwQeRST1jQlMs8if/j
	uGVH36L+VRgcQkQjJqXb2AR+QRc7iUv8ujSrb/TZ4YyFxh2m4g/liKQB8JR2Scl4fBflA744r0y5w
	UitE5SpMrnAl++X5LaGTnbkECJKFbqAOioXaSjCkiYkJhVHBql0hsxjg+C34RmGsASqeWnw6jIf+3
	4gVJo0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWozK-00000004kkj-39Uo;
	Tue, 09 Jun 2026 05:26:58 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWozH-00000004kjv-2R6r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 05:26:57 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-842288702fbso2030194b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 22:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780982814; x=1781587614; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsT1Zt8eX96C5Vy0ysyPoJWLG8nBvHsoCwEXo1y0+xg=;
        b=aUX0ZLJ2CLr6wPGMRmMCQZVZm3U1bcouzA/ufn6DBWBlBOdPjeSAuk0mOOc0i6jTDE
         ULOn5dde5q+uoMAS4jtNktMtqjBKkanP8+wtA2zWAeHNPe1J2b9Mb6hQDIW7ZVU5ZYD5
         Qt8Z7Cs8UPfZJljb2AnUANIaHQQIReLTBaZ8e+U4qpPezYdwYF/ZNBmutpOwfA+DjLjs
         WFS4jYiaTd6YuwTuVgsb7/O/QZWWL9wt0E5mbMr1O9G9muBzPFjivg373CTafBrUjzN3
         KBcVfB2RHTNiLH7X39/jXmSByebUPjMDzL+5O+AMJv3qTB8oIV8vMI8BImrGUtN+aDOG
         Ig4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780982814; x=1781587614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PsT1Zt8eX96C5Vy0ysyPoJWLG8nBvHsoCwEXo1y0+xg=;
        b=gdkEnKcBk2QyBLtmQFMFjLf6XS73mSZ9hisGpL14G7yWxS1kP180GBKWNLCRiCqGEG
         Sjq/9qYPqk7gvBdqH0+Js0jGDeKMikTgdnVokulmUf9bQL1iCxhrJEZfgJQEbkJ1BcBV
         ZDD/V9pjiKZq4I3X4N4KPDUtnHJaEPJ6fILRLrSYUukvklqSm9d/zzDgeqR+taEK2Y6Z
         kYND/614QYS0i3InQjxALsSwhf6naSsAUhX5W0HpkcOx0UwAzUGfwGSM2erB1rNXC3jk
         x2whcO65OoUSMa+Gx5BiqAko8wPy1jHdNS3772gvsqMnPE6xdwxSJNQiePO05biF4gmy
         oSDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IbasqjyMNu1Lt9Y+hc5NSy48jJLRKqOu21n8c8O4PaXPhkHCwOpiMivyUjYsSUCQOuEpLqXIxVtkBptc64Eu5@lists.infradead.org
X-Gm-Message-State: AOJu0YyBCRwGzdorIktbdU5ZQK65b+zzDJF5lh2BDX39ncWC7mb4bj6b
	GfODEvMWgagluCszJTNMkJDitnHPoSx/rEyJqV6dCtxE7/JvHAVduhB9
X-Gm-Gg: Acq92OFqAK0Z20lQ+fIzPoHfrhkjr/gi+Dvcx9kDZSwT1aSbpraPF3o1EpC7Zo7vCcZ
	0j2j8AlHDteocnrLLrxrYM8ZJ4/468ZlRyoTE9muoIBoM7k3yphC2aMGu87SW2LutLKn85fvOoa
	8XCKwYsEpIDMfT9RwmBEFt9j9LPGapZpuEwqaqUnMDLO2DhG6FmVIYcI9ngyoar9HNB01iB4EYH
	QolemGUpM0S0C3m1LXOKhADKmURg9yFYwAzTJc6e2FDmiDvAphPQ0eSFLfgW/UTcEZ8ItS4V56d
	Cw30aRSK2jrLvhy/gPbjWEeundm8zqmQpxvE08je9q5XBClqs0UIaQYoyIkQax1/6jC15T73mWs
	Hzw5vxpP7k6dFerc5CsJtoMu2/T+PT+qAV8lDTXiamxhwg4I6zGWbxzDsuqBcYekeFbO3KdEkjq
	4pziJMVUy4U5m5OE94ybChQkhXfYRwy5qahOKH22PBuVrxP/VM5xXeEQ==
X-Received: by 2002:a05:6a00:1d84:b0:842:5ea5:5fdd with SMTP id d2e1a72fcca58-842b10b2f1dmr17770012b3a.40.1780982814465;
        Mon, 08 Jun 2026 22:26:54 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:37c9:44fa:729b:6aaa])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm23445657b3a.49.2026.06.08.22.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 22:26:54 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	linux-spi@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] spi: meson-spifc: fix runtime PM leak on remove
Date: Tue,  9 Jun 2026 13:26:47 +0800
Message-ID: <20260609052647.5-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_222655_624256_FCB059E6 
X-CRM114-Status: GOOD (  11.52  )
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

pm_runtime_get_sync() increments the runtime PM usage counter even when it
returns an error. meson_spifc_remove() uses it to resume the controller
before disabling runtime PM, but never drops the usage counter again.

Balance the get with pm_runtime_put_noidle() after disabling runtime PM,
matching the teardown pattern used by other SPI controller drivers.

Found by static analysis. I do not have hardware to test this.

Fixes: c3e4bc5434d2 ("spi: meson: Add support for Amlogic Meson SPIFC")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/spi/spi-meson-spifc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index b818950a8cb7d..e2d19c3873f71 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -351,6 +351,7 @@ static void meson_spifc_remove(struct platform_device *pdev)
 {
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
2.51.0

