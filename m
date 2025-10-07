Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EF2CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 17:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMAj+aiM1byyV8qUW2iRSeox1tE1lo5J3rRUTQoSTSc=; b=nh6h/Tw2PlVihTpXyWXbAS3gvF
	DGEk0wV+EYj4JcNP/IoT9t96jedjeq3opPfYDy62R9UrRfiXtmyK32pMTIDcsGdtoHxs6nMTmWn9D
	5yF19/AdGZsmUYII7K48VO8LorRUkjqISZqmOQJ443qB3yvV9LLyahLVWq5Tvs4pVnWL8puSOnQuj
	gvXXP4ZH5+GIdL8ltdxRwYkuRer+QSeDLKy3NAORNHuQL3hW6sJbIB2421MMDKoW6iR+HY3WLW8Ce
	PXNw35AMr903SZ/i+OxnVGALuy0waxATYBp8fSturJxgNPjBWDptOtft2c5o0MgPFqjvvKCTJyXsG
	rzc/Uv9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6BVv-00000002U4R-1uF1;
	Tue, 07 Oct 2025 17:30:15 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6BVs-00000002U3f-2FjW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 17:30:14 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-4da3019b6b6so59634111cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 10:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759858211; x=1760463011; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMAj+aiM1byyV8qUW2iRSeox1tE1lo5J3rRUTQoSTSc=;
        b=YovAWcwo2Vbe4B+Wq7RpxuSX8vGoX0yW8UwRyUiGviaJyh74EBWqr1ci1OC2Nsg1b2
         +fenFX/xB9NDdELBgFdDpUS6a8qzBC37XNDul/XhhW2yQ79xKDmA3qxLuxdAuN3WNer1
         yxmsw1qv4mEYO5jBoefj5zgd23Q9K70Q9MhFvnts6JQwJO8jZ12zu89DcDT/3XWJuMYt
         xl91dcGjgkgtZm4dYg8lzRtdwHOGmGk3LQD8aPpz/Zjw2FDAdfBISHSfPkQhev4iAHtu
         9Bi6l1eI0Tt+ObtKwAo/7zU+8XVXxGi5fpFDpECkDPgrXjYwyB3K3wPC78n9UrUp3iU+
         Z0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759858211; x=1760463011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMAj+aiM1byyV8qUW2iRSeox1tE1lo5J3rRUTQoSTSc=;
        b=Jj/vCtlwQ0822OTmoDEalVRRwPl130vEDTTvxaqqYqDIjEFFW7PsK29dD5Vws8sc04
         sjJKL0j3yLb46gb4GseKLsn6+/7GH+jMG+PkKmtGM3JlD9uyzYk3pFtEkbseJJMeS5Ce
         Pby/B2Qj/3BmQWMGrnnRAjdHgj4pNBIbYDs37bYu+6uLiYMrv6nSnRSWd/RivRXTaPDD
         vLb3HQtUO76sL37lIaI81bIrCZfI4vYUD/L0bwcV0wrJIw0ZAsxSf2gjzYfZTZdyCuKE
         W0lri8F9urMRpRmo8wdigKpRqQftk4SCl0DmrlL1H113NvQVp2wSBcAzmoDELsJcnq+r
         EQ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5F9VgY+Gtemnlc66TOeGmADYoqa0W6EQNfesA2hiGhliNgscoJUu0QpalMCo6vEaOOO+2uHTKbkRUbigLeGPf@lists.infradead.org
X-Gm-Message-State: AOJu0YwtegAyH9+xcQ+I/OJ4ypEeH8MUgeR21agQrfCxT8K0I6yIJHLM
	PTfWTwkED4DIIXGLANfdjPJB8Y95IX7TejlCSpe6DUF0xVSbFyqzS9bj2ZEdRTNUl00vP9U1hmW
	PildG6IqDEwQDDuMKcvCI7vrCqKRusVY=
X-Gm-Gg: ASbGncutJzogL+qY369vNt9dpaAy7o0GO/ZmgrXZ9+XhIJNKnhVhd7xcKdIq21g74P2
	EXduDqD1ERgehv3mPMZTSET9MwnnN+3/fyKPgVAaae4Ctjkl+/gxPaI8i6n8W7VWZnHHOMYMHGA
	Oj05IB9qOZyxoAcJ4KGKMkAgrchzSjzk6+nwRO27y590Brpc6zYwcZOr7nq0UX7v39AMzfdsUwb
	5HLxUC0enR1g4fduMpjScXEMOvp48gk
