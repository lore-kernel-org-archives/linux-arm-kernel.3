Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DE8C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WazcjzkIAdsaj6kzT/3JxFcBr2wvj1ct6YfgbM8kJLQ=; b=3ES63kCKe2cQeN
	gejoFoXdFIvm1q0WKudhChcXxffZ9xwRKGxQ4BBI6mF6L5S4EIthGzf2ZLSJwF55Pwnmtl9LE20mQ
	jcJecB26Aazt9R7nHQLtIxDrrqNcgEKtJx7qY6TOFTzTSgXPOKcjpN3wvqeY7gTek0+WAZWMapm/G
	vc0E1tOabbACM3FCjcU1erT0WTAWAzIu6dzfP5kQvAouXJykUpkijvspLZi9cOiBsU6R97wCzT+N8
	iErpzOPY/lCt+qgE9uN9SY/0Bs1nW+vx1WiSO2FmCWH5PcJMYroTyl8gJN8dUJap7LZG0HnoIZRJ8
	eHNeLSQOY44FkzXUYm2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SGg-00000006Um5-3N1K;
	Tue, 15 Sep 2026 12:28:10 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SGZ-00000006Uhw-2wCE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:28:06 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4b11so1648115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789475282; x=1790080082; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WazcjzkIAdsaj6kzT/3JxFcBr2wvj1ct6YfgbM8kJLQ=;
        b=O/q8KgjXVDV8h0npzoDZyuYoqxkHNqF6OZVgwmVEBdJVnA73sJOU5As0c5iwIxKWp5
         5JTn9n1HhlzFdrxvozbNJ1DtH4esqLMAyIrS5QTvO5FgKFgKYEjQzyYdz5LK2Lri64M8
         uteJlITgxSIrvTq/7Jbm8QGT6BO/S9c3C2F55RuX3VRZW8lRCKzOQJOmJOyfWgKoqFtH
         lkQDv2P4WhXRO3/skPQSk0bvOU1yiHwrFzQNiZoYtuDmgqlfEbW4uO1TNyH2/RzZmEyz
         CkNaY0/RwMQl/HTicxjULcr8pvXkikzP8abPnjyjlm6dYLVRzIN/7aSGoEW1WwXn6njl
         o8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789475282; x=1790080082;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WazcjzkIAdsaj6kzT/3JxFcBr2wvj1ct6YfgbM8kJLQ=;
        b=j+j7jePR+UhjN9z0P+xkyJNjdosLF+GWbBlnYnDxfeTSaK2+TrZDQg8Kp/QJxsIEHs
         O/r1z95Z0xfvuG7B7qAIIAT44uELlYsEiWQv8/bB79tB2zESK6YXNsXfAJ3uw9f4p8gJ
         0v+OhItG/NzzmywQP4NuW7nhzt8QFj+TrGsVwE/eadeQFnaXRMU4LpObxvnbhMvXU8S3
         G+007HkN0HLyirE/yj40gn6v/IKxRKLbbJfs1URLHfa2YiIafmrtqXXJ9u6U3jWjTzAo
         kFRUaKGG5KFjUpr+WI2DRXIvYoXUY+d3w5E9TtnpyNpOZE6mFCRTT02WCHjnpELE9bcS
         omFw==
X-Forwarded-Encrypted: i=1; AKwUvByuFJ0tRV/oqegoKxOh9d+U0FGewIldgQ/2LKO+i4eEorgLOE/rYqHD2CZX5zhO5bqKu77MlmtC8zGthY3joLOZ@lists.infradead.org
X-Gm-Message-State: AFuF++lHG+B59WGAeMIFH5wfuS/B9xrsTk8Hohri1DcAgT39cZxMYnrD
	qkKWrRTunq0VOUiLQhYLYgwhR9xbcMSUeJg9hdmnQzDzgXkVFmhV7jmdsqsfeQ==
X-Gm-Gg: AYBFou29lkpaMs3xqqu8RSSkwwe0ABF35uU8vyYLlrHwMYx+sKkJ6sYlyHrxW+5jM4O
	4k0m3ZAaPmwQ1MBvJr1PH4PjUVJASJHox66eRW1Z8higivpWHonLE7di+D7r6PoaLIh0s55udss
	h0ArWW4O7wwhSQdU9IVw/qLVJwK5OMH1wNQfY3svOJ1g+wMWaDMCSo+WFaNw3HGTFDU4LT4TxpL
	/YsusqO0THmA+QECoxJ3bLactP5Ahy36YmTm4KFaTNwMVvic2jCR80v1CDLc2J9BLxOPCB9y1os
	oL1M+1U0lnwF96GJL8xCMO35k/0rJdyQeG7h1y/EvrrKSwmUI+U5agfI/XzZtRfKG87hm6d4h8m
	C2xPHOpZzjnVq4Ymh5TIg7w5Le02iFUHjZY+G7aaCiX9P3xuFExCymgIeMoNqnZux9EQ/lgDe6c
	5bTllc+S6RDc7HlNQizvDSGzDE3aQTaNF68ldMEH7xi9m6UOZ8FVSWhDiR5p5/ajBRx7iqDzQ/p
	KZ3M8bSI72c++oE08qI/hwO1o6yfnwvjK5ZLiRgl2qFZTVUEc/TwA2JUMt5TGKh5t0=
