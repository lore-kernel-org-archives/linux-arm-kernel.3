Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5343D6ED2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 13:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zcbz2RZe19TKsqJ/WRoGlA+GN683d7b2Sedzfexr4xs=; b=w32QqWuhxNhGtP
	xxt6LlGxByo04krB2d2d796TV4ENUZwcYCNU1ZIwqC6JYNLiUJxhA4MsUvlbgKU3DD/qmlN278XnR
	mV4zNvQLWv56SIjeMoRUjqu1XSsIz94K1TKDWLMq5fZmKgTioGLMct7cD/trke12KLHieZhdFupow
	cITj5PGeiuulcK5JAoCI6fD0VUOkNIc5a/u16i0LqPfQOO4dxR4SlrzuzswYKxptJx/NXpcf7BV1W
	Zb9ECQWtsoVb68t799+vTsh1antKsF5OtcSeQsYAyez1XlobDdJ3MUD6tbFJUSgZmsQRkrVXLKmIw
	T+1LUPmb+1vTEA04dU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE79A-0000000065l-1Fwv;
	Thu, 21 Nov 2024 13:23:00 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE78D-000000005vL-2NeE;
	Thu, 21 Nov 2024 13:22:03 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL8uHZN023498;
	Thu, 21 Nov 2024 14:21:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=zcbz2RZe19TKsqJ/WRoGlA
	+GN683d7b2Sedzfexr4xs=; b=xRlBS17GulkvBcIRw2A99BQ5bQfr9VXDJCe3xv
	URB6gDpw/9bVL/bXicPoiRIphkg0g38zTXktA0KykKFIeadxXyOwvMCe7YzcgjVm
	6UBVu01ArNDlNfj+E1rkWbyqbYEWL57FQEWYzD7+AxYWsovktOdBMp8Y9p57KWUA
	wmc3XSPayp5XkFAGb+D/lStsx/IQ/vmKATVSZ1pbNbBeAPPOD8fGSvEfDU6ThGjZ
	k5LXX3DKe7jPTakMTDPXbSEzYfY3GFINArDZyK9U8Uv16ToOXaRGJrZILZzXBXVB
	gejQNNu0gv4yQ9WusAqFJNPYxRoD8v8CuFUK/F1vEoqApzlw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqf6rrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 14:21:44 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2697640047;
	Thu, 21 Nov 2024 14:19:56 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1DB422843CB;
	Thu, 21 Nov 2024 14:19:07 +0100 (CET)
Received: from localhost (10.48.86.208) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 14:19:06 +0100
From: Hugues Fruchet <hugues.fruchet@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Hugues Fruchet
	<hugues.fruchet@foss.st.com>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Erling Ljunggren <hljunggr@cisco.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        Benjamin
 Gaignard <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 0/3] Add WebP support to hantro decoder
Date: Thu, 21 Nov 2024 14:19:01 +0100
Message-ID: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_052201_881393_E0C54129 
X-CRM114-Status: GOOD (  11.35  )
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

Add WebP image decoding support to stateless V4L2 VP8 decoder.

This have been tested on STM32MP257-EV board using GStreamer.

Simple basic test:
$> wget https://www.gstatic.com/webp/gallery/1.webp
$> gst-launch-1.0 filesrc location= 1.webp ! typefind ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true

Slideshow of a set of WebP pictures and WebM video files:
$> wget https://www.gstatic.com/webp/gallery/2.webp
$> wget https://www.gstatic.com/webp/gallery/3.webp
$> wget https://www.gstatic.com/webp/gallery/4.webp
$> wget https://www.gstatic.com/webp/gallery/5.webp
$> wget https://samplemedia.linaro.org/VP8/big_buck_bunny_480p_VP8_VORBIS_25fps_1900K_short.WebM
$> gst-play-1.0 *.webp *.webm *.WebM --wait-on-eos
<hit key ">" to display next file >

Large WebP image > 16777215 (size > 2^24)
$> gst-launch-1.0 fakesrc num-buffers=1 format=4 do-timestamp=true filltype=3 sizetype=2 sizemax=25165824 blocksize=25165824 ! video/x-raw, format=I420, width=4096, height=3072, framerate=1/1 ! webpenc quality=100 ! filesink location=4096x3072_HQ_random.webp
$> ls -l 4096x3072_HQ_random.webp
[...] 16877404 Nov 20 11:40 4096x3072_HQ_random.webp
$> gst-launch-1.0 filesrc location= 4096x3072_HQ_random.webp blocksize=16876610 ! image/webp, width=1, height=1, framerate=0/1 ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true

Large WebP image decoding using post-processor is untested because of lack
of hardware support on this platform, nevertheless support is provided in
this serie for further testing on another platform having post-processor
support.

===========
= history =
===========
version 3:
   - Fix remarks from Nicolas Dufresne:
    - Document constraint about key frame only for WebP
    - Fix rebase issue
   - Fix typo detected by Diederik de Haas

version 2:
   - Fix remarks from Nicolas Dufresne:
    - Use bytesperline helper to compute chroma size
    - Introduce a new explicit WEBP frame compressed format
      instead of relying on VP8 + WebP flag
    - 4K support in both decoder and post-proc

version 1:
  - Initial submission

Hugues Fruchet (3):
  media: uapi: add WebP uAPI
  media: verisilicon: add WebP decoding support
  media: verisilicon: postproc: 4K support

 .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
 .../media/v4l/pixfmt-compressed.rst             | 17 +++++++++++++++++
 drivers/media/platform/verisilicon/hantro.h     |  2 ++
 .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
 .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
 .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
 .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
 .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
 drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
 include/uapi/linux/videodev2.h                  |  1 +
 10 files changed, 68 insertions(+), 4 deletions(-)

-- 
2.25.1


