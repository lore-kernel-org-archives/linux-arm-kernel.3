Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B940C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8X090V4s3kvMup4b4DXzC/aPr3VhHsT7v221j97xnKs=; b=mgImD4hzcD7UNHasA/jXEMLfQD
	/0ILTBow7V1CuGNslxxQ8Q+6akps11USCQSa46jmRaUlNDbsT7Sv94FBQogViEQK5LRgDKTl5XIfK
	ad8259hVGkoPCatMJOTgjK3e8melH35hxjBCt8+8Dau+MOPanOhbiYQtdWejcP0ut2+J8om7JSj9w
	AANFQyCC3Hmq6yWZH3zUL0OnH0PUU3GcUCjlI66hIUlpw4VWSjiK5cGp6VLohPBPIIpH5vo9rA06M
	Jkri/Neqn331uO/MSbffNPQ8UriwrMKOsP1ncs5rFo7AYS6zC7trvrDa8cTxWuTNIHbivBgjLFmnN
	i/eUywKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBDy-00000007X6N-2Fqb;
	Tue, 21 Jan 2025 10:11:10 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBCg-00000007Wro-0fdi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:09:51 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21619108a6bso91084205ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 02:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737454189; x=1738058989; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8X090V4s3kvMup4b4DXzC/aPr3VhHsT7v221j97xnKs=;
        b=EiKmSThX6QbyBZzQSFHIkASj5pVEJgW84Es9KPSvSjjo+NjQJNQUm7PPMPAhpYe1nP
         4/kK27Z0NsqaXuIuxulR/XcRISNy3Fe5Ut2FkBTlsl4psFetBxuEn5lZIGQSilJUaNHr
         00Zukrpi+20zWbzDHwWOZ4apMqKJr2chiAxkE32IuPP6IpVr/RxtgzqTbIk3CMjtIc5v
         SdQmeOUfJdo8w3x4ADzuQz2y0E3BA2Ajp2qRvJwGn4KFYk/eEEzqy1+t14ti11jNfFL8
         1cWHE5e8ZuroKdVDi5JJ2AlMfg0CB0UYGKGgtDnLFoxlK5cv4z4cwDzo5fzdcPGbuV0M
         q/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737454189; x=1738058989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8X090V4s3kvMup4b4DXzC/aPr3VhHsT7v221j97xnKs=;
        b=NRl/gL+2gn07jXtsz2IqUEYKITJLBOS5FCX2OfnUqS2iLw8cpw5F8LzXp/7vq7lcvV
         UhBvAksjG7c2UHcmp+eJ80LwF3EterDDXohgDeHGMZuWdxewhN6DIXmI6FlhlH+HW+Lr
         jOE2kweapBd1AWS59Q7P7LFjkTc6bJYZOPbTfVJ/R9s8RNrJxBahF+i2a62OBEMS1B2p
         ARU6iAQ3QgkOEVS+adL7MDB/BO0SAuSPz56jJ4OBNpaEfile5ZEabit/77oPlKTQD76k
         I32rSAJSCMbKnK1Sm7N1vPq4ZPVx0N0NROyro1zhGMb48arfNaKIcp8XW+uVyOYUTucB
         1NLA==
X-Forwarded-Encrypted: i=1; AJvYcCW/38Lg3CVBHsacx+e/N4T5fKIM+A2nmJJzqwYBcIkwqofPZiIUV7gmHXUOg1LBtI1g9TeUmfuvTa0qjbFjS4M1@lists.infradead.org
X-Gm-Message-State: AOJu0YwSvXT1r0QeRYaIB4kG6C/mkO8OQWR4A13kcB7I8AVULOrSO3te
	uv/ns5rxk1MN4MB/B3LBCYvcw7DiZG2Fxq7R9aob4wxPIGya4TSm12iFn90SeZBWvLFg08vXKEM
	j
X-Gm-Gg: ASbGnctR3Z46is1gQWKxAFDB0rMj6ck0/cjXB+K2nT3iw3vuInNMP8nQAfez63WLLOR
	6cUm4rbRZopX/XSWcilYhHjKmwzI57gLFCZhemCYn2cF5e9jJsiewsX+3rWvtFcKhm/ryZTJE+Q
	0ZCWHG69STfab9fynWeM1iIBkyoCubI7pddPJadHwkVXmKwSViNQ02OsI7zsmTWbpC37HoE4kM0
	nXiqeDQnHHA3e8oLeVjvYcgh7VaboKp2UBptGT9tk55zsAW6d6Gc1uNDd2WUAaE/S9LZ/lh
X-Google-Smtp-Source: AGHT+IG6ccRwJ7aBHB1IOZWi95VgZ2rMq355HwIB7QIwzEL/oKwWVpSTlwM0nRxwhXria6RPvyzTtQ==
X-Received: by 2002:a05:6a21:789a:b0:1e6:51d2:c8e3 with SMTP id adf61e73a8af0-1eb215f52a7mr32773044637.35.1737454189287;
        Tue, 21 Jan 2025 02:09:49 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dabaa39c6sm8680800b3a.160.2025.01.21.02.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 02:09:48 -0800 (PST)
Date: Tue, 21 Jan 2025 15:39:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] firmware: arm_ffa: Setup of_node for ffa devices
Message-ID: <20250121100946.ouzeuh5fopkgmf55@vireshk-i7>
References: <cover.1737441631.git.viresh.kumar@linaro.org>
 <0e863a4baea59865aff0d1b5657f548bc0aa8d2a.1737441631.git.viresh.kumar@linaro.org>
 <Z49v50epNMm6YvAr@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z49v50epNMm6YvAr@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_020950_199654_E2202273 
X-CRM114-Status: GOOD (  20.76  )
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

On 21-01-25, 09:59, Sudeep Holla wrote:
> On Tue, Jan 21, 2025 at 12:26:39PM +0530, Viresh Kumar wrote:
> > Match and bind the of_node for the FFA device.
> 
> I am bit confused and need more details than the above line 😄, because
> 
> 1. We don't have any binding for FF-A and compatible "arm,ffa" is not yet
>    defined

Realized now that you weren't cc'd on 1/3. Bounced it to your email id
now.

> 2. Even if we have binding, we will not have vm_id and UUID which are
>    discoverable from the firmware

Hmm..

> 3. DT maintainers rejected the bindings when it was initially proposed
>    as it is discoverable. If we need it for a valid reason, we need more
>    info, this patch doesn't provide full picture to change their stance.

We are working on FFA based Virtio bus/devices. The
dma_alloc_coherent() helpers for the virtqueue (and other DMA-ble
memory helpers) end up calling the dma-core for the parent device,
which is FFA device in our case.

We want to avoid separate mapping for each buffer sent by the guest
and keep a reserved mem (via DT) for the specific FFA device. With
that, the memory can be mapped at once at the host (shared over FFA)
and all the following DMA allocations can happen from that
memory-region.

This needs to come via DT and this was my first attempt to get the
discussion going.

> I would like to add minimal binding not for vmid or UUID but for interrupts
> only. It is still WIP but I haven't made up my mind on how that should look.

These were required to identify the exact FFA device from DT, what
else can we do ?

-- 
viresh

