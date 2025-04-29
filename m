Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85738C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+72HNtfhPv8IsRO4PpBbClmzVtCdsJ1REbN19xYrgg=; b=dvHdJY3dEi8+E/vFL4YIobt/Qs
	lHb86DtYvPcLbCiXMG7bezOZnV26+wnXsKCEeNOHxY4Nt1Sj7yyEPB26xjG/uasWZA4VxhjobXw6z
	lTa4m1ZVP4wBQT1xPUNTWUXI2Esr859tWDALzlp5aTlMedHUVMGaJXLwedk/XA5v+h3Er0kBhm7im
	pKivLYrCT3ZnJsqUzmfvYwcoXIqpYBJvpeCekyEJf8l2dwbiIKh0v3MOP12jnfGkHGx0MUOcx1azU
	7/bhKyuorN9yV7Zx3EDItN1HtbHWRmu9DV8PongZ4T0uYz0RTFcitp0XzDV7aiB3EWstphv2+wpWE
	Y9XyGw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fha-00000008onr-0WKX;
	Tue, 29 Apr 2025 07:48:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fUc-00000008m5A-3a6Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 07:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745912101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P+72HNtfhPv8IsRO4PpBbClmzVtCdsJ1REbN19xYrgg=;
	b=Ku9sTUVOMW6lHQNRP06/B2f1tDUHb4sda2XMwiW9SBqGRPxvmfv3OTw0R4hJ+qqhDyAas+
	avLOktx4HHRHaAfiqkMWyzF/jQPF6IV8eUZJKc3gERAw+itlbpsEzx9gA1BULt/u1OGQZJ
	A4llOvwuMVKLqKuEUwQkK/WuuhHbQqg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-vB46pXRTMOSuvflqEGw54A-1; Tue, 29 Apr 2025 03:33:22 -0400
X-MC-Unique: vB46pXRTMOSuvflqEGw54A-1
X-Mimecast-MFC-AGG-ID: vB46pXRTMOSuvflqEGw54A_1745912001
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso38670905e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 00:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912001; x=1746516801;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+72HNtfhPv8IsRO4PpBbClmzVtCdsJ1REbN19xYrgg=;
        b=FrCcclyzB2caynktsVmqH2nSZLp6OqH5K2XzRK9csFhAvyeh2VzDH6DmXtOZiRrZEy
         dK1w2rrJ+LHoI/5v8kzGizXWSejcvmAI1RYIOibuh+BOlwVugAoqbqR4uDK5uen012D1
         qvLbC+/dpRepPaVFuk+vkEdqji5wYgYqyRwkOpKY1Do5a+iUJA8kmCDFdA7W4uyFOcMD
         yJzfFMj2IgpjpXmnsThNvGxYJinxTW4M/BWQlsIbo+qw4MGh0MOlNzz5BjRNRSG5WOvp
         DLdSoqDvhsCXLL6JS1JWKu0X5dkQ611dvwTHA8JKkyMTkBFUhu3r0zw5zBxsvkyDZ8nL
         /ApQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgtUPj0xPCgruvI4F846I4ZSxdfq1AY3Q4d/yOaqaBdeE9P+MucyrxPrMKAU1TpuY5IHmgZGKr9BP/T3U3qvER@lists.infradead.org
X-Gm-Message-State: AOJu0YwwlbhlFJTiIAAMmq1ZKBPqRLGQjeQkBHS3sWcj5qkpTjeesjvz
	vBlJztObuMz1JN/45kOGX2g/YynHOn1FWMLa/YAPh1LoYpolFCn8Fxz4gIX82iE1lTmzOcz7UMc
	NWXDyvDVCG6aI5Hkt67BZpRmnvDE6kSwxEP3j954Py7IyTgKpUMC9TejenBihKZT5639WkxxG
X-Gm-Gg: ASbGncu4nW0K4yiA1uJrOKXP/lHXrKiXSUd0JTK7G3WbMjPPrN/SX+9nN/NJyp4oEP8
	YTWcZ1tQg8jEEDJ+5zTbaQFfX6G4admH/EPg0s6Q4+qTqM4wYfYdSSUBip7LLLB0NsU2em/guym
	uUXl9IgqtWZKKYk7SFueb5BiyL/XwY22LtKSJQA2kY4ygvqkBSQf6ptz/NtvquN7nvbiJRlZwJS
	uy15cSfNr+qe/tXCNUTOLMku//BEm1s6LEs7PfBALfSHrgH60Ads6ugD5QQrk/OPOrCIVyNYlYX
	WEucabyiP9FBKEwo5ZGRJll7vpVu8+88WIjABdnorx2ScgWs7Qef2tMtLIs0wdgVIYhgzA==
X-Received: by 2002:a05:600c:19cc:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-441ac85786bmr19965705e9.14.1745912001313;
        Tue, 29 Apr 2025 00:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHljw4FTOErNPchc4gpA5RoNY02F91HquBdjkOTWdJUR7gI95jnweHCcRLzTuNXQSYwqi6w==
X-Received: by 2002:a05:600c:19cc:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-441ac85786bmr19965335e9.14.1745912000916;
        Tue, 29 Apr 2025 00:33:20 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca72sm12866525f8f.4.2025.04.29.00.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:33:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Paolo Bonzini
 <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
References: <20250418165059.560503-1-jfalempe@redhat.com>
Date: Tue, 29 Apr 2025 09:33:17 +0200
Message-ID: <8734dr1kxu.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QZWKPATMd5DuBj5i9Vcaegcm8p04MqH0HcJ-tHyC5Fk_1745912001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_003502_964666_6B5FA49F 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.
>
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


