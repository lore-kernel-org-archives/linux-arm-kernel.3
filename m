Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54847FD9E1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsCRG0iMNmW9L8aiB7Z8unJe03vgR5EOjM6cSyXzpw8=; b=2wjuX0zGb985Y7QU812TQpzMNF
	M4oGWXFdHp5vu2XX82v4eAl7dIs71nSguTbc82EPzaZbs3+fcf4sDx+peTJ7Goqqa7gWpQSRmyzvd
	Qzla4R9dMOJyBPM0GufORnkgfMBr7MmcRHFWUI2hNPxSw197BTy4J+bhRcoAz0CU+HeqOXHrR+n7c
	h0uIDkcweLreQG8/OLpq+R0P9m/SycFpwxpiHdOxZP/0fkim6I182d89x3hyqhvgB6XpLToCym7Fm
	px6kq4EusyjkS5cX9D2xRLWMP9n6q5AJLyzFOIyMgZIJYN38heBadnWs+ELN1T6+gesuuE4Qq7s2x
	pj7r4tjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjFF-00000007GkD-2oXs;
	Thu, 26 Feb 2026 21:50:05 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvjFD-00000007GjR-3a31
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 21:50:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ade574f05eso9516155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 13:50:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772142602; cv=none;
        d=google.com; s=arc-20240605;
        b=PdcZaXSPrC3Yo8QkAgC1eHlPdCRHlCXgJabmzqgKJxdMUhTFbHr3qE1jNeolPfhse0
         U1cC2FTrdKYkeOoZ4EgAPhVHcBUKFR87KUjqN61F1KXJSSi4L+dDcCOzSuGoWySeM2Lv
         g7VNwdDFCInE1PLils4lgSkybqdqnGZ4nLaHAShc/uXABjoz1KU31NzvNRThCMAn/8dn
         w5CGLJz4yShlMlH/oQuOwmo5AOO9NpiB2LJfMUvGK50npr3bpoC5qRuTnDElpz4YG/NY
         BFPX44IF6RqDLbvxYXkcIrtNQgXw1VH5EubGP/8xnclpArLjcuRXsUnnr2xASIDtXlrm
         oWXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dsCRG0iMNmW9L8aiB7Z8unJe03vgR5EOjM6cSyXzpw8=;
        fh=L8OlLxYcyN5mOmO5tqxCnxxWPW1ZG69gApxFBvHa/RQ=;
        b=OzS66sp9i+XqkCzKI7oVpX3WKm2aC8lt56VkiJzfSBPE3JMMwnFC2psQ5Li/Sj0Zl+
         InyUWQ7jQkKCIGqKEIoWg2MBnTkmJ8wJoyygjbrFZi51PgzJqZbdgGwBcGplwjq1/eaS
         3VboAWneif4a22SgjK2IrTkThBfh28UTLRuD7sDvLO6X+emjx7+F9UNcHO20asLbDfFv
         IpI8qzRhK+fa6SyM5YD0ylYrMaHCH1Rlo+zv668VQtXMEKpwi46OmfsP1tuWKAc6ocbx
         yIcRCp/eSlZUEvCaheDTwrN5Fodrix0polAYVSgN2wRHY2fijCiE6Kk5VnOYe80zP51M
         AJ1w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1772142602; x=1772747402; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsCRG0iMNmW9L8aiB7Z8unJe03vgR5EOjM6cSyXzpw8=;
        b=i42YbUO9XCR9g52rXGRn9xuudOWZBCeHpn4e4rucSkMeoc6kHPLS+sn4OKo/dARgco
         7ChuzrJQHfUERD1+61QV5NuQt4BiVYhykPKEUvSZHe6E+5Jp1YjugY6SdTjJICAP/V5v
         F9bUclCIKv4afAdI1eFXZmMbtqM7iVJap0YmwyORAledqQkpSdYnDkE1y8ZUHDH1ZMwo
         spRthGYMDskpZNHnJNPXnZIlyEsWatvM2iPXf/PQRg3ohhVZu0/p8hl9J1tGVsnc+c7J
         0iYNT40RVi7RvVnQkfG7huoe4W0x7vwvSQYcXp3UIQHKIYThMd90iz5fK4GCaO7ezJFG
         VpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772142602; x=1772747402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dsCRG0iMNmW9L8aiB7Z8unJe03vgR5EOjM6cSyXzpw8=;
        b=LtZJux0P1NnMsaQxl97z+s+rmDmNSPMflFgltI07PrMTeMhYpjcsGJY/321dhc1LSh
         vvT37wSkL4phBuIxddZdTVLZruZQoZ8UaPneCzh+84tN4BW3Ib1gVZ4GG7N8SLTt2NL8
         vtbMN7g5YBcicSCShrTa2FYTHhoItjyDbZcNvMh6Q1vAKzEoXSBECL4ml+94W919DMAN
         JSwRl6iqiIwVYZ0K4rVIKEF3eKHs3jh3MG1SkFM5jrCbxlQjzczqxEF/hQbVGvsNmndm
         gmggpLQ6HNKhzFOuuwvILC1aY2ldAf9/vs37h0ZOroe9JT4zt/Oc4icje0v4Hrn2gUyU
         dKfw==
