Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2281C982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q17BTeQu3f/C2Tj9dpVKkyYMWZ/X3XaQhujghfI7S8w=; b=EzBc/adjTk1hAv
	SPb4xrhAHI7yz4x5U3ND/X8EDOXLASx2+mlkjof0Simuh3r4+u82oN1JCHiffocu3odNDRdApd0z9
	wmxCCNt6C7QnVXSBYF+jEnoDYxwlKVYyDnqCY14jlAGCA5uYSht+SYTwqMHqOEzddfD9vI8CfxPdr
	mliQAYN1do3GjugYAIbaSXickfJ3/6uSsBoSgiYx2Sz+mTaiSDDxCtXVRsQwSAOgo2/2GoVB+JaFI
	PxsWIw2AAd1G7wjq+23gfkR3TaCmQcURJ0W4cEm1x4L8iK0zsCIifqg4RiRWZcVkKxkzJSwX4g1es
	NUCqpFxbAGABvu79oMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzS-00000002cSB-3qG9;
	Mon, 21 Sep 2026 15:31:34 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzQ-00000002cQg-3umv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:31:34 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so23439905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004689; x=1790609489; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q17BTeQu3f/C2Tj9dpVKkyYMWZ/X3XaQhujghfI7S8w=;
        b=Co0tXj8IsyKCabFFBJLcg8bmCcFiA8l3M7TxNk8oqgiChapgzgevostsSztX1rQPM6
         A5CX3q2Twja5xiW7jUawsoQqZZWYI0wgKn29DOTNDtgT8lEyvzVUCPlTVY1Qo763kbL3
         lExZMUHTsNa4p0AXPOqzTFcA7p0qRTMNaxpD6LlnB+DlpOCzfZTf48gIuOKUft+s/FB8
         yJF7vH+xBMzb79QijPsAW0AgQ26wWk8LjY0rDcGWWUNZzY/s2k9gKY2S2sxmzWOkBRwR
         YOnGjGUhs9lGMzy72CgClgmoBqjb5vTO80hMSuQDMDSPPDT837rg3zdWBvo03XT5HBJc
         Vepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004689; x=1790609489;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q17BTeQu3f/C2Tj9dpVKkyYMWZ/X3XaQhujghfI7S8w=;
        b=zuEEOmb+0ms4jWsxnjjF9hBpATegxAyrWq5sSnmcVA293twACdlMVdZ915bRkmUNEM
         C8m2K7KDUieQuT6+/Kz7w4woACHjO8khMzlHRfPKuSJBqX6vxXqIbsKoR9aHLEJ0x6tc
         mTMNGFz4k2lbLotrxfjZC5Qpoe+0tO5Q54lm29JtTdyXVeX2D/MrdW5pWgrampLTdQVf
         uizpSOWBuN8Aio0SFNmRnqbXi/cjhdlw17G45Gq7R7TYHrHF4XoWzMomkeT29WCyJZ6z
         1V59UiQN9QDNKUGm8dgPaHrnX18iLloI8lAPsQm7naD6uoNFq5vjZsuIs0x/0vkCl7ti
         /2WQ==
X-Forwarded-Encrypted: i=1; AKwUvBxh/4CKnClO4Fmwdbm0FCeDFkc63MV9M9DJ6dOAzbYpwQDrO7F69EVa0WiWBTwphXbk1eV4sk8lg1/CZy76Y+QV@lists.infradead.org
X-Gm-Message-State: AFuF++kdMxcW3YREYWvHa1aHoII5q26Mp0OGDjnv2Xb6X1HvGXC+2mab
	xMVDNserUd2oPgPpimqYWAtOdVowixFbuNB2ebcGVKbDJ6dsKPurTDG9
