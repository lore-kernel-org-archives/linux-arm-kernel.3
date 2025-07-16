Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9B2C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1WLlTjW19FslTaCwhT5zGrQ10SG2D6EnCZ8yjnDcW8=; b=bzR+X/hbxYp45+TWkl069xSAxB
	SzY4voJrv+2lm2aDYRbD6DuxBAWsBtR2DCQIvsbtSym5Qu3Wc02QQWp3ae/WXlhJ/EpMbCQlzaM3M
	mXfwSnNiwhlNpLlMfFJsStmMh5eV7m19fAUa5s3lhWT3hZWFKKEFypEnrxvb63vGn11tpl3X3hhA1
	3G+Xthrl78T9pCom5oxsB1OsBf7EkJ6SacWvI5lwQmeY1iZYa/wVEbq32YPuy0YnYgmji/mbBRKqm
	sXTkyJ5zH5dpxZS99VRQ4LLiPj2pR6sP+h9tNUTvKTnIpKtrwQFB4A4wHFC+ESPdSehC1I+wARZNk
	pc27Bpyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9Vp-00000008geq-0ttD;
	Wed, 16 Jul 2025 21:18:01 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8Pm-00000008Zid-2bo1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 20:07:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45629703011so1731005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 13:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752696461; x=1753301261; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w1WLlTjW19FslTaCwhT5zGrQ10SG2D6EnCZ8yjnDcW8=;
        b=coaouAKWX0/y/urEDfwGI4hDWRx+aAc+v+uqRWzgYy2NWdF/XsJfWZ7eld0ccLiD7T
         xk5DcokyOvcEXYODcehkat1O1NFTJwasABSBrVnchCPrl8OcYevXFJpekF84Q7i4jG3u
         2SSZICKcPM5+LlpqE5QeEm3qpDkEEZNgPnOXMX3CIiS360Mpi2pJsF4blqu6fg29M8MF
         2MHKl4Ov0h2bALwVBYPPxytacjP1hj1u3LY6FnN/kaTkhyQ1RMSYA3MU8TXovjb/VvU0
         uZxhS+X9A43ACaMjqe1yWrnqoImMcgoQEg+hqU2C/BMz/KOqU7RYmUFpqP1iT+TLb2r1
         7LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696461; x=1753301261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w1WLlTjW19FslTaCwhT5zGrQ10SG2D6EnCZ8yjnDcW8=;
        b=q33LcPCYAbcsxoWcfXUXRCniEQWEdpSbQFmAuqO0eHChY/MO9xuNVo1C08jsNzP5kU
         mbKb2zJyA1r0wu6yMO2wi6lkEq0/GtOHZhykiOQP4SNrUQbO9zfP5FsNUZdOwiyjpXuA
         J3efoOrroLHT85y7rM5eGjIdMNoGWsR0lHh8Yqrfh1n7gKWoN2BPbthmWBqO5JTGDDjn
         6aw03gEVBwuWbwH55LvvPg25JVi0EKlbONYztdvnLrVUE7AL+WDAmVgmsHt0mH0ojbsC
         VArrOSCb3nOLKfFfVL9v9NUOY2rNWiGg+kIGQBgMn/Q2yhHCCAqHNKP5jVp90YyoBGuC
         2pNA==
X-Forwarded-Encrypted: i=1; AJvYcCVqW1uEJpcWvNOWTaigYW98KJTw7SeBpAW4S5/JJZXNVWiLpWNEr1D6MMs+6DZoJRqrYYBB+WenTLi0Y1yRUIYI@lists.infradead.org
X-Gm-Message-State: AOJu0YwzikQBhyG0Ekkzd8wWhrn7v/TQy6NptD2hgOKHT8AWmO0TWnKU
	wRpAbOOTqcPu5IR06ZcobMocogH3wDjeEy7dWaaWJxMdYzJCh9LJnuI+WJByvNJ624Y=
