Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B74E7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqNSP8u9FYnKkd4xDRWAuBWQOKd1/6jXqlAv5Huiee8=; b=OyvFuPd1Ht0sLwa+QVuktMubvv
	9FQ1xPwDZBoKUuX0ijEM1l0mJGdEXWX2NsMcFWx0oROW/Cfgj8s9A5BO4DuimYUpTRv7JjmDVG1i3
	tAPvfoqPEsrStFqNYEqfM21qPHRNT0NGd6qDFiyVOaVs4OcxlYs/ltYCjvW+7DK1n76Tu93ZPru3Z
	FBX+F5qfAk4GVwmib/moS1SMWZTDza8qeNrM1uhcX/SpeVHrd9PMmt3ae3jFVT3FOiZSTIkXkIr9C
	PnMMgD7nsU+pHh/TevrTMXscZqsLkNtowraC/kGfEdOIxDVF/NVSpKEe7DJP5p9nuRfdzlbVdUFDe
	PGuzGGmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzWU-00000005VkR-1kkQ;
	Mon, 02 Feb 2026 19:23:46 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzWR-00000005VjN-3pY8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 19:23:45 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-658d4059b79so7191847a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 11:23:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770060222; cv=none;
        d=google.com; s=arc-20240605;
        b=PL52aJgM7cee3W9ZOWgozaIk4sevS9U0wiRZGuX+4zGrY81O4Umw7Qqh32fLd07a3/
         FA2M9RX+k/jlokxJxKTRmrRjQ2LHeA6mcNFrQdK3Aa7nlx4iKRM9gIN8uorEfT0yvZUK
         9K2iJbwKtRkFIT3NBvMLZTH5nXAYOuSzljQDShUMMpF0cHxp8P/xDoUJH3wOq/BGqkAX
         Fb4gwFRFyGqM7TTqdGNHYIlAyG+bybsmo6RFk7zNMbLeWNIYUAYUvXVbJ4kBdJmNXI6Y
         8PI1bLEHC1sf9rXGPh3YQOm1EFO/EEVf662wufS6Z/g6S0F2RJiqTv0CBeg+AjX7RTEn
         Rmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=KqNSP8u9FYnKkd4xDRWAuBWQOKd1/6jXqlAv5Huiee8=;
        fh=toVP+2j+MdsjXotAVG+7s4Og2XRp/nwpjfuNPq2SkBs=;
        b=jhg8CFA/1R2FYmsq+SlkVVNrDEWZz+5PPFxSp7V4QnpKyXArbQkyAh6svcSNwvuW+0
         ygt5M1oHORN28stuuSKQsfkFvURWFYdrPMXDJTNF1NvjbXiq+GY1ewzVhBJnqnIFYzvJ
         qZzyIPjH2iw+ldb0LQJBILrOvQK7xeFf2UyqQ6gdD3sriu4oNSxQs+AlsEOhCF1+HIbS
         aG38Vow7fy00VIGJ4Sjo4VlDfHvYe53s5aNDlX2SEgirsTgSq7I/DRUsadqyjL/v6K3U
         O7XKNPBNJf+OIiBwHHNEtuWk6mUk/kQYL1G2XDCXrMTBxktAbfO1MaA8SnbUyC2YXpfL
         WPfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770060222; x=1770665022; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KqNSP8u9FYnKkd4xDRWAuBWQOKd1/6jXqlAv5Huiee8=;
        b=EOVGyasYfj5HiMlSOX2pBUAPbUIdezHydyrauQEwS9MXLNaRYZFx81GHqb13kjH1Kn
         MXtSLs0Ayt+jhodUlQwMY7bhCshIZKQ1Bv2GSvHYL8lG37N7kaiOaJJuhaxXAJcHARNQ
         9PUaqLMggFj4qx+jgxK2WZhTX6PM0BFrHARIUcKYwZtZjm3sXy73XMtKF2nNOmohxubn
         n8QONfiA5u9ZFARMDskp7GA8ePPSSm9VBmED3Nob5EbJLQEEYhJMojozloE+BAePUbfw
         xUjac3Ri2LR2QKpNn53k19BDVDoq7RcvSJcZrpU4qrF3SQpkhMnDd00lhCRVn45t2mfH
         rcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060222; x=1770665022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqNSP8u9FYnKkd4xDRWAuBWQOKd1/6jXqlAv5Huiee8=;
        b=gbzKRiEZaBmrOcVVqARi+PIFFQHkzdjprakn4zRHLYu+MV9gXxyPc8HQ0pFgMWg2yu
         ej2axw5EWHX5BCsL987XMMJLAG2mO6fkDw58n4f/cmnsrUm/ojIZTNg8BcIoGKXzExDF
         Rr3yDOO0DD9RO8/cWSruOL5Psx8jj2E0G5X3bDMY/0dp0y5HbtLmiYKkcxYHm2oem+qx
         NJXpvRdhBIRnl6J2drB9L75WN0LTV968kZdb0YZ33+bEubxuLlxjQayIZKq3hxM51/ez
         3m34V/w4pBKoYrgwSYgNfOKjgAif3tKm8p6wh1t36oyBYXITZXT6xu/v3t/jcWvPa8k+
         6vUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCXKJSR6ZLnwDtB/jlQKBeNT+OzK9VWN+hH58yvBqK8ZCQ+A7jOWjgwKKOuIwfKhyoNl1QIZEK1z9lACWhwzO1@lists.infradead.org