X-Google-Smtp-Source: AGHT+IGJRfUjE/oeQKG0hRpMB1UxYS7CMPbyUsEgb4VJAH4jITPPVIHBmZKNXDNSbvw+FOss5T4/jom7TqKt2zeh/lw=
X-Received: by 2002:a05:622a:28b:b0:4df:504:ef88 with SMTP id
 d75a77b69052e-4e6eacd88a2mr6233551cf.23.1759858210804; Tue, 07 Oct 2025
 10:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250929065714.27741-1-jjm2473@gmail.com> <20250929065714.27741-4-jjm2473@gmail.com>
 <d8ad476c-d0c7-4e97-9e76-540a539ffb52@lunn.ch> <CAP_9mL4ofig-X-w9wx1A5D_eVXROo6AVFBSwp4mh=kj7webpPA@mail.gmail.com>
 <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch>
In-Reply-To: <7e219aef-88a0-4184-9553-30dcbc8dbd79@lunn.ch>
From: jjm2473 <jjm2473@gmail.com>
Date: Wed, 8 Oct 2025 01:29:57 +0800
X-Gm-Features: AS18NWBZUMXa0jkDLOJvcTfIew6vRsl83_rLRSuXeQfl3Nd8OcKbfEdsvkWXLgw
Message-ID: <CAP_9mL6utQjN_2EZ4vs3K8jzcxHxvKWNTNEXZ9fAx4HuA=DNXA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: rockchip: add LinkEase EasePi R1
To: Andrew Lunn <andrew@lunn.ch>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de, 
	quentin.schulz@cherry.de, kever.yang@rock-chips.com, naoki@radxa.com, 
	honyuenkwun@gmail.com, inindev@gmail.com, ivan8215145640@gmail.com, 
	neil.armstrong@linaro.org, mani@kernel.org, dsimic@manjaro.org, 
	pbrobinson@gmail.com, alchark@gmail.com, didi.debian@cknow.org, 
	jbx6244@gmail.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_103012_600951_FCD4CC93 