X-Gm-Gg: ASbGnctUIiSr7Gq1b1UEV/42eywN7OHR5e1RBgQaiwH2mqJbz8z8V0SUDaODAEksgeO
	iVJENOXiIm8081k47fns/3Jrg2l0712Mt2JWvvJ+M022kVDaTdxg7xm8alpT+WJLPzDCq2sziBl
	D6WSqVJpXivXIoRZLFkoUMYDeViLgb4r58J///YuRTjXyFiqQFIAeL+48HKv51gEFpxqIy/VM6H
	7mTQkYO8uV0PUzg8xz8ivPMHufuSPb5rELSJa9QeANSRmMCPKcMFO2EoKKC1nTRZPFlUXwZdNGD
	C2ZBa/5JW3ix3fcJdmk6SGtFflarCyr0mHg00KOoQV5AfSVIiHNXjjS7xS+RSg/Us+A3UtQ3Fnq
	YCpwTkRspQmyqIybD6/J2JVnMYdo2vqmmN/zK1hwad4I/t9Tf94+qfcZe86VJ
X-Google-Smtp-Source: AGHT+IHT3o4sXi1laaCHvSW/aSr0v5yQgUvC+MexriUEjp2oVZFYKTPhi2Nt0Gx2Dn49BxLlEmtWJg==
X-Received: by 2002:a05:600c:5187:b0:456:24aa:9586 with SMTP id 5b1f17b1804b1-4562e2749bamr35356605e9.21.1752696460699;
        Wed, 16 Jul 2025 13:07:40 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8bd1647sm18630864f8f.1.2025.07.16.13.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 13:07:40 -0700 (PDT)
Date: Wed, 16 Jul 2025 22:07:38 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
	Ye Zhang <ye.zhang@rock-chips.com>, devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
	kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/7] RK3576 thermal sensor support, including OTP trim
 adjustments
Message-ID: <aHgGiojM3nnNg8Bk@mai.linaro.org>
References: <20250425-rk3576-tsadc-upstream-v5-0-0c840b99c30e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425-rk3576-tsadc-upstream-v5-0-0c840b99c30e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_130742_683529_74ED5AB2 
X-CRM114-Status: GOOD (  28.03  )
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

On Fri, Apr 25, 2025 at 09:34:34PM +0200, Nicolas Frattaroli wrote:
> This series adds support for the RK3576's thermal sensor.
> 
> The sensor has six channels, providing measurements for the package
> temperature, the temperature of the big cores, the temperature of the
> little cores, and the GPU, NPU and DDR controller.
> 
> In addition to adding support for the sensor itself, the series also
> adds support for reading thermal trim values out of the device tree.
> Most of this functionality is not specific to this SoC, but needed to be
> implemented to make the sensors a little more accurate in order to
> investigate whether the TRM swapped GPU and DDR or downstream swapped
> GPU and DDR in terms of channel IDs, as downstream disagrees with what's
> in the TRM, and the difference is so small and hard to pin down with
> testing that the constant offset between the two sensors was a little
> annoying for me to deal with.
> 
> I ended up going with the channel assignment the TRM lists, as I see the
> DDR sensor get a larger deviation from baseline temperatures during memory
> stress tests (stress-ng --memrate 8 --memrate-flush) than what the TRM
> claims is the GPU sensor but downstream claims is the DDR sensor. Input
> from Rockchip engineers on whether the TRM is right or wrong welcome.
> 
> The trim functionality is only used by RK3576 at the moment. Code to
> handle other SoCs can rely on the shared otp reading and perhaps even
> the IP revision specific function, but may need its own IP revision
> specific functions added as well. Absent trim functionality in other
> SoCs should not interfere with the modified common code paths.
> 
> Patch 1 is a cleanup patch for the rockchip thermal driver, where a
> function was confusingly named.
> 
> Patch 2 adds the RK3576 compatible to the bindings.
> 
> Patch 3 adds support for this SoC's thermal chip to the driver. It is a
> port of the downstream commit adding support for this.
> 
> Patch 4 adds some documentation for imminent additional functionality to
> the binding, namely the trim value stuff.
> 
> Patch 5 adds support for reading these OTP values in the
> rockchip_thermal driver, and makes use of them. The code is mostly new
> upstream code written by me, using downstream code as reference.

Applied patches 1-5

Thanks
  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

