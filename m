Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319CED7237B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTgO0VCdnh1CfBBoLFE4r4P+fwbkrM17HUN8i/ddW6M=; b=GTNns9EMEVIP6uAHQqg02G2gz0
	cszoF2KU56sZby8m8q8w0IUNZ5Mw7CnLV1KAzV+CXW7bd0o8vYHpcXEtgUF8kf8G9hW+oeItDiT76
	F10PSZk99LxcMzqTkQ8RNRbC/anEYf8Cj+Hg1sAa+X4zHPaqm+yZq60EpY8N1yhRCoNEQmH1zzNru
	aLnx6g0NEehGB9raJoYiHkLxbMqAeegcxQ71udNQMp015K6n0s899iNKdRUcM30mI5vlZDV/XrPw+
	/Ldnh9pbvXhi81miIx7CFog7wYpCSJptGXXq9cualE9sHCqpKr0dOW8cStwFZnb2BzQghKHvSmK2R
	KQZ3aN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk92N-0000000BeXm-3eSO;
	Sun, 25 Jan 2026 22:56:55 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk92K-0000000BeWq-3Zkf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:56:54 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-404308dd5d6so1351029fac.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 14:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769381809; cv=none;
        d=google.com; s=arc-20240605;
        b=Ps27YgvXnmeoZ2YzhoTsZguGORQUs5Gm9HEXOzWZVoLhM2YolIULX1x2N1plc7Bsq/
         PcVR3u1gQJLkFBlip/tYjIPnBWYFz1d7lJ/BE7LHgYeQ58oWL9UoEQguTD0edZTnvWj9
         9fOqdkc+aYtdF3DUWcPrUSvkSq+b9bYNDii8cbPdv6OPx3k4LQecdBxHBKdaxTs/2HY7
         WcmPQIzBHKQr6QFTcKOXgnwi7SpdwOxot66e4y7K7e9ieiOC+pPykuPw4KfviX7ehoCr
         YofIBn3waem6X8edegMnFFkIBoEggYjb9yNJ8daAkeyLDdMs8bT06LSHxJgq8HvxgTaR
         3Diw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zTgO0VCdnh1CfBBoLFE4r4P+fwbkrM17HUN8i/ddW6M=;
        fh=NzOYnzXUh4P/2hL9Afctk7nBeTSKu36F1AHY7R0BFVA=;
        b=KEqhfBECmyvKPsZ2VDVUdD6CmVAiAIY5JENYXuJirbkiiWMeN4hzY70CxXpCTpMyJN
         8R3K5pbtiJxluFkmQcWVdIIIB4jPKzUDbo7EQgYxgIyABVl2uMP8kA0h5lmaPl8NYCw+
         mSObOG5ENAKs2NqtaVSFLBSvJZxV6wNCVhpyGFngfs9Q7CKUl+ESjlqJ35GoHQxetRyq
         bkKdi85XtXObUkyaam4THhLstB1BGPhEWRh0FoiW9mUSbdW1u4rQpYHA1O0PIhQ/mUTP
         2DlzkH689jF4XkUQbI4LHaLVikZp4w0ALmnSsVfLqwd4w1066Izd6TPbAoKCrFBLEziL
         qZ+Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769381809; x=1769986609; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTgO0VCdnh1CfBBoLFE4r4P+fwbkrM17HUN8i/ddW6M=;
        b=UqGF8g8S7F9ynNkKu+28BW9YUXYCWrKii4xvYZ7BYihh1AGqvcp9FkQ2veBk5jNPDN
         BiAiRrwh/vby2aYyZQAxnTwFYD+qHSodkN1qq0YVGelzhqTNw+QQaeXMFiV7c/i0Pdaq
         6m0Bnw4mDdVuTLR+BR6bRkkQX6Zi+tE9gyK1qnEP7mCWGh+f2ttRUE2KoZrNKD771R+t
         JwH4cUudjt/o4HdCGsZnvMZm4ZIW/oOMlYPp9BQQP86atjZR2AFepm1qjATVTLYLopk+
         To3AprjOfiHoR4DVc2EOQGBxYimM4EUMMCtPUsTo8N1awy13lccyzna1oBiLK2+qodLP
         tRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769381809; x=1769986609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zTgO0VCdnh1CfBBoLFE4r4P+fwbkrM17HUN8i/ddW6M=;
        b=sUF/Q1vUy02IG13YfHnK48dzYKardr2fytsQu3S53k5FC3D9m1I4NCi+XjI6vTdFMb
         Lygglj8k1uDBgkkv9KU7c+VmzMTolvtMAIopP0ir6XNXTfcANi4QhCkBjXfycxzBAJWR
         OSppldp16Vrw2bh1SCOoDvkV72vo2/hmlafHDB9/gBO3zFgvNRuNTytxwVGDnICc4daq
         RduTfpgwVQzyA+6czEfa1Naco+0Kpjg7Tz4IAG9Pc0AEqSX0w8v/uUOl/UW63KgJGG8Q
         eipvolq2W3TBe4OjKvg2QBQDVfSC3dh4eErhQ1OqUfMIYLOgXppkv0MK8LzhsXT0jy//
         y+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPtFiYkVt5zTiZR5rn+efsIySYWXyaq5Jz/Myw3Ac1PbvrIi/hDvyDHRMhW/stniKX8+HCUk1K/WcKLMuxIGxg@lists.infradead.org
