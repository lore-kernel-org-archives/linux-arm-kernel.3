Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80B4C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 19:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=l93wArIHwMbKZzTlKp79U6l/s1MePAH2nttgkdnBA04=; b=KTfE5QGXnWNxr2
	TEx96q+HCqu8MGKMakJ1HwzOPxZ6fD6HaYhb3D6ahf6p0sW5BOCM3ybu2v/tlwB9l2cjr6NuBjCS7
	IQ5fJK6gebqabEhDnfHV+ilXnFhlM4Ub95SAC3iUKl1JxJidJQDB+FExnwfklr1Fckolc6bmSNSMG
	MqnyLOVXUIuzHRQ8kjmTd29lAvgaQCVWQuAh5x61new7O7QBrfIhtzlgNmvfq5GwelVJYC98krA4t
	viWcUs4ZmY0gloTbrScEk/MUu9MGWFKodJyISriruhBDN/BIdxOEcgaC50PdAQaPj01CjItM9QrZC
	U94cojAqnFGgeYHcQ5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGRm-00000003qx5-0FRN;
	Mon, 17 Mar 2025 19:48:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuGP8-00000003qgF-02DI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 19:45:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57C265C3CE2;
	Mon, 17 Mar 2025 19:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF366C4CEE3;
	Mon, 17 Mar 2025 19:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742240740;
	bh=1WzhvgIhcGV1q7kZBpy9Ec9bjhHmsqVZLv/kd7yp1q0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=eUsdAvVOPMgsXKbTzQUTL36vzp1Qs0h9NK+Ehjw3ZIEJ/7teihEPkt9+9FI9nMFS7
	 AYk8WZMrpWXpyqXw7DkpQjgWrsKjDgf0PNyJdwR8K15Kp1CRHvyChDSEe4uo/dSAEV
	 91pJButJgu6oTf4Wp7ynQuv2wZIw25vxMHgkkk3HhF9fTthyasaY330CXwyPkMLdlL
	 uzPttE8z//O5y0Xl9sbKgDri3oASzQY6RMokDfMSL9VJEGaOF0laKqJ6qi+9ihoUzU
	 Ix39jL4Mkl08VimFD6WDnZNG4h5IgRU8jVpmK4x68ytP18488Onu0Ium4YRYK70awJ
	 Rmjo3EdnXZT1w==
Date: Mon, 17 Mar 2025 14:45:39 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Frank Li <Frank.Li@nxp.com>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC NOT TESTED 0/2] PCI: dra7xx: Try to clean up
 dra7xx_pcie_cpu_addr_fixup()
Message-ID: <20250317194539.GA969005@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317184427.7wkcr7jwu53r5jog@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_124542_092871_E60666D7 
X-CRM114-Status: GOOD (  19.32  )
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

On Tue, Mar 18, 2025 at 12:14:27AM +0530, Manivannan Sadhasivam wrote:
> On Mon, Mar 17, 2025 at 12:30:08PM -0500, Bjorn Helgaas wrote:
> > On Thu, Mar 13, 2025 at 11:35:21AM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Mar 05, 2025 at 11:20:21AM -0500, Frank Li wrote:
> > > > This patches basic on
> > > > https://lore.kernel.org/imx/20250128-pci_fixup_addr-v9-0-3c4bb506f665@nxp.com/
> > > > 
> > > > I have not hardware to test.
> > > > 
> > > > Look for driver owner, who help test this and start move
> > > > forward to remove cpu_addr_fixup() work.
> > > 
> > > If you remove cpu_addr_fixup() callback, it will break backwards
> > > compatibility with old DTs.
> > 
> > Do you have any pointers to DTs that will be broken?  Or to
> > commits where they were fixed?
> 
> Any patch that fixes issues in DT and then makes the required
> changes in the driver without accounting for the old DTs will break
> backwards compatibility.

Right, I guess the rule is that if we have patches that fix DT issues,
we should apply them as soon as possible.

And later if we ever have confidence that unfixed DTs no longer exist
(or if we can identify and work around them in the kernel), we can
remove the .cpu_addr_fixup().

Bjorn

