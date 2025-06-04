Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF704C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 09:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsYVl2hdQ/guAvtcE43mR4izrkYEpK8YkARVgLSUAJs=; b=nM7w6f82/vfLQeX4S68Ysd9yvG
	JM+juFIxVZza64YnHTxSWlq4O8UFAYW4Cr9Wjx5wbxzzzPH/mFjr0GDOgz/4C1QO1PoCiCH1IQVLZ
	xsYynEaAFHtweVr7+jGu3bqJBcGgtHWu4coqI5hFW7M3PO35WW84l18KjQWAa5HXsLBQV4icsc4eg
	02ccpYLm2P66GI/DYYG1I7ksGDKfj2zJmLlD+a7hh99C5O2PV7hhlJtoOauAr6G4rcO/Tcx1sq9tM
	Tgcj497IL15bcTq6gDB7fksFwryAtcI26pAtvTxxNW5VFTwxhCYDvF2lVvROoBQBFWesFs4bsIr0B
	YSSMeLow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkOe-0000000D1va-16DG;
	Wed, 04 Jun 2025 09:26:56 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMkMX-0000000D1kj-2yqU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 09:24:46 +0000
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6fafb6899c2so1835666d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 02:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749029083; x=1749633883;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsYVl2hdQ/guAvtcE43mR4izrkYEpK8YkARVgLSUAJs=;
        b=LVeHX29s5Vmhg6oPbWZlxWN5lx8riFvqoS5xYVut3BhqZhOgie+KDt63R439XVAvCs
         kKvjMvsfiu75reirdWARUCoK+xUmV14X33xXvAF/KKQ5MsKseEieBu1o3dhAI27kHfGO
         1w/tGg65cbt1ltHYPc4I5sr18538rjxU7R1/m4FvjRIZAzefAZEEiNR6876zcR3nnMGk
         Q9Bse2MK/n8l/Ys7tD2BrKUPXkTEu61JYtkhM7/+kbFjLiUuQF/rhbvFoifNNFYajc7V
         kCB3H3J4P2GfRCWQOWQ6j5BzaWfn5ngBMfNzgnmyh+XErhUbZD5A9WklxnDjFYkLP2PO
         pSxA==
X-Gm-Message-State: AOJu0YwgkUy9SzW/ntuyiZaKEcj81M2Cc6fz9Un2rIcLnxvZuQvFlB9P
	YkmW2KIFK68T7tObkXb1/JI1SZ0Bk+i0sdd9QzOrM8eti5xCJI0Bp6qE/gpJnEgd
X-Gm-Gg: ASbGncsEGZjshpdOBy42E82ZwiKJ2XVIn/nhn8z7mD7WZvEeLx9GmtOeSoBEkdEwAhc
	MKd5mmT9efrjnLgGA6Z7PWVIy8e055/XAgdhhVDOJX4k8VYghCcemDyG6sDGi/dlS2Veyp6bysz
	LKAqLywjRA20Lw9uXhWnD5TBv3Cc4pBANBATRAj6ePfeqta6MufAMq1EptgJ8NMkCMNCp0omYG+
	Z0zTjcZfDHeTJNLGi4JsRfjDGdHC6JK581cbBZqEuDQQLXjDGQuttvAlJNjhhHhZO5XRDBtt2ri
	XkpYKj48i1TpTS53Sla3XKlN4Glq4Xladu44a27ym60R47SbIAo9BCrnrTTHyLU/1d9E0P1JNzp
	XR+T+V3H0zhzcJTCs5g==
X-Google-Smtp-Source: AGHT+IFhBhEuPrqGI1jf05i060TIjBsxuTXPKJTJpP0SA/NZIgmD9AXYwpXSZEgJ3jrv4Xjz25UIAQ==
X-Received: by 2002:a0c:f10c:0:b0:6fa:cd5e:f4 with SMTP id 6a1803df08f44-6faeedf0d60mr66982226d6.6.1749029082688;
        Wed, 04 Jun 2025 02:24:42 -0700 (PDT)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0e3258sm1011376685a.12.2025.06.04.02.24.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:24:42 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4772f48f516so7581741cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Jun 2025 02:24:41 -0700 (PDT)
X-Received: by 2002:a05:6102:b08:b0:4df:9aed:3114 with SMTP id
 ada2fe7eead31-4e73612362amr4782752137.8.1749029071180; Wed, 04 Jun 2025
 02:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org> <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250530225504.55042-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Jun 2025 11:24:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>
X-Gm-Features: AX0GCFtylgjPOc_MFC3oHf3t5Dztq8GFmxVQy74EOxxbbt3KzH-GIiIRW1TtAWg
Message-ID: <CAMuHMdUVYzaUyP=OUOST8SK66_BpubOh0WCXcaVWBy=RxBrquA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a779g3: Describe split PCIe
 clock on V4H Sparrow Hawk
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_022445_745947_4105A256 
X-CRM114-Status: GOOD (  20.64  )
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

On Sat, 31 May 2025 at 00:55, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The V4H Sparrow Hawk board supplies PCIe controller input clock and PCIe
> bus clock from separate outputs of Renesas 9FGV0441 clock generator chip.
> Describe this split bus configuration in the board DT. The topology looks
> as follows:
>
>  ____________                    _____________
> | R-Car PCIe |                  | PCIe device |
> |            |                  |             |
> |    PCIe RX<|==================|>PCIe TX     |
> |    PCIe TX<|==================|>PCIe RX     |
> |            |                  |             |
> |   PCIe CLK<|======..  ..======|>PCIe CLK    |
> '------------'      ||  ||      '-------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|======''  ||
> |   CLK DIF1<|==========''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> V2: Use pciec0_rp/pciec1_rp phandles to refer to root port moved to core r8a779g0.dtsi

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I understand this has a hard dependency on [PATCH v2 1/3] (and on
enabling CONFIG_PCI_PWRCTRL_SLOT), so I cannot apply this before that
patch is upstream?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

