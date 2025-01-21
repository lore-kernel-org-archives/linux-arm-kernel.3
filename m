Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157C0C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 10:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sr0sCOcX7uHKMssv62r3hF336fh80SYkMIuY/VEN81w=; b=VQkYR8ZOav0L0E4AFCWPL0yiUd
	ZOi5OmLxqAoN6FXILTMs1BdZ0qFHOfgkAWw6K0aLcZAKk7tPh5XbNqMNQ7ZHYombZoCuTRdmzFwSu
	5AciR3VGMCUMvkqsOqorZkYCGTc7UdtY2vvlOy1LVUtSLleI+9HHle0buFt4NxO/kCZXRlYzJZGX+
	P2QPLchX3LViVIJdJXugYyCIdoJwuuLfW/U3EhN1H5fdSwaLFkin1HFLJ1mRkN1d7UJiTjIpAA4qI
	8v8/XYj53QP5a+ekr+ZwpcgU07o9pqdZLbwloIGeUat2ip3bUi7o7rvfd1ZKln2I+0GpwbqYpuV5G
	/MSDN8Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBX6-00000007aLg-2pbw;
	Tue, 21 Jan 2025 10:30:56 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBV8-00000007Zop-173G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:28:56 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so1082109866b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 02:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1737455332; x=1738060132; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sr0sCOcX7uHKMssv62r3hF336fh80SYkMIuY/VEN81w=;
        b=puGjKL1LUYqrtlCd4g9re7HjEDjXZ8sIwE9IJty/YhwFSyEvUlDbDYtt0Mm/pZkCeI
         sIpLhA3/6J7WzRuIgxmIYA4bIw2xUhnDbYqrNO2ClcySJ7T1Q3ezS7sNvJHQ9Mih4U3P
         vkvqCkM84m92mg8tZlXC4s5lS2sQgWHWP1fGGAs0llgxFc+3+g6I7ALbK0XikVc5kye6
         g+igfTic/bw8pTjZ8QRruvE2I+x95GfFcT8BxkFcz+C4JMItmmVjuEl0ElyrApaOe4W6
         qdmud53Vuk58LOw9cs/gbqdECL9BoeCR0QiEYCekiHTw8GEivqEPKp3NB6rNmnU2ktKG
         ZidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455332; x=1738060132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sr0sCOcX7uHKMssv62r3hF336fh80SYkMIuY/VEN81w=;
        b=uAHrNs22sZN3YTqU+4e8bXTWYb+Y141uSant2l/GehxncUS+7YG/eqt3AFdpoOGnz+
         qg1wBcVFeB/5NnCDVe03r6JqEE1WJzyse0vftlxQ+JVPbVUyYA0IoUuv/iKCbr/gzDNq
         x9eDoXkhXFJpNQMvkc/nBRaZUBc2c9jDZRDKAicvcmc48u7Vmiyw+Fo8mkuARH3Aemr5
         ca0nXSHF4tvOGW2yWHACioZBTr29SQ2OMLqlZdLr0GKPqBjjLGdS7irIFa2pqjkVtbbB
         w608OLnPK5pGZfvvD7pjm7uxRG3E8bQgNPpuzDh3Y4VlArbOojWErqnqPDbHs6LV6Ux2
         VRHA==
X-Gm-Message-State: AOJu0YzmOWiloOuX6s5n+3RTHYz4q6ugnxE+wAGBi1uGnX9MCnNa8ojh
	MVr69SkbJ3oD6k1DR6/IeY1kW6UJq5gzBDArP/SfQTvl7R32rmL+cvkMUlhQagKLd5CAmllAkXi
	K56sudld2u3D1vK47gqNvuU1MwIUNj88CNXlcDw==
X-Gm-Gg: ASbGncuzbse5WSLMwwcNEck71xS5f2LPLuH0L0zq7KlFDkWEOv8Fv7BZjDCQc7EGMJ+
	kuKbrL+MW2r+a2x7ClOtoGdpwnQWtiv1T7IcG/imw4bMRyDY=
