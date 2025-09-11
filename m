Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D04CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 18:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8/j2XPuezR+Ohqwa0ldSbipiv2uxq5JbBRnuWw/XI0=; b=FMvyxk2o9t4MGM
	T4Sp2OnT4JM4Qs45/4KzePZIrRPWEtSEttgGuX6GC5255RuI4e4dwgsIlwCMW7Aah8apZvNPpkiHK
	u+UckJRBpZkUwlaXxX+60gH/7i+8GJ6e2hrQR7UNA4WzXJb00YphW/ri94l3nlcIpoEKi/6GfVd58
	pucNhTNFOyRALD1SlvY92roxqf+fPjGPjEHczZBoz4RGgEZRv+m008Die2wECtxnL3VnRjX2zlPMV
	02Qah8rvZvspBSz4Nc70Z81HxuCpIZrHShHH2z7LMTbGPB+l2Hf1+Uj4w7zQkoCrljvjIXpTsuw6n
	YH+ZVPVa/5MV2qWw6KYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwls4-00000004hDc-47Vl;
	Thu, 11 Sep 2025 18:18:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwls2-00000004hCz-2AKx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 18:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32247449BE
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 18:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12BDBC4CEFC
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 18:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757614690;
	bh=clA8GqiEaZLpxSps/Zg9+uXbFOxSOUyl+6EIrGzL37g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=QLfIzDYCHc0/UNmTxImRu5nZHNoGCtg5/JZmaRjEOnoKDCf3RLPNrxMTvHsBDzTqp
	 BVCYw0Yf15yTITpxUrhGNq6uiB8uIpZnuUBoIHTYQ3k8VgYxIvT/gZ0UW5aCS96Zv4
	 lKHsAsgVa7Hh8yO8oKxyekmV1cK1niIt6gZzgYU9tWbIpevjl2fUF5UxWBqiXMbrxP
	 CGpCtxfmeQIOi6F6Nl6sIeBYPwRID+E1Ya2Embdk8AaFxaLylcLD46Me15Re57e6xI
	 WIjC79qlRk/xHIzDFsKMHDNsH5eU5uStSYF9Zn3YHMBOjfzrKRkRo0D97+JMF/k1xG
	 BByAcFeZ22png==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-336cdca667aso8519361fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 11:18:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDVSD34sT5ZpVMl0A5lpkIzKVnkPIXe3cdvPpUFl/lu4StsQWCNeOoUL1+oGOZPcV+OaP2uXKtrQUw2Keu1Fik@lists.infradead.org
X-Gm-Message-State: AOJu0YxsDPePyMU6WQU+r/jGp/Kr0QrEWW0loUdhIMOls4Xdb3SgH5W3
	ExXg3ELlBM9U+t1HvLswE92X4rGv0tQ+ZKu7+ikC7XUV1uTutbzRKFanzEiK3n5HC2dOl+oEfDh
	ZIHe7Q//J4wyTEFSaGZeTGUFeBDGHl/E=
X-Google-Smtp-Source: AGHT+IFNhBqlOYMX7VhHL/3/WsyBugQCqv4OR+B6SohRHQQkUzEv33t/qS3NjuPROvGHTdFWqUdjtxSUm5WWLxfziaM=
X-Received: by 2002:a05:651c:4386:20b0:338:1ce5:4034 with SMTP id
 38308e7fff4ca-3513d96a5femr123181fa.32.1757614688354; Thu, 11 Sep 2025
 11:18:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250908181059.1785605-1-wens@kernel.org> <20250908181059.1785605-3-wens@kernel.org>
 <aMMQSR7yYBQkY4CI@shell.armlinux.org.uk>
In-Reply-To: <aMMQSR7yYBQkY4CI@shell.armlinux.org.uk>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 12 Sep 2025 02:17:55 +0800
X-Gmail-Original-Message-ID: <CAGb2v64n_eMBiUaT1S=V6v4Bqv5hLP8vP3=20sp4w4Fxh7RcOQ@mail.gmail.com>
X-Gm-Features: Ac12FXyLWsyObIH64arQzyilGb9hj5BcnDeSxUoNsS-pX-JbEZMJGsbKHCxIoyA
Message-ID: <CAGb2v64n_eMBiUaT1S=V6v4Bqv5hLP8vP3=20sp4w4Fxh7RcOQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 02/10] net: stmmac: Add support for Allwinner
 A523 GMAC200
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_111810_594864_DFDED8B4 
X-CRM114-Status: GOOD (  15.03  )
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

On Fri, Sep 12, 2025 at 2:09=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Hi,
>
> I drafted this but never sent it and can't remember why, but it's
> relevant for v5 that you recently posted. Same concern with v5.
>
> On Tue, Sep 09, 2025 at 02:10:51AM +0800, Chen-Yu Tsai wrote:
> > +     switch (plat->mac_interface) {
> > +     case PHY_INTERFACE_MODE_MII:
> > +             /* default */
> > +             break;
> > +     case PHY_INTERFACE_MODE_RGMII:
> > +     case PHY_INTERFACE_MODE_RGMII_ID:
> > +     case PHY_INTERFACE_MODE_RGMII_RXID:
> > +     case PHY_INTERFACE_MODE_RGMII_TXID:
> > +             reg |=3D SYSCON_EPIT | SYSCON_ETCS_INT_GMII;
> > +             break;
> > +     case PHY_INTERFACE_MODE_RMII:
> > +             reg |=3D SYSCON_RMII_EN;
> > +             break;
> > +     default:
> > +             return dev_err_probe(dev, -EINVAL, "Unsupported interface=
 mode: %s",
> > +                                  phy_modes(plat->mac_interface));
>
> I'm guessing that there's no way that plat->phy_interface !=3D
> plat->mac_interface on this platform? If so, please use
> plat->phy_interface here.

Makes sense. Looking at stmmac_platform.c, for us mac_interface only comes
from phy_interface.

I'll wait a day before sending yet another version.

ChenYu

