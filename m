Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C74C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wfFNcyRJeXHST09oQCOS8V/CvYNh9zyz+0qrUq7HqK0=; b=t7qk6T2rhA7iChjha7ztnCVFK0
	BxludAWesJcCGkXofGyOX40SPDPu6VIqlE/JLOcnrbnOLpzB74w8Na6c2cN0Ea1I5Ywc0Xl1il5o9
	Vg4xux28Z/SGQOZQTKsl/FSQLgiTYHGldiPfKxQ9sP8bL0VoPc2PaYfqHJqQA+LOozwcl0/cJ5MQI
	8hGmSx9BAqpHwV3YQecXBWkl/+WOqW95sQHZE8QhBRk1m7LM2fatM75aRKP/siH/i6fIsWyvZXRfV
	h6CH5DMFx+9r3sdakVIJ6ISQPHrY1RCWijmMCcM6E5N/BiksoRkQGlK89B9sJdYY4at2UiFji66ko
	ukWGMaCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6oI-000000016nJ-17Ml;
	Thu, 20 Feb 2025 13:41:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl6e9-0000000147w-3cg3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 13:31:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4394036c0efso5752495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 05:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740058280; x=1740663080; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wfFNcyRJeXHST09oQCOS8V/CvYNh9zyz+0qrUq7HqK0=;
        b=D+zpv3rwv7iOGPIpS/Ms0vXb7RoUgHwM9z9MuleqxSVW2RVp+6a0qq2olsmcY3XpqL
         +t9ZgdhCB/AsJde9qK46wSz/RZg1rfadJPsB6nYg5p0s8E0b9WhMR98ROnnnZvOxSbVJ
         R9O1m3hHzTytlTl7CLztreA6Uqn6vgqdkz9SMbvrtbkY/+b66mwMxpi2qM4+DjhwY4jx
         BbvmrOel2npRGDycoOuzBaTbn0T3NPsk20aGdxq0hAUo5ser6G0HD5Xsh+HzUWNJLid6
         18tVAxMpBiFAa5ybeDgNE0HegIbrI4mb9vcNouT/ocoJi86qnavYFSXeqWNUA8atFmC4
         lRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740058280; x=1740663080;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfFNcyRJeXHST09oQCOS8V/CvYNh9zyz+0qrUq7HqK0=;
        b=Vz5mGaE/TT7iu+uBomyxan1J/ZPKLatU3r9hmP7/28ymhKr8d7HKmmxT1PP86KgFYN
         pqLcmAzAJo35Rf64Ewph/rPidY5/wRvjeIxd1emShGdAMc9iQahZGrWvJtyJ+uvj1QKm
         w+uPTxvXkjtaoAAzzsPutOtgII0M061LKy68zpUUrr2CSoqUPEDQa5Da4zsO2vHM01+r
         Wl6I/z24CJseJQ2FA9FXNZ/T2+AXiu1Fr53UwrNDWX7/eo8Wka7Ugf7JREhyicNisyjJ
         hfrkxDrqJnlvi8rnl399TN1PHLekd3Iv9pqhmKB3HzdfLlo4TGcI5PIgl5m4wrG4WN5h
         HPXg==
X-Forwarded-Encrypted: i=1; AJvYcCUJG9MPfIGCbRt6W/D0YsLIlqANXBMb+ryHI2jBgXSt8GGBxEfmkXuGN4sF2p4PCv1mI+5Q995yWN+qnQ7VtpOK@lists.infradead.org
X-Gm-Message-State: AOJu0YwBfk/8exxar/jUWNnIwmtSNWNGEgVqk88igkJC4scykx6Q/lYm
	Flo/M39Hhh2dzrvcWPZWzoPH84mfKxPKIGBTT3/+I7jBahRCPYGH4IEZLQvVDzU=
X-Gm-Gg: ASbGncu3Be1XF9iHD3UHaz/2em4k/so+LbbH7YfIpsPhBItytBCMrySRs5OsiDUaLk8
	ZnCXclGkZroDC4hoZcTFZaaML1XDKWsSxO/Sc6EzcthdQSIltJBmEebYq+yKolaGmq63rb4vNC0
	Ayvjifuz45AtsHgAkv4qBl8lvgLAYUYn6TkohVTnZodUnm44//xzrqXdTY4aertMOaFjr3joKp+
	zax6MREZAqPn2TedpvMpTYJIg8KAOHPdfWkEcZZkhgXig2bjfzkBEfejbJcLx7htpVuHxwsjRaN
	3cIqQqCTJuQD/FCKZUI=
X-Google-Smtp-Source: AGHT+IGIKJFwwjyzaNa7wDD90Jw72yRRqFrFSUBS40JKnJJhsaVDxE8tbUlYfhfiI5/ZtsFFu7lyEQ==
X-Received: by 2002:a05:600c:19ce:b0:439:873a:111b with SMTP id 5b1f17b1804b1-43999da6f3emr77412745e9.12.1740058280223;
        Thu, 20 Feb 2025 05:31:20 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:4c32:9600:f4cc:3400])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7f3sm246757115e9.29.2025.02.20.05.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 05:31:19 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Thu, 20 Feb 2025 14:31:17 +0100
Subject: [PATCH v2] firmware: config: ti-sci: Default set to ARCH_K3 for
 the ti sci driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAKQut2cC/23Myw6CMBCF4Vchs7aGFpuiK9/DsJiWqUwil0wJS
 gjvbmXt8j/J+TZIJEwJbsUGQgsnHocc5lRA6HB4kuI2N5jS2NLoWs2sIkv/RiGlvQsuXmpLFiE
 /JqHIn0N7NLk7TvMo64Ev+rf+dxattHJoKsQQ/bWt7h7XF3uhcxh7aPZ9/wJ2lXe4qQAAAA==
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_053121_909062_5A2C16DF 
X-CRM114-Status: GOOD (  12.06  )
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

With ARCH_K3=y we cannot enable TI_SCI_PROTOCOL=m because
ARCH_K3 selects TI_SCI_PROTOCOL.

Modify the logic to enable TI_SCI_PROTOCOL by default when ARCH_K3=y
allowing us to submit a future patch to remove select on ARCH_K3 without
breaking existing users.

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Link to comment done on last serie [1] we come back on first version of
series[2] to not use imply but set deps on ARCH_K3 in driver directly.
An other patch will be sent to update Kconfig.platform when this patch
is merged.

[1] https://lore.kernel.org/all/20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com/
[2] https://lore.kernel.org/all/20221122202245.449198-4-nfrayer@baylibre.com/
---
Changes in v2:
- Update commit message.
- Link to v1: https://lore.kernel.org/r/20250218-ti-firmware-v1-1-7a23aacfb9d3@baylibre.com
---
 drivers/firmware/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 9f35f69e0f9e..109abe063093 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -215,6 +215,7 @@ config SYSFB_SIMPLEFB
 config TI_SCI_PROTOCOL
 	tristate "TI System Control Interface (TISCI) Message Protocol"
 	depends on TI_MESSAGE_MANAGER
+	default ARCH_K3
 	help
 	  TI System Control Interface (TISCI) Message Protocol is used to manage
 	  compute systems such as ARM, DSP etc with the system controller in

---
base-commit: 2408a807bfc3f738850ef5ad5e3fd59d66168996
change-id: 20250218-ti-firmware-1b7c7f485e5a

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


