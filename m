Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4777CCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 10:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtLoHp0kEwq/bLHJArViyfu5fWlEi0xAxEhFmz0T09k=; b=GO26axCXUqH4kIU3INLcnGvEvb
	re4bNPpZvkhVAIhWoAe6rXIBlgt4VlnZ6vEp8C5X0kY3SyJqjBcbX9cXnPUJO7yD2y1cagiQN2pFZ
	exf6B/TrKTK7PuD9RZOMtZFiP8+Z6yCtmrF8EbYaDnyJQZg8703rLU4trKzUjb1KrudJhf3q4vkxN
	Pgw5pGImf8R3LuwyINSDEyl8hpi3/Rc6v0ILW5ZkNYp8k/ko+uXByKtihHmcMyr6A+70sKXvkxI0B
	iLZQLNysuVGOkITa4lAMnsRWbfEtBGxe6Ko4qTmWZ0BzsOrTW4aRVRU2lsJHYQGbFko4cvqVsVJr7
	G5JwGiHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF99f-00000007H02-0Vhq;
	Sat, 01 Nov 2025 10:48:19 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF99c-00000007GzG-0sEO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Nov 2025 10:48:17 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so162874a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Nov 2025 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761994092; x=1762598892; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gtLoHp0kEwq/bLHJArViyfu5fWlEi0xAxEhFmz0T09k=;
        b=IpbNylaUj/3ap/nO0M1LTzjtkS1acydsD8qyt1w3d7R/6HXxrEUgDYoUhKLXHaYWXV
         JUCLJCCWJX8CZJ9rcXZI/D+wuLyysewWObUo7XgQ5LuUzgOuNfpp/RSKm3dWd0T5eUHz
         J5G/rFwq4XE1XWypxFMf/4RIgOWTo5WeT8kGs4jFokamRoOwM9uE6hJp5IsYH574chO4
         Yrt3Zfk8kVT3qnLsK0jkbsHO48aR+mEDxa3agCtJhkmMQCWB5wweR/j8PK3xh0TeK5aR
         Uo+UW77IxgME/VVWhfDizvWJuNPelqu8Du86RDBloEE9xV5LivYdHp8VXfsX59ByZUA5
         MFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761994092; x=1762598892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtLoHp0kEwq/bLHJArViyfu5fWlEi0xAxEhFmz0T09k=;
        b=jOUIIBATXbYFur2zyugniq3MVD/oVyEf/Sh5L3LTmALdmoSbA9mm/Okk01rXH6slYj
         JnJY6hFU4lP/6HyFXtVaoRNYMUdyN1KeUbNKq/RNUbRX5QgZm09sjnn+iUNuBCz/F/Bm
         whMNZmHDspd0DL3piJ3YKFUldjhfzOoAxh8hlqLvyU1hApIownjGGmZKohu1sE0Dup35
         hCHRScnAWqNhm92Qd2VZsqG7/CxRNp7Z8K9BixV1CVxk/61TrX82+0Oi/BdiIBJ27C48
         XctrMOZF4kaxoAo+K9KqBi3iP9d71fNPOF/ymdGK+GmUB9W73ExiK4qBU58mAReeFa7f
         lE3g==
X-Forwarded-Encrypted: i=1; AJvYcCVHb78YQnsHtq5rlOqiFNH9NP+7RmdNhO7Fww+tLdNmJCoravUIC+wFvEhlhKm91KXgf6Xry237bUnLEVGtCA8R@lists.infradead.org
X-Gm-Message-State: AOJu0YwfoknH4VsAnLy4hZM6YqybTCb/YDnb8SuuIMr+f6Y+lR5eIElC
	4IBtuRvSXj4JWRT40t7d2y0EkWfNCNmYRkwTkvIIs2+lER58WLQpOvqEd0KPQcw8SGmFsAJ0SGf
	Jt/DEmxuYPMaWh1ct3fKAvxmbxbdZaeI=
X-Gm-Gg: ASbGnctLZXEIBFQ3SR5XuL9rLhRZdI9mg8JQhrwrJ+GgcAp16wcQNIHgmHN0iEi6kmw
	Ts8cfXCL0alCGVCnhYtwmSlSkfL/H9ZXM2rOSL4vlRXIexnblcDxHtQJqrB3GvXN1MLgDXicBOg
	vYymqjGR2MhvKV2+Op3E1MI4BgvBT3ZgE4YtEXXsh/m4jaP0l1+vfa80h816PEkAPyrwMJhBKRy
	wbF6Olg1P8KQSNGDQ3rIbwvoUHCPriMuERf9MtCjI0KfZ9b6UI/PuAaW0AToqM0QnrqEA==
X-Google-Smtp-Source: AGHT+IEwEAbpzczbirHeYPq9CirAqArt7tfqx1f1DuepotXx+VdlfMQPQPP7/cGb1j0Z5jLq9Qc9/0ubBl45KkLxH90=
X-Received: by 2002:a05:6402:518b:b0:639:dd3f:f265 with SMTP id
 4fb4d7f45d1cf-640771ceb67mr5718247a12.25.1761994091667; Sat, 01 Nov 2025
 03:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250905112736.6401-1-linux.amoon@gmail.com> <176085588758.11569.7678087221969106036.b4-ty@kernel.org>
 <CANAwSgRjXS4V_Kpw5kaJnPA8f=18uN-MgfEQ5ErN3aFRqbJKfg@mail.gmail.com>
In-Reply-To: <CANAwSgRjXS4V_Kpw5kaJnPA8f=18uN-MgfEQ5ErN3aFRqbJKfg@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 1 Nov 2025 16:17:54 +0530
X-Gm-Features: AWmQ_bmhgMeWFkOeYmBpsEodWI1g24fEo-iGnLSXhllxCODvU7vKr_LfOJBB0YE
Message-ID: <CANAwSgSrisWFPPRkZ=ukCjui3_xzgrmLKz5F9iXnerUFktk5UA@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: dw-rockchip: Simplify regulator setup with devm_regulator_get_enable_optional()
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Hans Zhang <18255117159@163.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_034816_265652_A33ECC86 
X-CRM114-Status: GOOD (  18.18  )
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

On Fri, 31 Oct 2025 at 12:27, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Manivannan,
>
> On Sun, 19 Oct 2025 at 12:08, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> >
> > On Fri, 05 Sep 2025 16:57:25 +0530, Anand Moon wrote:
> > > Replace manual get/enable logic with devm_regulator_get_enable_optional()
> > > to reduce boilerplate and improve error handling. This devm helper ensures
> > > the regulator is enabled during probe and automatically disabled on driver
> > > removal. Dropping the vpcie3v3 struct member eliminates redundant state
> > > tracking, resulting in cleaner and more maintainable code.
> > >
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] PCI: dw-rockchip: Simplify regulator setup with devm_regulator_get_enable_optional()
> >       commit: c930b10f17c03858cfe19b9873ba5240128b4d1b
> >
> I am looking to suspend or resume the issue. We probably need to
> toggle the regulator
> to maintain the power status on the PCIe controller.
> Therefore, dropping the patch is an option; I will add dev_err_probe
> for PHY later in the patch.
>
I found this series with the address system suspend support

[1] https://lore.kernel.org/linux-pci/20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com/

This patch will conflict with
[2] https://lore.kernel.org/linux-pci/20251029-rockchip-pcie-system-suspend-v4-3-ce2e1b0692d2@collabora.com/

So please drop my patch.

Thanks
-Anand

