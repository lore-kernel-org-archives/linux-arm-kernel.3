Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2F7C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GJGl+C+XNyqfDThAEBolXrcWZxVz5MRHfSv1hTEwQU=; b=NWyr4B83ZEvVGioQGSgwBZI5ij
	mZ1EjLpt7htH3W0zfkaJaEyUIACnXV9h+lCTtpL5DKOKbIAUmdbGNMcQYEH+ZmtzRGhWAqWOcI0gt
	kwRFP7B71y+BHnZBtTiSdboTJr5AtgDFU5aiWnrfWb1t+XMf5fP5uasODxKPzNnKR2hK3F60RtokG
	DlR3yp74Xn34Ko3SMcnB64/8bbxTXLOkVMiTEsMP09edokXmxKsyV+Ug/jC99bzuJzjYUMafg1tcc
	diewjzUuKMJ+vO2lKk6skfJJBmer1t3uS/SPsr7GV44Tj/4FXEczIdidt9zUJJo9FcukkKfJWWDqw
	HEzDoxVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVFZ-00000005S6q-3tko;
	Tue, 04 Mar 2025 16:36:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUCS-00000005DIm-3wUO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:28:54 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4399ee18a57so36764155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741102131; x=1741706931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GJGl+C+XNyqfDThAEBolXrcWZxVz5MRHfSv1hTEwQU=;
        b=dtuBGeWq2xBzzpyh4Ct/PwGUeq4XhKEr56B7AEYAHUPpelKhdhyVWDsDNzDzms7gDS
         kvkmkFIpHek6y2+jJjQ7X0/99apix5FQMX5TdNZ114pkg7WFSa8PBLkrkXZ4XM6e2ECe
         rtIqR/2XqL1lWY1AoJikIbSrKD/+Ww6TdpTjhWLgw/ENR09OH8bLeLyMJLULYyiph/Us
         2zTz5UY2q7bHqxaNdwpFniDiAoYS/E0JMJwX2aPnAa9tTlmKqjuHAGlTLAVHz3QT2XZ0
         mXYXltu4+rE+QJ6DQwQ6gyUonImVxCW++Ya2R/Rbbn993c36UDU+0HEQYefe433gPZeb
         0aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102131; x=1741706931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GJGl+C+XNyqfDThAEBolXrcWZxVz5MRHfSv1hTEwQU=;
        b=SMr8wluepVJ8P6/BqDjFyGb8KXpP2l/6b8mQER0mMK4pnNsvBLG3dR3a6z52dhWBY7
         LFNdcT/nnFPUpe5y+b6AFOkl0Ld/fVxggJNOu7PhiEjT6R6irelUjV77Mp+kFVCN4jA/
         fqgstDCLxZG/EMqvp6VOvOe+CnO8LS0c6RE2Ex9cSpmIi4OlpV/9qB1wwJ6uZ4YG4z+/
         DPMC2zjqxCkgrusOeirVaPNMXzYaSDx1HqSlodOl48R7qxjMRDUXwmmumNQfYP5GW0Dp
         GCE8N/QH6sg/rE+y2TKH01LMLVBGYuB0HD9gZ5xS/N3IMUjbWHaYuhKnPaoGEoFneq5Q
         oU0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCXpGqWeapEI4bBjN+swEQr6QMrMRkiHjh0vqCdAyQlrB3FWZiUVVWb+5DcYuiR4URpH4rJV66xgt2D6sZNds2@lists.infradead.org
X-Gm-Message-State: AOJu0YyBI/NlTtTu2lTajy6190ahvOsdSOGsh83Nz8lXoMRoNbrVXeAR
	E8iHAxOKIblrhGt1VPf6LNKVkcoFKwG3PALSWunSgP9a6k2vtTdU18Kr1Z31
X-Gm-Gg: ASbGncsoLYDxbMHlmxbhPh889qPbdWPvW8I5lSWSINOAtHjEPRQ04ENWeP244qVfeRx
	RqibkZISEif8qhIWE+NLo5gyT05HLIRRX1ExNM7nqL/kQei0EkKolWMGKb9wv+4A4kvnxRMLcsY
	yoD/QTgE2jsc6KILpTb6fYwfzQSPnvEVjPa6Kq9YBR7eg3MpFmi/9eEvQ5L8BYK4V4iVTBg+dv5
	h12iRUGWoP6WK52HUecCpVwGYgvY/fCZYgXLFGhCZRn+T2GbqCVT6FGIyTYZCzrdgX8588G9DUG
	Kuf2e3TAw9AcQH3nXTFmGx7d9aQxcPM4xRGHSqa/UYGp4FZe70348G8ukVGSxm7Kh4iIJxH/rcB
	NWi739FDZdCDjcHNhg7xZ
