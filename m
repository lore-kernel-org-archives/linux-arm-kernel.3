Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EA5D38FE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mbwklEjWYL4Xzg5PY/TErJlPhWWb5RgX+QJ3DzsQWOY=; b=fZbcSAcsGnQZLMyrfl/f2rMZRN
	hQC1AP19+t7tYVJl2KJBdkN8pprZfr5DjOpfgrau9ILHyEtiXQh4SqtkzhL8FLlEXuKrCsOWZlLWJ
	Wn8ajtFDIDATyWjsDzVmjngZVpP22DasYxLuXPP81XWkm5QEjlcubqq0CUfukxN4MeD8USnNMlFc0
	BSnxM+BTNhz24P4048IVrANKCAkJjo6HFCJtAiEV5YR3l5eLG6EARz3dPxSzYOOXTOllpckoQ1KtD
	Afy6VKretbXhTI0WAHxOZoYjlGfxCLUZ0aUVBg0MpBZhYxd3vHH9/E3lU6SRgpmTuKE4FToIuJinC
	D140mVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3TW-00000009sYu-2lSk;
	Wed, 14 Jan 2026 16:12:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3TU-00000009sY4-0F5u;
	Wed, 14 Jan 2026 16:12:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 495F81515;
	Wed, 14 Jan 2026 08:11:50 -0800 (PST)
Received: from [10.57.10.71] (unknown [10.57.10.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 503BF3F632;
	Wed, 14 Jan 2026 08:11:55 -0800 (PST)
Message-ID: <091e1868-1471-490f-b464-40060f2c53e6@arm.com>
Date: Wed, 14 Jan 2026 16:11:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/panfrost: Add Amlogic Meson S4 integration quirk
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, adrian.larumbe@collabora.com,
 boris.brezillon@collabora.com, robh@kernel.org
References: <20260110200426.1461575-1-martin.blumenstingl@googlemail.com>
 <20260110200426.1461575-3-martin.blumenstingl@googlemail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260110200426.1461575-3-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_081200_157497_B9176C25 
X-CRM114-Status: GOOD (  10.79  )
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

On 10/01/2026 20:04, Martin Blumenstingl wrote:
> The Mali G31-GPU on Amlogic Meson S4 SoCs requires the same quirk as
> previous SoC generations. Wire up that quirk by matching the Meson S4
> compatible string with the existing Amlogic SoC data.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 7d8c7c337606..431470af0f36 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -1056,6 +1056,8 @@ static const struct of_device_id dt_match[] = {
>  	  .data = &amlogic_data, },
>  	{ .compatible = "amlogic,meson-g12a-mali",
>  	  .data = &amlogic_data, },
> +	{ .compatible = "amlogic,meson-s4-mali",
> +	  .data = &amlogic_data, },
>  	{ .compatible = "arm,mali-t604", .data = &default_data, },
>  	{ .compatible = "arm,mali-t624", .data = &default_data, },
>  	{ .compatible = "arm,mali-t628", .data = &default_data, },


