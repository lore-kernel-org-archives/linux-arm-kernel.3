Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A72D13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLGPSVk2bP5kvW0cO5lIJPsvEcDGvX2l4OMDYG7WMv8=; b=2co75i2bZ4eetoTlbgAT2ofAEF
	HJSJvn5nCRB42Lk3nf8k9igNVUeOLDDe4Quat3p1E8qmbdSsr1YOebgi4OHA/6WyNrU+F+XHNoEv0
	b6Z7HxjxbjgE8we8KJQg03qCrSGmL1OAu7/Q7VDQ+F0avHLAaEWXNm5TW9GBtHfURavfnbpHmyZiQ
	D1R7qqtTtzyAyF5ZoqhmIL332KPJXD3Pb6wwYmlD05bZf+L8ZtoASV+o2SRLOLc/mjnVQ/yuUCIdr
	enthA6xtoYH8TTJhSutsXkmOoNIho9ocw7A2S/m4/UIR9H54tAf4qvtAu4hJClbVCfcQDvK9CwjT5
	0ExMEi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Kew-0000000A0yN-107b;
	Mon, 28 Oct 2024 07:59:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Kd8-0000000A0LS-0AXR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 07:57:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3B616A419BD;
	Mon, 28 Oct 2024 07:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7706C4CEC3;
	Mon, 28 Oct 2024 07:57:33 +0000 (UTC)
Message-ID: <6b8004e2-57df-4760-a59d-77a712e9ca4d@xs4all.nl>
Date: Mon, 28 Oct 2024 08:57:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 0/4] Add video encoder ROI ctrls
To: Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@oss.nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241022084040.3390878-1-ming.qian@nxp.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241022084040.3390878-1-ming.qian@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_005738_416706_81E21C25 
X-CRM114-Status: GOOD (  17.00  )
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

On 22/10/2024 10:40, Ming Qian wrote:
> Hi,
> 
> This patch set implements region of interest (ROI) ctrls for video
> encoder.
> 
> One video encoder IP may support the following two ROI configurations or
> one of them:
>     1. configure ROI as a rectangular region, and set a delta QP parameter.
>     2. configure ROI as a rectangular region, and set a priority parameter.
>     3. configure ROI as a QP map as an array. Each value represents the delta QP
> of a block in raster scan order. The block size is determined by
> the specific IP.
>     4. configure ROI as a QP map as an array. Each value represents the absolute QP
> of a block in raster scan order. The block size is determined by
> the specific IP.
> 
> To achieve this, I made the following change:
>     1. I reuse the type V4L2_CTRL_TYPE_RECT that is defined in the UVC ROI patchset
>     2. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_MODE to choose ROI configuration
>     3. Define some ctrl to configure ROI
>     4. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE to query block size
> 
> I referred the patchset "Implement UVC v1.5 ROI" (https://lwn.net/Articles/953532/)
> and pick some patches from it.

Please note that since this introduces the new TYPE_RECT and WHICH_MIN/MAX flags,
you also need to update v4l-utils.

This was done last year:

https://lore.kernel.org/linux-media/20230817072537.2837504-1-yunkec@google.com/

Can you pick this up and post a v2 for these v4l-utils changes? Note that I had some
comments at the time, so please fix those before posting v2.

Regards,

	Hans

> 
> changelog:
> 
> v3
> - Drop the type V4L2_CTRL_TYPE_REGION
> - Split the compound control into 2 ctrls
> - Define 4 ROI mode
> 
> v2
> - export symbol of v4l2_ctrl_type_op_minimum
> - export symbol of v4l2_ctrl_type_op_maximum
> 
> Hans Verkuil (1):
>   media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
> 
> Ming Qian (1):
>   media: v4l2-ctrls: Add video encoder ROI ctrls
> 
> Yunke Cao (2):
>   media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>   media: vivid: Add an rectangle control
> 
>  .../media/v4l/ext-ctrls-codec.rst             |  95 ++++++++++
>  .../media/v4l/vidioc-g-ext-ctrls.rst          |  26 ++-
>  .../media/v4l/vidioc-queryctrl.rst            |  14 ++
>  .../media/videodev2.h.rst.exceptions          |   4 +
>  drivers/media/i2c/imx214.c                    |   4 +-
>  .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
>  .../media/test-drivers/vivid/vivid-ctrls.c    |  34 ++++
>  drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 ++++--
>  drivers/media/v4l2-core/v4l2-ctrls-core.c     | 169 +++++++++++++++---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 +++++
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>  include/media/v4l2-ctrls.h                    |  62 ++++++-
>  include/uapi/linux/v4l2-controls.h            |  16 ++
>  include/uapi/linux/videodev2.h                |   5 +
>  14 files changed, 493 insertions(+), 49 deletions(-)
> 


