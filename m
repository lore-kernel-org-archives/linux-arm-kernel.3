Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E3C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 06:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vV7TW2SU9QNyrdw/O3i+fc2xpKeIdc3uZlqCvkwrnsQ=; b=o6BHXOiUq44jf0LGVxBUk50A96
	i3g2+pjnPI3Fows/lohTskIAmaN+vPBu6edl59pFbOh3gJidOCe5dlzMTdBbxVxrpCj5lceDP7Af3
	Smv1ogYzE1JlQgfCn20P2GXr2lKyw5+pf53weqvSsZvkZkNHkLXhOUA9rgBISATMILcN3zt7M1bjC
	s9vfUpMVrn6agjw2n/kOOA4OXtv/vALR+BN1AaVVl0P3eSzb9Tu1paLhGsXzQFxlYPoI66gPZAhQj
	/L/GniZ2UwCly1epOE1KZlSqaL3yQLloBsk4aXe442mXUYJ4zTkPMIJO59D5y7bb6p8ZJ4bRh3nXU
	H+vR6nwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Aju-0000000GybS-2In1;
	Sun, 20 Sep 2026 06:09:26 +0000
Received: from winds.org ([68.75.195.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Ajr-0000000Gyax-339C;
	Sun, 20 Sep 2026 06:09:25 +0000
Received: by winds.org (Postfix, from userid 100)
	id 858658F80256; Sun, 20 Sep 2026 02:09:19 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by winds.org (Postfix) with ESMTP id 8415D1334AD4D;
	Sun, 20 Sep 2026 02:09:19 -0400 (EDT)
Date: Sun, 20 Sep 2026 02:09:19 -0400 (EDT)
From: Byron Stanoszek <gandalf@winds.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
    Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
    Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
    Luca Ceresoli <luca.ceresoli@bootlin.com>, 
    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
    Maxime Ripard <mripard@kernel.org>, 
    Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, 
    Andy Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
    Emil Renner Berthing <kernel@esmil.dk>, 
    Hal Feng <hal.feng@starfivetech.com>, 
    Michael Turquette <mturquette@baylibre.com>, 
    Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Dominique Belhachemi <db@domibel.de>, 
    Brian Masney <bmasney+clk@redhat.com>, 
    Jerome Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org, 
    devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
    dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, 
    linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
    Marek Szyprowski <m.szyprowski@samsung.com>, 
    Maud Spierings <maud_spierings@murena.io>, 
    Graham Markall <hello@big-grey.co.uk>, 
    Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
    Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
    Joshua Peisach <jpeisach@ubuntu.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v4 00/20] drm: starfive: jh7110: Enable display
 subsystem
In-Reply-To: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
Message-ID: <b8b046ee-c574-3e16-6079-2fc415633dae@winds.org>
References: <CGME20260915153213eucas1p148f013af239a334fc78cdc249c0f8a61@eucas1p1.samsung.com> <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_230923_838438_FFB4ACF1 
X-CRM114-Status: GOOD (  17.21  )
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

On Tue, 15 Sep 2026, Michal Wilczynski wrote:

> This series enables the display subsystem on the StarFive JH7110.

Hi Michal,

I tested your v4 patch series on my VisionFive2 1.3B with kernel 7.3-rc3 today
and it works very well, except for 2 issues. Note, to make the screen refresh
properly, I am using the noncoherent cache fixes from
https://github.com/ganboing-jh7110/linux/commits/ganboing-jh7110-cache-fix-v1/
(specifically commits 3683d97, ef93e2c, 277db0b, and 26ce3e6) in addition to
your patch.

Issue 1: I have a Dell U2711 monitor which has limited HDMI 1.3 capability, so
I invented my own Xorg mode to get a good frame rate:

"2560x1440_40.22"  162.00  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync

With this mode and your new driver, I started getting rows of black pixels
flickering in the upper-left corner of my LCD screen. These weren't there back
when I was running the same mode under the Keith Zhao driver from StarFive
(drm/verisilicon v5 plus a bunch of patches for dma cache coherency)
(https://patchwork.kernel.org/project/dri-devel/cover/20241120061848.196754-1-keith.zhao@starfivetech.com/).

The glitches I saw suggested the sync polarity was being set incorrectly; the
number of glitched rows was exactly the vsync pulse width plus 1 (i.e.
"1440 1443 1448 1481" produced 6 bad rows, "1440 1443 1456 1481" produced 14,
"1440 1441 1442 1481" produced 2, and so forth).

I did a register dump between the two drivers and found that, although the
DC8200 HSYNC and VSYNC registers were identical between the two versions, the
hsync and vsync bits on the inno hdmi tx were swapped between the two. When I
manually set the VIDEO_TIMING_CTL register from 0x09 to 0x05 (matching the
output of Keith's driver), the glitches went away.

Keith Zhao driver:

=== DC8200 display 0 ===
DC   PANEL_CONFIG               0x1418 = 0x00001111
DC   HSIZE                      0x1430 = 0x0AA00A00
DC   HSYNC                      0x1438 = 0x45280A30
DC   VSIZE                      0x1440 = 0x05C905A0
DC   VSYNC                      0x1448 = 0xC2D405A3
DC   DPI_CONFIG                 0x14B8 = 0x00000005
DC   FB_CONFIG                  0x1518 = 0x14000000
DC   FB_ADDRESS                 0x1400 = 0x71200000
DC   FB_STRIDE                  0x1408 = 0x00002800
DC   FB_SIZE                    0x1810 = 0x02D00A00
DC   FB_CONFIG_EX               0x1CC0 = 0x00002000
DC   PANEL_START                0x1CCC = 0x00000001
DC   DP_CONFIG                  0x1CD0 = 0x0000000A
DC   FB_WATER_MARK              0x1CE8 = 0x00000000
DC   PANEL_CONFIG_EX            0x2518 = 0x00000000

=== INNO HDMI TX video timing ===
HDMI VIDEO_TIMING_CTL           0x08   = 0x05
HDMI EXT_HTOTAL_L               0x09   = 0xA0
HDMI EXT_HTOTAL_H               0x0A   = 0x0A
HDMI EXT_HBLANK_L               0x0B   = 0xA0
HDMI EXT_HBLANK_H               0x0C   = 0x00
HDMI EXT_HDELAY_L               0x0D   = 0x70
HDMI EXT_HDELAY_H               0x0E   = 0x00
HDMI EXT_HDURATION_L            0x0F   = 0x20
HDMI EXT_HDURATION_H            0x10   = 0x00
HDMI EXT_VTOTAL_L               0x11   = 0xC9
HDMI EXT_VTOTAL_H               0x12   = 0x05
HDMI EXT_VBLANK                 0x13   = 0x29
HDMI EXT_VDELAY                 0x14   = 0x26
HDMI EXT_VDURATION              0x15   = 0x05

Your driver (showing only the changed values):

DC   DP_CONFIG                  0x1CD0 = 0x00000000
DC   PANEL_CONFIG_EX            0x2518 = 0x00000001
HDMI VIDEO_TIMING_CTL           0x08   = 0x09

Specifically the bit#s are different between the two drivers:

inno_hdmi-starfive.h (Keith Zhao):     inno-hdmi.c (generic):
   v_HSYNC_POLARITY_SF(n)  ((n) << 2)     v_HSYNC_POLARITY  bit 3
   v_VSYNC_POLARITY_SF(n)  ((n) << 3)     v_VSYNC_POLARITY  bit 2

"_SF" suggests this change is specific to StarFive. The correct positions are
HSYNC=bit 2 and VSYNC=bit 3 for the JH7110.

I'm guessing that your 42-mode test passed because most CEA modes are +hsync
+vsync, and this wouldn't show any difference if the two bits were transposed.

Once the sync polarity is sorted, I'd be happy to give a Tested-by: on the
series.

  --

Issue 2: This is more a feature request than an issue. Originally, I tried
running this Xorg modeline, which worked well under Keith's driver:

"2560x1440_49.90"  201.00  2560 2608 2640 2720  1440 1443 1448 1481 +hsync -vsync

However, your driver would not accept this pixel clock. I then noticed you have
a pre-PLL table of fixed clocks. Is there any chance you can change the code to
compute the pre-PLL on the fly like how Keith does it, rather than use a table?

Thanks for all your great work!

Best regards,
  -Byron


