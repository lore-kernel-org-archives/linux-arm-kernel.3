Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4C8F013EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 08:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jK5sk+em838IX5DcxpH0UZ4b1Tfc1Aw/r3qavdS0U7Y=; b=hn6OHfXMK2M10dIeeejbe+G/Gi
	sV1zRvyhvBLVm8IxtqliqNPNsoCkJC94cWzJy3zAla92b+PWjWTRoTYaDjQNY0xr6zNU4wW9cYFBR
	Ss3frI93CUjI7kS30hL3E7egstU+N039pFr+Qchnhe0JpMY+6+7Dm2h+MB6gHHY0CcrFlfoGK5YaW
	TOnetRUqfc68ytTzrF7YT1BoFzEi04EK1ANr2EGcqMPYpQWBNUVpLaTwwfGwldPkOU2K1q9ymV1vn
	hHakqJSN30LsSr85J7akEvqvcVO72Zyl8O4kuvy0Zd1AiXvndBMT8l+zSJGIM5r0lA2YSJ9i0FjY6
	TCMzI/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23lr-00000003aPQ-0BJa;
	Mon, 16 Mar 2026 08:57:55 +0000
Received: from mail-ua1-f50.google.com ([209.85.222.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w23lo-00000003aOs-476o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 08:57:54 +0000
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94dd7178d63so2614185241.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651471; x=1774256271;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jK5sk+em838IX5DcxpH0UZ4b1Tfc1Aw/r3qavdS0U7Y=;
        b=l5evcNyKucjpJqFYgy3uGCjGa1VdEs9fcMBPywYVVBJJF6ZoC2PboWcWroNNfSJcny
         UTASjt8jJJee7no9uMl07hwlttqnYcdaV7rnsUXReNhs/4/3zhyxXPhf7FNGRk8INHZK
         CCDHEDjiue3/lRtcRfEVFxOXuhLQvpysqquPLtxvw4kHRyJNBAQtE/cUW8csVt4eZfgE
         Qdf3BJQjnValucL1IWuIMXy9I+lK+qJAamyQtCEn/HDcAbnskQ8klMkAR/bcBZDa3j8W
         gYonBPz4GA6wZHg4enoZmsFEjHkPwwpBg+J6oCArRVJO/L+mvxsdN1yCib1vmOeVjxQA
         O9fQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx7AJQ+ZAq2U8pMndNJ2+XWp2vydMZSzv/1jdYvA7LMl88wIMUw7gyi5XcEz3hRUTm+XrcTh1I3d2c35URjwmj@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJfDl2QZdmoKAGIQozMA7n/UDKsWNKQaMnYuVHEXm8kWncWWz
	c+MvieGBblrFf24NuWrFy6PO7EWv9k8eTQwUBchTASNauSR2iRAxsRzp8rlt5hMz
X-Gm-Gg: ATEYQzzSqXaCGs+GUGI3S2sklVe9aiaI+dDtDxc8FSMySQD+AEzeT9+MNMdrx78EZcE
	kvqM/UIfyUXtcyG5wcZsmyfRN1eRo9V1qsO6M0IsmE4qOw9pnTVBlrsPNlRfCkkun4jN2IeNFy8
	X/UOyDAyTh7MYRTSVPw/FkSUBI/Ad7CMvtMvGTcu249TTu08l+bWos+QniNlwT9Gsk8SdlZgsfU
	FtkWd/KTj1b3befi+0z9D+82AKSHRmwNJrkBcZOFjT6fyGIr8kdxgss4l0WqyPy6XJAFQTrpJf1
	jfAKwGMKJjrwgHNyiNkUvh6ZuRUTz3V8d6h96JZNYMsPXSDGeZr6sg7ToKSlXvjbPLbxIltglkt
	zl1QtQQktAA/dd9wfrnJQ+xFsvvE8bZERTukNrrmHB6PjcoaQSeLrkWAKsKQ7z/6xDg8YLumVJ/
	EpGZGz07AO2ok0HR8p9yK/GNtoplt4/uw/PQrf6GnXAiIBafLBDWCXZhAN3D4I
X-Received: by 2002:a05:6102:a47:b0:5ff:c510:b7cf with SMTP id ada2fe7eead31-6020e5be6eamr5392894137.29.1773651471304;
        Mon, 16 Mar 2026 01:57:51 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-950cb55c975sm1407218241.5.2026.03.16.01.57.50
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:57:50 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5fff774800cso2601500137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 01:57:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfHbZ3PxVaiLj61D/ZoXa64DYfS/VnzEQzO2J1Xk27QZIX2nWZmmhCPhP0I6LzvhHTX7rwYvYOSRau2Mop/TSG@lists.infradead.org
X-Received: by 2002:a05:6102:a47:b0:5ff:c510:b7cf with SMTP id
 ada2fe7eead31-6020e5be6eamr5392850137.29.1773651469750; Mon, 16 Mar 2026
 01:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org> <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:57:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
X-Gm-Features: AaiRm524UBYVHYeSOSlEwNWANcA9CdVUxHChHA3ifmZpde-sn3EBjMfeQHZasFE
Message-ID: <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_015753_071338_89EC94B6 
X-CRM114-Status: GOOD (  23.78  )
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

Hi Biju,

On Fri, 13 Mar 2026 at 17:53, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > Realtek RTL8211E/RTL8211F and Microchip KSZ9131 PHY schemas indicate that compatible string "ethernet-
> > phy-id001c.c91[56]"
> > and "ethernet-phy-id0022.1640" must not be followed by any other compatible string. Drop "ethernet-
> > phy-ieee802.3-c22"
> > to match the schemas.
> >
> > The KSZ9131 schema does not document "txdv-skew-psec" property.
> > Fix what is likely a copy-paste error from the "rxdv-skew-psec"
> > property, use "txen-skew-psec" property instead.
> >
> > This is compile-tested and schema validated only. I have discussed this with Biju and they could
> > perform tests on real hardware to assure no breakage. Please wait for their TB before applying.
>
> Looks like there is delay in delivering my patches. I already posted 3 patches. I will test 4/4.
>
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313130623.297712-1-biju.das.jz@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313130920.298392-1-biju.das.jz@bp.renesas.com/
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20260313141150.406528-1-biju.das.jz@bp.renesas.com/

Please use lore links
s@patchwork.kernel.org/project/linux-renesas-soc/patch@lore.kernel.org@

There is also Marek's older series ([1][2], as Marek doesn't do cover
letters ;-).

[1] "[PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22
from PHY compatible string on all RZ boards"
    https://lore.kernel.org/20240630034649.173229-1-marex@denx.de/
[2] "[PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
from PHY compatible string on all RZ boards"
    https://lore.kernel.org/20240630034649.173229-2-marex@denx.de

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

