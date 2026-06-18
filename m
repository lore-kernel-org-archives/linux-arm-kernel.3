Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63659CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 21:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=; b=RL34pstbmTRBHVZLmV0QEEpD3q
	U7WgMi95Fyff940VpgGBXlIYzib8kgr1pqWBSBqWGgrlmq3vUJQ3UPEiBiz7nfCP4n1WH3lThV3Rw
	1k/Ceb4rOqyTQrJheYPsGQJeT3vnmxPYKIfwi/V18T2NIQZfPOe2ZsgZxmBgHD/ndYnbp643XLLst
	1e5trr63n0Adazaq2GLMgiFW1k/ney2e1wgS+DHKCo1Ey7nFBSc9bxRmO9dNKr9+sZyDi9oUil9mX
	9HDLhpNymPqdKOcfa1fB3gM/ur7C+EMeIV/VAtKK7puaIOmDtFiXwf6aD+4YJ+9fXhu1LfPX8MtcZ
	T+Peubwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJuc-00000001nMq-0JYz;
	Thu, 18 Jun 2026 21:04:34 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJuS-00000001nKC-1IP7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 21:04:25 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5aa61503fdaso2497588e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 14:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781816662; x=1782421462; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=YtooiBOYyEXcavsxiWMH5eJhgIqPaHVuPRMEpJ7sxz9rnM0iH+j5YEttsXvT1gqdoS
         9MRPHMiP4GFSAgiWJ5mInHbuP2F5mbbpfL9s3XcsAz3icEVDspANPwVeQNwyFWdmLTZO
         JrE4a/3WcvElcOj3GnlvmV6b8HrgaezeT995Ih9ac912byR2l0+l5EZ1Y89P7iY4XexW
         ZdANZBHcNyUzueFMNtQFAdaQTjYCVMSuA1zkFaQ7gSnAE1JFO3NJxz+X3fu9wg3OU7dD
         ATmqY1Im/tD0hYzVnBzNYzzRPi/rtV5qtvAlwiTbOtwMs0nPzHYudwZ/ocWaCx5WSwWG
         guLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781816662; x=1782421462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KoOn6a9eFPu3j3lxjvRT84RKODlbnmxk6NgG22+hUT4=;
        b=IAnuUcANzkicrPklJOXTDjsBmsIbkY1nkbMLIZEWTl/+zBL56uuhwn69TqqdEf/le6
         +dVvo3Jzm00s4qOs4rd609W4PacgO4h5UlMeiWkivSP26hSAhS4kZUuUg8UdPmIH3qTe
         BvSKYkf1l8h1atqlnbcpLN1AaMpTRFHYzzv4DY+ifby83rw/W0RDwjKyqnhTNNXyb3Bs
         HSFjkPX4jiXilDX14MT4wqys0gbbTBqvWlvmY2bEG4BQMRcgLZqFb5Ufc40YtuFGX5vz
         oVqmXshPJrBHB1KVWOsJYzZ2tLD6koTZSNQqUHK7TjPgGTyx0QqM5xfcID/dFqkaebSm
         ZbMw==
X-Forwarded-Encrypted: i=1; AFNElJ/8lKSdB2gVQ4/FKy3+tHLcks9hSoM0O/SG31iT5e37FFDIcep5Te8Qxh0Rfa7cgDzMG4DuzcosLLbHx/nMuGLq@lists.infradead.org
X-Gm-Message-State: AOJu0YyPMvMS5rAQThJ2Q5kthbhKOl/TBNUhl+DdhcvwDwY9DEB9Q7jt
	TzWEBswgM6iXE+vqKDD6wXWpy5QXisi9lpJAA2SW5cgfxNRF9H32pbdALNVHAz6W6F8=
X-Gm-Gg: AfdE7cnhTpmHaBQkopuItTZCseu0UhQ1gNjUJsbk0Qdd2ykgPHq/liSXmxA5N3bFlwu
	PWwP9qh4vZ8SCCDMRWqHtHL4SOLFjZHd2Hpi5PnesNjc/2JDs0dnu6XJmbv1cQPpGpNjrZTIoZt
	MSK+QRI3xQEkqCeu5ENIT84aPi+1ByHkuEriXbZ+eeGgEIg8aYeOVOEh7+Ym/mF5nACayHXbz5Q
	/9cbiH6lRU23CsYxiDioWN1lXQi05ZgChmK1RaQLp5mYDI4X7CJNgCXGVrZByXBuYBhdb9rHXFE
	2pf2bUWW5bj1MAIrdhRoY0EVWXYEmhl7HjL/yJPIFQJVbWtP40bh461K2er0jezNhfH/AuxUeYD
	Umdln1B42NNp9Dzf8+PekUY9CBeyZLfblW9ipcvZxP2HVfThNTDpc4rOFY4tIH0LnIpGS+YXkML
	5csw4DXhi6uKbGQF594Zpf
X-Received: by 2002:a05:6512:2387:b0:5aa:684d:3c7c with SMTP id 2adb3069b0e04-5ad571f3eb6mr148655e87.5.1781816662483;
        Thu, 18 Jun 2026 14:04:22 -0700 (PDT)
Received: from [192.168.0.2] ([2a07:7e81:7daa:0:202:c9ff:fe53:eda4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad57493145sm108586e87.69.2026.06.18.14.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:04:21 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 18 Jun 2026 23:04:16 +0200
Subject: [PATCH v6 2/2] m68k: defconfig: update stmark2 defconfig
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-wip-stmark2-dac-v6-2-48761dbb96d7@baylibre.com>
References: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
In-Reply-To: <20260618-wip-stmark2-dac-v6-0-48761dbb96d7@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_140424_380646_27AA3974 
X-CRM114-Status: GOOD (  10.28  )
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

From: Angelo Dureghello <adureghello@baylibre.com>

Update stmark2 defconfig enabling MCF5441X DACs.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes for v5:
- move this patch after new Kconfig symbols are added
---
 arch/m68k/configs/stmark2_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/m68k/configs/stmark2_defconfig b/arch/m68k/configs/stmark2_defconfig
index b3fb95f73a95..3941113bc60b 100644
--- a/arch/m68k/configs/stmark2_defconfig
+++ b/arch/m68k/configs/stmark2_defconfig
@@ -76,6 +76,8 @@ CONFIG_DMADEVICES=y
 CONFIG_MCF_EDMA=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
+CONFIG_IIO=y
+CONFIG_MCF54415_DAC=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT2_FS_POSIX_ACL=y

-- 
2.54.0


