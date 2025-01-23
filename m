Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E452DC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9b8B/1KhmA8Zn74X54gjZWQdCBq0YTpDGkeuzPv3Wg=; b=lfXQw4z0exUFWf+TthxSjNlRCH
	9xQ0Fqp3ocuGVHC1UgbLC6dkOJX31udxZF5BGVl07Ox8WJCO67uGEHKyDpAMYVOH/8Fy48E6SHUhn
	nltiXDxuO4Zpz7uASIH7feLuQ7zAIXei+Rrjaq3WGURNLTII+XNTodR4VLAZVXmBJLDDbbGYnbRXx
	QtrqoC+apMbXlvR456K3F5ttNaCr2mO6XBrKie982e/WEP+zNPa4+3YORa81aPec7qM1YwK1zsg39
	KhnOhEv9GKn2Q0YmxXmuFDDFDUyg7O/Uo8wWFPJXLENVvu0h1b4lyJqI6kje/zH5c9QwKyrYHJhZE
	pVClfnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taz6M-0000000ChfK-0Yd4;
	Thu, 23 Jan 2025 15:26:38 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taz54-0000000Chb3-1KjC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:25:19 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5174f9c0d2aso353963e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:25:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737645914; x=1738250714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9b8B/1KhmA8Zn74X54gjZWQdCBq0YTpDGkeuzPv3Wg=;
        b=VLYb/CmFe0/gAaoUiGeCpS2yRTfquBWCi6SVkLYmQ4Bv/eM20648Jm/rDP+tguq7OR
         hccfLGlzEgmSSoVtBaGOaJiznV79e6ntx4iap0nIgarw12eKjS1KtYz+vBX0fSbeCEaa
         eCaqs5ncw+LWDLWJMaFeUuiYsAQ9rbqUS/2VGKdZAFPhsaSNfsPhgBBa+V5XobhbTeMN
         y9bWFsLeTrktqbwzINO75BSgCDlhfgJF4SOQlRzPF3pN9ydLn35c9/JnLwbscLKqxQJr
         tJAeLnd53gAAyHOLGFTIeRJYHJV+Hf43b+E+mRMZKjn6oLcoMxtRDDm4nJMMS1A+Xf9M
         nPfw==
X-Gm-Message-State: AOJu0YxIYQ3lxNaeELbyFvNNjo2rb1ExTlaq3fWytoQ9mA99Oh6O7hyy
	ucpfqiza+QqsQux5jtOrcLsZlVlQSm5sV6Wu+bEIprAAYTp2nw0Jl9uhP09/
X-Gm-Gg: ASbGncvhCN9fpqNvzp3eVuvZl3cee7MFX+0DhTPMx+DYZy1aT80OX6CV7RXVATnnNDa
	OChgjK4bg7bEqwR5nxO9RjjgMpRzCXCC8vEQQ4U8QK357oSNpYFltTtfeGfE+/U0/m/S3Js/NGZ
	om1/KJMZgLf5RCJtWRj+NGvo1Mh/oYauz9HLyq9+l6nQoCVNfzA6RI0SA8C5zt+ecZLb5C7zrTe
	Q5t0uhyjSR82CaUVf42JmmbrHVrYOt/kMZWb+E1G3dL6k03mFznJZl95Nj4MicDo59MY1Uk2ycB
	Q1ff4dYMYMMgco/ro3GLoG2H8g2vdfsS4HRRpd7sd8E=
X-Google-Smtp-Source: AGHT+IH8Ov+rIZhW1qD1F/JFYUGPoOYGcIIGolqlj1hnbbd2Pk0DKwA/In+MgFWScDmIQypKsyAK2A==
X-Received: by 2002:a05:6122:2403:b0:516:2209:9032 with SMTP id 71dfb90a1353d-51d584614a3mr23037050e0c.2.1737645914019;
        Thu, 23 Jan 2025 07:25:14 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a208576sm3226019137.8.2025.01.23.07.25.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 07:25:13 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afed7b7d1bso273826137.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:25:13 -0800 (PST)
X-Received: by 2002:a05:6102:a53:b0:4b2:5c4b:55e7 with SMTP id
 ada2fe7eead31-4b690cde3a2mr20737457137.25.1737645913456; Thu, 23 Jan 2025
 07:25:13 -0800 (PST)
MIME-Version: 1.0
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 16:25:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com>
X-Gm-Features: AWEUYZlPykv4QH7LgkEQDPD8UQk0TXIl7OZNblAPbfwNmuapfG6Le-FqWDaZUzw
Message-ID: <CAMuHMdUTQ=4K8P_TgTp_b=NDdimgXJgW_nhO1ZJa11C846Bubw@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_072518_360858_CB842FF2 
X-CRM114-Status: GOOD (  20.25  )
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

On Sat, Jan 18, 2025 at 12:14=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Introduce labels for each rswitch port in the form 'rswitchportN'.
> Those can be used to access rswitch port nodes directly, which is
> going to be useful in reducing DT indentation slightly as well as
> in DT /aliases node to reference the rswitch ports as ethernetN
> interfaces. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -974,15 +974,15 @@ ethernet-ports {
>                                 #address-cells =3D <1>;
>                                 #size-cells =3D <0>;
>
> -                               port@0 {
> +                               rswitchport0: port@0 {
>                                         reg =3D <0>;
>                                         phys =3D <&eth_serdes 0>;
>                                 };
> -                               port@1 {
> +                               rswitchport1: port@1 {
>                                         reg =3D <1>;
>                                         phys =3D <&eth_serdes 1>;
>                                 };
> -                               port@2 {
> +                               rswitchport2: port@2 {
>                                         reg =3D <2>;
>                                         phys =3D <&eth_serdes 2>;
>                                 };

Would you mind if I would change all rswitchportN to rswitch_portN
while applying, for consistency with other Renesas DTS files?

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

