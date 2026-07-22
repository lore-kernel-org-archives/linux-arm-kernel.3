Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F7FC44533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 07:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mL8afbJIEVbivI++LDqKDCSnrT+9HSwzh/VJgECEmYM=; b=vjTgZzpwjaXR/dZEMkBFFKjQY/
	eRr+rzpq1an+16WMcc9sV9ob3tfCn/6KeOLVkBeQfdhBTRzY6MzN035CXd0mqqufAcQZEnDf8pXdq
	jHKBsi3u90gu5lfkQrle0SH+rYNmlEhDHxHPVcj6Ud3j28QdwNnVOt0v2ZzGwZrup29pyMIGOJF/S
	RBoV0OPJWxmLWB0F0ozggJZR589bWkEGmX8vI0jccVryPiQQCHa278RjabgFUY7fyOPV+P06VdpQR
	xCW+SOYkgFRRH/8ls4zmmh2t038tUTjBBOh88o/bhSMaVAtvKRpl06gasQ7WMptIlZ7oC5FJLi9wG
	nP0xwKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRTM-0000000B4fF-2ANj;
	Wed, 22 Jul 2026 07:34:32 +0000
Received: from flow-b2-smtp.messagingengine.com ([202.12.124.137])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRTJ-0000000B4dS-144E;
	Wed, 22 Jul 2026 07:34:31 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id AD3A9130009C;
	Wed, 22 Jul 2026 03:34:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jul 2026 03:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1784705665; x=1784709265; bh=mL8afbJIEV
	bivI++LDqKDCSnrT+9HSwzh/VJgECEmYM=; b=X4R5+NnKpjr8SCtmlYsZcpcCE7
	OvXUUGXcdRJ1pqlt5OQcjgiDblWe8+MSMXCYgcRrsCqXgyeMNwR8XlIDgFxIc/yS
	XmUu7vlf4uk395wV6lqOIlHwUVOg+bhrD6qAmMrjcspaVy2mq+Y7HT6Ukef0HQsn
	LRi/mZNGWp4arKx4XETGevQBFW4LY1O2OBawZS5xVsGF0HQ40Jum39ihxEmZf20D
	oCxFJVCt6aau12F4akCo1hM0DkfVwg/TJ5Qj5YVwh7qsbN2WJ0k1Qh8KdT+9UvYh
	PuzlM2IKRMnMRu1alByXIQzQq561JqEttXX6XJC+6AlllYBQX065BGDzxRRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784705665; x=1784709265; bh=mL8afbJIEVbivI++LDqKDCSnrT+9HSwzh/V
	JgECEmYM=; b=hAp+KRjjWrZjLQG4ZK5qf22PLGC6rbQtRboCycfUHFBbGODcdZt
	il7suGjGl6kB6XAhnOiq2raZG3FLlgzRH4O+u85Zkw4J2Ej6u+K6IW/kAurFu+Y1
	6J+W/v6yX67/3djVbaFA1hlcv7CWYGLkzBrovgFwW3UjxVQSqomhGSE35jPpqESD
	iDQo8h4QGsNuAurF9NiNf706nm1d+qrcIhT9I37IBF5FEIcEGM2SUlcqt79FrLi8
	PAyoW80aMcKNtJET3HHYke4K4UHApiWuzq+UhKJgYIxL3sr+rDVXZfDHpirT4tnm
	ad/AOznwgHHEhJcX+OxbTZZnXOD6gqdYmKQ==
X-ME-Sender: <xms:gXJgahaqXmifA7A4U1ySUPjFulgrnusH0fZMtHmUbDg32e3vOMqHqQ>
    <xme:gXJgan9uhPuH4qKIouPBb9ucm1JkCjXXRUbs8ZSlVlHMVWoJKKxa9h3KSDsQzahpr
    yhNxigxTEUBKfRgxCQWMU27eJtKabtvrfhHiyKbM4Oh1IAV6s1jufQ>
