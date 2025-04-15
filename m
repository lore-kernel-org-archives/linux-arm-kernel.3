Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D261DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 14:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TwZ3MTtKiM7l1EeKd00zGsHBWMHnKmuqThclAOg/Kg=; b=F7PW3jSYNKvsb9zxFfNVXRxKvB
	UiWxtBK0z8bb0060J67b6QswxgcTXHkH+eMk4kowlRAlUEjzwiqXrGMQRqUAG6RcDqnfkFJokFmdy
	t46JAPfxYPJwxmrNhnuhojek+ze92ZWlh0eeCfMpuT4y+D9DVBpOuohK0bv8BdFTVMI2F2DLCihng
	rqDd+68nXMSNdz0wZdPw8A6GcKESC2/n+7/3lsOEhedhrLgfyz6gW3esWN6WGPcV99XTp7qn//4IY
	Oc2JAY6f817IHF6XaV4tj3mWcKzQ7iPf4ErmLYNV9jGOxg/XInjY1xqGzWDLr/nXn6Y/XUb8syN4v
	ME4XibUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4grK-000000061OT-3Ak8;
	Tue, 15 Apr 2025 14:01:54 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gid-00000005zId-3iOQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:52:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39c14016868so5156794f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744725174; x=1745329974; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TwZ3MTtKiM7l1EeKd00zGsHBWMHnKmuqThclAOg/Kg=;
        b=KPjzo/Kxy7PTz4ZaAxKbmgkJyl15KKQWzeUhweQ2D2QpJAqzY7Px/vTk1E9hQJOVYT
         ZY6J+74WZIMI8CFDGuTBvMm0fPMdSeg0CyagqU8ztHR4PBjmVXE3bM2JMpISDowuG2Er
         1idY69vlyQO7uS0LWXSAtuSJUsR9+4M0gCnR0u3Ltem8lZJLh2Ssyxuvni1IqVs5hkvr
         SEFDNgtdAnWCXEayVZfdi5dPQR5/vH/mKOOUgZ9/3qWrnjbe8pAXZn+A1HmbdVtnNuUS
         pGkoiTHjRbrT9T1sh6xKajFtlXZwIBj+b7ii77fxouWLs5ksE+l6IaRqQLz9JVJ7YUVw
         cuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725174; x=1745329974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TwZ3MTtKiM7l1EeKd00zGsHBWMHnKmuqThclAOg/Kg=;
        b=J+KpIacMKakQkL6A/mBALFAWIRGSnbrinqfVnKcDin72uu6/CmGmHNsSvhXVCogATj
         8f/VLZ+RuZaTi3pxQyW6A9y9iP5swMTyvADHI4rysgmTkg7wedPuHPDlj0NbpU1orz40
         1akD5/7u0Pwtfl6IED6IoD9PllYeN042it8VWiwadgwH2kLhAKr1jnzXzYijp6CUw/bf
         ooZjJzZvY/MaMxo8jiNf8I7JqwAKFWKT4g4PiuexaD4CPLQZBWlK7pHNGfVvX1lCNPjx
         6k7v1mJGr9luz1q23y/CK0uQ/eTgTpc5zusEzfpe9XrTCByZTyYyVECSUBhGpdYd3LwB
         Xz7g==
X-Forwarded-Encrypted: i=1; AJvYcCUSraualQ6e+/pRijxJLrSk1HccgFCixD8214BvddrrYhrU9IWjWPAbeSLkdO0guFHSGVZh6WEqIHcE36G+/KzI@lists.infradead.org
X-Gm-Message-State: AOJu0Yybifi+XNME/lltYypbOVAyJg/1OtCiIPYYyf99M25y++a5+Yh9
	feZn3genr3J/q2ASEBSwm9aARvMHiE+S4JVpzaujaOKCqjE0oZESBqw49kEohEelhWaGUpPdeMF
	yfnbvP0nZDwK/Mqt+nzjFPDsTG1U=
X-Gm-Gg: ASbGncv+2vsAaTuMFTzfvMxHVgvyf+e/ZgWo7AmiXs1k6qDHH4Ctj1HR4TijFgL741Q
	ve15gqTV75j+lN3bU4oz9hBscL53hI5RPH2zZoqqKtSouP7ZHYb2ieZcwMd6vxFE1efoOdrJmSl
	XpVXTuXA3C76IQnfCSgBIX8RDMZz4DgqEnES1c0W2jjWmW0HkHT2hrHIWLLk/0sl0Z
X-Google-Smtp-Source: AGHT+IHK+m8VrLrlFlxV6nZ8ThujVJZ2WLpJFiDSDa8zctkcFlgA9baoyjBybS2403268oDSkrugum4D+6yxW9qAQH4=
X-Received: by 2002:a05:6000:2905:b0:39c:2688:612b with SMTP id
 ffacd0b85a97d-39ea51ee489mr13637534f8f.7.1744725174186; Tue, 15 Apr 2025
 06:52:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250415125642.241427-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250415125642.241427-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z_5hc151mud_UM1C@shell.armlinux.org.uk>
In-Reply-To: <Z_5hc151mud_UM1C@shell.armlinux.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 15 Apr 2025 14:52:27 +0100
X-Gm-Features: ATxdqUGwNzRsl8J8RvInaxREfU9EplttUyDfCX4lENAuX3MnWfvUzlpS2hWxJag
Message-ID: <CA+V-a8sTN_vUDxL7V_64U3hs2-AB2Go66_gELe4Bkx0po2734Q@mail.gmail.com>
Subject: Re: [PATCH net-next v6 3/4] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_065255_922541_1863F707 
X-CRM114-Status: GOOD (  15.80  )
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

Hi Russell,

On Tue, Apr 15, 2025 at 2:39=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Tue, Apr 15, 2025 at 01:56:41PM +0100, Prabhakar wrote:
> > Add the DWMAC glue layer for the GBETH IP found in the Renesas RZ/V2H(P=
)
> > SoC.
>
> I think we're almost there, but now that the trees have parted, we can
> start seeing other bits of wood :)
>
:)

> > +struct renesas_gbeth {
> > +     struct plat_stmmacenet_data *plat_dat;
> > +     struct reset_control *rstc;
> > +     struct device *dev;
> > +     void __iomem *regs;
>
> This appears to be only written, never read. Do you need it?
>
No, I can get rid of it.

> I think that's the last thing I can spot in this driver, so with that
> fixed, please add:
>
Thanks, along with this I'll fold renesas_gbeth_clks_config() contents
into renesas_gbeth_init/exit() as suggested by Philipp.

> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>
Cheers,
Prabhakar

