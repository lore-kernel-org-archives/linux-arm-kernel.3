Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EB3CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3uhf87DrC/GqYd1AzAwWRkEB5wkIeXkNvqHSQcwwy4Q=; b=vieTuCwRNPnGar+SS0eFf7Upmh
	JTJLtzn0PR5X0mlObFIZO8tEe7v2udvaZTChNLao2bXtSn6MCrSberrdlxIkkNg45nFnA5gSOazxD
	sHU9xVQNVYoo5nj6Pp4QKIFjweUI1AqwNG3PxHB9m0oHiHlTMC5ADtwgL6biiu8/rAFgY+qOdBv7A
	W1xtS6DCWnognY/2CElpLwvxG4Ltop2ENZhkb62NcEatcdx3+ACBREw7forwY4wJ2uWX1RiZWQp0q
	7h29/4LPYYjRVGvHP5Rq+P2cRs9YjHBYGJ4k7V+gnEBK6pM7yAQeaj1JywoHXp3GAZobwChEZDq3v
	uXHHaDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBLf-0000000GwYv-0yEl;
	Thu, 18 Sep 2025 09:54:43 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBLc-0000000GwY8-2Lia
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:54:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso1370194a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758189279; x=1758794079; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3uhf87DrC/GqYd1AzAwWRkEB5wkIeXkNvqHSQcwwy4Q=;
        b=Q0ZTxK0CYaLnquM12JfMomoe0UCHGYzsivVkDrCotryj66Tv2mBLyuSE+io4ZrSlaY
         zs9fyLtuTHsZXWO2CntzWkhtXPka3iJXzUGxI3W5SiSQsmu3UF7Yta8ZMX3kc82qWeJk
         2Tc3cX5fxDLh8DcNzHQd3/eg6u//Yg8RDVF85NhJeyQ2+Yy4FDbkOYzRHdIajG0b3JfC
         1cSpA2AhfT8U92JGjyU2ZKiGAuQcGA0N0WqTnVTCBQqRVGfoj8OwtgXxfIfSssPlYNhB
         5+2C5+FQeVrQCllS3xx0mqpNYhyI3nuQBhEVMqqC+7DckZCxPIoHNCadIiAcVrC4qXu0
         YHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189279; x=1758794079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uhf87DrC/GqYd1AzAwWRkEB5wkIeXkNvqHSQcwwy4Q=;
        b=vRXXg1yuS8AW9iPMvyfCt2VrI+b2WWBgz/t3U9r11DhUX3VMX/3Sip8F75WoJyLUye
         5IZOkh05q8HEh8oKk/kAKrPJ81yQxiF7R10UfrwG+fohZQFISuGiw4dxgjErj48TC3OC
         E6f65RUhOqxtBvsy/r882sO5fWxBtN0XSqAKl09fxygzzvTZNQeVEWlKR8vAaDIfIGTY
         ++HrbRrvCU3Tn7QNMgeee93O9TlvzWtoQNrD7NN76wt+MZKtxOAb0I97yJ+C55I5Ab2s
         dt7CdMmyla7VFtYiA0WVkJV2uIE1PJIrdzclM2nUY1yUkPv49HdF5gq7kxr9BtVDoX9N
         hB4g==
X-Forwarded-Encrypted: i=1; AJvYcCUIL4hIcoYSlXs30AFj5gSvQfK07dtQJXL8lLC+UX+Gkx5zJp+/LFaBSLQYGZ6J+g2kGbIn3AMIhiE38NI+YYle@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6YwoJfok6DV+7g0UluiZ6jV83ytsh1YBhzqS7CMy0xa05eUSl
	okFj6kLDOpwd+DpWIEVuqc0kGqq2AovVSspOPiDo2GQ8c2LKD/YKcMgTGlq/olvmTzbqq9/5NXa
	YbgI4OCcyTWUdmIrHADAJ046NOiKlf7sA1RZDiPpxNw==
X-Gm-Gg: ASbGncvhmPK33PwnpnzWoPjvhIEl1ildNWW5FNE11qgFRaIe77nkb5duJ1NghIu4JAf
	TVhMghLIIuDw+RpyhZ6sljxLcRpUZhSfC5K5Qu3mrQI/o+uMmEiMcbVRr63NYpr8SRtvFHAI4QO
	L9G/P9CF1IoHleOkeY3p9kprg/LC1vNPJxFKxOOZkTgileP43FCLusKfbFkePRbWkk44L+mSKSn
	kEVvlkQ5MT9ynr/3TSLKhYCDk//A7SqN4GWJrU2tL6egLoWMsmm
