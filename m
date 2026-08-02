Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AF6AC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 03:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dokjfNwvvyjCQVfo5U9weDVNiEMz1GgnQwdVbTp72Qk=; b=pk0/pZ3ZUT/KYeer8/MzS4slm0
	3SNGBRtCJ9dR2GV3anrHr5+IHp8xmOkEQ+ecpoUCcLDfcgrqvkzQJTEQZYP8UQCbgckfy9LY8diLx
	7UK364ILU3sYJnOyMVMBSS7KrryRHk1FZsf9Ap6XIXbwkDBoJVU8gia0urs2IjsAWfx2Sjhr0CpE2
	jHW3MG4ZhFYlyCFbDZn1siEg+CTLAfjXMIyiEZMYK802QNpSy5xvkOEfSS8r5FOByT9h3i0cy1S2D
	KrkpzXgOpsZXq2Xi0vb9r47ZXL1UA1OoaDejpH6FgaCVY2wolvYBh9k/WKyBMEs4SvNZOO4tHjBHu
	ZOATy8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMkg-0000000FItE-44BP;
	Sun, 02 Aug 2026 03:20:38 +0000
Received: from mail-ej2-x01.google.com ([2a00:1450:4864:34::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqMkd-0000000FIrp-3BFU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 03:20:37 +0000
Received: by mail-ej2-x01.google.com with SMTP id a640c23a62f3a-c15e0279316so85373766b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 20:20:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785640834; cv=none;
        d=google.com; s=arc-20260327;
        b=A4wU27wrpAISN1wQyzBktpRtEI7RnIyHEDrapDC/i8IIFdV+YePCTuDA6vGEKHCE6M
         GQbVPLV0+2VcP/eu8K+2F/QXkIDxaD86fCHyymEzSC6hdaoGGIipeLjnvqJUo648BfCK
         T7gm3XCZTNHKR1QY5FdXAOWxKZeZH5icZDmahJ36GA7sAgZQ3ZIg17uwC0UOcLiP/YTF
         LGqVnOp9PyL++6UH9pmyiLWI2Vq9CtBjN6Fds6+IrOKSKmNh5z8wMadfM2PdbVyzeWvO
         nIXhbCUx8BDl+1frCpfbeKxaffrJPoJMKpmhR7bPohuXODkjxKaqki51bgK9kpO6/Zux
         fTxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dokjfNwvvyjCQVfo5U9weDVNiEMz1GgnQwdVbTp72Qk=;
        fh=T1qCSV/NGoBL2vjN/4wwZbl+tY8pEnKU1sJPOH9cUsc=;
        b=W7lQ1ETg/nCSHprx0kIOCp0GeovosfJONbyRG5fua+E169CjaBSggv5TTTCaQCAzPr
         34WUYNluaQ4GsIvHdh3/fNuj52xu2cmcwlb1qN0S4LoSoTUVd44xseehttg5ZHo6X6cD
         /RHfz/uk4aBqROEf4ltBgKJzxr6TinlQrLd8wu4e/O0E+hJhxEUBHbkH1wJdbkMrz9Pm
         MZEs0xcw/GgdCJ/6VfARgB4ObOH/C/ZKdWJyRSOr7elBIJb9I3yexxa7nWnY9zzV5/SZ
         mCJN2pTl6L6VcVPFMa5g7xAW45wYD4RltYOesJtOa2fxw16/ll2Ff1apo6XYfG1jj9Oh
         ZJIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785640834; x=1786245634; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dokjfNwvvyjCQVfo5U9weDVNiEMz1GgnQwdVbTp72Qk=;
        b=jR9byIyeVY1K/gowtIfYe5PDH244hcj//1Es9ISNhIEBjtNuQamjjIXig1exdaR5CB
         8hoNpnJHUecPgb6AWaEk62MAti6Rd3wXZHYCFoPLwZVM8qxmUy39NHzOJFP74VUXge5Q
         mkGlIo3YKGbkbDkw49ex5hmN0d4IxTwK405xV/YJaA82dmbjMnLUAhNPcJDZkia7VGtu
         u1r9+/c823eS4xdIS4PgDzu++Q084s2ubFCqdt/MFv2sI9UgVoPRGiiDp/w1E6KAfaAt
         9IQbSIrH0nfmJtq91xb7o6itGfkMA1cen8bi+/gnyYJhtMDoOWt91gysCY+8RoGm04qX
         vVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785640834; x=1786245634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dokjfNwvvyjCQVfo5U9weDVNiEMz1GgnQwdVbTp72Qk=;
        b=P0ZLEgVNAryXgGPyQL7q77YnbNQ5Dih6BWDr5Wc3o6sMZdsL9GoqerDmJ7rfXqvnc0
         TuZ/e6c83IsF+lRfgBpEs0pJt/jfMt9XzexTM/yggQJcTqSca0l2LbPmGQMt9DxkElC7
         qE3JWrrsK0zFgI3gK+YvcDsyv7LOG6MoxL9DQk0dVo9FmfQBn0EsZCltACyujJbaxa9E
         5/d5PGY/4GU7J9wqVXj1pVGUe8Sub5nYNRuN0CFu7PFDJZNX9QkrJSIZHu7Y+WheIEM6
         STzylcA2ydNt+LxExe0qVnVl189imKz5pDRENCYGd9joAOLLq76kFAikz5LBQGWeXPC3
         Pc2A==
X-Forwarded-Encrypted: i=1; AHgh+RoqhCqHBeuzbr9t71VULl4XpYDWfyGp6Z0r9gmH/P4FKswD5PVyUt9F8T+2lJ+hFxMomMbPNHZ7iZObk06bGxJg@lists.infradead.org
X-Gm-Message-State: AOJu0YzwEdGNhrTGBQVPr0QWYC4jYhGoZkL0q2FxbCSkEJKKHjA/YTkQ
	uGHTnqwHgQCwKYgJaFzCDcq9Gqyt5jtBBkZh3B/g6nhMzxxvAWsGarCcj1MQiv2cAxE8i46NUGf
	MkPqJq44pJTVYq1ju5/AdzO2ewR3Asm/1jnFEwNFuxEMm0YQ=
X-Gm-Gg: AR+sD13lNABd2gJTjGHmvnMC2MGUttBpibIm3Ew6MD8TIJKqXe7HUCCmPdZjwFFJilD
	eL4D1vu/GSNkk9MZzdfQ+bIFxo+5E7dgSxNViSd8AC8QXNFcxCQqEP+DVLrsdUusDS6o6I8Qa0q
	wx1He4JaCKwXxgWALMK2UMzauI7FrBivO/I/YMn+rg5pDsd52EvTkiUnxYk7iBqLT7mLO0nZLTH
	o1oM/qBH2Q2zUZIub9VJOOrm37fOfjo6WRp01ekGTcFmJkp49SQu3rsva0a3+bYGUp1SkPvBMg1
	kBxuzRBTqrfr7+v39CKon80jdVV/LZCInoA/urgehEZRhL9ukPW/eX/VZ9mIeqmOMGzTBw==
X-Received: by 2002:a17:906:d8c3:b0:c12:b227:614b with SMTP id
 a640c23a62f3a-c1fe80d4099mr321593066b.27.1785640833516; Sat, 01 Aug 2026
 20:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260801142244.679437-2-coiaprant@gmail.com> <20260801142244.679437-9-coiaprant@gmail.com>
 <23d8e994-8552-466f-98e6-c47d5783525b@lunn.ch>
In-Reply-To: <23d8e994-8552-466f-98e6-c47d5783525b@lunn.ch>
From: Coia Prant <coiaprant@gmail.com>
Date: Sun, 2 Aug 2026 11:20:27 +0800
X-Gm-Features: AUfX_mxFPztNas3fSYA9l7Pdws6J-Z60lqG9o0kXKtJ3uRladP8seNb6Ax7e_y4
Message-ID: <CALj3r0i5yVcJY8V75y0Hm5xjtZSBpH0DXSAWKsAUqguChVcxYA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] net: pcs: xpcs: add Rockchip RK3568 platform
 glue driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_202035_879173_AE857E92 
X-CRM114-Status: GOOD (  22.45  )
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

> On Sat, Aug 01, 2026 at 10:22:31PM +0800, Coia Prant wrote:
> > The XPCS block contains four MII ports (0..3), each of which can be
> > routed to GMAC0 or GMAC1 via the pcs-handle property in the MAC node.
> > The hardware maps these ports to different MMDs:
> >   - port 0: MMD 7 (ROCKCHIP_MMD_MII)
> >   - port 1: MMD 2 (ROCKCHIP_MMD_MII1)
> >   - port 2: MMD 3 (ROCKCHIP_MMD_MII2)
> >   - port 3: MMD 4 (ROCKCHIP_MMD_MII3)
>
> Why is port 0 called ROCKCHIP_MMD_MII not ROCKCHIP_MMD_MII0 ?

Hi Andrew,

The naming follows the Rockchip TRM. The hardware documentation refers to
the MMD for the first port as simply "MII" without a numeric suffix, while
the other ports are named "MII1", "MII2", "MII3". I kept the naming
consistent with the TRM to make it easier to cross-reference.

As I understand it, this is probably because the MII controls not only
Port 0, but
also the entire PCS (these registers are read-only in Ports 1-3 and reflected
back to the MII).

If you prefer, I can rename it to ROCKCHIP_MMD_MII0 for consistency. Let me
know and I'll update it in v3.

>
> > +static int xpcs_rk_read_c22(struct mii_bus *bus, int addr, int reg)
> > +{
> > +     struct dw_xpcs_rk *pxpcs = bus->priv;
> > +     int dev;
> > +
> > +     if (!xpcs_rk_mdio_addr_validate(addr))
> > +             return -ENODEV;
> > +
> > +     dev = xpcs_rk_mdio_read_remapping(addr, MDIO_MMD_VEND2, reg);
>
> Does this mean C22 registers are mapped into the first 32 of C45
> MDIO_MMD_VEND2?

Yes, exactly. The C22 register space (reg 0-31) is mapped into the first
32 registers of the VEND2 MMD (MMD 7). This is how the hardware is designed
and matches the standard C22 to C45 address mapping.

>
> > +static int xpcs_rk_read_c45(struct mii_bus *bus, int addr, int dev, int reg)
> > +{
> > +     struct dw_xpcs_rk *pxpcs = bus->priv;
> > +
> > +     if (!xpcs_rk_mdio_addr_validate(addr))
> > +             return -ENODEV;
> > +
> > +     dev = xpcs_rk_mdio_read_remapping(addr, dev, reg);
>
> Should it be returning an error for dev == MDIO_MMD_VEND2? Or at least
> if reg < 32?

No, we cannot simply return an error here. The generic xpcs driver uses
C45 reads to access the VEND2 MMD for various operations, including reading
the device ID (xpcs_read_id). If we returned an error for VEND2 or blocked
reg < 32, the xpcs core driver would fail to identify the device and the
PCS would not work.

The VEND2 MMD is fully accessible on this hardware and contains the
standard C22 registers (0-31) as well as vendor-specific registers.
The remapping function maps the C45 address space to the correct
hardware MMD, and then the read/write functions handle the actual access.
This design matches how other xpcs platform drivers (e.g., pcs-xpcs-plat.c)
handle similar hardware.

For invalid MMIDs (e.g., MDIO_MMD_PCS, MDIO_MMD_VEND1, etc.), the
xpcs_rk_mdio_read_remapping() function returns -ENXIO, which is then
returned as 0xffff (meaning "no link" / "unavailable"). This is the
standard MDIO behavior for unimplemented registers.

Thanks,
Coia

