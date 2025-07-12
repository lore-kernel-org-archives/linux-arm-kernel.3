Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89ECCC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 19:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKagfN2d5XxVdHG3XeAT69zzT+aJHWetXb6KF0S4PHA=; b=vLVnhKN4oLejhRsxADE9fGUpEi
	18SwfQMUnStRtlVwPrSWXIzoHNfuWGZ4buaBpvWd1So1MrPD3KdccLtcuKNrlPmV1yjIpRsPQmEO8
	5N0b2PYmrB7e2Y6maNqdtLO/kSW+9O5vIJrZ+QRlWxIFnMYVgbY/6vf0kVZM7HjxM1g8NXwcIwvtH
	D/cNECirKNZqIoVVy7L5Ms4idN6sAxIknzEyMOjj1BObnaQBF2A0jvZpPFE5y83frVEVqfgQW95l3
	kZsbwnNRhA6WBGC4Iie4kZyskUf6FqsqF1GcA67PeRup7vYFe00Q9f8IWf0MjPTsBLiJVGMJ9z3yy
	qsk7+cKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uafXC-0000000GvQT-1MDW;
	Sat, 12 Jul 2025 19:05:18 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uafUl-0000000GvFw-3Q7H;
	Sat, 12 Jul 2025 19:02:48 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e81a7d90835so2582856276.1;
        Sat, 12 Jul 2025 12:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752346967; x=1752951767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKagfN2d5XxVdHG3XeAT69zzT+aJHWetXb6KF0S4PHA=;
        b=VWi7jPqwTKvxKWOxfqcj18hsqXeQQTheISJCJYSAUqE6MM42bBtGhiLvIgLnewyjve
         SX4yTIFfgnXLWoGs5HHbMUYeItfEDPTIBseUkc/17Z/ndihsCNMJuCJhWHD+Fdkrw+WL
         +gULWvyQVUjFr47vkaQV58K4MnHPkm9VkQe+qkdDzFGtDE8UiM7LBu9nZ0UmIZZBKhGP
         ZjpbTg10KutgHkKuNo8+S8ovfJEiwL9Yn0er0h0Vs4AK5kXTIMEPOprBZKLbd8g43I7Z
         A+z2JBzZCCmFUEIFovieFGkU1dwCkzpy3T4T8P+XWJFe1exIcfpf/TDfjzLJ0MMYWZac
         PDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752346967; x=1752951767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BKagfN2d5XxVdHG3XeAT69zzT+aJHWetXb6KF0S4PHA=;
        b=nt4Cgy+JBX+d7tlJhDcq+VQA7OIucRodEHwV9r4hQzMrNujxq6d9LgyWPDDRS26Vcp
         47EMKmPKyZNWJDOsiwNV6Il1b+tKA+0zxilFHNMr0W/SqiKVII3eeY8d1v8JBnL4nYj1
         nHyeARe9YVCzL9cacGTvT/zBxWCMNiJ81cJ8B/gzovQFreANxXsxwjA/YsjtYCq7cXax
         0muytNmhHvWaKYPauNXu78y1KulI/+rD7Q9HPgH1dC3cpRMRlfKVp9fJoiyPGwLhUJWm
         rJMA417vbdR90qEOy/A5r4gGWd7ALL1hgXP4e89u0GDi3RWaxpdhsYOtOFpaFqgNfN3l
         b/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWLV2rWcGZSX4IprO1r0ilk5dapgM8RWTmrgAlJwQoqr54vHLp0dL2WDoiD3Z1GDiD4st4huFYdeg1DDj72Pn4=@lists.infradead.org, AJvYcCXoSB71JGb8pNEX/zFYXAlLIcYg2dO7YuO4Eksm5RvY+8NBZSbDup4W59DcuMkU7hNf6ZXjDhRu+ehTF/ugpyD7@lists.infradead.org
X-Gm-Message-State: AOJu0YxEt5sgI1KsTdspHmuCc4EsXkrP/9QVGcLmzQRhrR6nznOHi8F6
	59Fs+wMSQpwNkGru3gHDi6gnwSsN341kbupbxYjLigv/lFqWcWPxYRJJKDuTqS9KMvNgHV59EqT
	Y2BMK9fBy1AzGonGSpLENqDvSzMu1JjE=
