Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90BF5CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 22:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=62bFE+9EiC4Wl6sR/gNVDtGRVBnRqEmz0YnELUX+5Xs=; b=I8+aaPzhRNtC1xKxWBSZZgg/o6
	lQwiHexaFqnN1c8OHCyeBRxD9+nc9aFdS1Z5PC1ySrWon0u8mn/Fg+xmlUAq+qO88Wb9XTPoOLRLe
	E0OQ9vJZylPcDtCZ2X5fDuMB35pP2zfcHMOsGmVCAsbLzK4AYKw22nLHbWGp4rvdPR9MoB8qMrbsc
	lv99265FdxJ0GPz3kg1MxrLGMR2g1HKuT1r1gNSR3ajh7sQhi8nErdob9DLX/gxCfNJPhPNqVXxLJ
	8ddaiDgXcLLy2rNQDt4BXuWRL9hh6yNYDO0n8i8EFOGIp753QeBXtqxrXv4Nz8vhV8sMdAHcBziE1
	wpVFSvgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRdu-00000008QA4-0YqD;
	Wed, 10 Jun 2026 22:43:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXRdt-00000008Q9o-0LtZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 22:43:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 412154463E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 22:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3DA1F00A03
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 22:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781131404;
	bh=62bFE+9EiC4Wl6sR/gNVDtGRVBnRqEmz0YnELUX+5Xs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GCDhfGUXvvVNHLXhr3frkjO1Rp4OtsKp0qM3R31fePjb//IULavexvDmNUUwA04Ub
	 Dzlzh2pzRTGy59f+l+FcFl6Yb7JHo1erepIH9ag8J/kku0Cip94/n/lnMR10AXod+E
	 Eo9yh0/1Iz8nn2Z2avr7KPAgjzoa5BEPnlspQTzlg3rKjx1wz7yacqY5QAT1hJvXmc
	 p+h4mmaqYQXlAywwxh+PM6aAWHmctdeOpMdFSOJmYCYFWVtcq+mLZQz8SbOiIU5i+B
	 W6h3yZfiZGrVAGQ4KxdyXBJ5+NYJjpIS11ozMi8kHTJQg+Iz/vEkAJtdxm8C+VNjjZ
	 1YzD783Gy0FgA==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso13150023a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 15:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eMMrIBCWy8TkcuseAe+Xl+K3Nd1Do7Xuw6CQ5OXi7VFEJ4KM5gIn8fmKDLwcTTUdzUBSvldP0N2n4GttgyeCf@lists.infradead.org
X-Gm-Message-State: AOJu0YxH/3nJGy1LhljSHayyG0xU9z+MkW0J7ycKD2iNQIfaPt+vZG+C
	lyN9GJ10YCcQxgrh/cXuechseCKNHqRENJzunKhY+OJi/utXRwHXMBJucWlCk510XIT7VzyrFf7
	ADnVsP5I3cG0+CU1UBJsZ7MT/IL2t5A==
X-Received: by 2002:a17:907:c28c:b0:bd0:df77:98bb with SMTP id
 a640c23a62f3a-bf3702817fbmr1479114866b.9.1781131402612; Wed, 10 Jun 2026
 15:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260609151212.29469-1-ansuelsmth@gmail.com> <20260609151212.29469-9-ansuelsmth@gmail.com>
In-Reply-To: <20260609151212.29469-9-ansuelsmth@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 10 Jun 2026 17:43:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJdBxsbUK+n9h17K9SC7ojcPxemeijJhUGQt9HuB82OYg@mail.gmail.com>
X-Gm-Features: AVVi8CfnalHGFSDJtFBoMIJ88H-i-Yw1YCOHz7GBxBm4GdczRrsSV4xJzXraBNE
Message-ID: <CAL_JsqJdBxsbUK+n9h17K9SC7ojcPxemeijJhUGQt9HuB82OYg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 08/12] of: property: fw_devlink: Add support
 for "pcs-handle"
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jun 9, 2026 at 10:13=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:
>
> Add support for parsing PCS binding so that fw_devlink can
> enforce the dependency with Ethernet port.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/of/property.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 136946f8b746..e6584a2f705d 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1392,6 +1392,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-cont=
rollers", "#access-controller
>  DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
>  DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
>  DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
> +DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")

There is no such common property "#pcs-cells".

>  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
>  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
>
> @@ -1548,6 +1549,7 @@ static const struct supplier_bindings of_supplier_b=
indings[] =3D {
>         { .parse_prop =3D parse_interrupts, },
>         { .parse_prop =3D parse_interrupt_map, },
>         { .parse_prop =3D parse_access_controllers, },
> +       { .parse_prop =3D parse_pcs_handle, },
>         { .parse_prop =3D parse_regulators, },
>         { .parse_prop =3D parse_gpio, },
>         { .parse_prop =3D parse_gpios, },
> --
> 2.53.0
>

