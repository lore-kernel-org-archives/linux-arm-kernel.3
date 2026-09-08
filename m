Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21EAC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApssUKPvTBDPBMVIhSzHAqwCbeQAa06dIhcXYuDQzKs=; b=DXxOa6BAbvTpwoiriQMitFbW7w
	Df3qsrCYeiRBwLDgsJS17j1pydMPL/vAtyNIx/mzgpD+Ni4wiAI16SWQq6LTpkwp1yDNPGS3RIyWp
	MKntsah7cVeOijv1Mtq4RdcPXGSTU9vpfcwVa/V3Er55UoscKgdloE2V3nn1FRO1/vAnW/y6eicvc
	qq6w4dH/BIh+6rKof7kIAjnfYtU5dIGma/x7pL5KLYkbKF5XhvMdfoxgsMrxH85MKph+GUYBUSDCz
	A/XkCVFPg1j/BKitALdzs7vddeEmXws65gYzybWM4/enpPZVt9sapUTyoWjeKo0/60SJ2LQlP+Ldj
	WFh0xJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rTO-00000008S7S-3wAD;
	Tue, 08 Sep 2026 08:46:35 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3rTK-00000008S5l-1t56
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 08:46:33 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97ccaa61510so752435241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 01:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857188; x=1789461988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ApssUKPvTBDPBMVIhSzHAqwCbeQAa06dIhcXYuDQzKs=;
        b=aTs1a+d6GJpR0fj9MJdaPYxDZUAExcORnmiOcDx1OWUnR9Z1TlTB3zVBG/ZW7vYusK
         6+6nECrmlFL3ugBChlik0l8rtCRo9Z5yemNVtkkhAA+Xuf7qnKy6/c6OyuT2AVOpmIft
         1xlf8q3+euPEsb7uiSCvh1bPviZvM4arhdk8vL6wlN4ZNPXq1nKs1Bc+val1do7BRrkM
         oAeNeiFqRqTwrASBReAQt4dCAcI7TDAklBRqmUuCqUfbN8Msg+t7m5rUhoxdHmsxVjwT
         5gJWnoozn4WA7BbOsjouBniAo4Pj5u8Msksl/k4TGlgnUnNq6divmWEm4hqT1Mqyh9P8
         4K2g==
X-Gm-Message-State: AFuF++lj/8Jpl+CH2Jiyw5iOSMV1DKaMvtZ3ZAxmCN9bRR/OBltFyB1O
	bOb5zrihb0UWeyCF7YN0+HZ9hcro7aYvMZA1USAWjaKXwP4SRndzeRcAjXaOxLjB
X-Gm-Gg: AYBFou1O9lLH5rwIjrRcl0xGebhK9CFtG+/86OFs8NOOQAO4D+wuh4eXsdi6D2SkKLE
	b6RYEWX8QkqQD/GI65+GjmHti7IlUXQBoPT+x5xr53zo3TWDKVcOSFUxzDrEP5XbnXpZAh89HpX
	rtgqWa4jGOkmHWUEHE9nhS4NOBf2IjYDpp5JGiQ5FPgya4jfxhLc2SGPXoEe81AmObCgwZTjuRZ
	A2+1kmBuFtnnGmiUW9AP5R9tG4KARYVr+Ekq8B1N+fv+cUBF+MZPMGduqNynCOjGMkUcxnvU7TF
	uvYx65LfJaOr8Bp9oqzsHCQ8gaIOR73yYBRLeK/9j12ieCIJ1SLmhfXjjBVv6iEpjxpTZo6AvRf
	VKt50W6IStBIND4R8TN0ASDNwsHIe2+RLY1BwLRGmJdOOPE7mUI58B+Yt/yIyP+vmLc4ecdmJWY
	nHwBoA0NQaDQiJRD7Hx4D8Qc7tb7mmG3lBCo9ofQvsGeNw6IvZOJxB2lIkOdiRzjCoImpnn1MPu
	INUGgRyy2+hEm2Tesevcje3PBGLjA==
X-Received: by 2002:a05:6102:1483:b0:77b:2881:580b with SMTP id ada2fe7eead31-78a4a949f58mr10644283137.4.1788857188325;
        Tue, 08 Sep 2026 01:46:28 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-98097de57d4sm7826396241.10.2026.09.08.01.46.27
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:27 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5bf9506704fso1970505e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 01:46:27 -0700 (PDT)
X-Received: by 2002:a05:6122:e189:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c7ed3d6e40mr12626919e0c.5.1788857187476; Tue, 08 Sep 2026
 01:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
X-Gm-Features: AcwNN1X8I3PAUGIRvp1JcLzwLyyr5hfRt4h4h2_fZyfEgH0XnWVqbEIcNTcm87E
Message-ID: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_014630_493625_82A0699D 
X-CRM114-Status: GOOD (  27.62  )
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

On Sun, 6 Sept 2026 at 16:01, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

As I am not PCIe DT expert, I am comparing this to the corresponding
patch for R-Car V4H, which I have already queued as commit
7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
update PCIe nodes") in renesas-devel, but which probably needs some
updates.

> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>, <&cpg 1121>;
>                         reset-names = "pwr", "core";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its 0>;

This has an extra cell "0", which is probably correct, given
"#msi-cells = <1>" below.

> +                       msi-map = <0x0 &its 0x0 0x10000>;

This is not present on R-Car V4H (which is probably wrong).

Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
documents msi-map for endpoint node, so should it be added to the
pcie-ep node, too?

>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

