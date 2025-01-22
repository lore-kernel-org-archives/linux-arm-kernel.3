Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECB2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FjAh7Ei78ytRX43ARrF1IGLCoNkOCTH/fahyOjt2Co=; b=eNcjXgwxMxSVEExt6MrRh2UUk2
	qC00MZORy6zdkKXtPqqMhwb08kTmNhg/gPEUWVWbcIlHuN84vJ6HxuzXBWo+SpAHeivx6ekap79nv
	Aye5bzw1yzgUCV8kZPRI4Rkm+RjRH2SFZJMSL3spLbX33T36jVXm4IXSJ0SNNtkwX6AA3nNvV7rkj
	uxAxd9GkCn3fAG0V52r+obx+2E9rAZHxVgv6zlnCsK7HwkGkF+6/M1eg5Pj9KR3MDKnOwTnPbdzIY
	0o6x/WVjNeQQLxyC/dcuW4vMpL1ZcfSAu9I2OfqakDfThvxE3cJmTNhUP9tO720dacB8G+aSHhoD1
	N6EvQlZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXkM-00000009uQj-0xTk;
	Wed, 22 Jan 2025 10:14:06 +0000
Received: from mail-vs1-f45.google.com ([209.85.217.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXj3-00000009u9A-2nGd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:12:46 +0000
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afefc876c6so1784678137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540761; x=1738145561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7FjAh7Ei78ytRX43ARrF1IGLCoNkOCTH/fahyOjt2Co=;
        b=wTHzA716eT+KmGdXZVtkQh/K4MXDw4vVurXf4vQ038SG0xeDrgE4uOdi4K7xS0wES7
         dbsZhYxERHx4Yl8DyV0GUynoa/U7Yg8NjG/RG2zV3wAICnhZt3Y1pH7nbSemRXSBAfQ4
         EMo1sq6tJWpGgG5wqsB4WgqbcVe1TZV1YdOgUUZfHeQXL+RW54jnd4FAS/UQ/1EzyxM6
         NFBenRX3XJbz96AcovLl28XRsg89g3bnct/LLwdVpgOjVajoEG3asEj7XFPemxsvIVgT
         wqcFpJWkjGznsu6qoDJ+AbpAD7R0pDmNreZU6a89h0YhUAERhnqDIzippxc5qs2IMQ8G
         yHXg==
X-Forwarded-Encrypted: i=1; AJvYcCWEMZSKKhHZd9cUmaRy5UrHs6NuJ8c/2vfMUyqHQ5Kso/Iiz6oa/lzEcBBJOltELve1Tvgpfhb1bI30rZyNKzPs@lists.infradead.org
X-Gm-Message-State: AOJu0YwH5TLtQPYUAs/6YqxHJebMM+svltST5IKP/C29A6c7YgRJPx1R
	D4ec2u21yxvxzhJOPzsJiXG2TkOC/BXPfuk/fZ+8niqAOO3dWnERV3g/C8xd
X-Gm-Gg: ASbGncsjn19pZWNrea98vb1X269SQ3E76zans9az8SzSnWmCWoV8WgD/sIDExavSyFK
	iK8ObD1Xi/OYq9AZSp1Q+fhmzpattd34ZMQh5/rqXMUqmgEwxYL1H3Dt3lQNfT9pK7lnJ8YltUj
	hurwkrrw6zZWVnBBQblb8nX/plgJ/psT8Y9FD6Nauj6D7bDSVyTRyz3I6RnfxdEiM+4Ey4U9shG
	ZB64hK/ChIar4Da89dFAKvvWnQdMDmoyxbNdmTYn97nb0VJ0qzSZSaBgwdXS2izrpcegMRSNJCc
	mFdeSYmyOzXjWiRM6bIPLXWjOwkmOCD4
X-Google-Smtp-Source: AGHT+IF39EjN9ov3IcZxuI9Fd46rdqoUtseLzC/osfKwDtCvFF97+tQeN4I/e8l94aTlq2RSYAlpsg==
X-Received: by 2002:a05:6102:510a:b0:4b2:bc6b:c845 with SMTP id ada2fe7eead31-4b690ba2f8cmr14252190137.6.1737540761232;
        Wed, 22 Jan 2025 02:12:41 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a208576sm2606288137.8.2025.01.22.02.12.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 02:12:40 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8641c7574a5so1704641241.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:12:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnwxdPsOT5to6TOA74T5qAuVbo+d0llwakb9v1XDzo5lRrcQau+N0p+o42HOAfCBf7rNf5wpuiMPKhwkfq8gkh@lists.infradead.org
X-Received: by 2002:a05:6102:3f03:b0:4b2:5ce4:2b4f with SMTP id
 ada2fe7eead31-4b690b5d82dmr18149923137.2.1737540760048; Wed, 22 Jan 2025
 02:12:40 -0800 (PST)
MIME-Version: 1.0
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com> <20250103163805.1775705-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250103163805.1775705-4-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jan 2025 11:12:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUrU=wEORsTYA01nJKGDYyfGcbYUQ0PVbztWK89wAh6og@mail.gmail.com>
X-Gm-Features: AWEUYZnWOoKJ3RBtL6Pi7s9iVWaQT9ZdiOxnl5ZN6Xov2Ob1CcY6b31swX2Vhsk
Message-ID: <CAMuHMdUrU=wEORsTYA01nJKGDYyfGcbYUQ0PVbztWK89wAh6og@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, ulf.hansson@linaro.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_021245_701557_806CF6B3 
X-CRM114-Status: GOOD (  16.08  )
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

On Fri, Jan 3, 2025 at 5:38=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC includes a Thermal Sensor Unit (TSU) block designe=
d
> to measure the junction temperature. The temperature is measured using
> the RZ/G3S ADC, with a dedicated ADC channel directly connected to the TS=
U.
> Add documentation for it.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

LGTM from the hardware-description point of view, do
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

