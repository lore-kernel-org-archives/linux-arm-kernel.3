Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D232E7545C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFryFaNSwdzD/vSDQgCvIb9qGKYtzkN+fGok+kNOoDo=; b=j2mNSahY4DymFtyh7nRVRKvjkw
	ti3oJq1O9xFYifgCdb6I/q038LRcKXa5S3Gb4ctcYAWSCCbM3Ow/SACV4YcAecijQEK4+pIe70wov
	o8oAf2L22sAKMexMIRvkbKgk6l2j7wuVedm6a3CuekrD8xc0C1wIMh3czEfwuaQkbJch62idBCHQu
	moIySAFOxTbirKmCHZijA2o030vsIzBAa1BnmzZBLReMZ0f99MpsfSNeGNmJn7b5+Gv3EFeZjHaBJ
	t+iAEj7k0qC2WQ0Cn1xlvTGPo0XhdQ45x9IinHg0fx0ynPrWdcmdkESBjNBwFMvWbIHCPuXA/P5gr
	la/gf6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRSz-0000000HCgn-2cZH;
	Wed, 24 Dec 2025 16:12:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYRSw-0000000HCfh-0twM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 16:12:00 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so9829142a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766592716; x=1767197516; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFryFaNSwdzD/vSDQgCvIb9qGKYtzkN+fGok+kNOoDo=;
        b=jpCZCJUN8HX+vtH617P0VcYKj+dcsHjLydNIsjC7WtL7x7St2gqe6V66VGz7sg6vGi
         tJ9kODDuWfB0I9b2q1yd8Z+sJ+8EOm0nd4c3YwFXCQSxS1rAcEL1dhtakh2j1C3FaBfI
         FWfLuGISu+ngzJuRTAKFW8jOmSLN4QPtrIQZzWMUM//WHFFAW/9691b0KukqnUQnXYUI
         nSpEMDXtl2LMqLmNmSZ2YuzPXl6G81IzMxbkYCysU1MmMnfcAZ/cFTZVAaVc3qnns6Mq
         IFx/XStGyOBeKEtk8Mz6s5Il7FJ8peHCGwzMCY5aNLC16iq8QR6LmaMJ6AKTwnIf1dY8
         34lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766592716; x=1767197516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rFryFaNSwdzD/vSDQgCvIb9qGKYtzkN+fGok+kNOoDo=;
        b=AhNQ4RlYQ7Jj4iPqncPO2JrSSxAqzsiQq/WHtIPr7EKy5aXsjaeRBaskKK0RmrS+aL
         tP+8bTz8q8H010nL3A63RswQgRex6uDciVWcgKnokHrHc8Yc1lRKv4g12vV1Sjv/hTAT
         /1sl2JIgyy1/gbHQkcENPaTY2gzf/XQC33cLlNuQLv6Blz4Q1WuTgKFxbUz7H4g6Y1py
         ntIZ3/aEb6sq5nSeVNppCmRTJ37z0dUsSFYdt8nok5+DjJ2dm65B3kUojeqIPwpxTvUg
         1Nur7e7LL466fUvYldVZQEOKhdATwqNzpSLZUPq6B06VkH6hBZUM8/CrIAHwBaVanJ2t
         hMfw==
X-Forwarded-Encrypted: i=1; AJvYcCVM4ATS6kyYQ8OM6gREjj7ta/RmnBecIvfcduAYVRcJZgKZpEzrhygIfvVS0507dU82Km/LBgZY1SDOdD6UwRKQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzOIAavirarELyDFXgKsh0igZi59wbxYDIoKvh44+EDjhPcqsW/
	UarvLuim0qMswl2vkKsbZGKso2emUbjzKzK9goaUx4E9K1saGTojs1oGzi/8ckxhaQaX++Zd/sF
	TO1DHCLDDYbtE+aPUeUmzKwQBTIA2TTY=
X-Gm-Gg: AY/fxX7VmlpLBw5+UoK4CAgvtw3dElB2A4QDfm0X0jdCCpnjg4q7ORaXka8Mz0zL2ja
	D0WV0Ij5Zy0Y/nm6TnLn/Sv2jTf8sUN8nQsoTQfJa1wZBgKFahvw+axHR6kBUskNaYPpywOrPAb
	PZStquYciLybMSpIws60LHzY4FMW3CnfKzPm462QoZNGIGYb7b3rjY0DXhUS9zrtg2wF5y8hrA8
	mFT0SMGiyDRJOkEAS4pDNDMiS5lfxh6TKQKaGbjax8UjQrS2lbhDje881P+wFMNwTY=
