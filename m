Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97B6C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=; b=tca5vNrjrkFUsKluSpeBwS51VW
	Bymt+mm6CvuvPL7ieDlhX2gH3SE8fF6sV9dDmpPFZx9g2j2AGyLcmBKc2Ttt+DwhhFQPA8/WDipGr
	mijLEivxxbb5V45t/zprujVFuBRoPq9lZW/6y7w0wl4BTRSEluBd4NTU0tpioSD71QkYIYfIvsV4l
	mds6M2OgZ3oOaM8l+Kjc0cffrpiJIl7yFBeWEN48luDQtLrC+ITIRcRsGHbMqu9J0EqAMyhH5fQb6
	lgyqjMLW3ypijFZ5/OL/5P3zIlJ89R8Opax/CYLlJ81V8QfTwALacUO184Sr4J4gd5FykQr/7X0tk
	TnFBZktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHnx-00000002LiC-3u0I;
	Mon, 27 Jul 2026 09:39:25 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHnu-00000002LgU-3oCJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:39:24 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-80e2cfe6918so22573517b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785145162; cv=none;
        d=google.com; s=arc-20260327;
        b=SeqeEtSLYwuXRckrCQEbwQl0H9oPEsWOwkJbmLP9MO3QICTJ+prRL63PMXlM3wXgI/
         VG/tscmqFJMWKkD/J3wXPJi/4/rbZkGH6yUdVLHO1iCnNi9CmqFaEhDQEhN0GuibJq1Z
         F4uiGFvFvnaoXRFA9nfugDc3EsvjVnYghLZek5v9H40Rtr3V6KCNJZ4iCXSG1UDRjldx
         lxo9lmg5Z3wJzBMXsE3r2T23F3jd41H3xsY2teGXu2H8e8ZwaTw9dFHuUTU1vvcGqxeT
         L5Z6VJ62hm4nvrx7rkBBSHnEbs/L6xFH2audD+42BEibAeMYXUdT8DzX/YrB9un5+tWX
         i8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        fh=H57XKz3fDab0CAeuFzHFdiW/awjkce2KjLXkeRSok8s=;
        b=RWAfRowKRsuYT5bIKrIF4HVxOjRaUIM8o9X1eh7p5ogF31Mit6TzB4YmQg54uI20V/
         1Ax/hcdJ++6Z6spcslO24VizZkoXjeEn/n0lp5TmXHDhAN9S6HV34mqtotep3ALxuAtq
         DlZPKwLE5nwiPt++I0RM96+mSpLjk+seNwCAdffTsx+rNMf/tHR0WGUwitW2O9LO0U2o
         pFfI3CzMT/Nxd1IC5mF9DqFLB3dUN1UHWNoPGVo9wJtJBqbO0Wqaaohf3XFUucSu24cV
         LioVY/q0d7DiiE/69A6xfp0Z3JnlCfCD2F2H57obrrajK0jC6VGjXk7RJ91TDa4+AxTa
         5Z0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785145162; x=1785749962; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        b=VwB7w0d8uJJ4YQOf/AAyHXI79Ef4eVFh+0oQuSq2CFR9qsxZ/w4wu1INIAFBi4hvWO
         Ev+zX/xu/F+BX4d3jnNFD6q2GrUNoWdf8ZVCR3ZShD8nkbzA1Qswb+yC8lgLnzUiij+l
         hEVfUdaxayOkxdaF4XqFPfFqlUC/TBOuOFSKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145162; x=1785749962;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YQ2tgjM+wXy4QeurUPVKQ/lR4Rk/RqXxn7O1aD2yYY8=;
        b=qEzuahtbxd59ExyeMvEzBcZclY0hEOtaIL9sLO1TQBifwb16GLEg0w/Si3o+RA23mE
         zKD6BemeDAiumBlqaZEerd/IgrJu8D95m/obn58iRqoBnZQUR1e4BGq7W42HWNeAMwB5
         oVb2ZQ2Q7yFWT58a4rABXThEoFU+a++Ki1A8qniCw+JjOAuR4TIfi441hILcfoqa5ybi
         gQdMDwJrG73cpECSUHnRofTnRReZ4ttNKUXN6PD6HZnzFM7mS4tATnUOYDRVS8ngAVjG
         Z3v/G7jo/pNZBhJSdxlxT0+urpj06mMBDGcttBwApJcPTNteP1bCU9DhNItPEZG5SRY/
         /+JA==
