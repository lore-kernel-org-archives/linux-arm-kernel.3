Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7F7D64063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tUwRMCHHdqZVRtxZCk5aPJdbR5inXLEUzSQYIspWM0=; b=lJhdJ5gZHy+3oT5+U4krMnwMrl
	6cUJsqVlxdZROFkhhPrgoLCLHfW0aM7yf6TsoeApO2avzce9KdIrne47kYwoP8MKOgQC/w2L4LJ+r
	Bk6oxtKsq914ST+ypT4k+3qeeiKsoTfzNk0SlVNEizmDhiccRk4qvnrDqm/8qFzp7bUPwvcY+epCA
	5X+A05jSPwIKciBY5rHTbaLNpmoXNO25LyEY3GumaSsal/1DgByauL2lO/j4OyZlUO2r/QkNwXlk4
	r/AfsW6o/2WnPSdAYyNtenPgrih2OcMhmgGx0llKTl02XwGInZ9zfQDvdKTZrYe7ZnVDT1LF6E03j
	fm7jjipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ru2-0000000BDSl-3ei0;
	Fri, 08 Nov 2024 16:32:06 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QzX-0000000B2gl-3ycJ;
	Fri, 08 Nov 2024 15:33:45 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-539fb49c64aso3584128e87.0;
        Fri, 08 Nov 2024 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731080021; x=1731684821; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3tUwRMCHHdqZVRtxZCk5aPJdbR5inXLEUzSQYIspWM0=;
        b=HP0fd5MzBUmr7XDEmwuKUGWPxW4OnlKPL29C+IILN8VhKl1uwpeFaA0GtT5gfOkFz2
         mrtTBd+O5pymnua/rDOGm8Nu5FbBwnGQQrOkWfJ7yADVAaX523COkF0Nke+50pS4bdpo
         aAeNPSixjYVpQyj3v0soJoY5DNkADtGLhcJRsR/j+qbPRS1DAGMta9n3cETZFYMweVyc
         hMPqMsTvI6sn/DXcjRdehNNGIxwrrxIcnMy/aMz8/ZgbJneoxZ7H78elIpRTwBvozGhK
         5PjAu0Y5LsNyGmGc8rOFD3RdN6LQqz3ukRNyWS1TCwgTuRRVtiLiLxRC9Qkf3t3gSj9V
         fVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731080021; x=1731684821;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tUwRMCHHdqZVRtxZCk5aPJdbR5inXLEUzSQYIspWM0=;
        b=e3bjsvScx3YSTZbD25PX3qjpZutixPciu/2oDvosDjA+xVO1TW7cK0c9vvpvTqgwOS
         M/6/9qxK/kZw6SidZN5CL/s6t5YzQVpBraw6eg74oZ85sBJ+KVXfKXlPxFfDIfA76Ri2
         rhNepVliRIaSdcMyrbghfod5+u+onh0QZbF7G8OG0nF/F9G7G8kTtGKA2oXKgDItn57k
         MxLynBN5qmDiDLvR1tW1vclOowNdMlBzMARwrzfqZUHQffoWY9RneyCE0FugjyyLYuoE
         0hPRRxdtNa1h2i+0My5Rm2ZQA05AodqyvZR1MyFmcqa+1qZtOtoqskFCVHsvo/h1zrQS
         nAhw==
X-Forwarded-Encrypted: i=1; AJvYcCWOR2n9uWPdcysvvPwStIBWAzW3qT6mH/N4uXFPp0p2UmbvNIkananp8robJDo/k1gGO38u/xBsssYfK3JLbs30@lists.infradead.org, AJvYcCWr1Kxpu17cNRZ1Q5Dxuwn+8k72R612X5GggrGqGb0uYjFY1Rmfh728nH81tOrFOQTovykWbGLODYZqV1ykxOU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMbDI+LIeRG7DOAK0D69/6fi8jTK+weAG4ofG4pY3FJRI6Pp6i
	P1vMpsrH0+VxVpK28dlhrW/3N5/VRbTFlx5p+r+Lfe2VNmRxR2A8
X-Google-Smtp-Source: AGHT+IH6QlPf0c6ztccp5zye1I+rJwIhnxrhIVUrE/U2zUAMlS2cVf9rlvp4D1Xd2iX5jOQ4HGOkBw==
X-Received: by 2002:a05:6512:3084:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53d862f84cdmr2869650e87.57.1731080020655;
        Fri, 08 Nov 2024 07:33:40 -0800 (PST)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d82678474sm662970e87.42.2024.11.08.07.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 07:33:40 -0800 (PST)
Date: Fri, 8 Nov 2024 18:33:37 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v11 5/7] i2c: of-prober: Add GPIO support to simple
 helpers
Message-ID: <Zy4vUQj26-rkXrgk@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-6-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106093335.1582205-6-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_073344_010341_2CABF19B 
X-CRM114-Status: GOOD (  15.29  )
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

On 24-11-06 17:33, Chen-Yu Tsai wrote:
> Add GPIO support to the simple helpers for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> Regulator supplies were handled in the previous patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This supports at most one GPIO pin. The user must specify the GPIO name,
> the polarity, and the amount of time to wait after the GPIO is toggled.
> Devices with more than one GPIO pin likely require specific power
> sequencing beyond what generic code can easily support.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> ---
> Changes since v10:
> - Added include of linux/types.h for |bool|

Tested-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

Patches 1-5 from this patchset were successfully tested with hardware
prober for i2c magnetometer on PinePhone on next-20241107. [1]

1. https://github.com/AndreySV/linux-stable/commits/in-kernel-i2c-hwprober-magnetometer/

-- 
Best regards,
Andrey Skvortsov

