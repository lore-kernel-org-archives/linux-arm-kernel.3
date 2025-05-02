Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8B2C3ABBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LxPFVsUn/V2b9kR91YvOnca4jwf3B/adCvpO6BAOZY4=; b=my+D+vjRzWQa+RRhyBWJjY469p
	0qi3RSAjPDhgZBH1cY0KT7Ms6lzT6n2KzAiFoh0fVI/8dCkI1il/16rbPW0sR9bT9VvibpLps81Rr
	AghD4WVgp2Jq/91rzHmpeumTFHk9Uy2CeikBoUFynVNUALn9CYY/YaeriV7/L4ZzBnkxybiPKaTtC
	6HXWhQjn9u/p8fR7R0wzebnHZyEK6VuCHwAeMDsbp+9yRvqHoTSIMJIZW0nFY+bmX8r9qQywcHfKl
	VbWzT3M2zzcgwCxJwmIqoTZv8SWMrjGfNUs/8UmgNIno6/dVG8iibbMhdtjY+XUpjuGhiMQa5WBXz
	X3sO743A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6K-00000002dqK-1jwV;
	Fri, 02 May 2025 17:23:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtP0-00000002XQ6-23w4;
	Fri, 02 May 2025 16:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746203895;
	bh=StNCSoWqTHQVNnBSV3C33tQMvr1ACyrW1L37/XLZkWw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=VtI0M86iGqKNtCI/YHmVpMgC6HBmTIfOrA4YY+0vvgofcTMarsQ8v2IXDHfd+7LN2
	 T34mfNirbEGRJenY9I0GDGUhwqurv/+5uI6DwA1HgtTEmIKBBwe8NIvbomKHRU9j4M
	 EsoT3AYwn5z1ay8+NSg7SdmxFAUIVi7dtBkq0zc/B0Kx9fg58aw/Ni1uG6PZv6GvEv
	 G0iLOL4zMW+gs81SiTPTKABjdSW0VpAJD6E3OANANxmE0PaeUE+uY+rqlsiJE6V37/
	 y+Kv5j/4cb6N0mEPzL4+G7uB2tL3KAZQOGGQsx6q+Z5IuH++z9L6tXPGSRRJj1tgox
	 dYzpmcjweClWA==
Received: from [IPv6:2606:6d00:15:ec4::5ac] (unknown [IPv6:2606:6d00:15:ec4::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 48F3F17E0657;
	Fri,  2 May 2025 18:38:13 +0200 (CEST)
Message-ID: <2d82e4e0aa4c244e8b2d3f1e46e92760cd6238d7.camel@collabora.com>
Subject: Re: [RFC PATCH 03/11] media: uapi: add nal unit header fields to
 encode_params
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Marco Felsch <m.felsch@pengutronix.de>, benjamin.gaignard@collabora.com,
 	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, Sascha
 Hauer	 <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 paulk@sys-base.io, 	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Michael
 Tretter <m.tretter@pengutronix.de>
Date: Fri, 02 May 2025 12:38:11 -0400
In-Reply-To: <20250502150513.4169098-4-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
	 <20250502150513.4169098-4-m.felsch@pengutronix.de>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_093818_709729_6AA23027 
X-CRM114-Status: GOOD (  21.47  )
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

Le vendredi 02 mai 2025 à 17:05 +0200, Marco Felsch a écrit :
> From: Michael Tretter <m.tretter@pengutronix.de>
> 
> The VEPU540 and VEPU580 may prepare the NAL unit headers in the coded
> params. These values have to be provided by user space and be written
> into the hardware registers.

To be reworked in future version. This commit message refers to RK356x and
RK3688 encoders block from Rockchip. Though, its possible this applies for
Hantro IP too.

Nicolas
 
> Furthermore, nal_ref_idc indicates if a picture will be used as
> reference and is a hint to the driver, if it needs to keep the
> reconstructed buffer or not.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  include/uapi/linux/v4l2-controls.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 670f822ee758..a8df393c9ead 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1694,6 +1694,9 @@ struct v4l2_ctrl_h264_decode_params {
>  	__u32 flags;
>  };
>  
> +#define V4L2_H264_NAL_CODED_SLICE_NON_IDR_PIC	1
> +#define V4L2_H264_NAL_CODED_SLICE_IDR_PIC	5
> +
>  #define V4L2_CID_STATELESS_H264_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 8)
>  
>  /**
> @@ -1719,6 +1722,8 @@ struct v4l2_ctrl_h264_decode_params {
>   * @pic_init_qp_minus26: initial value minus 26 of luma qp for each slice.
>   * @chroma_qp_index_offset: offset that shall be added to qp luma for addressing the
>   * table of qp chroma values for the Cb chroma component.
> + * @nal_ref_idc: nal_ref_idc for the header of the generated NAL unit
> + * @nal_unit_type: one of the V4L2_H264_NAL_CODED_SLICE_{} values
>   * @flags: combination of V4L2_H264_ENCODE_FLAG_{} flags.
>   * @reference_ts: timestamp of the V4L2 buffer to use as reference
>   */
> @@ -1751,6 +1756,16 @@ struct v4l2_ctrl_h264_encode_params {
>  
>  	__u32 flags; /* V4L2_H264_ENCODE_FLAG_ */
>  
> +	/*
> +	 * If nal_ref_idc is 0, the NAL unit won't be used as reference by
> +	 * later NAL units. Any other value indicates that the NAL unit may be
> +	 * used as reference.
> +	 */
> +	__u8 nal_ref_idc;
> +
> +	/* TODO Can we infer the nal_unit_type from the slice_type? */
> +	__u8 nal_unit_type;
> +
>  	/* Reference */
>  
>  	__u64 reference_ts;

