Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1381ACCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 20:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0bxSC9qVdAO+PHu6prllXc1vwxGvmh0YPQ8osQBxSA=; b=YbyVyNwfVzCnBt+3OtC8sBxOTM
	ULAyddHsQRckk4Epe7Xj53dGTtFR/rmpzVTHdLZcB0fJ9i/0JYHiei/D00J5RMthm0XNQcBfPchuw
	MhUMNRVVpH/mthLDWTRGH0QwNcPKHesFJ+8q5pyLv0hecxQGVsUCN2H773k+FetXhq2Xhc3oCptQn
	xW2X+5fMaIRlRyq39CabTH95xd+AD9qbpixNRCU1Cv2kUUyCaoEvzay94EfTDCvV3jQG/BnZGI/tg
	2qnBzWipUisAjWKJU0nc8ihhDvQeXv5kp+ExGak3UD9Kn2lXZLsE3WQef8HuKvd5ve2OcMzUQuD7l
	tzzRPL+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wz0-000000073Ec-0FRT;
	Thu, 09 Oct 2025 20:11:26 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6wyv-000000073Cz-3hTf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 20:11:23 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3fa528f127fso1016615f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 13:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760040680; x=1760645480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I0bxSC9qVdAO+PHu6prllXc1vwxGvmh0YPQ8osQBxSA=;
        b=LOCTqWDrTC1qEfX6frXwIeB/QRiTSd66J/9J4yFfh3qQlw51v7yjUgqm9Yt4AN8ukJ
         EIWWSXDH8cpSAyC8659XZ7mUo/kdUNxuTrRqVFbj/vot5SEHzLy7XR3jz1eJp4uVKgyh
         UYMvb4gFr5sJN326BMJbslaMxzj93no/OKu7bfD/m1Fi2IwZpMEhIpcESA8Fx96gP6VV
         wvp1wH8asoJXbR++FZy8s9bv7zE2fjemN2rF5IXSAh+d7qcxEqHQJwMgbW8Vvnhqb9jj
         f8uc+7hDKDZArEZCJ01bSXXr3h1gXEDOD3pga/MppGN+8cIrTR19BT/fPnyq+E/gbZZ5
         WwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760040680; x=1760645480;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0bxSC9qVdAO+PHu6prllXc1vwxGvmh0YPQ8osQBxSA=;
        b=gcV7/ZaMQJ3VfdZIHvK69N0gyku3s4+pIzQUZfpv7OrZdWDZ9T+7bb9MTYzEgBboEj
         NvUqwGzdkD7pw4gBELyLMY8EojB3E2a+KAcoPJscGHZ2CK9/qB9SMYyY+FOAHy2ODMWX
         WdZjHEqkqDs5o2bszNbF2O5gUxZOLXzCQDqWei9jbbvVZN8c1exps0pIzCi0X9CVqIB1
         nmTduIEIU341vzVdACNPAnTq2Bm+WakSR5/To8xwYhTHTFFZ64jq32BCkxErGddnX+wo
         hrtC0+jwQZrRUVB6/6Ln2OuWvZtq7T7QFuGLLpLyEhu784MkGd8jXFiO1CddtYJFn0dx
         8o8A==
X-Forwarded-Encrypted: i=1; AJvYcCWI0+utyu8DPG0Q2HAxHDClLKxNgPymUzKxavnHN9S2T3GjpjMPBWqzyB038qihVzS03X3iCW7ecS6EHIotUL0P@lists.infradead.org
X-Gm-Message-State: AOJu0YzsgDIDopf1BrXMD0n6+eNz/rkWZWUu3lc0iWdiP6VG/TqZWhvn
	XofLTSROobC5Gv/XT/4VHWmyU5fsleypyvHe+FlQ+fYIshOoRhwp4W3iEoKnm4gAbl0=
X-Gm-Gg: ASbGncs+qbsBfgX2qTTZoErsvW8QbVGHsNT8+993ElaGqhn3/WnkSw9V6+MEIFPStU6
	TaXStdGfCzDWKIJgzDOQn3+O1Cyu03LS3Uizo+qNN1Ad1lReEPtIPkc5LFSQv675lshJJDPhUPC
	HFfeQbxiG+tDB9TAIx4iG6PkWTtl8ggjmFPkBdIU02xqYOSHWS1lmkJmpewHz9x0Cm8P9I2RqMC
	WV1xZ1bBPOU44D+6Nc7OJaenbm2Xw0A4nzTZ0hTI4kZli8kOBzKlRfi6awVY4lPQFOfEdYZPtFm
	ECOTVdzZ6O5FwTwQ0HpJyLqq/U4b30nWqIxYs3E01cHnSKTSn4MS8izUoiI5IAXskcI7O/ZuTZw
	MEIvpY5dNvJBM2NF1W1bIgUNvU/yKHsFwFVCUYBlTguj/QA5OUl894XI3Nw==
