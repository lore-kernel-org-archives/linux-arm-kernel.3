Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BE0106B526
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 12:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhH/BiavDYlcA+QqnqPeVfMuMJx+Rcb/Yk974pkiqvY=; b=1jg8pswOe656wqxiHrD2AWUudv
	yAxIvFQLEn0mYKKOvDDiy7GxGawNsjqDa7x+A9eU4o3ZihRPrkWl4sXujMN261EoZvWWY71sGMd/o
	Ayu3xMayFiOaQFXFdV1pzaDSDWFHxd0pQ8S9PomWNJtzzYUf7+9Vha6ompQDW+Z76zmpgwmZ6LIsl
	YKhacJ6nAocRCewMFG+zcNVU0H1YI0DMkKKT+R/1Xk0dEfqhI9pNRqlqwk/meMQfQn3SUgQgXMxdH
	8MIEQIplrrapvTsBYxxlC9xaGMdGIe6jdHioghUM4qsfxjze2K5NlHUwGVByNul+1VWjankJonzjh
	FzqTuqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NWx-00000003OFP-1GMn;
	Wed, 25 Mar 2026 12:40:15 +0000
Received: from [195.187.100.5] (helo=ni.piap.pl)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5NWt-00000003OEd-2Cj4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 12:40:13 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 2DBBDC3EEAC9;
	Wed, 25 Mar 2026 13:40:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2DBBDC3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Liu Ying <victor.liu@nxp.com>
Cc: Maxime Ripard <mripard@kernel.org>,  Marco Felsch
 <m.felsch@pengutronix.de>,  Marek Vasut <marex@nabladev.com>,  Stefan
 Agner <stefan@agner.ch>,  Simona Vetter <simona@ffwll.ch>,
  <imx@lists.linux.dev>,  Fabio Estevam <festevam@gmail.com>,  Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Frank Li <Frank.Li@nxp.com>,
  <linux-kernel@vger.kernel.org>,  <dri-devel@lists.freedesktop.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  <linux-arm-kernel@lists.infradead.org>,  Lucas Stach
 <l.stach@pengutronix.de>
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
In-Reply-To: <ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com> (Liu Ying's
	message of "Mon, 23 Mar 2026 16:18:55 +0800")
References: <m3ms04caaj.fsf@t19.piap.pl>
	<32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
	<m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
	<20260320-amiable-hairy-bullfinch-28bfda@houat>
	<m3a4w2d4ds.fsf@t19.piap.pl>
	<ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com>
Date: Wed, 25 Mar 2026 13:40:03 +0100
Message-ID: <m3se9onkv0.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_054011_736469_5FA79024 
X-CRM114-Status: GOOD (  14.10  )
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

Hi,

maybe I don't understand this, but... added a bunch of printk()s:

static void dump(struct lcdif_drm_private *lcdif, const char *func, unsigne=
d line)
{
	uint32_t d1 =3D readl(lcdif->base + LCDC_V8_INT_STATUS_D1);
	printk(KERN_DEBUG "%s[%u]\n", func, line);
	printk(KERN_DEBUG "CTRL %08X PARA %08X %08X %08X %08X %08X\n",
	       readl(lcdif->base + LCDC_V8_CTRL),
	       readl(lcdif->base + LCDC_V8_DISP_PARA),
	       readl(lcdif->base + LCDC_V8_DISP_SIZE),
	       readl(lcdif->base + LCDC_V8_HSYN_PARA),
	       readl(lcdif->base + LCDC_V8_VSYN_PARA),
	       readl(lcdif->base + LCDC_V8_VSYN_HSYN_WIDTH));
	printk(KERN_DEBUG "D0   %08X %08X D1 %08X(C) %08X\n",
	       readl(lcdif->base + LCDC_V8_INT_STATUS_D0),
	       readl(lcdif->base + LCDC_V8_INT_ENABLE_D0),
	       d1,
	       readl(lcdif->base + LCDC_V8_INT_ENABLE_D1));
	printk(KERN_DEBUG "DESC %08X %08X %08X %08X %08X\n",
	       readl(lcdif->base + LCDC_V8_CTRLDESCL0_1),
	       readl(lcdif->base + LCDC_V8_CTRLDESCL0_3),
	       readl(lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4),
	       readl(lcdif->base + LCDC_V8_CTRLDESCL_HIGH0_4),
	       readl(lcdif->base + LCDC_V8_CTRLDESCL0_5));
	if (d1)
		writel(d1, lcdif->base + LCDC_V8_INT_STATUS_D1); // clear D1 status
}

