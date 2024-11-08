Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEDBD5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdZLopVjyjhT5RSAFFKohTizpIqPLaJt6XK15njFe6c=; b=uWdGOcp2l4PcAD
	Pp2sZSmKo5xDHPK51cQLNFziCbS54tY+/NZ7fDtl+2u/kN5BK1Vhz53euIM8DcVTgFGb4umjpelnY
	mrC+gDeECQpPY9Lw4A6XfybIFUeX0wp/qcx1pwAjO0gaOnHkg9xSp8Xmiec6S14up3U9XnWUQH9+L
	i9OHo4b2mxFUSNlgR37bdLzliwFop8L8zoDYzoe4Zvvct30oWnbnOInpwvO06qYTp7uPI0wbGck3L
	Hut8UwxTPUYd4Jiya+FfvMX+68lLLRT1AAZ4v7NzB2rCyB5Qr6lftBu1E3aoJQwJiGX6gO6G2phz0
	STV0hBZyHKTzQmSGyrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PwS-0000000AqVW-3FsR;
	Fri, 08 Nov 2024 14:26:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PVx-0000000AmNO-24gW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:59:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d4821e6b4so1381505f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 05:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1731074343; x=1731679143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xdZLopVjyjhT5RSAFFKohTizpIqPLaJt6XK15njFe6c=;
        b=LKg6FgP2/PV7rUsGdmsW9birX7l4fn+vfWYWy5tUw2s2Cp3nPppsk8acFVcztXRzIs
         f5PGACewKGC5fTTG3W5VP2NE/OFltH1w5mo9TmvwPa4kMyD0siwEcz4VA8RJFaphDzUo
         4D0yOnEZ9ibt4UvzYBLbD0f3S/j4/0IYc4u14VuCN3mCevB/RX4ed9gLxOSLrqyaLgKO
         Z/JmbWJjIfpQyJYYyld/Fj1qiF0AqnGf+W7nMg1NqLaTt3fT4Jl0bSBS7mhc0TIGUcL4
         IQtRsUgkSfkkw9hdCjDOrQcE1cdcIk5zweRXFE2+UDnWaO42QD8YZXiOX+Df5xey4Y/1
         UaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731074343; x=1731679143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xdZLopVjyjhT5RSAFFKohTizpIqPLaJt6XK15njFe6c=;
        b=mAktU0BMNZ/h85a1xrz+KL2lKLqZg4KHBh7ZqXA9cc7y4zWJzGiKSk9EggDIZyT/X/
         16EYC0RsuBhhT5/L7o0naKe+Y6q0j7/ngf1rXMIECvD/9cuis7OJVazqStWYu9meGm76
         N0G6Fdf7DvXnDw97B6wSM1FxMzSSXb0SlDl0Tc4m6+tZFRJ4sfuLWIlXfiHYAkYngyv7
         EW2+twA27xML0gHXtK5F8dy1/5Q4ByJISQJhA2zbLcfP6AO3ak3TS7ToiPSzYdBoy1U3
         A7kmkL4RyW0ZtlDl4bnRi/+GDJq3Rr49l1Rn2h/AH/khh3BvKmN5u3gX83Aitp65+lqQ
         HHoA==
X-Forwarded-Encrypted: i=1; AJvYcCVcvfmfwFibO+I3zgPuvvZ2fFyJxvG8KELLM4GenLh6nJblFEzQiOgTucLbZo2wOauDO0ja7KkrNq2Ro8poPAT1@lists.infradead.org
X-Gm-Message-State: AOJu0YwWz6M9zzyKXKs05deYA3h8w4bJJFYO3meRL4Nu73Z/1iZ+o+Vr
	CttN4ZRNFheJe217rehKuvOMz2df4J/PDB40C9lALfMUIIJhmV75c0Mfq6Wpu50=
X-Google-Smtp-Source: AGHT+IEU+4qezTXoyunjCox4NNDvtuGiupxZONMcrWhdVQ4IuBx9NDZjHYgJa4s0rv587Kx6mZc+cw==
X-Received: by 2002:a5d:59a2:0:b0:37d:326d:305a with SMTP id ffacd0b85a97d-381f1866f90mr2485874f8f.2.1731074343506;
        Fri, 08 Nov 2024 05:59:03 -0800 (PST)
Received: from fedora.. (cpe-188-129-46-99.dynamic.amis.hr. [188.129.46.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-381ed97cd97sm4924431f8f.27.2024.11.08.05.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:59:02 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lee@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 4/4] tty: serial: atmel: make it selectable for ARCH_LAN969X
Date: Fri,  8 Nov 2024 14:57:34 +0100
Message-ID: <20241108135855.129116-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241108135855.129116-1-robert.marko@sartura.hr>
References: <20241108135855.129116-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055905_699951_69C7A26F 
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
Cc: Robert Marko <robert.marko@sartura.hr>, luka.perkov@sartura.hr
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
2.47.0


