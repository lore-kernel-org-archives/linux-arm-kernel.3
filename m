Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED48106B539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=71PZmwBCGt13+2E2u4S7ZamRqElFJ3XFkvVJ95R0Un4=; b=l+faqcphyiBLZqd95Z2zqLbug5
	XRutbu80KPHYPfiAEXSC9UO7hjtyECks7FxDMul3/08Pk4k767jZ7SJAzerjrYSda3gZNbzxnyg3p
	FxTw46PKnlB0E7uHNjRawnGQSS8gHEgkX03nB2sVoucIKEJt9V8VHMA+y3KoVY/4Ch727Yy/wu36z
	ry01+ySLvrBwuAuy4cTOVgfcYIc7Rs/9uL7fMuCLBKXQVL6hyW+hKcTaiOD0Ci8l5K3sedZrI2T/w
	pbm57CvGsXx2OKP+56oG+d/Z3qbbwIkm3M8/d8qSHeIhQhfQjbSD0GvTa9fp14x089DfTLdCIWmG8
	LGxBkH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OLR-00000003TFx-1ap2;
	Wed, 25 Mar 2026 13:32:25 +0000
Received: from mail-ed1-f49.google.com ([209.85.208.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OLP-00000003TF2-0OtS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:32:24 +0000
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-667de793310so4430313a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774445541; x=1775050341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71PZmwBCGt13+2E2u4S7ZamRqElFJ3XFkvVJ95R0Un4=;
        b=LGbXKUEt1aDAaueeegvskBMI0ykRYXCYj/Ymg2iToAMozdJGYEX7r5FOkVM8/fyGN+
         d3oSUtpxsCd41Rjq4gJu37u9xi3yg5Zc1/jXTnLPiYmvzYyxKDd9KwwCXAnyzhlhmjsw
         DUAe3KLjGegFQ2N4+04XvWJH4pssmI1FY6/iZ2xbfP7hTqFPDP343oQBkKCpqPqTAZ7i
         MPkuxWmGS+m4PH1TpVdGKBYTRYlJxANUw6gJ5qYODV5xFochh+Hr5HDCWRxeIl0gx8h7
         Y3NTdMbzdB5xpuiE2GdTbE4EQ69LEyYiJP6fuNergFs2TNT4LmvHg9JjIE7HoUGMm87l
         h9Vw==
X-Gm-Message-State: AOJu0YyZk9KxM492hLD6pzmi5NrDArnypQ4+TZ9WgU54sJlkF5Nforri
	iXL9L8O744xvl2RZsYHWYaTAlhB9jo1yptZ+l0wUF+KAAcpPDrl4t2Jy91cNNvMYDVE=
X-Gm-Gg: ATEYQzwDWBCtJDZj9/t+BfRBCgpJS2Rtft/5o3Pn7cIKTBc+ywRMPvnnzU/gy6y9tZj
	UZ1qDDvG19bpgvJMIVGW8zFQ+6C3fS6FFhVkokwi92uSt5RJGCZLnRskbBpwUEEaTEiWd/GFAeX
	xpgW7t9pKxYgOyZShEzfl2yJyOV8INDnFn1cldw4R80IFnNLOsz6sT3J5raadKLgHE5sFubHHC5
	7uEie1aiLjEnE1TkzONQmqC8wf+WB5/OuPfQE2YBSKZR18wmJ1x7eIAh4sfiofNB0BCD6Sr/U6J
	8V/Q7HrlD4Td/CIc89MNMQIwNWizqnvTmMWJhJkmv8nU1HkWTOA9BsSS3F9tzwn11iXX9ApGbaQ
	sgsEW+Gk59jjWTPVg0TNTaXL/uHf66GGeEB+mCtpKgMcVBEO+l5wjWyDDbyfb//5syogIlwTI++
	Vp98B8g9BJLilfnaDvWTfVT00rP52b0ylzvlYaDJVf+i8rtYs+swEAPfoDTpcg
X-Received: by 2002:a17:907:c91f:b0:b98:8d3a:7d26 with SMTP id a640c23a62f3a-b9a3f1718b5mr172129066b.15.1774445540569;
        Wed, 25 Mar 2026 06:32:20 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335de0b2sm793441466b.34.2026.03.25.06.32.19
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 06:32:19 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-667de793310so4430240a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:32:19 -0700 (PDT)
X-Received: by 2002:a17:907:c08:b0:b98:6984:661c with SMTP id
 a640c23a62f3a-b9a3f14900fmr255405366b.10.1774445539317; Wed, 25 Mar 2026
 06:32:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260320025328.509003-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 14:32:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
X-Gm-Features: AQROBzATJnixo_UeI8ufWETnQDalm61zGkrEBTKZCHPPX7aWGGL_4MFy_z_N-QI
Message-ID: <CAMuHMdWO9Qc=mn1SAwZt1HJK2VkU++G_8N+eVuN5AWTrLnVxUQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex
 MIPI-HDMI adapter
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Scott Murray <scott.murray@konsulko.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_063223_143985_216B33ED 
X-CRM114-Status: GOOD (  23.52  )
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

Hi Marek, Scott,

On Fri, 20 Mar 2026 at 03:53, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> From: Scott Murray <scott.murray@konsulko.com>
>
> Add a DT overlay to bind the Olimex MIPI-HDMI dual-lane DSI-to-HDMI adapter
> on the Retronix R-Car V4H Sparrow Hawk board.
>
> Current device link is at https://www.olimex.com/Products/IoT/ESP32-P4/MIPI-HDMI/open-source-hardware
>
> Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Overlay for Olimex MIPI-HDMI adapter connected to J4:DSI
> + * on R-Car V4H ES3.0 Sparrow Hawk board
> + *
> + * Copyright (C) 2026 Scott Murray <scott.murray@konsulko.com>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>

This include is not needed, so I will drop it while applying.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

