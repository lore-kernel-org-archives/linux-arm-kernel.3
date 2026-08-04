Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8273EC55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=; b=fVocLBTPryzFqWlnZ45Hbf26dQ
	qhUe/Qjx/aRnvmA5jqZY2kffn4DvrMKZCBPL7PpR4u9G6vCxQ5mp3SLz03kExdhNr5AWrckDsnFTs
	i+QGnOKUx+GLrcfW3R+8yfWJrg2b7il8AEUzbAZJj30M90vj7KoIPp8RC4eMV/qF/1z0rVVsKRESA
	DBovnOl2yAKPQJIdiEpWhpfm8K3FBKTAEGJkEUpvkM7yNWXuWYU3z62X/GHFhQ+1tdL2DUctkGrXF
	JbTrmZxlzhM4ulxYBnnRL06nE1N5iHsG87LLe7ggf2oLk5n5P6detWa3HNnO7eiB2/evoz57fvX/S
	wltGFw7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrH2Z-00000002DCM-0TN8;
	Tue, 04 Aug 2026 15:26:51 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrH2X-00000002DBP-050T
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:26:50 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-738a5cc517eso3273747137.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 08:26:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785857207; cv=none;
        d=google.com; s=arc-20260327;
        b=cAmzDNyIBqDk4tKAc5iZ24q5n6B8+lX2K1kTKHUm8CjzGMZM/twokUyenoDELHZars
         r1VYM7tAwdEObIttG3o/7LqJ7CZx0FGAGLNETcBWJhkbKeuhZ6NShRxGkGddzF9r4Mm2
         bgUknFONM6KvunrfOnUvccX9ISNm2bgF4qJCV8vS9RAQW3el1BQJk14ZjjS8EDqBN4Mw
         1U1Y4DBXMouSgNVtDNxhnBjeUg5VD6ljHISWcyaLpZxzzS8IJHhG7vD9XzXvLFqNF/Of
         9S8P+qML2oPaswwmDL3O7EXuo8KytugVvS4Lfq5qtygr8sDjlMoH618DSBva0n4pOdKh
         ad8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        fh=Qbur6dijUo2ZCGrAKuNaS8D49sSnXj0pcz9sNc/5DrU=;
        b=CasO5G98TWCCbqT1Ay/cvvSpr4FVPpyZT4+eaNqHAinTHwxV1DTHPlcLCtLRUMzupq
         VLq+c4g/I25WlAUIuUXAE5fLEqtxPtgdFlB8HzhTM/4bRzc0Fp11Azzz41k0H4z7DbLZ
         YEBFZqJrESdR0uxHLH4sFmv+a29Z8dR8yfeFh1mwGT7lYfZRTiW/vWTGtKjHHeeeDoBs
         ceTuupiTo8jiQZyE5zZxenzH56xtXLjCFc7TxLWoie0ltxHoxymY5S1I5lwG/EhgMDyg
         2IyyQzRZNqtIDarCrJFJDes/HAuQHvtdW7B6buzpXRbtb3ebvmkZRADVz9p9avfkCkgj
         Vd0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785857207; x=1786462007; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        b=hfbQvme/XCfNPBiWNrmXV6LP3nozNeSzANmgwL0IXY2yFD2vVpVJ6d6Nm6JJAgeI9/
         Tygacji4RHkOoRCnw6nZ8fyBe8sUHB1aGxybhn4suvUWsuUeQguEhCI7def60TEX3bfy
         pImx4bboTdOZsVEHP+wDg0suyWGwDU0jxIx+RtK5mA31E+eqNTxiDmRGG1bYwMawpDWH
         jI54bL3NL89TIq67x5vhk7BH0R+EeQ2JAIn9dQl/Da06PuscGvidMRExeuN7e4pZwI9I
         d6e/aoVlVkkSwqq/QN71ZclMAMbtv7DLTclYf+RdV0nbCuOLpSb+3PuJO/H2nbVwQzUO
         e9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785857207; x=1786462007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIzf+HYojrQvIG1FuzM4Jdr3lr/d2D1NXMxs/JfDycE=;
        b=p2PxbozbIghN6MKhaBXISqnYnk4LGvUyjzVUe6XGWrUXZAFokIhphUtFoiBkoNlK4R
         cDut/gfQkCYucoMKuyBN+ZBUVo1pI/62H0zoD/6RlWfGi+eXwzRZHzVV5JeWn1hBRbyD
         3l/IYbv8yEunkp36nQJCPCV1++kb7yhmXR8a4wzwrzGXjp9Sz0YTNInBhsDECFjgXrvk
         Tfa9zUnhOdO6a+o8glzVvY1ta98W4l5OwU3X027HkNTppcWjVubn6iIAJSlLNf8Q1zoh
         zbDgNbp9/ZC/kwe+Dgny7WPGCXgAabDLjSVmPP/ZEMmCbjVkE62tZ42oaHv+meTKLZ1a
         wpFw==
X-Forwarded-Encrypted: i=1; AHgh+RoxSKLRwwRqMFiBOuZ1NoLuGKUDxuwkZPMRyi44+jivj3GN8mw0708tLbMcj6DiLssGFRzycca5DksA1vyhgkSy@lists.infradead.org
X-Gm-Message-State: AOJu0YxrJtyUzErLEUtDlEx8ybjubYQcfXTWpSrY7BypPK8pkapeo4ea
	VMa0owyh4VribBOQ33ygVEMDisU8ntfl7YkMW2dlSqTWxpLdTzxGUoWRHyEXb7HHJGa9GA3OQSt
	4nj0bSZXx4SbVf9aTtvIWQNe84qAvoXk=