X-Gm-Message-State: AOJu0YzTGVBZgu+l/7HGgdKNp5ZWVrI0lgbae/msf2/f0M5hvu1ByuVi
	cHiIjJPeHHfANR0YjZai0yeQJkE5sgDJLwfUf7oBY2uEm0md5HUfQ5CF9r0gvpsRGx/16m9RBEH
	Zz4CN0yBYvOvXtkr2ZEZa72C+HyImRNOAFyBWCe5pXw==
X-Gm-Gg: AZuq6aJ/404vaap/Yvwc+R/ZYM+pSxoOxWuIRzZ/oF8gQ1Yh8EnxZOfVnd4O64Z4r2r
	W31MhrrFIG6vlC459+WoqmKpXxn8rcbhlSLw/PgmzaWZjV0QZmEKiZ3DqP4xjQ8trSPPPzC+bHB
	tbRaHSKvHLUbIPV+/no/qaLu9T16KLiKKXxYEe2HRqQl0d5h27kPJ78dNWApIQOsG/kNm3YhcQs
	xAYIslx12Ip34SKI1N3Pf63iolj08Nd/ohYUjXCds3guRSfcpZz0k7RY+GNSR/Q0glh9MoIdeh1
	I4yPjfRlh87tt0tuRU9o9g==
X-Received: by 2002:a05:6402:430a:b0:658:cc59:161c with SMTP id
 4fb4d7f45d1cf-658de563dccmr7500568a12.12.1770060221904; Mon, 02 Feb 2026
 11:23:41 -0800 (PST)
MIME-Version: 1.0
References: <20260202151050.1446165-1-vincent.guittot@linaro.org> <aYDiFpGT5hEDDFhV@lizhi-Precision-Tower-5810>
In-Reply-To: <aYDiFpGT5hEDDFhV@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 2 Feb 2026 20:23:30 +0100
X-Gm-Features: AZwV_Qh1oY-NeA_FmOnmZdDAzImBqngjLBWXIy59t4ga6SGhrkYyYc67DM6knQ4
Message-ID: <CAKfTPtDjad7aowTQ3UJPi5Qqgzf3q8J=kASa-t3YM4zfjUv3-w@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: s32g: Fix ports parsing
To: Frank Li <Frank.li@nxp.com>
Cc: ciprianmarian.costea@oss.nxp.com, s32@nxp.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_112343_983827_80DE8137 
X-CRM114-Status: GOOD (  20.65  )
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

On Mon, 2 Feb 2026 at 18:42, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Feb 02, 2026 at 04:10:50PM +0100, Vincent Guittot wrote:
> > No error return is missing after the loop resulting in removing the
> > ports from the list.
> >
> > Fixes: 5cbc7d3e316e ("PCI: s32g: Add NXP S32G PCIe controller driver (RC)")
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >
> > Change since v1:
> > - handle correctly the case when there is no child port
> >
> >  drivers/pci/controller/dwc/pcie-nxp-s32g.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > index 47745749f75c..b3ec38099fa3 100644
> > --- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > +++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
> > @@ -282,12 +282,12 @@ static int s32g_pcie_parse_ports(struct device *dev, struct s32g_pcie *s32g_pp)
> >
> >               ret = s32g_pcie_parse_port(s32g_pp, of_port);
> >               if (ret)
> > -                     goto err_port;
> > +                     break;
> >       }
> >
> > -err_port:
> > -     list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > -             list_del(&port->list);
>
> break and goto is logical equal here. So only need below if (ret).

Yes it's similar that why I removed it, the goto becomes useless and
make code less readable

>
> Frank
>
> > +     if (ret)
> > +             list_for_each_entry_safe(port, tmp, &s32g_pp->ports, list)
> > +                     list_del(&port->list);
> >
> >       return ret;
> >  }
> > --
> > 2.43.0
> >

