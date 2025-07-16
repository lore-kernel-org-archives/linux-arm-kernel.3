Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8284C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 21:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTFRn/aeMp4S+G4FgB+Q2zAiPMprlJMkEEu55rvT0e8=; b=BSX12ObM3aeeGfILiurlP7tVrH
	a0GFgRWnw0rxpmE2BgtNxnrI8kyJRW98M+IZygjwHcTxgFx0TgfnMKdLDBiDVWUhw6zPFdQDtc8q9
	iQOasLKGo3unQj4hRMigx8M9sxpVmf0WndWjQLfHx6qe5Mx1qpexUlD202fdc3/toaXrZdAEY7QT5
	XtpEADaXyOe5zO0qKmoG/JnmzA6N5djyTQ4bhI/h3diXAYyQ0W1Dus398ylT6tx3QV0vh9n3nFZ/0
	UPbE/rSgAEkEoFPj1YCc5qEKh/ZfDoqq5VnCGNiftjaLSAbeY76V0OONTjnHszrwWU1K2UBBgOISu
	rekp3NoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc9LG-00000008fdu-10Lv;
	Wed, 16 Jul 2025 21:07:06 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8Ur-00000008aHH-0owb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 20:12:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so1260465e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 13:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752696776; x=1753301576; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bTFRn/aeMp4S+G4FgB+Q2zAiPMprlJMkEEu55rvT0e8=;
        b=XOYieBzPIZTLCddOsCWvN8kMdbIYIb1Dvi2KmV6Nr2SLxWLy9J2XCrEUM4Q/kpHdlc
         aVyD3Zb4YX6NzNDKblQAZezO7GJ16oCWtlRRayYPyMjzfVRH6qr+RCm+pPAtTL0Se7P5
         +SkbdqOgdH6nyoO1juo4r3E4YKRaJsUwk9SzJ7ofVsjfdeWTTmn1a3i2hT/NwRXuqbkG
         5bmgF4Qr1Hx97xTDKGEpXcfrFV4rBApD+dYfoN/jq7cKraLf22rl1g276uNP5DmpCn95
         IPwJi4DBz0cxZpYGpoz73lJG+BTS8EoyiW1QIqb+0vhtvl38Tt4mm6FueuhfGGpj4TCm
         dnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752696776; x=1753301576;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bTFRn/aeMp4S+G4FgB+Q2zAiPMprlJMkEEu55rvT0e8=;
        b=aS9xx9QZAtHXCBq7IgeyuZWNL2intj2ZDBSczQ3xS/rgtK8GdJ5brfe1cZPFCODM4i
         MGYBFbYVyVvX57Er0mv3WzkRdhNzYJ3VwEDpLVOQvmBWmpTCBWq952VRyMsBV++p3FvF
         UezrYeWBxDC4Uw8gMVdCWgLL1VRTmgClfta4ohdkGf0wtiBkutU7NpbL9BU0tMuCteyx
         xCRs1XX1jIKewRDDiPmWF5VNnAWV+f7ZoMCT1sWiHpOgKLb5X/DILv1CgKSyznSsyDoo
         6JqBgcns6XyPM+PhDW920HjbYye94hPs3/oNoZDVLq92ewYP6ahBC5aIeRnE8iHGFO25
         U/YA==
X-Forwarded-Encrypted: i=1; AJvYcCWWglxi4nIHZGKufZXia6TFmYclo2mKyFqW5aXgu4byvFAooYT56YTAwTEznMYihGslmaKyZgaBKxxMKdRzggZ/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+iJbLu6sJe6FbzGTJfn+cEDsSWy3ag6RPhe2O6Lr/GeMY0Sjp
	vdGSVB77uIm12wjdDw2Bht6QwtkKkQA96uuRhXRi56D533Zld4hfvwHK6SdKq+qQcds=
X-Gm-Gg: ASbGnct+Zb0bAC1v5PbGe0c6n8KC0HlfZZBnXCDY5+t84Tz78Uc+oRQCnyD7W78tw2j
	kKaO2jUaUw0VspnRZYRzO/aBCpuQC/RekEzlhgVb5FQNmbtTwKzRz3OXAXYHTajr9fiQJ704+B8
	ENzVw4Ckvkmwp5ADICfv/NeIwPXOVkvQs8X/v6rvhnRUTQGyqZ0BhYHKR03d+mnyI2pfwWzx+C7
	fo/SzKUmk0D3sE7qMNxwfoMkpbLxNWeBzmFeeHuPIdBmalmWepvC9eFckj2j/r3Ym0GrMB3em/c
	xS+wU0wAX08ypi8T/ppQJ4JMiQYg7ZtJ2q9ngi82F//TZm0YU0UPA8fYBn9bZksubJSD85H18u4
	WmiDT0OOrt3FGuxAjSyGEIkPf1U27wAhYornB+0ZrOqA9H4brlGkHBmB5qjJ0
X-Google-Smtp-Source: AGHT+IECjdi+MWNAvcqWs+1OLsKCHSKbh3tJIUEemW3jQjXS2P935Ehl7efgOxAko9BQ18ZlI2cxCw==
X-Received: by 2002:a05:600c:1c12:b0:456:2379:c238 with SMTP id 5b1f17b1804b1-4563532c8eamr1285045e9.17.1752696775581;
        Wed, 16 Jul 2025 13:12:55 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14ce6sm18964814f8f.68.2025.07.16.13.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 13:12:54 -0700 (PDT)
Date: Wed, 16 Jul 2025 22:12:53 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: [PATCH v6 0/7] RK3576 thermal sensor support, including OTP trim
 adjustments
Message-ID: <aHgHxR1_Gzu8Dwbm@mai.linaro.org>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_131257_248800_E4D92063 
X-CRM114-Status: GOOD (  28.11  )
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

On Tue, Jun 10, 2025 at 02:32:36PM +0200, Nicolas Frattaroli wrote:
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

Replaced previously applied version V5 with this V6 patches 1-5

Thanks

  -- Daniel

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