X-ME-Received: <xmr:gXJgaoS5OPQxiqjevM1RmpkjZYyD6OECGgkKpeITf-pIcUrCvb_T-nDpI-oYM_Y4yz7o1MhytA>
X-ME-Proxy-Cause: dmFkZTEnr+Ic820deR54trKtaw3+ZMPYT0z62lQjtuu6UfAkjZ+uTHXJ6JAc3qBaopJ/VD
    y81AFwdddvH7jDoLvUS+TpqpNhXqqS3vkrDnUeH4Iciiof/VqnkaVhiIAEoC/MscM10Rey
    J2ydCEUZ4x8qvxl9a4qh9fbZCz3h00im/nDgXcLDCw4NXpybKjjfHigBxBYt0zC122SDri
    M7lg7lT7xWP0tBpUy03bU7YYu/sTa9s5FkbkBjHneQODLPttTe7Iy3yvPOjQ0S3nuWR0Yq
    GVUnV4Cr0zjLffjRGrcPSX0OY/6J60ZTr0w9dnFhg19yAo6cIus9+6Sllcn1FEoPoThdf2
    c3Aq9wCBck3PfoZJ5H4WBwsgfW8uci+ftgevpiSCpZQJWFbHAI0Y1zdVD7F2YBwDsN0fQV
    5onNEi0UsxpG/v1W7BB+1vYZ66KTBe3PIfjS/Y8Go3zNIXsD7+28+HLp/quh0Ry0pnbMMD
    vKCAPyeDIEXL3ctn152wqFe+FLad8bhZAxJqlMyYhhl41bep9aytMQZRfPfmvIjKCoip8E
    vqnh9u+ptls+Z7gD7VblxNDpERYDZhWAWVCuC/BE8oPlnfR2xM0WTrLu6dHWOvcCggqVqw
    Wjb14DCDwf1o1rWNoGRFMRCi2Nrh80TpN5uji0aiZh54q66Y3NeignjuPTyg
X-ME-Proxy: <xmx:gXJgaiIVZLFFJE01TKTGHRsZ9CiotLIGtx2Bd85IHKbSuh_i2c77Vw>
    <xmx:gXJgaqQcrazNbAHxv-S9ZapnXDLsQ9S_PSoH07O5G_ujR4ndtdMkYQ>
    <xmx:gXJgaqKe1TNZHndnd0AZ1tqo0Kmy2QNi_m8SqlNqexMW0NohwAbEbQ>
    <xmx:gXJgat-2mGTcM8b7rkI7htTw-mKQJhLdjK0Lrb5aynxUxuj1lZyPoA>
    <xmx:gXJgag-1z6GSFenfD9WruHXGj5aaTjSOOHh-8vLW1dxyE7WGiTEFxI8m>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 03:34:20 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: mchehab@kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.dufresne@collabora.com
Cc: ezequiel@vanguardiasur.com.ar,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiaxing Hu <gahing@gahingwoo.com>
Subject: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Date: Wed, 22 Jul 2026 19:34:14 +1200
Message-ID: <20260722073417.2064667-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_003429_674942_E13932C2 
X-CRM114-Status: GOOD (  17.77  )
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

This is an RFC for a from-scratch mainline V4L2 driver for the H.264
hardware video encoder (VEPU510) on the Rockchip RK3576.  It is a
stateful mem2mem encoder (NV12 in, H.264 Annex-B out) modelled on the
verisilicon/hantro driver, not on the downstream MPP-service model.

I'm posting it as an RFC because intra frames work but inter frames do
not, and I'd like a second pair of eyes on the inter-frame problem
before this is worth a real submission.

What works
----------

Intra-only (I-frame) encoding is confirmed on real hardware (Radxa
ROCK 4D).  With GOP size 1 the driver produces a valid H.264 stream the
reference decoder accepts.  This already exercises the full path: V4L2
m2m, the register programming, the software SPS/PPS prepend, and the
hardware slice output.

