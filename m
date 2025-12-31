Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25830EE6428
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F93O35PumyM940gks6WuFLpakwWFLPgJeDsUaIQB1m8=; b=C0Lpa6ZmT+uDy+PbVTAzC3Y8yc
	csG+tLgUcY6VjQBnUiup4VDO2NGNMuQQD3p98jSnp4OH+etUDfGr1BkzCCOCvVkONxwqeNclDXBDX
	sigi9VaY36+wvQPf1glbRgvSFWxi3SxGMuUmo9K8/ue+31XJqAPVY0wVS2QFeHwUNTmCLlbn+fA4R
	OOLX6sNqSm++LjUuMRcGirBCHEv5HmYcqF1UIiGJnJjJwR9YY5kfBHXrZP3bNb3tNEODgwBIuJvSZ
	jIdlF0yY0OA6HPh6AAMXfCiIvK6etIRGq14gg/yC2OQhIOyx5PGw0vAe6XHlt7gYBWrUqrXkEr6H7
	BVGXwEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatkK-00000005tYu-3z7o;
	Wed, 31 Dec 2025 10:48:04 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatkI-00000005tYE-155e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 10:48:03 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-64d0d41404cso13042555a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 02:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1767178080; x=1767782880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F93O35PumyM940gks6WuFLpakwWFLPgJeDsUaIQB1m8=;
        b=ifGKTaSWhbPppYeVL7Plftv8HN/7H4J8nzb/+fALDk/52jAXqfTZuQrbOFDStco7pN
         bJehBj9i02IiMS8tyhG1PM2+UeB1YUpPqgKdCg65Trr3nmqXZFpsqpCBoJvIAc3Voqa0
         4Z4mwyk0v/NgmG3Qw8EUkZf7zTGJcsjSRd0W8DyTSRyrjtNULWduv1JRGXsdL4IzC4UA
         gUitfRBKiAoGs/mkTDvZr+4c/hLFZkaIR7nHArEHDwGBKcgU3d3NiJIXAizU98fmdvX1
         G01uka7l9Mp1iG3b8GlJigICorMSG3/dsNuZ2VOWj49aI/y5iX6Md2XCUq/dWpsAfT5k
         uz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178080; x=1767782880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F93O35PumyM940gks6WuFLpakwWFLPgJeDsUaIQB1m8=;
        b=J930v9LP/HMlVVZ83Utnd3D1ahUQ6WbDCCm3/YhvqWVXdO9c4nvBm3Sv/YTo53Z1hY
         q+D1x6hbZCW+Guq0b/b0dGCLZg2YC9ZEaAY7HnNs79ubtnxvIdkKmVB6LQPdNtDJxbuA
         J0q4kyrclYWbQ9BeYSLYmbgomfTJlE2gaFQ/w2KOB+DtNQUIRweBAurKvzY8UhrfG9sI
         LrbDQxS1T8EJTAr+s7Ys5/3d29Skws1gVAWa4nj58bMFIWwQKyP8ZOZMclexMzfTgkrG
         Eoj/5OakRS9jvPGtOS5tN1+oIeA9up6WQXFgH/WjUFzYTWhVGae0WOl1pJ3hkdPgX2WR
         UuVA==
X-Forwarded-Encrypted: i=1; AJvYcCXJEpvLadFOjDebdnWDsPF+aGW8E1fgMXDoWNiyipJT3XSgBvYuPKxIGCQTIomyqHcGT4DBxsmLYrczFut4mK8m@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3K/nqva5KwCskvCmTmTV2Jds8rT4m+lJJR7O0FAscQZgpmBpX
	eo7pkZf1OanBZ/kI7WGLlkXnmV8xOcWeLPuSZHUt7EqLHVaLSngt0MBv/uvtJ/A4Bw==
