Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7772D148AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 07:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAN8+Ciqh5L4w3kAbltziKsgSCvOxXNi49H+2aGyv4Y=; b=zkK8Qyd/GFhfBTfE1zpH1HSlWs
	MBGOI+jpIcG3nvrrNvwtGox4vtUJnfJR8Nku9iIfeG9tdSt3peuPRToIFj9Ct7Kq/Jf22ZXPpsgf8
	ui8rxobCSBDPPQZEwbDkPRSW70HDVl0iZ84cdvAbzVGl8fgeIwWtUk5xL7kNZ4v+qCIM4v5yyJSXS
	n6Taq4x1X2sa8ck8Q82FeRCZ/RRrTCmZfVEIAwCVsVFNt3O5fJYme3da2pZDBzgSAKPfRnQQGdc4P
	mAZY64GsO4auo5sTJyyWtsDymD1ygP++uObH3QxdxUUYh9RDEdAnzQRGL8nsEvj7VuFtF/d5NKAyV
	hRQl4w8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdk4d-0000000G3Ls-2IM4;
	Thu, 08 Jan 2026 07:04:47 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdk4a-0000000G3L1-2qc7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 07:04:46 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-64ba74e6892so4669173a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 23:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767855883; x=1768460683; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAN8+Ciqh5L4w3kAbltziKsgSCvOxXNi49H+2aGyv4Y=;
        b=TddIoUJ9F5MeZSH7T6hpKnJpOQ0hK7SuRwtsj3tWYNXGz7UpYdAsjzlMmM50OxqT5N
         zkYNq5w1hb3KqzYy6jaQy6NL8SNyEIboKEzCZG7J2Ga4VzVKNf+EMCqVrAfk5PXmSEMe
         14uDi7FQyut/TMNbM5tgML5WX+N7QE5rOfztaI31chB5zzg1i9GUmlgMDaxQtn8OGpjT
         J5kd5Wr7HuHE1/qNEZKQwVo4Yz0/QTo66f3ZFX95LKuYRs0uRKY3rJzamtSMTUTtzema
         f5McU/Jfz6/0D+8LY9OrIkAtX2SMygTS/Tb/yJVXJiAzui0AXkhpce8nMnG+PyQyKq7M
         i6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767855883; x=1768460683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EAN8+Ciqh5L4w3kAbltziKsgSCvOxXNi49H+2aGyv4Y=;
        b=RFF2C/YRMozVOXvWg9CTcB+dEQR7yfGJiMm53GmQytUdCSrIMx8PxiWNV+ATfiQqbF
         k8vP2+WXKYOQ6Qd+OdntCCW6cCROk9v/6zFAa+KF5F53FY5qBFg5rmEe/Uq5sMfR+j29
         t+8w8gOpHl80FK+oTWql0Wn8FLrKq+3Br+9O8HC9MOpEF+C+K6p08Gy4UJ+auxgEa9JR
         9UKHEbYgC+7N+wT6o09hx9B+nMTcnai0wYe+VOBtpbkLm/FWe9z924w0FGqFi5eoL+IG
         NDEoivfSsMJqmI9RVb7srYcyXC1uIu7GBBVRoI94sakthsrsk8U0FJzOkBe6mvNZWreo
         5w4w==
X-Forwarded-Encrypted: i=1; AJvYcCWIlNYuje90smv0tQNBzqfhrGD77X2hoIBZoGyzVPwQz1KMd+ANk7zTgZEN9rNAp1/xbIkflwC7CecgIZg0pytR@lists.infradead.org
X-Gm-Message-State: AOJu0YzHmKdVwkHA7/KvmpTaCjTh9f9z65TUEH3Ajmz9s94IliN3Y0ZI
	OJqXHJVUWLB5uKlidx2yTIU5IS61hGfXcrqiZ1QYixyjTbkYqXEkH9140NIdyK9XlCeECRgxuEe
	sOGgDnxb9585JvspBVjMK4QVjLIrMzh4=
X-Gm-Gg: AY/fxX4W+FfZ/hEYCvZKbqoVdhfOiXvwdGw0KLI90R8sphY5EB9CDhx5MpNWqqrxevn
	buQdLvRK7SogEFDUjZWhAThzKEvZWQEUtFj2dKQocQ3OIUAAR/rT4vyz2Jcwg1nLAv7MEXwzYDj
	Ek0T7McEkqWsO58UkkjsiwmSHaZvG7dlXu8IzjEL3xrENtVw4PzvCmwcPfVO5VL5wuzPgkiQ30T
	gTJkJNgQq94QcG6cdx3UtBkzh/QvoaPoRwwGs9ul0vzWsm9rGr87DNuiqvndcgRHnF82vDdQa7Z
	1A==