X-Gm-Gg: AR+sD10NbYxvM4WwDoxeVKJ7Yt8km8yB4fQVb05iEgQfLz6bdc0kEOmwFL269NXqyY7
	I+N4QJxyZ6iMGWM3KlkrgzoF3LQ8jpCU8/FBCIwmc7xg30aPjgLLtqfkbeo8CvfJA83Eq2KgLxS
	9fEbB72EgJUwnX/IpoTMs9uAAkDI1uRI4gtLh7CnV9ngkM3fMzWxC7Sg9fmv/jD9V0x/SKeT1ne
	sbCc9mAtmljRNqifzKTK8wsILpfnSjPSA8eA79AHkg9wV/ewQJtVqPn1MkL58+Pt3mvMO+5CMVq
	rjaHm1Ar94ml5FHpjHorFoNP3IaOSVs97O3BIW7fYPnFQ/9bkKAGbUBEPDJlegZkv7rcpIO0Wj6
	zW96zyS1fYRUBLpPOtzud/nrVwU0D9uKI2dhf+FmOcLA1ozK8D73d0uuq/JUj9LZ3z5oQNWFcYs
	nhpl/YZa+jAqcMuw0Vj3tcUt7HLVqwleQaesMz
X-Received: by 2002:a05:6102:5093:b0:740:2717:a1b2 with SMTP id
 ada2fe7eead31-75b21a600f9mr11149553137.1.1785857207439; Tue, 04 Aug 2026
 08:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-10-0a53cd9e21cc@gmail.com>
 <05b1e6a2-725e-4b8e-8629-249637bbcb81@lunn.ch> <CADvTj4o0JdjoO+FC4pO=qnjEQ8MRyzQdKp2Hxy9NsPU-gym5OQ@mail.gmail.com>
 <9b8be475-1fde-409c-a82e-be4b2e402650@lunn.ch> <CADvTj4pBovti19MXgQjFpxm=7aRm0sYQz9jxfo8bu3txH94THQ@mail.gmail.com>
 <a9ce53dd-0873-41c0-ad6a-fb42e6cc7aaa@lunn.ch> <CADvTj4qpHU3F0DrEmc0vFi+JiwTNERniiMHKo1LmBd8sg58wJA@mail.gmail.com>
 <205e9051-8e43-44bb-a4b5-4ec69a192fa3@lunn.ch>
In-Reply-To: <205e9051-8e43-44bb-a4b5-4ec69a192fa3@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 4 Aug 2026 09:26:35 -0600
X-Gm-Features: AUfX_mxUgphmHVN2nVqeDHtOoQ4DhYlfN2EUsZlGA6OuEq-kXlUnQLFlQtbWoRc
Message-ID: <CADvTj4qmXWbDsc-vigcSrF1N=zpxmZWGp3YaZ9PFcWK551h3mg@mail.gmail.com>
Subject: Re: [PATCH 10/21] net: phy: add X-Powers AC200 EPHY control driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_082649_072063_1F6AA00D 
X-CRM114-Status: GOOD (  24.78  )
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

On Tue, Aug 4, 2026 at 8:54=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > I agree that the link PHY cannot be identified by reading its
> > registers before the package control sequence has run. I do not agree
> > that this means an arbitrary ID should be placed in DT, though.
>
> The ability to put the ID in DT is there for two reasons:
>
> 1) You cannot enumerate the PHY because of missing clocks etc.
> 2) The vendor messed up, and did not put a valid ID in registers 2 and 3.
>
> 2 does not happen very often, but this is one example. They are
> different PHYs, they need different driver code, when you consider the
> PHY as a whole.
>
> I also wound not put in an arbitrary ID, pick an unused ID in the
> vendors range.

The value currently used in DT is not arbitrary: 0x00441400 is exactly
what both link-side Clause 22 endpoints report from registers 2 and 3
after the corresponding package control sequence has run. This is case
(1), rather than case (2): the ID cannot initially be read because the
EPHY has not yet been clocked, configured and released from reset.

The reported ID does not distinguish the two packages, but replacing it
with a synthetic unused ID would make an ethernet-phy-idAAAA.BBBB
compatible disagree with the value actually reported by registers 2 and
3. If separate AC200 and AC300 PHY driver entries are needed to identify
the complete package variants, they can use package-specific match data
while sharing the common link-PHY implementation.

>
> > Both AC200 and AC300 expose the same link-side PHY ID and register
> > layout.
>
> No they don't. There are extra registers in different address domains.

The block diagrams make the distinction clearer. Both diagrams depict
an EPHY block with the same internal organization: MII/RMII, auto
negotiation, auto-MDIX, 10/100 TX and RX PCS/PMA blocks, LED logic,
clock/reset, PLL and EPHY AFE.

What differs is the surrounding top-level control path. In AC200,
E_MDC/E_MDIO connect directly to the EPHY, while the package control
logic and registers are reached separately through RSB/TWI. In AC300,
the external MDC/MDIO pins first enter a top-level MDIO slave and
register block, which then provides internal MDC/MDIO connections to
the EPHY. That top-level block also contains the AC300-specific reset,
clock, I/O and eFuse controls.

Therefore, I agree that saying the complete register layouts are the
same was too broad. The packages have different top-level control
registers in different address domains, but the diagrams indicate that
they contain the same link-facing EPHY implementation. That maps
naturally to shared link-PHY code with separate AC200 and AC300 control
backends, rather than two copies of the common EPHY implementation.

>
>         Andrew

