Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF38C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 05:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=; b=bZIOwO0Hc+iwRYOWPENTXcmt3x
	2t7T7WkeLQ++W9xDbGG2aWmqdS0w9LDiiweJRuSJbdw1i3xSxnx9qvOp5tjSLL6sn+TQKn4QUTO5t
	4OY2UE9GRUz/wW6oRAzCH9Vok0bfmqU6yOUsijQyWRqddlZ3KTpdo0zzRXq2lsnjhJqNDF+6+pPS0
	GZhG8ecXF5xyUt91yJUfq7GYG4N29VqwFs19ymQOcU2/h6/+NESdCbcdxVn1PjoMQ4YKkwzRFIw8r
	yWloFT+QFavvlwYwD3XS3Zz3W6hlz4+dSmG4NKTZ+ZtaNJ1TG3XuOqxJR+p+zdNJRqtUVqyAMkSq+
	A0NbJ28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hwe-00000008MwC-154V;
	Wed, 16 Sep 2026 05:12:32 +0000
Received: from mail-vs2-x10.google.com ([2a00:1450:4864:3a::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6hwb-00000008Mvg-39Y9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 05:12:31 +0000
Received: by mail-vs2-x10.google.com with SMTP id 71dfb90a1353d-5c67e52ff5dso357244e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 22:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789535548; cv=none;
        d=google.com; s=arc-20260327;
        b=mWT8TdKKHQTGSgI+jGUqQItaRbH5ABWzaQGfjelyTcwR3Ds0MBbhq8eXZ5uwgyEh3G
         8Gd4W9jnrbjl3PMR+S5Np6/SF479ar4KuOaiNjXWLSvx0NBfToqQs9rvGfWQpVbP7kVf
         LbDUhQp0PFFr+CBPZTobB5mxBZIDJmKnvnBO5LL+JK+SvzJHhUfzV29F6pcgEI+9/vfA
         RPrDuiTEHN8qOyY2l3sssT0sEQno1uTFRLC3ydq+kXnZIbZC5QxR6kHsAkAOeT8Mk9Qb
         GG1cG/t3EzufqgGAyv5PGFzhxTkVB7YNzTfXLWO1jdAVCiOGU9SsbitXEAPgc/ZH4I1e
         q9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        fh=m15ra3DnmNfolBm0mr+e5mI4EMNMXRqt+7+SPJBix0I=;
        b=BmQ2fn1a2A/5GVueV95zdITWGIdPnrHuIr+ESp1WiMyc9XgrXlTKS/g9VtStY8pqMP
         DziNIkjW+QejVdLe2AhKP+TabT1/bycN3Z/UXH9MVVrR+gtYUFrILbA/hkkP+OreJ0y7
         LGjYQSvYFnaU1j9WJZDylWyt7SNsHPWCwlkJi4REHPxwikdS6QRNkTlQGQb2uM0qTA3I
         MIMjVSz9IP4tNBDtPYImDCo85c9cmzYMxgugVAUHbwQoYjW3qEvpsRHuMkGuflKjYy7E
         te7Yn+NywXBNC07eZxOfdqeRfmyJsODoECXd59c4T2P6288IuBBRdlAbAKGKzjNfxY0l
         UvYQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789535548; x=1790140348; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        b=PglEFrUboMWufxH712V5AKC93AOvdpaMhEluseBlVczUckYCrRYPTxXODvWUdbw3r0
         +bLPprvnrcMhlHblj++ayeh7hXZ3FvciBIqPdRIlQdPEebOHFl6Wqo7IL0jb2isVNtZl
         pMUEH3WpmzrCdVss9LPxPUi3Z0UGHg03G9gVOdEojBd8ja6jWHf454cWzj4F1qlmNlvs
         WXNksNJj0ZatVn4eh7zzFOn4GorVzfRXVfLs/gZ/8dX5fUyOMxH0RuWetm5Ngv5YLp1T
         ljrlXi63guWppfP6twV2/vNhDQZkeiURALfAJqKvp6JQzIV//1eqn5FTI1ukqNSsLrzB
         1DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535548; x=1790140348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVAkoIa4qb/USGuXY22Fjfb1KpGXE+Xb86EIM7n4PT8=;
        b=rLGp/+aTVzNgHsGyhZvxozAW5JN2B621HjEEJ3ntR2yLcJmsxhn5Okxy5BhBUp/NSF
         sdF0WDy0ZiqDUIO1pTSgwGOLRe5oq2IEamY10E/j3+x0gcK7rW1ElSf+yozfvcY5cvAt
         XyaMHD1XdZF7h4BwJM0P2yzrVGWcgX6ddFbyAscdycOfiI/OhvgDlxSuLyz738YMjNxz
         nJiEARZelMIs1swApEQpoDIbyzf1Hwo5V/rVt/0qPTuKzcgF9NbzP9OqKdFEBn1e1xRS
         SA5lvy2QLzW259e0SSehN0In0Uq9Hh/nKZ5uZZR5Ms+UF3uC1EGBlOfedrfe9OsW+fe7
         1wig==
X-Forwarded-Encrypted: i=1; AKwUvBzjaMtKpIW0qHvPM9e7qzjKe9SiwK0QUh6l5gwoF2PJi3A/1fH2kZCA582aPWrpo6CehAWgLTypACYLgBqcQkVV@lists.infradead.org
X-Gm-Message-State: AFuF++kmGgfYi0TDIqY9Vk2w8TrtSiI0pa+ZM8Ks91A0VdOoGpz6RsIl
	is8b+X/dGs1CcCWYZmy2FyDCsl3E+yuH0NFAGbrXcB3KWAI49OJWpzwOtukm8nFxE5WmXbLh63K
	LNhyTBIW7Ihz/pD72ZzNVJ5uj1Nkda+w=
X-Gm-Gg: AYBFou0FJHqePGPlnTANgPkAzTvsBB13mQ65rcAsWLSw2n7WWasqEsf+21BMCLlnTHN
	sgA2j9FgbWDB192fGb5rv6HZjYeMJVm7wiOc2E7zaKiD478VKS8b1UHVQabWDBV9vLwhc4JY9we
	lWg/DKTJmw8xkBAqCX9H+rY8aTSramhuVC9GyDTzjMHdr0o2Le5Hi4CMbLWmgtsn6gV8Fc4+pdT
	9QlfBNn2uHPrab/4fcdY0BVRkLaLwjnEMCsFaWJDkBIhG0/VZoKJTlEULVvw61SrBluZnKZC+hZ
	F4kUhoiA0oKJaXZUFqpG3WFkHWfP0snTqlLy/lsbDZza3ipXMUG+nUFCTa0cyBMo8f5i2+C/YKO
	exw8sVz05kSYBQLZOp+6gF4os1U9iiECVOxteKZjoOx+qX72Sx008SJtqBUQfNiEFcEyOW0P47F
	JUm0cUXY5P/jq91oLDdj380pDNJYKBFVWbDEeccm+ejurf
X-Received: by 2002:a05:6102:38ca:b0:79e:caaf:de9 with SMTP id
 ada2fe7eead31-7a02acc855amr1205112137.6.1789535548385; Tue, 15 Sep 2026
 22:12:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260916044119.475666-1-alastair@d-silva.org> <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
In-Reply-To: <CAGb2v64HZoqBscyKTkTin6DnMv5_kZpBxoS+cm7aYy09pRc7hA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 15 Sep 2026 23:12:17 -0600
X-Gm-Features: AcwNN1UNecxTndtUibx9ggVDgut-WAi8ElAvEyyyzRhfanBmsu20NosAEZK33OI
Message-ID: <CADvTj4qRMviM=KXinCKi657pVC_kj7Kt1yizW_EGDu4m7VKQFg@mail.gmail.com>
Subject: Re: [PATCH net-next 0/4] net: Add Allwinner H616/H618 EMAC1 and AC300
 EPHY support
To: wens@kernel.org
Cc: "Alastair D'Silva" <alastair@d-silva.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_221229_822885_B7EA9B95 
X-CRM114-Status: GOOD (  23.75  )
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

On Tue, Sep 15, 2026 at 10:56=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Wed, Sep 16, 2026 at 12:41=E2=80=AFPM Alastair D'Silva <alastair@d-sil=
va.org> wrote:
> >
> > This series adds support for the secondary Ethernet MAC controller (EMA=
C1)
> > and the co-packaged AC300 Fast Ethernet Physical Layer (EPHY) found on
> > Allwinner H616 and H618 SoCs.
> >
> > The Allwinner H616/H618 SoCs feature two EMAC instances: EMAC0 (typical=
ly
> > used with an external RGMII Gigabit PHY) and EMAC1 (Fast Ethernet,
> > connected internally to the co-packaged AC300 EPHY). EMAC1 uses a
> > dedicated clock control register in the syscon register space, which is
> > accessed via an offset index in the DT syscon property.
> >
> > The AC300 is an integrated 10/100M (100BASE-TX / 10BASE-T) Fast Etherne=
t
> > PHY communicating over MDIO at address 16 + phy_addr. It requires
> > retrieving factory bandgap calibration data from the SID nvmem controll=
er,
> > managing internal power rails and clocks, and optimizing transceiver si=
gnal
> > parameters.
>
> There is already a series from James covering the same thing. Please chec=
k
> the mailing list and possibly our wiki (linux-sunxi.org) to avoid duplica=
te
> work and subjecting the maintainers to the same discussions again.

See:
https://git.kernel.org/netdev/net-next/c/783f6f1fdcd5
https://git.kernel.org/netdev/net-next/c/6cc2fbceb49b
https://lore.kernel.org/all/20260915-submit-h616-emac1-v1-v2-2-322b32e40eb9=
@gmail.com/

>
>
> ChenYu
>
> > To ensure reliable link establishment and MAC software reset with the
> > internal PHY, dwmac-sun8i is updated to defer MAC software reset until
> > sun8i_dwmac_init() after the internal PHY has powered on and begun
> > clock generation.
> >
> > The series is structured as follows:
> > - Patch 1: DT binding for Allwinner AC300 EPHY.
> > - Patch 2: PHY driver for Allwinner AC300 EPHY.
> > - Patch 3: DT binding update for Allwinner H616 EMAC1 and syscon index.
> > - Patch 4: dwmac-sun8i driver support for H616 EMAC1 clock index and
> >            internal PHY deferred reset.
> >
> > Testing:
> > - Tested on physical Mellow Fly-C5 hardware (Allwinner H618) running
> >   Armbian with sustained 100Mbps full-duplex network traffic (DHCP,
> >   iperf3, NFS rootfs).
> > - Device tree bindings validated with dt_binding_check.
> > - Separate SoC and board DTS additions will be submitted via the
> >   linux-sunxi tree.
> >
> > Alastair D'Silva (4):
> >   dt-bindings: net: phy: Add Allwinner AC300 EPHY binding
> >   net: phy: Add Allwinner AC300 EPHY driver
> >   dt-bindings: net: allwinner,sun8i-a83t-emac: Add Allwinner H616 EMAC1
> >     and syscon index
> >   net: stmmac: dwmac-sun8i: Add Allwinner H616 EMAC clock index and
> >     internal PHY support
> >
> >  .../net/allwinner,sun50i-h618-ac300-ephy.yaml |  79 +++++
> >  .../net/allwinner,sun8i-a83t-emac.yaml        |  14 +-
> >  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  65 +++-
> >  drivers/net/phy/Kconfig                       |   9 +
> >  drivers/net/phy/Makefile                      |   1 +
> >  drivers/net/phy/ac300-phy.c                   | 331 ++++++++++++++++++
> >  6 files changed, 486 insertions(+), 13 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun=
50i-h618-ac300-ephy.yaml
> >  create mode 100644 drivers/net/phy/ac300-phy.c
> >
> > --
> > 2.53.0
> >

