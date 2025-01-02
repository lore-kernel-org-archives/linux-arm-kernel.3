Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF41AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIOD8QrsWxqeqXYea09cjJQmEWGSbOI4WIbuvRZ3TRs=; b=phBye5P4BHefEK3OjE6lAY+PZl
	UKaF9lqeP7lZLgXlio/Nlat3m4oGviH480VxoY/l9LvyNTg/vtW/JPuPmp+K9mE1t//aA8nJdxDc2
	K0iXxpuEgSN5CVLiCf4FNl+KbxVqZRyp5N80ABRUxli0WhDqkAGdGD4qZhJKYeAntIRcnxz36WxO8
	MPgcA7LQWMliTjlCOcseyHam1K3+cB66B5LMYPsJ3V8hKLOe/eW/zsoK/o2/6+Ne0JRP17Pi8KeJc
	B/120wvgs5bIvUr3qy8p+KROooScxFleF1woe47Vkjmk8rapzFVCGwc36MZow04EPykS8B55KsEwx
	IjzvW/kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKiE-0000000APZa-2vXX;
	Thu, 02 Jan 2025 12:54:06 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKgz-0000000APAE-33JQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 12:52:51 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so11842163276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 04:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1735822368; x=1736427168; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yIOD8QrsWxqeqXYea09cjJQmEWGSbOI4WIbuvRZ3TRs=;
        b=pMuuD0H8pg5hGmPiuCJ3rHgAm0SPC+nzSaEuKRXCht6erZvX9xC+Hgwb76fO5e2M5K
         xarXYHfJHRp+8fIfhR5kPKVzU1ffkJkreMpiDvIITY0fysh/3sBsLytBQn/h12nzjQDx
         DXFM93o5a2weHDCkebN0fZKjR2hWN+yKCckAlr5tHCDC0SFyMjkONrzAZ5zdyUWYGqay
         oppN+nTH0WyF+wJYbgVFMoyEdfEF1DIDOy+5FnOMWMtfY5Egq7Lm50wR05KXmIup5rSV
         05GH92YLZWsymlcJ/8z2q4AQIlaIZLE6NJC4A4oyFPgR111SCdzkgPz5HcD9DixMXH9M
         oYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735822368; x=1736427168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yIOD8QrsWxqeqXYea09cjJQmEWGSbOI4WIbuvRZ3TRs=;
        b=jObrXSNFF5wG9UaQhbpdyKLvGjbJSmBwUwfrTgXd0vucinrG0leNCt3FBKoqPkdydj
         DTiN5sNCLqrk9ll2wwq7b1REtUElm9tZKqMK+0W64/F6Lf8Vh49Ni7oIFF3jgeoGYlU4
         6v+okNp8xQMNjVJcqJim0WqVAXFzpF072AaIf6Fko2ZvsSXtt4rPihRdmPMnqV4mOjX0
         NpXNdsEWt211xR+ygPnDFPqNU58xSKDAd3o2KJJBzEDsYVV5JM2Nhk+TnNVlL1wAMsdT
         OLBVnZvzhDANXJx0xuCf8Szu9/F2J3/tXZj/Necj+jYMr28CsUvXqYe+u0jBd6hOPo7T
         1HVw==
X-Forwarded-Encrypted: i=1; AJvYcCXiWTGKDXVe4s1dB2PnlCkcQ5bZx1UWE164jxk1HTrfCsrj5jiGvalUYhnduqj8UFRtloOB47YHX+G/xK5A9BPN@lists.infradead.org
X-Gm-Message-State: AOJu0YwXU4hR7cNPmt2XT3/Gjnhka/QR6kDG8Yom6IBc2dUH5yTaawQA
	uOC9FpwDR0w1VaFWHPt/robGFdxBB0hW5RFN3QYTtox0UGYgP+co22WJiXM15BVwEij9rDAyQJD
	hbOMDR/i7V3XWWaZcV4OQxdUm9/JXRNBKSMShuw==
X-Gm-Gg: ASbGncvQeCIE/ysj3eJj/VaoDh6TdBaHcNJ8SFZSMOT4q1Sh6weUdB7DzXAkBAVQHN5
	PEyoNuZTcdnUXf9eA4cwANSsUxjYCMbZNxEjZ6Q==
