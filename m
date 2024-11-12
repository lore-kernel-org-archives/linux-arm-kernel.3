Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE482D42B8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNvpMEMMp18FGS7c8sEnzH5td6+/VgqxhrBTXx1KJ80=; b=yHViFhsa3EJE4878T555Sf29oz
	lNTfKQNj4fVkKl2+uPPOYIAhov45iq0PktE4V3PGDdBiQo8Ji9QdwXkTXiI2xq1QeHe/o5UItkzIE
	vkSvNXLA+UgRU01Gem1QxVRicd04QuOG2G9jXB1rXtCeFzd6lfOyxWsaa2SIakGuOALGTRJIY+Jll
	ZbtmwbeHQ51DSKUZCPI9cEeiq7hgRfDGTEil7zkpnaajNdb9D2y/FksUTeTJAbLkm2RaIX0+HdXOG
	u1nRi1hOYSSpGYIc3zw8UnChFsEbq3Wo03VWVGQYXgsHw5BJnl/M8j4k6TQGqxo7rBhfvCKyAg3UD
	dPwvLHPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs3O-00000003mrI-2bR0;
	Tue, 12 Nov 2024 14:39:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tArzt-00000003m68-0F26
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 14:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6BFA0A41C62
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 14:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E1BC4CEDC
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 14:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731422159;
	bh=Z2NJKOZ80m23Hs6ZpODlXPTw2PK6JAxwWTKiu7L1XNw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PThhpsVRXNp9m1870inWzUgadxqlcDbDb2l5xeQ/CvLQJec9dbfmnqbuUa7RLoVC3
	 bouFA1eMND7HmoShFhH/6BuNj2ZSQ6D5+SFeqDZ6qZ1U63ZtEpJ4gmQmSXvKSzehhR
	 puAVV+GUuFwbp4fgUSZveLUT6kmXtR+JQHg6edVtwqYp1RwtR9uGgzKeObYoSgskDm
	 wbqECTvloNFv6vKxXaJ1vJdNFjRpHc7fbiUgTexSCcbh+W5vlAlwEKgBocsUEyyA/P
	 9pzD2D90SiXvqbDUdfi+7X19gx+6cIr3AjaulUJjmO0lk5fraCM9Cuz6ZoFlF+CD3Y
	 aSb7mTvr/JJnQ==
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e28fe3b02ffso5310179276.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 06:35:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUROPMx3Mty4N6ccawiIJDjLGvvnsw4pK3qJo1oGzo1nGXd4V6LXZmfDw8ZZBIST4ro72JcKjJbSBf7g+O9xnMY@lists.infradead.org
X-Gm-Message-State: AOJu0YwFFpG6Y9f7PPJWnz03ZIrvVrN8X+bASMMtOlzYQeDwdREYxRTy
	1GTAdC6LvdEUlFqMLEMxwyO59UVR+83oTNv1pUXyEmXpFjvhPj/OTWCg4C4sLmh5wpeYXXEVQ/C
	8Pco6t7DHKrRu5J2KkTwg25Fe4w==
X-Google-Smtp-Source: AGHT+IFI5tDoN6E7Kqk7Gw+xDL7rKQexAuiQ6Yq/THb9/Zw6ePjvaoIFxIHVn5lbaA5+r4C6IEYEi87Hkak2D5U5HD8=
X-Received: by 2002:a05:6902:3401:b0:e30:b345:9a09 with SMTP id
 3f1490d57ef6-e337f9054f4mr12761822276.50.1731422158152; Tue, 12 Nov 2024
 06:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20241112072704.767569-1-jpatel2@marvell.com>
In-Reply-To: <20241112072704.767569-1-jpatel2@marvell.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 12 Nov 2024 08:35:47 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL8JVhWNC4qefysLm+4uHYmR2Arwq3wTumS3XV=ncgU3g@mail.gmail.com>
Message-ID: <CAL_JsqL8JVhWNC4qefysLm+4uHYmR2Arwq3wTumS3XV=ncgU3g@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: pci: change reset to reset controller phandle
To: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
Cc: thomas.petazzoni@bootlin.com, lpieralisi@kernel.org, kw@linux.com, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, salee@marvell.com, dingwei@marvell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_063601_249007_6614CEBC 
X-CRM114-Status: GOOD (  18.92  )
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

On Tue, Nov 12, 2024 at 1:27=E2=80=AFAM Jenishkumar Maheshbhai Patel
<jpatel2@marvell.com> wrote:
>
> replace reset bit mask and system controller
> with reset controller and reset bit phandle

The diff tells us "what" already. The commit msg needs to answer "why".

The DT is an ABI. You can't just replace property(ies) with a new
property. There's exceptions if there are no platforms in use or
similar.

This binding needs to be converted to dtschema before adding to it.

>
> Signed-off-by: Jenishkumar Maheshbhai Patel <jpatel2@marvell.com>
> ---
>  Documentation/devicetree/bindings/pci/pci-armada8k.txt | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/pci/pci-armada8k.txt b/Doc=
umentation/devicetree/bindings/pci/pci-armada8k.txt
> index a177b971a9a0..a9a71d77b261 100644
> --- a/Documentation/devicetree/bindings/pci/pci-armada8k.txt
> +++ b/Documentation/devicetree/bindings/pci/pci-armada8k.txt
> @@ -24,10 +24,9 @@ Optional properties:
>  - phy-names: names of the PHYs corresponding to the number of lanes.
>         Must be "cp0-pcie0-x4-lane0-phy", "cp0-pcie0-x4-lane1-phy" for
>         2 PHYs.
> -- marvell,system-controller: address of system controller needed
> -       in order to reset MAC used by link-down handle
> -- marvell,mac-reset-bit-mask: MAC reset bit of system controller
> -       needed in order to reset MAC used by link-down handle
> +- resets: phandle reset controller with int reset controller bit.
> +         needed in order to reset MAC used by link-down handle.
> +
>
>  Example:
>
> @@ -49,6 +48,5 @@ Example:
>                 interrupts =3D <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>                 num-lanes =3D <1>;
>                 clocks =3D <&cpm_syscon0 1 13>;
> -               marvell,system-controller =3D <&CP11X_LABEL(syscon0)>;
> -               marvell,mac-reset-bit-mask =3D <CP11X_PCIEx_MAC_RESET_BIT=
_MASK(1)>;
> +               resets =3D <&CP11X_LABEL(pcie_mac_reset) CP11X_PCIEx_MAC_=
RESET_BIT(0)>;
>         };
> --
> 2.25.1
>

