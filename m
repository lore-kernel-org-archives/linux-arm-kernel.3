Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A646C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 10:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=; b=r3VfJTsY0wj4Rx/4s9xIGoxFFX
	5zxGhRM6nLwldvnQEwyRNO0eYfIgoMBLXietYslpLcidW86kmCawXRjKctIlCMYF/mW0mhlwNldhI
	OE8W6OfjHW003Ky7X8asQfpUA5psDweCidNDl1HSxAumfALUampZxXbHFBLVtR6DIqulsJZGeiFwZ
	tO7wbi6jCCb5lRGrqgkTR31TD+aGVxYGox37YFQ3wcOij0JE48iQOojOVHq2gXmnMzgjcLCFuDZjb
	ommSQKRPCOgvm6ewLR4e2qZSJmVmjmYqfPR29kz4LgbvmldlcKvMvWomqgVBDUQVf+10D+GXWJmJn
	25WoXszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPf7K-0000000CyEx-3IuW;
	Thu, 12 Jun 2025 10:25:06 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPdvQ-0000000Clso-0SwU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 09:08:45 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60700a745e5so1712157a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719323; x=1750324123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=g9DlW742oucWa9FZlP4NN8L/Xs3OI3w+/XSD8InZFbnk5jzAfBjcxyVVuV1CMTfYbi
         4LlynuirC6JTPI7PVOjq0rw/zP28daVNDAV5MtwPx7yYPWPaBPA4QO/+N9Ynkd4oz1Ch
         72iZvlYmjAiIQE0J2Dt5o9AMPAuUd8FMcctus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719323; x=1750324123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=eN2XuklzMwPYfscp+y9bUMWQT9W/KJtWPKhiTn+zIoSXYGmaE4nMI5kdXIVCElCIpd
         jqVFaJC7xhWPBylUQN4l0cX4Msp3Z2JtZPwNxq66anYaHv9CDdeXheD837qc/0Ln0whG
         QDuCiBf2AqDescrxG4VXnfTYG893QtnqUhKIVv/xnYhDAXHidK3JeUsOONSorfyDxw/m
         jKk04zpp07i/M0xons5XHZuJrur4dHJkCFAWJ12rQBNWD/4O581PA3EsTw6YbzjeOM9T
         2sx/z4udysWBoFlNZnW6tJnA9Th5b5sFTJ+ooZG+NZ5Civ70bd6EZ3lrdqtAbOB/WoF2
         1sZg==
X-Forwarded-Encrypted: i=1; AJvYcCUc6edLAT/RfvuCGdrejEZiC0/BsRg/gmVWAfv5OnkZlSfh3Qpw3k0IhBEi6nXhXslL9Q42QcHI7yQI54gBnUZz@lists.infradead.org
X-Gm-Message-State: AOJu0YzvffJTbptT0NRExN6MHu25Kc39qcbP3uoSQL2EYE4rjnM7wkaT
	HLUi6MSd++M0gaNvSpK73FMS1MPJKvEkB8a8wuKin0u3HBrP+5ZxOtIF5MNUvatCueg=
X-Gm-Gg: ASbGncsWBK7ziVa9ikLVVLRqyR96QiIyzYD0gX/0fpTpU7D9wZ6VfGwh4jPd6SlaNDK
	t6wufcQPaJY7XcCai34K1E5OCqncKESVkRbFmh2fG1ca2+P9jFuOWhePgs72mW4FZ5IWQbr8eq9
	vFALUkad68gLqBndg1p14Bp9ZfF3WukV7NxBcdYSTvUQzk9ffJDuTZIBfIbBsirk8u6h3aanNFy
	QZ8w/sJrEMLLuGTWfcaDhf8Mc/X4LDGUtFS7XssvH0MWcICyU/O2oGnO8nR7j2UKx84OkhycOqE
	qxNgkbC7BZfCVjtwGZj13IVHGPtzQbsECu73LXQy4cK/iSGAkuykr6IJ/V+69jULcQrxpBVTMvx
	9FfznQGMPuL/YbjiSWWeBe6/Byg==
X-Google-Smtp-Source: AGHT+IGLgxdTIlzHs7JaFpku8ceuQrPftbNjrc1l7HlbaXYmuJDrccDuH2O1OVWpwHgXuFJgjQprQQ==
X-Received: by 2002:a17:907:3d90:b0:ad8:adea:4b15 with SMTP id a640c23a62f3a-adea945fc49mr220539866b.48.1749719322553;
        Thu, 12 Jun 2025 02:08:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Thu, 12 Jun 2025 11:07:55 +0200
Message-ID: <20250612090823.2519183-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_020844_141609_17D75D30 
X-CRM114-Status: UNSURE (   8.76  )
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


