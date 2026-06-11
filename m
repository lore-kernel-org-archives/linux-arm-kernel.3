Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FD5CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7VRuVCbEtc0C7t5RgetDXysYNFKdENiHIcQZQ71JcPw=; b=dASIZcOnAXDm6XhiEXIhfG05H9
	zCtNFgugH/BoYbD9UV/5of0pVBmfs0PdO8VE8px/vh/RQ11MHpSJqb3nFrvFkhX+vWBtkJCMrjJvY
	282ng6NvrPZKMI04c7RGp6lSZM3SCGt1dJUD2D+Yj0sMGZpmIkYNO+NVKGcPjVtxI1Lz9CTwaLhtf
	dq42Qg2j3cmMs00PFMdHlwH6G/7DEZWNYJcE6kjjD4Z1nbwPq45f/QZadJavGrRgyRpTIygk8mrzl
	iSAbMJc7TUCJB/x7ehKTVQSauI2KONEuUMiU7tZr4jpSNCwPY6C9Aprzkq4ooPQdPq7seexmQHECi
	5qI/kadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGE-00000008chx-2uiN;
	Thu, 11 Jun 2026 03:39:18 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGB-00000008ch0-2ZhJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:39:17 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso5015723a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 20:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149154; x=1781753954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VRuVCbEtc0C7t5RgetDXysYNFKdENiHIcQZQ71JcPw=;
        b=cmDyaeGjUgJOGVxL79/vk3h7teK266YcqwPlUlHaQrE2GNeNtZoyw1B23ZBBpZq64G
         TL2QrcaVaiSfCXhq3+x1IwyzKdYanRT9NhFXpqqwwOv8WoADcgnSe8vWftOpK8YluGM5
         lppdh6KtK085MMdjgWGl7DqZKCu612BVbQ5jFav/GtEw0AbA+Ffd96vjAsW8hXkYjr4k
         boQvrUg+Am4ezdXnKo4TdqGjPDIm8NE8yENs3Ce10FFevToI/9oIP7r8EPrhITEqL6VS
         Udl7coY9V8Rnmdp0Q2sb7yaFgJlEHB3yGm5M1ase0JlqyS77a5PwhGMPa2aZJy694I6S
         az1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149154; x=1781753954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VRuVCbEtc0C7t5RgetDXysYNFKdENiHIcQZQ71JcPw=;
        b=Z6Pe60KgkmjGF6+1tdLBRdXTx83N5+XwX2bmQrAW1h05fySIO5GB7gaOmKkoYek48c
         U8OuecvWcNoA6s6/Rq+VECjYcZW5dHep/fps/3uLXlWNW49IfK90X+/aG6mAY7NOl8ro
         ovAA62Q8TGdtM06lDl1gGBSECeP6MGYbasg1ghnk1RDvBAfFoe7LJbCz2t760KjXB0in
         134XgS1PhzCC+1saETbK9MF9XjUgi4Xah6Qsw79aiwx/oIz1zOuBuKHuiE0eo0nLEsia
         3R/9MQzAp6X3leV5rbQ0N2sqz64fsnTwoq4UTDjQVTi6W5VHyVyUXDbsXXzaDca8MaPO
         jMYw==
X-Forwarded-Encrypted: i=1; AFNElJ+OsjykZ4ZFrwbppHBeenpO5eMh0svOm1j2v+HnaSF9tcAP3+r1UpOxzsvgdDsJEF6SaE2QzrZDYU4Rqm5cYkhH@lists.infradead.org
X-Gm-Message-State: AOJu0YwhyUSUAUAXN7EINupt8ZLcPDNTnLVqIR4cs/fIjUtCoWQlV+UE
	BfBygkowzzAu6qykSulDD3kBzzkn2EZUFC5hU6GZoaz8EqRpZvMizyU+
X-Gm-Gg: Acq92OGCTAXgsHUC18D8BcTD//4oomkoZXeuIwJDwgYXhL1ImLJGpLVad+y3uD72ipD
	b7MTfikUN3Z0oUv2qAr4zax1WxGs/kWRDN9JSGFbBYhfHE0Ws96lCYSJgx4Okt5QqjH0EgEtWZx
	XhvcgomjOOhJKnLH/nsc6dtAKk4VPWiJ+H+YmHy+bDvknMwNSYWP/Y9iRsXoZ/vpmj8agplnJ2h
	pKN3i0UTiLLjUi5Z6f9D5YZSIGdBaNr+xe2avDK252tSjIKPX3Bpp59F3W8dMVj8w1V82c7iTYI
	5ioHMBZIgq2PFrugBpxfUmF51QXNy22S8/imZHJrnS4BCc5b5MzA1WFbv6GzuNpZ8XEQ1UvBtZS
	ZrIFa4HiVL0PKFVWXoRAg46nCS8pIKX3R+BGRRF/Y6v+A0T7vwx3+mfjyxWV6GHbbBAyKtA4eeA
	EPaGBhAmxJDmcT0rPLpWLO3TrA1vuO8z89O996Aa9vN4WiLYw8d4MfAVpA3W5UtCAx8CWItDdxz
	DuuiuWt0rWSldIX3FlEPeFThw+VThlUj2jeifd4LNQeRg==
X-Received: by 2002:a05:6a00:2e93:b0:842:57e8:1bdb with SMTP id d2e1a72fcca58-843368fc321mr1004033b3a.20.1781149153985;
        Wed, 10 Jun 2026 20:39:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv3 0/6] serial: mxs-auart: devm conversion, clock rework, and IRQ ordering fixes
Date: Wed, 10 Jun 2026 20:38:50 -0700
Message-ID: <20260611033856.6476-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203915_654416_8CA3D2FF 
X-CRM114-Status: UNSURE (   8.42  )
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

This series cleans up the mxs-auart driver by converting to devm-managed
resources, fixing clock prepare/enable ordering, and addressing IRQ
registration races.

Patch 1 fixes compilation on 64-bit build with W=1

Patch 2 reworks the clock handling to use devm_clk_get_enabled and
reorders clk_prepare_enable after clk_set_rate to avoid
CLK_SET_RATE_GATE failures.

Patch 3 converts iomem mapping and GPIO IRQ requests to devm,
removing the manual cleanup paths.

Patch 4 moves the main UART IRQ registration after uart_add_one_port
so the port state is initialized before the handler can run, and
manages the module clock for console vs non-console ports correctly.

v3: two more sashiko fixes
v2: split off of_device_get_match_data change.

Rosen Penev (6):
  serial: mxs-auart: fix cast type for of_device_get_match_data
  serial: mxs-auart: rework clock handling in mxs_get_clks and probe
  serial: mxs-auart: use devm resources for iomem and GPIO IRQs
  serial: mxs-auart: fix IRQ registration ordering and manage console
    clock
  serial: mxs-auart: clamp RX DMA count to buffer size
  serial: mxs-auart: terminate DMA before releasing channels in exit

 drivers/tty/serial/mxs-auart.c | 145 +++++++++++++++------------------
 1 file changed, 66 insertions(+), 79 deletions(-)

--
2.54.0


