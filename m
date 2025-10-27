Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F317CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tID2O9rtuhA1HdKtwWUF8mN/hhDrcp/NLBhknx3DjcA=; b=ia52/4wHX3bOpm7gIaB+5BPjHu
	cTOlaWTmAyM+QD94YTV7Qsi+Lf18ON7pfAZ/0mlwAzbGSpxZd5vAA3fom0TDIWhgv3B4nrnFdVFkV
	xjUPaiwGkoJZwRW0YmD5NN3BPftnDijjtC/IhxbqhYTHb6oEFpDY1+mjwyHWShvt5fi/mKS8zFAjU
	hWujsH92OSlfmc01VFG9FSHz2ec7yEnhSmAQcOKmT5VbnkmS5TtEEsEcexgVMjh5iav/BK+WnURi3
	Pkk671rEhGUkbCBYgBmQb1pJIhQheGyZ6yVvi+pAc+zfqPZtub1KGz/0q3664+Iz/F/I4pWwgI1zQ
	XraBpH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGvr-0000000DD4j-2eDa;
	Mon, 27 Oct 2025 06:42:19 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDGvp-0000000DD3s-2WIk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 06:42:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso9299716a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 23:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761547335; x=1762152135; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tID2O9rtuhA1HdKtwWUF8mN/hhDrcp/NLBhknx3DjcA=;
        b=fXX2KoMVxBvONaj7VlRiLSXiX0sEwgZR7SgeHnw/m6G+6vy/OiB/HUf+XwsOfnc6eu
         HYNmihMOfESC/dIDxkrdCaQiCdRbDXZ7n5DXW1ec9LVPTjO4E9ZiQ0qpx+I/qI42uUqY
         G62ah8cEyvSnBDeQ7ZmYw8eRqcc/xQzqPXIEjQjki9ApLHhOUymmdinpl5KjsbDXiLyq
         a0++SjE/uiH3gTeQ4e8QU6RQ+2ccC0mQBu7/Sncm5Yf//UfMcTexZje631tUf7N0Udfo
         YBCwk9Q8ppQj+FWUs0QJazsiD0SLtrcRjT588qtFMnDgXxwLuTGN9iBqbJGrwQIJQmQK
         5GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761547335; x=1762152135;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tID2O9rtuhA1HdKtwWUF8mN/hhDrcp/NLBhknx3DjcA=;
        b=UHBiV0F6l4sxZdn3p/NOlPfI/GrkKQzov8utZ6AJQs6eBTfFlleOzPgbPBl22lM3ml
         3q6/VYgz/S7QoUz3Ln/mkPS9wjZlWXe/9pT2jU4Hc1WIGMu/UGmOChbfl2lSX3U/mdOe
         2uuY8c0ccCDtCjGVff0YV+pqXgKyg6liqoAvIlPn7VMAJoQunsktdO0JPD3kYAct1SoS
         ma4VExAR7DwqpO//dwVFY2o+r//zWvq00rjtBUcqd+E9RZzfN+QZ39sltuRibEoDjzo/
         coP6vPI0knNv11Z5GVJOHtNnfr0/oeYXrgwPK943tMqinq/b2jo7S4C3pjm6+5vxowcv
         WrNw==
X-Forwarded-Encrypted: i=1; AJvYcCUvLfJiteHsbfGc4TaQVAyZSk3l1WNBaPTB+a8qNwVCPMjFOR9FRk0a4P4XtRiShGBgk2mB00tvKgxi8w99yftF@lists.infradead.org
X-Gm-Message-State: AOJu0YwcK2YaujrXqNiLfNYseWl2is7s+HLiDddPAqXgtS+axp+v0ygu
	OWW332B7oMkbhDc7fN7a37Kh6ya+MTwB91brm+9psfQihS/9TNGU+a0L0QVYL9jKAiOHjpd0xrN
	xXVP7gIf56hRfJH9HTa6uJPqt7AEzTMM=
X-Gm-Gg: ASbGncuVazS7GJu9qi+SsJwzhTeuRvPOMA/A10jkOHcLsY98ajo5WcpKXNxmloupE4W
	mRvsgFaZr/rTECKHn2iS/GKhzhX9f3kyk8/3RZA8wv7F5kHDDuXY1gAcUFDlm0B30zUKvQomOi/
	JUK0YzDW0Zb9XU/ttjjCBYNC3aS83hXZ65C67ZpZ5+38Awix5+hyCLkaVM3HLjS5QPvmwxdiuKO
	t3WtVw+P5XEQwJYAyL3Snm3fqckZ8PeozA45RxFa4DOiPgwrhSYWqSz3Bw=