X-Received: by 2002:a05:600c:4e4a:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49e8228f824mr15102105e9.18.1789475281666;
        Tue, 15 Sep 2026 05:28:01 -0700 (PDT)
Received: from [127.0.1.1] (2a01cb0007c59900d73f8285c1e647ab.ipv6.abo.wanadoo.fr. [2a01:cb00:7c5:9900:d73f:8285:c1e6:47ab])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6bf4desm83105075e9.15.2026.09.15.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:28:01 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH 0/3] media: rockchip: add support for the RK3576 Video
 Capture unit
Date: Tue, 15 Sep 2026 14:27:55 +0200
Message-Id: <20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMs5qWoC/0WNywrCMBBFf6Vk7UAzzSSxvyIu8phoFLUmtQjiv
 xsf4PLAvec8ROWSuYqxe4jCS675cm4gV50Ie3feMeTYWGCPurdoYcnBTVCOAxkNmo2Ull2PSot
 2mQqnfP/oNtsv15s/cJjfjt+i8PXWOvN39s+M3S9CEGoGhBIWiHMFYyT6aAcVWY8LvjXeVYZwO
 Z3yPHY+UlKW0pDaH5G81WQGJlq71HuDpDgpaZXYPp8vODiI1vEAAAA=
X-Change-ID: 20260828-vicap-rk3576-6e7118ea0246
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789475280; l=2501;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=fjgaxYIkHsKMCuCxbpX52v0NBvL5DHy/++HiJ3R7ad0=;
 b=p9QzUFEagfxIF+66sL2fgBQy9ZfkQOV2yNuM1urHy+dkfInoi+sxwkJKWB/FT0x3gg10Ims/2
 CoWDe/9nDo8BTaMVgacfHx57PWnOhfXxp5lc8ZkaaE7HTDs8Rj8nMC7
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_052803_773134_9A906220 
X-CRM114-Status: GOOD (  15.06  )
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

This series adds support for the Video Capture (VICAP) unit of the
Rockchip RK3576 to the rkcif driver.

The RK3576 VICAP features a digital video port (DVP) and five MIPI
CSI-2 capture interfaces. Compared to the RK3588 variant, the MIPI
register blocks are laid out differently, the ID_CTRL0 bit layout has
changed, the VC/DT filter has moved from ID_CTRL0 to ID_CTRL1, and the
capture size is configured in the new ID_SET_SIZE register. In
addition, the pixel clock of each MIPI port enters the VICAP through a
dedicated gate in the clock and reset unit, so the VICAP claims five
interface clocks and five interface resets.

The device tree node connects the VICAP to the two MIPI CSI-2
receivers that are usable with the MIPI D-PHYs in full mode, following
the approach taken for the RK3588.

Tested on a Radxa ROCK 4D with a Radxa Camera 4K, whose Sony IMX415
sensor is wired to the first MIPI D-PHY in full mode.

This series applies on top of the RK3576 MIPI CSI-2 receiver
series [1].

[1] https://lore.kernel.org/r/20260915-csi-2-rcv-dts-v2-0-bdaf8141616a@gmail.com

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
Amin Gattout (3):
      media: dt-bindings: add rockchip rk3576 vicap
      media: rockchip: rkcif: add support for rk3576 vicap mipi capture
      arm64: dts: rockchip: add vicap node to rk3576

 .../bindings/media/rockchip,rk3568-vicap.yaml      |  46 +++++-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  83 +++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 155 ++++++++++++++++++++-
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   1 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |   4 +-
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  21 +++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |   1 +
 7 files changed, 308 insertions(+), 3 deletions(-)
---
base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
change-id: 20260828-vicap-rk3576-6e7118ea0246
prerequisite-change-id: 20260825-csi-2-rcv-dts-7712bd834de6:v2
prerequisite-patch-id: fbe2d84f88709b8bf846debe6b8ce62c4392ca63
prerequisite-patch-id: 9bce33933ae69e8cc7f7ef2f0d9acb969620bc85
prerequisite-patch-id: bff0c668524f94b0b7901c682d5ccdccfe18d46e
prerequisite-patch-id: 8f45701f840680a35e044f43ebd3087282847990
prerequisite-patch-id: bdbb3e9b072469900cac21031cd799265b52d734
prerequisite-patch-id: c91ceb74abc8bc79ac036990abdef4cbd7328f97

Best regards,
--  
Amin Gattout <amin.gattout@gmail.com>


