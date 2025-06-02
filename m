Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4567C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 21:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ylW5pd2rNSERfK/w7aOq8aBRFE3+e0lGe7my8Nim8+g=; b=KHVwG0koNHVqxI
	2hsPryACOUdtLA48KZcf2WhS6hbKoaG1ktshP7VMKGZBCVI5z+L+XLxoh4P9FQEb5GC0jnwtIpbAS
	3+XwB6H2WsRJDs5kpI8q8UOO/KqsqTfca0fs8cZWvrGONXbYkpcaSfadcs+cH4h67L7qSqhDnVaJM
	fHL60812UMFZPI2XzHCF/zUSp/aArv0zXMWkzYmDTd+9lvsgwUC9IcFZC6Yad30hw0k5ZqOYB5Ia+
	EVcKuYSC+3G4ZZnYzvVCgMtf1mGeJHllI6jZrKlIsPBq8tClTlfTVC9/czdE5w1KnJJDAewaEjIug
	7KKcLQ00XZn0eugKYnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCVq-00000008xJw-2hB3;
	Mon, 02 Jun 2025 21:16:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCTd-00000008wqH-06Hy;
	Mon, 02 Jun 2025 21:13:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D8E105C63A4;
	Mon,  2 Jun 2025 21:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39042C4CEEB;
	Mon,  2 Jun 2025 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748898826;
	bh=8USxg6SA8nGz3BAkEuYuS+4+eTJ3BHPZ/Z14aMgD5Vo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=m4m/SaHE8iFG6uTm85JTtjtTJIE+XALUYhiJDLcsNKo6erXpfFaE2eoftIUOtZb2i
	 2kGm4VUL7Ua/7F6a5U5aUqNink/ou4zhQ4Or1Zu7AYGVnh/ZWeSI0pyfMn30WRcQ31
	 EE7y5jSxfu0sLgGiQqM9pTqNQCecm9dKrsuKXEXhC3Td41Cj2aNiNv4pF6GrK5lFa1
	 EfDIsfRClEIUokRxgztxTyzmeHqtr5VVVhoTie87u7ngMqCcxERT0Ht1Aso+2l0gf8
	 q5ypX9vO9UXttxSnq3oiYxYVfj8lsLtaHE1ephK+mkINFt6bB+xtQFBwk5k3E3s4sO
	 ZFsT1JqbxJN6A==
Date: Mon, 2 Jun 2025 16:13:44 -0500
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
Message-ID: <20250602211344.GA444082@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_141349_148825_52B2B078 
X-CRM114-Status: GOOD (  33.56  )
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

On Fri, May 30, 2025 at 09:39:28PM +0530, Manivannan Sadhasivam wrote:
> On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> > On Fri, May 30, 2025 at 09:16:59AM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> > > > On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > > > > The PCI link, when down, needs to be recovered to bring it back. But that
> > > > > cannot be done in a generic way as link recovery procedure is specific to
> > > > > host bridges. So add a new API pci_host_handle_link_down() that could be
> > > > > called by the host bridge drivers when the link goes down.
> > > > > 
> > > > > The API will iterate through all the slots and calls the pcie_do_recovery()
> > > > > function with 'pci_channel_io_frozen' as the state. This will result in the
> > > > > execution of the AER Fatal error handling code. Since the link down
> > > > > recovery is pretty much the same as AER Fatal error handling,
> > > > > pcie_do_recovery() helper is reused here. First the AER error_detected
> > > > > callback will be triggered for the bridge and the downstream devices. Then,
> > > > > pci_host_reset_slot() will be called for the slot, which will reset the
> > > > > slot using 'reset_slot' callback to recover the link. Once that's done,
> > > > > resume message will be broadcasted to the bridge and the downstream devices
> > > > > indicating successful link recovery.
> > > > 
> > > > Link down is an event for a single Root Port.  Why would we iterate
> > > > through all the Root Ports if the link went down for one of them?
> > > 
> > > Because on the reference platform (Qcom), link down notification is
> > > not per-port, but per controller. So that's why we are iterating
> > > through all ports.  The callback is supposed to identify the ports
> > > that triggered the link down event and recover them.
> > 
> > Maybe I'm missing something.  Which callback identifies the port(s)
> > that triggered the link down event?
> 
> I was referring to the host_bridge::reset_root_port() callback that resets the
> root ports.
> 
> >  I see that
> > pci_host_handle_link_down() is called by
> > rockchip_pcie_rc_sys_irq_thread() and qcom_pcie_global_irq_thread(),
> > but I don't see the logic that identifies a particular Root Port.
> > 
> > Per-controller notification of per-port events is a controller
> > deficiency, not something inherent to PCIe.  I don't think we should
> > build common infrastructure that resets all the Root Ports just
> > because one of them had an issue.
> 
> Hmm, fair enough.
> 
> > I think pci_host_handle_link_down() should take a Root Port, not a
> > host bridge, and the controller driver should figure out which port
> > needs to be recovered, or the controller driver can have its own loop
> > to recover all of them if it can't figure out which one needs it.
> 
> This should also work. Feel free to drop the relevant commits for
> v6.16, I can resubmit them (including dw-rockchip after -rc1).

OK, I kept "PCI: host-common: Make the driver as a common library for
host controller drivers" (renamed to "PCI: host-common: Convert to
library for host controller drivers") on pci/controller/dw-rockchip
for v6.16 and deferred the rest until later.