X-Gm-Gg: AYBFou0nOHOAHqv2P49tlFGJfRnpDLirXfIRKwgKPAw3GYnN1forE0/Src5C6P3mmyj
	xsH2GUTogs0wGgVOi0pFoOlFOmSyCH3FeulibcGSVLNVhBHpVQZq2SxO76SEzmhRSvt/WuKoNkl
	dgLvjisL2shzl7TD1KY13FlgiYSkP+2oN1tOD0w/S4iLRYihnt0UToFcS6B1YTCCYI+JWkLqyRq
	GZkbnu6HAtDULfX9/D84eeFQr5RuenpYz8LK3Lmt1iL+uxcbAA+RebjzWNR2Eb9j2D+EtXtu67A
	S/vTnwQZO4qbPsIFmETsAv+MaArT4mHbRnD4pAOxUNzAq5BvAYQ5xTy6Y0YOVkDlyk3ajCMxq0m
	CqwTzZigQYO+nHVGHGe7F7TDvXqSAdADzH4Hsx87xVNICuR4FOq3S7U0aGcDfJUSkD+9o9nImAV
	bY01vUPuYbfI1zgoo1hJmExeMdc7ziszRC8cmTVsidkIkpt9vaHqo7ftwUX236eWox1WY1dyOce
	kRVBkR3ziTkrrrExyVssLRZjf/wUEqIY2NM0J0Rcc5XtRdwL1kpowj4Gg==
X-Received: by 2002:a05:600c:3ba0:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fc55adc12mr195005285e9.0.1790004688933;
        Mon, 21 Sep 2026 08:31:28 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:28 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Subject: [PATCH v2 0/5] media: rockchip: add support for the RK3576 Video
 Capture unit
Date: Mon, 21 Sep 2026 17:29:56 +0200
Message-Id: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHRNsWoC/1WPzW7DIBCEXyXi3K0MZoH41PeocuBnSWjrOAUHt
 Yr87sV2parHkWbmm3mwQjlRYcPhwTLVVNJ0bUI8HZi/2OuZIIWmmeiE6owwUJO3N8jvPWoFijT
 nhmwnpGItcssU09dW93radbm7N/Lz2vHryPR5b5x5t/1hGnWHIPiSQED2FcJcQGsuXDC9DKSGK
 tYaZwuBn8YxzcPBBYzSYOxjywuBzijUPSEebeycFigpSm4kWyddUpmn/L0drnxbsGGPHP9/qxw
 6CH1Ecmhs5/DlPNr08dyo7LQsyw8bfY7wOwEAAA==
X-Change-ID: 20260828-vicap-rk3576-6e7118ea0246
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=3333;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=QIycfM8lSGGpojOIRQ7BJiuB5wrTj6UvPklU28CgqhI=;
 b=xJZVG8DMwVCT85tBT03zInvpL1eGKUYrkEBIDqUtAM993jolzJTX6rarm5D6/FBRrPwbZBk9W
 TrrC0yfaAx5BsukaBjJDfNKb5HQLhUoYXudewIoohBijfVtAOh6wHaB
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_083132_993698_322FFBF9 
X-CRM114-Status: GOOD (  18.33  )
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

The two driver patches that come first prepare the rkcif driver for
that, by adding a register index for the capture size and a callback
for the contents of ID_CTRL1. Neither changes the behavior of the
existing variants.

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
Changes in v2:
- Split the driver patch in three, one adding a register index for the
  capture size, one adding a callback for the contents of ID_CTRL1, and
  one adding the RK3576 support itself (Michael)
- Collected Acked-by from Conor and Reviewed-by from Michael on the
  binding patch, and Reviewed-by from Michael on the device tree patch
- Link to v1: https://patch.msgid.link/20260915-vicap-rk3576-v1-0-d3f5eb58a0b5@gmail.com

---
Amin Gattout (5):
      media: dt-bindings: add rockchip rk3576 vicap
      media: rockchip: rkcif: add a register index for the MIPI capture size
      media: rockchip: rkcif: add a callback for the MIPI ID_CTRL1 register
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


