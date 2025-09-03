Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5CECA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28SrxqKbfMpenNCR7Jms+O0M7RdbqCMd1LJP2Wh5U4U=; b=KEFTD+ZVrLtqmEfxda304Klm/U
	7bKcIkDIkbeCDFQqvBPYRFF/1tu16ENPOkALovA7NlbLfPjxsMhajEr+OdbtUwovnlEHEu73D++YR
	25X7niILZhgwxMyq+4sSbn4a18zDPtVCtPsA8MQOTafHrez3InkZAlZzQU041e5+d8aHN+CVU95ti
	oO8dwZf8jTuOq3cMCq+A49J+orXuEkb4/cyJxWcn1Qg1QyHvIfm5/fdqWmDpRNp2ounv6lyAJAB53
	0D6X19Qny109+GhaIhcmPomVjPl/nUjwcgLlDXkEszZeerzkWuRACcPHuGaC7xY4prJ/6t45DR5em
	QBNfp39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjPx-00000005rBg-0LEE;
	Wed, 03 Sep 2025 09:04:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPn-00000005Lhq-2Srt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45cb659e858so1626525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886422; x=1757491222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28SrxqKbfMpenNCR7Jms+O0M7RdbqCMd1LJP2Wh5U4U=;
        b=tKBWgoRvaAPTnB/3PedD0pZ3XZsPKtVJZ3zpc9kbHInLyR5l4XD7BZ4n9oG6fpwr28
         NTBMnYrtaOAAqKsQjR5lnPRvIXnRR6chpRBP7e0ftRlpAm02ddiIeOpi3/p+hb6252fF
         e/P3YiRVufaKd6IN+j74Kloprru7Oexn/YDDre6Vaj73kKXdjgVbI1qZ3T/TMZhptMJ9
         RXB5TcBTitMEKFXOi9664EqUXOraIfyZIZwr6H/0iiO9v++OUT3tU+DbPnChGwsYKOHi
         4iLWDKJdzyqYOuZQjWwJokev3tQEIr44hLpkapH3DyKVCm4COcbOwgV3dHHCiSomP6dw
         Nd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886422; x=1757491222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28SrxqKbfMpenNCR7Jms+O0M7RdbqCMd1LJP2Wh5U4U=;
        b=s+vP4w9ZQ/S5Rpu3bosH9jfiWSkgaftjAcwqSt9BLOYELEJdY3cPuKvym0TlXKo+kk
         8KceMvDsiW0vs4Cf2rp/NFWjFXPTEIO39rpHHugi6FNo4EzEJ13YJ2En6ys7MNnQx6Kq
         v/zBS06yIbCIqr2XbwuOLYjCLVnPxBB3AQ5fooyeB+fdtf+wybXGpmrsU2/qyBONVUZJ
         gmmL2QxhD68gq9ra5Evznm2z/fctq6MVFPiHrQHWuBeo+ZRAMppbiNIWHr7UDVN7qpJ8
         8csV3RJA/vGBzbuY/bLdB8YNOeDnFQF8Aal6pXW+BdzRjMYcP5EO88HJO5KQ4sKkI2Ex
         FzZg==
X-Forwarded-Encrypted: i=1; AJvYcCVTucKIHhxY4UVYZVBJTqQEF2SxTBUiX8oY2gzBuCPqPKv4dTRXFiJuG/1X5Nwl7zzjzdHahTQieanVy7SXZdnF@lists.infradead.org
X-Gm-Message-State: AOJu0YyBWukQl9P7NnZiC3/oc6Kufvx200Hknv+JaRwjwK50wDmccsFG
	nvIgzZ/7+g+hjkuGfFDshMpUGMX1Sey7pq24xPPg99zuFWnYpYr7pNlMlObg30xc88w=
