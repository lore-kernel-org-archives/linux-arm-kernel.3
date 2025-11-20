Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B109CF64BB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oiy3MCCnIY+ubzrtfzu9IxcBIzwVrHngBHadvGb6qFA=; b=MeFswRolv9vCLcQOdr0VnF6JSs
	0PN8Pegt1Hya7mTZMOogsgQBwBQim//HWYZHHzNzXCeyFR5M+gXhxNRqRt2HvNFdxDBMbNsw304nR
	LcewrKsgdvSOnhLfRqAuxwF/cbenwFjQ9xeh9vWPpOUBX/WLT5JNuB5P+G1BFh7p2Ilu9EfUDuPYe
	N3JzDapApSj7HmVW/5q5zMxX3dgYxHBVAqaPEm76jXGThZrfvazOyTe+WjVby6Q2NIaR0bK229cXL
	5cXsWW8SQ2lmvH4txZIKCjZcn4ubfx9xtLqhSrK83vqiND+NvyZhlADLeFuH54hTt6eTjkyg39ZRd
	+czC6sOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLz37-00000006IKs-18SZ;
	Thu, 20 Nov 2025 07:25:49 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLz34-00000006IJg-0AoO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 07:25:47 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so912156a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 23:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763623541; x=1764228341; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oiy3MCCnIY+ubzrtfzu9IxcBIzwVrHngBHadvGb6qFA=;
        b=WgiGxWSPITjkaYJrCOTbe9MU1w5B292oMRjZC1w8VjhCf4mwfuGzL++YE9c+a82zhZ
         Avc9fllqfCQ+M/wx1DyyzvwiMhHRIpbF6WIacJobSWwu4m2SauFsQnkYPt3mlMTAaLZN
         X2M2/LeoG5M8bLzOomMPQby0WcK5lFr9dVmsrQ3Wz33waGz9uRw3Eg1ABaLoiKVf8KOW
         UEebbXvPVE/FWWM/Fy3L0A1yFFBB9l7vXqMHawRra8LjzrFiGyUuEugXoM/WhOg1BlF4
         jXafUUKO2ZYLGqWKUsoyrhQMTmE+yLcbB/HugJORvVIrghqGGIc4uIDyndMPksWnsyBq
         tZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763623541; x=1764228341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiy3MCCnIY+ubzrtfzu9IxcBIzwVrHngBHadvGb6qFA=;
        b=YFkceOqhRObIrHz+RrP95FJbUjDC4TXczFEykA3dwIp7l0anpnl3DjmlrhSRV+67Ii
         MrB2NE2bLwqPFuk1OnAc0v4+m5jxLsOB88/1eI/Uw5yMQcTeyhVN1NLoNH53qQWQ7DGs
         HVrDAeevp0EpwwmeQcGNNWxBCQTZ0ZE5nj4Emdgg9/bttYi/XdmoYnxBxufprk1Dpi3B
         C7u8vJeG9PBJbf4VZmKcAcflylDagcUtRIvfmAzjYkSjJnIZzAGJ0sxruJTa9NXgUK4J
         301tnLgB3jD9OjULoEzMOSk4poXFXvVvg7QycH5yuj692y9HSPWRIDnoneQHqd8UEaFX
         pcBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqxmur3WeQtw3t6ez8Bcl8x0pNh4QwgxAAOqN1c11X9hCFQFFgLmZRm6XKS314z6jK7QP+2NAOaM10IoGxfjXp@lists.infradead.org
X-Gm-Message-State: AOJu0Yyuhu9561JL1zOjhSgm7eaXud44HDwz1BF0p37y/El4H5HUpkT8
	ZkYuBIyIQH1QdOI3OXNaoE+/DxYWD6ua9St4Jfmy6PVmcDWz63veyAmo9aJ5yf1/p3GpgCnoX0g
	DS5QcSIT5buFfzM5Fj15O+IFI2B97ZOU5XekyK8Atkw==