X-Google-Smtp-Source: AGHT+IF8JwCFITnsLBTkXmiS0L4MmwBGPqpepuJqg06icSWw77Trn5dPC9ARbJb2q7e916O74g9D6jFvUiAyqH6N2Ek=
X-Received: by 2002:a17:906:2082:b0:b80:3fb7:84f with SMTP id
 a640c23a62f3a-b803fb70d84mr1260286766b.38.1766592716002; Wed, 24 Dec 2025
 08:11:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1763415705.git.geraldogabriel@gmail.com>
 <eaa9c75ca02a53f8bcc293b8bc73d013e26ec253.1763415706.git.geraldogabriel@gmail.com>
 <CANAwSgQ726J_vnDKEKd94Kq62kx8ToZzUGysz4r3tNAXvfAbGA@mail.gmail.com>
 <CAEsQvctSY7-RQEQF2TmJU2qKPZOe9TC5g-7Jat0LQKRHYz_6dQ@mail.gmail.com>
 <CANAwSgQPQUBi6VVb+hZNraMt71vnRpki+YK_at=Luo4aPVtOPg@mail.gmail.com> <0afea20b-be22-2404-5a8e-c798ed45f2fd@manjaro.org>
In-Reply-To: <0afea20b-be22-2404-5a8e-c798ed45f2fd@manjaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 24 Dec 2025 21:41:38 +0530
X-Gm-Features: AQt7F2q-4QkIrb7HCrmK7bnip5LMtE41U74PCnTtsggrekXUlmrVmrAckqk4Lqg
Message-ID: <CANAwSgS6UeR4PJnWDxxcQbdH8u_4uNiQxCTugQS35LcPvpiwMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent damage
To: Dragan Simic <dsimic@manjaro.org>
Cc: Geraldo Nascimento <geraldogabriel@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Johan Jonker <jbx6244@gmail.com>, linux-rockchip@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_081158_509365_7626D895 
X-CRM114-Status: GOOD (  22.24  )
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

Hi Dragan,

On Wed, 24 Dec 2025 at 18:25, Dragan Simic <dsimic@manjaro.org> wrote:
>
> Hello Anand,
>
> On Wednesday, December 24, 2025 09:04 CET, Anand Moon <linux.amoon@gmail.=
com> wrote:
> > On Wed, 24 Dec 2025 at 11:08, Geraldo Nascimento
> > <geraldogabriel@gmail.com> wrote:
> > > On Wed, Dec 24, 2025 at 2:18=E2=80=AFAM Anand Moon <linux.amoon@gmail=
.com> wrote:
> > > > On Tue, 18 Nov 2025 at 03:17, Geraldo Nascimento
> > > > <geraldogabriel@gmail.com> wrote:
> > > > > Shawn Lin from Rockchip has reiterated that there may be danger i=
n using
> > > > > their PCIe with 5.0 GT/s speeds. Warn the user if they make a DT =
change
> > > > > from the default and drive at 2.5 GT/s only, even if the DT
> > > > > max-link-speed property is invalid or inexistent.
> > > > >
> > > > > This change is corroborated by RK3399 official datasheet [1], whi=
ch
> > > > > says maximum link speed for this platform is 2.5 GT/s.
> > > > >
> > > > > [1] https://opensource.rock-chips.com/images/d/d7/Rockchip_RK3399=
_Datasheet_V2.1-20200323.pdf
> > > > >
> > > > To accurately determine the operating speed, we can leverage the
> > > > PCIE_CLIENT_BASIC_STATUS0/1 fields.
> > > > This provides a dynamic mechanism to resolve the issue.
> > > >
> > > > [1] https://github.com/torvalds/linux/blob/master/drivers/pci/contr=
oller/pcie-rockchip-ep.c#L533-L595
> > >
> > > not to put you down but I think your approach adds unnecessary comple=
xity.
> > >
> > > All I care really is that the Kernel Project isn't blamed in the
> > > future if someone happens to lose their data.
> > >
> > Allow the hardware to negotiate the link speed based on the
> > available number of lanes.
> > I don=E2=80=99t anticipate any data loss, since PCIe will automatically
> > configure the device speed with link training..
>
> Please, note that this isn't about performing auto negotiation
> and following its results, but about "artificially" limiting the
> PCIe link speed to 2.5 GT/s on RK3399, because it's well known
> by Rockchip that 5 GT/s on RK3399's PCIe interface may cause
> issues and data corruption in certain corner cases.
>
It=E2=80=99s possible the link speed wasn=E2=80=99t properly tuned. On my o=
lder
development board,
which supports this configuration, I haven=E2=80=99t observed any data loss=
.

sudo lspci -vvv | grep Speed
                LnkCap: Port #0, Speed 5GT/s, Width x1, ASPM L1, Exit
Latency L1 <8us
                LnkSta: Speed 5GT/s, Width x1
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDi=
s-
                LnkCap: Port #1, Speed 5GT/s, Width x1, ASPM L0s L1,
Exit Latency L0s unlimited, L1 <2us
                LnkSta: Speed 5GT/s, Width x1
                LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDi=
s-

Thanks
-Anand

