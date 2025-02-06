Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFCE1C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hgN1YNURyiYxqFeIA6+C2nHwSg2o8UTPEWCWsMMrnaY=; b=RprnLwObQaJs0r8zEia80KCnSk
	5uoQRBJCnekN+Aq/WtmxWZ/FbHstSLktU2gpxoZ7Mm2ac5Gj8rUbCFhyOTKh22xnkRUxryhN+6h3Z
	I76lZcPjQ+BkqRq5zqx0lg2h0x2L4/O2GwFWW39c2fT4NsJHuZBUa4xsHK4+roQWEz1PcH8wzsgLU
	xoAdJb/x/OJoYNiK75y3YVHyjvjp1z8KkQBe8R0sj4dhHEoqTpyniBKD5oLY5yL80nCZimQIrvNnt
	bgeRc2b70IMRC9PxMfy44bExnJA26NRil4pQruRkFtlJ62csbxm97rEMFhEqmI/gJ6NdXbagT5qpb
	gpKRaJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg7AO-00000007JWL-11Sz;
	Thu, 06 Feb 2025 19:04:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg6iI-00000007DVR-3clJ;
	Thu, 06 Feb 2025 18:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7FE05C6E45;
	Thu,  6 Feb 2025 18:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F280DC4CEDD;
	Thu,  6 Feb 2025 18:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738866897;
	bh=07vDG66ev83p01zAaMT8kEqDUlGghdgthMVYXHknZ9U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bfZGlCVXrdk7w4t/8iKv9a/DiBQN+DvjO915t3HY6MQufd2NZVp+N4GP4WBt6Khob
	 NLngTWmxmAfI4U71bmPGuAnq6lB8mPtZ/AnpVlwKWR97rW0O0l+SbpV/Exs6enToHV
	 ONLJtr37mxuT3Kr0UGbYYiayecdgBxMXFNiVCs/XCBeQP2AHr+DH1HyxYu6rYzFV6m
	 Q4HLPAudirfbIaX2XdGVLx0zcfjYkjaaP9OfYmCaAjhFI1CYr4TsgtHVwFpP0dHLVw
	 r5cGkmtqOLJJisal+M3cYRcwAiKb+79H4JCPDenlEVI5ofFDOuNm+IruoZ2JafGW/p
	 Eeso3Isa4at0g==
Date: Thu, 6 Feb 2025 12:34:55 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/6] PCI: brcmstb: Fix error path upon call of
 regulator_bulk_get()
Message-ID: <20250206183455.GA994612@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+-6iNwws3On9-VJ-vF55o5LwKYpOHtfRYLtoQ5=bh7uGTfYkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_103458_989791_E6ABFF67 
X-CRM114-Status: GOOD (  29.76  )
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

On Thu, Feb 06, 2025 at 01:22:54PM -0500, Jim Quinlan wrote:
> On Thu, Feb 6, 2025 at 12:29 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Wed, Feb 05, 2025 at 02:12:02PM -0500, Jim Quinlan wrote:
> > > If regulator_bulk_get() returns an error, no regulators are
> > > created and we need to set their number to zero.  If we do
> > > not do this and the PCIe link-up fails, regulator_bulk_free()
> > > will be invoked and effect a panic.
> > >
> > > Also print out the error value, as we cannot return an error
> > > upwards as Linux will WARN on an error from add_bus().

> > > Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > ---
> > >  drivers/pci/controller/pcie-brcmstb.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> > > index f8fc3d620ee2..bf919467cbcd 100644
> > > --- a/drivers/pci/controller/pcie-brcmstb.c
> > > +++ b/drivers/pci/controller/pcie-brcmstb.c
> > > @@ -1417,7 +1417,8 @@ static int brcm_pcie_add_bus(struct pci_bus *bus)
> > >
> > >               ret = regulator_bulk_get(dev, sr->num_supplies, sr->supplies);
> > >               if (ret) {
> > > -                     dev_info(dev, "No regulators for downstream device\n");
> > > +                     dev_info(dev, "Did not get regulators; err=%d\n", ret);
> > > +                     sr->num_supplies = 0;
> > >                       goto no_regulators;
> >
> > I think it might have been better if we could do the
> > regulator_bulk_get() separately, before pci_host_probe(), so that if
> > this error happens, we can deal with it more easily.
> 
> Keep in mind that brcm_pcie_add_bus() cannot return a non-zero error
> code, as it will get a WARN() from the caller if it does.
> 
> Would you  accept deallocating the "sr" array and setting it to NULL
> like the following error condition does?  In that way we would not be
> invoking any regulator_bulk_xxxx() functions with nr==0.  I'm really
> wary of moving things around...

Yeah, don't move anything around right now.  My wondering is just
about whether the alloc and bulk_get() could be done earlier, leaving
only the bulk_enable() to be done in brcm_pcie_add_bus().

The alloc and bulk_get() depend on DT things and it's nice to catch
those errors earlier.

Bjorn

