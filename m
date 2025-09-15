Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B8ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SAepVheBc2VKd/HWr2jgYD1wCXMnZhybbLdY99EVCQ=; b=ItMLCmm/25tjnJTr5N6CU4kJNq
	H3whI0v+lYwgoV0/KZFyluPAW8epklotNndtIWxrKUCStCqXv1aFLwFclUfXCX9kPpyvh7z42mxZG
	uuh0Z74+xcxKs3ivSjNWK9m837xZDcT3LXJHcsyEb+frn3uyzwNjdHgnlDGPUfEZDJF9BNNmT/whN
	65miKk7dFWqC6RkRPue8IEteVUGb3bOWXrywCkongHNYxnAZGS4n8KhDHJ1liKZ56nChSECDcuzhz
	UKTG/pYUQs7MY/iuzoEei1kgfNVib6CrtDf7nhXM+U+NMiIPQqg3TGmPP+ajfSxG/qo0bFu1ZFpkq
	ZmQhFVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4ek-00000003EFV-0QG2;
	Mon, 15 Sep 2025 08:33:50 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4ed-00000003E7m-3zwB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:33:45 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f753ec672so4309793e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757925222; x=1758530022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SAepVheBc2VKd/HWr2jgYD1wCXMnZhybbLdY99EVCQ=;
        b=kk8NF3zDARxygVg9PL42glyPHUsidL+gYREwjVlg8mZP4CL43JfUiAHLHQN3Yh5pgL
         bjEYFbJVyXt6r2PwLEecOTkaxEtFsHs999Engt7K9DlPOYef16FkeuuzVvwO0qAdOB1/
         ZrDz7RdEpC0vkzAVtTMElvfJ70RHNTrIo95wn4llXTx3W+FmxRASPaTtx6Xd0IlRpFWE
         jGJW8qjUfSKYjABHPAZFBtZ3F5yI8y7OQh4hyP8cxcMhhFB4j9UGEC3kd7iEYtWfKxUI
         uu0DaKJUiC+kCxtmsyRSANvxwnrn4TFt2UsUsoaWbE4RW1BqSfI1osplL7eFmM9XoGCs
         6nzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925222; x=1758530022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SAepVheBc2VKd/HWr2jgYD1wCXMnZhybbLdY99EVCQ=;
        b=IWuc8j0fe+yyUiUCm3P6ue/t8JLAEP8CEYg71HVT0eE7ygGeTrQyHswWzd/1zxJHWw
         nVtcDyp39C9LEeHrncChlgh35XVTSDLOY2luy4gPxWgq+TrvI6aRLDPmrFrOmmP7OEOP
         bVrdWtz6esCu83yAULd6tgQbW2UrDf6+CtC+cPZrgH3ha0G0Wl9bxrZWx3GAGfo+8go1
         mZgCHWYPnEZYzTB+rziVRNu7cdF9cSEzAeT98VcyROllymPpx9EccsHaJFt4Nh6bjyiK
         vNevuevCkovcjTivpXL+Y1xyPHkoRocueoE9mhb49iMqvzE63VsU7UmVps4b0d7nvaEf
         R09w==
X-Forwarded-Encrypted: i=1; AJvYcCU2lRVXgxfzWVjWuVZd2Xk0KD4VsdOSimLsCxw7vC+1JrzgqnMLqR6uxPfisYBKd8rTy76KRDpizmV7f6MFbWXa@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8SgT10+3RKmEbfRwW3/rQgFVxudknnXGTKwAoZRMkR5NY7ujK
	Jv2RO00927LuGwAjcCPe3LoephulcMaSsYkxD23iEpPfeZ13Y3V3H5uvERr88uhSeZw=
X-Gm-Gg: ASbGncsCunv6W9tFUOFYP0d4Em2Wg7bOrw3bGkamTBNNrNhW1uT/skEuV6PCEblkLzc
	vNDWkjm8HV+dyLahQBu8v/jJk4wHkRDqGMGN9i4tWWsquXvmEwuKyuaFX41JGsfj7yruiNfAZ9/
	rXC7pGdsel4Go6l0e1HuWEgospMNsBuZublPhUT8OUzx7dW5qjVWdbZQpIDskGyQfe3VIKjI9IP
	uF2Mo7fCgxF8YNnxNTA7T5dbEgGI6iyhbc8ljSnNXOBTuwCUS/IxQZj9n1NWzu/c5pPhGd2hUOQ
	Kfms8PJcyKMzYX2SonMSrdJ0mPU6SkuZLXNzK6YQC81qhlO5Ko69CsK72V6ZOs6ZIzE7vB/T+/l
	3PpbhtR4RbJQhSUQOTTQ34m/dAKxYEN4LJA/n4MF+8ymrBNOw8aYxoZc=
X-Google-Smtp-Source: AGHT+IFijRhuu9NRr2ZBM2GuQ4gfxZbDSURIOqckSOM/gNBlLBKx7V4oU2eD/51Fe4veRTnL+2Myuw==
X-Received: by 2002:a05:6512:4024:b0:55f:3d7c:3880 with SMTP id 2adb3069b0e04-57050fe1dd2mr3397083e87.48.1757925221761;
        Mon, 15 Sep 2025 01:33:41 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a6a33ba8sm2335142e87.46.2025.09.15.01.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:33:41 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v4 3/4] mmc: select REGMAP_MMIO with MMC_LOONGSON2
Date: Mon, 15 Sep 2025 11:33:16 +0300
Message-ID: <20250915083317.2885761-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
References: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_013344_024737_3DB2FFCD 
X-CRM114-Status: GOOD (  10.07  )
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

COMPILE_TEST with MMC_LOONGSON2 failed to link due to
undeclared dependency:

ERROR: modpost: "__devm_regmap_init_mmio_clk"
[drivers/mmc/host/loongson2-mmc.ko] undefined!

Fixes: 2115772014bd ("mmc: loongson2: Add Loongson-2K SD/SDIO controller driver")

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Suggested-by: Binbin Zhou <zhoubinbin@loongson.cn>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 drivers/mmc/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index b14daa045eff9..394724dcee8f8 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1116,6 +1116,7 @@ config MMC_LOONGSON2
 	tristate "Loongson-2K SD/SDIO/eMMC Host Interface support"
 	depends on LOONGARCH || COMPILE_TEST
 	depends on HAS_DMA
+	select REGMAP_MMIO
 	help
 	  This selects support for the SD/SDIO/eMMC Host Controller on
 	  Loongson-2K series CPUs.
-- 
2.34.1


