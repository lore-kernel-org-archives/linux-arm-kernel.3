Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D3CCAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gfSUBmjDQGS07XOuZOfB4dv6p+6TOkn4sFnsfwrItDc=; b=FXqCvxia0f9IAiH8ZgCWR2k0Fj
	UOmvaP8GGJdj4cWnxGDidtUL+c/gHej+aonPnT03ofXpS2RmheoQ6VBcPi1/bPIfYFEQ3SBmCgfrh
	ytKgvty05LjbjNYuToRUgUXJev2dOEdBhciXrNzw5GrioXlBB5lT5+2IeJYvM+/i8K9zPI9hrMAGC
	XTYtCfRE0+x0mnu1n7itIfcO+8nhWk3EpPVKxkr9mRNkorkOk41/i1O4pNbFvGOw5rJmtJdViyIhI
	qV9LuYCZ34PEW56/bjbb49VDRMi1Gj1yGI/mSlSrq8pR3AVjjzQO1IB81jj+amyq+roGMU88TgEX6
	8T0n2YbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pZo-0000000BSNc-4A6b;
	Thu, 25 Sep 2025 17:16:16 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1pZm-0000000BSM5-33e8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 17:16:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so2416135a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758820573; x=1759425373; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gfSUBmjDQGS07XOuZOfB4dv6p+6TOkn4sFnsfwrItDc=;
        b=v7ovsZIQ/IGkCfQXpNMNdXvBvjhBQg0RhO9+9ujF7N3FFebsBnfw91ZWkoTaW1PzCw
         6WafxkEeM1op1BeJZ1j0vRkW3PtUx9Ey9BfSBLEhmF+tVGtO+VTmVOJRA43auqOt7TSV
         W3o+Ls/3gvezeONHout1Y+lJiHJrq0h8LcpG1zK1wGGljv3CpkRsGOWyY5x/pJFvNfk/
         rGnbe7qTBz41drT1vEhjSyaTvQ/fXDm+EDORAD92Aby44Y7IyRa5HslhkCMwLG5JHene
         MqLW6TeOjyDUzoQlPFHv663KvpPAmBgy9XfRkiipDglzZqqi5MvlWPAs3QnGm/lIXjJV
         lrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758820573; x=1759425373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gfSUBmjDQGS07XOuZOfB4dv6p+6TOkn4sFnsfwrItDc=;
        b=lfzwQ2sa8JutmouKhnM8neJ8O/bIwxrrNqU+2sXjyEh545315oLKdzmHn7idL2RdBa
         8p3xj0ALW8YAgCCXWHL6msoSh4BakMY3JQD3VZs2IFEpLJNVO9MZVNlfzGyv6qjrzd+Y
         GoRzfR5LVOKIhhaTebYtk1Hn/Ry2oOVR5Z5Or/o0jt9KAvdoDsEpFhucfYYSuqM6YNau
         nMROJxtAUVN5DrnFNWnA+Dv48+36mdSHXSz0wnIF6bh2CcLCxxuIacafg0BJEIXNgblL
         Ud2AuHOh+ZootyxS+dE+rkkvK/jek8u1rn+NZa5NHm+HUghR9OrY4ccCV4pV21a97qPf
         Md9A==
X-Forwarded-Encrypted: i=1; AJvYcCXzWKEqlqvW8UXlufHwsV/ZqTMAZx9fBb98Y5RghiLpjej2ecxH9y5svjlQRK9o+dYFBMVOZtlOr0rPRXEj573m@lists.infradead.org
X-Gm-Message-State: AOJu0YzXjXt/rrzlU5lUWPXcK4w0NNlYLAUp4YSAuwzqfrDEU8YfKI6m
	G+frDStuP79E1WR9SBYNXXEKE0Agd2yLJ+4rd8B71X0NElcEb0zk+/yM3c7jReQBUFv/EIYf58e
	A/VrwwIpjYCjapbGFLsbEbnN9s3M/0zsQ7VxwnYzOZQ==
