Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746E6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCBQFMYnCJ27WI7/OnpmZB7QvkRvKIZDq6ju7PvBY80=; b=Hsws2/gOPUEJ4sEIZ4yY4wDhEj
	T66GKKuea33vA7xEmszlnbWTRnXTN2lITMwJCaZNgfqGshLGc1z1ti8Nl/Nyht7VQ4JziZbzKLlj6
	0q/gSp4RsbQ38u7CPJVus7PjWt2YIAyBpaVCWkk29RhPim+SYFqhtJn9IADbTrixlvtcGE7slCw6L
	sLaskspHKCOSqKP3puboG6CikzqIjgutib3UsSu/uARRUm+8jyG+Hi4qCHwDi9i+TWsrVQGx9U5KK
	5yfhjajPBG2nCR9wAPn7fbk8DqNrxbLvlz+tkXOAkMo3047kTe+Kd8Pcow56feWVD6eqmSWAPNQP5
	7lzuiBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVR98-00000007Vad-4Add;
	Wed, 08 Jan 2025 08:10:34 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVR7v-00000007VTg-2dar;
	Wed, 08 Jan 2025 08:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736323760; x=1767859760;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EhrXhmuugAUf9A+DMIseR62Qd2kdQD2Wz+y/yrl7k2I=;
  b=T9nDErHP7ya8lUy9mGR4GF3OMPP2RIGJzeb9gt4fTRbl/juQopgIya2k
   azoQTdzwBCd5TuA8L3N4D18Q+EXSh3AGsie6ZAjYKOBWnOtvc0EkRFHhy
   mh9Y50RQu9+Zzu7yfE3hE1KEPcKA59ywte8bY3CR9o91w8TiwrQiGNz80
   nQOG4TlprJCMTpNKsth8Ow0NtgB8xLGk5IPMltImplVbL+NIQUu7Jkr8+
   9+tlin1Cdw0/YBB6cNyeGo3PaDlro6gohU6cln4CNhbHmnpoqJIEqTFsu
   EMqkPeF8oeaShCm9kGAE2J3t9Cc9noVN3SwasnhSe2GFqsZvcunLqtTfW
   A==;
X-CSE-ConnectionGUID: dhQZuiRVTE2QNYmhdZjTDg==
X-CSE-MsgGUID: cSNzbtmRTWahLBQvqoa2eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="35829810"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; 
   d="scan'208";a="35829810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:09:16 -0800
X-CSE-ConnectionGUID: Q/6a6sUtS72jFyRGUWyEyA==
X-CSE-MsgGUID: O1DVggeYQWW+EAckMs19MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108075856"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 00:09:12 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1359B11F9C0;
	Wed,  8 Jan 2025 10:09:09 +0200 (EET)
Date: Wed, 8 Jan 2025 08:09:09 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	John Cox <john.cox@raspberrypi.com>,
	Dom Cobley <dom@raspberrypi.com>,
	review list <kernel-list@raspberrypi.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/7] docs: uapi: media: Document Raspberry Pi NV12 column
 format
Message-ID: <Z34ypbE2mNp1tC5V@kekkonen.localdomain>
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <20241220-media-rpi-hevc-dec-v1-2-0ebcc04ed42e@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220-media-rpi-hevc-dec-v1-2-0ebcc04ed42e@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_000919_731136_494473C3 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Dave,

Thanks for the set.

On Fri, Dec 20, 2024 at 04:21:13PM +0000, Dave Stevenson wrote:
> The Raspberry Pi HEVC decoder uses a tiled format based on
> columns for 8 and 10 bit YUV images, so document them as
> NV12MT_COL128 and NV12MT_10_COL128.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index b788f6933855..90414491d7b5 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
>        - Cb\ :sub:`11`
>        - Cr\ :sub:`11`
>  
> +NV12MT_COL128 and NV12MT_10_COL128

Please use full macro names of the formats here.

> +----------------------------------
> +
> +``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
> +``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
> +of Y or interleaved CbCr.
> +
> +NV12MT_10_COL128 expands that as a 10 bit format where 3 10 bit values are

Ditto.

> +packed into a 32bit word. A 128 byte wide column therefore holds 96 samples
> +(either Y or interleaved CrCb). That effectively makes it 6 values in a 64 bit
> +word for the CbCr plane, as the values always go in pairs.
> +
> +Bit-packed representation.
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 8 8 8 8
> +
> +    * - Y'\ :sub:`00[7:0]`
> +      - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub:`00[9:8]`\ (bits 1--0)
> +      - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub:`01[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\ (bits 5--0)
> +
> +.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
> +
> +.. flat-table::
> +    :header-rows:  0
> +    :stub-columns: 0
> +    :widths: 12 12 12 12 12 12 12 12
> +
> +    * - Cb\ :sub:`00[7:0]`
> +      - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :sub:`00[9:8]`\ (bits 1--0)
> +      - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :sub:`00[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ (bits 5--0)
> +      - Cr\ :sub:`01[7:0]`
> +      - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :sub:`01[9:8]`\ (bits 1--0)
> +      - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :sub:`02[9:6]`\ (bits 3--0)
> +      - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ (bits 5--0)
> +
>  
>  Fully Planar YUV Formats
>  ========================
> 

-- 
Kind regards,

Sakari Ailus