(C) after LCDC_V8_INT_STATUS_D1 value means I clear it after read. It's
the single PANIC bit, "write 1 to clear".

LCDIFV3_PANIC0_THRES is 0x15501AA, but 2/4 and 3/4 didn't fix it either
(completely at least). 2160p30. Also added the undocumented
CTRLDESCL0_3_STATE_CLEAR_VSYNC bit as in NXP's driver (clearing FIFO on
VSYNC).

Normal start (before Weston):
4.943 lcdif_reset_block[432]
4.943 CTRL 80000000 PARA 00000000 00000000 00030003 00030003 00030003 <<<<<=
 SW_RESET
4.943 D0   00000000 00000000 D1 00000000(C) 00000000
4.943 DESC 00000000 00000000 00000000 00000000 00000000
4.943 lcdif_reset_block[437]
4.943 CTRL 00000000 PARA 00000000 00000000 00030003 00030003 00030003
4.943 D0   00000000 00000000 D1 00000000(C) 00000000
4.943 DESC 00000000 00000000 00000000 00000000 00000000
4.943 lcdif_set_formats[197]
4.943 CTRL 00000000 PARA 00000000 00000000 00030003 00030003 00030003
4.943 D0   00000000 00000000 D1 00000000(C) 00000000
4.943 DESC 00000000 00000000 00000000 00000000 00000000
4.943 lcdif_set_formats[320]
4.943 CTRL 00000000 PARA 00000000 00000000 00030003 00030003 00030003
4.943 D0   00000000 00000000 D1 00000000(C) 00000000
4.943 DESC 00000000 00000000 00000000 00000000 09000000
4.943 lcdif_set_mode[340]
4.943 CTRL 00000000 PARA 00000000 00000000 00030003 00030003 00030003
4.943 D0   00000000 00000000 D1 00000000(C) 00000000
4.943 DESC 00000000 00000000 00000000 00000000 09000000
4.943 lcdif_enable_controller[382]
4.943 CTRL 00000002 PARA 00000000 08700F00 012800B0 00480008 000A0058
4.943 D0   00000000 00000000 D1 00000000(C) 00000000
4.943 DESC 08700F00 00A23C00 ED000000 00000000 09000000
4.948 lcdif_enable_controller[402]
4.948 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.949 D0   00000000 00000000 D1 00000000(C) 00000001
4.949 DESC 08700F00 00A23C00 ED000000 00000000 89000000               <<<<<=
 DMA_EN

I don't know what exactly happens at this point, the DMA starts and the
CRTC also starts scanning right away? No underrun follows. Not even
"panic" indication:

4.949 lcdif_crtc_atomic_enable[604]
4.950 lcdif_plane_primary_atomic_update[746]
4.951 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.951 D0   00000000 00000000 D1 00000000(C) 00000001
4.951 DESC 08700F00 00A23C00 ED000000 00000000 89000000
4.956 lcdif_plane_primary_atomic_update[755]
4.956 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.956 D0   00000000 00000000 D1 00000000(C) 00000001
4.956 DESC 08700F00 00A23C00 ED000000 00000000 89000000
4.956 lcdif_crtc_atomic_flush[554]
4.956 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.956 D0   00000000 00000000 D1 00000000(C) 00000001
4.957 DESC 08700F00 00A23C00 ED000000 00000000 89000000
4.957 lcdif_crtc_atomic_flush[558]
4.957 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.957 D0   00000000 00000000 D1 00000000(C) 00000001
4.957 DESC 08700F00 00A23C00 ED000000 00000000 C9000000               <<<<<=
 SHADOWS

