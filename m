Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990ACC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeUQG1VkSQkZJejGzniJ85mMFqiHeVxBeYS5KK1IWx0=; b=c57B077NlVSj42rEg9v8oaXPey
	6mtaa/z+NgBH1bAaVtawY3zlse9OCeYXvi+T6PATJnpNXFZKUdS3TlZvDZceIhaaggwoy89DKEsQx
	gBreFNhQiSSUzkmp2HrI5MCIgADVuCV+wkkjVDU+gzPi/5FDzhXdT/2GuNytz6zKOStm0AD3vLfU5
	18ZzEgP6nj3U6cFylHo67ySsQM5hF2BjqkrVxe6nwRTlanETnLBnz3MAz4srzKq3Y1HNfh4V2OjkJ
	XPO1cjKR0dTFhl2cmQVB56FczyL8dzl+CrbFdnKJa0+O0DYdGR4m+D/mveDyGBhIEIbIq4FFcHs/w
	Yt41l6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukMJ0-00000002ohi-0ZUA;
	Fri, 08 Aug 2025 12:34:42 +0000
Received: from mail-vs1-f54.google.com ([209.85.217.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLyi-00000002m4i-11xu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 12:13:45 +0000
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4fe7712bedaso1833598137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 05:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754655223; x=1755260023;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TeUQG1VkSQkZJejGzniJ85mMFqiHeVxBeYS5KK1IWx0=;
        b=P1momMRmcnxI6dr4KxHmD/tEB4dPufvuJLPzFEgYzgTLjyuWyaw4lCp7im/ixiyRbX
         MB9w2h8+Zwwclv88O1QmBI3TrQ6jmVt7092yV4otg2LP2vjqmZdXBAzK7WdK8AizLUvN
         DigwhNXcbplqEc08ykfLmcbB0zJEeSv4nQ6Nk6iOJcV4Jy/fQaxNUpGzJBE6Mr07vG7N
         LqmhfbjAPEDyC4M91YUd5P2cqIeJBCM+EdHu0mpKi2NzcQ5230qtdzQVEN2abyCRQsWt
         hAgagL46slbprFslmrBQUThZSknmWlQ1zyMGaukC6G+/uQT5pZ0BjexRGF5RJHsZzlLo
         SRHA==
X-Forwarded-Encrypted: i=1; AJvYcCWnGm7Zbr+565kpMVATxdkXxn7aUM4o4ifQT8KMw6aU86CFJmQKPCNGx7EVYP2GDXZ8j1X4p1dqR43uYewPH7/C@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4+xFkqx0xNdtpDHnZWgMhofVHx72EQIfPYDx7JzPIALOnPghb
	wRAnlI/PaR6WvoKbpSTQBCkaGfRTcnN/i/H0WnYFU6PIghc7dVvtKmXbOA/HrmXU
X-Gm-Gg: ASbGncslxMgEmjnGT3YVbP7CuXeS8g9xAn5BumeAgjxv/+GJqVvi6jgxIsHBmrF/rOl
	86HHIUijytT7Jl7Vtiev62ex6Ihv+XXU/32KeSaj5ziuNJQsNpbekZsrU1ZKboz7wHV5T1N8+uf
	/sERMf+6avJY0NxzP+fKJ0aelNyASjkGX0EPpztsV0guJb0j9Tx8Sk1sWQVfsdvRGale5smHVt+
	rxZsQ1f/2LLCpR8Nxejru3T93BM7hgpsN4hwvAJlgcSmPx7vF5oDswUPk8EKiCqxD3PVRd/UIWG
	ELSLH/YGswo5SuoK9xm1B/LULA+uKSP2BnCYAcPr+Z1+9iFkal+6aWMsFBh4qLC5qAcj2FKtguF
	oM9ooqbmJ7S/HXqHP7CyhwAuSvzcWaYie+e00kBT8ErWsPirObdNTvQ6HqvS8
X-Google-Smtp-Source: AGHT+IHr70gJXCEdK51Bvn20PlFfdR2SjzTRVpNF651A93oQvP1u+ea2SPF4JbjsdZ5AS4aGTE4M6A==
X-Received: by 2002:a05:6102:5cc9:b0:4fb:142:1ff5 with SMTP id ada2fe7eead31-506104d8812mr1032668137.26.1754655223010;
        Fri, 08 Aug 2025 05:13:43 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88e029cd3d4sm699064241.23.2025.08.08.05.13.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Aug 2025 05:13:40 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4fe7712bedaso1833544137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 05:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWt3Re2KWXjONZT3aF2J0avmJu5Rwm+XVyXWkkktyAdqBM3Su/70GnG7zymlwLt4Yr2Z6T6RCgAoHYItb+WX1/G@lists.infradead.org
X-Received: by 2002:a05:6102:5cc9:b0:4fb:142:1ff5 with SMTP id
 ada2fe7eead31-506104d8812mr1032620137.26.1754655220395; Fri, 08 Aug 2025
 05:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com> <20250704161410.3931884-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250704161410.3931884-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 8 Aug 2025 14:13:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGOJHFaCUd7qjtGmRhwU0EPXpVVBuP31JgbCEADNF3ew@mail.gmail.com>
X-Gm-Features: Ac12FXzM8iJwkzA-RFb9JbCrkQWoOo3N-HyMUTOszuGFrs4cxQKU_50xLXL2bB0
Message-ID: <CAMuHMdUGOJHFaCUd7qjtGmRhwU0EPXpVVBuP31JgbCEADNF3ew@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] arm64: dts: renesas: r9a08g045s33: Add PCIe node
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	lizhi.hou@amd.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_051344_280765_53247774 
X-CRM114-Status: GOOD (  23.02  )
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

Hi Claudiu,

On Fri, 4 Jul 2025 at 18:14, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The RZ/G3S SoC has a variant (R9A08G045S33) which support PCIe. Add the

supports

> PCIe node.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
> @@ -12,3 +12,63 @@
>  / {
>         compatible = "renesas,r9a08g045s33", "renesas,r9a08g045";
>  };
> +
> +&soc {
> +       pcie: pcie@11e40000 {
> +               compatible = "renesas,r9a08g045s33-pcie";

In light of the discussion on "[PATCH v3 4/9] dt-bindings: PCI:
renesas,r9a08g045s33-pcie: Add documentation for the PCIe IP on Renesas
RZ/G3S", this should be "renesas,r9a08g045-pcie", and the device node
should be added to the base r9a08g045.dtsi instead (else everything
has to be duplicated in r9a08g045s{13,17,37}.dtsi).  When support for
the variants without PCIe is added, the pcie node should be deleted
using /delete-node/ in r9a08g045s{11,15,31,35}.dtsi.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