X-Forwarded-Encrypted: i=1; AJvYcCUu7EXfp3vnlztmFXAb6s5xabgRxSlbi5URqTok/2vNmeQ74AAK68Lp1yxgisRsTiNBNjaEORvquPL+z75w7GCL@lists.infradead.org
X-Gm-Message-State: AOJu0YysjQfB8qe8lBuJUyTdw3AlQl576lpOMLJv98TvW1mNWNkHsLDd
	AG7B2fSua0DPuQhqL1kPbC4YsODqMtXYPLYIKQ6x79vGBdFY4el2tiIpiiAoNHCn7R/yUxNUCt0
	1q+22td9RkKsat5glO32Q7z5siWo39n4=
X-Gm-Gg: ATEYQzy/s1YGzjA2UPx5/DDmb+HU7UwY8tensvuyORVZKO1FASkRIchXZf4rR/FyHEM
	xajWSeWaPQonUMnWBi3sV0MGt9mzvallLOYFs0fjblS/t1ThCDJL7jTQK5N/6CVL+bWotUi7G2e
	UaPzm8sPafCh0VqFus5A/9NGR6J+tSTuMUflllTApyvtGAwrp8uECCOuIGiNb4klN3owg+Vkax7
	q3D55YRiHC70M/E5/8wgJVrgMdV6ya5vYlEmQtZ/B56GmaWTjFtAx7DY0FF98If8xZEZMTmGYVz
	r5oCmPnla4KeRvWcX4bQJNWqKEKm2Ecyppd/pixW
X-Received: by 2002:a17:902:e849:b0:2aa:de68:98c1 with SMTP id
 d9443c01a7336-2ae2e47df0cmr4513215ad.26.1772142602187; Thu, 26 Feb 2026
 13:50:02 -0800 (PST)
MIME-Version: 1.0
References: <20260123022258.136448-1-nick@khadas.com> <20260123022258.136448-6-nick@khadas.com>
In-Reply-To: <20260123022258.136448-6-nick@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 26 Feb 2026 22:49:51 +0100
X-Gm-Features: AaiRm52EfSMFA2O8jNHHtEJKIVvMNtNK2XUKbtJkKO0CR4bhD1JcrnoKD6-Fiww
Message-ID: <CAFBinCB0MhXUb635Pe8mth74H7wkpHZbEFoFqbgFLw_yRQ_A=g@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: dts: amlogic: meson-s4: add internal SARADC controller
To: Nick Xie <nick@khadas.com>
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, xieqinick@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_135003_886001_5126265B 
X-CRM114-Status: GOOD (  13.26  )
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

Hi Nick,

On Fri, Jan 23, 2026 at 3:23=E2=80=AFAM Nick Xie <nick@khadas.com> wrote:
[...]
> +       saradc: adc@fe026000 {
> +               compatible =3D "amlogic,meson-g12a-saradc",
> +                            "amlogic,meson-saradc";
It seems that the engineers at Amlogic are constantly updating the SARADC c=
ore.
To avoid any problems in the future, can you please add a new
compatible string for the s4-saradc?
For reference you can take a look at:
- commit e415a1659ec9 ("iio: adc: meson-saradc: add support for Meson
G12A") which added the g12a compatible string to the driver (note that
meson_sar_adc_gxl_param since then has been replaced by
meson_sar_adc_g12a_param - you can re-use the latter)
- commit b2729cdf2bc0 ("dt-bindings: iio: adc: amlogic,meson-saradc:
Add GXLX SoC compatible") which documented a new compatible string in
the dt-bindings

I think it is best to do this in a separate series.

In case we discover anything that needs changing in the SARADC driver in fu=
ture:
Having a dedicated compatible string means we can just update the
driver and be done with it.
One example where this has happened for G12A is commit 48dc1abde015
("iio: adc: meson-saradc: Disable BL30 integration on G12A and newer
SoCs").


Thank you!
Martin

