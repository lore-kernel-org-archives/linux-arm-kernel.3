Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679ECC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3ymwueSqv0BpYNpyWUdRv4xMRNQnOisJ/XLIc8X3z5E=; b=Y1BgN3eMQgn+xZ
	4JdFCA3C11DY3a1GhRZFlm9gUEDlZ5FzU3KX6EPt5kvw1TvOMgxTiNqH/5VszmgN6O3dPLFElJpmz
	/LByoU/9It4dx2NwkVdp9ZlVMH1N4jlR5IWJ1PGQTLCJvg/4kdn+oxfTudIYKJWhFoe/H6ptoqSd/
	cik43B9hSeAI9v5xJc7piCjNvvcvNyXgk7XHpzc23CHpeIvTGAqdMRlNgRNWoS+Z6AkhaMAb0kAyI
	+yPlM+xR3ORJKaZrFYqj0WPS99ZHP1HIuOBAPrsoIpX6z0/fnyRGHcdAcvSAdHjPtU69YiQIrbQJw
	xOplJqVGvzJmlEhtDg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFx1-000000029AL-1jSX;
	Mon, 27 Jul 2026 07:40:39 +0000
Received: from mail-wr2-x00.google.com ([2a00:1450:4864:30::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woFwy-00000002982-0IIm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 07:40:37 +0000
Received: by mail-wr2-x00.google.com with SMTP id ffacd0b85a97d-470713a9053so641491f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 00:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785138034; x=1785742834; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ymwueSqv0BpYNpyWUdRv4xMRNQnOisJ/XLIc8X3z5E=;
        b=TjsTG6GYwahk2IsXnEkPn40mWNAmpeWrGQ1xiBcqGwBp4phl9Js4j40vjp78SMesy+
         Lr6+jki0DE3Hl5HNB4K96+hc9oDY/BbPA7yk82BmTBjrOJDN72VvgfuMsjORv4bn6agq
         bckZG8aa768HTuWAwZPUor+nmvExt5aHnLMkXj2h0nZkzlmxs6NbF11m9IGanVanWxZc
         d6xh+aP9RDexrSzVbLYh5Rkp62tPkrStirPoxMPP/r2bSm0QJAJ2+owXxS47/W9kzQ6g
         PhNv+K7f9Nf+CSkiOB1MhcjLvuLLbKhUmKQ5tpN5fZ7TRFDzgWmll19yLKVS6oeZ07T3
         ea0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785138034; x=1785742834;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ymwueSqv0BpYNpyWUdRv4xMRNQnOisJ/XLIc8X3z5E=;
        b=V4Vg32S5rb29ChlEdgIW5wWUEpTeLcBtM5jKKqxfNDKrJGCpC66SR1zh2oXQMC9Tt5
         WJIdNuxbQfY9ReL5OckKTLuaGBjZ4pYPgqoGBizrYWL9QIZ/x3P7vYRY92UlapKRoKL4
         2H6AZ5JYqvPOoLuyY8oWZ/CwBFdv2Wlfs7J30okdtXtlZROLTj9PWOPHCcuOmiRZaHdI
         8j638CRJMFNESGgsYBnpabMuoSHu5FVOoH+3OodMYOkH1Bdfs7khcc51Opc2xoAflEZX
         DiLiXqf1bBxLya9ywqWAQ3kZ9Bn0tlJMRwNC8apuJ6beIVM3DlLHXbG0vemIBB9gftCT
         /Rzw==
X-Forwarded-Encrypted: i=1; AHgh+RqMmEUcJG4RRVSWF+fedh6Q+kVDbQn9gs2Qm6TjUORGwBu+1PZh65RT5oMaIV+dxeJEcDMtFeFlNlL2FroYqaC+@lists.infradead.org
X-Gm-Message-State: AOJu0YyuYVktzGNJ9xiS+t7G1vZG0lOmqVZ3bfTzxGMuCNXgZqjbJglV
	mhypRKeeoBc9KSoL/Ot8/QJuDAVO9O3xLpTKkV0FRH0Y5urTEO9FiuWPtSGeQRst2yA=
X-Gm-Gg: AR+sD11A1X2Hwe84kJt+bfriJy2QLEpLD+8Eol6ZPd3ylamiwZEZHbGeEr3XDsiN8QR
	OIuzcYGh81hsshp0ZAUSxysLxXT6xJF2ts8bNoIjBNxR4dGTxTaVA3HYja3lUx9FP4D2U/uyXWQ
	k/PiobAzfS2xWWyiawItEqdxc/M2j1RI2xvqRspuajvxbC3VJUTFyCLOf2ScwV+R2BRN3ZNyIzx
	vvy3vjCSorloUHPLWnkFUnlb6CryP0FtxfUsIwYNGLp1iLdh/NoplZn3yc2/gImapStvpHhD126
	o7XscSs02NAnifgQ2PjB3SEkLCjOI1jwSBZ5Fc3US4EZry2Fc9Gg1ygMT1oZZlaSaPfv/XLZNq7
	zmu1lmHzVd+js4qdHzUoBiKCsDZHI8puSU8t4iMTBNUD7wwxGUsqVOep3NCaplymUto+Av1bHoV
	LxrfwBbLJS0A1ApLK10SPttif3A7TNXrY7GyykOdf2L/S1ixMhZvd3a2ZVQ3eupxdjeXhGPMXmo
	dc4jOQ00Dcvt9Y=
X-Received: by 2002:a05:6000:310e:b0:47f:9425:1a2a with SMTP id ffacd0b85a97d-47f9fe97d8bmr9625606f8f.30.1785138033659;
        Mon, 27 Jul 2026 00:40:33 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bb5127sm43677682f8f.10.2026.07.27.00.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 00:40:33 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v2 0/2] Stabilize serial line numbers on MediaTek boards
Date: Mon, 27 Jul 2026 09:38:07 +0200
Message-Id: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7ZhSAoIr72FYtHUKY5CSFomEc
 HdbvICze8mb9zcI5JkCXLMNPC0c2I0R5CkD06uxI+RHZJBCVuIiajRGRYWwo5Edpm81oBpYBQp
 IpZVG1rq0toKYmDxZ/hz5e/vj8NZPMnNqJqPnMDu/HvtLnrw/p5YcBWor4zXUFHVx02odWHs6G
 /eCdt/3L/oS1v3dAAAA
X-Change-ID: 20260708-ccaione-genio-serial-aliases-e5f2c28b5ff6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_004036_140014_5C231BB2 
X-CRM114-Status: GOOD (  14.67  )
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

On MediaTek boards typically only serial0 is aliased, so the remaining
enabled UARTs get first-free ttyS line numbers from the 8250 core at
probe time. Line numbers are handed out in probe order, and probe order
is not deterministic once a UART defers on its clocks, so the console
UART can lose ttyS0 to another port.

This was observed on the Genio 700 EVK running the Ubuntu 26.04 generic
kernel: uart0 (the debug console) deferred waiting for its clocks while
uart1 probed first and claimed ttyS0. With console=ttyS0 on the kernel
command line the console then pointed at the wrong UART, and the boot
looked like it had hung on the serial console. The failure is
intermittent and depends purely on probe timing.

Pin the line numbers explicitly instead:

- Patch 1 aliases every enabled UART on the affected Mediatek boards, so
  DT expresses the intended serial<N> -> ttyS<N> mapping.

- Patch 2 makes the 8250_mtk driver read that alias with
  of_alias_get_id() and seed uart.port.line before registering the
  port, so the 8250 core reserves the requested ttyS slot instead of
  falling back to first-free.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v2:
- Added some missing MTK boards
- Link to v1: https://patch.msgid.link/20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com

---
Carlo Caione (2):
      arm64: dts: mediatek: alias all enabled serial ports
      serial: 8250_mtk: honor DT serial aliases

 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
 drivers/tty/serial/8250/8250_mtk.c                        | 7 ++++++-
 13 files changed, 27 insertions(+), 1 deletion(-)
---
base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
change-id: 20260708-ccaione-genio-serial-aliases-e5f2c28b5ff6

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


