Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA21C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 08:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErsThfcuFeMHatEnc3z+bZN9akXjEN+QQbeFPe2UO1I=; b=i3iQWXSUJ4K8CaM3NuAmM4kgFO
	ENDf8wU+XwntTYLIVyLvFduIc/yOH9BdoYbmAEMk0UzQvQ2nv0jM4kgSWDt7xe1ykxrAyZXUiYbOm
	Q9kYbHtiadLWB+7GQCNMjZ568K7ElVQ1OnvUxQo0RvZgjFGSKKvQE7qjmbDnRHc1YuQPqyC76pTcK
	1lEzKlSQnwd6uxP3Fcv4VsH780uY2jlZ2vxm3saoJyqYNLRwnw/CtBm6KG2Ai9PhA8uTslvYhmsmw
	TJqAArq4fUuVR6bmM/a7elXJ9b4ObRh+EfuGfQ5fP9a71eZ513gjNwA3GorQjUkPvx8T/TM4LzRtm
	GoHGgjCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Co-0000000ArCi-1ghV;
	Thu, 17 Sep 2026 08:10:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x77Cm-0000000ArBk-0OuQ;
	Thu, 17 Sep 2026 08:10:53 +0000
Received: from [192.168.0.220] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 975FA324;
	Thu, 17 Sep 2026 10:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789632543;
	bh=/lueA+vcidEtOkFmFcGsSUec5x25wxqjlpXfsOGh7so=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJPg+/y3hJ+gpddZ2wRVVKBEnmuj7EzXMLzXnTKJBNYpPJUj3FIZHo0SyujnlmV4s
	 XZXUzt7dVgh8HkYwTKI0mF9ajI9ZhwLBaq6HhAF4opvyKgbw66PFeAksm2Fx6bEz7u
	 O89BY91DTQp6OijTlkUK+uiHA2su84OoXAr6ZKBQ=
Message-ID: <a6343116-618a-4616-a4e5-c04afc7d46da@ideasonboard.com>
Date: Thu, 17 Sep 2026 09:10:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: rkisp1-isp: Set correct data mode for YUV
 bypass
To: Isaac Scott <isaac.scott@ideasonboard.com>, linux-media@vger.kernel.org
Cc: dafna@fastmail.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
 <20260205103207.4020959-2-isaac.scott@ideasonboard.com>
Content-Language: en-GB
From: Alen Karnil <alen.karnil@ideasonboard.com>
Autocrypt: addr=alen.karnil@ideasonboard.com; keydata=
 xjMEafxhCxYJKwYBBAHaRw8BAQdAXswEEnvxYiHXb8Q8GsSAuaLuXqJFs3kmsMI7EWF9EuDN
 NUFsZW4gS2FybmlsIChXb3JrIElvQikgPGFsZW4ua2FybmlsQGlkZWFzb25ib2FyZC5jb20+
 wpkEExYKAEEWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCagGrrgIbAwUJBaOagAULCQgHAgIi
 AgYVCgkICwIEFgIDAQIeBwIXgAAKCRBRzoJ78NRPnkpDAP4kmtHsMfTtV6BC1z7GTb86BL2g
 9FC1EarGJDDzcafMGQEA6clsoXvRYjHPJexVebjmkI4bq1QM0X/L9Ffe0PfpdQbOOARp/GEL
 EgorBgEEAZdVAQUBAQdAsVoGZ4IK0EgJ8HU05PQKzK15jaCi/IEA/7Cw9ZzcBmwDAQgHwn4E
 GBYKACYWIQT0whyXpTyoVtApVAlRzoJ78NRPngUCafxhCwIbDAUJBaOagAAKCRBRzoJ78NRP
 nqYcAP0eh3LahCDsfNa8zsiK+8QzeujWPKhc5zDcIqrDI6xufwD+Mu9e202It54rNZb8UWEy
 V5OzTEy0JlsQfO6DYWIORwI=
In-Reply-To: <20260205103207.4020959-2-isaac.scott@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_011052_574285_B7EE3CFC 
X-CRM114-Status: GOOD (  20.51  )
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

Taking over from Isaac but have some points to discuss.

On 05/02/2026 10:32, Isaac Scott wrote:
> The rkisp1 features a 'bypass' mode for RAW and YUV formats. This
> disables all ISP blocks, and makes the rkisp1 display input data from
> the MIPI CSI receiver at the output, unmodified.
> 
> To determine whether we can activate bypass, we can detect whether both
> the source and sink formats are YUV. If they are, we must configure the
> ISP to expect a YUV input, interpreting H/VSYNC signals as data
> enable / disable.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
> 
> Changelog since v1:
> - Removed in_bypass flag
> - Renamed the patch to better represent the functionality of the patch
> 
> ---
>   drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2311672cedb1..21bfa0edbaf1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -240,7 +240,9 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>   		}
>   	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
>   		acq_mult = 2;
> -		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
> +		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
As Laurent states, this condition is always true, this will need to be 
reworked.
> +			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
Having tested this, DATA_MODE is correct, I am seeing a garbled image if 
using ITU601, definitely needs a comment if it goes against the 
documentation.

If we drop the earlier always true if statement, then the fix is to 
replace ITU601 selection with DATA_MODE, but there two paths that lead 
to ITU601 being selected, and I can only test one of them.

So the question is should both be replaced?
> +		} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
>   			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
>   		} else {
>   			if (mbus_type == V4L2_MBUS_BT656)

-- 
Thanks,
Alen Karnil


