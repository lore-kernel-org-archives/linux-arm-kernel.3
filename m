Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B02C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmuWSz3ghIdZGMhghUlYrprZMbq7v/CRAVTEAEZ2xow=; b=SmxT9GL43VMkZHFklgeGeS4oD8
	RJkfQabgLXdw/1UxI6GjcbTyFyYj5u3c0PADNc1cWmvUNlJKb217IOFQaX0NvH1muKSKm4d3/JGn4
	E2+Ov3W1OtvP4ZZ0u9qawy/UKpoLMiU9aoqB0yl6Nl9yW5Id+osxHG4r6yhRFmYLTVey0a7awa7i9
	+q49wsGcm1Ui7Rr6iaod39CmCBpLnf0Dgrc8fRA7e08LcVgWrWuKmj5GWitnCwj41muL5KOe+lJDJ
	T2OZUfOUh/+6oVJqVt0d9wDfEfohNLOa2Cx0S6CVLXWIzGl8BV5mZ/1IOHZQWrDfu2Yhp5sQl76bS
	hhGnHKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2q7-00000009hIE-1HWs;
	Mon, 19 May 2025 15:55:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH22S-00000009WRq-0vnw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:04:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69D9E629CA
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 15:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCB8C4CEF6
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747667062;
	bh=nAKO8OGKF4AztbuJv40zpDcb5wqiwnzv4Jv2Yx8mPxM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N7m+R5C/jhx04v1Ku24Up2mCG2BgcATKFVraI7sIUo7XAP8u2dbPtlv7vuRw62vlY
	 /8w1gYzG4m1CAMDzFMPiA6++CPaui6KCJRuc9SQiDWSyxz8U+TGzg+Wz+2wijWHeJR
	 pcbDFfSFXeWMUJFp94GP30An33VJ7g5GxaFCwVELPKRUgWACMTu+FJMQgI+PEYZXY4
	 B65fte8czpFnla/yA2iZ4Qp657HKfk8Q5nXa23Cvx/H/zYzumLQJqixh9DI5wocQRW
	 96EjH6KJRzUJL+SRG7gl/Xtdkbkl1f4JAMelVxLM9quBPIcbqwh3SfxD8NvCASyYhW
	 oDxBWY7VKxX7g==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-601ad859ec0so3611698a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 08:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWg7QdHgZn9htVJE0i+3+D4/vNV5XukfwOoQ84wFXhefJ0vXvz0yXbMrGgewsud7N7LcGSQYHF51hLis/vkFUyk@lists.infradead.org
X-Gm-Message-State: AOJu0YzCAEnpvalf9BSlidyAW48JnbG0K+so73pgVtoBqRX7GKSq4ivz
	81l5fpY5KZYNAzC908/9r3C33of9RPqPfqU4FE5w7WBb1YAFkAtrR179EKiS7mFVHD8VropTWxU
	n1s6qJmydn7RLgUaWQFZWv5VF0kySmQ==
X-Google-Smtp-Source: AGHT+IGkl7mO31GpM00ETtQQyjB2apn3OWsMMvOjL6selmU0XxKcDg4XZbV6haY504eFAB8x2LaMP/Ud26Cg5eKnkMA=
X-Received: by 2002:a17:907:9624:b0:ad5:59c5:a50a with SMTP id
 a640c23a62f3a-ad559c5e012mr679198866b.41.1747667061193; Mon, 19 May 2025
 08:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250406144822.21784-1-marek.vasut+renesas@mailbox.org>
 <20250406144822.21784-2-marek.vasut+renesas@mailbox.org> <2ny7jhcp2g5ixo75donutncxnjdawzev3mw7cytvhbk6szl3ue@vixax5lwpycw>
 <84cc6341-a2c1-4e3c-8c9e-2bc6589c52a6@mailbox.org> <ne4injlr4nwvufjdg7uuisxwipqfwd5voohktnbjjvod5om3p3@eriso5cw77ov>
In-Reply-To: <ne4injlr4nwvufjdg7uuisxwipqfwd5voohktnbjjvod5om3p3@eriso5cw77ov>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 May 2025 10:04:09 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+GdeKFPVpEOz+588QxkF-Uq=oNF5WJU+TK31Q6mkqaDA@mail.gmail.com>
X-Gm-Features: AX0GCFuM-ijojC5S5c880VBpsAMf0vcAyjr7rPNQjkwKwo82o_lhFRSIQX6xj28
Message-ID: <CAL_Jsq+GdeKFPVpEOz+588QxkF-Uq=oNF5WJU+TK31Q6mkqaDA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: rcar-gen4-pci-host: Document
 optional aux clock
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Heiko Stuebner <heiko@sntech.de>, Junhao Xie <bigfoot@classfun.cn>, 
	Kever Yang <kever.yang@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, May 15, 2025 at 6:57=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, May 12, 2025 at 10:42:20PM +0200, Marek Vasut wrote:
> > On 5/9/25 9:37 PM, Manivannan Sadhasivam wrote:
> > > On Sun, Apr 06, 2025 at 04:45:21PM +0200, Marek Vasut wrote:
> > > > Document 'aux' clock which are used to supply the PCIe bus. This
> > > > is useful in case of a hardware setup, where the PCIe controller
> > > > input clock and the PCIe bus clock are supplied from the same
> > > > clock synthesiser, but from different differential clock outputs:
> > >
> > > How different is this clock from the 'reference clock'? I'm not sure =
what you
> > > mean by 'PCIe bus clock' here. AFAIK, endpoint only takes the referen=
ce clock
> > > and the binding already has 'ref' clock for that purpose. So I don't =
understand
> > > how this new clock is connected to the endpoint device.
> >
> > See the ASCII art below , CLK_DIF0 is 'ref' clock that feeds the contro=
ller
> > side, CLK_DIF1 is the bus (or 'aux') clock which feeds the bus (or endp=
oint)
> > side. Both clock come from the same clock synthesizer, but from two sep=
arate
> > clock outputs of the synthesizer.
> >
>
> Okay. So separate refclks are suppplied to the host and endpoint here and=
 no,
> you should not call the other one as 'aux' clock, it is still the refclk.=
 In
> this case, you should describe the endpoint refclk in the PCIe bridge nod=
e:
>
>                 pcie@... {
>                         clock =3D <refclk_host>;
>                         ...
>
>                         pcie@0 {
>                                 device_type =3D "pci";
>                                 reg =3D <0x0 0x0 0x0 0x0 0x0>;
>                                 bus-range =3D <0x01 0xff>;
>                                 clock =3D <refclk_ep>;
>                                 ...
>                         };
>                 };
>
>
> and use the pwrctrl driver PCI_PWRCTRL_SLOT to enable it. Right now, the =
slot
> pwrctrl driver is not handling the refclk, but I can submit a patch for t=
hat.

There's another discussion about PCIe clocks here[1]. Seems there's a
variety of options here with spread-spectrum layered on top.

Rob

[1] https://lore.kernel.org/all/20250425092012.95418-2-cassel@kernel.org

