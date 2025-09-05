Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA08BCA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 07:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=; b=ukno4SXIj6ZJpCKjOjzH7HuBi3
	L1JrtEPPFYupvPXUnh2FTgpbwjegqAHexYuJVVSw0asU3HEp6ydTzY23OAT/UT3YXVcXPf9xDBKCc
	vkV4Lpnl7tOu/r7u01oBojPSWe++B9AoImvZISpztLeLc7WVrYS3Q6BCAChgSb85cKfQ+wgTOLczK
	B8XC6AwXfBNJE1LxjSXlM5VSBEGYA75XpP4EA31kwNbnQdSKC051L7e9ok4z+dHxbshhk/sbB6jek
	Yrkm5NhRzeBVdYPxXFfFwicQGFfJGDBGiOjnmJ5FT0NgX53u6tSOQDGsjAo1d+rLnkVfI0qe7Tg3Z
	XfGfd7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQzD-000000003oN-0eFt;
	Fri, 05 Sep 2025 07:35:55 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQ42-0000000HK05-2LkD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 06:36:52 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-336e44ca0e4so15001331fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757054206; x=1757659006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=;
        b=nkS10T9SZDBXutscHni/1/oGzIofds+BZjRoWmPIZbYs+eHFCU14QOUv9MScDbYhIu
         EivVq7zXRFXT3orPusN04jyT5arFNgS/HLPdZytHZzk6Lpa3RomxN8+bsDPiZkVDagTi
         mQd6ce04R+ic5PzbyVtYLcmO8OuDhBunhqhNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757054206; x=1757659006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=;
        b=jBWYsX1oOhu2B0hyOLWaPSFukCXYc0MmjwRH6kBfac5c+ud//prrwLhErmTy/PISOY
         dA1l1niydFAaIWZ/aUHc1bAT3XdG5B34FkhsJzNeJpd1OpmVtFP2iJ/e+wcV55u0nLrQ
         L8O9ZnXOyPYkEt21/Nx2Kc1eFqa1bKJkKkHZcwgiYZe7b2JLEumVCgngKy8koFu9z5dt
         dcUnaPxqbHf+hc5KGaiEichRweekMZeAEVR287iLVx4d/Lb8qnKIerrAs+bZX1KHZIGu
         bKXuRA+vqE9JOfCFvluwTT+v4EIr6EDAbS6Ak34t10/qXSC90ej5AWb/WGpoTAi3PiPI
         OOXA==
X-Forwarded-Encrypted: i=1; AJvYcCW+kggbuy0+4eQZu2nBWWXMjVxt8O+z8A9GlhTBm5O7wiuXTX7M403xKJ/unax9gAkjA0GHxGFx3VEXGvgJG6m5@lists.infradead.org
X-Gm-Message-State: AOJu0YyyYBp5cP9tZwuIbjZo3nYSGTxz/YeljGCDcqpTgV0AMCNxIDu+
	ov9p5JqSvjh76aKxhrS+uU/N2lOzvB3LxJ2sySjEynei+WUCT9/mE2TT6kqE1YQlQRqhdsKTEI9
	f3y1ELTsmDxTtNRxOuN41b+AtuQ1+CcDT+al2zcE3
X-Gm-Gg: ASbGnctG0xepBreTok3CaqImwtcnJ9V7QGn2xSCQKu7IPdSPGew9O2ZQepjfbUsiZuJ
	zGOyb13lH+WEZyJJsXz5ojGCDci7NGfLnFJbSuLmZl06A5vFpGINBNJ3S/0AAGBdoY7TZ1VTaRo
	or/MPOccQCvImlUXcCvjcqxWF7D9fBlWmSHR+4G6BCDJ9MEtCLMNgmMiRiGDCDtidlGL1WkFWMz
	L2GK7ariHHGkmuHgPDBIn9GGpJf5CrzbzdaXQ==
X-Google-Smtp-Source: AGHT+IEgVbxQy/DxXsDzvdrcOfC49jBWiMtOAGepTowcEVXECREwr9aIaRDx8B4CTbXxL/deN9wUH95NSxy3a5X8TKE=
X-Received: by 2002:a05:651c:20cd:10b0:337:d2e2:d467 with SMTP id
 38308e7fff4ca-337d2e2dcfbmr42859621fa.43.1757054206408; Thu, 04 Sep 2025
 23:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-16-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-16-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 14:36:35 +0800
X-Gm-Features: Ac12FXwXWypau4EdANuUrgXmxAn5bymNrHkP7HBNlw9rFp2Nbb7jmA3VYZ8UsYk
Message-ID: <CAGXv+5GjZusKNCe+EshMktmyDcfjm6i5oD+h8LvObymvD9QXqg@mail.gmail.com>
Subject: Re: [PATCH v5 15/27] clk: mediatek: Add MT8196 ufssys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_233650_873497_001A367F 
X-CRM114-Status: GOOD (  11.39  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 ufssys clock controller, which provides clock
> gate control for UFS.
>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Assuming the previous reviews for the bits are correct, the removal
of CLK_OPS_PARENT_ENABLE IMO is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

