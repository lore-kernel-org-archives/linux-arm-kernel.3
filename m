Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB82AC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQztoV93kUusu3+6iPjezagXhoWGmz6/B4T2KCFeXKk=; b=Octs1kJ+sU7g51wuPKsDxcOr9H
	4O75F0mSNip6KzJbZ3IOpOupNaAcm461WEpCw8IuSYVfBHslgnyADAuzELRXVORyRlqGVwYYErFWD
	DT0qP9YGbBOKaG0Y7rqUMrWRrkdv/9sRI2qzrbrUSMvB4XEmYW/lWOCxReLvolbsRNg0P85SyErZc
	DVuJ2b0Khp7S+s3TSSr7GvDYPiQkI1gQFN8FDbIuszQsXTcA+1/Vn9bt4GfNnfLGUZpFE4y+JRVg1
	qWfX9uVAiE5kh421r0Nimw/szGlC9Lzu29W1itxcG5+6nNDouTMY9KadvsdShan0HSlvxgdeOxxIQ
	qEgjjaxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27ih-0000000HQpa-3TEh;
	Thu, 03 Sep 2026 13:43:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x27ie-0000000HQoC-39Hy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 13:43:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so2851395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788442987; x=1789047787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DQztoV93kUusu3+6iPjezagXhoWGmz6/B4T2KCFeXKk=;
        b=T8DjkO4pjfn6OZfCYv5BwJTDQi1J8rEefTu/fl0994twqVhzD2gRCN5S6kQkGOiB3a
         KTjhsmRx45+qfGxueq35Jc2zkgIK3jypQ12IuVGRfwv0f+TISip9AS/kFDnoRQKQ6Z6A
         ONUg3yTZh6+2fPe3M+aM+np9XGbKTd4tjA1rKBy6OHlVMl/FTEaOsDaLdxhzNrltUnMn
         qhVz/NqVOVPWV78RS7KNIYtkz6hqCVRkoQIWRAqXUgUXWPw/LPmofPf97vIUZG97nUGo
         WJsn1LxkS0HLsRHhSMKojtLWT0wpPun5T2QhrOkdjxaHgnKya9Bs6seJJTLOz6fVEecn
         3e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788442987; x=1789047787;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DQztoV93kUusu3+6iPjezagXhoWGmz6/B4T2KCFeXKk=;
        b=ls2T2zKB/WLgI9rjrn6kk/CmYvRxVhwZOmiCHloPSSCvG+1+1uAcUmnvkgqyhtLUGI
         GocOLlk6HaQm1VxpKnrZ2t7IxLVsi4zcI5WvWRhmXWncCNPyoGvsHs/P2CrTiJ7FoGyn
         nZEnPlJePa7JM3ckTfijEkA8o7Q0BJN1QoFg18Ufv7aFJnpBnGPOm2DQBkdft4QWhv0S
         G31MqTXdAYOyMhq4p8PDHIOkcfVdzep1kIuecM8NJktCMm5VXvGNNrkkfBfKVRFQmhZs
         1g5dLhYucPxwNAm4for21nbsMpOQxk1HO7iVc33Lfpl5f2FQRG2ObVec689FKYoxQwtm
         UrWA==
X-Forwarded-Encrypted: i=1; AKwUvBw7KeBYUf16FyZeWfMdENuxjftRnYvThWs/eXbZ4/ofzD1D1B7pLTz77eP2T1AGhSxhdCH5FO3OQsK4/SbshWNb@lists.infradead.org
X-Gm-Message-State: AFuF++mWtxympqKSJ10phs6SeyEOJkJzVHTUQU2trMw0LY40TjHG2PvW
	5j7YhE8uMV+XTOKiSxHAkNN40afAZWCKOFthCz/q4Z+T20CFqTCvordBNywltxjqsrE=
X-Gm-Gg: AYBFou3Cmn1D36aXNy01A2TZnr7TKQC8ORIcdDr9ihJU5O3Ad6ybiBGY53xO0WB2x7h
	J5p6/iuLKh/7yOL2ZPuD1B5kvtYqiHRVq/bdlF8K+bTG+hUPyR+7krYpCtSEmmVzKYAr/FpXsYR
	raQqGCbUPU8uV4ZppG2Ohphim6xlR3KGJc+ZrWFtG2Xf4QB0bx/1XihfSjSpZdZugShAMLR8R5b
	f6HnBPZLvHX5SgQL0slPtLVk2O++sjaNUJfgjUDKb3MkRbRp3MQPSjSkWiQ4BEn5X+HUraC0g/b
	HCMLcyE/Etoq5cWT/gLWr3fWEhS78rQVJzCtHGm+NYLndtoQGINFLHlWtqf/QgjxVCoA/3FnA8f
	HKGvbue7kBbArErigHgK350HRm7KAVPS/AHmLpzfs+zWWGpiI7pmtNPjrO+eBCdptMx2gufG15o
	64nL9cp0/gLufaStDCEgxL1Q7ZFoOOacKriBTLhpKobDbV3R4kU2F0paLZRQ==
X-Received: by 2002:a05:600c:e556:10b0:49c:db20:da13 with SMTP id 5b1f17b1804b1-49cf5baa013mr808885e9.5.1788442986610;
        Thu, 03 Sep 2026 06:43:06 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee3b0af8sm74408515e9.0.2026.09.03.06.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:43:05 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 3 Sep 2026 15:46:45 +0200
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 2/3] arm64: dts: broadcom: bcm2712: Add thermal monitor
Message-ID: <apl6RddLcPz8Q2-O@apocalypse>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-3-pbrobinson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802145109.728793-3-pbrobinson@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_064309_303318_8112B26C 
X-CRM114-Status: GOOD (  19.50  )
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

Hi Peter,

On 15:50 Sun 02 Aug     , Peter Robinson wrote:
> The thermal sensors on the bcm2712 (rpi5) are the same
> infrastructure as on the bcm2711 (rpi4) so add those
> details so we can get thermal monitoring on the device
> as it can get quite hot.
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 32 +++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index ae1fc9d728c00..c73ed9e066662 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -508,6 +508,18 @@ hdmi1: hdmi@7c706400 {
>  			ddc = <&ddc1>;
>  			status = "disabled";
>  		};
> +
> +		avs_monitor: avs-monitor@7d542000 {
> +			compatible = "brcm,bcm2711-avs-monitor",
> +						"syscon", "simple-mfd";
> +			reg = <0x7d542000 0xf00>;
> +			status = "okay";
> +
> +			thermal: thermal {
> +				compatible = "brcm,bcm2711-thermal";
> +				#thermal-sensor-cells = <0>;
> +			};
> +		};
>  	};
>  
>  	axi: axi {
> @@ -724,4 +736,24 @@ hvs: hvs@107c580000 {
>  		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
>  		status = "disabled";
>  	};
> +
> +	thermal-zones {
> +		cpu_thermal: cpu-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <1000>;
> +			coefficients = <(-550) 450000>;
> +			thermal-sensors = <&thermal>;
> +
> +			thermal_trips: trips {
> +				cpu_crit: cpu-crit {
> +					temperature	= <110000>;
> +					hysteresis	= <0>;
> +					type		= "critical";
> +				};
> +			};
> +
> +			cooling_maps: cooling-maps {
> +			};
> +		};
> +	};
>  };
> -- 
> 2.55.0
>

Doesn't seem to apply cleanly on v7.3-rc1, could you please rebase?

Many thanks,
Andrea 

