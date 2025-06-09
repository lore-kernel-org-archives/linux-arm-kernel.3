Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2002DC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=; b=DJ9bIKh7TYVSU33POpUwz6qasS
	dcbdNCW7F2XLnYuWxq20oEe2SPNYAj9kAeugojk51VP8FsIcmMgzOS4VxUtFagMPKi3jj4legqDDG
	0PIuyR7Tm/Jkl6C7a1UWTvnFUmPtUtXfarLcZ37FxdB0m0BdUsSYfUhbBhuhfKT6F6e84YEUtNBFe
	m5u+A64e88s9ZyuZu5O8fBvuxApfBaYlYp9zqwYi1LPkL+Lkf6+IeG4xRhRO2sQO0+EXlwYmi1FgC
	ci3h1NAfvg1PqmfSzffrLKdkik877OPA8U6gx/CrTg+Pmip6WfPkfoE+UZ2Leo6U5BY6r/qa5dbMr
	HK/MZglg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZpm-00000003v1x-3ED6;
	Mon, 09 Jun 2025 10:34:30 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZYq-00000003sVt-32wl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:17:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad69e4f2100so681482966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464219; x=1750069019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=S/S/no6q2L7Bdcg++KjwOfR3+62zDBln/niGEXJq3i0Vrc1mmjE4EnYVw79tIplJoi
         hQ+AW1hnpo3XaIUafEemTQ+BI4OzbW9e6y5Tv5VpxuW2i5LczY7skkZ/gZDQV7oNQYij
         Z5VOhLeLESugGabcyAOH0R2b4Zi6Bvz8Ep0IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464219; x=1750069019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=U8RsfYfcFoFkSM0zirZJqUVYcF2HbmwIa5qaOUXcxGiHUBZPPP21vEA87IzjaGr7Wj
         D39JCmjvEGQOMOcrA6uC4dvdnVVLZ0oMA56/eHfDHGfO61Mn6x+/iZG0j+9VCpnrbId8
         hOL+Mz4/DokuJo1y19XtFSmfNsMVB9SturB0sMU7Ik+wjCwAl/HHvfwV8nig58Poj3Ov
         GAsWOx57yHly+952qgJ/UVV4ODxMyxVPnLno/Z83QW3RHCRnrVKT2yWagMxIOUAhAs42
         mtg1kHEP8y7ppiyXsZCclQlJSinc18lQVqH4Ep1qoHdDTxPrWM4kX7v4S0xDJ2V2zzpJ
         dnRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJZPLgrGFw9gK1e8Eoevr8ctAw4i9KsV8iDXRHeJIH432+sovK51UR85an4XyGNpOD+tvBgP5EHxdMXksS7tzn@lists.infradead.org
X-Gm-Message-State: AOJu0YyPmGoB2eLcykXHc5yH9XJIKe/6fM/LntrrHxpp4M5iWV6z2Ksf
	pZ2i1xNV0mAbyXxidvccJZMH0mzwDcHGxIRXZ1tK1rweYcQa+D83HE70nj70+gRVN98=
X-Gm-Gg: ASbGncurcwlD01Y+GPzGXi0IBnaVvZS7c2rljvxKLWwIbhzK7GRx4xuZXxXu+//Bnsy
	IruX93baplyKS7cf60aGRcxntzHjmOM0kU+Rx3Qs1tiq/CCavsIH+BP6VQgleIijTdf7CU38eTt
	NXKA7fLqOo0kyM3LCvMznn9j1E2Lify1RU2GlCWC8QeKp3lboEU4cLQPlvmSSLyOhlfDRZKYGLa
	S7zTCaYofHY8qAQnQzQLDOOq5nHlVI8Zc5zb3McdJTPzM+08nLwo0cwacMPeP2nM/eL5xTnLefG
	sGn/IlO8mPlc06m/amX4PI4xuRvuquS1BSrkCwc9b2LlRNWf9fGd4GRMKd26dSsviVP7R29SZSp
	0/jTpQZR6yOQj+5cTSHMdRRQTpt1CYFcLJCKwVTRynyLBnuXiePQ=
X-Google-Smtp-Source: AGHT+IH3gsxVUUgw8pn7niv+7bX9R//knvGpYp8ip0Yy0FzSdBl9gPYD+Rs9VowG2jDeFdePscxQDw==
X-Received: by 2002:a17:907:d02:b0:ad8:9b5d:2c23 with SMTP id a640c23a62f3a-ade1aa5d45emr1170457766b.10.1749464219247;
        Mon, 09 Jun 2025 03:16:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Mon,  9 Jun 2025 12:15:43 +0200
Message-ID: <20250609101637.2322809-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_031700_761251_A1917E6B 
X-CRM114-Status: UNSURE (   8.73  )
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