X-Google-Smtp-Source: AGHT+IESytUCNtmsOTMh1dyl2/5YIAsxOS0II0sunaBnTCp+AEb+yDJmx9j2bpg20kNupv4++Vdkh4sAQQwJZ1gRz6w=
X-Received: by 2002:a05:690c:6605:b0:6ef:57f9:ec4 with SMTP id
 00721157ae682-6f3f80de947mr307485967b3.5.1735822368150; Thu, 02 Jan 2025
 04:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20241220-media-rpi-hevc-dec-v1-0-0ebcc04ed42e@raspberrypi.com>
 <20241220-media-rpi-hevc-dec-v1-3-0ebcc04ed42e@raspberrypi.com> <d2f047cd-5c50-454f-95be-601edb79466d@collabora.com>
In-Reply-To: <d2f047cd-5c50-454f-95be-601edb79466d@collabora.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 2 Jan 2025 12:52:32 +0000
Message-ID: <CAPY8ntBNse4Dq9E49QO3ipDbb+uMipe+MuLxW_Jpszu9gQgpww@mail.gmail.com>
Subject: Re: [PATCH 3/7] media: ioctl: Add pixel formats NV12MT_COL128 and NV12MT_10_COL128
To: Robert Mader <robert.mader@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_045249_900787_0106C35B 
X-CRM114-Status: GOOD (  22.61  )
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

Hi Robert

Resending this reply as replying from my phone before the Christmas
break sent it as HTML :-(

On Sat, 21 Dec 2024 at 17:38, Robert Mader <robert.mader@collabora.com> wrote:
>
> Hi, thanks for the patch.
>
> On 20.12.24 17:21, Dave Stevenson wrote:
>
> Add V4L2_PIXFMT_NV12MT_COL128 and V4L2_PIXFMT_NV12MT_10_COL128
> to describe the Raspberry Pi HEVC decoder NV12 multiplanar formats.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 5 +++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 0304daa8471d..e510e375a871 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1377,7 +1377,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>   case V4L2_PIX_FMT_NV16M: descr = "Y/UV 4:2:2 (N-C)"; break;
>   case V4L2_PIX_FMT_NV61M: descr = "Y/VU 4:2:2 (N-C)"; break;
>   case V4L2_PIX_FMT_NV12MT: descr = "Y/UV 4:2:0 (64x32 MB, N-C)"; break;
> + case V4L2_PIX_FMT_NV12MT_COL128: descr = "Y/CbCr 4:2:0 (128b cols)"; break;
>   case V4L2_PIX_FMT_NV12MT_16X16: descr = "Y/UV 4:2:0 (16x16 MB, N-C)"; break;
> + case V4L2_PIX_FMT_NV12MT_10_COL128: descr = "10-bit Y/CbCr 4:2:0 (128b cols)"; break;
>   case V4L2_PIX_FMT_P012M: descr = "12-bit Y/UV 4:2:0 (N-C)"; break;
>   case V4L2_PIX_FMT_YUV420M: descr = "Planar YUV 4:2:0 (N-C)"; break;
>   case V4L2_PIX_FMT_YVU420M: descr = "Planar YVU 4:2:0 (N-C)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index e7c4dce39007..f8f97aa6a616 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -687,6 +687,11 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
>  #define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
>  #define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
> +#define V4L2_PIX_FMT_NV12MT_COL128 v4l2_fourcc('N', 'c', '1', '2') /* 12  Y/CbCr 4:2:0 128 pixel wide column */
> +#define V4L2_PIX_FMT_NV12MT_10_COL128 v4l2_fourcc('N', 'c', '3', '0')
>
> Should these be upper-case Cs instead? So they compatible with the previously used downstream values?

No, this is deliberate.

Downstream was using a single planar format, with extra complexity for
determining the chroma offset per column, and weird handling required
on bytesperline.
Having had discussions, switching to a multiplanar format (hence MT in
the name) removes those complexities and means we don't need to do
anything weird in the v4l2 format definitions.

Reusing NC12 and NC30 fourccs will give us grief over backwards
compatibility, hence lower case for the new version.

I have a patch on [1] that adds back in NC12 and NC30 for downstream
just so we don't break existing users, but see no point in upstreaming
that.

> P.S.: Coincidentally Gstreamer just landed support for NC12 in https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/7355 and there is also a link to experimental NC30 patches. So happy to see this series appear upstream :)

Ooh, nice. I'll give it a test when I'm back in the office.

Dave

[1] https://github.com/6by9/linux/commits/rpi-6.12.y-hevc_dec/

> + /* Y/CbCr 4:2:0 10bpc, 3x10 packed as 4 bytes in
> + * a 128 bytes / 96 pixel wide column */
> +
>
>  /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
>  #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
>

