Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F01CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0KqhCSWD1Q42FEiIO/7VeHXIAsO8MdqNCvIdMk2S6qk=; b=yS920QjW6UvN/ZLcauDaggsFLe
	mKnVwwcRZTMntOhFat0ixkaQ7dNdN6VOXydkKhW2sK7Z5x9uWZTm6m4Prp0i7aBm1BciItc0EtSDB
	RfMNHqhqUQg5OW9dsgHIrQ2Wbn/2xEQ7O/NO8v0hRUiIDNYWllJZbnmQDxPmPINd30yoSrYQGk07w
	hYQsct+T0FD9gjfVzsGp69WO+IvdrSfKhI0xuoN6PeJvGolActudmAe1bHa3GHwtfNzgdAig12xAl
	XZfz8/dGRiOFs8A5IkWpZw0HI0GhmT7nwQag7Kg8Gqw+Mxkrt7cGZqOVYRNeCqVj7c8gGtXJYa+e7
	3wQiBvrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDg6X-0000000FeLU-1KaS;
	Tue, 28 Oct 2025 09:35:01 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDg6V-0000000FeJy-1WgA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:35:00 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-63c2d72582cso9209993a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761644097; x=1762248897; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KqhCSWD1Q42FEiIO/7VeHXIAsO8MdqNCvIdMk2S6qk=;
        b=KLiw4kacL061uvVhopuS3bWHLGT1qU4KnPFrLTRV68A/bF3SYfiOg/ITSPhu1E9KLo
         0aZ5ZI+SVL/bWYU7u69AT87kprBwNHOYuFzJR3HDwISyt2M5n/qMqO2b2PSNx9K5hnkM
         Ej7fzfiUUEvaSpnqj1G3p3dEHn37YJ6Vh6ktrYpbdGZP8D8lRw9DC6QFRWRotTP2m9W1
         v+u6tCuwOGNlnM56OyUx02GqfpsdgvY4qoOBQD1Nv2CuuaTMPxVMavx8PVfur1lMKtKI
         gpDS6YLCUPY4XVbhtssyo90FSVBeh+mxH7p0lQqplmEddA8F39NF57lqd4hXbbh35uYZ
         VCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761644097; x=1762248897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0KqhCSWD1Q42FEiIO/7VeHXIAsO8MdqNCvIdMk2S6qk=;
        b=UWwZPwe8oD/9XnaeAuTHwquBNGzW3vZSfbrD1CECvXgRPndh2CMWjVmiAwlPSyV85k
         c9yrSpoWeY4FJYNBLbXW463eA05f13jV12U9E+ntBC9KAJE+S9rJ0hlgmgJ8SShVFdEd
         fCtvyue+q5gnkinmRjeVjIZlEf+vihYGdSrXJpRPIt8UAb7gaTKsdRKicxhVZR+rJ4OT
         20pcp8vIwlDDL0a9u/z5zbaMiKGwEWiIOTyG+4co1wpJ2D57ubY+uZaE6CGTgwX0E8z5
         Tc+7VAHRctq8XspVVyJs/JhIGw0Ettk3W2TQF2gTQzaCTqrd8LqC8dLLa7DHXUQrXZjk
         S/rA==
X-Forwarded-Encrypted: i=1; AJvYcCUtITZB2WsmhjBbuOc3hWDs6j1Y8vvyEfnE+sZjspzfIt0tUnQ7fpzpZxenJQl+UWocN1ch+QEVRkM1EJowHINU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzovk180iFiBIyzi4L3QGbeOC5XFMonjEdfZ0xQcaQhc7Yu+wV3
	ik2/pAmgvZQpt64pDrp8U+5U4+iSTA4kA7mg/nNEWQPKm5AXiNIB4RGn1pKJSQNbhblIV+wdrEx
	cvVOB5G41c0QELqadaWY4XvVw2n71G3I=
