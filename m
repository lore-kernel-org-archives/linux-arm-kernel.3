Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198D4C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dg8dUhD3q+CJyCSEW+eoODBKi7tHbn/E8jcu9sHuzyo=; b=ZYPswl06VuvJgj
	7Oczzuk47KxYzhkTSCb16L+3+1G5tMC0t5gjqELjrxpAK/mKmjIbcp+S5V63UoV+n/DFAqJQ1yMlZ
	ZxwwfLkscL1CG/oVnazj5VeOkX8N6fzoMju2v0rpup+JKDsHaQxMOzSLrEAjTChFEVQ/t2G3KxWCJ
	HywwpnGrxb0aStaDBk/ZHXmE2sFocRZ1BIYKHWPDjoBKyxmzYBWuY10aYjc/Bk45nIiKLqAkIqd+s
	NREXw1dQHxXStoOJ3nkNIEeP5CrVhHt+8Ecj7qixdDWJB6G5Jt38Z2x0Z8zPn6rPgnvwfJA8Rqceb
	7eQGRjGrHnFp1IYXNmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQHz-0000000GzR9-2NcC;
	Wed, 08 Jul 2026 11:18:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQHx-0000000GzPV-28IS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 11:18:02 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so2781455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783509479; x=1784114279; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dg8dUhD3q+CJyCSEW+eoODBKi7tHbn/E8jcu9sHuzyo=;
        b=jM0qQOHtd+EqQgETCDiLMabjAljDPzYJXjiKHtmSAFox8OEU3sYBX3TUkGwBvKyql0
         OUm/arFI1OolNxCfEh23OeVKLulcJhH4hEVlAgCckfjAM4QrdaxQl/nT7tX9bpss1no1
         npTA5pDcuj06UKq6CON6VJjQVZt/tZaBgylY43c9imf0t/c3EOgMstBhWqTifetzlSIe
         lJhubhz/0bw5ALx+6o9vn89st6wq190A+e17CgjqtrsDVdQqzwKWR9cjszMqx5zVHlez
         fCSmcXIgNju5jQb0g6Hn1bSvHYs6K4k5PTlUG5THSfeyz6paprWhC1zJ+INtGDWOdVcr
         Xsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783509479; x=1784114279;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dg8dUhD3q+CJyCSEW+eoODBKi7tHbn/E8jcu9sHuzyo=;
        b=aGLpumIHoorcQW+hI3BZz1h0fi1KdErLACn/Qpk8IphbuC1TQam9tp0AEwSbmUbHQM
         IH29GfeZnmdD6EijdPNUbfHkbWS3P0B7KwcLnGqS3rPUPPMrQF9FSjDHI9oZVB76i93a
         5CxfFVGPoQv0Gs4BARCSbADl3ERJYq7N6lcyUIdVWt1trfvwi94PVy2bDO2Oeyycx5h2
         OVZ5kUU0kDKNb/7eJpxuwKpzyPgzNr/ANEcq85tebRaKNFrrS3GdYh80UTCAzUvEyk47
         YF79SsyLRZBXOJKqJGMySjFxyX8G4XXhcpc11Tw6cuJWD9YMf77NgyF9xOEPKA5+Wr9B
         sPmA==
X-Forwarded-Encrypted: i=1; AHgh+RqCglLIkHH5L1qnSpht4Nw5pZQ8mnRyOysdV0HU6HFD0+oUvsMty9NExSUDMvGzqSxSlkjvHAhBqc0kpjwty/Be@lists.infradead.org
X-Gm-Message-State: AOJu0YzURhmGa8rCLWTWLS6hADgiuSD6v7PXSTbT4qLzF8xRofOfs9fJ
	2sQa0Eo/HdlPBisYOHuCCUraZBB8SYop2bAOGPZka7kLkrB+zd8Iag23oJsAEG1lKUQ=
