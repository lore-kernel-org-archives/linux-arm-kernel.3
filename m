Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9585EC55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/Tg3lEpqdaiPRfyjPgi2cmAvw9BxKYOOcBoKp4sZn8=; b=Ep2IU3qJTdwMT92tEzqfCXqY/9
	B0q5lkFFvCOIghWv+AMd0xQCPJlNQxxk3FuT/6/nUOqhDjnj5OxGt/qhLywK09enFahaWEtp2b+nE
	LQwqyFyhy6dg5KsFpeR/dXRYzQn3jfC5QGClMGIFSj5tNnhaRUEN9d9cshpqCaRhZmtUXhSYAKL3s
	SaQrvaieqIfb/Pt01dptpRO4F6NNTUIF5HD9cy/eRXnKzx4nwSQbuCLKDIBQN41RP3PMtT9O8z8YL
	JNW/eRHMJwdgHB/PzOOoLnQ7/sH6imQz1dysn6tdYk/urWd6TYvhG2U+KcURHg6dOYZuM3ZlCB6Fi
	35eR74qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru1R-00000005Kay-0dbi;
	Thu, 06 Aug 2026 09:04:17 +0000
Received: from mail-qt1-f182.google.com ([209.85.160.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wru1O-00000005KaZ-1rkT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 09:04:15 +0000
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-517dc520840so13706621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007053; x=1786611853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y/Tg3lEpqdaiPRfyjPgi2cmAvw9BxKYOOcBoKp4sZn8=;
        b=Nleuspw2R7H+j/FflY9uHLMKIweKI48BWVn5gRPOCJ/rTc2kbzUOhzrn8mB09UUlcS
         U5YEytrpfswfMpYplbmF5C6/iTYyOKAMSH9mE3o75jtdz+1qUATqDYCdSmOAMmnhBxLn
         y4ck39K/9BqVqzJ1cWkJtA6zp9g7PycAMnzcacBQBLsXNBGBT4B5KPMAG34ftapgVObs
         rKKMA/jN0JPflWXvE2w9VnxegZ4Pkv5ivJOmnyNb73mxirw5skvl2kmYg5XgGDaiEVQy
         pvAzSs61s3YxTW/z67N5sRUDbDrdvLuD2DCoWWtkEQjnfAoUAsX1amlnOqTaW4DkoLz5
         pCcg==
X-Forwarded-Encrypted: i=1; AHgh+RrrbRev2reJii+i6JiPRFU614JG8aexJaOWD3iZ19EwEo5j6MMAS2xpYgQ7icTRGKV5cm+oP4V6LK8Qn78zZ15z@lists.infradead.org
X-Gm-Message-State: AOJu0YwQIILwA/t5rrTRCVHRgU/0e2k0UIbNueb90IO6+yT81hFWgqps
	MLv525xBOmfYju/3+wjA71twaPrQ79xzR2J9o6ReJLFJfckU/Zmpk92Y1cqbX6IY
X-Gm-Gg: AR+sD13GRsltyLnWkVL1R+u/lCSemae2Vng4NVYuGuEvlohhnTxwg6ABDaBceXbK6FF
	EQMHp953rRIE+4vJRN+lGPYltEkBitI0mqQdAzxME8YzbBBxFZCyaPvCQ1A8wK7IJyZY4dLRyVK
	Q//ylIp4ymrA3qaxwz3P1VHL8zDl66i66TxGeDsJSEeExN4wBEVT2y5QgZxDZrU+/86eGBvCEQc
	f6+KsFEAdTXP8oEzGGL6GOs8CQ+5vbqr4N3AZRtw9AQBQjoN533IJ31EEXdRu7tny6IqWvRuvPo
	h1dS+0coIHU3hR/FTr+RWUjd46rFl8qdkTkb8bz4uZ8dC5Fw8YvS1qrY5uPwOBxDwkaHgFA1hbz
	mpcn8lWYKrsunq2OUHiPGNGdS4PNK9B7YZa8yx2mvDStU1MjbJ67U7xaO/ZkI9UKflXCj2z5WyJ
	lhhq9A7VAUJbsM4X4lj2dZOYagEiKyxVWep65XX/aruJsbHmo3MkV4fj0HdfkZxwYtZpxTilviQ
	uspaaiaG6aE5BOXZru9weSFnYsmp+JnQ/DU60RN
X-Received: by 2002:a05:622a:1489:b0:51b:7af7:77de with SMTP id d75a77b69052e-52ce600c3b0mr121632121cf.14.1786007052777;
        Thu, 06 Aug 2026 02:04:12 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908800ab861sm46552966d6.38.2026.08.06.02.04.12
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 02:04:12 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-51c8e2e39easo18256351cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 02:04:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqPxbCh4sH8MF+HlgxCH3WkdpMEdG6W/Id/D1pU0fjebMvcDW6xumNFVr4J3RzdyiCDdWCWcx4ac3fF7IcYAbEI@lists.infradead.org
X-Received: by 2002:a05:6102:374e:b0:739:626d:4473 with SMTP id
 ada2fe7eead31-760e3698c49mr3173857137.0.1786006724650; Thu, 06 Aug 2026
 01:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1785941595.git.geert+renesas@glider.be> <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
 <7c30baacac8c75037f32c0ac3099a6107cbec38b.camel@pengutronix.de>
In-Reply-To: <7c30baacac8c75037f32c0ac3099a6107cbec38b.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Aug 2026 10:58:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3mUVq5HAOcoLxf8_=ALKe_j-0uSTTORA_KyiOq1Bgiw@mail.gmail.com>
X-Gm-Features: AUfX_mwUZKZac7nMaa-VOsxeMPj2DizVJUU-sXiHc_DXR1wX8yJ0IgF-oPKqM3c
Message-ID: <CAMuHMdX3mUVq5HAOcoLxf8_=ALKe_j-0uSTTORA_KyiOq1Bgiw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_020414_490407_0D9FA1A8 
X-CRM114-Status: GOOD (  37.41  )
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

Hi Philipp,

On Thu, 6 Aug 2026 at 10:13, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> On Mi, 2026-08-05 at 17:20 +0200, Geert Uytterhoeven wrote:
> > Add a minimal Module Controller driver for the R-Car X5H (R8A78000) SoC.
> > For now this just supports the always-on power domains, and dummy module
> > clocks and resets for the serial console (which is enabled by the boot
> > loader).
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v3:
> >   - Replace <linux/mod_devicetable.h> by more specific
> >     <linux/device-id/of.h> in v7.2-rc2,
> >   - Add a comment to document only always-on domains are supported,
> >   - Consistently use /* sentinel */ for zero sentinels,
> >   - Drop trailing commas from sentinels,
> >
> > v2:
> >   - Spin off from "pmdomain: renesas: Add R-Car X5H MDLC SCMI remapping
> >     driver",
> >   - Add default support not using SCMI,
> >   - Drop all SCMI remapping support,
> >   - Document use of -1 as a sentinel,
> >   - Rename struct r8a78000_mdlc_info to mdlc_info,
> >   - Print HW IDs in hexadecimal,
> >   - Reduce log level for unsupported MDLC instances from warn to dbg,
> > ---
> >  drivers/pmdomain/renesas/Kconfig         |   4 +
> >  drivers/pmdomain/renesas/Makefile        |   1 +
> >  drivers/pmdomain/renesas/r8a78000-mdlc.c | 330 +++++++++++++++++++++++
> >  drivers/soc/renesas/Kconfig              |   1 +
> >  4 files changed, 336 insertions(+)
> >  create mode 100644 drivers/pmdomain/renesas/r8a78000-mdlc.c
> >
> > diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > new file mode 100644
> > index 0000000000000000..5c8acead7cff9bdd
> > --- /dev/null
> > +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
> > @@ -0,0 +1,330 @@
> [...]
> > +#define DEFINE_MDLC_RESET_WRAPPER(op)                                            \
> > +     static int r8a78000_mdlc_ ## op(struct reset_controller_dev *rcdev, \
> > +                                     unsigned long id)                   \
> > +     {                                                                   \
> > +             struct r8a78000_mdlc_priv *priv = rcdev_to_priv(rcdev);     \
> > +                                                                         \
> > +             dev_dbg(priv->dev, "%s: Ignoring\n", __func__);             \
> > +             return 0;                                                   \
> > +     }
> > +
> > +DEFINE_MDLC_RESET_WRAPPER(reset)
> > +DEFINE_MDLC_RESET_WRAPPER(assert)
> > +DEFINE_MDLC_RESET_WRAPPER(deassert)
> > +DEFINE_MDLC_RESET_WRAPPER(status)
> > +
> > +static const struct reset_control_ops r8a78000_mdlc_reset_ops = {
> > +     .reset = r8a78000_mdlc_reset,
> > +     .assert = r8a78000_mdlc_assert,
> > +     .deassert = r8a78000_mdlc_deassert,
> > +     .status = r8a78000_mdlc_status,
>
> Are .reset and .status needed by any consumers?
> I'd leave them -ENOTSUPP otherwise.

.reset is used by a variety of R-Car drivers.
.status is used by the R-Car I2C and PCIe drivers.

So both will be used later.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

