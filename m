Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8552CCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 05:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tyqb1CztMqi3UzPCCUo4PJPR7YENee+9JSUveio1sPI=; b=d3i8bkICxXVPDd+2PYIkrPdncY
	ScvlTPI//pBs+3Qf0q4kO6H5p+81aA+mxNrbz3+Y7MUiyCoAeOhvBU6fL8zJ5ZRGDA311AhAJuxvb
	bGIcWVDacaIVmTGgZvkzPTFAIeX2TI6EZgfSsd7w/oubCu92sRavZpGoeFY40COcRbuOlzLDkj9QU
	qvRKcjwjmIGwgwBxwE6Bg0KgWkK+Z0F7QM/lm689F0ExEllqeFErVNmoJQylSoznqDmFi0BJZbQiq
	625jqnJF6+nOgUqjSQPnbieLzP1wC+U8ktevbiXA81KHGQ48QTCNp8h3y5M48mB4xVQkQreqzHtUP
	5bcNV2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6j1D-00000005CXf-3gA1;
	Thu, 09 Oct 2025 05:16:47 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6j1A-00000005CWb-1SEI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 05:16:46 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-87bb66dd224so3767206d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 22:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759987003; x=1760591803; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tyqb1CztMqi3UzPCCUo4PJPR7YENee+9JSUveio1sPI=;
        b=AQGJtaQm7W1Ps4XuApeaEvalV1zLZLcpiPDicegiWd4GUHeUHp9P/nioxl6yFyrPMq
         uI0SZOEMTFS9IMG97mkn1v1e/+/4VCrbnH8UHihoHGsYgM5QnheowRzTmYg/ejKAhTZ7
         PpqfBwiOw51d1ktvJHIXFjcti6Q2r07drC3/iPjv0u/XGoiuEl7/2s61F5HEtoedN0qC
         39enPxV+jI/Vyh9Hv7Jj2DhkEPzviLWJozR9QOKTD+CudnkVlWREiCgKY8K8H277ChAV
         LEfdJJMyPzg6rX3YZBKwC4pJn4uoiE56vd3CLrb+MzQht6BmSwXc6K56dBLodVks+6go
         uUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759987003; x=1760591803;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tyqb1CztMqi3UzPCCUo4PJPR7YENee+9JSUveio1sPI=;
        b=sy29MLRYnin4y4pcBLyhR6vbVxjwph+sabNi+7BNb4Rsyc4t7V6kJIqqR04c1lCh9b
         sGwAc1dLtzuYWJ28eRyFvGn+aQomNGz7oTkeqJ56Z/uBx++Mofwblgx+u22aajuKQyHL
         6/TfNri5tX/lDKh2ar2yWcMeS4eu7XWBD74M0oJ9m0Q7PoVugf3spbdtYA7MUES+06kH
         S60IoVaOsFogP9tp8b8uRoCBJgOMQBp8CAaxniVz7i+/vujaBeLTtjV3X0GfSvGcKUsp
         FLuRt191eQyFry5RFxrdFcC/7LjxPcOFvl8CcLPGshhsIjJMvYzrcpM+Dvd7/uvbpBIz
         /r2g==
X-Forwarded-Encrypted: i=1; AJvYcCU6EJ0tcl4Q5o4Mx8OfPhmGgju6/wKaZ/Kc6usN98QH4oyKGg03fr+w3uEUuA1IHSGcVpeOPe1oVwfWiVY5kziS@lists.infradead.org
X-Gm-Message-State: AOJu0YyzRpHthlg9PLJ/YADOzoQkNt1omOz2WFffCOrQ4XroEBzTp5EN
	vbJB/Pi4UCGO0DyIx8hRMkM19oH0gBl3gRCtgS4zI+AkNk2Snls/SI2b3W0BPbxMVlIu08Ar8uf
	c7F+Rt1DwXoazVaAFSOoh2TryNlmpF68=
X-Gm-Gg: ASbGncuVSzUjBx/YRoejllpWaO8wERPHB484xQJemiX+glBl0P1xd/ZROkPoeOcdTy3
	n0fWg+4uFU3SU8cpM4d1pw46HOeEn48Edld6a0kT2b5lM2yygdVhU45vfC/4+mMLkgpA7aU4PCF
	9We232WUrfKpLLSL3VsqXplWomI0pf/V1unPy8EDpnkC7+6zb2qobYDVIWM0vtD4bDBOjwSLtYz
	R4h2JUAjRj12/Ysi9g0JE+fOsqJMpcrLIidYC9NME0=
X-Google-Smtp-Source: AGHT+IH7cynlxmysIGXABGaRxHRjaSOMuEx+1JjoUFV9WJpw/MAcUpWK0V9ARSZ1SYD2oraMIpI9j58hrMErsazHIU0=
X-Received: by 2002:a05:6214:2601:b0:80a:7bd3:e61d with SMTP id
 6a1803df08f44-87b2ef6325amr77155716d6.34.1759987002596; Wed, 08 Oct 2025
 22:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250929065714.27741-1-jjm2473@gmail.com> <20250929065714.27741-4-jjm2473@gmail.com>
 <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch> <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
 <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch> <CAP_9mL6utQjN_2EZ4vs3K8jzcxHxvKWNTNEXZ9fAx4HuA=DNXA@mail.gmail.com>
 <aOVgid5q0_AhPXFB@shell.armlinux.org.uk>
In-Reply-To: <aOVgid5q0_AhPXFB@shell.armlinux.org.uk>
From: jjm2473 <jjm2473@gmail.com>
Date: Thu, 9 Oct 2025 13:16:31 +0800
X-Gm-Features: AS18NWCLtV0rRwWtVTBZ2YLKRiIGf1OTLHzIEDkTF7un8JPPGbserUWPiMMjbPw
Message-ID: <CAP_9mL5UbWH_hn0AHm=OGZ1_X7yY-W-XXxx3hXC7iPNzHH+q+w@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, heiko@sntech.de, quentin.schulz@cherry.de, 
	kever.yang@rock-chips.com, naoki@radxa.com, honyuenkwun@gmail.com, 
	inindev@gmail.com, ivan8215145640@gmail.com, neil.armstrong@linaro.org, 
	mani@kernel.org, dsimic@manjaro.org, pbrobinson@gmail.com, alchark@gmail.com, 
	didi.debian@cknow.org, jbx6244@gmail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_221644_386458_FE79B23B 
X-CRM114-Status: GOOD (  14.52  )
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

Russell King (Oracle) <linux@armlinux.org.uk> =E4=BA=8E2025=E5=B9=B410=E6=
=9C=888=E6=97=A5=E5=91=A8=E4=B8=89 02:48=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 08, 2025 at 01:29:57AM +0800, jjm2473 wrote:
> > > Vendors get things wrong, including this. 'rgmii' means the PCB adds
> > > the 2ns delay. Nearly every Rockchip board follows Rockchip broken
> > > vendor recommendations, and then i come along, point out how it is
> > > wrong, and ask for it to be fixed, before being merged to Mainline.
> >
> > I will try `rgmii-id` and rescan {tx|rx}_delay, just like
> > https://lore.kernel.org/all/20250925092923.2184187-3-heiko@sntech.de/
>
> The current situation is...
>
> https://lore.kernel.org/r/20240304084612.711678-2-ukleinek@debian.org
>
> Notice that the tx_delay and rx_delay are removed - because with
> "rgmii-id" the stmmac glue driver ignores the delay values.
>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

I  change phy-mode to "rgmii-id", and remove {tx|rx}_delay, it works fine!
Will apply that to the next version.

Thanks!

  Liangbin Lian