X-Google-Smtp-Source: AGHT+IFuLsi4wmsunBeslCI8cKWeFy4ZUEWU/gsK5+phruyOaGgG2/phEeGUm4ke9yIArdmP/BdHLA==
X-Received: by 2002:a5d:5f96:0:b0:3ec:42f9:952b with SMTP id ffacd0b85a97d-42666a9e191mr6428067f8f.4.1760040679687;
        Thu, 09 Oct 2025 13:11:19 -0700 (PDT)
Received: from [192.168.0.36] ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf70fsm563238f8f.27.2025.10.09.13.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 13:11:19 -0700 (PDT)
Message-ID: <7b861236-8317-4435-8582-bd97f545e322@linaro.org>
Date: Thu, 9 Oct 2025 23:11:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] media: microchip-isc: Color correction and
 histogram stats
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: Chas Williams <3chas3@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Balakrishnan Sambath <balakrishnan.s@microchip.com>,
 Hans Verkuil <hverkuil@kernel.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Daniel Scally <dan.scally+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
From: Eugen Hristev <eugen.hristev@linaro.org>
Content-Language: en-US
In-Reply-To: <20251009155251.102472-1-balamanikandan.gunasundar@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_131121_947488_83D52E5F 
X-CRM114-Status: GOOD (  16.05  )
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

Hi Bala,

On 10/9/25 18:52, Balamanikandan Gunasundar wrote:
> Hi,
> 
> This patch series has a set of enhancements to the Microchip Image Sensor
> Controller driver. The objective is to expand its image processing
> capabilities and to improve the colors.
> 
> This series also introduces a new stats driver that exposes the histogram
> data to userspace via v4l2 controls. This allows applications such as
> libcamera to access real time image statistics for advanced image
> processing like automatic exposure, white balance adjustments etc.
> 
> Balakrishnan Sambath (11):
>   media: microchip-isc: Enable GDC and CBC module flags for RGB formats
>   media: microchip-isc: Improve histogram calculation with outlier
>     rejection
>   media: microchip-isc: Use channel averages for Grey World AWB
>   media: microchip-isc: Add range based black level correction
>   media: platform: microchip: Extend gamma table and control range
>   media: platform: microchip: Add new histogram submodule
>   media: microchip-isc: Register and unregister statistics device
>   media: microchip-isc: Always enable histogram for all RAW formats
>   media: microchip-isc: fix histogram state initialization order
>   media: microchip-isc: decouple histogram cycling from AWB mode
>   media: microchip-isc: enable userspace histogram statistics export
> 
> Balamanikandan Gunasundar (7):
>   media: platform: microchip: set maximum resolution for sam9x7
>   media: platform: microchip: Include DPC modules flags in pipeline
>   media: microchip-isc: expose hue and saturation as v4l2 controls
>   media: microchip-isc: Rename CBC to CBHS
>   media: microchip-isc: Store histogram data of all channels
>   media: videodev2.h, v4l2-ioctl: Add microchip statistics format
>   media: microchip-isc: expose color correction registers as v4l2
>     controls
> 
>  drivers/media/platform/microchip/Kconfig      |   2 +
>  drivers/media/platform/microchip/Makefile     |   2 +-
>  .../platform/microchip/microchip-isc-base.c   | 373 ++++++++++--
>  .../platform/microchip/microchip-isc-regs.h   |   3 +
>  .../platform/microchip/microchip-isc-stats.c  | 549 ++++++++++++++++++
>  .../media/platform/microchip/microchip-isc.h  |  44 +-
>  .../microchip/microchip-sama5d2-isc.c         |   2 +-
>  .../microchip/microchip-sama7g5-isc.c         |  73 ++-
>  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
>  include/linux/atmel-isc-media.h               |  13 +
>  include/uapi/linux/videodev2.h                |   3 +
>  11 files changed, 1001 insertions(+), 64 deletions(-)
>  create mode 100644 drivers/media/platform/microchip/microchip-isc-stats.c
> 

This looks interesting.
I would like to see the compliance tool output for more platforms
(sama7g5, sama5d2, and the new sam9x7), also the media-ctl -p , to see
the topology with your new driver.

Thanks,
Eugen

