Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE19C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=; b=oa2XtJZXNeyvRUwOuRSHZ0uGnC
	OPj+QuFiL8V1E8Z8U0tUQvwlNzcqz/cMPK8om7/ThxTWuXwf1v/7rTownybgE95arotNYOt01UFQH
	bS0h2WZruPDWSTtIcE6s1PSIeRnO4ym+e6iQRgRaLzQJEs05aw24Zn2w8wesUwvCG1okVdE4F2ZLm
	DqmgIoDoEU9WBDTIoF1oOOF/9sX31fsV3SNG3HsdwbNGB+BpCosGYnYmrdp7FZkJc3sKnd3wON+v/
	qfkIMJj+ByE3f2xurlit0Js0cHF9JQtVoCygeFxAESQkpMpDKz3sQV1lVf1gi355vpp9+2fGchsLV
	SpGUJrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXmZ-0000000FA55-3QWD;
	Fri, 20 Jun 2025 09:11:35 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSX6O-0000000F3T3-1dqJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:28:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4530921461aso13111075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408079; x=1751012879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=Afa2yg0TYuzShxl6fbRim97/czQe0DL6sgbNpg8F7qlRwqcdjMuyfrndPw+NV8tOCw
         hSb0Lp5T0V2pEcDEvxyws/CuwwJAAyL4bcu2BM7kz0K/wNQOUbAtwcYOz06kgeRl1VRZ
         vtaax7fAusudEMC3bzW6PrqHtJLCb4rJ+BdSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408079; x=1751012879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=FzWuySyJk0VayaEXbp2hGG0vzACDYBHO/T2S8KCifaHuqyAHR9+Q20dLd7bxYqwcVJ
         JMF3TJ/xMDJ3TDW0lztPH5lh3KXE0+BBaEOmlLm586XrgrQtLXPHmiSTX1KekngXGgMN
         bjsqURwbmriS9B2tX/11RBbUXpbb/MCCyxhntDMphe0LoQf32XzdUKjWEhH4OzaQGixM
         6flnw5dNGcBGIP/aFUl+Tag1QLqPn2ElUI3XAADKnKtISFCU/1kf1mrfg8qyTn8lX8P9
         Sv7cpb8GAs6/0JBxk1OhGZxjgff146kCPlAwOc1fq4PA81Q++FHL7SxYrCDUIE05aUKL
         HgYA==
X-Forwarded-Encrypted: i=1; AJvYcCWn4BGqrAH245RQmfDmNA2+YfmmVYpB3xBrlrlm96+04PSsr06IsNx2RioD23TMn5ncztSC6MqU0N0R5GN4fGM/@lists.infradead.org
X-Gm-Message-State: AOJu0YxiOQJFjPJ5mDaKxaPZ67KSsufohfzIRqx9nmoF4ohaTVI9XwdO
	VFHIlWYNWr4NFAhjISqr5ifgSQ5JRs0oAXFDcEdCu8cQQ4sF+v+IJbWekyYhC3QzU4Y=
X-Gm-Gg: ASbGncuz9eFkP5HzTlW3rW2Q/K0Yg1P4Sg7n8pTaIae1esV5EXjgZsaCwNHGmuET+kg
	Zqmwq++HRQEcERGsZqGzUfTWjoQsmxyqPZR8hITwCVfVVT4R2swU0XKnDKJDgf3hcUDmfL0uo86
	FDyECKkLpeZHVpuIjnITd/f4pyVs8pPcBi2EShDjowyhNQwyT/+x3qIIpU5Vvp/AstecP8c7j+O
	KWcBZgxtVV0h4BAdy2Hn0LhFHM2wskpXkRLEZ1TrTfeWdzCDEUrFpr4KE6HMHOZ2MP1CvIg9gli
	9MYbNRP2lpGMy3u1CWSAlbJLL+/eE4hfpPTdyUFp6iaJUhelTy9efolE0ny1th5kYzorHL6S00Z
	4iuqKPyN7D79gQ8rIMVa5nImCM9ihr44Z4jItqMDJrQRh+GZqVBn3
X-Google-Smtp-Source: AGHT+IEZqlrVkb8XWCDX/j/Hz1XI4PFQ6/Jwg9k4S2zDKT2iPFzlG39sL1OWvC8PeJquwOivITL15Q==
X-Received: by 2002:a05:600c:4f03:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-453653a337dmr16663085e9.14.1750408078875;
        Fri, 20 Jun 2025 01:27:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Fri, 20 Jun 2025 10:27:14 +0200
Message-ID: <20250620082736.3582691-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_012800_427428_7DF8227F 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

The driver is required by the Engicam MicroGEA GTW board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v1)

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 917bc8a27794..3181775a214d 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -335,6 +335,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_TEST=m
 CONFIG_USB_EHSET_TEST_FIXTURE=m
+CONFIG_USB_HSIC_USB3503=y
 CONFIG_USB_ONBOARD_DEV=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_MXS_PHY=y
-- 
2.43.0


