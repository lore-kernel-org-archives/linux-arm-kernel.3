Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E625E77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 16:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PnREJXO8gdOnlDXn6hPd7bSDzdru7IQfI4OFlA05/Zk=; b=PIyyiWAXUtm2Y5tv/UL4hGG7gZ
	8zbYE5pGGsu/YDMkrklWOnuuPhlZuf7fDbEjzTyJx1yyZGVOpRFWPmKQ0DmB2mOqVIcNiOoiM3CTv
	vFglxSZHy2zOTYEpFv1B2p3R5ApVs6tPvzQsjucCTVc0wLUBrsZPq0mCN62LixVR75Rpjau7Wifn6
	9d8VrFpk7UhREKUySMgF4FSrH4bKOZQt8Zzr8wMPb1eIlzAUYR9kLptCcU6Er9KSnKaWPA4rDn0HB
	gJD4pQIZBtvH7Av61logNE0sNuC5IP7EeE+ntvUmQcBZgQEULTHaQIhZTV+iJykdqWEjV8BA/jFb+
	5njli4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTcA-0000000H6b1-41qS;
	Sun, 05 Jan 2025 16:36:34 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUTay-0000000H6Sm-0AVQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jan 2025 16:35:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21649a7bcdcso187507385ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jan 2025 08:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736094918; x=1736699718; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PnREJXO8gdOnlDXn6hPd7bSDzdru7IQfI4OFlA05/Zk=;
        b=Ny45JJQ7eZ1xje5Gay/1cqlIPgOdyrB+7J7ceIe1Q/NYujQ2TCFCPqbnsAHGs1Ir19
         fNstl5mYbg74glVA+zclpVCxJwZo1I0C+db7Ns+UR7SSbPkK5PvodLQpmTD9ewpUadzF
         VNWY9PaFEM2pZtayJNFQS53Buxe16Y6VsNAac8m8Lio7ypM4O+uiLxJSTqUEA63joXIR
         vsNJ/VtIDYGVviq4TLUmP8lgPye4OIR63tzKQjiyR+hfNZMRr5AxWIInQCbSwVkqWUuN
         qP+1IFbW4DO1HPZi/VnmpKpeODvvXyQkhKC50AmYMlKIlWXgkdN8jIYnNVSjlQyRyxP3
         rrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736094918; x=1736699718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PnREJXO8gdOnlDXn6hPd7bSDzdru7IQfI4OFlA05/Zk=;
        b=EYFhYhegElSTz22D59bXMDjlrOXOyogvZCT4ABNzHRO1Dt+1K4mCMBqe6e2sGr89iL
         uLJXietn8CsBmVuOl0p7K7M5cFYGC9iFhTVpvWZfE/kQhnB+Hwnr09qRV4KIP1a891Vr
         uGevMS64Z2ZDo8iRnLwibRhvu+/Rk8jzl1ZcOSISK6Dx1BKNQXwDLtjwb0FN8mvAlXk6
         In6zUgzZikXKRHg0vFLCnSdM9+kBchRmzk55Qgd2uq9ffqtszBtzXP3ogceM3BRB94UJ
         7A7S4CPbu/kLR87NNwOrD/3FZnV15SSP5ghoPGJPd0WRR9qkzk5jJC2tn/GaEpges70m
         t6Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXM9IM9j8zCBdkIBgUw0PsRhGp77HPCAmzg3/WlJWf1QNHJFx8r8udMwP4U3FZTHrDboY9JD3WI/7eOSyTNPVR5@lists.infradead.org
X-Gm-Message-State: AOJu0YweO0wv6E6JSJomFKHLsBjQ6/V4mgPkFtf+qf70Y1pNXo3hql+z
	jSniwB4glSaI5pQT9/2UTXAmLGy4Irlub7iizN5HH5sUMVGG6ai1ZbQRUXNaLtJAPdzQe9WX4e4
	=
X-Gm-Gg: ASbGncuGU5f4qxWqzcV75CD90hAM5ThFSRTAXVy6Na9z6Fa/WL+jDQ49F+XUWsTEcGC
	cXBuYaxsMn8RJkWvcNHoPT5zgPs2AVmW+RmwnVJzzSROfWphA0bn3m2LD73EfA1idIqh180q0Fd
	3FwFqNwbgwGa1PpLc50K/TomKHLhBNJF3cSqjroeoNtnIXR5LosBvGQLaUlbXt7CEO3NWNaora4
	XNxIfGL3cZP/gRgWi5xi0jRi3odjLQe+tX+G6VQhSVWJ9yqHPNspz8NaNDBYmE5K51EAQ==
