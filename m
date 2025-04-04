Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8AAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7vYC1DmOY7g/IbhaQA2XCL8pgap2RluhVGOxgHTG9M=; b=AgvkJfifAIaI3AIEcCPDYtiGFH
	JjqrtfKO0wmVtB5xOs4rXcsxV4EjRhAeop4yqhv7cB6YPln9Sdr95Z9kLYYAqStFfISAfpGbivLMu
	r3tF7+OWLQoB8O+pAEbciNpdDieIhFFAuGiFiymS8VLfk4E7cz6G44nyxh/kq55mKIa8CCkB94mlu
	qfBQM7+0dEFk9051bz8wrPoVV95AeJC+TFBx7sZPwderGjb5YghL/zrdjxhDXZYUcb4OwWPSwlPCV
	sjAbAPXDWoeib67H8xsLbq/XKg4IaR7vSS33jlK7z2Np4KgmIB5P6TjYOcwFH5M+DN1JghOEBRnV8
	q8ELwShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0d6N-0000000BFWT-0Apw;
	Fri, 04 Apr 2025 09:12:39 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0d4Z-0000000BFLx-10fK;
	Fri, 04 Apr 2025 09:10:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1743757830; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lUShNtcKP1QxHgS4zTd/vp7ntLnSv7ce/K//cMKvdkE+oeS+qBHF7vuMBBWk8Uw4iK1EqD7l/fOn+KFpR9s4HREZ9mrFHyaq/TIjq9Aj24C1zjQunajzXJ3piXyyLNDAmfVjXd+paiG6lDNsIuoA6Anp73qbGEe8oqjA8yKvyPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743757830; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=V7vYC1DmOY7g/IbhaQA2XCL8pgap2RluhVGOxgHTG9M=; 
	b=laSlUDswAfoz779JiV1FURK9iKl0vfezQNSgAe3e5nTU+9mZW19jKnIPeU5NOsjljlV3e3u3uHj+W7MyrJR7HaY0MKwQ43/GanaCdVQM0t+OuzRiUim42ZSZ1NQAc9zZcIe3XoCpIMEzgaoOPc7SoulFJb+l5ZbJR3aCqBgiW38=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743757830;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=V7vYC1DmOY7g/IbhaQA2XCL8pgap2RluhVGOxgHTG9M=;
	b=E44qa2+1o1cOfxADZeHmQ/I6MSeEi+WlMmoO+Hbbt8vFwQdzCKSQatPq4tBP/hjx
	IrtF49UKs5kx/TU5k7GStPdlySyhxwxMOJoztqymr/CK3mVKRLQsCVWP5DeLojEdCoU
	TkYJhh6rYuPjnhxp1AcBHyg5g2q6GX47CiqA+qQk=
Received: by mx.zohomail.com with SMTPS id 1743757829476256.0475616658215;
	Fri, 4 Apr 2025 02:10:29 -0700 (PDT)
Message-ID: <133924c6-57ca-47ed-9e32-87b75b975f1c@collabora.com>
Date: Fri, 4 Apr 2025 11:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: verisilicon: Enable wide 4K in AV1 decoder
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20250403-hantro-av1-wuhd-v1-1-334629cb7f63@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250403-hantro-av1-wuhd-v1-1-334629cb7f63@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_021047_344369_85D33348 
X-CRM114-Status: GOOD (  12.23  )
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


Le 03/04/2025 à 21:07, Nicolas Dufresne a écrit :
> Tested on RK3588, this decoder is capable of handling WUHD, so bump the
> maximum width and height accordingly.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Thanks for the patch.

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   drivers/media/platform/verisilicon/rockchip_vpu_hw.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> index 964122e7c355934cd80eb442219f6ba51bba8b71..b64f0658f7f1e77b3efd960b35cd54dec4edf4ef 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
> @@ -85,10 +85,10 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
>   		.postprocessed = true,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
> @@ -99,10 +99,10 @@ static const struct hantro_fmt rockchip_vpu981_postproc_fmts[] = {
>   		.postprocessed = true,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
> @@ -318,10 +318,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
>   		.match_depth = true,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
> @@ -331,10 +331,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
>   		.match_depth = true,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
> @@ -344,10 +344,10 @@ static const struct hantro_fmt rockchip_vpu981_dec_fmts[] = {
>   		.max_depth = 2,
>   		.frmsize = {
>   			.min_width = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_width = FMT_UHD_WIDTH,
> +			.max_width = FMT_4K_WIDTH,
>   			.step_width = MB_DIM,
>   			.min_height = ROCKCHIP_VPU981_MIN_SIZE,
> -			.max_height = FMT_UHD_HEIGHT,
> +			.max_height = FMT_4K_HEIGHT,
>   			.step_height = MB_DIM,
>   		},
>   	},
>
> ---
> base-commit: f2151613e040973c868d28c8b00885dfab69eb75
> change-id: 20250403-hantro-av1-wuhd-11e2cf5be1a4
>
> Best regards,