X-Gm-Gg: ASbGncuoNF7b1yR1gA6BC2ERq0pHslwzuXfDrbXobRwsRmOesuQ+dhRrtEzWsRps3wF
	QDL2hQSGlHJs2BzvQ+lSnqKrERtPROBWesBO9nkNyTxlBDW1O7i584SCSc81x2BXabl6YjCct2s
	P3Nzw37f+EYD3Ap9qSsM+7ktXvnZrsWRIYFwosqkiIOA4DRMeNei5+nwV3xJyyK55le9VnDuz4Z
	1Z+sDY0jvyrTb6thQbcmyfehqzk4sqqLFvJig91+gieVPAeVoNchfVxOSM=
X-Google-Smtp-Source: AGHT+IFjt6ENLv3OgjeY1ld5nYFGuXlQevcjQGJSv4QAuB6EROb4RDtvfEjBykX6USiKiG6f7/s9p1mYGBj6/RmxU1k=
X-Received: by 2002:a05:6402:1d53:b0:634:ab34:ed40 with SMTP id
 4fb4d7f45d1cf-63ed76dda03mr2637221a12.0.1761644097392; Tue, 28 Oct 2025
 02:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-3-linux.amoon@gmail.com> <cfaa4824-a59a-4106-b2c1-befce2af0324@rock-chips.com>
In-Reply-To: <cfaa4824-a59a-4106-b2c1-befce2af0324@rock-chips.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 28 Oct 2025 15:04:40 +0530
X-Gm-Features: AWmQ_bmnYVQ5MIlrxdaMUdyWQ-V-ciIMUJiy8e-9y11-5OlEwSkXW-sMhSd3m04
Message-ID: <CANAwSgRHhN5nZpKojKamTmZoY9qruwD0HJvEYFs_bqapoeRsoA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] PCI: dw-rockchip: Add runtime PM support to
 Rockchip PCIe driver
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_023459_422848_B1706689 
X-CRM114-Status: GOOD (  23.28  )
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

Hi Shawn,

Thanks for your review comments.

On Tue, 28 Oct 2025 at 06:14, Shawn Lin <shawn.lin@rock-chips.com> wrote:
>
> =E5=9C=A8 2025/10/27 =E6=98=9F=E6=9C=9F=E4=B8=80 22:55, Anand Moon =E5=86=
=99=E9=81=93:
> > Add runtime power management support to the Rockchip DesignWare PCIe
> > controller driver by enabling devm_pm_runtime() in the probe function.
> > These changes allow the PCIe controller to suspend and resume dynamical=
ly,
> > improving power efficiency on supported platforms.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 21 ++++++++++++++++++=
+
> >   1 file changed, 21 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pc=
i/controller/dwc/pcie-dw-rockchip.c
> > index b878ae8e2b3e..5026598d09f8 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -20,6 +20,7 @@
> >   #include <linux/of_irq.h>
> >   #include <linux/phy/phy.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/pm_runtime.h>
> >   #include <linux/regmap.h>
> >   #include <linux/reset.h>
> >
> > @@ -690,6 +691,20 @@ static int rockchip_pcie_probe(struct platform_dev=
ice *pdev)
> >       if (ret)
> >               goto deinit_phy;
> >
> > +     ret =3D pm_runtime_set_suspended(dev);
> > +     if (ret)
> > +             goto disable_pm_runtime;
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
> > +             goto disable_pm_runtime;
> > +
> >       switch (data->mode) {
> >       case DW_PCIE_RC_TYPE:
> >               ret =3D rockchip_pcie_configure_rc(pdev, rockchip);
> > @@ -709,7 +724,10 @@ static int rockchip_pcie_probe(struct platform_dev=
ice *pdev)
> >
> >       return 0;
> >
> > +disable_pm_runtime:
>
> We need to call reset_control_assert(rockchip->rst) before releasing the
> the pm refcount. The problem we faced on vendor kernel is there might be
> still on-going transaction from IP to the AXI which blocks genpd to be
> powered down.

Thanks, I will try to fix this in the next version.

Thanks
-Anand

