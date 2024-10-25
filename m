Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94605D0C61F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XR/4Fvu0tMyoCCtOc6mB1xqHO3YtOWoM5ClealtuxgM=; b=GvdmMsYl1AyoqsuPcvEopYiZ1/
	6hDFJjF59E8fg1i1qWdC0bCL3TOs8GriOLXFGY/4DERDxkutOte1hBYu3NyfEw6xcniOCQRlK1qiK
	EnACTjgvurdoSHo0DCQ8COVMbAnmNEAEZTkKp6BIznuoawqsGXGNhlYtz8DA+jd1jAQqpVo0cZS5h
	IeOzVGGtRv/KWrfuTfYhBTIWf0m3P/TO0cLHKz/bhDpJvKVB+Tc7IBdYUYPCHmAXDvhpxqq9P7E4A
	S63OVogKGc0lk3qY66vRmGRiDpiJw8FYc+w+iQmVf5pNqlzcRqvv2b6vG2YPY1PtBTO4P5uQgEWDF
	KzGWflDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4M0Y-00000004BIQ-1AVA;
	Fri, 25 Oct 2024 15:13:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LfV-000000045cS-1t7B
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 14:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XR/4Fvu0tMyoCCtOc6mB1xqHO3YtOWoM5ClealtuxgM=; b=Izcc9b7944FPHGxHuXDvXrnxj4
	VDnyJ2jrVBI9k93bV6Xk9SP01H+R0syOqp+FEBSimZd32QlGu3tgKYN51ZrSC9OIM3U0ZhvgXE03Q
	7z7X5nDh2BtT54g8vngiwMhXgf8yOEp97UKd8MYjI2I4/DNvP1wr7BTl08j9Ag+oheJiJGlhTTe+t
	mJfeZ3N/QeXv2/rgaxGeI2Y6Ktc52DIbk4otB2rgA512q79S50qjhh9HRHEuz+NeKfFap6fbBEoXj
	OcQbfqKV4xhzekCMpmUdXo1v+9Z8tH4yo8HsJNe/WtiU7VcwTxj5h7mGmBNcmw0GswXxOk1qVz9On
	9A3CqRvw==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LfS-00000008wmj-1s0u
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 14:52:00 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so3143273a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729867915; x=1730472715; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XR/4Fvu0tMyoCCtOc6mB1xqHO3YtOWoM5ClealtuxgM=;
        b=b2RonpxwZMV2aCc6M+JGEFqF5Kf14mwouTvLcTCDUnMHj9KGYViUle+40gYa89gEK7
         ILaT0NAlArM1Zp3CV9BRtFpmZE4uP9Lt436unznIVcGQOm2tEzrdPk7hX/ggMRAz2hmE
         j/xD+SZWVivMc3mcFfAg6Soi9iQKOuALedVeoYqs6cBS53GfaHmpUhV2oIFv7Fvs3i3a
         WpQ+odHI3a/0r5itaBcqrYUUCdti7ujzKy3VZKSu4kRzx4L5BwipUE7J7Naz5Oi+jIzD
         n17JAkl8GHxECKWf+gmuviQw5XDHHdeZclsQLvyeMpRFnTYLvwJ+725Uq8/QXFvsTOOi
         uOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867915; x=1730472715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XR/4Fvu0tMyoCCtOc6mB1xqHO3YtOWoM5ClealtuxgM=;
        b=iKDVH/fhvc2+4JjJIYGy1YsCGWIpOn93sIPj98SVjvrJN+XBXephInEY4rAx4eYRWI
         tNREOy6re8fJM5Qt2SGCXuq0VSMI0uDo/yGGoEd7uYzCLF4BA2SQotWI6JPlIxMsd/Q/
         AM0dabXtef5j1hqiuHmZSJWuWxqHWEqsZ1PWg1rnTPxcwlEwhh6/oFzXlhc327HxByia
         44XoVhrhLEF4UdVKzABke3uApzCKGfofCj9ekmA8wvqWSjkQY8ApwlCIypXYusn0vMPZ
         Sadckf6y7dUaY2CgMKjY6QPPIwoEOItzvUpShdvsh41EOR+wy/nJ46aje5GFHhd3T3bN
         lYRw==
X-Forwarded-Encrypted: i=1; AJvYcCUcAUE9dnqso2JdMJ/DwM8EiCQtdeSWwp+QClzfDHV+rtoe2r5FT6jt65xx1W8jHQvmA+VGDIQyOWzGMzigpxX/@lists.infradead.org
X-Gm-Message-State: AOJu0YxpS/iO5JkdLq3Ut8foo0d2Af0uaz5gLc74BuzLQp9SKZ2uzzJ7
	Od2vCLTNONZXTPOohh5muSQr9iWVQYJwv+zE6buqPF/mV4D16gy4ccod9+wZHIgl8gRY8eagzyG
	PR4Leqa9lnVaSxiIYsFGlX1WTa0xZwfTdM0nbQw==
X-Google-Smtp-Source: AGHT+IER6oLuLAmMqy0L4qN7TusuZBghOustjiSV8015jNjOqosSq06NJ/Zu1YsQk+kV8Qw7CqO4h9Ex1wfPvyXxJpM=
X-Received: by 2002:a05:6402:1ed6:b0:5ca:18bc:8358 with SMTP id
 4fb4d7f45d1cf-5cb8b264348mr8002531a12.24.1729867915170; Fri, 25 Oct 2024
 07:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241012143826.7690-1-linux@fw-web.de>
In-Reply-To: <20241012143826.7690-1-linux@fw-web.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Oct 2024 16:51:16 +0200
Message-ID: <CAPDyKFp192dy_OXXYk5zqJQPUvrTwkQYPaMoFVsHHQiO74U1eg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add mmc support for mt7988
To: Frank Wunderlich <linux@fw-web.de>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, daniel@makrotopia.org, john@phrozen.org, 
	eladwf@gmail.com, ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_155158_644454_70AFFF27 
X-CRM114-Status: GOOD (  13.95  )
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

On Sat, 12 Oct 2024 at 16:38, Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> Add MMC-Support for MT798 SoC
>
> changes in v4:
> - drop minitems because of dt_binding_check error
> - explain mt7988 compatible with mt7986 platform data in commit description
> changes in v3:
> - use mt7986 platform-data with the mt7988 compatible

Applied for next, thanks!

Kind regards
Uffe


>
> changes in v2:
> - corrected minItems to require all 4 clocks
>
>
> Frank Wunderlich (2):
>   dt-bindings: mmc: mtk-sd: Add mt7988 SoC
>   mmc: mtk-sd: add support for mt7988
>
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 22 +++++++++++++++++++
>  drivers/mmc/host/mtk-sd.c                     |  1 +
>  2 files changed, 23 insertions(+)
>
> --
> 2.43.0
>