X-Forwarded-Encrypted: i=1; AHgh+RqMo5xt2E1mTo60CDnJclpwKZdcUKKZSrBp5LWjS/vx3mDydfr3wwOwnmuDE1rPSelWayWb/Mn0AXIq6d2WWYqX@lists.infradead.org
X-Gm-Message-State: AOJu0YxM37ZinoQYTZJOabkYih92EqlNTHGtYU2Oogv9KFjvh9+3w2X/
	lRQ8+QYmi/9TUx+G/m9JL0yecRK3tog4XCmHZy35gMzkcS1Z+J4XPX5s9AFFaTQ+CtCWaZLK1Ta
	OgrvNTUk0Hq/zbM08PlbCBLEHNtxWEYzrztExDn2f
X-Gm-Gg: AR+sD12jCTpmNqLjPQqq4+1RH/sHT4k1HhA+89gYNdhyRwj9svgV/eIcQnV+W4rJBmU
	UGV0Svdp+dypcXUWtjLPBXyE6jRxryVbkv4TQt3rsfuXlqPX/KYlKo3WkfsYhiNxpCtaYVR02Wv
	8PvCVmaRHFZvUAeAj6W16iBiEjmvKM+nnYl4tpF2IYEBQJbL4fQFg3EUWGPwOkB2LTL+duf9jeD
	xbPsKYAln5Qrf5BXnY5C+i9VNfU5osbD3CX/Y95jAOn2Cqv9AEG7QyGnbIlykptevxGESxbMm8z
	QfyVL96Lu0xJnvQ=
X-Received: by 2002:a05:690c:22c1:b0:7ea:809c:2af5 with SMTP id
 00721157ae682-81f69dec43bmr26374967b3.37.1785145161730; Mon, 27 Jul 2026
 02:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
 <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-2-0f2ae41a8e89@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Jul 2026 17:39:10 +0800
X-Gm-Features: AUfX_mwlgcUapUfGZW2dMAil1rMukXcM2pCT5Z8U-x1BRJr_pwTehuo1NL79Xlc
Message-ID: <CAGXv+5Et=hVYp74v8p5FhdrifjUotPbtp8XqyNuCV+NvJ_LMGw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] serial: 8250_mtk: honor DT serial aliases
To: Carlo Caione <ccaione@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_023922_983798_0595FF51 
X-CRM114-Status: GOOD (  21.51  )
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

On Mon, Jul 27, 2026 at 3:40=E2=80=AFPM Carlo Caione <ccaione@baylibre.com>=
 wrote:
>
> The Genio board DTs provide serial aliases for all enabled UARTs, but
> the MTK 8250 driver still registered every port with the default line
> number. If uart0 deferred and another UART probed first, the 8250 core
> could still assign ttyS0 to the wrong port despite the DT aliases.
>
> Read the serial alias during OF probe and seed uart.port.line before
> registering the port so the 8250 core reserves the requested ttyS slot.
>
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Matches what is done in __uart_read_properties(),

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  drivers/tty/serial/8250/8250_mtk.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250=
/8250_mtk.c
> index e6a56cf54ae0..841d64f6a707 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  #include <linux/pinctrl/consumer.h>
> @@ -521,7 +522,7 @@ static int mtk8250_probe(struct platform_device *pdev=
)
>         struct uart_8250_port uart =3D {};
>         struct mtk8250_data *data;
>         struct resource *regs;
> -       int irq, err;
> +       int irq, err, line;
>         struct fwnode_handle *fwnode =3D dev_fwnode(&pdev->dev);
>
>         irq =3D platform_get_irq(pdev, 0);
> @@ -575,6 +576,10 @@ static int mtk8250_probe(struct platform_device *pde=
v)
>  #endif
>
>         if (is_of_node(fwnode)) {
> +               line =3D of_alias_get_id(pdev->dev.of_node, "serial");
> +               if (line >=3D 0)
> +                       uart.port.line =3D line;
> +
>                 /* Disable Rate Fix function */
>                 writel(0x0, uart.port.membase +
>                         (MTK_UART_RATE_FIX << uart.port.regshift));
>
> --
> 2.55.0
>
>