X-Gm-Message-State: AOJu0YyPMeKfLJw60rGinUqpc0RgQxG0xLROtQWuaouODaLVUlqhttq/
	uzcks6Q2Rer9bP2+2/FDsUA4gGYPNbd7Ca8XZofqtzvYmb+bFHyZMayb7keggdxFBqpMuQkAS7X
	IjyHpVz6jDc3Eb3yoBPxuNlWX43JLBL0=
X-Gm-Gg: AZuq6aLz7snrFzO63ORQaF0rhAA/+lR4shlG0fcjCXlItFViAEz39Fz8wATnUYNaXow
	sLEL+Xgq/JpivYi1rFmkwaznxERWDqW8QEAEQMIQtsysGQI/2AnQeD7WnJ2ac0utN/lbP6T3CxH
	Vk/pVOPBgrIntY4pbD2XvHyKfLgwylp4CUbJFrsQhRFEZ8eMExQwjohjYX3AV9walt/5993AUse
	y8VB8soLBSLEHKLFJZ5SBHyhIul1fXvdczws2SBKzz89kJlWDj1AJTqMTlBPwR3gEVEVnUTtmjp
	3SN+elzZm3lCxQ+Ftjt3t34ZwcjkjpZ5xha0Ze9C3BGgkRFerV1pMt8FuIVb
X-Received: by 2002:a05:6820:1609:b0:659:9a49:8dea with SMTP id
 006d021491bc7-662e0450083mr1377281eaf.44.1769381808725; Sun, 25 Jan 2026
 14:56:48 -0800 (PST)
MIME-Version: 1.0
References: <20260122185255.2761568-1-mmyangfl@gmail.com> <20260125223455.31fd7a93@pumpkin>
In-Reply-To: <20260125223455.31fd7a93@pumpkin>
From: Yangfl <mmyangfl@gmail.com>
Date: Mon, 26 Jan 2026 06:56:12 +0800
X-Gm-Features: AZwV_Qh11aaleaFzpaDBhtbnorJB6-ZX9WBC2tkVSbFXNX7yzlrhcDRvcGkAFUI
Message-ID: <CAAXyoMOtMz9Hn=gqS1Wj0ASTZ1JaReZnc685h7YN2sD9zjrtcA@mail.gmail.com>
Subject: Re: [PATCH net-next] net: airoha: Use u64_stats_t with u64_stats_sync properly
To: David Laight <david.laight.linux@gmail.com>
Cc: netdev@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_145652_957720_1E3FC43B 
X-CRM114-Status: GOOD (  24.91  )
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

On Mon, Jan 26, 2026 at 6:35=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 23 Jan 2026 02:52:51 +0800
> David Yang <mmyangfl@gmail.com> wrote:
>
> > On 64bit arches, struct u64_stats_sync is empty and provides no help
> > against load/store tearing. Convert to u64_stats_t to ensure atomic
> > operations.
> >
> > Signed-off-by: David Yang <mmyangfl@gmail.com>
> > ---
> >  drivers/net/ethernet/airoha/airoha_eth.c | 136 +++++++++++------------
> >  drivers/net/ethernet/airoha/airoha_eth.h |  34 +++---
> >  2 files changed, 85 insertions(+), 85 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/eth=
ernet/airoha/airoha_eth.c
> > index 62bcbbbe2a95..6ed220e5a094 100644
> > --- a/drivers/net/ethernet/airoha/airoha_eth.c
> > +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> > @@ -1472,131 +1472,131 @@ static void airoha_update_hw_stats(struct air=
oha_gdm_port *port)
> >
> >       /* TX */
> >       val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id));
> > -     port->stats.tx_ok_pkts +=3D ((u64)val << 32);
> > +     u64_stats_add(&port->stats.tx_ok_pkts, (u64)val << 32);
> >       val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(port->id));
> > -     port->stats.tx_ok_pkts +=3D val;
> > +     u64_stats_add(&port->stats.tx_ok_pkts, val);
>
> Wouldn't that be better written as:
>         u64 val =3D airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_H(port->id=
));
>         val =3D val << 32 + airoha_fe_rr(eth, REG_FE_GDM_TX_OK_PKT_CNT_L(=
port->id));
>         port->stats.tx_ok_pkts +=3D val;
> (Assuming there something has stopped the hardware increment the register
> between the two accesses, and there is an associated atomic zero.)
>
> Otherwise you are generating 'tearing' on 64bit systems by adding the hig=
h
> and low halves separately - regardless of how the stats are read.
> I think that works for 32bit as well.
>
> Making the code completely unreadable with 'special' types and 'special'
> copy routines really doesn't seem worth while.
> The compiler won't generate code that does 'data tearing' for aligned wor=
d
> accesses, and even if it did nothing would really break.

Quoting 316580b69d0a ("u64_stats: provide u64_stats_t type"):

  On 64bit arches, struct u64_stats_sync is empty and provides no help
against load/store tearing.

  Using READ_ONCE()/WRITE_ONCE() would be needed.

> The most you want is a memcpy_in_words() function that guarantees to use
> 'word' size tranfsers for aligned buffers - and is probably an alias for
> normal memcpy() on all current systems.

See https://lore.kernel.org/r/20260120092137.2161162-1-mmyangfl@gmail.com

And if you want a memcpy, you need a buffer. If you want to fold the
buffer, that's basically WRITE_ONCE().

>
> OTOH data tearing can be seen for 64 bit adds on 32bit systems.
>
> It is worth nothing that on 32bits the 'packet count' and 'byte count'
> increments get seen as a pair, this doesn't happen on 64bit - one happens
> before the other.
>
>         David

