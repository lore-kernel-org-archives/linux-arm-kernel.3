Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB364FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 11:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eQI/JeVJWqMxkzWYnwpYH2rFZzbRa7DUVbDEpXwBWE=; b=A/IPTjLMhmF8oi9JnantByQEU3
	vMFG1o2f0ZMRh4LnD+bCVNTEPfL67zKuMobpks3MvXEtcYFXr6kRK48jwk4gae/+mdWcJgyZYRRGd
	Q1AH26QVWpHldxdxMt2JHzqOnC9370z9rNleEMB5rc3bLgflna8aVF9q4/HREiaPEVGSBIsqyc3dk
	/Y9YkBVvvAa00p4z8NGzS/W9dQbo5gUghHHGQpcfCPRkK+++UPX+g+kbVJTP0WNv7BePFkBdNjLEN
	mK1KmqCj0FxL6KMGT0ko+OzD4VnOlDoWD5cu8dOngxSq40WRfiqIg/ibxmz113t7hV9KIYthJvSuI
	Pw//FoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3N0-00000003XUl-1Sjp;
	Wed, 29 Apr 2026 11:46:22 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI3Mx-00000003XTc-38JZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 11:46:20 +0000
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56d8d479149so4152479e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 04:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777463178; x=1778067978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eQI/JeVJWqMxkzWYnwpYH2rFZzbRa7DUVbDEpXwBWE=;
        b=VKgszuXpeG0rzcA8JVmnbcySvaS0jx6yRGeDh8R8dVkmXgI5l41D3AnFhvX1GefCMa
         Jw1SbmPNiK+bHX3iSWRT2aVIiTGbZ9Nn46oB5CRq+QeJqXkiONXnsqnZrlKNIldqy4iV
         6aFNAeoVq5GfKNjg4jodPebTx7bb1yIHPBj4MdwGoW1pi8ZxXHWecLCu4yEDqP/w9koO
         wuaEZJAW3/RHlK4GtclBG2Hi6kss9ImDfLBS9UsmpPjSA2EvkjnSqlAt3TzLd0qMCUTj
         EWAJc7P5D6sDmbye5YSvUA7QNkjmTI/S/r497HfMLPYUtbcO8+ya8pF1V8Kr520j8UTA
         ZAGA==
X-Gm-Message-State: AOJu0Yyer/jiV6zjRy/UqzgbYHlU1ckovmkji6tvYifcG+P5qqAAngYG
	W25fprKG5nbM6spJSjOzrrSCdwegs0dpAJecJyubmgk1JFuhKxU7WmOOXPOt00z9lOk=
X-Gm-Gg: AeBDiesiOfZp5zE01JJp1JyrqUD5XsB0hjoRX9+XgS+XWhPtmkU6epaCxMZP6Nz1/Fv
	q6IEpWtkm28LUhxmFWn+z87gkmDzzPNHOpcZLdG9vBZBfOJn4vV7rVApnyjmtKnPoxtx9Rgp5G9
	7jMOjswKGik/DcW04Tbwboib68b/qbR6EehcdzPvs8ez9L7RITbrJSFiU0OCIZPkeMGuV4z226G
	UOa3yQjLjfg82CYdGO1nY4ZRRnnwAo8hTFSuv8Fs8RYZONJZN6fe0otlLLOuPeGDEdcw0vb2eIb
	3FsEY2YOyNFoUQboEoiQ0CB0fbhXlNYAhM95zt6QOKG+k5NHs8UGmUkuouKRNMjC1xIKGeKrvj6
	RnKgFVT1aRkGjmtDz3pRbyxcuRpMngc7p1xhTIH7dQ5attvTZruW8pmrjsrakNICJoPhQdoVzWb
	/QFb0rQHLBeWCAaRMoqaHlfq8MDmuT+7tizSd3V3nt7aZuWptL4jvKAoh87JwmkHb66ujY8Fc=
X-Received: by 2002:a05:6122:3906:b0:56f:2aaa:450c with SMTP id 71dfb90a1353d-573a5518300mr3741957e0c.1.1777463178508;
        Wed, 29 Apr 2026 04:46:18 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-573b6dfa5b4sm898275e0c.16.2026.04.29.04.46.16
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:46:17 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-953a44f8404so2774155241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 04:46:16 -0700 (PDT)
X-Received: by 2002:a05:6102:8496:20b0:60c:fe65:7dbd with SMTP id
 ada2fe7eead31-62808c547e7mr2534931137.5.1777463176356; Wed, 29 Apr 2026
 04:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-6-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:46:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU7Wv=ff34PGtauGE=pxu-gz60bYckFvC0s_7+NGF2sSQ@mail.gmail.com>
X-Gm-Features: AVHnY4LIrMWzlW7YEacrKVCpl1tXW3XTPU8aR2UA76Yz1rMTuJKkQscGTQj67Yc
Message-ID: <CAMuHMdU7Wv=ff34PGtauGE=pxu-gz60bYckFvC0s_7+NGF2sSQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] soc: renesas: Identify Renesas R-Car R8A779MD M3Le SoC
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_044619_784871_522099E4 
X-CRM114-Status: GOOD (  18.07  )
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

On Sun, 19 Apr 2026 at 21:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add support for identifying the R-Car M3Le (R8A779MD) SoC.
>
> The Renesas R-Car R8A779MD M3Le SoC is a variant of the
> already supported R-Car M3-N SoC with reduced peripherals.
> Enable support for the M3Le SoC through already existing
> ARCH_R8A77965 configuration symbol. PRR reads 0x67c05501 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

