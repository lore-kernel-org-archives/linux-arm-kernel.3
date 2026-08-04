Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4C5C55182
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 03:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kgaZqDQUIAJeM0ISENNIK8m7boslYUgftvdD1PiZw0=; b=c0MHrto+iCsEmu
	i+d6JPLKRpwBdG4NExv0Nw4NdKMCokYTLrS8uFge27t9U1EH1JJ52+naOe4ppTGkbdtQV4MjzRz+Z
	nJpyPnmeBOP5bya05hfw0xvvZVS4Wnqg/68ucr85mNRctP9x4muqCFyu1YIYaLeMwDNg4N/On/L6+
	azGHPQcDXTHjHcqgtxGiTH6KFpCS/H5W0vbzcFqpmEIuq0kbryxaJPuqosb9HUWyMPGJHlOGivE5l
	OpixRJlMCTqwMugpndoxeNOYCdrnylJ8wFrPivD5WzzNqJ3hGQcKcnsOYrL9dkl2MTjtIbwHgh2YP
	9cZDDcFqraefNfPDYJoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Yk-00000000ttM-3YJj;
	Tue, 04 Aug 2026 03:11:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr5Yj-00000000tsS-2jiR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 03:11:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A89843D93
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 03:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE511F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Tue,  4 Aug 2026 03:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785813077;
	bh=3kgaZqDQUIAJeM0ISENNIK8m7boslYUgftvdD1PiZw0=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=S22WY6ntoQfkDL8DZvdChixVpgJU7Q4dD8F06+1bG8Co2P6nvIFYg+DxCTjD1cRll
	 onZNWNruCOYw4RZq7mn9zhsscrdMd9NyTI/sytz4zvrfP3A9mWfuzmTnXGsPVbJ/8K
	 aJKeRRR55yqubNjXs4InIYUE1AXcAL066FnQFEfF9oluIX20HCg10BTnGhj36Yyb3L
	 oHYhm+BWBkWtNo9EFdlKzG9dY9vjNz9ka/b+E1mEm80xezmbnPHzgTwf09Tdjj0knN
	 wNspKFuczGA4PqtM3CINb1aegZECoHRXPfXt7axUn81mA/J0XIf8h8cHavagb1VbNx
	 NGLNz/NDq0pIQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39db07589caso37433861fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 20:11:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro7SxIG5Nbj1+gtIdqf7Blcj/tqqjPz2/DodPXQpKrM9tbva1e0g/oOfsPS0WYutzzl+7XLLyCIedQCrwGhkFPF@lists.infradead.org
X-Gm-Message-State: AOJu0YyY9Y9bK+zdZ9r6TZihF2KBVGNbE9iQg6upUjsHKGRby5nuGScj
	LsswlZaWQu6ssgNh5DCsdbl2/hwGSYHEhZ1v9fTOGvpTJPPq4wrUFyWxjeoLpVFUeXzkZYbEfR6
	C6kMp40TU6eXjKqLhFAh5Z0XG3vZ5yKM=
X-Received: by 2002:a05:651c:43c7:20b0:394:184:f7a7 with SMTP id
 38308e7fff4ca-39f8610a7bcmr16699651fa.6.1785813075746; Mon, 03 Aug 2026
 20:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260803101452.2993721-1-andre.przywara@arm.com>
 <20260803101452.2993721-7-andre.przywara@arm.com> <ad2e46d5-53db-49b2-a128-7c54883e18eb@lunn.ch>
In-Reply-To: <ad2e46d5-53db-49b2-a128-7c54883e18eb@lunn.ch>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 4 Aug 2026 11:11:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v64yH+grXMbxg1te6XHt1PxhUc4Jzch_OdUW50tq2Eg1cw@mail.gmail.com>
X-Gm-Features: AUfX_mzJ30C6xeyppFwdQIE9h-X2BZ86M3EAAzUkPSMo3bVFKVcmKT8a2L5ByFI
Message-ID: <CAGb2v64yH+grXMbxg1te6XHt1PxhUc4Jzch_OdUW50tq2Eg1cw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: a523: x96qpro+: enable
 Ethernet support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Liu Changjie <liucj1228@outlook.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Aug 4, 2026 at 10:53=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +&gmac1 {
> > +     clocks =3D <&ccu CLK_BUS_EMAC1>, <&ccu CLK_MBUS_EMAC1>;
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&rgmii1_pins>;
> > +     phy-mode =3D "rgmii-id";
> > +     phy-handle =3D <&ext_rgmii_phy>;
> > +     phy-supply =3D <&reg_cldo3>;
> > +
> > +     tx-internal-delay-ps =3D <200>;
> > +     rx-internal-delay-ps =3D <500>;
>
> 500ns is quite big. How did you come to this value? Do you have the
> schematic & gerber files? Does the lines look unbalanced?

Unit is ps, not ns.


ChenYu