X-Google-Smtp-Source: AGHT+IGBP1Y/NBrrCMuhwkVQ6AO2ojqKOG+H99YGlpDe1e8ewtDuvZGEnWtYEQt6lSgwqc5HalftMS2UQQytGVd5v6I=
X-Received: by 2002:a05:6402:3593:b0:64c:69e6:ad3e with SMTP id
 4fb4d7f45d1cf-65097e8e43fmr4488123a12.33.1767855882738; Wed, 07 Jan 2026
 23:04:42 -0800 (PST)
MIME-Version: 1.0
References: <20260102131819.123745-1-linux.amoon@gmail.com> <ald3sxdzggbhqvpc7ra7x5nkf36xoamgwfumz5r4jwgirdzyes@nwvka2h256f6>
In-Reply-To: <ald3sxdzggbhqvpc7ra7x5nkf36xoamgwfumz5r4jwgirdzyes@nwvka2h256f6>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 8 Jan 2026 12:34:25 +0530
X-Gm-Features: AQt7F2rxp4OBghS7YFRzpcNM61eouESYIn1a5kIjLPye8P3AweeGw4bjR-rsO54
Message-ID: <CANAwSgTAHUXkZXxe_Y0KTssqqvKZAiOe2ZwiFV4EJ8k9sj00Ng@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dw-rockchip: Add runtime PM support to Rockchip PCIe
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_230444_740294_83AD497D 
X-CRM114-Status: GOOD (  23.01  )
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

Hi Manivannan,

Thanks for your review comments.

On Tue, 6 Jan 2026 at 19:06, Manivannan Sadhasivam <mani@kernel.org> wrote:
>
> On Fri, Jan 02, 2026 at 06:47:50PM +0530, Anand Moon wrote:
> > Add runtime powwe manageement functionality into the Rockchip DesignWar=
e
> > PCIe controller driver. Calling devm_pm_runtime_enable() during device
> > probing allows the controller to report its runtime PM status, enabling
> > power management controls to be applied consistently across the entire
> > connected PCIe hierarchy.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > v2:
> >    improve the commit message
> >    Drop the .remove patch
> >    Drop the disable_pm_runtime
> > v1:
> >  https://lore.kernel.org/all/20251027145602.199154-3-linux.amoon@gmail.=
com/
> > ---
> >  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pc=
i/controller/dwc/pcie-dw-rockchip.c
> > index f8605fe61a415..2498ff5146a5a 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/of_irq.h>
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> >  #include <linux/reset.h>
> >
> > @@ -709,6 +710,20 @@ static int rockchip_pcie_probe(struct platform_dev=
ice *pdev)
> >       if (ret)
> >               goto deinit_phy;
> >
> > +     ret =3D pm_runtime_set_suspended(dev);
> > +     if (ret)
> > +             goto deinit_clk;
>
> Seriously? Why do you need this? Default PM status is 'suspended'.
These changes were part of my work on suspend/resume capabilities
>
> > +
> > +     ret =3D devm_pm_runtime_enable(dev);
> > +     if (ret) {
> > +             ret =3D dev_err_probe(dev, ret, "Failed to enable runtime=
 PM\n");
> > +             goto deinit_clk;
> > +     }
> > +
> > +     ret =3D pm_runtime_resume_and_get(dev);
> > +     if (ret)
> > +             goto deinit_clk;
> > +
> >       switch (data->mode) {
> >       case DW_PCIE_RC_TYPE:
> >               ret =3D rockchip_pcie_configure_rc(pdev, rockchip);
> > @@ -730,6 +745,8 @@ static int rockchip_pcie_probe(struct platform_devi=
ce *pdev)
> >
> >  deinit_clk:
> >       clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> > +     pm_runtime_disable(dev);
>
> You used devm_ for enable.
>
> > +     pm_runtime_no_callbacks(dev);
>
> Why? Where is pm_runtime_put()? Please read Documentation/power/runtime_p=
m.rst.
>
Ok, I will study and update the changes.
> - Mani
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D

Thanks
-Anand

