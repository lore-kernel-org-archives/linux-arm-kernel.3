Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5328FC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYSLaHavJ4PglZOT+cFIpQNUnogOMDphRk0Ds36kk5w=; b=jHkfq1lZQYQNLKKYlT51MMCl3G
	MJ1xJwv5o/at5JQ43A3UznTp+UYb35S6yJZ/tUNK4E1AEOFCyyAXxMsu1Hs4PxqnCYwixn/DA2XMv
	npWsQR+cAmOLiIxgBfUKIWmf6ocJ2AWloOjOQ6SCH5gu/QcQNeupsEkiZW1gqQrvqGN9w9Z6pkIAh
	mQSXU3UPP8+gwdSsVgcTKYb+jqyyHTeOSKvgCFJJ/HJtoaJYMOF2J1NZqzlKSk1vLUrM8xqbUgSvX
	bD+hAfPuUq7WnyOnWLjF9YSS78VBF5Z7rVYYODwdmHP0ffBVyKYTB1YsjJIlZEwe+UME6lCN+qx9p
	qkqZd7RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dI6-0000000ABcx-0cil;
	Thu, 24 Sep 2026 06:50:46 +0000
Received: from mail-qk2-f13.google.com ([74.125.230.205])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dI2-0000000ABcF-2uhr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:50:44 +0000
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb769ca17so13511681cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 23:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232641; x=1790837441;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYSLaHavJ4PglZOT+cFIpQNUnogOMDphRk0Ds36kk5w=;
        b=ch90rxSJIkF39+CNyfYyRTvmuOitVfeT1M5xAIqYJ+N8dVqOHTQK2dBtpKI6VFByLw
         GVuHVoE4mOJBRLdC8txVaiCPGHvvuSkuX3A9cdNtUeTjcYmYRwXyFYbtPHuiJsPtMgzq
         Y8Bdb41kdEcg030QErTPUwcbAw0Y9EoR4BDyb8/k9n4BnrM3CpK4PaZ9iHG4+0wrthIk
         C6P0qDlZXVDOW4FKVuDa+eX7oxPvayM1sXx8YrG1XJ+yjfttSNcYCgwkIMNxb/y9q/0I
         nZoznd+nBAPD7/2nj4w9TUjONOVpFlHa44Y87J7/UUqziUcm/deigTxBpnl0sm9zrbI3
         z5dA==
X-Forwarded-Encrypted: i=1; AKwUvBwjrAhz7hinGgz6FLwTHWEOv5fxXEVmc3KEb2DoU8Yq8+V16BGSeomKvIDeNfQ4el52gRCW7pYLGjbfZYaESuX8@lists.infradead.org
X-Gm-Message-State: AFuF++m9I9zfMFYRuPDEmfg269BNrMZIGstalxBG7BMc7YZvaee+jROX
	IpdhhbKSzDK9nk5rBBj/OU5Qj02tJaauc/zoQrPv/xZzC8RgeNTUOksIbAjC1cM/kiY=
X-Gm-Gg: AYBFou01wsibHlwZEjx0oLIChq0XDsnOnO/mX9Y8FseXqcQ3NG0f2Jyly7r398x2lIE
	rgT5nY6MS4DJiD+5ccHb7ur0rVOZQxPAxi7502IzNNuT5/NpOyEPj4Qgwofo2OPlwBPIIaIxfpi
	g4EAWwAUixjSYIdhKJlOT8dMym3iVSx60kRBcTnBbWI1NB1WMIsxE51lBcsTHQ1+j6RZG0061mE
	k6CwRMgFBiSKiThGAK3QgFrzgctez8cMM6Pwg44YU8zrzc2KfCjxg9yU/TO8R1jQG1vrEkYLj72
	pm+oJeG6/ZkiPYKham9POC88LhZd+VD9xo6rEviVfx2HoiswIs/Yu2+l01KcLucIJFAZiQmF3bz
	TpjZvKfB9OnplG04xSg4mCZwLrQsDtwTUisLVaAJECveBRWQwBiLEBmqMmyoP69LeR91IG99T1I
	HNt68I2KYJ8pk/YUfBl/2bTBzI3FAYQTgbkUXzVResMK+B4NkO56eCvphl1eswsuZnex3WzF4+S
	TgWHFMAtgnwDaywkHM6TwtI1M4NREiAC2MdRQ==