X-Gm-Gg: ASbGncsCdkVw5GIcax3PR4AVJ+JpOuye2Ikl++fvk+86ICpyiJdL4P9rqzObRqkIWSy
	S6TvCRBXMK2sUQx9uOVOQEFKnZTRPALtvKN0NLxGDae5MEaZHGHbk5r6ahWcxaQn1QbAHrKlusR
	c9JrSeS/N57OnsGDru8Gan9wFYfjQ3mivS0fxzx6jEJFjQ+qc6JOa9AdHrrHGQuAjxb4Id3fCQh
	BK1UioeUaTWoK7ipuy5e8Zr4NFJKbzprbeJacekmv0dZsbBevhTQ2UQHSnJNcZyyvM9NLoc4T6C
	AKKJJLJIQpfKsd//k7eodKyR
X-Google-Smtp-Source: AGHT+IFAQcf4dBYNDEi3TsDPhv8jstrKlO8aZK1F8IULbrCW1q+UfabVpHtWcfiu1HcoO4gSrjXgCyaW6ykmeZfOoLs=
X-Received: by 2002:a05:6402:278d:b0:641:62bb:9c0 with SMTP id
 4fb4d7f45d1cf-645364652a8mr2343347a12.33.1763623541321; Wed, 19 Nov 2025
 23:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20251118160238.26265-1-vincent.guittot@linaro.org>
 <20251118160238.26265-4-vincent.guittot@linaro.org> <aRymVtJKtcydh3g5@lizhi-Precision-Tower-5810>
In-Reply-To: <aRymVtJKtcydh3g5@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 20 Nov 2025 08:25:30 +0100
X-Gm-Features: AWmQ_bms-sMetVoc9nOrTa8Xt52hfzy9ouUOYIu45ml1BzNFdlb7_KVvCi0dBPc
Message-ID: <CAKfTPtAhQJK1ezv3JF6FBK5ZBBWCWM0ADeg0SG2EG_2JjfzaMA@mail.gmail.com>
Subject: Re: [PATCH 3/4 v5] PCI: s32g: Add initial PCIe support (RC)
To: Frank Li <Frank.li@nxp.com>
Cc: chester62515@gmail.com, mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, 
	s32@nxp.com, bhelgaas@google.com, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, Ionut.Vicovan@nxp.com, larisa.grigore@nxp.com, 
	Ghennadi.Procopciuc@nxp.com, ciprianmarian.costea@nxp.com, 
	bogdan.hamciuc@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, cassel@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_232546_694354_1612BFE1 
X-CRM114-Status: GOOD (  19.42  )
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

On Tue, 18 Nov 2025 at 18:01, Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Nov 18, 2025 at 05:02:37PM +0100, Vincent Guittot wrote:
> > Add initial support of the PCIe controller for S32G Soc family. Only
> > host mode is supported.
> >
> > Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> > Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
> > Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> > Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/Kconfig            |  10 +
> >  drivers/pci/controller/dwc/Makefile           |   1 +
> >  .../pci/controller/dwc/pcie-nxp-s32g-regs.h   |  21 +
> >  drivers/pci/controller/dwc/pcie-nxp-s32g.c    | 391 ++++++++++++++++++
> >  4 files changed, 423 insertions(+)
> >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g-regs.h
> >  create mode 100644 drivers/pci/controller/dwc/pcie-nxp-s32g.c
> >
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index 349d4657393c..e276956c3fca 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -256,6 +256,16 @@ config PCIE_TEGRA194_EP
> >         in order to enable device-specific features PCIE_TEGRA194_EP must be
> >         selected. This uses the DesignWare core.
> >
> ...
> > +
> > +static int s32g_pcie_init(struct device *dev, struct s32g_pcie *s32g_pp)
> > +{
> > +     int ret;
> > +
> > +     s32g_pcie_disable_ltssm(s32g_pp);
> > +
> > +     ret = s32g_init_pcie_phy(s32g_pp);
> > +     if (ret)
> > +             return ret;
>
> Small nit:
>
> return s32g_init_pcie_phy(s32g_pp);

Yes

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Thanks

> > +
> > +     return 0;
> > +}
> > +
> > +static void s32g_pcie_deinit(struct s32g_pcie *s32g_pp)
> > +{
> > +     s32g_pcie_disable_ltssm(s32g_pp);
> > +
> > +     s32g_deinit_pcie_phy(s32g_pp);
> > +}
> > +
> ...
> > +
> > +module_platform_driver(s32g_pcie_driver);
> > +
> > +MODULE_AUTHOR("Ionut Vicovan <Ionut.Vicovan@nxp.com>");
> > +MODULE_DESCRIPTION("NXP S32G PCIe Host controller driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.43.0
> >

