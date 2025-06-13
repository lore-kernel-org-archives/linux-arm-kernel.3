Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420E6C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 22:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=+OkkduMqK5cNysKB4yzBR4lU60G4xlkptYsz2TMDQQk=; b=hgVh9o3O0Erqm2
	nqskTTm8IzH4h8+czY+HJRVOyWxaiHyR1QjUfrgL74XaCJbDMsUs3vf7AA4Nvy2ZqJiSo8sCk6YA0
	vkIw911Zm/gGRmnGVLxtqs8tkeihXrFlTWGTc48SFdcmtFpj7pqIxNapPOKf3IXEotmopZn2JP5sC
	YHBHktixYSEiBBiCAJrUCxXik0OCoJrhfEvOfpyniwxUIcJ8q5jKZ0Y9xrYjE2THR85PB8LX6M3f/
	IKZtZS03nrwDCFCThQoLxcS6knRqeawOt6Ff2Lsuufoh1DQLTWkuNunDont5NKPOthGRe9rmZYckj
	xiUVrwSuOFJWbRfKnMdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQCUa-00000000BqK-1nD1;
	Fri, 13 Jun 2025 22:03:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQCSR-00000000Bj9-3hvi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 22:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9312629D0;
	Fri, 13 Jun 2025 22:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E85EC4CEE3;
	Fri, 13 Jun 2025 22:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749852066;
	bh=Q4i3PDbu1STbHbbwGxaxWMYZqyXSfts65HVlG376auM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rOEU3pskrhCUXIC9exM3DbnLO6Z58LFRstZMwm8FRcCm0ZE3V/XyBigJUPeR1L7LT
	 H4Mv+8zYRbncG5Bz5Fa0BQYBdWY4TEB1xwBQxxGYK2t5w+/lgDSau+Ep34MGIuxF0f
	 kebzay7p4cr0MApOqLaU+vvhAE+vjdFVIILnJevr9V6cm9/ByzXzBut0B+RIvYRF86
	 w1ex6y4ew3wA8G3wuk0lqj803k4XuH1x+qx6wzWmjYASinLYCySaA5198ruiFBCMhx
	 blCti/bipt1jx9/Scmwffs/CYkkqlMSap2iR5cA4Z1qQ7IlHE1CMvonlmUE02m6ooG
	 7GwhfZIl2MAbw==
Date: Fri, 13 Jun 2025 17:01:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Anand Moon <linux.amoon@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
Message-ID: <20250613220104.GA986309@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW_89naftFMo881zp=7QGJDznFzzqLQ-kLEuyJ=KJWQnA@mail.gmail.com>
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

On Thu, Jun 12, 2025 at 03:16:45PM +0200, Geert Uytterhoeven wrote:
> On Sat, 7 Jun 2025 at 21:46, Marek Vasut
> <marek.vasut+renesas@mailbox.org> wrote:
> > Add the ability to enable optional slot clock into the pwrctrl driver.
> > This is used to enable slot clock in split-clock topologies, where the
> > PCIe host/controller supply and PCIe slot supply are not provided by
> > the same clock. The PCIe host/controller clock should be described in
> > the controller node as the controller clock, while the slot clock should
> > be described in controller bridge/slot subnode.
> >
> > Example DT snippet:
> > &pcicontroller {
> >     clocks = <&clk_dif 0>;             /* PCIe controller clock */
> >
> >     pci@0,0 {
> >         #address-cells = <3>;
> >         #size-cells = <2>;
> >         reg = <0x0 0x0 0x0 0x0 0x0>;
> >         compatible = "pciclass,0604";
> >         device_type = "pci";
> >         clocks = <&clk_dif 1>;         /* PCIe slot clock */
> >         vpcie3v3-supply = <&reg_3p3v>;
> >         ranges;
> >     };
> > };
> >
> > Example clock topology:
> >  ____________                    ____________
> > |  PCIe host |                  | PCIe slot  |
> > |            |                  |            |
> > |    PCIe RX<|==================|>PCIe TX    |
> > |    PCIe TX<|==================|>PCIe RX    |
> > |            |                  |            |
> > |   PCIe CLK<|======..  ..======|>PCIe CLK   |
> > '------------'      ||  ||      '------------'
> >                     ||  ||
> >  ____________       ||  ||
> > |  9FGV0441  |      ||  ||
> > |            |      ||  ||
> > |   CLK DIF0<|======''  ||
> > |   CLK DIF1<|==========''
> > |   CLK DIF2<|
> > |   CLK DIF3<|
> > '------------'
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Bartosz: Any chance you can apply this patch to an immutable branch,
> so I can merge that before taking the other two patches?
> The alternative is to postpone the DTS patches for one cycle.

I applied this patch only to pci/pwrctrl for v6.17 and made a note
that the commit should be immutable:

  66db1d3cbdb0 ("PCI/pwrctrl: Add optional slot clock for PCI slots")

We will likely add other pwrctrl patches to this branch during this
cycle; I assume that will be OK as long as 66db1d3cbdb0 remains
untouched, right?

Bjorn

