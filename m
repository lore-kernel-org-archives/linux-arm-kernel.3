Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCF1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjx1ETi0pE66yaW23Sda3TmvYDKWG3Oq92tmDl3ve2Q=; b=2SWk3oSXj6CNle+ZTgf0BSZLCC
	jbjZbHOFeNKkZie2LxHPqF/eubZzM5wlHVw6A/fI4lLAm/NAb7bxRmqY3rJcP4nm8fCr69HPTuhaH
	9koNjGMQ7tuBKn/2gstcbMtbyDYklr83zHLjkQKGmVIPrK4j2yRrhMwbKRhiZ7kCPykB6xJuRGa9l
	eUTSA5ggp76uiOLZuH+7TIB2MOG29l9ODiWqYbNXYNc2/3RblNwNCURxIKwqGDEmf7caPXpxwWI16
	21B6WRhPHMWr1fjEuN53j3QtaK70z2N1fEj9kQYV1hOI5GG8UX2lWvFLeRvu2NSwiZXKZ3E1x80t+
	UGsNsJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7xC-00000004dtQ-0ur8;
	Fri, 10 Jul 2026 09:55:30 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7xA-00000004dst-0v9v
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 09:55:29 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5bdbd631a6aso564120e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677326; x=1784282126;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xjx1ETi0pE66yaW23Sda3TmvYDKWG3Oq92tmDl3ve2Q=;
        b=mYYEN7brola8lGNwx2SfLoN/SaIpocJf0JNmkKZJ54PTp+26Bmq0Gm0xHa5il4IrhV
         SDcz4XfTUKhIPiRwr+uWjr6MH4DwEKj1XeqjsiZ8uHYL8d9fzHYMlJ4FTUVjBv6e9Ab2
         ni/on0Pby4qNpZmTSly9NxYv8w8S0PEFRvl/qhM4NWoA0D1/TU+W5TOB3LAXBzkhuU/R
         cfjjUaQAwZ6UBDMBPx1/XejplWQu/JhI89Qbkgz2rXkOM0IbUuO4P4AQlpAbosnOiKMv
         ZJ8u+hofpz2ZyBm7+YAn1kYbthjK1qTG4Ueh4mdHLaeSf2ozJXEUBHV8qJjZmFRu/kJs
         Lr4Q==
X-Gm-Message-State: AOJu0Yx1DB9loPUcz5m+olXxu3IC1FjMLYfevOTqUNPFvpB5aIfnEUYW
	cm4UgVlJscGF7L7VeusMEx1HuUkyYpVxA1k/yvd/mAA1JM7K2mQVqZkNk6qt/kBKMbk=
X-Gm-Gg: AfdE7ckSVTjsy8TmJJpqpuKntl/rXedid5v3y3NspkKVJts9A/5Kys2xh6H+OJBmkJS
	zRPqW8aKiKNS+shZ5+1i6+j78BRBGhd7AcRr8x6Odz1x61/VLtM2sfbuQX0iCpsIM55Oag1Y5AQ
	0TkAS04slv46DFEVNSmMGA/RjIQPO3WDyC1cdV/4JInk/L+ntLVpqo/vTVDZhk9fUTEBw5uMHkj
	uexj1SFPTWx8NO3BSjdmoa44vfvxn+1+pZd2opQXKLsAcnihKtPcIjMSnx7UImN1kBsd8GGS8JA
	WHGMhimc2r30Ha3KxGiFwRR4Lf2I90+oR5ZoOkaF5cLgnell/ZvfBcZs7O4OLzBGb3rnoTHP+jk
	v8/eregSfjaQFLNRVCdhoeguQaoyfnk2Wj+K/KlHabyaPupPwvtjH4ZUfy7KEZEf7Qh6myMvqvH
	yGo7pEW6pTvX2rvm8ZvEh5Tw5neLuiud4cQLl2UxPNgr60uXgETg==
X-Received: by 2002:a05:6122:6598:b0:56f:696a:4fec with SMTP id 71dfb90a1353d-5bfa54bca17mr1502215e0c.5.1783677326291;
        Fri, 10 Jul 2026 02:55:26 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf8bc8e082sm2328543e0c.1.2026.07.10.02.55.25
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:55:25 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-7370ea43b9cso1052265137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:55:25 -0700 (PDT)
X-Received: by 2002:a05:6102:40cb:20b0:744:f2bf:44d2 with SMTP id
 ada2fe7eead31-7450c6bee09mr1250670137.3.1783677325709; Fri, 10 Jul 2026
 02:55:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260709221245.146406-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260709221245.146406-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 11:55:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBJuN6ZJzTMU_Ww7ZUm2Apmp_AaubAE-My6DK334pLPQ@mail.gmail.com>
X-Gm-Features: AUfX_mwl89Zp9wNyF-c_GbFzjrveXMEBWiOpAsRGPClNvXP8eS2mrd7PvQf895c
Message-ID: <CAMuHMdVBJuN6ZJzTMU_Ww7ZUm2Apmp_AaubAE-My6DK334pLPQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_025528_269010_568A515A 
X-CRM114-Status: GOOD (  27.95  )
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

On Fri, 10 Jul 2026 at 00:12, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The DBSC5 DRAM controller protects DRAM content using inline ECC.
> The inline ECC utilizes areas of DRAM for its operation, which are
> in the DRAM address range, but must not be accessed or modified.
> Describe the inline ECC carveout areas used by the DBSC5 controller
> on this hardware as reserved-memory, which must not be accessed.
>
> In case of high DRAM utilization, unless the inline ECC carveouts
> are properly reserved, Linux may use and corrupt the memory used
> by the DBSC5 DRAM controller for inline ECC, which would lead to
> the system becoming unstable.
>
> Fixes: ad142a4ef710 ("arm64: dts: renesas: r8a78000: Add initial Ironhide board support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
> @@ -107,6 +107,47 @@ tee@8c400000 {
>                         reg = <0x0 0x8c400000 0x0 0x02000000>;
>                         no-map;
>                 };
> +
> +               /* DRAM controller inline ECC areas */
> +               ecc@10cccd0000 {
> +                       reg = <0x10 0xcccd0000 0x0 0x33330000>;

I think you do want to include the 64 KiB block of unprotected RAM in
each region, e.g.

    reg = <0x10 0xcccc0000 0x0 0x33340000>;

While that block is usable, it is not protected by ECC, and thus can
be subject to unnoticed corruption.

Alternatively, you could put these in separate reserved regions, to
make it easier for users to re-enable them if they don't care. But
those users might want to disable ECC completely (is that possible?),
again suggesting to keep them together.

> +                       no-map;
> +               };

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

