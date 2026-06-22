Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574F8CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbT9MfaCjQT3Ym3J/HtdCmcThbQYXtUBVcRrZ9h8JX8=; b=QeYk4T8PAFdiouk1QuKa8ly0XC
	NB+o6xkDuFecHU8sgqIw3h+f8Yi88bg6x7z4qQd39NPkqAOeSP1HCOdaRcC0xG2A6mHaf1OtvF8T1
	Vxm1b09judvGcydsICm3dXYcoI27OrsI7eQqtsc6f7h1QwGoGtK24I2WGn4D7U9K62mlr7Wqw77A5
	iJ7rFLYh8cvdeJ5x3ool8hIMbZzdEMDG1xKoIo+M2b1TThXXaocyhNvUNuCEM5yv8x0Z4BkmhEES8
	GBU7RttOpF/U6FjLhVndIK7PKhHbGibXxGiwvD439ZV0oqAPU3o6hJHTl3Ql0fHxr1ktxYtmTwYbh
	OLZwPcLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbzw-00000004qAW-1dh6;
	Mon, 22 Jun 2026 10:35:24 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbzt-00000004qAA-2aXC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 10:35:23 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-59cd803792aso2673176e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 03:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782124520; x=1782729320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CbT9MfaCjQT3Ym3J/HtdCmcThbQYXtUBVcRrZ9h8JX8=;
        b=GGSjowN9KsuWeALIFzH8jdr0bgPoo35svx3D3vlak5vaZyYwgyTySarILUl9Bj9Ku5
         Ytxyg+vcYz9a9u4gZYCK4AGyM/ur3cGLkR8tBiawqJy4hyyXSmwNUozkldGbIU7pQPQP
         2gq61dvHnVoAN90BDhpXGIhRb10EEjFqz3vRkVrDUga8nX1QK4ZLHV1h0g2IvB+aOiWR
         YKg9DJ7zrutfX/BBoWxfZG1PeTQ7Owh3Ovx99kQtYR8tvJDKDYnMPLuZhhfyrsRG099j
         7KK7yInR4CEb0TeisObeTrsHeDBdF8/SxeWQPqnvvYqCaKCAD7FnFkb2w7wTYBxFE6md
         yM0w==
X-Gm-Message-State: AOJu0YzZ8af5XJgU9fP+vIPhNuUcoeoVVlqq13XxFFCg51ZfERq0xo0j
	NOLb7qP+7aWpO3sPujcNIc8O3x1va3qgmjpHnNBCfPtdqP4uPzncgLjWJEpuZnCv
X-Gm-Gg: AfdE7cn2EzUyJjWJB53VSkBcxdfhYJeF4MrB2IV2o9/pYLOXSFNmsIsPRXqcO7wtWW7
	YteM/x5AYjbhKw4jOQNkgDaRKQc7wgnOaEadLF0LKG6PU1MQJPE43I/IFXVMbBJSh+PNeCNO6F5
	4vRX3YRXEz0918Q9q+hwCVqpe/ZeZfFo1M/AznV5WUVZLEqZRx8qQyfNCoPNOltWYlnvjVKRMMv
	HUDvgrxunNYLIYZEpK6KX8pZ/uqPJtTTw23Nm+i5FYXaxcnIJIAz/9IN+JA4Z6+rOc8IiOn82za
	5df7xHCUTUMS1V1epoPnyuFTjR9womDfWR7TZLr+gMy4wd4KzoFgBFpiNFEADSvVUdZcWYh+Eha
	5kGQsW9fL4ccEvBx7aKEL+6kJOz/vJKLvu/Mgenp2Bmenp6Vsmkk+opBlaJlxWtvbRCuLoQEsvz
	IcFehnbGQTW1OgoAuE+AvZsNAzUHrIq7CeX4YsdotLeJZMX+g4awzq8w==
X-Received: by 2002:a05:6122:3384:b0:5ab:26f:4a42 with SMTP id 71dfb90a1353d-5bbee170fb9mr6934454e0c.0.1782124520251;
        Mon, 22 Jun 2026 03:35:20 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb81ed48sm6188884e0c.5.2026.06.22.03.35.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:35:19 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-59c2a81ca92so2670996e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 03:35:19 -0700 (PDT)
X-Received: by 2002:a05:6102:324c:20b0:729:4c16:b4f4 with SMTP id
 ada2fe7eead31-72a767f94a8mr4675989137.2.1782124519443; Mon, 22 Jun 2026
 03:35:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260621025052.406507-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Jun 2026 12:35:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
X-Gm-Features: AVVi8Cfb4mv2QoVmKeKaT0JRkwbOlUFA4xPaWe_fn-8CnsZR_T46Ke01ntwYiSg
Message-ID: <CAMuHMdUEPR0xWXRwLjBt5sF7i4HxcDLHCQGmc=gGvFmHRDv-Jw@mail.gmail.com>
Subject: Re: [PATCH 1/9] arm64: dts: renesas: r8a774a1: Add soc: label to soc node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_033521_886869_6231D5A5 
X-CRM114-Status: GOOD (  18.05  )
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

Hi Marek,

On Sun, 21 Jun 2026 at 04:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add soc: label to the /soc {} node to align the DT with r8a77951.dtsi
> which already has that soc: label. The soc: label is useful in U-Boot
> where it is used in U-Boot extras DT fragments.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

For the whole series:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3, squashed into a single
commit. Unfortunately there is no cover letter, so I will have to add
all nine Link-tags.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

