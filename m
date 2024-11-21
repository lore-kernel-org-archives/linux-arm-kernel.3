Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D79D78765
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 14:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAlbkjqBlD0R3FSv5bX889vfuMU5j/rR8gfcpzLu/u0=; b=gTUI65Xya9X8VZ9GOaGQNQpvJl
	6wMQpa5YWjeD2eu6vfHdF+bKX1GmQAL8sgS7CKgYurq61LN1ATNKCbXdNqXQbUy99CkFMeB5DdZoh
	zIZS5Wbly+rpOxTJjdUQjycVDld7rxxgFJr+SVNvusmlqxkZHqquj3asH/2EiR3jwQX67Hsb4Zaw4
	ozNROXi5mjJpmIhNSsDEpMHXdsnPdF72sfPnOeEzY+8+PCU9aEh2h6ioIX7N2iZ3BTyryXWAZaTGv
	fCPDqJX55QrtTz5zhq3pS6G6FMmORrm03iAIseEUSthTJ2t8AIse/WzkbT//9tHL747rm1krI0zn+
	YIVUVmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE83r-00000000CTQ-14lv;
	Thu, 21 Nov 2024 14:21:35 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE82t-00000000CHb-2sTE;
	Thu, 21 Nov 2024 14:20:37 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ALA95BP028349;
	Thu, 21 Nov 2024 15:20:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	JAlbkjqBlD0R3FSv5bX889vfuMU5j/rR8gfcpzLu/u0=; b=sbpl/LPiBr3D4gPg
	/K8PcSO2DSu650saG5zzqbJeDCpFlqysf98wDAZP5pxSfKeqK14PEK7ZkP778mtM
	NWHfndCwMrgNgej4wfQ4OzKyNmITFvbKSu6Fb3bbnexoFvZb1ZXi2uPz4/S7XGrb
	zZMFOA6Friu12I7rzLjB8rUDO1m9SRGrmJWkaxJm2W1dU5fdpYlITvCEX7id04F4
	ccW6yQkfDlbYzacvJvVmbiKajZrhaHpKPwrWND5BAyI5CMxsFgz4nyTgFqBlhL/9
	CJV1BvgvvvPzrlJFqdmN96OxBN4ICUnYFHuslXTafavZiU1h+y6JCgiSmR0dVLP7
	VsBwxQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42xkqf713x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 15:20:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 86B6340046;
	Thu, 21 Nov 2024 15:18:33 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5C0A828D457;
	Thu, 21 Nov 2024 15:16:43 +0100 (CET)
Received: from [10.48.86.208] (10.48.86.208) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 21 Nov
 2024 15:16:42 +0100
Message-ID: <86907cc9-5339-435a-a346-08beea21b886@foss.st.com>
Date: Thu, 21 Nov 2024 15:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add WebP support to hantro decoder
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ezequiel Garcia
	<ezequiel@vanguardiasur.com.ar>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
References: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
Content-Language: en-US
From: Hugues FRUCHET <hugues.fruchet@foss.st.com>
In-Reply-To: <20241121131904.261230-1-hugues.fruchet@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.208]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_062036_006556_78AE3E72 
X-CRM114-Status: GOOD (  15.08  )
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

Hi all,

The corresponding GStreamer code has been pushed here (v4l2slwebpdec):
https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7939

BR,
Hugues.

On 11/21/24 14:19, Hugues Fruchet wrote:
> Add WebP image decoding support to stateless V4L2 VP8 decoder.
> 
> This have been tested on STM32MP257-EV board using GStreamer.
> 
> Simple basic test:
> $> wget https://www.gstatic.com/webp/gallery/1.webp
> $> gst-launch-1.0 filesrc location= 1.webp ! typefind ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true
> 
> Slideshow of a set of WebP pictures and WebM video files:
> $> wget https://www.gstatic.com/webp/gallery/2.webp
> $> wget https://www.gstatic.com/webp/gallery/3.webp
> $> wget https://www.gstatic.com/webp/gallery/4.webp
> $> wget https://www.gstatic.com/webp/gallery/5.webp
> $> wget https://samplemedia.linaro.org/VP8/big_buck_bunny_480p_VP8_VORBIS_25fps_1900K_short.WebM
> $> gst-play-1.0 *.webp *.webm *.WebM --wait-on-eos
> <hit key ">" to display next file >
> 
> Large WebP image > 16777215 (size > 2^24)
> $> gst-launch-1.0 fakesrc num-buffers=1 format=4 do-timestamp=true filltype=3 sizetype=2 sizemax=25165824 blocksize=25165824 ! video/x-raw, format=I420, width=4096, height=3072, framerate=1/1 ! webpenc quality=100 ! filesink location=4096x3072_HQ_random.webp
> $> ls -l 4096x3072_HQ_random.webp
> [...] 16877404 Nov 20 11:40 4096x3072_HQ_random.webp
> $> gst-launch-1.0 filesrc location= 4096x3072_HQ_random.webp blocksize=16876610 ! image/webp, width=1, height=1, framerate=0/1 ! v4l2slwebpdec ! imagefreeze num-buffers=20 ! waylandsink fullscreen=true
> 
> Large WebP image decoding using post-processor is untested because of lack
> of hardware support on this platform, nevertheless support is provided in
> this serie for further testing on another platform having post-processor
> support.
> 
> ===========
> = history =
> ===========
> version 3:
>     - Fix remarks from Nicolas Dufresne:
>      - Document constraint about key frame only for WebP
>      - Fix rebase issue
>     - Fix typo detected by Diederik de Haas
> 
> version 2:
>     - Fix remarks from Nicolas Dufresne:
>      - Use bytesperline helper to compute chroma size
>      - Introduce a new explicit WEBP frame compressed format
>        instead of relying on VP8 + WebP flag
>      - 4K support in both decoder and post-proc
> 
> version 1:
>    - Initial submission
> 
> Hugues Fruchet (3):
>    media: uapi: add WebP uAPI
>    media: verisilicon: add WebP decoding support
>    media: verisilicon: postproc: 4K support
> 
>   .../userspace-api/media/v4l/biblio.rst          |  9 +++++++++
>   .../media/v4l/pixfmt-compressed.rst             | 17 +++++++++++++++++
>   drivers/media/platform/verisilicon/hantro.h     |  2 ++
>   .../media/platform/verisilicon/hantro_g1_regs.h |  3 ++-
>   .../platform/verisilicon/hantro_g1_vp8_dec.c    | 14 ++++++++++++++
>   .../platform/verisilicon/hantro_postproc.c      |  6 +++++-
>   .../media/platform/verisilicon/hantro_v4l2.c    |  2 ++
>   .../platform/verisilicon/stm32mp25_vpu_hw.c     | 17 +++++++++++++++--
>   drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>   include/uapi/linux/videodev2.h                  |  1 +
>   10 files changed, 68 insertions(+), 4 deletions(-)
> 

