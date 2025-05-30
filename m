Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D64DC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ateecOD9DENiqgs/aWq8uC5N5otsFqrc9qX+HH9ylUU=; b=Fr6XHWFWft2uIM
	F6urchg7MfjMWzw/E39on9sCin63XxToaSdpWrcTujL4g58bREdaEo5ANuq+roOrX2caoYQ8OycT7
	sFDWTt/sKaeFl6ltSLYc/kx2PmHV575EndCUXTCpt2rCxY/cz69VmFDDqugSEDs45+NtOYrKJNQoA
	FdlArLi80kdbY4F0eaR7Cm+HA3W7ME51gO74IbHsiehtesnKzWCaGOB6k1rg7aGaN63+RFnKzcGSW
	E3G3IeOXkeNja/iovbTRaClbrEHBBGpaZpBDZ+00iDO480Smpk4Sccden6T50rE5gnlPZTEhkugFI
	66ZMtSTWKMfbIqG/ZN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKy9H-00000000Rp1-2wcu;
	Fri, 30 May 2025 11:43:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxzz-00000000QtZ-0eu8;
	Fri, 30 May 2025 11:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F8B8629E8;
	Fri, 30 May 2025 11:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FBFC4CEEA;
	Fri, 30 May 2025 11:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748604845;
	bh=zOCveCCe34VEq6t903fuoOoYk3Yyf1DbV6pHAyiwueA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OTDUWXrjxfeL26hXG9wadvD1pP1t5Am6DLw7haCwKURsI+4B5n6IycmwhLGLQe5Sv
	 9KmXAAyWbIly/941Sez2E434xCskAbE7ZYjV9umZFMwiMWfYKIG3sRvkmjdc0mARJt
	 mAMTBIojb+efjIKDwYcmiOzdsKC6Cir2QuK9ZxDO0tn1e4xN4pB6xzKXBK6w99IJQV
	 Rd6YiSPc9pbxBZEyIpIpKNq5Q3puB2waXHLRwKK75CdfQ8up39wiyyrlrPK1Vd2vgN
	 iupwJIHfDQ4nmJ5vrtnzz9tjpyRPpDPxhFKBcT05AKkcMGg/sT+liHrJ9aU0ac+Ot+
	 fhX43O5Jq4ySA==
Date: Fri, 30 May 2025 06:34:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <20250530113404.GA138859@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
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

On Fri, May 30, 2025 at 09:16:59AM +0530, Manivannan Sadhasivam wrote:
> On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> > On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > > The PCI link, when down, needs to be recovered to bring it back. But that
> > > cannot be done in a generic way as link recovery procedure is specific to
> > > host bridges. So add a new API pci_host_handle_link_down() that could be
> > > called by the host bridge drivers when the link goes down.
> > > 
> > > The API will iterate through all the slots and calls the pcie_do_recovery()
> > > function with 'pci_channel_io_frozen' as the state. This will result in the
> > > execution of the AER Fatal error handling code. Since the link down
> > > recovery is pretty much the same as AER Fatal error handling,
> > > pcie_do_recovery() helper is reused here. First the AER error_detected
> > > callback will be triggered for the bridge and the downstream devices. Then,
> > > pci_host_reset_slot() will be called for the slot, which will reset the
> > > slot using 'reset_slot' callback to recover the link. Once that's done,
> > > resume message will be broadcasted to the bridge and the downstream devices
> > > indicating successful link recovery.
> > 
> > Link down is an event for a single Root Port.  Why would we iterate
> > through all the Root Ports if the link went down for one of them?
> 
> Because on the reference platform (Qcom), link down notification is
> not per-port, but per controller. So that's why we are iterating
> through all ports.  The callback is supposed to identify the ports
> that triggered the link down event and recover them.

Maybe I'm missing something.  Which callback identifies the port(s)
that triggered the link down event?  I see that
pci_host_handle_link_down() is called by
rockchip_pcie_rc_sys_irq_thread() and qcom_pcie_global_irq_thread(),
but I don't see the logic that identifies a particular Root Port.

Per-controller notification of per-port events is a controller
deficiency, not something inherent to PCIe.  I don't think we should
build common infrastructure that resets all the Root Ports just
because one of them had an issue.

I think pci_host_handle_link_down() should take a Root Port, not a
host bridge, and the controller driver should figure out which port
needs to be recovered, or the controller driver can have its own loop
to recover all of them if it can't figure out which one needs it.

Bjorn

