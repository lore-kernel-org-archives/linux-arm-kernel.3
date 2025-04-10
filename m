Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6C3C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qZZP4FNK+HyNHl3VBHbY4FLuHj2CdEKhTPJZ5V5EDJI=; b=HNserLm+sxG2TQvAsXbhxUVDvh
	cCmVEG2kVOemxiN/QgajKkUP4k589iFotvfumJZfW1ZG+YlYtlTEajv9kjRx5G1X2kEf00ZpVgWCT
	Lzbh3xriXAYO2NGCDA4ionNaJtVDXOm7s8+PaC3KCoEro3zvcmGYd26n6KPBq61ARsDyzXH4ZSKWV
	IzCQEFSeZz3otkp6wtBsf7wXGc13i+0IjOfhrRd+UuByIpaCD9IvenfvswstIT0V6/WC/q8y2SM6k
	xq5BG4tX+Uo+q0rIPZtm4nk44/Wf3CEjY7jegp5l16HOfpcanOCPX+W01IaeDwIuUo2+XyiZo9SlS
	w8EZ9g9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rMM-0000000AZL6-0WvY;
	Thu, 10 Apr 2025 12:50:22 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2rEw-0000000AXdR-34iF;
	Thu, 10 Apr 2025 12:42:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744288948; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dfhjdATU8F1Etf7PJl7wcbRgZisHzpzsl1zZUGvehI7rbOLqvqZtYtB8iNfpq6bYY3UXPB9I8QU2JPdcM8578gM/Q7Q0VqctSSePnMHjd5nl/k7DhqBVpLKbbDMKDIJR+s6HSjyd1pOoxkxrfC0hqoQsqLHJxt1Tg/15CT+J8Xk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744288948; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qZZP4FNK+HyNHl3VBHbY4FLuHj2CdEKhTPJZ5V5EDJI=; 
	b=RGa+omEExAXwm3HTIRr3CGaUv94lNhWmha+bTKQPBLQZdDt9nDL58F+85vdtZxg+ZqMiNzSOo4m58cZVWf+k9XQ35IrQtCL/jq3ufgNPOFnrcZYAHC09Qs4/RRZzNt8RqLdpyvT4fRpXqWKTRqhw3VsKXjq6+ofnC5H4qrxY89g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744288947;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=qZZP4FNK+HyNHl3VBHbY4FLuHj2CdEKhTPJZ5V5EDJI=;
	b=Tf/s1+X82HlQOSpdb3XknS+1ycW8/ZXBTdpG1AcXIa62D43egli5r/bOXuYYGx3q
	o/wDu9gwN0+JFsMXh3YuM98zUuNCmtiMCumsL4zsMJkbjCjHGgKyIEhnewFjb26ehiM
	3XnA6YhxbTm2YvJa1ayGawiOL7i0UzKOf7E0+224=
Received: by mx.zohomail.com with SMTPS id 174428894677713.690566553537792;
	Thu, 10 Apr 2025 05:42:26 -0700 (PDT)
Message-ID: <c4dc7564-f985-40cd-9d37-4df4ee6e126d@collabora.com>
Date: Thu, 10 Apr 2025 14:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicono: Enable NV15 support for Rockchip
 VDPU981
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250409-b4-hantro-nv15-support-v1-1-7e11e47fd0c9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_054242_831175_1B13716E 
X-CRM114-Status: GOOD (  15.58  )
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


Le 09/04/2025 à 21:30, Nicolas Dufresne a écrit :
> This is a "customer" format, though on Rockchip RK3588 it has been
> verified to be NV15 format, which matches what the GPU and display
> handles has 10bit pixel formats.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/hantro_v4l2.c           |  1 +
>   .../platform/verisilicon/rockchip_vpu981_hw_av1_dec.c      |  4 ++++
>   drivers/media/platform/verisilicon/rockchip_vpu_hw.c       | 14 ++++++++++++++
>   3 files changed, 19 insertions(+)
>
> diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
> index 2bce940a58227c2bfef2bc3343992e4588ab36a4..7c3515cf7d64a090adfb8d8aff368f9a617f8c8a 100644
> --- a/drivers/media/platform/verisilicon/hantro_v4l2.c
> +++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
> @@ -77,6 +77,7 @@ int hantro_get_format_depth(u32 fourcc)
>   	switch (fourcc) {
>   	case V4L2_PIX_FMT_P010:
>   	case V4L2_PIX_FMT_P010_4L4:
> +	case V4L2_PIX_FMT_NV15:
>   	case V4L2_PIX_FMT_NV15_4L4:
>   		return 10;
>   	default:
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index 69b5d9e12926fb408c08f8ba2139d05ba44389b7..e4703bb6be7c175a89c0b8868cf2eafb84a872ed 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -2202,6 +2202,10 @@ static void rockchip_vpu981_postproc_enable(struct hantro_ctx *ctx)
>   	case V4L2_PIX_FMT_NV12:
>   		hantro_reg_write(vpu, &av1_pp_out_format, 3);
>   		break;
> +	case V4L2_PIX_FMT_NV15:
> +		/* this mapping is RK specific */
> +		hantro_reg_write(vpu, &av1_pp_out_format, 10);
> +		break;
>   	default:
>   		hantro_reg_write(vpu, &av1_pp_out_format, 0);
>   	}
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index 964122e7c355934cd80eb442219f6ba51bba8b71..f7c4a176167b40fe79ec5a6759dff8a77e849ae3 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -92,6 +92,20 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
>   			.step_height = MB_DIM,
>   		},
>   	},
> +	{
> +		.fourcc = V4L2_PIX_FMT_NV15,
> +		.codec_mode = HANTRO_MODE_NONE,
> +		.match_depth = true,
> +		.postprocessed = true,
> +		.frmsize = {
> +			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_width = FMT_4K_WIDTH,
> +			.step_width = MB_DIM,
> +			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> +			.max_height = FMT_4K_HEIGHT,
> +			.step_height = MB_DIM,
> +		},
> +	},
>   	{
>   		.fourcc = V4L2_PIX_FMT_P010,
>   		.codec_mode = HANTRO_MODE_NONE,
>
> ---
> base-commit: 9ddc3d6c16ea2587898a315f20f7b8fbd791dc1b
> change-id: 20250403-b4-hantro-nv15-support-07def4e7a537
>
> Best regards,

