Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABAAC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 07:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UPXygViugK2qDdRyZqMS+7O5LAWGbwutgev5XJq8gb8=; b=XP7wcD/UmWDVA4XBPRlwV2LPNL
	kUJQ/KXHXX0YnvuqTfROEMBrKP0ab0UoCwlQ6vjB7APaWaHJlZ/oi3hgo3Coz8daAbQqqBHpcu9hm
	cuxjO1VsKVqZCVjc58Gw+n8C7PI9do8CZ8D9gkmbXIuGajy+3bgPT7HVSv6nAq+YTYwy0Kkr0L8/J
	RTRxCuatFKRECSAM1MfQTTlF6tk0VTRgq1PdcJPKtKEAFCj4KyzvoXW1foq+iswn8JKCWj2vSkqGN
	WTcO89fjYfLAfuLZphm04WgllQ7TrNt4XVcQwd1hoecPJ870NEMHrtQTu6TXGV5z1lAY5EXuyzysv
	mYTngg2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN58e-0000000ExIc-3gBp;
	Thu, 05 Jun 2025 07:35:48 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN56O-0000000Ex58-2lR9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 07:33:32 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87df3dffe63so198968241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 00:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749108802; x=1749713602;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPXygViugK2qDdRyZqMS+7O5LAWGbwutgev5XJq8gb8=;
        b=QZIDLcBvod94HrFxVHExvdqBf7EmXhA9Ixlby0nV8ZmZfKbUFqcgKG6VQJN3aj1dlg
         xOlyF3aL3Q8PazNWsOD4HcAxYsXOI/GuAJlonbON7I6sTfPxJxO10I9LDrXfCpHYFLvN
         gCDgWchB0mpAdY7uXFcroU/3ql+w1Cc1c/B8WxlK5Ek75sz5dyWP9RhkpMzm2KOkxhtC
         cnocZ6jzj76f2vUuVw8BjZf3bIr1xN2oxkuKp0y5vQkudkpzbEiFYCultCeJDRJyIGE0
         zhIEZgwBiNnLzT6x1UuaDk+Zxk+NIvVPeRgKCIq8jZaMAqgNcfQuo5w401eOOfuE+TwS
         J30Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBv91YDOOLcVp3/8oZI50MP6RXwXCyLFKnowtcBnXrTBx9rDAO7spoVNC9gkxUOWQc7ktabwNAXabc19dxjqTG@lists.infradead.org
X-Gm-Message-State: AOJu0YxjG1fh4FlNwqgn+0pzyK47Q2yqoI7HfsFa4Ub78dacufvLozw1
	hch3+5uHtOOXTWV+FTd127fTdeq4O4k3LGrSzHoRwlCZ+m+gIcLNE6nhNcJRuBlt
X-Gm-Gg: ASbGnct6rHfqIgOD0XhIzTGy5iJYjXlobsrKk5f5cjyksFNyWHDbJKRzHi/sxQKQUsT
	PymjEb1hrq2n64P4aVZgFA77YkZU7uMQiYEyk+3Rm44Nb4YtMKVU1kzGY9Xd8KizCeScN0+q0Jh
	DXeNsUfCAkxgZxggjcFIR2Ql8JomaxaDuFwWyVzF+zH2ToPIcHlQIKgJm2mXz3pnUbO0+j9mJU7
	jyzPE5TcD6SuNCUoNzXlpIY8V07DUB/6UP4Izi89Qq8QOsMPfK6Ywv1WnUuWdACJcOugH5K24M0
	kL2DRwCA1mheSmoc5bEkx11pAlpzsjvevWoRUq3hBlSD+kL2fYoiYlkVgxCKLhANHv/FaruZFQP
	pcIje4S31tGcTKw==
X-Google-Smtp-Source: AGHT+IGjhQMjeUOYADvCsJEho44KIksvC8QsiPx+pFbGBxAgmT1okRczvgarKwghkmZfpQ/J4E5ovA==
X-Received: by 2002:a05:6102:2acf:b0:4e5:9323:d2b9 with SMTP id ada2fe7eead31-4e746ce3628mr4953324137.2.1749108802252;
        Thu, 05 Jun 2025 00:33:22 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87eaf07ca07sm1242570241.0.2025.06.05.00.33.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 00:33:21 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e7374f2dc1so207528137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 00:33:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgNkAKqRunzwa3e+fJhe2yRaQP4h/gbeD45ZGlzIleu4ObgG3c92Xdf1lhgDhq0e3AQK59WLZC6jIjS7xWaoyf@lists.infradead.org
X-Received: by 2002:a05:6102:1496:b0:4bc:82f:b4e0 with SMTP id
 ada2fe7eead31-4e746e4976fmr4848002137.22.1749108801250; Thu, 05 Jun 2025
 00:33:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
 <20250530225504.55042-3-marek.vasut+renesas@mailbox.org> <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>
 <egtsvxsfc5c2s4hrwucsqk3s5dv7xsi6ghrnf6jd3mvf3zvskb@z7hvehbd33t5>
In-Reply-To: <egtsvxsfc5c2s4hrwucsqk3s5dv7xsi6ghrnf6jd3mvf3zvskb@z7hvehbd33t5>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Jun 2025 09:33:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEmGk0iE0vroGRWOwsK3+EFpbqzO-OH3aVDQTud3wVtQ@mail.gmail.com>
X-Gm-Features: AX0GCFtG6IELptLOfKa-AavRTgQeGCljZvKI3BSZXgMtp-NgzVLc1G-6_2R8iug
Message-ID: <CAMuHMdWEmGk0iE0vroGRWOwsK3+EFpbqzO-OH3aVDQTud3wVtQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a779g3: Describe split PCIe
 clock on V4H Sparrow Hawk
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_003328_707904_6FE2FA13 
X-CRM114-Status: GOOD (  31.86  )
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

Hi Mani,

On Wed, 4 Jun 2025 at 19:31, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
> On Wed, Jun 04, 2025 at 11:24:17AM +0200, Geert Uytterhoeven wrote:
> > On Sat, 31 May 2025 at 00:55, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> > > The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
> > > bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
> > > Describe this split bus configuration in the board DT. The topology looks
> > > as follows:
> > >
> > >  ____________                    _____________
> > > | R-Car PCIe |                  | PCIe device |
> > > |            |                  |             |
> > > |    PCIe RX<|==================|>PCIe TX     |
> > > |    PCIe TX<|==================|>PCIe RX     |
> > > |            |                  |             |
> > > |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> > > '------------'      ||  ||      '-------------'
> > >                     ||  ||
> > >  ____________       ||  ||
> > > |  9FGV0441  |      ||  ||
> > > |            |      ||  ||
> > > |   CLK DIF0<|======''  ||
> > > |   CLK DIF1<|==========''
> > > |   CLK DIF2<|
> > > |   CLK DIF3<|
> > > '------------'
> > >
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> > > V2: Use pciec0_rp/pciec1_rp phandles to refer to root port moved to core r8a779g0.dtsi
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I understand this has a hard dependency on [PATCH v2 1/3] (and on
> > enabling CONFIG_PCI_PWRCTRL_SLOT), so I cannot apply this before that
> > patch is upstream?
>
> TBH, this patch is describing the binding properly. So even though the driver
> change is necessary to make the device functional, I don't see it as a hard
> dependency. But since people care about functionality, if both driver and DTS
> changes go into the same release, it should be fine IMO.

Applying the DTS change without the driver change would introduce a
regression in my tree.  While the regression would be fixed in linux-next,
it would still hurt bisectability.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

