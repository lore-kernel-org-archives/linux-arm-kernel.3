Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D75CF256D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 03:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5dfib/LBWTivyaWbqxMuq7w4wYlCU3lMwonCOlQGff8=; b=u0exDda0RHyejF
	V7pWjvV83EM5jw4NNMF2hhbJ9w1leTC1VB71Y6Fosh0UqWMpVKSMFNWc63lVE2XGRqifo/V5b9+X+
	DwxhTh9NU4RQbf2Gg/qlUw8laknGAvhGP+xSCF+bJf3iZgYMYyebQZyWytl0H9VLBV6hw5VP7Pv7I
	Zw4wrsjaluNKY+LABXkwcIs7gGCvbWtuSWErTkzUqteMSMj9p6j0F0ZXbeDJLhXtLOJ4u+YSKZv7y
	6ZfVwt6kr6q2VUObHtkQztfOMq2hKr30nfF2DHH1XKzqZ6S11eyp7DCtx2RCKWoNEIZoS4PsDuAyz
	AN3nvaBWUZ/N9FE++SrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLvb7-000000065nw-2y3m;
	Thu, 20 Nov 2025 03:44:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLvb5-000000065nc-3w0o;
	Thu, 20 Nov 2025 03:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 06A456018B;
	Thu, 20 Nov 2025 03:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F80C4CEF5;
	Thu, 20 Nov 2025 03:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763610278;
	bh=AjdxR6TUqq3Wcw+p33wfaWFBJDTgg/OZKKZdG+hrWVU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PxNKms2yk1pVNaHxO1/75tbCaZ2Y+w7UQgCVbLiXP1frzW8HEzJWotYTj4sNgdysV
	 5loVSEyeMx6OFe5LajWbF7OKXRhpDhr/1WPHG96YhEWrXrDRc5T6Df66T88h5SY5Ta
	 d/AxjzQoAMnsc0mRBjpl9V5q4C6gGgZBkbKfPOORE1cARNO86cHsb/mnttbXtXmwng
	 ZU7tjdYER9j3hciyCBMrB2FiQzCJ5jYc/avhTfFm0hgtrcKKK6dCRLTzCvGLfbVJVh
	 Rqy+BIPuomcsUnvDb+EOgkUcD2GYDl/urauwbudkNGLLQqDTc0jE56rYk+KCLAB3+u
	 +7cYNUP/G8Dww==
Date: Wed, 19 Nov 2025 21:44:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-pci@vger.kernel.org>,
	"open list:PCIE DRIVER FOR ROCKCHIP" <linux-rockchip@lists.infradead.org>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC v1 1/5] PCI: rockchip: Fix Link Control register offset and
 enable ASPM/CLKREQ
Message-ID: <20251120034437.GA2625966@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANAwSgRHuwoQjr95sXp-X97=L-X3vqUPxjR5=2jNtFZA+4gnwQ@mail.gmail.com>
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

On Wed, Nov 19, 2025 at 07:49:06PM +0530, Anand Moon wrote:
> On Tue, 18 Nov 2025 at 23:20, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Mon, Nov 17, 2025 at 11:40:09PM +0530, Anand Moon wrote:
> > > As per the RK3399 TRM (Part 2, 17.6.6.1.31), the Link Control register
> > > (RC_CONFIG_LC) resides at an offset of 0xd0 within the Root Complex (RC)
> > > configuration space, not at the offset of the PCI Express Capability List
> > > (0xc0). Following changes correct the register offset to use
> > > PCIE_RC_CONFIG_LC (0xd0) to configure link control.
> ...

> > Don't do two things at once in the same patch.  Fix the register
> > offset in one patch.  Actually, as I mentioned at [1], there's a lot
> > of fixing to do there, and I'm not even going to consider other
> > changes until the #define mess is cleaned up.

> > [1] https://lore.kernel.org/r/20251118005056.GA2541796@bhelgaas
> 
> According to the RK3399 Technical Reference Manual (TRM), and pci_regs.h
> already includes the correct, pre-defined offsets for all PCI Express
> device types
> and their capabilities registers. To avoid overlapping register mappings,
> we should explicitly remove the addition of manual offsets within the code.

> Here is the example. Is this the correct approach?

> -       status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> +       status = rockchip_pcie_read(rockchip, PCIE_RC_CONFIG_LC);
>         status |= (PCI_EXP_LNKCTL_LBMIE | PCI_EXP_LNKCTL_LABIE);
> -       rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_CR +
> PCI_EXP_LNKCTL);
> +       rockchip_pcie_write(rockchip, status, PCIE_RC_CONFIG_LC);

No.  The call should include PCI_EXP_LNKCTL because that's what we
grep for when we want to see where Link Control is updated.

See my example from [1] above:

  rockchip_pcie_read(rockchip, ROCKCHIP_RP_PCIE_CAP + PCI_EXP_DEVCAP)
  rockchip_pcie_read(rockchip, ROCKCHIP_RP_PCIE_CAP + PCI_EXP_LNKCTL)

You should have a single #define for the offset of the PCIe
Capability, e.g., ROCKCHIP_RP_PCIE_CAP.  Every access to registers in
that capability would use ROCKCHIP_RP_PCIE_CAP and the relevant
PCI_EXP_* offset, e.g., PCI_EXP_DEVCAP, PCI_EXP_DEVCTL,
PCI_EXP_DEVSTA, PCI_EXP_LNKCAP, PCI_EXP_LNKCTL, PCI_EXP_LNKSTA, etc.

Bjorn