X-Gm-Gg: ASbGnctSfytjuitbzvne/sxKTx5HdqWN+2ep7REkaJbeACwJaAUc/eQwnvtNrwreJJT
	hXi6vkPlaPDmNdTpdE4PDy1ifc+rDjJqu+IDZnkV/wnIuck4VEyxpriSfZOi3+9rHLYD3KRHN62
	pBgIXLTgwoa0T+sDBG9xmFxr6cJXKEyuAtQwLq1Lqyehe1Wvx5ftTLET+mxWA4e/xwquWvePaMc
	T61Eo9YsIDgoIiAKou092pQtpMNUsWJhOsHDYsCtxZS37Ac1FF7tNaUdESt6+oyshe+5W0cQ46s
	at+Idr15seZshlqKz6SKSQTXRANP4kKgZUrCcueHS2mxT5wd8VLuzg234KTMkmVefO3g+oNldxr
	nTsmC7lArg9kVpRKhVGpvafcIPV8=
X-Google-Smtp-Source: AGHT+IE23n8KEnm9RVMvzUtmDbHmQx/BpqNBQW7ho4oltG87X/6lye41dV5DPXCUu+eVURRe7SjPfA==
X-Received: by 2002:a05:600c:4f51:b0:45b:9c93:d237 with SMTP id 5b1f17b1804b1-45b9c93d3a5mr28813005e9.14.1756886421328;
        Wed, 03 Sep 2025 01:00:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:05 +0200
Subject: [PATCH 01/12] gpio: ixp4xx: allow building the module with
 COMPILE_TEST enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-1-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=t1lfr9CGD5hAUu0wxuYijAuMnGmaaqaWqRG/nWsgM6o=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WQJnZVk4R49ta4SC2jyrvwBxAkuePGg6LgL
 Ag/zatRYt6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kAAKCRARpy6gFHHX
 cowZEACJ60IcLQ33Gz4l+86NKu9gu7IpmgUlHDd5ok5S+95AVHa3s8fnM0+K4kB56bF83VDaANV
 wgnvG4d+jxv2c+uOb8GaLQTh3wusDzZroIkwQXZtNXRb+4nAF26tcRvI1x5awtyZoCQM0YSwIB7
 scKnSsoX7vafPALdlagy+sI4e5KQNXE/NdRhpU+Tb4GMZIl2bpHxT6vUOOtyOrySECDUityOItj
 SqBuDtgAjmXzJAuoxxmnLyRRnpTfNsSlw/zYyheFaoGKk+Vpg19Y/OG11E+7GexnzSGL1YVdII9
 dPffXmg7PaYnj+HMKJc8dw9SGTJcdhrAXQPtCXiEwZVLuSi3+NyHq0HSckkE8o9PBJ8/esnCDLg
 uiUDTFUOHBKHeXXEi3zcUmxZAdAHgv5H/GlSLo2h7UMXa9W7+4gPE2ItftlQOEYUkAICy6m4Q3O
 GVAw+ZWh16zaNnpdGEokgNkH7wys0wJLg+Plfxet7SUyYkGh+HQONUtKeOBBfgZgVQbTF0THurd
 hPIExC4/Y586Z0iEv3YXgVKp/d8rEnFhQo0Y4k3E9/N4Y/e3D7wlB3RRmjIX19rElcAfUIozH/l
 BGtTomeoRJJwjNtLbB2Iva15e58xgNg8qvTiReFziP918VanQq0LCKcYzQraiwkI3li7j2N8GpS
 kTn8PiXSsFdscfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010023_636478_61EA073F 
X-CRM114-Status: GOOD (  11.47  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 6fd904e29c3e744acf599c75147a25a01a3a2cc2..0fd5b09c499ac8468269b62a306f9ec03c3f7a9b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -408,8 +408,7 @@ config GPIO_IMX_SCU
 
 config GPIO_IXP4XX
 	bool "Intel IXP4xx GPIO"
-	depends on ARCH_IXP4XX
-	depends on OF
+	depends on (ARCH_IXP4XX && OF) || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN_HIERARCHY

-- 
2.48.1