X-Gm-Gg: AfdE7cnkckxgaifKpPS0m+x22wf2sRJf3wla44FYFDTJZpaIM3ZnZ5csmp1w4dKGW26
	C8jmt7ZQ+Fh95l+oFTGqKRdDKMNl5gPD6vYv5eXzTy4nMK2wriFg8yKXu8QliPHu9yGN5LEfy01
	LJpjOT0AV6fX+/qM2Hy18Dv0IcmUTOYpeI9ki9Vbbw6bY8psOCuQ5Qh9pav3CifC7Aaa0RycUQ4
	CZsxva+dUdc4uAOJ1ZYCDHFJDh3TMn1tEr2a3I8FWu6dQ/1gTH/MfCWIiZH+cYh++BFHzzB1ROK
	8auG2AbkXqOfxLkdQXh9QBzKN/VPwQol0dPNd2KaRYA2EhhY8yIRe1dXVEDgj74vMKLjJWxt401
	vV5LuwxfJ/TXZtz0Jt0mHRKAmdLPWPV0GEuxx4XoOLQRgImT0b+YZjhxAL6wEmzZd1gR/4B/oCb
	FqTG0GKSAcPZCAomWcIluGLbY6l7T1al7pW59Y1aQMJHTLGmaZor5T5GOcSsV0T2R6GsYRefZf5
	j0MCzz0lMkLbE9YQg==
X-Received: by 2002:a05:600c:548f:b0:493:df44:2342 with SMTP id 5b1f17b1804b1-493e6831661mr22461155e9.5.1783509479276;
        Wed, 08 Jul 2026 04:17:59 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa (host-79-16-115-126.retail.telecomitalia.it. [79.16.115.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm37867694f8f.31.2026.07.08.04.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:17:58 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH 0/2] Stabilize serial line numbers on MediaTek Genio boards
Date: Wed, 08 Jul 2026 13:17:39 +0200
Message-Id: <20260708-ccaione-genio-serial-aliases-v1-0-bf22229e9383@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQrCQAyE4auUPBtYF1qLVxEf0jhbI2UrGytC6
 d3d6uMPM99KjmJwOjcrFbzNbc41joeG9C55BNutNsUQu3AKPatKnYBHZJt5f8vEMpk4nNGmqLE
 f2pQ6qsSzINnnx1+u//ZleEBfu0nb9gVf1o/ngAAAAA==
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
X-CRM114-CacheID: sfid-20260708_041801_571038_60CAF7E9 
X-CRM114-Status: GOOD (  13.50  )
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

On the MediaTek Genio boards only serial0 is aliased in DT, so every
other enabled UART gets a first-free ttyS line number from the 8250
core at probe time. Line numbers are handed out in probe order, and
probe order is not deterministic once a UART defers on its clocks, so
the console UART can lose ttyS0 to another port.

This was observed on the Genio 700 EVK running the Ubuntu 26.04 generic
kernel: uart0 (the debug console) deferred waiting for its clocks while
uart1 probed first and claimed ttyS0. With console=ttyS0 on the kernel
command line the console then pointed at the wrong UART, and the boot
looked like it had hung on the serial console. The failure is
intermittent and depends purely on probe timing.

Pin the line numbers explicitly instead:

 - Patch 1 aliases every enabled UART on the affected Genio boards
   (mt8365-evk, the mt8390 and mt8395 Genio commons, and the Grinn
   Genio SBC), so DT expresses the intended serial<N> -> ttyS<N>
   mapping.

 - Patch 2 makes the 8250_mtk driver read that alias with
   of_alias_get_id() and seed uart.port.line before registering the
   port, so the 8250 core reserves the requested ttyS slot instead of
   falling back to first-free.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Carlo Caione (2):
      arm64: dts: mediatek: alias all enabled serial ports on Genio boards
      serial: 8250_mtk: honor DT serial aliases

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts              | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi    | 2 ++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi    | 1 +
 drivers/tty/serial/8250/8250_mtk.c                       | 7 ++++++-
 5 files changed, 13 insertions(+), 1 deletion(-)
---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260708-ccaione-genio-serial-aliases-e5f2c28b5ff6

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