^^^ The code programs the CRTC to update DMA registers (only?), I guess
mostly the frame buffer address, on the next frame end / start /
whatever event.

4.957 lcdif_crtc_enable_vblank[678]
4.957 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.957 D0   00000000 00000000 D1 00000000(C) 00000001
4.957 DESC 08700F00 00A23C00 ED000000 00000000 C9000000               <<<<<=
 SHADOWS
4.962 lcdif_crtc_enable_vblank[683]
4.962 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.962 D0   00000000 00000004 D1 00000000(C) 00000001
4.962 DESC 08700F00 00A23C00 ED000000 00000000 C9000000               <<<<<=
 SHADOWS
4.963 lcdif_crtc_atomic_flush[572]

if the frame started at 4.948 - 4.949, the next one is due at ca. 4.982
(30 Hz). VSync should start not sooner than 4.980 (32.0 ms).

4.977 lcdif_crtc_atomic_destroy_state[632]
4.977 Console: switching to colour frame buffer device 240x67
4.977 lcdif_crtc_atomic_duplicate_state[661]
4.977 lcdif_crtc_atomic_check[480]
4.977 lcdif_crtc_atomic_check[542]
4.977 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.977 D0   00000001 00000004 D1 00000000(C) 00000001                  <<<<<=
 VSYNC
4.978 DESC 08700F00 00A23C00 ED000000 00000000 89000000

^^^ Here the "update shadow" bit is (self) cleared, so I think the frame
has ended (or the next one started), and a new one has started (or is
about to). No underrun. This is not an IRQ. Interestingly, it's not
4.980 yet.

4.978 lcdif_crtc_atomic_check[543]
4.978 lcdif_plane_primary_atomic_update[746]
4.978 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.978 D0   00000001 00000004 D1 00000000(C) 00000001
4.978 DESC 08700F00 00A23C00 ED000000 00000000 89000000
4.985 lcdif_plane_primary_atomic_update[755]
4.985 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
4.985 D0   00000001 00000004 D1 00000000(C) 00000001
4.985 DESC 08700F00 00A23C00 ED000000 00000000 89000000

At this point, the new frame definitely has started (7+ ms since VSYNC).


Now starting Weston:
...
34.655 CTRL 80000000 PARA 00000000 00000000 00030003 00030003 00030003 <<<<=
< SW_RESET
34.655 D0   00000000 00000000 D1 00000000(C) 00000000
34.655 DESC 00000000 00000000 00000000 00000000 00000000
34.655 lcdif_reset_block[437]
34.655 CTRL 00000000 PARA 00000000 00000000 00030003 00030003 00030003
34.655 D0   00000000 00000000 D1 00000000(C) 00000000
34.655 DESC 00000000 00000000 00000000 00000000 00000000
34.655 lcdif_set_formats[197]
34.655 CTRL 00000000 PARA 00000000 00000000 00030003 00030003 00030003
34.655 D0   00000000 00000000 D1 00000000(C) 00000000
34.655 DESC 00000000 00000000 00000000 00000000 00000000
34.655 lcdif_set_formats[320]
34.655 CTRL 00000000 PARA 00000000 00000000 00030003 00030003 00030003
34.655 D0   00000000 00000000 D1 00000000(C) 00000000
34.655 DESC 00000000 00000000 00000000 00000000 09000000
34.655 lcdif_set_mode[340]
34.655 CTRL 00000000 PARA 00000000 00000000 00030003 00030003 00030003
34.655 D0   00000000 00000000 D1 00000000(C) 00000000
34.655 DESC 00000000 00000000 00000000 00000000 09000000
34.655 lcdif_enable_controller[382]
34.655 CTRL 00000002 PARA 00000000 08700F00 012800B0 00480008 000A0058
34.655 D0   00000000 00000000 D1 00000000(C) 00000000
34.655 DESC 08700F00 00A23C00 EF000000 00000000 09000000
34.660 lcdif_enable_controller[402]
34.660 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
34.660 D0   00000000 00000000 D1 00000000(C) 00000001
34.660 DESC 08700F00 00A23C00 EF000000 00000000 89000000               <<<<=
< DMA_EN

