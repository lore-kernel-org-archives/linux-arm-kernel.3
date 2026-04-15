Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90092F43821
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofXPji/7laZRxxQ+NmgzTWk9YZj9DL2cPl4WvjnsuZg=; b=oKTsrFHNLsWHKm1HF6/RIfr6G+
	SUk/3/iYsQUvz0k1+0aFhvByQHyBvnsXibrHqEASySvN6UTCGkRejmCeK72KRTNgxqTv8eBykW1P4
	SGiZ7IuIFeDLfVPbekedlz8LejY5r+5Xn6HDy/uaqbDT0eJIc9srMxGmhUveglhs6B+3PudU+hQfQ
	OVUs1KQiD+oABG3sUFFInba9aKFnfzGwN74RTozfr8BYN+sXDkUhBPaWrJRBE3U8ZtIuChywXxPRh
	/TUQBXcVOtM4XvqQ+R2dA/1i0qGorf7ZJfW9Voyto9trYU+3SE3dH3qeotgIh2ZDG7tIB+kCocuFG
	g3iH3pSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Kz-00000001FLT-47Vm;
	Wed, 15 Apr 2026 14:35:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD1Kw-00000001FL3-3SID;
	Wed, 15 Apr 2026 14:35:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776263723;
	bh=WnKn70BAZ4sIf6ZszM++Jo6mlB40fmv2BMBcceSDkYQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CiU2a4LlRImsM5l+nSEb0eApmWCoCHT3iaWM5v++oJlHVdZJ14Yq0iKPj+AAo8Ec1
	 z/WUs1E2sUwGuwt5MFKd6Hp6Wl7qHRLckSAKG6mNx+8q+1z616CD+WIyOY5+YPybAv
	 YcHRl5SZ26CkGGotAlJE9rVWhVnf8dFirqvbzp+bTB/bViqqVLCvW5sENkkrP/17Ge
	 uJ4bMQmmgUot7sTh2Dh+a7Zuly4E+TCX6OKPCHTvZUBNn5ZA9IDDDxZHO/N45m72yK
	 z0UoigsfQj08VU3mrRJDtrseTZd0ZNn6vjwfEo8a3wH1VVWFUr1gDwnwjZoJ6RcxEZ
	 dJ/JnSbRe6NYA==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4BEE517E0610;
	Wed, 15 Apr 2026 16:35:23 +0200 (CEST)
Message-ID: <fd663d6d-2380-41f9-8d03-8f7740cbd6ce@collabora.com>
Date: Wed, 15 Apr 2026 16:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] media: verisilicon: Simplification and clean up
To: nicolas.dufresne@collabora.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 kernel@collabora.com
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_073527_069916_8CD816DF 
X-CRM114-Status: GOOD (  11.29  )
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


Le 15/04/2026 à 16:04, Benjamin Gaignard a écrit :
> Simplify motion vectors and reference allocation with common helpers.
> Since it requires to move some of codecs specific functions and
> structure in codecs header files add a patch to finish the clean up.

I forgot to mention that this series depends on
https://patchwork.linuxtv.org/project/linux-media/patch/20260415073801.58369-1-benjamin.gaignard@collabora.com/

>
> Benjamin Gaignard (2):
>    media: verisilicon: Simplify motion vectors and rfc buffers allocation
>    media: verisilicon: Clean up messy include
>
>   drivers/media/platform/verisilicon/hantro.h   |  31 +-
>   .../media/platform/verisilicon/hantro_av1.c   |   7 -
>   .../media/platform/verisilicon/hantro_av1.h   | 100 +++-
>   .../platform/verisilicon/hantro_g1_h264_dec.c |   1 +
>   .../verisilicon/hantro_g1_mpeg2_dec.c         |   2 +-
>   .../platform/verisilicon/hantro_g1_vp8_dec.c  |   2 +-
>   .../media/platform/verisilicon/hantro_g2.c    |  36 --
>   .../platform/verisilicon/hantro_g2_hevc_dec.c |  26 +-
>   .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
>   .../media/platform/verisilicon/hantro_h264.c  |   2 +-
>   .../media/platform/verisilicon/hantro_h264.h  |  98 ++++
>   .../media/platform/verisilicon/hantro_hevc.c  |  37 +-
>   .../media/platform/verisilicon/hantro_hevc.h  |  82 ++++
>   .../media/platform/verisilicon/hantro_hw.h    | 446 +-----------------
>   .../media/platform/verisilicon/hantro_mpeg2.c |   1 +
>   .../media/platform/verisilicon/hantro_mpeg2.h |  27 ++
>   .../platform/verisilicon/hantro_postproc.c    |  29 +-
>   .../media/platform/verisilicon/hantro_v4l2.c  | 262 +++++++++-
>   .../media/platform/verisilicon/hantro_vp8.c   |   1 +
>   .../media/platform/verisilicon/hantro_vp8.h   |  29 ++
>   .../media/platform/verisilicon/hantro_vp9.h   | 104 ++++
>   .../media/platform/verisilicon/imx8m_vpu_hw.c |   5 +
>   .../verisilicon/rockchip_vpu2_hw_h264_dec.c   |   2 +-
>   .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c  |   2 +-
>   .../verisilicon/rockchip_vpu2_hw_vp8_dec.c    |   2 +-
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
>   .../platform/verisilicon/rockchip_vpu_hw.c    |   3 +
>   .../platform/verisilicon/stm32mp25_vpu_hw.c   |   2 +
>   .../media/platform/verisilicon/sunxi_vpu_hw.c |   1 +
>   29 files changed, 796 insertions(+), 572 deletions(-)
>   create mode 100644 drivers/media/platform/verisilicon/hantro_h264.h
>   create mode 100644 drivers/media/platform/verisilicon/hantro_hevc.h
>   create mode 100644 drivers/media/platform/verisilicon/hantro_mpeg2.h
>   create mode 100644 drivers/media/platform/verisilicon/hantro_vp8.h
>