There is no upstream userspace involved (an encoder needs no request
API); I drive it with a small ioctl test program that feeds NV12 frames
and writes the CAPTURE buffers to a .h264 file.

The open problem: inter (P-frame) frames hang
---------------------------------------------

Every P-frame stalls the encoder's own hardware watchdog (INT_STA bit 8,
~20 ms after the kick) and produces essentially no bitstream.  I have
spent a lot of time narrowing this; it is sharply localized but I cannot
close it:

  - The P-frame register writes match a real register-write trace of the
    vendor stack encoding the same content, byte for byte (I traced the
    vendor kernel's writes and diffed against this driver's).

  - The reconstruction the previous frame writes is *valid*: dumping the
    recon buffer after the I-frame shows correct reconstructed pixels.

  - If the P-frame reads its own (older, settled) recon slot instead of
    the immediately-preceding frame's, it completes.  Reading the
    immediately-preceding frame's *fresh* reconstruction as the
    reference is what hangs.

  - It is not FBC: storing the reconstruction uncompressed
    (enc_pic.rec_fbc_dis = 1) still hangs.

  - The first frame of a session always works; the first P-frame hangs;
    after a couple of failures + core resets, later frames sometimes
    start completing.  It behaves like a warm-up / settling problem on
    the reference-read path, not a wrong register value.

So the encoder programs identically to the vendor and reads a valid
reference, but stalls fetching the previous frame's reconstruction as
the inter reference on the first inter frame of a session.  My best
guess is that the vendor does something between consecutive frame
submissions -- a completion/drain wait, a cache/coherency step, or a
per-frame re-arm -- that I am missing, but I have not found it.  If
anyone recognizes this on VEPU5xx, or knows what the reference-read path
needs between frames, a pointer would be very welcome.

The shape of this -- the first operation of a power session works, the
next stalls, and a reset/warm-up sometimes helps -- is the same one I
ran into bringing up this SoC's NPU (accel/rocket RKNN), where the
second/chained submit in a session would not fire [1].  I can't claim
they share a root cause, but if this is a known RK3576-wide submit /
re-arm quirk rather than an encoder-specific bug, that would be good to
know.

[1] https://lore.kernel.org/all/20260718031146.3368811-1-gahing@gahingwoo.com/

Notes for review
----------------

  - The PARAM/SQI register classes are programmed from mpp's constant
    "default tuning" tables (not derived per-frame), as noted in the
    code.  They are required: leaving them unwritten stalls even the
    I-frame.

  - Rate control is fixed-QP only for now (the bitrate control is
    advisory).

  - H.264 baseline/main, single slice, 4:2:0 only.

  - Tested at 176x144; other resolutions are not yet validated.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>

Jiaxing Hu (3):
  dt-bindings: media: add Rockchip RK3576 VEPU H.264 encoder
  media: rockchip: add VEPU510 H.264 encoder driver for RK3576
  arm64: dts: rockchip: rk3576: add VEPU H.264 encoder nodes

 .../bindings/media/rockchip,rk3576-vepu.yaml       |   94 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   50 +
 drivers/media/platform/rockchip/Kconfig            |    1 +
 drivers/media/platform/rockchip/Makefile           |    1 +
 drivers/media/platform/rockchip/rkvenc/Kconfig     |   14 +
 drivers/media/platform/rockchip/rkvenc/Makefile    |    6 +
 .../media/platform/rockchip/rkvenc/rkvenc-h264.c   | 1095 ++++++++++++++++++++
 .../media/platform/rockchip/rkvenc/rkvenc-regs.h   |  929 +++++++++++++++++
 drivers/media/platform/rockchip/rkvenc/rkvenc.c    |  892 ++++++++++++++++
 drivers/media/platform/rockchip/rkvenc/rkvenc.h    |  212 ++++
 10 files changed, 3294 insertions(+)
--
2.43.0


