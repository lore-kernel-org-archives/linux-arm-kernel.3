Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C8DCA9EDE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 19:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hePjOQgDk2oAPjPtpp2sw4T2GMv65ZXd7JkCbKndfRI=; b=i362c6A6uEkPI4lmZLx/yDheOU
	+c5VmriyjyFr+QrODTFYj4EF89tEh3zyl6+rcQpqYED4dADPz8gO+VZp2EwDbCYRNNRxhVraZZnMf
	kH2GoBgcJ92usnrVBLTOUqy/46gPa4OWkerRIiBh/zeWYoS4+k0/tHPxGe0P15Tjc/2c5Q03vwB1j
	2nAZnG0gFMlVuzDd1WkyCvcqgFfWHbodIjXlpNAgN54+wH5ahxK6oLtxV2cObSgcy7zzy5y9dkwLt
	f4iBTjp8MKbOBy0qYWbcfjFwybDK2cplOiZWniQJ156+9jg/fkMdan3voPjRR/uKjBNBnoPRlCzjr
	A3/9F+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGM0J-0000000BPc6-3KSj;
	Mon, 12 Oct 2026 19:48:14 +0000
Received: from mail-ej2-x07.google.com ([2a00:1450:4864:34::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGM0G-0000000BPb7-0EhR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 19:48:09 +0000
Received: by mail-ej2-x07.google.com with SMTP id a640c23a62f3a-c2e15e7ab2bso177453366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 12:48:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791834486; cv=none;
        d=google.com; s=arc-20260327;
        b=fAh6ZUBUew6hCBatiWyws4LgesvkE1IMV7efGr1doj78RpBSZmLmXbZyYPCipbMhXG
         yS1yF9UmSBKm/z3KKNMmLYPTaqDCdp8ooQz/ucE3Fhef/TFJTNgoyG1PZtTP8toM9+wp
         Z0GB6EbYPIRbWKHJ5SVWBszlSbbK4uF7LhZiFrXnUcYvJ0mfFIwzjXuATQXybidhkPRf
         OgqU931Ndgrbl8JVQ1oxkoJNhNO2j+O6qd7kFchBP5gaJw7/1k3D2vjdmTIqBBep7Rt2
         sJqC8Uy+vXFEhEsncKKIqEgDsjBFyh49GKfK/FS7GvRMZvAXyYtBQ4pj166XO0lNRWnq
         fh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hePjOQgDk2oAPjPtpp2sw4T2GMv65ZXd7JkCbKndfRI=;
        fh=kvD6Ddm4BkUINWY8dLjQOfJ7du5P27x8aZCb6BWGPAs=;
        b=HvD4pgP2/EI87MQCsnSS5vEu9NMYIoNjo4ZRPhAmzo8UwwiBmXewVcIw7mU1vi+15Q
         3mATGKbnrgS4CejejnVEaDLuJw5Bkqk7zlKlE0jp7octfvPq/Mlx3KcqHILIIC4sKZAi
         XEPBPuEOuXwq7GNr12A8T1dc8BYTZ4OS9AdsWQPCCF9FwKTrOJBF3f7Gb4goV1hz9SAP
         GSdSHV1FR8K80Pv6GlCejK6vYYCNbJ1P4EUDifDtMdaB+XKLDZZEM3jT3MEYFPJc6AOz
         keN3IyZ6RUHsXLAvs1PmxKY6mxsMUF6F66DKQDNXp0jIDTmMCYyTsYkNi0Evi7OJ5pKR
         /cVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791834486; x=1792439286; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hePjOQgDk2oAPjPtpp2sw4T2GMv65ZXd7JkCbKndfRI=;
        b=sE6c9mHf4wgr5vsyJHID4XW7HZnECZqAOe1h7fJEYcZR/ORr3SM4j3EvVK3QcngN1M
         2pot9AepnBM2aqIkhN/tIQGIS6P5VPvddajsrZlxD09gwrY0U776QxkSxm7PuDTnHjoz
         Pn9KB+DihyM+K8DFsLOeTGbaHdqWdXpo807En8eR9aE9o1udEW6MjyPoNyT/uLTOJftl
         5zoK0BYjPekUfxFsdjWSEi3nKg8Q1gSJs4qUm89yPuAPSpHXsb1iiPFCSxJSY6MGA5IB
         99jLjC0uirpqO63DKIWUkFReKxUGRNUc5OnKCAL0uf3ME5blz+BhTicLpdFttjC212rt
         lK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791834486; x=1792439286;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hePjOQgDk2oAPjPtpp2sw4T2GMv65ZXd7JkCbKndfRI=;
        b=HrLogluUXMP13Crd9nxxLv7wz/7Pb6y3ZPviH6wOFhQqe4N6w9QsB92ZtdYxopskCU
         Z7iJXxchXMea95cS3EfbvfQvX7aCHtpqVStzzZUORpBr8j2fg+QtfyLqo8idcWeKHVL3
         QjM6rGj3AvCpmo3gFQ6JyK+hKJz29SqZVNjKpTQ50hj3D+nfvXL+DC1b4MOTakNdz8F1
         4Dc/FD/YAbOKSV0hKdYOHkSwaCakfERcY7n7tbmXQIohF9/CBNsEZ0cdvZP4JlXcPSM7
         xXonlR7ghkXi6sDen0ju434kbfSIHq02Fk2KpWb1oQt4nK3i4Av31eGVmRR53hjkPbhF
         bHJA==
X-Forwarded-Encrypted: i=1; AKwUvBwUo1mMKbLP4+RIFiZ3FVH+L61OYWKroED1YCfEsziCBuFxKkmdA9NLEP3/Qj05P32iONk0/Nt6wu0IMYeMHeiU@lists.infradead.org
X-Gm-Message-State: AFq9FYLg57BlOFmMtO3UqjVTOZrSAbYEPVsT9piFtRceAfxOTwzEhBZk
	F8b1BzJnuXU46gGqXl/rkZDovGg9eI15swXlt0++PJSh4a3fCD1ltfpCS2PiWa0F/DUPu9tZv5e
	yhOGfj0LfNCdmljPfJ07MSs4lsyH0u5g=
X-Gm-Gg: AYBFou1QMVjx5EI/hO00wHOBNnsJQzj35nBD36l7Bx0dpXOJhmM05NJ0XYBuDm1jSnp
	HvRfchRKMr9wp+8ZnJCSvumGLg10b5WXGE3WRdpZFCD8qTR3LzoC4rkxQg6F0Yy8SxjI0KPjYAZ
	oGX7Kb78PwvcVt4nLr+kufMcCXjgdVUVYdcp7uBnt0B5M1MBROEl82lTqU2auKFeyYIk7dKMrul
	mtOwy3qLOjlQCIkc60k5e15sB4BpyvUI74OqeTZMTAv+3OuF5yhLlWHk6+PZFau0jF8bNBfkax3
	Y8VDlo3O8W8lJyyoElkeWQGIX+3KQ0/vQCTVQgDQpQfSeYdEf/St4HJtHw==
X-Received: by 2002:a17:907:7b8d:b0:c2d:d9f4:2c85 with SMTP id
 a640c23a62f3a-c31aa0c129fmr992438966b.41.1791834485955; Mon, 12 Oct 2026
 12:48:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com>
 <20260919-s32g_serdes-v3-4-9d68868c1e89@oss.nxp.com> <6aabb56e-406f-4d13-9fd8-54822202039f@bootlin.com>
 <assmUIvWMuZsp8OO@lsv051416.swis.nl-cdc01.nxp.com>
In-Reply-To: <assmUIvWMuZsp8OO@lsv051416.swis.nl-cdc01.nxp.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 13 Oct 2026 03:47:58 +0800
X-Gm-Features: AclHuK-mWeAUUjbT2q4HaMO7I1jbUFx_FPbAu9P_i7ekNoCvSs5mbKy3dUi7DkU
Message-ID: <CALj3r0gQkUARS1e+2CGB3JsrGJ2XrzuoChfz0cWYRpK4kq1Uxg@mail.gmail.com>
Subject: Re: [PATCH RFC v3 04/12] net: pcs: add NXP SerDes XPCS shared core
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
	Ionut Vicovan <ionut.vicovan@nxp.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Clark Wang <xiaoning.wang@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_124808_134600_4C459BF1 
X-CRM114-Status: GOOD (  28.41  )
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

Hi Jan,

Thanks for the pointers. A few thoughts.

> Yes. The S32G accessor is the same DW indirect scheme pcs-xpcs-plat
> implements (page into the viewport at 0xff, then the low address byte
> at a 4-byte stride), so there is no reason for S32G to carry its own
> copy of the XPCS code. The next version drops the shared core, exposes
> each XPCS instance as a mii_bus from the SerDes PHY driver and creates
> the PCS with xpcs_create_pcs_mdiodev(), much like the RK3568 glue.
> Details in my reply to Andrew.
>
> The part that does not fit pcs-xpcs-plat as-is is ownership, not
> access: the XPCS windows sit inside the SerDes subsystem register
> space, and their bring-up is ordered against the PCIe lane and the
> other XPCS instance, so the bus is registered by the SerDes PHY driver
> rather than by a standalone snps,dw-xpcs device. The accessor itself
> is a few lines; if Alex's pcs-xpcs-regmap is merged first I will use
> it rather than open-code another bus.

On the transport split: I think the cleanest path is to split the MMIO
accessor out into its own module, say pcs-xpcs-mmio, exporting the
read/write helpers. Then pcs-xpcs-plat can call into those exported
symbols instead of open-coding the page/stride scheme, and S32G can do
the same for its indirect window. That way nobody carries a private
copy of the accessor. If that turns out to be too invasive for plat,
keeping a separate pcs-xpcs-plat copy is workable too, but I'd rather
avoid it.

If Alex's pcs-xpcs-regmap lands first, that's the natural place for
the S32G accessor; pcs-xpcs-mmio would only be needed if the regmap
approach doesn't fit.

> S32G needs the same kind of thing: skip the generic soft reset, and no
> EEE registers. I will start with the existing PMA-ID mechanism, since
> that is what TXGBE and FBNIC use today, and switch to a callback if one
> is agreed in the Rockchip thread. I'll Cc you on those patches.

On the shared-core duplication: rather than copying the whole XPCS
core, I'd look at how the existing users express their quirks.

Wangxun has a genuinely different PMA ID, so it can branch on the
ID before the reset path and keep the generic core untouched.

The older NXP devices do the opposite: they fake the PCS ID at the MDIO
layer so the core sees a magic value it then interprets. That leaves
the magic in the core and a fake ID in the glue, and it doesn't scale
to a third user.

For S32G, I'd prefer one of these two approaches:

- A flag in struct dw_xpcs, e.g. DW_XPCS_NO_RESET, that the glue sets
  and the core checks before the soft reset and EEE paths. Works when
  the quirk applies to a whole instance regardless of the PMA ID.
- A platform callback, e.g. plat->pma_config(), where the glue can
  return early to skip the parts it doesn't need. More flexible, but
  also more surface area; I'd only go there if flags aren't enough.

Either is better than another fake ID, because the quirk stays visible
at the point where it matters instead of being hidden behind a made-up
value in the transport layer.

One question: how does S32G relate to the earlier NXP devices already
in pcs-xpcs.c? Same IP, same PCS ID, same quirks, or something else?
If they're the same family, it would be good to clean all of them up
in one go rather than adding a third mechanism on top of the old
fake-ID one.

Separately, I have a plan to propose platform callbacks for the XPCS core
at some point, regardless of whether S32G ends up needing them. The
core currently has no way for a platform glue or PMA to limit or override
parts of the generic behaviour, and I think that gap needs closing.
The exact shape can be discussed once RK3568 lands. Happy to Cc you on
the related thread when that happens.

- Coia

