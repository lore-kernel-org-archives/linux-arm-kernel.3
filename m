Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D67E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 13:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BN0yPpMIVUvy5dvr2cl4F1PFjMYUc3POzI2oD6FyxFM=; b=J3CcEB6syHMk+G
	US+d6DW2/ErISeZHyHCAyenvbgucvuFBQ5oKdvl/ZxiyeAQoAcm1wRwrcghSNzRbYAUpT52SA2xII
	j3QpEhmIrVGQp2Opf7DQmPfq1Eci5nTVU+7e4KKTViAqqWH/nr8o9qRH6p7JA5VnxecOyikqtBB/G
	q2dnovENFUke0UiaHI22iaeVaVg7iYPDw+6QABcZCZXFfEdy2Gh7/zlz+Z385xek42rBA/Lg+y2Jo
	FKryyPxOMuSvfzveiQx4SnOLkj35cNG1KchFN1iSavY5slM5kH/W4OiYI/3sq+awHp4j8oDdRdBIP
	RVg401MqSjtqJj3/XvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVW20-00000008bM4-2dDe;
	Wed, 08 Jan 2025 13:23:32 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVVpq-00000008Yk2-3lk9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 13:11:00 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so2742190666b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 05:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1736341857; x=1736946657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN0yPpMIVUvy5dvr2cl4F1PFjMYUc3POzI2oD6FyxFM=;
        b=EarTGvg1wWfiNd5Twag1MaILUVtWKo5YElwcff/jBlZmCATkNLXQV+QvevTk71o4fD
         VKpfgYSwOVaXYXyUmV+qTvFr22Pb+lW8bif4oS7Z8Hi7EsoW9/gMWACHqZwsBqgkd7qB
         MyJoB+V+U7EN1QfxeDTNX1R9lB9pDn4rH7pU3yj77ZPVfQMsJwifDjHJBm7eOIC5qDEU
         UpE1OWxDDl+8lfRTueEPls6n5+sgusAyqPanrtdPyj2MTTo4hPls/uvjHoBivFmFKule
         eXC7fpApz9J7ukpvtJ3dF7xwa3rk8BWFfigmRpq88U5oUaKcMDpmhuNqqtl7SW1gTgRh
         AkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736341857; x=1736946657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BN0yPpMIVUvy5dvr2cl4F1PFjMYUc3POzI2oD6FyxFM=;
        b=dJkygYulUepWXZMMw4hyxmZ11lH9A7WOtiqOBOkuLalShlzWH3ObMz2B/gqT4fzQ95
         q5b81L7GYaumEHsxLfxzFGHsOxKRLa8PriIA4RQamJbi0wlI72YbvplI89YCYZr2Y2NZ
         mqYzGQ/Prm8GyA25TXJV+TIxLqsIv23jasKkKUCVe2Ut8Y5xnxHQNqki0xUDAn/34/t5
         3NeJlpiysTMxxOcXQX74hTIs+A1vOVDyNL0i2B1VZFaObiEihleSrveZ/qwyN4MdWfAg
         k73Sy4aUhflIDyo7qW5iMN8ntB95cThO7Ay2Nml45Hz1VpPGt/R3BGEf389weyr3FZLR
         1AOw==
X-Forwarded-Encrypted: i=1; AJvYcCWs4hH1FK0xMEZwqjs3G978TFt4B3Sbdq43kzM9GevDEJNXVKuV3lv1oPkdkeEPBsMTARsQbiA+qtarONg3Xk/n@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbm5YCmcZ2qIpyggpykMbQM++QkG0JUgeyORt+UorPyEXxi5kO
	nU2UD4mGzKgnQq4hRGfwgIsy/luG+nZs6uUStD2WPrkMmGU95ls0eA83dcmadRg=
X-Gm-Gg: ASbGncuH/R2nDVWKIIP4dB8HQ5U43pNdtF4IZYPevXIwKWU9MKE8oRBou+JM98teLQx
	HHlr1Pd4smmoVSXTyHAOKwP3bLwe4gcZa6n4dwi5iEK/3+vLu6oifjrawgHUjF6wixj76O3eRvO
	oXt4V12jGfp2OCees4FZKhURc2p68Yo5broOD60/1zAOuTZHC9I+7AIzjWwe55Ljju4/KPM7+dD
	VI21dZnWcds1y8CG+yD13x1xUx91YIPCd9ShytCePoJSvDaGDlaQhP3xZu7BLKJj8af+AG0eCGk
	ig==
X-Google-Smtp-Source: AGHT+IFJ8uCXGWMcgCcfG2AE5znWZEYmo36LP9wm7sevnVR4LMZzKP1YIGgXKdylu5CEr8OTPpTy2g==
X-Received: by 2002:a17:906:6a26:b0:aa6:a9fe:46dd with SMTP id a640c23a62f3a-ab2abc6de7bmr196044966b.38.1736341856895;
        Wed, 08 Jan 2025 05:10:56 -0800 (PST)
Received: from fedora.. (d-zg2-023.globalnet.hr. [213.149.37.23])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedaebsm26159761a12.57.2025.01.08.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:10:55 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	arnd@kernel.org,
	lars.povlsen@microchip.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 3/3] tty: serial: atmel: make it selectable for ARCH_LAN969X
Date: Wed,  8 Jan 2025 14:09:28 +0100
Message-ID: <20250108131045.40642-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108131045.40642-1-robert.marko@sartura.hr>
References: <20250108131045.40642-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_051059_211688_536CC1F7 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: Robert Marko <robert.marko@sartura.hr>, luka.perkov@sartura.hr, daniel.machon@microchip.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

LAN969x uses the Atmel serial, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Changes in v2:
* Pickup Acked-by from Nicolas
* Add whitespace before COMPILE_TEST

 drivers/tty/serial/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 45f0f779fbf9..976dae3bb1bb 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -128,7 +128,7 @@ config SERIAL_SB1250_DUART_CONSOLE
 config SERIAL_ATMEL
 	bool "AT91 on-chip serial port support"
 	depends on COMMON_CLK
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	select SERIAL_CORE
 	select SERIAL_MCTRL_GPIO if GPIOLIB
 	select MFD_AT91_USART
-- 
2.47.1


