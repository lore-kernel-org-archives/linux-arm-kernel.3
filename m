Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A1ECA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 21:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKMv3EjzyP5e1tIqE6+kbHOhv7w3DBH++PQKZ6L3hMo=; b=qZhdvivomZObN+HE3LQwBStwFF
	RM1M6kus59MnwZPx8i0UWdcOv/Ssrg0xdnnEvLTGTpus8GETxUenwR5ZjKbM2F6UT1nFc5dn+bm6b
	C3XtqN+B0pI3HOgP6hxG1MvNP7ZMoTxaCdRuzIuWeDdVIsaF1AGjBlT1UPiv901zoA/fxLKouTdsE
	yOdLytu5Pk9rtkf4MjbRw17OyCkCUii3WtC3qtD3RHKEe7EwPdEoNW2NK4kT/oCPlpJgJhb0ZYSJa
	B7pXWl4QBe2DOU2mo9EffHOLR5pgARuVYCtFKAEsVKyzXjouwnOHWQQDLhvd3vuC/0LivqI2SxKv4
	4Bv5yIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulwHr-0000000C1ez-0qqG;
	Tue, 12 Aug 2025 21:12:03 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulvKA-0000000BvRF-3ciZ;
	Tue, 12 Aug 2025 20:10:23 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755029415; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MyhnnS/y2ph5BqU/m2pJCp5zVK2dPRtUTHVf/RDIXVhEaqU07l94Hds6NKVgEBcrzlS2ITy/EH3JSc7tEz4WyNfVxUaFRb8nMpbUoXfmYQuxGOXUg8OgaWYVlrOxa4stYNpuKkpZjpjlL7aBZQKmChAp3EcUBfAH9DwUqVF6tHA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755029415; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vKMv3EjzyP5e1tIqE6+kbHOhv7w3DBH++PQKZ6L3hMo=; 
	b=BNis0RKCcDx6Kec0YV/WJ1VowIXmaJ1JFaZnYKQr/CNn+ATgOvLoIC75ixZXlR4Rev4ZNArQaaAjRkg5zgUi7zVScHveIxmkHgjZelDXaOyFSSE8EuGgXYMhq/nEtRxwfiEamK6i7O1AjQTOh8Enw/dEwSKt15lqXu959MkudNs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755029415;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=vKMv3EjzyP5e1tIqE6+kbHOhv7w3DBH++PQKZ6L3hMo=;
	b=h/wkpEmzpQIxvba+VNZ/Ff9F/YD4ozHH0sTNiwxMyrAiPuG8fitB7zpbUzNPjbGa
	aBYnsdYAWs7g3ixsD1aWxyD6gfU2M8NlJfMcrlANEGOPH/MG+GWvzniAR61YovFegH2
	RhAV7ItqQbk83DkbKi1sOdqz25kkX/gc473lOGN0=
Received: by mx.zohomail.com with SMTPS id 1755029413898374.0260479942565;
	Tue, 12 Aug 2025 13:10:13 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Alex Bee <knaerzche@gmail.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
Date: Tue, 12 Aug 2025 16:10:12 -0400
Message-ID: <22971824.EfDdHjke4D@earth>
In-Reply-To: <20250810212454.3237486-2-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <20250810212454.3237486-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_131022_972432_5B92E729 
X-CRM114-Status: GOOD (  19.75  )
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

Hi Jonas,

On Sunday, 10 August 2025 17:24:31 EDT Jonas Karlman wrote:
> The Rockchip VDEC supports the HEVC codec with the Main and Main10
> Profile up to Level 5.1 High tier: 4096x2304@60 fps.
> 
> Add the backend for HEVC format to the decoder.
> 
> Signed-off-by: Alex Bee <knaerzche@gmail.com>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - Use new_value in transpose_and_flatten_matrices()
> - Add NULL check for ctrl->new_elems in rkvdec_hevc_run_preamble()
> - Set RKVDEC_WR_DDR_ALIGN_EN for RK3328
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |    2 +-
>  .../rockchip/rkvdec/rkvdec-hevc-data.c        | 1848 +++++++++++++++++
>  .../platform/rockchip/rkvdec/rkvdec-hevc.c    |  817 ++++++++
>  .../platform/rockchip/rkvdec/rkvdec-regs.h    |    2 +
>  .../media/platform/rockchip/rkvdec/rkvdec.c   |   76 +
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |    1 +
>  6 files changed, 2745 insertions(+), 1 deletion(-)
>  create mode 100644
> drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-data.c create mode
> 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
>

[snip]

> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
> b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c new file mode 100644
> index 000000000000..1994ea24f0be
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c

[snip]

> +
> +static enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx
> *ctx, +						       struct 
v4l2_ctrl *ctrl)
> +{
> +	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
> +
> +	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
> +		return RKVDEC_IMG_FMT_ANY;
> +
> +	if (sps->bit_depth_luma_minus8 == 0) {
> +		if (sps->chroma_format_idc == 2)
> +			return RKVDEC_IMG_FMT_422_8BIT;

Is 4:2:2 really supported ? It is not on rk3588 and likely neither on rk3576.
You also mention later that Only 4:0:0 and 4:2:0 are supported.

> +		else
> +			return RKVDEC_IMG_FMT_420_8BIT;
> +	} else if (sps->bit_depth_luma_minus8 == 2) {
> +		if (sps->chroma_format_idc == 2)
> +			return RKVDEC_IMG_FMT_422_10BIT;

Same here.

--
Detlev.




