Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47272C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUPHvEQr5af6UuCYWSzNmMgziLtTTDpfYmDwyTH4f1c=; b=hRmASrKzP23UwgsNBBLIRTDVvR
	wkN5ErITUlPb71NnHu30vxeCsDqtzEfhb/cH2jyzAbTzZ4ChnyM5R//Cn3TIB1KcXpvY4iCiaerS8
	HORsnc5Zpeb/hEi/OwY3IQ/nrlmgIfSonAfouZfrEmk4FF/LUJ6cCFY89Iq6OVTNjCNs3dMxNd5Ya
	ozmz7KZBaDTzoJFOi14B/LS5buufTX8ymUBUzpufWVFrejSeD5z1tgh5rPpGQf8gtMGOy84NQrY45
	2TMJLxj2VGjMgUZfSKs9nSYo9Scn9ldxVZ4yJzqyI8d7wOzUJ+/ZSHALpDZ8OwXRUPq1/r8NvkFdV
	aCQSmEOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn2-0000000AX3c-1rLw;
	Wed, 23 Apr 2025 13:05:24 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WdY-0000000A1rZ-1CYz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:43:25 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1809819e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:43:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401402; x=1746006202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUPHvEQr5af6UuCYWSzNmMgziLtTTDpfYmDwyTH4f1c=;
        b=IFHKDX1mGgX9+AcyzLosQCkRmavK6KoBZIL2TL/md2oY58OdQQYeiymLGHZZ3To3s8
         YszDFx3GST2hl+kddicdmhYW+8/ILs6q3ASJYA2Ga/xzX/qsF3/de30B8pf6QnbZl/jJ
         JBlpX7gA2F9bN+C1O6rrmkz2HqbvTq9mJaEAf8RVvFoVedL2aWkb7+yr+LZRVpxbFGnF
         /Rz6HCNjh80pPkIO8wBc/7KR9pHNYXG5qcf+e/pQVGS8w4l5jHgxOzLA2/bQK6bjPn46
         aM3O89/SuvjgxAIX3pA8hMI6zOj9I0UWK7RgA9eUR+SV4e9tcf12bajEz1OeIq6PzUtI
         zhIA==
X-Gm-Message-State: AOJu0Yy29UPqXnEQVyYWMPajb9EO1+N+z2ovS+ja2UslDMgsMjjqlrgl
	S4uSkZ/GrW74ilVIuo+PL3LCGJnPrzxFw3vN38k09LKyiUMiy0QqpJQOUPLc3+M=
X-Gm-Gg: ASbGnctp0PaJlODmu5D5ijhdA43vuypKjG2Dzpk4UBP+Y2IT+4Hk0Vb3Jzjh4fsxF3o
	OdUP0fG7fkkSN5ugCUiFiwVznt91eHlaQM6yTbYnVwPzJKWnIwb0QHIwB61ZwZxrQZFZwKxK3nm
	egDTEqnbiE3Ehjg+YRfvg93EuZbGp5SN2utVJvo6Hv0rJbSEfaQkXBVHvrfLmTpHJFIklPdHHME
	AJgbezTebNydv5KgLbGaoFcxdiWhiC7erLd2e9LssVhdjhMt77GKahzZ8MAWVuKSOZcrU9drm1b
	ua/u8LaD9IdjjLZ+hIHc5cUBnum04zdWMsmNmLrdehSzY71an6/+DKqaBusUSZ71aKk2gG1zwBi
	p1/w=
X-Google-Smtp-Source: AGHT+IEnYehpW3xQPMbELXb5nsfd5Nhg5oem08Tk1QNq88OQLMPwT735Uq5JVH7rjZDm5tmuVVeomg==
X-Received: by 2002:a05:6122:8283:b0:527:67da:74ee with SMTP id 71dfb90a1353d-529254100c0mr13835387e0c.5.1745401402190;
        Wed, 23 Apr 2025 02:43:22 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52922c10950sm2272351e0c.15.2025.04.23.02.43.20
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 02:43:20 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b9d1f729eso2396476241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 02:43:20 -0700 (PDT)
X-Received: by 2002:a05:6102:3139:b0:4c1:c10d:cf65 with SMTP id
 ada2fe7eead31-4cb80232571mr11121634137.25.1745401399791; Wed, 23 Apr 2025
 02:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250420173829.200553-1-marek.vasut+renesas@mailbox.org> <20250420173829.200553-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250420173829.200553-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 11:43:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUahR_J9yHuLKVzZZzBJpC2ax-H+cBFXCPHVMN+_-ZNFQ@mail.gmail.com>
X-Gm-Features: ATxdqUFK-chPyKNsS2kRTD2K58MG9RMy218bkOrxSuRBq2YrjuvKQVL8N8mFPwA
Message-ID: <CAMuHMdUahR_J9yHuLKVzZZzBJpC2ax-H+cBFXCPHVMN+_-ZNFQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: soc: renesas: Document Retronix R-Car
 V4H Sparrow Hawk board support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_024324_329119_C8259846 
X-CRM114-Status: GOOD (  14.29  )
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

On Sun, 20 Apr 2025 at 19:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document Retronix R-Car V4H Sparrow Hawk board based on Renesas R-Car V4H=
 ES3.0
> (R8A779G3) SoC. This is a single-board computer with single gigabit ether=
net,
> DSI-to-eDP bridge, DSI and two CSI2 interfaces, audio codec, two CANFD po=
rts,
> micro SD card slot, USB PD supply, USB 3.0 ports, M.2 Key-M slot for NVMe=
 SSD,
> debug UART and JTAG.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

