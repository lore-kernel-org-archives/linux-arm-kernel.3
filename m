Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFA8CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mo1PDIngVzQULrr58NN09VAskSnKfapBsMnXdORM01Q=; b=kI0SI7Wdnuaidl8CQv6SFmfkiM
	98SarncNZGwtgHxUA9U3REeEw7fmtPH7ZsTyCkTDMMHHnLvbmpo5ATn11fqWF1yy+xoFoUONh9Ssu
	86STuzN09Cus/285IzGO4ShBiJociptmVlnaGlCRvyyfEG/SbzDliLKl7ijO3xknRtiiDotL3YpqF
	mIk/NG8cJzzxTDKcV3s6SSRV/cxhMi0YHPskeX6efvqIAGwA1jVBaHjIdBXZ7xqKYQWtVbJjydJ2n
	0lHCRzCqX5mZ4LWO3b7EIGDOhaXjfAG2+2ZuRU32FqwcFdrbAtDZYIw6j625N02Z8KFQaiOEvoWBS
	0+TbtAqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWDO-00000002Gnj-3RQg;
	Fri, 19 Jun 2026 10:12:46 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waWDM-00000002GnC-0OWU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 10:12:45 +0000
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-963d7e5ffddso1304570241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 03:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863962; x=1782468762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mo1PDIngVzQULrr58NN09VAskSnKfapBsMnXdORM01Q=;
        b=e6QzEVsmMTvLIYNJzLEd8PKIifSOCvRyXGzxUIkfyxWXEclBtubqe+EEylz/9XR89p
         EIuT0iDlcoyTBUVkPc7BX7h09S5suoyUytBAgKkgLHkEDhW/5+dHastPzLQ4md5Cw2dX
         kv6crsLLfF6yzGuw9cp5LnJmOhB3FkX9vUTXaRZi6qAt5sOOT+Cscsn5yBZ8m0rykyv0
         UKeSgnpeyGy97ubtShBUFDIOyJvcIwyc934i8LtYpwnv2vbfZOLofMi0qJj7tlpZPlOd
         LYi+V2XsBlHQFO+bum81JM6VauEnQh0QnBycxS7JFVJPih+G+TNrxt/dPwa/opchCCM3
         c5Yg==
X-Forwarded-Encrypted: i=1; AFNElJ+uxflM14im1zauuV90E70NgfzvsoW7Cejib4sDPLZ9EycS0OX/QH4YNszMH/vGuCP6N/uJ7uWJ+Ty49PVEgRRg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5hoAHVnsB32ft7TnwG0QY4NWvZsjru+JqYDOAfC92p/n7HEBE
	IJAgdAU0yNDIl2Ztaa/tA6WIVKJxxTc8E8fBl0pCykZQRDcOMCqG8ZnQNtoDjM//i8w=
X-Gm-Gg: AfdE7cmtYc37w824xCTK3D9vF2EY9SaXQkE0ATWympyCfUTmUg7RQ9jOtPaNgxlCSlo
	GzVN5Cbuj+SjvCYGyetfq1jQNcjBdtKIaUR35ujp/Q/6iDrni0rF/iErIWSKkIswTCIhbP9ZV0j
	NUZueN9RW1MEsb3CB/KTx6eGCsC1J3C2vhFra1HyAhDJYJCTHKV7LYzTd6hZzxMkNgEuibJScdB
	gS7CrkH9pwTDfpU8Ioot7iDVeJQFFOiASJBijKTRMG3cXhMSfxkG/emw3PaBBbWL0/buu/8Zoxg
	VOAaTFFuajJGhan+HEq/dm9WH5pNq7lLZlU7QcHUEmjPpH6bwKo5Pr9FL//7uKPNafxGnW4Fbz2
	3YFyNDUf1tAxxIWK37Ndnr3i3Yjf2fKYIRN1CcDeMD4jXQ0HYBS1Fp/89cpFgOO4Cca24B4NnYU
	FumkAo0Gn9+7HQ0hmDX91ccGQFBEUKsANdZ/CRbsolqWjPaR9AF9R7e0XyoIWAFaoX
X-Received: by 2002:a05:6102:3ec8:b0:65b:c17:70b4 with SMTP id ada2fe7eead31-72a737b1e13mr903996137.0.1781863961985;
        Fri, 19 Jun 2026 03:12:41 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-966fc4b8192sm1416746241.8.2026.06.19.03.12.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 03:12:41 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59cd803792aso1210357e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 03:12:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/2xZfxycDmHIERQfaDZdD3Jznpvut+R0tfGK+Gwr2HWH6l+jdB1viTGEgzNYGYuMHAfuPjv/dfR5LnwTPwXBAR@lists.infradead.org
X-Received: by 2002:a05:6102:442a:b0:631:b365:40f6 with SMTP id
 ada2fe7eead31-72a791d4da3mr721038137.23.1781863960783; Fri, 19 Jun 2026
 03:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com> <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
In-Reply-To: <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jun 2026 12:12:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
X-Gm-Features: AVVi8CcCiAuscESS9Te8rq8dRuRPJ8mfjoiRkMDvKP9iUla4C6bw5NFeJgmISd0
Message-ID: <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_031244_139222_1C175A8D 
X-CRM114-Status: GOOD (  20.45  )
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

Hi Krzysztof,

On Wed, 29 Apr 2026 at 20:52, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Make going through `make menuconfig` easier by disabling the unused
> Ethernet vendor menu options, where no actual driver for given vendor is
> selected.
>
> Impact checked with comparing old and new autoconf.h:
>   diff ... | grep '^-' | grep -v CONFIG_NET_VENDOR
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your patch, which is now commit 32379ad4060b6fc0
("arm64: defconfig: Drop unused Ethernet vendors").

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -349,15 +349,33 @@ CONFIG_VIRTIO_NET=3Dy
>  CONFIG_MHI_NET=3Dm
>  CONFIG_NET_DSA_BCM_SF2=3Dm
>  CONFIG_NET_DSA_MSCC_FELIX=3Dm
> +# CONFIG_NET_VENDOR_3COM is not set
> +# CONFIG_NET_VENDOR_ACTIONS is not set
> +# CONFIG_NET_VENDOR_ADAPTEC is not set
> +# CONFIG_NET_VENDOR_AGERE is not set
> +# CONFIG_NET_VENDOR_ALACRITECH is not set
> +# CONFIG_NET_VENDOR_ALLWINNER is not set

[...]

I am not sure this new policy is a good idea: none of this affects
actual kernel size, but it does increase defconfig size, and churn.
E.g. for the m68k defconfig, I dropped all these disablements
several years ago.

I don't use menufconfig, so just my 2=E2=82=ACc...

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

