Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62653E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g70770pHl/BwAdcq7mSKVqhSUdxEsRQhDHwPhr+/2R0=; b=szGIJkFQm2WwQmJWjRyDEWF7AB
	4QjecQsr9KrKK3rFf10a/BfVKXrykjXsKo2s3EQ+JKYysf+I/6kxcpQ4sTqdi8y7Id44zGxgHscQE
	3fueCt6txgqGFcp/4rdhPGt2WZ/0j36rhvK+4pOSBA3DV+FZEXifZDDW+todPetNZoSrYah1yaRUB
	74EBtDMv85lWaBfs1WRLstEs3H7PZeDOGiFtASOPVkuzvKVPbrjWAkuHfom5gk+n+lJGIvmcqU2tc
	hpGSjxstH6Jbbzl8+eaml4yEgnd4OFxfw15Qq2st1XgZYKNTC9C7avfZjS3EaG2DY4mK1QTcj2duF
	0YaPDJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7uj-0000000FJb7-3wta;
	Thu, 05 Dec 2024 09:12:49 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7tJ-0000000FJCW-3St9;
	Thu, 05 Dec 2024 09:11:22 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2ffbf4580cbso6013441fa.2;
        Thu, 05 Dec 2024 01:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733389879; x=1733994679; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g70770pHl/BwAdcq7mSKVqhSUdxEsRQhDHwPhr+/2R0=;
        b=IyiQkPETdNXX71J74BrYBBp/nxvvPc9yp0X5RNjD7p+XPp5dS3szy63W06pZidl5Ps
         VN3Dh7nZT90J2XeCXM6shYoX/mOdiWtxmNssOO+Tq5lMjPzb1+EOj397WpZEcLCLiT6O
         XjCsv1RYJqqkgNMnKADQIjax+HZBm/9eJe8WfDogKATC+W0kxefEl4+EhxsOBNf0elvv
         gXskE8nJ2zp1jF8qIU09/1fTuvteF2xP6EqO4Fn9iszReC68nSWmt6cFC7nMrxPtThAL
         nrp7n4A5i/ibkksuD24x0i3jiGbcpZy+ikeeSR2YsK79TljcbuD0FlKcXYu/WGNsi+VZ
         s+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733389879; x=1733994679;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g70770pHl/BwAdcq7mSKVqhSUdxEsRQhDHwPhr+/2R0=;
        b=vsgntexTs2bOUBP+a4VcRvC6GN7pxoK7jmSp8A5PomEFWPaeRmEsm1/w6YNOWP2Dnf
         jDVvRnyhHPIf1DoP90Ht8KdqvL0cIT0qfJS1xWsL17K4xLnxX/3TNiuEkg4Q77s/HgVV
         cxLjSso6uaZ1pnk/GfbkJBQhA4Z0hP03VQYlXLKMumVoAi9I+ANotk2k2UwiMj0vgOKw
         7vhXagGB3oCbbLQBdMIXyWNKSHGDVMciq3GqJpUW5vX/ovesFg4erDVX2FAcz0PXd0AM
         6I6Lx14FskbBa5gbDj6aBpbZvL6ridnyJLKnA76eJx6QA7oTWeOZ7XjhOI/Ddo0Klw1I
         SdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/aoiUWP4Hvc4xPrtpuex9hbj/46BVIHCrfakIpW5I5n9pJJAAJx3o0mIwHkxFj0XMUJfsVwb4SGT0JUxo2OQ=@lists.infradead.org, AJvYcCX0fvt/WA5KDQ4A9C8YnVp9hgM1P9q2DmHAIKkjenz07MeApD6u3MQoSrfUp9ezDDvwLWwVgV7C0+g15rHSF3h0@lists.infradead.org
X-Gm-Message-State: AOJu0YzJMZzr0foAcqRX97gSblwvOu9Ca8EvbDarK0Sq/X56mrD+XKNE
	3Zr9RzbCmefPG7QshOUaElNsrPSab49PEo0BPc8X6GejIXzQooEV
X-Gm-Gg: ASbGnctN7jdN9/nveMTHPV2DCOsSB6ilE46Hd3Jb3BEook3iuPUql7FabuWlHNoEUCG
	8ZWh8sa3VcH8BVpDS9JW5uP6v8qbiR7SixWOt5xSaA9PfpRan06Y4zoGUR30V6jH4tayL9OxL7+
	V6Fg2GBvqsxWlsKHbEUbMrP3Q+1S2pu/zusQBmjqMQAfpQJtOUUslRsZCIVdG1cU1khNpv04apo
	jEy5kTSUwSY9kxNVyqdXq1a6RsMiVF2T0FUerOflwvwUfawtaTwLw==
X-Google-Smtp-Source: AGHT+IFZ6+YRR3jm0gV75fejVmMXL5MRbl//2N9aoRFrmHGjZdJU9MYPNc36DsVVHcoZY+7LCJrMXw==
X-Received: by 2002:a2e:8e84:0:b0:300:18fc:8e55 with SMTP id 38308e7fff4ca-30018fc906cmr21853361fa.2.1733389879024;
        Thu, 05 Dec 2024 01:11:19 -0800 (PST)
Received: from [192.168.0.107] ([91.90.219.38])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020da1182sm1586511fa.35.2024.12.05.01.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:11:18 -0800 (PST)
Message-ID: <6c8e60a1-820b-4818-ad68-9b042533f4f9@gmail.com>
Date: Thu, 5 Dec 2024 14:06:27 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Dmitry Yashin <dmt.yashin@gmail.com>
References: <20241203165450.1501219-1-heiko@sntech.de>
Content-Language: en-US
In-Reply-To: <20241203165450.1501219-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_011121_866934_17B08B00 
X-CRM114-Status: GOOD (  12.40  )
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

Hello Heiko,

On 03.12.24 21:54, Heiko Stuebner wrote:
> This series adds a bridge and glue driver for the DSI2 controller found
> in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
>
> As the manual states:
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The MIPI DSI-2 Host Controller is
> a digital core that implements all protocol functions defined in the
> MIPI DSI-2 Specification.
>
>
> While the driver structure is very similar to the previous DSI controller,
> the programming model of the core is quite different, with a completely
> new register set.
>
> Another notable difference is that the phy interface is variable now too
> in its width and some other settings.

Thanks for the series. I was able to get output on my Radxa's Rock 5B
(dsi1) + Radxa's 10FHD Display setup. Works smoothly with multiple DE's,
rotation and display on/off.

Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>

-- 
Thanks,
Dmitry


