Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593BA10D1489
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 00:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLm/cWeL+ALoe0xoKYMB0cJ1r37KJ8n7QLIQtxRsqdU=; b=yqrY+sIrTzh23ajr4jb6kGw651
	PRfRdQjAqMALTCTGqqwhUR2N+lHav1MigMR7qry9qPdsELrlvC8W86LL7Bp1XSt3uu7WVwBQx83+g
	KJs1NPobSS6O1TI+uT0WKmHNQ78gGVVf8rp/If1i4jovL7k3pER1WOr5Jc1cBfQ31q7nz+dxgIINl
	yuhQ9QbkMXidEWXZZNnEtjfNxEDXKR3HyL/4KpNiYSJUcOQJgy/sZoDy/Oxv7gJoPk8HJiNjNT11M
	yalEHCs5FnRX3TsNZRN+wMEy5WKo4gRKnHJc8zs0o6nR9SYQsdpQksMwNgur9Byn1esdQfBDbxyYq
	NskKhYPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6dnH-00000009PfX-0OQF;
	Sun, 29 Mar 2026 00:14:19 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6dnE-00000009Pf8-3Hkj
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 00:14:18 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1273349c56bso4050166c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 17:14:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774743256; cv=none;
        d=google.com; s=arc-20240605;
        b=aymq/PioUXrO81+37ZPnbrqR5DbOxb/jTRmDu3hqhNDbT4eqxCK4nNVgVuRAB0lvIq
         xG6J2IgPyM6Ce9G+2xpn4YiKPVJ/irR0YzPPDQjHo0AWxVaMBRZzP8VpmkPO9/bPbRsF
         v4N7TUVZY8LH16UDXrQLcKLQy3ZGEmC9YHES2hPkANzX24xkQdo0mjL+YUuR6fTSs773
         Y7dBW7SlzC1H1MNxTxxe//8ICIWo832Mnn2hlyqaxEnvDNpheVnfPide/xg/U2vO/XjI
         MgrkDINQr1Xo7iNRfxORX7HL952vPcsQDCUUdGImvTR8Myvw/GLYxBRSHze2ju4fNCEQ
         CBNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wLm/cWeL+ALoe0xoKYMB0cJ1r37KJ8n7QLIQtxRsqdU=;
        fh=c7AfWbY657EcF045GDa0ZaraIemhjgwEzkUEZtUp8tA=;
        b=HtHIQJauM4kyTaEZEH+4ehFRHKItSAzDEw5/pvhGpzuGx27p6dUk9Ncv0AN7rZLXYD
         2nwFJw4ZEE37CXEhRoLFzh/vlkQAbGyn/OJ3G5Hd32CFdRAwgk9NjUA20/OcDPnPTB6Z
         exsW9iapCnSPCrGDEaOkz9g/Xvow60ejiRxJeL2KTGUIKK55FkHWuqibjveR/NfmxQgk
         Wvyu2MT9ygaUDCbvaUdb0T/RaFyRptmLI6tAwMfl6Pv5kstwuiqrBxRX7V/3rGdLwTI9
         nPWdVkkYn8yP1L7Btc3HRq+/pnBllmQ1jAEcaSXzQM4oMOUnpeG4QOVjKEMhOtXutsAY
         NWfg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774743256; x=1775348056; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLm/cWeL+ALoe0xoKYMB0cJ1r37KJ8n7QLIQtxRsqdU=;
        b=axcR/a7FDayVmEQuK+2DonqTmA8LNl1Z8IJUM5hK04FFs03JZbk1tanqhtGk4ccOOZ
         IFzpWCHToSf1gfGkiRFL1s+OFLHaBEfagPKetDn6yfH/8gQJ1oy58iJjqhEnZB9OZQaR
         Sne9ntl27aSZIkt/eYzRtZlRGlknruOlhVaehC1cm/8F1Sr1A3c64jy4RjN5v99cD85e
         jylLnoaBCEeaUNGG0VMrjifQ8xPt+ps4cez5kNDo86PO54rZrN8LmvZKSCjV6ZJNyMYb
         Ifxx/TbOT6lPA/ADQsyOG6+1+F5P2Tie1k3rVS3ObR/w7+4Zt0TNgmbCtI8IzJLtTwTP
         8qKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774743256; x=1775348056;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wLm/cWeL+ALoe0xoKYMB0cJ1r37KJ8n7QLIQtxRsqdU=;
        b=MTVvasz3iUUMpUIYFHrGUfY3lGuPCd+djtWhh+8VnWZ/I6e47smr5HrVLDqHX18wcX
         XzWxl3gV/i8KsqaLAsA4foVTaoo5xldyOqhfIlRGsuNqtMXJNIPIHf56e3y2fi14/rT/
         m6wsYGhwQ0HYL0EMj2DQgSbLsgnR1VIzPsyfn74jKELGuDwVTvj4wyk69FW2dIcksH1l
         gvbVx0SJJfg8S7ZKLXg1+N8cytAhmkDnaXGXuJfnp1wZs4Il1v//EBMgerFS3VTo3lzP
         LRcMl4tu7sYd8NlhAdFLJn5/lKV2UKfU2F6OHrdf1GkNutxyd6rEDe/BiITy1dXa0DjB
         WoEg==
X-Forwarded-Encrypted: i=1; AJvYcCW3wHy+0oJc0xhkvyoKuiezKZAEnO3a+cntBIUS7vR8uTM+U3EwKPZXbxE+hI6+bs1b//2y8iCKUkjeoBOuauJe@lists.infradead.org
X-Gm-Message-State: AOJu0YwhGFfcEKY2FSnKR3DEUT+U1V5Tv8bPq57dmeM+xh8SKDIpqUdv
	P1nS6rDend7IqkfjcAYezEdFRbn4add7ReF0ys4miyMUKRsikpN0OyABqT1hyfl9BDRyM/2rMd0
	fBsJQRyn1BDQVGDuS69rBydVw4AmOvvLvtKZNzyg=
X-Gm-Gg: ATEYQzyzmLiX95wVhZg01uR1UJemqYWKQE7UAA47I5kGDAgSNRJpQChDl8zdDEhvCuG
	a1/zoA5WvlAaJqqSwIg2gAALIJlZ74LUZimaWW5+8LDnZylgdQfMSlOeogH/cpPlnFG2U0JiELT
	7tQ0mz1M9oZ0mdlFxIgCpZ3gktAdStLQZ9e5rnIZ/V1MyWGnYSawNwSWT+OF3HPA99prUpySFG8
	DXwlTvgYpqZv5Vq85owI+2cQJVpDn0JIMcRkz6hxd+BxJuC+2n3dPvodwx3E3T67K/qS5rraXrb
	my0ag0ZePuAtVrBufxSm
X-Received: by 2002:a05:7022:220a:b0:12a:71ab:8235 with SMTP id
 a92af1059eb24-12ab284be87mr3912794c88.6.1774743255658; Sat, 28 Mar 2026
 17:14:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260328-asus-kommando-networking-v1-1-66d308b88536@gmail.com> <ed3d39df-0a0e-427b-86cf-b9b2d2094b51@lunn.ch>
In-Reply-To: <ed3d39df-0a0e-427b-86cf-b9b2d2094b51@lunn.ch>
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Sat, 28 Mar 2026 19:14:04 -0500
X-Gm-Features: AQROBzAt7ICtBirsaNdRYtv4vbmjxcTMi8IMv_vX0eO1yy8eUd3xiGfmPfRlEXY
Message-ID: <CAJ13v3S7ucjd-ifmKFBDGtsg32MbOar2OBeiGMVEJBsH8+JP7Q@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Enable networking for Asus Kommando
 IPMI Card
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_171416_845948_7028FBB7 
X-CRM114-Status: GOOD (  23.75  )
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

Hi Andrew

On Sat, Mar 28, 2026 at 7:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sat, Mar 28, 2026 at 06:39:59PM -0500, Anirudh Srinivasan wrote:
> > Adds the DT nodes needed for ethernet support for Asus Kommando, with
> > phy mode set to rgmii-id.
> >
> > When this DT was originally added, the phy mode was set to rgmii (which
> > was incorrect). It was suggested to remove networking support from the
> > DT till the Aspeed networking driver was patched so that the correct ph=
y
> > mode could be used.
> >
> > The discussion in [1] mentions that u-boot was inserting clk delays tha=
t
> > weren't needed, which resulted in needing to set the phy mode in linux
> > to rgmii incorrectly. The solution suggested there was to patch u-boot =
to
> > no longer insert these clk delays and use rgmii-id as the phy mode for
> > any future DTs added to linux.
> >
> > This DT was tested with a u-boot DT modified to insert clk delays of 0
> > (instead of patching u-boot itself). [2] adds a u-boot DT for this
> > device (without networking) and describes how to patch it to add
> > networking support. If this patched DT is used, then networking works
> > with rgmii-id phy mode in both u-boot and linux.
>
> I've been looking at
>
> https://elixir.bootlin.com/u-boot/v2026.04-rc5/source/drivers/clk/aspeed/=
clk_ast2600.c
>
> And i don't see where mac2-clk-delay is implemented. Could you point
> out the code?

I'm testing against the u-boot version that openbmc uses for its
builds. I don't think upstream u-boot is used by openbmc.

https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/drivers/clk/=
aspeed/clk_ast2600.c#L999

>
> Thanks
>         Andrew



--=20
Regards
Anirudh Srinivasan