X-Gm-Gg: AY/fxX4rVDImMf0sHwCavs04b9s+Md5PjAP8jJw207h1CHxh8nsyiE00W7SI9Zuv4pe
	GnkzVRZSMWweTCtuXYLmS3BREIRGMeMp7Gcom/5W01jKS1wwPNcvsnvujuxTCNz2dJR/ifrIk8V
	uN/W0v+B3+dgM7+zCjy+z4roFgBDA3gswMhn5SoO7j7UGIt4m2l5QRUkCQkreksZa5TkVWE8fl1
	rjJAKajf63eQwXzixvQhD4Uk/UN9m+V/oCwt+5y3RiKj2nbpxOFCGaBRFlWRcRwUqKL+NbY4pLq
	fHgJl/kPKj84HYOmWHWtMRGvrHZjtVZJI7ROEboiNtYBcO0KlkOJH3B/kV0mUKqt2L7YlwB4DN9
	so513xDIfLCHyVGhkAXXhJNblSeOroG+DtVxmJwPt0oPSCjls5OWpEReTkXTTIx8ZqdMSr2cqzh
	p+mQ+WBsSrtxDNRRBLH89GThN9q6Pi+7VzdKxvJNcxO7BRG4MUnSwzu/ujIVwvS3EpjQV5nQW11
	8jYmqi9ZiH536YWxeLttU/wlg84irF9lFWiIfLoJJk0qcb2A1VtN6PcZhW7xXPoT54p
X-Google-Smtp-Source: AGHT+IF3qhSpzRRJ00xM16d/rHst6xExjWudsQHkK88MVOiMn97mRDN/nVNkVEeTmwCRmO4z98V2LA==
X-Received: by 2002:a17:907:d64a:b0:b7c:e320:5232 with SMTP id a640c23a62f3a-b8036f0ae81mr3704046166b.5.1767178079658;
        Wed, 31 Dec 2025 02:47:59 -0800 (PST)
Received: from ?IPV6:2a02:a466:4d7a:0:4db8:192e:8b05:7bd4? (2a02-a466-4d7a-0-4db8-192e-8b05-7bd4.fixed6.kpn.net. [2a02:a466:4d7a:0:4db8:192e:8b05:7bd4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8080e2177csm2948161966b.68.2025.12.31.02.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 02:47:59 -0800 (PST)
Message-ID: <448acb0f-fa4d-45f1-83c1-7146cda9fc25@pardini.net>
Date: Wed, 31 Dec 2025 11:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] arm64: dts: rockchip: Enable the NPU on some rk3588
 boards
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 nicolas.frattaroli@collabora.com
References: <20251230-arm64-dts-rockchip-rk3588-npu-enablements-v1-0-d38b182a59e3@pardini.net>
 <CALWfF7KHyKmDcEL9=mYzfCRWc_cymNscoFdeXr8P2frJeww5vA@mail.gmail.com>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <CALWfF7KHyKmDcEL9=mYzfCRWc_cymNscoFdeXr8P2frJeww5vA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_024802_387946_DCDF1675 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Jimmy,

>> This series enables the NPU on a few Rockchip rk3588 boards.
>> In every case here, the required regulator was already described.

> Now that the pd_npu has defined the dependency to the vdd_npu_s0,
> shouldn't the regulator-always-on be removed from the regulator? When
> the Rock5B enabled the NPU, it didn't define the regulator with always
> on. [1]
> 
> More specifically, the commit message for the introduction of the
> pd_npu label mentions how the regulator no longer needs to be always
> on. [2]
> 
> [1] https://lore.kernel.org/linux-rockchip/20250721-6-10-rocket-v9-10-77ebd484941e@tomeuvizoso.net/
> [2] https://lore.kernel.org/linux-rockchip/20250721-6-10-rocket-v9-7-77ebd484941e@tomeuvizoso.net/
Nice, I overlooked that. I'll send a v2 removing `regulator-always-on;` 
from the regulator.

And maybe a separate series removing it from the the other NPU-enabled 
boards that still have it?

Thanks,
Ricardo