X-Google-Smtp-Source: AGHT+IFYyZXaxe+78PDzeedHWs3RAFG6tJ/BOlzbjZKOPUVztXY1AhNbupmOsYKoQaqvdewKBvyACvqak2464exO6W0=
X-Received: by 2002:a05:6402:40c8:b0:63e:1354:d9ab with SMTP id
 4fb4d7f45d1cf-63e3dff6f32mr13460304a12.8.1761547334887; Sun, 26 Oct 2025
 23:42:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251025074336.26743-1-linux.amoon@gmail.com> <20251025074336.26743-2-linux.amoon@gmail.com>
 <e6f4f3c93cfc2f18c36da10d3f86c1a50ab2bbf5.camel@ti.com> <CANAwSgQ2PH1TJLEBVPFJ-RdaNFxn=eTzRYfEmbjx=EYq_YOeQw@mail.gmail.com>
 <bef3d7015012c4004d21cd829892ca942496a6dd.camel@ti.com>
In-Reply-To: <bef3d7015012c4004d21cd829892ca942496a6dd.camel@ti.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 27 Oct 2025 12:11:57 +0530
X-Gm-Features: AWmQ_blmB6e4uKlIUktX-y8N5PH8rT71hGdHJ3kVMKE8HEWamdNJJ_ocuOBGSVs
Message-ID: <CANAwSgSTncwug+nUpm1pc2H8L0Abvumh8x09AW5p0nr8ufz-Yw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] PCI: j721e: Use devm_clk_get_optional_enabled() to
 get the clock
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>, 
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>, 
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Markus Elfring <Markus.Elfring@web.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_234217_661130_390A53FA 
X-CRM114-Status: GOOD (  31.76  )
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

Hi Siddharth,

On Mon, 27 Oct 2025 at 10:42, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
>
> On Sat, 2025-10-25 at 14:07 +0530, Anand Moon wrote:
> > Hi Siddharth,
> >
> > Thanks for your review comments,
> >
> > On Sat, 25 Oct 2025 at 13:20, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> > >
> > > On Sat, 2025-10-25 at 13:13 +0530, Anand Moon wrote:
> > > > Use devm_clk_get_optional_enabled() helper instead of calling
> > > > devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> > > > the clk_prepare_enable() and clk_disable_unprepare() with proper error
> > > > handling and makes the code more compact.
> > > > The result of devm_clk_get_optional_enabled() is now assigned directly
> > > > to pcie->refclk. This removes a superfluous local clk variable,
> > > > improving code readability and compactness. The functionality
> > > > remains unchanged, but the code is now more streamlined.
> > > >
> > > > Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > > ---
> > > > v2: Rephase the commit message and use proper error pointer
> > > >     PTR_ERR(pcie->refclk) to return error.
> > > > v1: Drop explicit clk_disable_unprepare as it handled by
> > > >     devm_clk_get_optional_enabled, Since devm_clk_get_optional_enabled
> > > >     internally manages clk_prepare_enable and clk_disable_unprepare
> > > >     as part of its lifecycle, the explicit call to clk_disable_unprepare
> > > >     is redundant and can be safely removed.
> > > > ---
> > > >  drivers/pci/controller/cadence/pci-j721e.c | 21 +++++----------------
> > > >  1 file changed, 5 insertions(+), 16 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> > > > index 5bc5ab20aa6d..b678f7d48206 100644
> > > > --- a/drivers/pci/controller/cadence/pci-j721e.c
> > > > +++ b/drivers/pci/controller/cadence/pci-j721e.c
> > >
> > > [TRIMMED]
> > >
> > > > @@ -692,7 +682,6 @@ static int j721e_pcie_suspend_noirq(struct device *dev)
> > > >
> > > >       if (pcie->mode == PCI_MODE_RC) {
> > > >               gpiod_set_value_cansleep(pcie->reset_gpio, 0);
> > > > -             clk_disable_unprepare(pcie->refclk);
> > >
> > > j721e_pcie_resume_noirq() contains clk_enable_prepare().
> > Ok I will drop the clk_prepare_enable and clk_disable_unprepare in
> > this function?
>
> The clock needs to be disabled on Suspend and enabled on Resume.
>
> The reasoning behind replacing:
> devm_clk_get_optional()  + clk_prepare_enable()
> with:
> devm_clk_get_optional_enabled()
> is clear to me, but the removal of the 'clk_disable_unprepare()' on the
> Suspend path isn't.
>
> Removing 'clk_disable_unprepare()' in the driver's remove path makes sense
> because the
> devm() API will automatically disable and unprepare the clock when the
> device is "unbound".
> However, to the best of my understanding, the device is not "unbound"
> during Suspend.
Thanks for clarifying my doubt. That part makes sense.
> Can you clarify why 'clk_disable_unprepare()' should be removed in
> j721e_pcie_suspend_noirq()?
It happened by mistake.
> Regards,
> Siddharth.
Thanks
-Anand

