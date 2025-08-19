Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35F3CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 11:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJlWkFNwc4UI7xTpJnUAjxLWy6ein9QK+nD83rWRU2U=; b=2pm23VoC1e0PwPujgWeQJpZ8Wd
	e8DOiBCMvFL4El8JzwL8267Xgg6McLJfM4Q9W7i7qP5wFMBwiCToN/9b7Rm3yZJpFyO4RFdin71eD
	RUcB5t2I9qu7S1Cxz2ESKMYpwrBjvkbEiutReogJ7WOxrtXCC0+PNfOFXjUNDDS3vOWkVWClwiDUj
	K+fbNbQJ2F9bFUcgqjhDdVmOS7xLH4MIoD1LGLJYoocusDyRaSNpRo0rkS/Vtv9oPxlV8Z7+UYxHy
	JUcs/+utxFbqq3xbF5UWx34l7hOcQhcPIrIbou4XVA1ViHmt1DnN/j4uMXT3QW6m47uhqhSMn50k6
	cWtid5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKsw-0000000ALWO-3cOH;
	Tue, 19 Aug 2025 11:52:14 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoJCn-0000000A4NV-2ExJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 10:04:38 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-53b174dbfceso1758520e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597876; x=1756202676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJlWkFNwc4UI7xTpJnUAjxLWy6ein9QK+nD83rWRU2U=;
        b=lFmFhuQIacE23/NfgdB6YdZU5L5+z5+IvgySBRqgvF/oFh8HTUFHRd8kWAokZfA3pa
         TTnwz6npq9JfS2avw7RZC2a6FkfqFzEt2WApxI0ncC+yx8J2bSGgorY01TT0d/nlrcB6
         NzIivf+deQ1WiGesGS1et2t7dKh8UufaeFgYhP9BehvNwBFhiF1G2jUwsu5GKHXJyXL2
         Fo9tMaPkQJPmjZJyPv6EWC4Q6skFInzWGOhKba4n/Sj/jlUrTVYcKKx22D92wqAbKLSB
         /Vu2LqM86hP0BxfZHXqhdQSoAvuPXy/y64k0alUyOGjAjnlQe27OHdYmKwKHG/lTXcEL
         FvTw==
X-Gm-Message-State: AOJu0YwLZYWw89tgSRHKdoAagLy3iFd2a+AygdJ1xGx/o8fCzUdJ0YOg
	TBJO+YOjS1c0HvCEJZ6ySjP4IjGJntvhJaFCjtMCDCe05YGZFEmXfpvDFbSM0VeA
X-Gm-Gg: ASbGncvTluALadQTlB9IR8b532VDwyJN6XY41YULi1uLrNHgekgq0AFSkIMDLa1bHJC
	RTcHRkZro6nsW7HQEOsdw/RaXvdMK+IIBgU4rZtw9gg1zF02U41OFy7k4IrAy997EZH2CkuVf0p
	ZsCzCwuT6vm+f1NWa3S8qtSHFR3UMTww2iKKBLQHDZzaF8MXCbEw0HIOuG9BrV8SQcuEb5uu9MD
	cBlM/T6JIZqxVZXFUzAAHZvdrlOXbi2jtLhmAUQd2AeB6kM32G4k7sm+i3TW3RxtAW0gWF2c/43
	ojo+mR5bnF9dxXEDEFKZNlFK0+88/jGuIkIsgFyLS/D/phBBmvX6wAO/ZwGtkNkJ/Pn+38AJ3Mh
	V5Uhl9Bleq04TBxAb/i5SKsnetFWUIyB5lD+3zZ2NOgT0HogwHLE3YqqoVpTf
X-Google-Smtp-Source: AGHT+IG9n+QhgmJ1BFKYDuRxeRFfp5PeL7McEBliLfeH6dzAS3UjWfGw1l/gApZgUjEaB6obWxmuKA==
X-Received: by 2002:a05:6122:65a5:b0:539:52d1:1f65 with SMTP id 71dfb90a1353d-53b5d43af57mr669492e0c.9.1755597876113;
        Tue, 19 Aug 2025 03:04:36 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd99bfcsm2494430e0c.9.2025.08.19.03.04.35
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 03:04:35 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-89018ea5625so1313383241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 03:04:35 -0700 (PDT)
X-Received: by 2002:a05:6102:3e89:b0:4f9:d929:8558 with SMTP id
 ada2fe7eead31-51921bf488dmr645140137.10.1755597875622; Tue, 19 Aug 2025
 03:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250727235905.290427-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250727235905.290427-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Aug 2025 12:04:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuMQ8gk7BfqS3_ckNvWuB2ofyWmSuW9xcscDFmKxGrhQ@mail.gmail.com>
X-Gm-Features: Ac12FXzpimHfkylZhKiWWGzMW_6TYqgkeSKP6CpQ8wJpP5FhlHv8WCtrU9fD57U
Message-ID: <CAMuHMdVuMQ8gk7BfqS3_ckNvWuB2ofyWmSuW9xcscDFmKxGrhQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779g3: Invert microSD voltage
 selector on Retronix R-Car V4H Sparrow Hawk EVTB1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_030437_580655_8B649201 
X-CRM114-Status: GOOD (  19.72  )
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

On Mon, 28 Jul 2025 at 01:59, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Invert the polarity of microSD voltage selector on Retronix R-Car V4H
> Sparrow Hawk board. The voltage selector was not populated on prototype
> EVTA1 boards, and is implemented slightly different on EVTB1 boards. As
> the EVTA1 boards are from a limited run and generally not available,
> update the DT to make it compatible with EVTB1 microSD voltage selector.
>
> Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

