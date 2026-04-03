Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9B5E7E358
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqTHZkYXx3XaUYuf56o3EDTX420ivEQjaKKZt4Gr+jk=; b=0m+/PdWPK7UYJPB+rQ/mBtKKnW
	V0c7qhPSOxs34YgC33/idnHeSA8pgjxh1aPTGBbXrsJmlh6OxJ8OMKMTrHnsO+jLBl6eS/lqNJY4v
	G+6o81r922pkpGsL+tWsVtJq5ex1DFi+S/mvLFj9bpHqlML/cEOZ8euw2z1ChQ7qGeQkVC8T6K/C3
	DPcr1iUN25l8fHEKADmTUwkyvr0SlU9gNfaAj3+U9sSHgVDU8TXLfSc7AfQAZqLkA3L7jJNiuMyhq
	PKgntvGGG530gFGAGPNzdhtpfCRYuBEgwixTntLRMKx1ugeWWTUJ2bsHaLoCWVYLeBiCj6F5xR1Cz
	ajrsdkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ajU-00000001n5K-3waz;
	Fri, 03 Apr 2026 09:22:28 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ajS-00000001n4R-18Cc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 09:22:27 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56d933b555cso683645e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208145; x=1775812945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqTHZkYXx3XaUYuf56o3EDTX420ivEQjaKKZt4Gr+jk=;
        b=T2uxHex6zHOzEqBdmBFbBKEcYvpmkpLlX8kp4VL/uhNLYA4+joROe3ORf2/hgrr0wu
         4ePk+rIqhgsNG9tsEJRlIJPlwzl1eolVtpjHwh2B5VS+fbLsQ6TzlFBNr0rxExLVbvrA
         PmAL+/9G7G83mYpTM1MaXAoT2twhrdlmCyvT8n4lepGTqChvRg1y3PgNTZWjJuQcn1zb
         EHkB9kfHc/ymFFelSTcx7wnSx/SkWmAdd8jwVe1px8fhNKBQWb1IyNVSJjkAT9kKcwuE
         xVndMGEKgVjjOrCKbatNJiqMCxsAJR33H0Ples8cyJLFu+liPjH3wSPNu4Ik56b+/X9q
         qjWg==
X-Gm-Message-State: AOJu0Yx/ZvPZrKYWhmqU4AbywgLrzXPmgSPMyYLtXzPFFYv7krfWrPbD
	/RePDspzC5ZK1Yl/fYN1q+OVp1cEDRScw0xjqKfJ0AVR4aoMsCpJ6Dq727f4j7Zp
X-Gm-Gg: AeBDieuMI4rvMhOH/GVH5C7+yMGyUvn+BRCgJ2e5G6k0zrHSkUzZee9o+SPCxI/oF5S
	4apZUGivwvKNctb7BsseOCnEAGTRaeNsKb0LuBAiXZXR5LXNrPfihzILCZaSkL+0v0MDt3cpOMQ
	qhZJ0LvCFiUn5qrsWg/EG5k99dS2NJFkF3RaIW8TR66cZhG8ppc/neFE546iRaOzhZUgfGtYBTA
	yi6Kc9S558lyECdRe3kwR/IOoSEDNb8rDozg7AX5BLbPzHAeFffGzped68ItctNPevBfDjlwCXB
	OoQbjnCtMP1IRgF8IOBr/K41Bcxww/UcUBYly9g3H3aQfohGuuIICVDG9ydHpBlwSfCXiTa3Oni
	Z35B0rRvp/HmqMQ29UWIV60hCFYUekfMPwHn/mgOTceF3LOYW+duUU00hQtrVy/vWHSACFL9+B7
	Dq6mEtqNxfSK32kFiRXkoQ2R6jlekJEb0h1iFYhdC5ZFd6b2SIapcb+qdewxGnySHs
X-Received: by 2002:a05:6122:c86:b0:56b:7484:39b with SMTP id 71dfb90a1353d-56dab87bd4bmr638182e0c.4.1775208144836;
        Fri, 03 Apr 2026 02:22:24 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb84c289sm5637459241.4.2026.04.03.02.22.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:22:24 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a9076813bso724930e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 02:22:24 -0700 (PDT)
X-Received: by 2002:a05:6122:698d:b0:56c:d623:896e with SMTP id
 71dfb90a1353d-56daba305a0mr682606e0c.14.1775208143755; Fri, 03 Apr 2026
 02:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:22:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWaXqvoyzFOMMtCuMchAJamOGD4WKG5_16sy7NAUvKVzA@mail.gmail.com>
X-Gm-Features: AQROBzCnb6VpPRGvatHwhBVrCjOQ7-o3JrWeLFgYVGZIXfX3Imq6Fsi--Hd35Yg
Message-ID: <CAMuHMdWaXqvoyzFOMMtCuMchAJamOGD4WKG5_16sy7NAUvKVzA@mail.gmail.com>
Subject: Re: [PATCH 2/6] ARM: dts: renesas: r8a7779: Add missing unit to bus node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_022226_327686_8AEE9EF7 
X-CRM114-Status: GOOD (  16.56  )
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

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add missing unit to bus node to fix the following DTC warning:
> "
> arch/arm/boot/dts/renesas/r8a7779.dtsi:707.12-712.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