X-Google-Smtp-Source: AGHT+IFPb9waA98CjEsodSk/NmmLQ1ZnBzxU9eF7fwwfV3+Lk/QdrRxr//FWTFj6LpiihIZeVHwMXg==
X-Received: by 2002:a05:600c:4917:b0:43b:c824:97fa with SMTP id 5b1f17b1804b1-43bcb04f0e3mr27784975e9.14.1741102130656;
        Tue, 04 Mar 2025 07:28:50 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5710ebsm238381775e9.26.2025.03.04.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:28:50 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/15] clk: sunxi-ng: Add support for update bit
Date: Tue, 04 Mar 2025 16:28:48 +0100
Message-ID: <3616088.iIbC2pHGDl@jernej-laptop>
In-Reply-To: <20250304012805.28594-4-andre.przywara@arm.com>
References: <20250304012805.28594-1-andre.przywara@arm.com>
 <20250304012805.28594-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_072852_978044_B163ECC9 
X-CRM114-Status: GOOD (  19.01  )
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

Dne torek, 4. marec 2025 ob 02:27:53 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> Some clocks in the Allwinner A523 SoC contain an "update bit" (bit 27),
> which must be set to apply any register changes, namely the mux
> selector, the divider and the gate bit.
>=20
> Add a new CCU feature bit to mark those clocks, and set bit 27 whenever
> we are applying any changes.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/clk/sunxi-ng/ccu_common.h | 4 ++++
>  drivers/clk/sunxi-ng/ccu_div.c    | 2 ++
>  drivers/clk/sunxi-ng/ccu_gate.c   | 4 ++++
>  drivers/clk/sunxi-ng/ccu_mux.c    | 2 ++
>  4 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu=
_common.h
> index 50fd268329671..d41d33bdff470 100644
> --- a/drivers/clk/sunxi-ng/ccu_common.h
> +++ b/drivers/clk/sunxi-ng/ccu_common.h
> @@ -20,10 +20,14 @@
>  #define CCU_FEATURE_KEY_FIELD		BIT(8)
>  #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
>  #define CCU_FEATURE_DUAL_DIV		BIT(10)
> +#define CCU_FEATURE_UPDATE_BIT27	BIT(11)

There is no reason to have "BIT27" in the name of the macro. This is similar
to KEY_FIELD, which is generic name and doesn't specify either key or posit=
ion
of this key field. Maybe just CCU_FEATURE_UPDATE_BIT or something equaly
generic.

With that fixed:
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> =20
>  /* MMC timing mode switch bit */
>  #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
> =20
> +/* Some clocks need this bit to actually apply register changes */
> +#define CCU_SUNXI_UPDATE_BIT		BIT(27)
> +
>  struct device_node;
> =20
>  struct ccu_common {
> diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_di=
v.c
> index 7f4691f09e01f..2d8b98fe4b13a 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.c
> +++ b/drivers/clk/sunxi-ng/ccu_div.c
> @@ -106,6 +106,8 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsign=
ed long rate,
> =20
>  	reg =3D readl(cd->common.base + cd->common.reg);
>  	reg &=3D ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
> +	if (cd->common.features & CCU_FEATURE_UPDATE_BIT27)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
> =20
>  	writel(reg | (val << cd->div.shift),
>  	       cd->common.base + cd->common.reg);
> diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_g=
ate.c
> index ac52fd6bff677..0490f95781361 100644
> --- a/drivers/clk/sunxi-ng/ccu_gate.c
> +++ b/drivers/clk/sunxi-ng/ccu_gate.c
> @@ -20,6 +20,8 @@ void ccu_gate_helper_disable(struct ccu_common *common,=
 u32 gate)
>  	spin_lock_irqsave(common->lock, flags);
> =20
>  	reg =3D readl(common->base + common->reg);
> +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
>  	writel(reg & ~gate, common->base + common->reg);
> =20
>  	spin_unlock_irqrestore(common->lock, flags);
> @@ -44,6 +46,8 @@ int ccu_gate_helper_enable(struct ccu_common *common, u=
32 gate)
>  	spin_lock_irqsave(common->lock, flags);
> =20
>  	reg =3D readl(common->base + common->reg);
> +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
>  	writel(reg | gate, common->base + common->reg);
> =20
>  	spin_unlock_irqrestore(common->lock, flags);
> diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mu=
x.c
> index d7ffbdeee9e04..82ee21e0d3a68 100644
> --- a/drivers/clk/sunxi-ng/ccu_mux.c
> +++ b/drivers/clk/sunxi-ng/ccu_mux.c
> @@ -197,6 +197,8 @@ int ccu_mux_helper_set_parent(struct ccu_common *comm=
on,
>  	/* The key field always reads as zero. */
>  	if (common->features & CCU_FEATURE_KEY_FIELD)
>  		reg |=3D CCU_MUX_KEY_VALUE;
> +	if (common->features & CCU_FEATURE_UPDATE_BIT27)
> +		reg |=3D CCU_SUNXI_UPDATE_BIT;
> =20
>  	reg &=3D ~GENMASK(cm->width + cm->shift - 1, cm->shift);
>  	writel(reg | (index << cm->shift), common->base + common->reg);
>=20