X-CRM114-Status: GOOD (  34.03  )
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

Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2025=E5=B9=B410=E6=9C=887=E6=97=A5=E5=
=91=A8=E4=BA=8C 22:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Oct 07, 2025 at 10:32:26PM +0800, jjm2473 wrote:
> > Andrew Lunn <andrew@lunn.ch> =E4=BA=8E2025=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=B8=80 23:51=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > > +&gmac0 {
> > > > +     phy-mode =3D "rgmii";
> > >
> > > Did i really miss this patch series in its earlier version, or did yo=
u
> > > ignore me?
> > >
> > > https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetre=
e/bindings/net/ethernet-controller.yaml#L287
> > >
> > > > +     tx_delay =3D <0x3c>;
> > > > +     rx_delay =3D <0x2f>;
> > >
> > > Please change it to rgmii-id, and smaller tx/rx_delay values. Or show
> > > us the schematics which clearly show extra long clock lines.
> > >
> > > > +/* Micro SD card slot is not mounted */
> > > > +&sdmmc0 {
> > > > +     max-frequency =3D <150000000>;
> > > > +     no-sdio;
> > > > +     no-mmc;
> > > > +     bus-width =3D <4>;
> > > > +     cap-mmc-highspeed;
> > > > +     cap-sd-highspeed;
> > > > +     disable-wp;
> > > > +     pinctrl-names =3D "default";
> > > > +     pinctrl-0 =3D <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_d=
et>;
> > > > +     vmmc-supply =3D <&vcc3v3_sd>;
> > > > +     vqmmc-supply =3D <&vccio_sd>;
> > > > +     status =3D "disabled";
> > > > +};
> > > > +
> > > > +/* Wifi module is not mounted */
> > > > +&sdmmc2 {
> > >
> > > What do you mean by "not mounted"?
> > >
> > > Often you would say "not populated", to indicate the PCB has all the
> > > tracks in place, but the chip has simply not been soldered in place.
> > >
> > > Or is there a connector here, and nothing plugged into the connector?
> > >
> > >    Andrew
> >
> > Andrew:
> >  Hello! I ran `./scripts/get_maintainer.pl
> > patches-v4/v4-0003-arm64-dts-rockchip-add-LinkEase-EasePi-R1.patch`
> > to get maintainer list, and got:
> > ```
> > Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
> > DEVICE TREE BINDINGS)
> > Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
> > FLATTENED DEVICE TREE BINDINGS,commit_signer:3/41=3D7%)
> > Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
> > FLATTENED DEVICE TREE BINDINGS)
> > Heiko Stuebner <heiko@sntech.de> (maintainer:ARM/Rockchip SoC
> > support,commit_signer:43/41=3D100%,authored:4/41=3D10%,added_lines:12/1=
17=3D10%,commit_signer:5/6=3D83%)
> > Quentin Schulz <quentin.schulz@cherry.de>
> > (commit_signer:10/41=3D24%,authored:8/41=3D20%,added_lines:63/117=3D54%=
)
> > Dragan Simic <dsimic@manjaro.org> (commit_signer:5/41=3D12%,commit_sign=
er:1/6=3D17%)
> > FUKAUMI Naoki <naoki@radxa.com>
> > (commit_signer:3/41=3D7%,authored:3/41=3D7%,removed_lines:1/1=3D100%)
> > Peter Robinson <pbrobinson@gmail.com>
> > (added_lines:9/117=3D8%,commit_signer:1/6=3D17%,authored:1/6=3D17%)
> > Alexey Charkov <alchark@gmail.com> (added_lines:6/117=3D5%)
> > Diederik de Haas <didi.debian@cknow.org>
> > (commit_signer:4/6=3D67%,authored:3/6=3D50%)
> > Liangbin Lian <jjm2473@gmail.com> (commit_signer:1/6=3D17%,authored:1/6=
=3D17%)
> > Johan Jonker <jbx6244@gmail.com> (authored:1/6=3D17%)
> > devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
> > DEVICE TREE BINDINGS)
> > linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC s=
upport)
> > linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support)
> > linux-kernel@vger.kernel.org (open list)
> > ```
> > your email address is not listed above.
>
> What i eventually found is that you posted v3 separately, and then
> threaded v4 to v2, which makes no sense.
>
> Please always start a new thread for each patchset.
>
> > > What do you mean by "not mounted"?
> > >
> > > Often you would say "not populated", to indicate the PCB has all the
> > > tracks in place, but the chip has simply not been soldered in place.
> > >
> > > Or is there a connector here, and nothing plugged into the connector?
> >
> > The chip/slot has not been soldered. So here should be "not
> > populated", forgive my poor English.
>
> Thanks for the clarification. I'm not sure it is worth adding these DT
> properties. When a new board is produced which does populate these
> devices, you are going to need a new .dts file. So you can put the
> properties into that new file.
>
> >
> > > Please change it to rgmii-id, and smaller tx/rx_delay values. Or show
> > > us the schematics which clearly show extra long clock lines.
> >
> > In fact, the RTL8211F's RXDLY and TXDLY signals are both pulled low,
> > just like the Banana Pi BPI-R2 Pro, so the configuration is also refere=
nced:
> > https://elixir.bootlin.com/linux/v6.15/source/arch/arm64/boot/dts/rockc=
hip/rk3568-bpi-r2-pro.dts#L237
>
> Pull low makes no difference to the 2ns RGMII delays.
>
> > The tx_delay and rx_delay values were obtained using Rockchip's
> > automatic scanning tool:
> > https://github.com/istoreos/istoreos/blob/54746dfdb5bd34d1f281cf41d1d16=
20d0c3ee686/target/linux/rockchip/files/drivers/net/ethernet/stmicro/stmmac=
/dwmac-rk-tool.c
> > https://gitlab.com/firefly-linux/docs/-/blob/rk356x/firefly/Common/GMAC=
/Rockchip_Developer_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
> > https://github.com/axlrose/rkdocs/blob/main/Common/GMAC/Rockchip_Develo=
per_Guide_Linux_GMAC_RGMII_Delayline_EN.pdf
>
> Vendors get things wrong, including this. 'rgmii' means the PCB adds
> the 2ns delay. Nearly every Rockchip board follows Rockchip broken
> vendor recommendations, and then i come along, point out how it is
> wrong, and ask for it to be fixed, before being merged to Mainline.
>
>         Andrew

Andrew:
 Hello!

>
> What i eventually found is that you posted v3 separately, and then
> threaded v4 to v2, which makes no sense.
>

This is v2 link
https://lore.kernel.org/all/20250925092037.13582-1-jjm2473@gmail.com/
.
I don't see 'v4' in there. I have no idea why you see 'v4', can you
please share a link?

This is v3 link
https://lore.kernel.org/all/20250929065714.27741-1-jjm2473@gmail.com/
.
I don't see threading issue.
I use `git send-email --to '***' --cc '***' patches-v3` to send email,
should be OK.
(`patches-v3` is a folder contains patches generaterated by `git
format-patch --base=3Dmaster --cover-letter -v3 HEAD -3 -o patches-v3`).

> When a new board is produced which does populate these
> devices, you are going to need a new .dts file. So you can put the
> properties into that new file.

These two nodes just describe the gpio and regulator found in the schematic=
.
If some users solder these connectors or modules themselves,
they only need to change the status to ok and they can use them.
If this will cause confusion, I can delete these two nodes.

> Vendors get things wrong, including this. 'rgmii' means the PCB adds
> the 2ns delay. Nearly every Rockchip board follows Rockchip broken
> vendor recommendations, and then i come along, point out how it is
> wrong, and ask for it to be fixed, before being merged to Mainline.

I will try `rgmii-id` and rescan {tx|rx}_delay, just like
https://lore.kernel.org/all/20250925092923.2184187-3-heiko@sntech.de/

I also notice that you suggest use {tx|rx}-internal-delay-ps instead
of  {tx|rx}_delay in
https://lore.kernel.org/all/e4d3127b-c879-4931-9ea0-de7449bc508c@lunn.ch/ ,
but I think this depends on stmmac driver.

  Liangbin Lian