X-Google-Smtp-Source: AGHT+IEOtAp4w31CjTLB1aFWoVsatu6IG9r4c5kd2CVIdLrHft5tD4dMe9HJZQJaorB/J3Udvac1sQ==
X-Received: by 2002:a17:903:2cc:b0:216:2e5e:971d with SMTP id d9443c01a7336-219e70dc3f7mr692735935ad.51.1736094918605;
        Sun, 05 Jan 2025 08:35:18 -0800 (PST)
Received: from thinkpad ([117.193.213.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde72sm277254345ad.130.2025.01.05.08.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 08:35:18 -0800 (PST)
Date: Sun, 5 Jan 2025 22:05:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Niklas Cassel <cassel@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dw-rockchip: Enable async probe by default
Message-ID: <20250105163511.rwer5pl6tevw4zp2@thinkpad>
References: <20240809073610.2517-1-linux.amoon@gmail.com>
 <Z3fKkTSFFcU9gQLg@ryzen>
 <CANAwSgS5ZWGTP+A11r_qFSrjWZH_DqsM89MLiP+1VAxhz+e+2A@mail.gmail.com>
 <Z3fzad51PIxccDGX@ryzen>
 <CANAwSgQEunirUf3O3FJJAUsQu9mQYD_Y40uJ_zMYDZYVy5J=wQ@mail.gmail.com>
 <Z3f4JQZ6yYV1BJ-b@ryzen>
 <CANAwSgRTcHuDNLvPJAs7ZaV-NnepeOkHj_kVc5OAJtP03hd6pQ@mail.gmail.com>
 <Z3f95RXj7GhZZHEP@ryzen>
 <CANAwSgQEb7rWFaeEO3Mb8LAwK6A5mrCyQFEysmSpeVdhoRWrtw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANAwSgQEb7rWFaeEO3Mb8LAwK6A5mrCyQFEysmSpeVdhoRWrtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_083520_137368_FA30B0F6 
X-CRM114-Status: GOOD (  24.38  )
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

On Fri, Jan 03, 2025 at 08:59:51PM +0530, Anand Moon wrote:
> Hi Niklas
> 
> On Fri, 3 Jan 2025 at 20:40, Niklas Cassel <cassel@kernel.org> wrote:
> >
> > On Fri, Jan 03, 2025 at 08:36:18PM +0530, Anand Moon wrote:
> > > > >
> > > > > We need to enable the GMAC PHY and reset it using the proper GPIO pin
> > > > > (PCIE_PERST_L).
> > > > > Please refer to the schematic for more details.
> > > >
> > > > The PERST# GPIO is already asserted + deasserted from the PCIe Root Complex
> > > > (host) driver:
> > > > https://github.com/torvalds/linux/blob/v6.13-rc5/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L191-L206
> > > >
> > > > which will cause the endpoint device (a RTL8125 NIC in this case)
> > > > to be reset during bootup.
> > > >
> > > Thanks for letting me know. It seems like a workaround.
> > > I'll try to disable this and test it again.
> > >
> > > My point is that we haven't enabled the GMAC PHY (device nodes)
> > > and must properly reset the GMAC.
> > >
> > > We're relying on the code above hack to do that job.
> >
> > I do not think it is a hack.
> >
> > If you look in most PCIe controller drivers, they toggle PERST before
> > enumerating the bus:
> > $ git grep gpiod_set_value drivers/pci/controller/
> >
> 
> Ok, understood. However, we have multiple reset lines per controller,
> so the PCIe driver will reset these lines using gpiod_set_value.
> 
> PCIE30X4_PERSTn_M1_L
> PCIE30x1_0_PERSTn_M1_L
> PCIE_PERST_L

PERST# gpio is unique per controller instance and will be asserted/deasserted
by the PCIe controller driver itself. Endpoint drivers should not touch these.

And most of the PCIe endpoint devices do not need to be described in devicetree
as PCIe is a discoverable bus. But we do define some of them if they require any
special board configuration.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