X-Received: by 2002:a05:620a:2a04:b0:91c:c20b:a135 with SMTP id af79cd13be357-93c36413ac5mr146110785a.40.1790232641038;
        Wed, 23 Sep 2026 23:50:41 -0700 (PDT)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com. [74.125.230.235])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2485c952sm400242185a.25.2026.09.23.23.50.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:50:40 -0700 (PDT)
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-52fb769ca02so16990021cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 23:50:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7wwnNcDbB7XX2bo/2UDKz2GXY6bha2ynXw4x7yWdwTijamRqsFBRxjARfqFtO0QnAX4zFdZUvm4ym1ZM71EEl@lists.infradead.org
X-Received: by 2002:a05:6102:e0c:b0:7a7:a382:6bd7 with SMTP id
 ada2fe7eead31-7af1dadc05bmr812949137.27.1790232328063; Wed, 23 Sep 2026
 23:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com> <e166f6e2-05b3-4f36-a1c3-b75861618c75@pardini.net>
In-Reply-To: <e166f6e2-05b3-4f36-a1c3-b75861618c75@pardini.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 08:45:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+Dum1VaMOQx9aS_hBn1Bmq_mZ1qaH-WegK7Q=pEdmTA@mail.gmail.com>
X-Gm-Features: AclHuK8sCbd_Nwk8hcPDRDy2MSUfMylLVdDaP4Bmdtue73-db_SXAulz9teSuSc
Message-ID: <CAMuHMdU+Dum1VaMOQx9aS_hBn1Bmq_mZ1qaH-WegK7Q=pEdmTA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
To: Ricardo Pardini <ricardo@pardini.net>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_235042_760248_EA5F93E4 
X-CRM114-Status: GOOD (  25.08  )
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

Hi Ricardo,

On Wed, 23 Sept 2026 at 20:49, Ricardo Pardini <ricardo@pardini.net> wrote:
> On 22/09/2026 11:17, Geert Uytterhoeven wrote:
> > On Thu, 10 Sept 2026 at 22:08, Ricardo Pardini via B4 Relay
> > <devnull+ricardo.pardini.net@kernel.org> wrote:
> >> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
> >> NICs whose PCI function nodes are not described in the DT. Describing
> >> them allows for stable ethernetN aliases (matching the GMAC alias
> >> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
> >> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
> >> stay stable across boots and U-Boot and kernel MAC match.
> >>
> >> Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
> >> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
> >> u-boot correctly adds local-mac-address property there which is
> >> correctly picked up kernel-side:
> >
> > Have you tested this at 2.5Gbps? With which firmware?
> > I am asking because I have problems at 2.5Gbps using the firmware from
> > linux-firmware (on a different platform, though)
> > https://lore.kernel.org/CAMuHMdXPAeHoeaQbM9rXbXukoMbFV+0k28n6sRMw8XF872=
0WUA@mail.gmail.com
>
> Hi Geert, yes, the RTL8125's on those boards work at 2.5gbps just fine
> (both with and without the fixed-function nodes in this series). They do
> get quite warm at 2.5gbps. I'm using one of those el-cheapo 8-port
> 2.5gbps switches.
>
> Currently:
>
> [    3.254450] r8169 0002:21:00.0 eth0: RTL8125B, 8e:b4:90:97:32:30, XID
> 641, IRQ 124
> ...
> [   10.480872] r8169 0002:21:00.0 end0: Link is Up - 2.5Gbps/Full - flow
> control rx/tx
>
> # sensors r8169_2_2100:00-mdio-0
> r8169_2_2100:00-mdio-0
> Adapter: MDIO adapter
> temp1:        +52.0=C2=B0C  (high =3D +120.0=C2=B0C)
>
> I'm using whatever is in Armbian's armbian-firmware package:
>
> # ethtool -i end0 | grep -i firmware
> firmware-version: rtl8125b-2_0.0.2 07/13/20

Thanks for checking!

Mine is RTL8125D XID 688, i.e. a different variant.

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

