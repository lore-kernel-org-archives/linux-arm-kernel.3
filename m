Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108D5C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ge/ab62pYsGDLvPGgps1hKvOP8NBv8kv6NxDVGP8b2g=; b=oSGH6lLtQycMFnqyy/9AeY8I2E
	/V1emb2HpNoE8bY0n0Qj9p5Tu+TdN/F0NUN3BNj/zRX5pWN+8HJCQGgQ0i/kXtmZtxwCtH5CDnGWr
	ebGUXNuPX9yYfHD07WJAyM6JRHs0bo0PKxBtkIf8Gztap+ZxdAqXcexqbKaPIgE4PwcbM6FMwy0Kd
	Kc/5xkfcMeAcuOzzKYYnRfx9WFokBpWEJpmQzFFnT02r1KvvQoGXcLYqfaute1PF0mxV6TTthykjc
	pk2TrC+vSlC8mGNRK9FcI4nkXcSSjH4PnruZgJkccdP/Lg8MhREj5nRnk/p/nN42E5NaKpbDPLiN7
	XfsfWxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0BH-0000000B2N6-1bDw;
	Fri, 28 Feb 2025 13:13:31 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to09j-0000000B21D-2wwH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 13:11:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E44B61127
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 13:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCC6C4CEE4
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 13:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740748314;
	bh=ge/ab62pYsGDLvPGgps1hKvOP8NBv8kv6NxDVGP8b2g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gFpiAiDB2Ym4OjoyJpI/Tq77xMHJyziAGBVlEkWG14A5XcgLz87oNcicSk+I81C6r
	 vgGEDYt3YRPOlfG7N2FNnVTH+xxvqMTdJkKpRdz1Gauw5+fBoHudY+JStsEM5CEjoc
	 So7+A7VjhBLpTPdvqu3aRD/u1pi3b+yE8SmR9tpmo99/pSowfQgkLySGk1rmaKgnGG
	 thkb6u4BcBbh3Dud2M5nztBBVgbTIT1foNCQEJ+CWRWnF3sy5ZYB4Ei8v3yyBtFZBu
	 ZYSthpDGDnsfA2uOhvEgV8Pf1XSRGLThPYxR6RXdBaV8fcoCDbN0LxdUY4z7MqV4bj
	 IxTfj+NTyyO8A==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5454f00fc8dso1919398e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 05:11:54 -0800 (PST)
X-Gm-Message-State: AOJu0YwkTZwkchM1dq6Uu90Ou+5ouzL40up+C3Pq8Yp+NZY4C4FRWhA+
	D0lgGE7MY1XBGMmwqYHpE5S/N9UoRKSd//GeF1coq7oDQCTGaSDRh9ghoSwY5EXte/jeAy4ZXEb
	OhkiQQHeDF1xRt1xJQdAcAPXluIk=
X-Google-Smtp-Source: AGHT+IEdP/huYmVd7fCqMgbE+DZUs3JfHQr17sTH27XVC4AIB4+C6ohl8aTsAIH4uv1KQS+Dzr0Lv2Drtl4FyJ41zVY=
X-Received: by 2002:a05:6512:3405:b0:548:526c:fb99 with SMTP id
 2adb3069b0e04-5494c323592mr1338653e87.18.1740748313140; Fri, 28 Feb 2025
 05:11:53 -0800 (PST)
MIME-Version: 1.0
References: <20250224062111.66528-1-kpark3469@gmail.com> <CA+KhAHYujgeC2kAd-vs0N0zwprpeqtD8G-8DpJ0w2RSxzZ5SQw@mail.gmail.com>
 <CAMj1kXH-QmuXGi-5MSEzz7zSpPYWvM2eBPN-NbWF+R=49P2_2g@mail.gmail.com> <CA+KhAHYDui3VkebjxZLnN_ijMUzJf2BRMqtPqqos+rCbf8J7Ww@mail.gmail.com>
In-Reply-To: <CA+KhAHYDui3VkebjxZLnN_ijMUzJf2BRMqtPqqos+rCbf8J7Ww@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Feb 2025 14:11:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHyZ5_+ZrcRtdx4X8LA+mzCNcXUZM_3QcEudYGbuGBq0w@mail.gmail.com>
X-Gm-Features: AQ5f1JohuAj06yXvicF9Z_FVzZ_LrO0KkK0BS-faeO6tsEXacAnqjZ-WwcujNKc
Message-ID: <CAMj1kXHyZ5_+ZrcRtdx4X8LA+mzCNcXUZM_3QcEudYGbuGBq0w@mail.gmail.com>
Subject: Re: [PATCH] arm64: kaslr: consider parange is bigger than linear_region_size
To: Keun-O Park <kpark3469@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, Keuno Park <keun-o.park@katim.com>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 28 Feb 2025 at 06:55, Keun-O Park <kpark3469@gmail.com> wrote:
>
> How about adding a warning message in case of linear region
> randomization failure?
> And, there might be two options in my mind by now to consider hotplug memory.
> Either giving an option for users to override "parange" as kernel
> param or providing the legacy way((memblock_end_of_DRAM() -
> memblock_start_of_DRAM()) when CONFIG_MEMORY_HOTPLUG is off.
> Users believe KASLR will work fine by enabling CONFIG_RANDOMIZE_BASE.
> In case of linear region randomization failure, I think at least users
> need to know about this failure.
> Can you share your thoughts on this please?
>

Randomization of the linear map has always been a best effort thing,
so I don't think this is a big deal.

I wouldn't object to the new behavior being conditional on
CONFIG_MEMORY_HOTPLUG, and fallback to the old behavior otherwise. But
ultimately, it will be up to the maintainers.

