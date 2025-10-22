Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D707BCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWYnqPsGR/+m0VSRYyHFTH5ffcOTH5Kpd/uIr+BQaho=; b=y6NOqy+jBRXg/3KfdidNJfdfNg
	78pJiO0Hh7sZS9KckpnSOmDgZJ7etFtiQgcGlpdszDyYkCaVsDOk+1fgFsvEhln6dwLAl0X0kIDz5
	gL/sCwyNeI+2sAKcthvPbmcYCC4E6u3Yf4UXWdwo35NbZIIL0wmaGwBUpJAEypWwbmPFIlG+EynjR
	NX7q/LPK8azD5Iweq2Y1b+ZENiTQBsK5jNiKWRCcO0nRaUsVPM8XhEljhkInVOzIOZKl0EhIQKFHZ
	EIUfjBT2PfHHfYkz5Em3VoVkYKZ4aLsjZ4mIaE5ABi5BjQDlFXaj0xT8eYX8w+RPusbTsOHwm6s86
	wHkR+BLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVPY-00000002JLy-1g4A;
	Wed, 22 Oct 2025 09:45:40 +0000
Received: from mail-qk1-f179.google.com ([209.85.222.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVPT-00000002JLR-2HeO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 09:45:37 +0000
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-890d9981983so886268285a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761126334; x=1761731134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWYnqPsGR/+m0VSRYyHFTH5ffcOTH5Kpd/uIr+BQaho=;
        b=B66iX1s6NRq4Ao25R0rLCZXKzdxUbr+Mc1IqsQJu+kN0erf2u9gVhucsF46I/YNgY0
         UgQC8jk8+VS/02C4ZOgX3TD8qejmkYsLm7hFz1Uka5f0ex+kFqfsLEPdtMz5HMpXB2Bf
         CakeXmn5bj6recXMXLIgfsvsv7B+OHwrJDLepFF/SS5K/LadIp9vp+xRIyhKgC8TLqhr
         o9jA1iM9H4u+Mf8ewrPDaLH9Ber5JoeBHjMVd+8RgRA+9v09QugSzs46jmy0629MyjgK
         upvWX1UM+pQh7Uwd4Daz/fXAJ/BbSlbIOJDL6jQYBGvqHBeg2v6fikmZXE1+5Un4UPDV
         dxyw==
X-Gm-Message-State: AOJu0Yy1sO7xgo3KhTETTT2dmh5TF2vj3KqGGMz2mqbHJ6cmv4FvpsNP
	6UWJZvzVVaePS3FJSi27zsrp2t/xbHDoEDCmdxjcBnwLtB1IaQk8+ZHl+jsKEfbA
X-Gm-Gg: ASbGnctAnvvItvifA6nwkihObgv6FPWt6CDnZLWGHfbBRab/wUhg4FFQTlGDP/AD+4F
	wkEKLBK9QjB6gSabTDISybcFX6LYl+w0vS85TUa7fYmxUoq7hy5ZUzlvMs4zJXhaP/ahs5uVvqS
	tIXOgi2pWQwY1+lY3DIbAD7oDO2A/UykcV9kF2WEWjhEdRD8Q2cDqyHfPUCVpfxU1bHxTRh4le/
	yHbzY85/q6U894PvTYP27WNo3ISHfwXAYeVm5+ThZ7vAc+OmrzTiWpqdUH4PE0c99bPga481o2r
	p2dBxzXW7cepp8tsGM5eDfzywegjt48DXGXsZxEdWVIOmSFsxwxEeDDLy/DC7KJy9vnhQOJtkxZ
	gklISFWgyjsw+EAgusUpsnSemdFHR3A2u41rm8bB78LjoWlsCsKB29d+brv0fjWcVL1RMeB2kQD
	nY7fM3fooZbylGSbhjI4f2A05G8r7Br2d3znhCEGaOk1tgS7Tt
X-Google-Smtp-Source: AGHT+IG2pe90ONn1eQ3BsmlGRjpmcEL7BdVyA9tUXp0Pk/MlYafmN9RbvsAP1NV2nZdquS1ybPgDjg==
X-Received: by 2002:a05:620a:4693:b0:88f:dba3:e9bc with SMTP id af79cd13be357-8906e2ce6fbmr2129299585a.5.1761126334134;
        Wed, 22 Oct 2025 02:45:34 -0700 (PDT)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com. [209.85.219.50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cc8d611esm936976385a.11.2025.10.22.02.45.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 02:45:33 -0700 (PDT)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-87bb66dd224so87493016d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 02:45:33 -0700 (PDT)
X-Received: by 2002:a05:6102:a4c:b0:529:e9a5:c216 with SMTP id
 ada2fe7eead31-5d7dd42f318mr6592013137.4.1761125935974; Wed, 22 Oct 2025
 02:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org> <20251022033847.471106-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Oct 2025 11:38:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXrFTnJcQgVaCZWeMEHVCg3PbHd=oxzTQnDCixc-NDvwA@mail.gmail.com>
X-Gm-Features: AS18NWCUxVmbBX5A4GWgkcFHdLZ81csYvV48uizjGHlywJaqitAbOBSEWovXEnU
Message-ID: <CAMuHMdXrFTnJcQgVaCZWeMEHVCg3PbHd=oxzTQnDCixc-NDvwA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Adam Ford <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_024536_416512_0B1EDDC5 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, 22 Oct 2025 at 05:39, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
> present in Renesas R-Car R8A77960 M3-W SoC.
>
> Acked-by: Matt Coster <matt.coster@imgtec.com>
> Reviewed-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.se=
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V3: - Add AB from Matt
>     - Disable the GPU by default

Thanks for the update!

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v2 is still valid, will queue in renesas-devel for v6.19.

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