As above, the only difference is frame buffer address.

34.660 lcdif_crtc_atomic_enable[604]
34.661 lcdif_plane_primary_atomic_update[746]
34.661 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
34.661 D0   00000000 00000000 D1 00000000(C) 00000001
34.661 DESC 08700F00 00A23C00 EF000000 00000000 89000000
34.666 lcdif_plane_primary_atomic_update[755]
34.666 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
34.666 D0   00000000 00000000 D1 00000000(C) 00000001
34.667 DESC 08700F00 00A23C00 EF000000 00000000 89000000
34.667 lcdif_crtc_atomic_flush[554]
34.667 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
34.667 D0   00000000 00000000 D1 00000000(C) 00000001
34.667 DESC 08700F00 00A23C00 EF000000 00000000 89000000
34.667 lcdif_crtc_atomic_flush[558]
34.667 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
34.667 D0   00000000 00000000 D1 00000000(C) 00000001
34.667 DESC 08700F00 00A23C00 EF000000 00000000 C9000000               <<<<=
< SHADOWS

The DMA registers are to be updated on the next VSYNC.

34.667 lcdif_crtc_enable_vblank[678]
34.667 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
34.667 D0   00000000 00000000 D1 00000000(C) 00000001
34.667 DESC 08700F00 00A23C00 EF000000 00000000 C9000000               <<<<=
< SHADOWS
34.672 lcdif_crtc_enable_vblank[683]
34.672 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
34.672 D0   00000000 00000004 D1 00000000(C) 00000001
34.672 DESC 08700F00 00A23C00 EF000000 00000000 C9000000               <<<<=
< SHADOWS
34.689 lcdif_crtc_atomic_destroy_state[632]
35.482 lcdif_crtc_atomic_duplicate_state[661]
35.482 lcdif_crtc_atomic_check[480]
35.482 lcdif_crtc_atomic_check[542]
35.482 CTRL 00000002 PARA 80000000 08700F00 012800B0 00480008 000A0058
35.482 D0   01000002 00000004 D1 00000001(C) 00000001                  <<<<=
< UNDERRUN
35.482 DESC 08700F00 00A23C00 EF000000 00000000 89000000

No VSYNC bit (though shadow updates happen on VSYNC), PANIC registered,
and UNDERRUN.

Why did the first (boot) sequence result in success and this second one
in failure? This is somehow reproducible.
Interestingly, Weston usually starts fine in subsequent launches.

How is this first (actually second - after the first VSYNC) frame
different from all the others? Maybe we're programming UPDATE_SHADOW
after the actual start of blanking period, but before DE, so it has no
chance to reload registers, yet the DMA is somehow not ready?

The manual (LCDIF display control Register (CTRL)) suggests that the DMA
(with present settings) starts to fetch FB data at the end of the
previous active video pixel time (DE and pixel data going inactive):
fetch_start_option (bits 9-8): Indicates when to start fetching for new
frame. This signals also decide the shadow load, fifo clear time
00b - fetch start as soon as FPV begins(as the end of the data_enable).

This should leave a lot of time to fill the FIFO (before the next DE),
shouldn't it?

297 MHz pixclk, 3840x2160, 30 Hz, H back porch 296 pixclks, Vfp 176,
V back porch 72 lines, Hfp 8 lines, VSYNC 10 lines, HSYNC 88 pixclks.
HTotal =3D 4400 pixels which makes Vactive time =3D 4400 * 2160/297e6 =3D
32 ms, with the remaining 1.3333 ms for all the V sync stuff.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa

