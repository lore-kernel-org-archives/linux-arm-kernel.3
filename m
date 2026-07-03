Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7154C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 21:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRs+IJvtl+S/Pu16c/TYvy9/SL0ko1Fkla/ifix+DNU=; b=gXaBK1zO6fumgOtdJ9O7OBcefl
	0b5T9dPcCu4VXRzZx7TXzMdV22yvwIut0mRxuim3oqeTS2D9N/LN414JgqwXowW2UrC2euif1xUYs
	fV4GR3hwSVkfOBBmm7cTLRMR1lzzOX87Oohft1kIbkZamfCVH+fabbxcpC0xLZWtzNo6b4tUko9gg
	6KaNSEu5VZzd2898EoZgbZJjl9ZO0cQVAb6dHOR5zlLLAlb7KaxnMFC75ZYYM0m52gWen0/BA/grF
	Xv69LCGTAHM7yKTWeXGipP8k+mJ1JdkoJy2X63WpHcBgWIarV7+4nGxhnEhdhUUxCnznd3in9eOVr
	o8NMgPWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkQM-00000007q7k-3Zrh;
	Fri, 03 Jul 2026 20:23:46 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkQJ-00000007q6t-43lH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:23:45 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-845e363246aso925290b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783110223; cv=none;
        d=google.com; s=arc-20260327;
        b=Hyqtn8ed8NSboHAMnfi5PZkVVKHklsmZhkQYk66XwIZPpzGhS4/pgT4G97igHkG8f5
         PuLXyNlNI9U4gTjLDJsTo11fCUlZfjgNLRkn1+vs6Vr8onz9a+TzW4ud4MuoetgZhegO
         vEUoZOOjI10PyvZxwIjmZDBznHdWDRYUgSoSd9Indzh3TsrAVTaNWpEr7yv6v4G6rb7d
         cpdATnwIVZbscyupS60GagPJM4EI1bprEaivTRvIie+KHJwZ/lzRarnxOGXfZUkHbWTd
         P6LzB64r2bw4n3qhWM37iKD04AhCPFzizhLClugq7ticdIa8+mGqFvL3Bh0frQG4PeM4
         aqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mRs+IJvtl+S/Pu16c/TYvy9/SL0ko1Fkla/ifix+DNU=;
        fh=pIcsAwgECnFWm+N9co0rcwKCy+B87kcd2fMCXvRb0d0=;
        b=VVmRdCXrgg71fHu6Uf4vT6IQO1q5xz58KwbrGTzde+AdUUNxkHZiBCpdnp84ZVCSIi
         tFfW4bxCqjSZ6CkHhAnDJezWD9EHwBfPDyY3ZKnx/qdMBtVp+oxh8QnmuvKVNTdpBebZ
         Jz8AXubX4ZL8ge9ZvFZfzoG/jLJRzAbhYrSG9HbgpvxsQ2g6kQKF4Cf45OaB7s8KFIEl
         hSwozGrRSZErC7ziIWWZMzEbWq4XmLB7swBieR2UmmJz+oWvXQcj1uOrENoT8NopUHMu
         gNwjDJ0oEGMoym5in/lwCAWijKDTEkI6SSMzznNpQSpy15Vbnip9ML52BaW7/yEgucBV
         7Png==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783110223; x=1783715023; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mRs+IJvtl+S/Pu16c/TYvy9/SL0ko1Fkla/ifix+DNU=;
        b=k3Iluaya8hJrN7cNlbmRU0xGKGa2o1waN5X1FTHdfKjpaujdg9g2dPw2sFA1NPMalg
         d9f5zcK5UNnWIHwSEKZfu0VZkF5ezJlfZIKaKw7rmWy0XXveUCr7xcgaGUbvG+QO6dMQ
         bPSqSi/MJ8kmoQi21lX1sdb7BEevkpSaETFLClDehOPvjX7T7CLTF/DxB4Je8P+d1hsQ
         TmKLOx+VNpW8h98NJW1lXEYYJmCUoR8zSu2QRYhJBYhpQusfClY3Kb/jJCCBTrhmkKVW
         gwQRhPFefg1Fs0+j7V0oS9SRruHIGk3wmONfIRabkopF+3tGOMBZCLtvHwOGpv4teW/U
         NInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110223; x=1783715023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mRs+IJvtl+S/Pu16c/TYvy9/SL0ko1Fkla/ifix+DNU=;
        b=gGqLFx+qs0WafDe94kMRf/jji3Ll/8bpxY8UCl6sAwDrRCa8Kn9/esPMbYzvDl+tr9
         uOehu5m+TDxn77hBhjmnMPUdD81hsGhA0rHbf9IlMhnSo/Wu+MJioQU994YAnGNL73/j
         rfwVm7MDSKXgE7a+4gLWo3v/9TZ8n0gb9pmaTT2LQimhe5KK4gsQPWOiyTRvqjOBGN5S
         w82Yp9rdRvhJiDJOq+Psuyh49xhYY/SM1gQS8vPP1ASQx2PmYpeeIW3frS037tvki5ML
         OUekdbuJe/Zp6ho9d6p1ukEAopPWhm2ajHwDWb05uHQW+LD6QkLbXNE2lQ2O1bz1JryO
         W/KA==
X-Forwarded-Encrypted: i=1; AFNElJ9SskbiJlr6yecsHH3qVDw3d/fs1aGDR5FOwNAmkz55FJFE0WxIIK6cL32xIyRh/SOO4/I/chqD9lSTll/T+lRL@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2/gQxKfxAwxvfCjasOVFqqdNWymwrT5zL4B/zfvomqEBYF8cj
	XuT7VwgerwQy/5rkBc4mkKeALI0YcieXnlNN3hatWe8YCTEdEzZx2DLpCxxQdQ3OZM6E1oHOL2O
	MdDfEINk9YRWAHFRGMI7IdotbFXJNGPo=
X-Gm-Gg: AfdE7ck3PUehbI7dbG/q58yliz3bhDTipzZr99sthTXj4i/Zg5GgUjo+BCBNix/ztiq
	tV9c/XmKKRXd3mJxUGa3HWGHk0R2McGHcjHADelNGIjCKPQUbUUohsCg0tVj5dgjE9DRXtsjZgx
	tl85ByYshppr8LaR0mVdhkceqJq1hmYrCSUqvKZ7jBWyz/8a7JvrE6h7MMs7CqUw85gWiwSK7Ba
	aPbqb6MGZI64S3tTUg3dKCCyo4XWMplV8wOpfupU68C6aCpq/mKIiUcV85Xw0sSUYmOvA1gYbEh
	5v6mUnHVLiQ2kLQY4pOe7n3sp09tAHoat5uufvE+Gq2BDO5ygj3yseyasbe2nR8=
X-Received: by 2002:a05:6a00:1f09:b0:847:80f5:c612 with SMTP id
 d2e1a72fcca58-847f6dac812mr791279b3a.15.1783110222915; Fri, 03 Jul 2026
 13:23:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com> <DJOWHH5K7P76.3JPJVO47K1SZE@cknow-tech.com>
In-Reply-To: <DJOWHH5K7P76.3JPJVO47K1SZE@cknow-tech.com>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Fri, 3 Jul 2026 22:23:32 +0200
X-Gm-Features: AVVi8CckAXJDSb96QzP_ICWB4DkiCnysZhniMzHMp6xtZ-2xIzGSQUlvFXbFqdo
Message-ID: <CAPSPb=tZ1FenNfEM5P+DWcksKvpQjyQQjAWTRdyxb7=YYxY_rw@mail.gmail.com>
Subject: Re: [PATCH 00/12] arm64: dts: rockchip: Add NanoPi M6 board
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_132344_014151_DF2AE0A7 
X-CRM114-Status: GOOD (  22.33  )
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

Hi Diederik,

On Fri, 3 Jul 2026 at 13:30, Diederik de Haas <diederik@cknow-tech.com> wrote:
>
> On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote:
> > This patch series add support for the NanoPi M6. This board is very
> > similar to the NanoPi R6C and R6S boards which are already supported.
> >
> > Main differences:
> > * M.2 M-key slot with PCIe (Also present on R6C)
> > * M.2 E-key slot with PCIe and USB (from hub)
> > * 1 additional USB 2.0 port from an on-board USB hub
> > * RT5616 audio CODEC
>
> This seems to be the M6 (2405 aka 'V1')?
Yes, correct. This patch set is for the original M6 board. V1 if you like.

> Because there is now also a M6V2 (2603), which uses an ES8389 CODEC:
> https://www.friendlyelec.com/index.php?route=product/product&path=69&product_id=319
I did notice there was a new version, but I hadn't given it much thought.

> Is it useful to already take the 2 M6 variants into account with this patch set?
Yes, I think you are right.

How about this setup:
rk3588s-nanopi-m6.dtsi
rk3588s-nanopi-m6v1.dts
rk3588s-nanopi-m6v2.dts
This mimics the setup for the R6 series boards with rk3588s-nanopi-r6.dtsi
and rk3588s-nanopi-r6[cs].dts.

Note that I will not make the v2 board part of this patchset since I
am unable to
test it. But as you said we can take it into account now.

If you have no objections I will integrate this setup into versions 2
of this patch set.
Thanks for the feedback!

> https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6#Schematic.2C_PCB_CAD_File
> https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6V2#Schematic.2C_PCB_CAD_File
I did a quick comparison of the schematics and noticed the following
differences:
* New CODEC; ES8389
* A new "User" button connected to a gpio line.
* Different USB 2.0 hub: CH334P (may not be relevant for DT)
* Different USB PD power solution (not relevant for DT)


best regards,
Joachim Eastwood