X-Google-Smtp-Source: AGHT+IEcsLPaoNoghItPAJ5Bi0M9AGwAezLgRPxEZ2srqEeLZMEDrHzM4WtrrsNk9nSAiLHw2juwxr/qVGZCXKm8D4Q=
X-Received: by 2002:a17:906:7953:b0:aa6:6885:e2fa with SMTP id
 a640c23a62f3a-ab38b26f4acmr1382334866b.14.1737455332458; Tue, 21 Jan 2025
 02:28:52 -0800 (PST)
MIME-Version: 1.0
References: <20250121092255.3108495-1-lukasz.czechowski@thaumatec.com>
 <20250121092255.3108495-3-lukasz.czechowski@thaumatec.com> <2be46f44-6c81-417b-b0b9-7325cb0f7c10@cherry.de>
In-Reply-To: <2be46f44-6c81-417b-b0b9-7325cb0f7c10@cherry.de>
From: =?UTF-8?Q?=C5=81ukasz_Czechowski?= <lukasz.czechowski@thaumatec.com>
Date: Tue, 21 Jan 2025 11:28:41 +0100
X-Gm-Features: AbW1kvbBRHTdZcGUKzENwwtfueprpEt6a9kFTwxCgS9D6yxja5shI7FMHmjn2FI
Message-ID: <CABd623tHh07Nb7KVjS_GJ5OqfjF4kOUKsSKNKA_HcJbLG=WBiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Disable DMA for uart5 on px30-ringneck
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_022854_564589_0D55BCEF 
X-CRM114-Status: GOOD (  27.58  )
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

Hi Quentin,

> On 1/21/25 10:41 AM, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>
> Hi Lukasz,
>
> On 1/21/25 10:22 AM, Lukasz Czechowski wrote:
> > UART controllers without flow control seem to behave unstable
> > in case DMA is enabled. The issues were indicated in the message:
> > https://lore.kernel.org/linux-arm-kernel/CAMdYzYpXtMocCtCpZLU_xuWmOp2Ja_v0Aj0e6YFNRA-yV7u14g@mail.gmail.com/
> > In case of PX30-uQ7 Ringneck SoM, it was noticed that after couple
> > of hours of UART communication, the CPU stall was occurring,
> > leading to the system becoming unresponsive.
> > After disabling the DMA, extensive UART communication tests for
> > up to two weeks were performed, and no issues were further
> > observed.
> > The flow control pins for uart5 are not available on PX30-uQ7
> > Ringneck, as configured by pinctrl-0, so the DMA nodes were
> > removed on SoM dtsi.
> >
>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
>
> We should backport this to stable releases too, so please follow the
> instructions from here:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#select-the-recipients-for-your-patch
>
> Essentially:
>
> Cc: stable@vger.kernel.org
>
> in the commit log and we'll need a
>
> Fixes: <commit hash>
>
> trailer as well with the commit hash of the commit introducing the issue
> (likely the one defining uart5 for Ringneck for us).
>
> Considering that UART0 CTS and RTS are routed to Q7 header but only
> usable when Haikou exposes UART0 on the DB9 connector (via the SW2
> switch), which is NOT the default state (and in any case not supported
> by our current device tree), I believe we should make the same change to
> the uart0 node in haikou dts for Ringneck. What do you think? Can you
> send another patch for that one?

It seems that in case of uart0, that is configured as kernel console, the DMA
is not used by the kernel:
https://lore.kernel.org/linux-serial/20200217114016.49856-7-andriy.shevchenko@linux.intel.com/
Which is likely why the issue was not observed so far. However it might be
good to do the same change to be on the safe side.
Should I extend this patch series with the fix for the Haikou device tree then,
or create a new one?

>
> Thanks!
> Quentin

Best Regards,
Lukasz