X-Google-Smtp-Source: AGHT+IE1zmv9oHlYf6BUBNOW+SUyz6ajjYN0b3+2pAlc66/NC3KjbbHlv5KbLza2QpbO9MoNOwx3daqo5CZgA0JV3IY=
X-Received: by 2002:a05:6402:2115:b0:62f:7968:e1ca with SMTP id
 4fb4d7f45d1cf-62f84798527mr4551388a12.38.1758189278612; Thu, 18 Sep 2025
 02:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <e236uncj7qradf34elkmd2c4wjogc6pfkobuu7muyoyb2hrrai@tta36jq5fzsr> <20250917212833.GA1873293@bhelgaas>
In-Reply-To: <20250917212833.GA1873293@bhelgaas>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 18 Sep 2025 11:54:26 +0200
X-Gm-Features: AS18NWDHkrQ8kASDtWOuxujVdqn0GrRUTOJ77F2So0WyDmX2EIKvc-v29xTUv-g
Message-ID: <CAKfTPtCizQ7nk3P4Dzi6uFewH5GcAnMakMt5=bK-Ykayp3t7XQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: pcie: Add the NXP PCIe controller
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, chester62515@gmail.com, 
	mbrugger@suse.com, ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Ionut.Vicovan@nxp.com, 
	larisa.grigore@nxp.com, Ghennadi.Procopciuc@nxp.com, 
	ciprianmarian.costea@nxp.com, bogdan.hamciuc@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_025440_618269_8CCD964C 
X-CRM114-Status: GOOD (  30.75  )
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

On Wed, 17 Sept 2025 at 23:28, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, Sep 17, 2025 at 10:41:08PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Sep 16, 2025 at 09:23:13AM GMT, Bjorn Helgaas wrote:
> > > On Tue, Sep 16, 2025 at 10:10:31AM +0200, Vincent Guittot wrote:
> > > > On Sun, 14 Sept 2025 at 14:35, Vincent Guittot
> > > > <vincent.guittot@linaro.org> wrote:
> > > > > On Sat, 13 Sept 2025 at 00:50, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > > > > On Fri, Sep 12, 2025 at 04:14:33PM +0200, Vincent Guittot wrote:
> > > > > > > Describe the PCIe controller available on the S32G platforms.
> > >
> > > > > > > +                  num-lanes = <2>;
> > > > > > > +                  phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
> > > > > >
> > > > > > num-lanes and phys are properties of a Root Port, not the host bridge.
> > > > > > Please put them in a separate stanza.  See this for details and
> > > > > > examples:
> > > > > >
> > > > > >   https://lore.kernel.org/linux-pci/20250625221653.GA1590146@bhelgaas/
> > > > >
> > > > > Ok, I'm going to have a look
> > > >
> > > > This driver relies on dw_pcie_host_init() to get common resources like
> > > > num-lane which doesn't look at childs to get num-lane.
> > > >
> > > > I have to keep num-lane in the pcie node. Having this in mind should I
> > > > keep phys as well as they are both linked ?
>
> > > Huh, that sounds like an issue in the DWC core.  Jingoo, Mani?
> > >
> > > dw_pcie_host_init() includes several things that assume a single Root
> > > Port: num_lanes, of_pci_get_equalization_presets(),
> > > dw_pcie_start_link() are all per-Root Port things.
> >
> > Yeah, it is a gap right now. We only recently started moving the DWC
> > platforms to per Root Port binding (like Qcom).
>
> Do you need num-lanes in the devicetree?
> dw_pcie_link_get_max_link_width() will read it from PCI_EXP_LNKCAP, so
> if that works maybe you can omit it from the binding?

num-lane is not mandatory but we can have 1 or 2 lanes so should be
able to restrict to only 1 lane for some platform
the "num-lanes = <2>;" in the example is wrong as we don't need it in
case of 2 lanes but only if we want to restrict to 1 lane

>
> If you do need num-lanes in the binding, maybe you could make a Root
> Port parser similar to mvebu_pcie_parse_port() or
> qcom_pcie_parse_port() that would get num-lanes, the PHY, and
> nxp,phy-mode from a Root Port node?
>
> Then all this would be in one place, and if you set ->num_lanes there
> it looks like the DWC core wouldn't do anything with it.

