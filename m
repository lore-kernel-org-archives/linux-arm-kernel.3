Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A648109E556
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 06:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=; b=IPHI31R+NWdVS9v1SbAYqQy6TZ
	VSBODN7rLKQBJMc0tZYdTYVASi+7XxSv//bifVJJlM6MWcasYJB0XA3EYDnPqWnfmEUarolKtek0R
	KvBIZDvCNN9JMFYPxsdloAPXpAFhhJ8B5/vOcHgjAy5OrmnZZGVb9inyjM6V1Xn99V3kQMBBva1Mz
	c6AKAyEt2fw/PZHGk/F+3nB2sfRFvIexav8OkW1SVUrQMMsm0JLbIHze+KNE657F5owu4IKJPsxgR
	6w7fT5kKaNhomv2tDkLbmis/GdeAAHW2mlGOwv72Da7zSexBY/lcslFvA4eSxfkWumbL+JIRr7wjg
	UBWm3Mhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eO1-00000004rTm-3WC0;
	Thu, 26 Mar 2026 06:40:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5eNy-00000004rSv-2M3v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 06:40:07 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-59dcdf60427so763722e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 23:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774507204; cv=none;
        d=google.com; s=arc-20240605;
        b=HNOHURUkR1Dk08MJEEDVjd67RvZWuCsDObRWV/WbMEEDb29eWsyLk3B73CUQUjebCB
         z7wZTEc/hXGOnJfYqOMFcV2R18UZvwf3/g0/cXg7u2LScwqFPDCNubkoyuy9O4tdneFE
         UJXN2R2TriBOL2YwOgt+hm4ggdQjKsBSZaOPQbryMgWzRY2hNnsVJi2CC0yNiLo8aGlC
         3j7O9K1XinlQyozMZGRCXf8mE1IBEwu07e5PKt+/v8KAuJLLQ5n1erW3XFs4oF34JjwH
         ESqdVsK8xkkUdN3/wd1+pk6splRMpq9SwmGpwpgSTnjAqH447m/Z0MnWHao4blQThPOJ
         RmxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        fh=qjvzK9vgITxYhCXAgIqWSkPvciV5Kz/txki+ebb2u1o=;
        b=R4ZpmYaH14xOejFuVBE0hiOSolqi5BBysdiMTFf/ILwJ2wTj1Tr9Ar0VKauGvT1Uwt
         Vz1F/EZOWE6ha/Cfb15WrF4kTKkIFqRUMb4JnPfbYS+ATJvyb/0+1hLeCculW9p2tKSO
         tpvApFY7zknsbfz5QMzkQHj9fXELInK4VPMO7eWiZ5upSWkexxsBQzAZiwW+qWgTRNm2
         v6kemF2EfsP+YWsxZMFbeFIGM8fN8HYOFJjarUgTU/StLY0m4dcxoOWzdb8ueLK8nRBG
         LEEGxPgMUtf1u1b+P1YmeNbp+2gWhMjJ0DDfJG3RwrQVJgToXYdwrRFqxHDLCmA+fcSB
         3mnw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774507204; x=1775112004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        b=kmPXjbehZb/pL9zo0obNPpeVzeHihawE5mhjonYhLXkrZ3wsmzS/DJUhn0ybalfooR
         rXYmBxwPdRsqNLfCYw5wfyOf/iJlZYPq57+pgByywr0cRcucj7hLHNMIHVhNcdScIvyd
         UVDqUWIEV263jb0Afu4Tj4pzAaSoggyU4I6o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774507204; x=1775112004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=69ZaWNAxRHkgtq1KDpn1Fryz++TV1sPjQ/Hor//Od0o=;
        b=Wqi5a6/xek1LaKwhbg3c5/1ukRXdhFiaSKb69XomxYhpV04b7prNUzn2JUXQtHguzf
         wfMpUhgLgPDS583KGxM0vhVoCg8gV7OgJH985gFy9nKmUMliScf7mYggqJmfQ95R8M8G
         eYkfQuoNbZstLaReKFsz2EEfZsb30W/I2jDa8fanRkQzaJuVtSkom1x1xL4zss5M0J5l
         5UTMdWBnO4x6Rd5eM1/rdeCAuVfKmEWcvymIIYUTysnfCbEdwg+5gJ/OJFnYjiTCd51p
         f3ixbpJIwBWuKKm+l+F3u3A69flAe25HbkgN95YNA5QTcx+/R3/yPtQiSKt1LsjGQLM/
         0uSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK50uXU0GX8mijaYn08W3IQn5w/z5e5ciUjYaHCfChz5s6oOYjvnkklfEXJ5Xe0gDf1mQHvRu2CjzV0A1Y2Eyn@lists.infradead.org
