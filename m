Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABE3CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgLf2SVScm95+f02HH0OAwFjGNzD1ph15QV31vmZKhE=; b=K+2IVUrI9XYb0qreUM/4sA6YZl
	ly3lBSb4p71qoJska92N8pJbHIX8QWZCigGRaaGhFWGEUaR8zQhcWh35gQD1NQIPzcU1WQIi66wzx
	CkSjX+FgZLmqWwlx1u7aYhwczwWILAM51gBzHGdrZnDzFEFJJdT/ippakbxonBwsMGl8OoX/FeTOT
	ELaljUtOaCJA6WEPrKtglg8INWHh+Bvt6fvXmUHHf4cASd8VL7zN6qVkyrxXkYlUKvJk59bSHe/nT
	V9co1+qcBueQeIucqKEhtPjtyt/TjMh+tnq6tAPt0d9Rry9RVBzeB4XwI1bdWEsjpdv/s0uAvVLPA
	WSud6hcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQ8I-0000000EKHF-1lFk;
	Mon, 27 Oct 2025 16:31:46 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDQ8F-0000000EKGI-3cYr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:31:45 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-63c31c20b64so7854996a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761582702; x=1762187502; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IgLf2SVScm95+f02HH0OAwFjGNzD1ph15QV31vmZKhE=;
        b=iH3NF1prIWsS9TCd/t5xVTRs40Xh/WKJ7kVRgRJWnXINcKzQ667s3v/QByS1THlKX8
         6hizLhDfGJ0pcZULDZ+GqKglEFm/TivGmbWfD6t/7OxsxtsVOFtkx7OUiDb/HfXclzV9
         avBrq+R4yUPmJTq8gTBysJrz27thzlnsyuxFacEniU5XqZT9cEz6uWxhGVcJEcUAbdLM
         /m176s95/xFGKD9zqqok0YUzpsqU2pbudqUb3MpMIvhxB7xJNz7RR+zBRv4FwMXFp6ll
         kLfNNHW7J8E+tYcACzetCs4RJW1sswun+CK51cQ5yiK0q4SkDi34z0redwn94IQ8I39G
         M97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761582702; x=1762187502;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgLf2SVScm95+f02HH0OAwFjGNzD1ph15QV31vmZKhE=;
        b=pRxP9ca0ejLMuB7c7Patt51t9OcY5o4IRznyL1+a8nsLhOVaGNCMUQtvqFSxwrfiAk
         /XbBjS5xw/y/V84MuYnxLb1mdWy1qpU2rbemekw7aYRFuG7GvmOq11ZlpwsDveYbctF9
         ith/ophNJA9JLI+ZWstTanbwtZZLynM8gWHxULrJFCr/0kmVK1ObkS4MEFLybTXZH+IQ
         YDM74mBkkhw01JEH7MudqZqNbo1fYCRRgP9wzTZrbOcaX/YUyljU/zNEMxgJjHQkrvSE
         yuJ1ELG7a8UKU17vPEP3yH5uZX1238Fix0hkQQAB2tT0GLY0+uvUoKsy9Zat+tkj/Wx7
         F0/g==
X-Forwarded-Encrypted: i=1; AJvYcCURQB7Sz7h1fP7D4YHoUFAsfl3fWiYdP/TIJ6aMEMeRkrA0bDsbh/YO0R1Lpt5IIt4udzqbPmK9ZSANjeb0V6MK@lists.infradead.org
X-Gm-Message-State: AOJu0YygkkQ2ARxIltnGVqKtzbfczM5mz8Txvio8h00LB0dv7AG8AUra
	9K7VlaCk1wD05Wyh+uAzT111Gc+EeAKhIANXJKJNXnrQhnZpTcZJwPvmjAUualmwuH9jW74cqD2
	VqIZjwy0t5nC5meR05jtQPakv8mb5BAA=
X-Gm-Gg: ASbGncuBNPWWsZwIW8MPJ7YPWex4OnZ1WxzlLe+Sx8VSLn4qw+oo1XjWN5QlIdOO6N3
	kX7w3K90/j9WU3HdXdzfR1wIN7aNsoHpPWB//Zd6OqK4YnWBrL7bDyjBR+4BNOB1WX4JjGBW/bk
	RXmX0RDTGOKq7XLMOUFtHo89yKYu4pR6NhwVaua3klYiuUb5t4r6IJ4kWRCDrddvKMzW4JRVmPD
	jdZsNM/siC/7hZp+ieL1J9fbNDLM2rS/lBm6YxI9cD9llg61J683ezII4k=
X-Google-Smtp-Source: AGHT+IG/IzMgRJGe0oU595mEmHs6fWEe0QVZBG2v7Ej1G6fm9/HYSbgpPg786Jnq6SwSPlQ24dt/1V+XJmYkuCP5oq0=
X-Received: by 2002:a05:6402:280d:b0:63e:914e:5159 with SMTP id
 4fb4d7f45d1cf-63ed810957cmr526172a12.13.1761582701754; Mon, 27 Oct 2025
 09:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20251027145602.199154-1-linux.amoon@gmail.com>
 <20251027145602.199154-2-linux.amoon@gmail.com> <5235617.GXAFRqVoOG@workhorse>
In-Reply-To: <5235617.GXAFRqVoOG@workhorse>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 27 Oct 2025 22:01:23 +0530
X-Gm-Features: AWmQ_bmuEGyIyVMM2F7v93d4eNawEzucpBZ6agLVtw_PaD2oW-53hrPDNMYJwI8
Message-ID: <CANAwSgTmOvOZ35=3XjhrKu2iPCMOU8c8prK5XVAkf3cF1DHekQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] PCI: dw-rockchip: Add remove callback for resource cleanup
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_093143_981305_8994FF81 
X-CRM114-Status: GOOD (  24.32  )
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

Hi Nicolas,

Thanks for your review comments.

On Mon, 27 Oct 2025 at 20:42, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> On Monday, 27 October 2025 15:55:29 Central European Standard Time Anand Moon wrote:
> > Introduce a .remove() callback to the Rockchip DesignWare PCIe
> > controller driver to ensure proper resource deinitialization during
> > device removal. This includes disabling clocks and deinitializing the
> > PCIe PHY.
> >
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > index 87dd2dd188b4..b878ae8e2b3e 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -717,6 +717,16 @@ static int rockchip_pcie_probe(struct platform_device *pdev)
> >       return ret;
> >  }
> >
> > +static void rockchip_pcie_remove(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct rockchip_pcie *rockchip = dev_get_drvdata(dev);
> > +
> > +     /* Perform other cleanups as necessary */
> > +     clk_bulk_disable_unprepare(rockchip->clk_cnt, rockchip->clks);
> > +     rockchip_pcie_phy_deinit(rockchip);
>
> You may want to add a
>
>     if (rockchip->vpcie3v3)
>             regulator_disable(rockchip->vpcie3v3);
>
> here, since it's enabled in the probe function if it's found.
>
> Not doing so means the regulator core will produce a warning
> splat when devres removes it I'm fairly sure.
>
I've removed the dependency on vpcie3v3 in the following commit:
 c930b10f17c0 ("PCI: dw-rockchip: Simplify regulator setup with
devm_regulator_get_enable_optional()")
Please review this commit and confirm if everything looks good.

> Kind regards,
> Nicolas Frattaroli
>
Thanks
-Anand