X-Gm-Gg: ASbGncvZ3yIJjAB+x5iyYUATohKxpZjgDlt6aj+Cw8v/oP71oKJf+DojkZWsXAe6HuK
	baVhS9RT4Z6CPFn0S/iD8YVfSEiwDT6PG/0xud/Wbp+WXc8/WSfYL38GfnMVgw4ptGYahnk39IQ
	mdDqI3JOMs/afNAm0iCtC6h66B/R0am0xwGW3+Q+G5v6dFHRbcUCklycsVzkZDa2+jBE7WWHRLc
	UGn7+WWp8IP8pPEIirz/M5sttRF+ZZefBIk
X-Google-Smtp-Source: AGHT+IGDhhdx+YuZcr8I4Tult1/nPYdF84/cpZUAmbh+gOazNWoxtTztWVZU1nAmJ8EOHh1jeTaA57QtgllGSnlOLdQ=
X-Received: by 2002:aa7:d441:0:b0:62f:68c3:57d0 with SMTP id
 4fb4d7f45d1cf-6349f9cbc18mr2542494a12.4.1758820572615; Thu, 25 Sep 2025
 10:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250919155821.95334-1-vincent.guittot@linaro.org>
 <20250919155821.95334-4-vincent.guittot@linaro.org> <aM2L0C4SsGTzLQwi@lizhi-Precision-Tower-5810>
In-Reply-To: <aM2L0C4SsGTzLQwi@lizhi-Precision-Tower-5810>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 25 Sep 2025 19:16:01 +0200
X-Gm-Features: AS18NWCvFPXEZU7r1XpqWeh25XNcMYT0B_gX-68ydY8oAsZKJCM-yUYMplLol9w
Message-ID: <CAKfTPtC4TS-PwMa7-BSV6qS=YjnFczwj42USqJ8=YX3X0cdTxA@mail.gmail.com>
Subject: Re: [PATCH 3/3 v2] MAINTAINERS: Add MAINTAINER for NXP S32G PCIe driver
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
X-CRM114-CacheID: sfid-20250925_101614_790865_0A6C309A 
X-CRM114-Status: GOOD (  16.69  )
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

On Fri, 19 Sept 2025 at 18:59, Frank Li <Frank.li@nxp.com> wrote:
>
> On Fri, Sep 19, 2025 at 05:58:21PM +0200, Vincent Guittot wrote:
> > Add the s32g PCIe driver under the ARM/NXP S32G ARCHITECTURE entry.
>
> I think common ARCH maintainer part should only include core port of SOC.
>
> PCI driver should be sperated entry.

I can make a dedicated entry for s32g PCI


>
> see PCI DRIVER FOR IMX6
>
> Frank
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  MAINTAINERS | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index cd7ff55b5d32..fa45862cb1ea 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -3084,12 +3084,16 @@ R:    Chester Lin <chester62515@gmail.com>
> >  R:   Matthias Brugger <mbrugger@suse.com>
> >  R:   Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> >  R:   NXP S32 Linux Team <s32@nxp.com>
> > +L:   imx@lists.linux.dev
> >  L:   linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> >  S:   Maintained
> > +F:   Documentation/devicetree/bindings/pci/nxp,s32-pcie.yaml
> >  F:   Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
> >  F:   arch/arm64/boot/dts/freescale/s32g*.dts*
> > +F:   drivers/pci/controller/dwc/pci-s32g*
> >  F:   drivers/pinctrl/nxp/
> >  F:   drivers/rtc/rtc-s32g.c
> > +F:   include/linux/pcie/nxp-s32g-pcie-phy-submode.h
> >
> >  ARM/NXP S32G/S32R DWMAC ETHERNET DRIVER
> >  M:   Jan Petrous <jan.petrous@oss.nxp.com>
> > --
> > 2.43.0
> >