X-Gm-Message-State: AOJu0Yx066VsECUO2gn9kWxHQ7aTMqa6BPDTDIOXTdYqPVrBd2FAyX/L
	hvbo39w0YtWFXkclCjcPgyhjrfxW7GL1OWZQfWdjxkKw29SpmBLnf5aRhhPfdknjsL/D45Surqy
	XNWTbZlbOsidg+9ABmxh8aXQWxjVguU6d14UxaimxgOMDWN6yG3k=
X-Gm-Gg: ATEYQzy0dRcY2p3vKe24uFFHHEF3C0gfuX+9ZLWFZTI7FFyZLL0BAIZpVsOrxbbPC9n
	nGErKnCTor6x70Q7h1/s6tcqkRwQiaLqZm6F6SMz51LqnV2CwJgWmUT/S3dL9KgLDPk50JjTcYE
	H95j8CQOhFUr7bTZ7KWEs3+8XGnTnW1VRn2LGZblCgvP09Vswg+8T18U3DacRXi+FB4bFISEcwm
	njvDcQKWoYcGISS0Vegd8kXXRwNq8m10rqQE9bxwMr71DvZ355NzdLJR76xI0Mq1J6OsvcvacO3
	KwJmPbMh9/jyd/lPLQzsDwgg4s1t+SUtrxFkJA==
X-Received: by 2002:a05:6512:34c8:b0:5a2:a0b0:3c with SMTP id
 2adb3069b0e04-5a2a0b00282mr505750e87.25.1774507204124; Wed, 25 Mar 2026
 23:40:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1774499536.git.daniel@makrotopia.org> <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
In-Reply-To: <d1a9b393d9929dc670dc6d5bfcc5cd43561d0be4.1774499536.git.daniel@makrotopia.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Mar 2026 14:39:53 +0800
X-Gm-Features: AQROBzBXCYK8fdBiG_gwq6eMeNBtFL35RVNDIyD5eRFrYc-fSnDonaWmeSR1w1c
Message-ID: <CAGXv+5Fv1g75+8kFtMEvMeSW2+2tYnqcS=P4ssZfT8p9ORwXPA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: mediatek: mt7988: use MUX_CLR_SET for
 gate-less muxes
To: Daniel Golle <daniel@makrotopia.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Laura Nao <laura.nao@collabora.com>, Weiyi Lu <weiyi.lu@mediatek.com>, 
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, 
	Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_234006_615528_B639E8B7 
X-CRM114-Status: GOOD (  13.15  )
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

On Thu, Mar 26, 2026 at 1:11=E2=80=AFPM Daniel Golle <daniel@makrotopia.org=
> wrote:
>
> All 19 muxes in the infra_muxes[] array are pure mux selectors without
> a clock gate or update register, yet they were defined using
> MUX_GATE_CLR_SET_UPD with gate_shift =3D -1.
>
> This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
> enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
> gate_shift is stored as u8, the -1 truncates to 255, causing a
> shift-out-of-bounds at runtime:
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
>
> Switch these definitions to MUX_CLR_SET, which uses
> mtk_mux_clr_set_upd_ops (no gate callbacks) and does not require
> callers to pass sentinel values for unused update register fields.
> The actual clock gating for these peripherals is handled by the
> separate GATE_INFRA* definitions further down.
>
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

