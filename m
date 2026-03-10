Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68006EB1072
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5G2YmSWGeyY1zwDa+lorBItC8XLFGjz0QBMlqkN2dGg=; b=PXPFOujnfenHVe0j2v2f84ULON
	DtD6nZcQS+a1nhdP93uIbGy0cbEOvgowN26kS4tntkMZT5nOYF1MrJrrYnAk0lEL8RJ+SPrnp9jED
	a8hgMAhm/9B32+FN1v1ZPsZejnmB6Wdw0UgwjFq52Qx9FYZwM6Nno73rz475AOvPJYIssYYnDUknt
	gjeZ7BS4zo3+L6c12+2n4qXyKeKPF1eSkahnC2zBFE53cZgmYt9nqOuW1o7WSzEByEYKG9dv6G2QD
	ipf6Yq/qkTt0eKdP6X+NHB6DGcaAoAS/vxA8JbKl6qTuJ8KbBQ9jqcSL7LAoT3Ox5Tr3osLbdzOtw
	fgnxzcxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzz2y-00000009oSn-2XR0;
	Tue, 10 Mar 2026 15:31:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzz2w-00000009oSC-2abM;
	Tue, 10 Mar 2026 15:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC87943B9D;
	Tue, 10 Mar 2026 15:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEC00C19423;
	Tue, 10 Mar 2026 15:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773156656;
	bh=b4O0EM+uxFd+g9UdQ2la/JIfIpf7FntL6wm/5Ex5rSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cldBNYhXxNqSMKyUEjACEnnIiGpiLgfRumrIzYfQu904sAMT25Sn5aadisyNtr0+O
	 ddl7aaWmR2LeoRQXQQb3oCv0AYAJDP+u+zCCIHfoQPU8pzhv1/phPWZsUEavMYswRH
	 sOUkeKhxkRbbE4/sutIzwyQ8yHQMPLsX+t9fS5yCHbu8g2hJW/hpYmiEcA9ynM06bo
	 CgZE5JIDswJwFsH05YrGcB8DcxLw97a6lkGosu/SNwXcT+j42JinGzdFREh6VOEIkv
	 Kfw9y82F637atCLv03Up3A2Of+tr91yiWjAl9XIU4te9q2EW1kZKr3YHb3xKYwZ1Ni
	 MzlmkhLOCk8IA==
Date: Tue, 10 Mar 2026 21:00:42 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Grimmauld <grimmauld@grimmauld.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_083058_700455_5EB78C01 
X-CRM114-Status: GOOD (  15.24  )
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

Hi Robin,

On Tue, Mar 10, 2026 at 01:41:56PM +0000, Robin Murphy wrote:
> Hi Mani,
> 
> On 2026-03-04 6:48 am, Manivannan Sadhasivam wrote:
> > 
> > On Thu, 26 Feb 2026 15:40:23 +0530, Anand Moon wrote:
> > > Rockchip DWC PCIe driver currently performs synchronous link training for
> > > combo PHYs (PCIe 3.0/2.0 and SATA 3.0) during boot. This process waits for
> > > the link to be fully established, adding several milliseconds to the boot
> > > sequence. To optimize boot time, this change enables asynchronous probing,
> > > allowing link establishment to proceed in the background while the kernel
> > > continues probing other devices.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [1/1] PCI: dw-rockchip: Enable async probe by default
> >        commit: ec392abc95932838bf7e3d659d358f4df9ff5a0a
> 
> This appears to have the side-effect that calling pci_host_probe() from
> async context can effectively force async probe for the endpoint drivers
> as well, but some drivers are not OK with that, as our CI has just
> flagged up.
> 

Thanks for reporting!

> (And as for that particular warning, ISTR last time I looked into it
> another context, the opinion of the MDIO/phy maintainers seemed to be
> "don't force async probe".)
> 

This was discussed during v2 [1] and concluded that the async probe benefits
outweigh the unharmful splat from phylib. I also agree with the above conclusion
that this splat should not prevent us from enabling async probe for PCI
controller drivers. It can easily save a few 100ms during boot.

- Mani

[1] https://lore.kernel.org/linux-pci/aYHVlS1nbCMMyF04@ryzen

-- 
மணிவண்ணன் சதாசிவம்

