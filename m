Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F67CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7yndU7EdmsewRkYVTUdUNuXw/bKzL3LuIcL9+JimBI=; b=kngbwfcq2TMYb3nDYTMrqivzl6
	FTnV02Hg2JhL01aYlgSoEYy2T0dhYJI8EPromBGk0eDcXJ1U0MGUlqOhxofX+Pk7HjSsyXwK/HI6Q
	F+lWAWBhKOM8QJj7o/7APi0ahCp/A31irhcBzI60kp9SuvR/BnFTdhqEZ3rbyuvx7gmcp42d+mUSR
	XD+q8InbzxLq43OMJwG9w11BRAMa2MEAjz0ogitTIpMf7PiRFpybN3KUaaSbL2AIYpKUOwaoXxCYp
	jElyFjpz1h7So79kGqtQbxkPKBZsFPwTEDukvVIJ1pTwujsFb02Tsyu09lZQYXQjFHLMDVkqz848p
	0+psEycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29H6-00000001u8D-0wJY;
	Fri, 26 Sep 2025 14:18:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v29H4-00000001u6B-3EJP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 14:18:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF8AA452B1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 14:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD15DC19421
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 14:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758896293;
	bh=ovRK5c7wZT8POELugcGy2OQZLq61t1b/lN/zUBC5q+I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q1uB84gYsGTyrhgMURnnoz/CFNt2sCxD4dWKUs3bJOVFnrYZ3TaIx9Rkn3j/Mg2M1
	 H50v2Na3Xzu2hEnVjEvrkf/ffT3I11EsoXUIS7MT+GufDf4my3ukfT4pbWN+oLZdwC
	 8P3YSgRwGDR9cjhLdY49zuVBoNQw4GgEwo5VI7uJ87stnyf2Feyfg/1vV0EEF000AD
	 efxUpkEIC2xgVKffpnlbAgD+8L8M78MLG7pOScwL3BrewpwZekvWWzp4lTIWo3Nvkd
	 1Irkaoim6AThnLjYOAgLN9OQ+bhDyTT3936Wudh3I6Fv/YsVXDoM56SqaAwdceJf7n
	 hfBL4Bdf/esEg==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-62fa0653cd1so3326834a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 07:18:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXlMzKlJq/cpRVcf0bFD4BjI1oW5/7vcgj0Kc5AhN5sX934gx1j6YBVy8Z7eRAPcUB+InMC8wQIdwMXNIUNKgas@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3cqNnzSXcQxdRlHTPYCc5sQfKhcOAM3WXRNxisp1DhSr7dzrD
	jBeLbJTL4Iau5OflXB4Je+lUkH6xWjWYyYEzVEKvBe60F8AWBv2YGkfTiD1ziuI/vLoRrEml9l9
	vOqE02/LiV/DPwStRg0pgocyzl8YQCw==
X-Google-Smtp-Source: AGHT+IE5CRm41wAWa2CrClw2VSy83ReWu352foMXpDkXsta+N2WvoCGKuTDsi9qX3wkbts1/ms47yyeQSn9EBlyrs5E=
X-Received: by 2002:aa7:da45:0:b0:62f:97ab:6062 with SMTP id
 4fb4d7f45d1cf-6349fa942c5mr5046024a12.32.1758896292321; Fri, 26 Sep 2025
 07:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAL_JsqJMibSgsEFeUvHswVy6zsHMn7ZXkpbhch06oQxPY9NocQ@mail.gmail.com>
 <20250925191520.GA2175949@bhelgaas>
In-Reply-To: <20250925191520.GA2175949@bhelgaas>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Sep 2025 09:18:00 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq++S5C+9xFsXBJyaRfS5uO_2c+VtCMKJfRg2_ERHyRAgQ@mail.gmail.com>
X-Gm-Features: AS18NWAk7P-VFFKYhli2Rr8XOPLqBnC-mvDYbm-Fwop3vyyqN_Q7TWJokqE9yg8
Message-ID: <CAL_Jsq++S5C+9xFsXBJyaRfS5uO_2c+VtCMKJfRg2_ERHyRAgQ@mail.gmail.com>
Subject: Re: [PATCH 2/3 v2] PCI: s32g: Add initial PCIe support (RC)
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>, chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, bhelgaas@google.com, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, Frank.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_071814_844801_CF378ADC 
X-CRM114-Status: GOOD (  18.78  )
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

On Thu, Sep 25, 2025 at 2:15=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Mon, Sep 22, 2025 at 09:52:21AM -0500, Rob Herring wrote:
> > On Fri, Sep 19, 2025 at 10:58=E2=80=AFAM Vincent Guittot
> > > Add initial support of the PCIe controller for S32G Soc family. Only
> > > host mode is supported.
>
> > > +++ b/drivers/pci/controller/dwc/Kconfig
> > > @@ -255,6 +255,17 @@ config PCIE_TEGRA194_EP
> > >           in order to enable device-specific features PCIE_TEGRA194_E=
P must be
> > >           selected. This uses the DesignWare core.
> > >
> > > +config PCIE_S32G
> > > +       bool "NXP S32G PCIe controller (host mode)"
> > > +       depends on ARCH_S32 || (OF && COMPILE_TEST)
> >
> > Why the OF dependency? All the DT API should be available with !CONFIG_=
OF.
>
> We have lots of similar OF dependencies.  Do we really want it to be
> possible to build a non-working driver in the !COMPILE_TEST case?

We do. IMO, they should all be removed. The only real purpose it
serves is hiding drivers on non-OF architectures. But the whole point
of COMPILE_TEST is to *not* hide things. (CONFIG_IOMEM dependencies
are similar and really only hide drivers on UML.)

>
> Maybe we should retain the OF dependency but only for !COMPILE_TEST,
> like this:
>
>   config PCIE_S32G
>          depends on (ARCH_S32 && OF) || COMPILE_TEST

That's completely redundant because ARCH_S32 is only enabled on ARM
which selects OF.

Rob