X-Gm-Gg: ASbGnctuKyBbSXLq82Da/kQEpOT30tRGZPkR6oGGIYvd3zaWLCy7NAyHwXvYWH3BGwl
	zIAju9CmnK0qY6UWjHpDi96RP3Hbfi6+RjSdq9x2L4ov6jy0foufeDnS+2kMIB+7fdfLr4rfmEQ
	WYob5bNmSXrEcuhg49xjoyL2vkLRRjCpYuQ71T7cqpKVIJy2uEg40gUXNiWoN7CA255gyDdo0qh
	CkWLYBgkMiqY105qkt/
X-Google-Smtp-Source: AGHT+IGcVwtnhZTlH9ebXa+wUvIAcCciQYTgsn0OHcrVkEU41TNWJ0CyN7Bjj8sV/x/9RM6/03LPIHWkDmUeM8sMpF4=
X-Received: by 2002:a05:690c:3687:b0:710:f39f:4d3f with SMTP id
 00721157ae682-717d786ddb7mr116815487b3.5.1752346966755; Sat, 12 Jul 2025
 12:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250710200820.262295-1-rosenp@gmail.com> <20250710200820.262295-4-rosenp@gmail.com>
 <20250712101418.GD9845@wp.pl>
In-Reply-To: <20250712101418.GD9845@wp.pl>
From: Rosen Penev <rosenp@gmail.com>
Date: Sat, 12 Jul 2025 12:02:35 -0700
X-Gm-Features: Ac12FXx4rcjDaaA71XVlUBA-AkCziwkS6KnteMro8jng8d1wYOSRPnIgM60fm5s
Message-ID: <CAKxU2N-RXgFKYPAqEu3iZDMAisj_K-b+ZZTGFsabWz7pMK+02A@mail.gmail.com>
Subject: Re: [PATCHv3 wireless-next 3/7] wifi: rt2800soc: allow loading from OF
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_120247_851944_AF7A7875 
X-CRM114-Status: GOOD (  25.86  )
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

On Sat, Jul 12, 2025 at 3:14=E2=80=AFAM Stanislaw Gruszka <stf_xl@wp.pl> wr=
ote:
>
> On Thu, Jul 10, 2025 at 01:08:16PM -0700, Rosen Penev wrote:
> > Add a single binding to help the already present dts files load the
> > driver. More are possible but there doesn't seem to be a significant
> > difference between them to justify this.
> >
> > Use wifi name per dtschema requirements.
> >
> > The data field will be used to remove the custom non static probe
> > function and use of_device_get_match_data.
> >
> > Added OF dependency to SOC CONFIG as adding of_match_table without OF
> > being present makes no sense.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
> >  drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/w=
ireless/ralink/rt2x00/Kconfig
> > index 3a32ceead54f..a0dc9a751234 100644
> > --- a/drivers/net/wireless/ralink/rt2x00/Kconfig
> > +++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
> > @@ -202,7 +202,7 @@ endif
> >
> >  config RT2800SOC
> >       tristate "Ralink WiSoC support"
> > -     depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
> > +     depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPI=
LE_TEST)
> >       select RT2X00_LIB_SOC
> >       select RT2X00_LIB_MMIO
> >       select RT2X00_LIB_CRYPTO
> > diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/n=
et/wireless/ralink/rt2x00/rt2800soc.c
> > index e73394cf6ea6..db8d01f0cdc3 100644
> > --- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> > +++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> > @@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device =
*pdev)
> >       return rt2x00soc_probe(pdev, &rt2800soc_ops);
> >  }
> >
> > +static const struct of_device_id rt2880_wmac_match[] =3D {
> > +     { .compatible =3D "ralink,rt2880-wifi", .data =3D &rt2800soc_ops =
},
>
> Why do .data =3D rt2800soc_ops here and use it via of_device_get_match_da=
ta()
> in patch 5, insead of just use rt2800soc_ops directly in rt2800soc_probe =
?
I see more of the former instead of the latter in drivers.
>
> Regards
> Stanislaw
>
> > +     {},
> > +};
> > +MODULE_DEVICE_TABLE(of, rt2880_wmac_match);
> > +
> >  static struct platform_driver rt2800soc_driver =3D {
> >       .driver         =3D {
> >               .name           =3D "rt2800_wmac",
> > +             .of_match_table =3D rt2880_wmac_match,
> >       },
> >       .probe          =3D rt2800soc_probe,
> >       .remove         =3D rt2x00soc_remove,
> > --
> > 2.50.0
> >

